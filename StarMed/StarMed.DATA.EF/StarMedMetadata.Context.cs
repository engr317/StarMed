﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StarMed.DATA.EF
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class StarMedEntities : DbContext
    {
        public StarMedEntities()
            : base("name=StarMedEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Applications> Applications1 { get; set; }
        public virtual DbSet<ApplicationStatuses> ApplicationStatuses { get; set; }
        public virtual DbSet<Locations> Locations1 { get; set; }
        public virtual DbSet<OpenPositions> OpenPositions1 { get; set; }
        public virtual DbSet<Positions> Positions1 { get; set; }
        public virtual DbSet<UserDetails> UserDetails1 { get; set; }
    }
}
