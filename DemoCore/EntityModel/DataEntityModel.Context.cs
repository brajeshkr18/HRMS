﻿

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace Demo.Core.EntityModel
{

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;


public partial class OnBoadTaskEntities : DbContext
{
    public OnBoadTaskEntities()
        : base("name=OnBoadTaskEntities")
    {

        this.Configuration.LazyLoadingEnabled = false;

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public virtual DbSet<Course> Courses { get; set; }

}

}

