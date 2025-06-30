Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8278838B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751242970; cv=pass; b=sPULNYAO1skDmGzDaK1z49hHdgfH90STdYMtZ/i9bGlQgrQhoIqFe/EgbgxABULYFOy+i55QITiGoaGs5I15xoaArdIXUaVEbCGiOf8VD2RvkSYA2qF18SX6LxX8sj3RpInA1H1z+FxrudQNXIbKTQnwD2FdRr+xQhu3C6u9tvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751242970; c=relaxed/simple;
	bh=O6WwkOMgF7q9WQnV2tyHNeQpQDhYb/R5JQ173N+NAUg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=CJmPr9GvFLBmFeBDRhv4RAWqjWwPPKWNtcjMWtL4p0dYlyhnzmlFSQHXVCJmF5pLU3fLj9TLucb/3gz/W61hgslfO/gt8WX3NWemyrDcwruAhaqub0bxZB9xx7EKUZyIJbGxRla59Vy42LMsmJtri/iKDp2LGOmvy/hjebvVo6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=anf+Nr6y; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="anf+Nr6y"
ARC-Seal: i=1; a=rsa-sha256; t=1751242914; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hPj+ST0CGmu+v9oC7KVWyC5mY/Lr81LIB7dHceb8I73GPW/WRf8nyRdCBiqTzsaMTCJze7wF8Jz/Mm3ApN/ACr03a/AStGYW0/4Jt7s+geTFxPHQx8/fcUZACe6isseoouyrsFsFJSng/c5e8pCjUcDsJ2tzpO63wNge/yzLbDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751242914; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hGrPeq+wJ6JI3ZQeYosmKZ9cVNVT3KqPfOxzvocmlB4=; 
	b=K5K0f8AGxjmqB3VOwYykGrGLkyFl2Nf9RPVUQ27yMBkL1Y5ZqWFWC64FuGMstZvYiBfZQm+1NaJwXaaah100L51h+lBdBVFq1eNK23hujjq7rxqq+gqClf6OphH+y6DaBdqXQbT0drq1HzLM0lgAZrQ8rNmlltZo3HXQk53+CGk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751242914;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hGrPeq+wJ6JI3ZQeYosmKZ9cVNVT3KqPfOxzvocmlB4=;
	b=anf+Nr6yvfaeUOL887jBxnVDnfmOmzuR6AE+opNA7+HsEtcuXVS4RhFv7xk1T/zt
	38qrNsNhtEy5+gGmINBAE+w5V1E+bALGraQcczM2Isx2wQdpfHpSAeoDdcTgmGDyQHY
	Tgape+WXNPXozBO5eWBSp/TfgtBb5BMMj8zTj+sM=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1751242912828509.2812149068616; Sun, 29 Jun 2025 17:21:52 -0700 (PDT)
Date: Mon, 30 Jun 2025 08:21:52 +0800
From: Li Chen <me@linux.beauty>
To: "Peter Zijlstra" <peterz@infradead.org>
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, "x86" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	"K Prateek Nayak" <kprateek.nayak@amd.com>,
	"Sohil Mehta" <sohil.mehta@intel.com>,
	"Brian Gerst" <brgerst@gmail.com>,
	"Patryk Wlazlyn" <patryk.wlazlyn@linux.intel.com>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"Li Chen" <chenl311@chinatelecom.cn>
Message-ID: <197be36341f.121c2d667978523.290703926590546064@linux.beauty>
In-Reply-To: <20250625082819.GZ1613200@noisy.programming.kicks-ass.net>
References: <20250625034552.42365-1-me@linux.beauty>
 <20250625034552.42365-2-me@linux.beauty> <20250625082819.GZ1613200@noisy.programming.kicks-ass.net>
Subject: Re: [PATCH v3 1/2] x86/smpboot: Decrapify build_sched_topology()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi Peter,


 ---- On Wed, 25 Jun 2025 16:28:19 +0800  Peter Zijlstra <peterz@infradead.org> wrote --- 
 > On Wed, Jun 25, 2025 at 11:45:49AM +0800, Li Chen wrote:
 > > From: Thomas Gleixner <tglx@linutronix.de>
 > > 
 > > The #ifdeffery and the initializers in build_sched_topology() are just
 > > disgusting. The SCHED_SMT #ifdef is also pointless because SCHED_SMT is
 > > unconditionally enabled when SMP is enabled.
 > 
 > On x86, but not across all archs. Yes this is x86 code, but how is one
 > supposed to keep all that nonsense straight in their head ;-)
 > 
 > > Statically initialize the domain levels in the topology array and let
 > > build_sched_topology() invalidate the package domain level when NUMA in
 > > package is available.
 > > 
 > > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
 > > ---
 > >  arch/x86/kernel/smpboot.c | 45 +++++++++++++++------------------------
 > >  1 file changed, 17 insertions(+), 28 deletions(-)
 > > 
 > > diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
 > > index fc78c2325fd29..7d202f9785362 100644
 > > --- a/arch/x86/kernel/smpboot.c
 > > +++ b/arch/x86/kernel/smpboot.c
 > > @@ -478,43 +478,32 @@ static int x86_cluster_flags(void)
 > >   */
 > >  static bool x86_has_numa_in_package;
 > >  
 > > -static struct sched_domain_topology_level x86_topology[6];
 > > +#define DOMAIN(maskfn, flagsfn, dname) { .mask = maskfn, .sd_flags = flagsfn, .name = #dname }
 > >  
 > > -static void __init build_sched_topology(void)
 > > -{
 > > -    int i = 0;
 > > -
 > > -#ifdef CONFIG_SCHED_SMT
 > > -    x86_topology[i++] = (struct sched_domain_topology_level){
 > > -        cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
 > > -    };
 > > -#endif
 > > +static struct sched_domain_topology_level x86_topology[] = {
 > > +    DOMAIN(cpu_smt_mask, cpu_smt_flags, SMT),
 > >  #ifdef CONFIG_SCHED_CLUSTER
 > > -    x86_topology[i++] = (struct sched_domain_topology_level){
 > > -        cpu_clustergroup_mask, x86_cluster_flags, SD_INIT_NAME(CLS)
 > > -    };
 > > +    DOMAIN(cpu_clustergroup_mask, x86_cluster_flags, CLS),
 > >  #endif
 > >  #ifdef CONFIG_SCHED_MC
 > > -    x86_topology[i++] = (struct sched_domain_topology_level){
 > > -        cpu_coregroup_mask, x86_core_flags, SD_INIT_NAME(MC)
 > > -    };
 > > +    DOMAIN(cpu_coregroup_mask, x86_core_flags, MC),
 > >  #endif
 > > -    /*
 > > -     * When there is NUMA topology inside the package skip the PKG domain
 > > -     * since the NUMA domains will auto-magically create the right spanning
 > > -     * domains based on the SLIT.
 > > -     */
 > > -    if (!x86_has_numa_in_package) {
 > > -        x86_topology[i++] = (struct sched_domain_topology_level){
 > > -            cpu_cpu_mask, x86_sched_itmt_flags, SD_INIT_NAME(PKG)
 > > -        };
 > > -    }
 > > +    DOMAIN(cpu_cpu_mask, x86_sched_itmt_flags, PKG),
 > > +    { NULL },
 > > +};
 > >  
 > > +static void __init build_sched_topology(void)
 > > +{
 > >      /*
 > > -     * There must be one trailing NULL entry left.
 > > +     * When there is NUMA topology inside the package invalidate the
 > > +     * PKG domain since the NUMA domains will auto-magically create the
 > > +     * right spanning domains based on the SLIT.
 > >       */
 > > -    BUG_ON(i >= ARRAY_SIZE(x86_topology)-1);
 > > +    if (x86_has_numa_in_package) {
 > > +        unsigned int pkgdom = ARRAY_SIZE(x86_topology) - 2;
 > >  
 > > +        memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]));
 > > +    }
 > >      set_sched_topology(x86_topology);
 > >  }
 > 
 > Urgh, this patch is doing at least 4 things and nigh on unreadable
 > because of that.
 > 
 >  - introduces DOMAIN() helper
 >  - drops (the now pointless) SD_INIT_NAME() helper
 >  - drops CONFIG_SCHED_SMT (x86 special)
 >  - moves to static initialize and truncate

Thanks for your review, I would split this Thomas's patch to 4 different patches
and preserve his signoff
