Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BB038B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751244035; cv=pass; b=P6ung/0pGgExtL2VA4vg6NmbSamn7Ijm1WM7su1LB4YtX3QfOrlpC6J3doC1WprF/e7ik8k2+/u1LIPk3X9C3A0kHxJUbmc83n+vraXmR0Uk47Jag/SvD4EpiVaAMwAEP3N6KtwcHHpaVQh5aNzOAoLJ9w4BJgvjKkUU/cVYNP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751244035; c=relaxed/simple;
	bh=cD8pGpHAcAKFKf4P3Mm/7/Ghh8dMiDjnyp8Wh2Ig1GI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=YVvVGltN4vVlga9JQluhmKGxSejQv1SUvsiLe08jv6zLktrj5+CMOZLg0TUZsd1OKPwfz4PF18xRT7TM0f+3vVYQ/pQoPTd8S2rrrX9zvDnRG2/KJBwK3hFyPkSgqSYs9/+DPEdukGlCQo5Qq/FvURz4jQC5UCFJvqOOiMWj/ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=Whmfn5YD; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="Whmfn5YD"
ARC-Seal: i=1; a=rsa-sha256; t=1751243998; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ihB+JZbJgH64/E4TQSBch5EF1wpQAQ9+9IFwgXmq77zD3Cq/vYL38/NzaVVcVoDt44BA3du04wD6LGDR6tIINhpgrIXNhE+Mr/0FxjbqFKJF4/Q1ZmZe5/jB0YzfmJIhXOPuCdwIWQQieC3qHhaXbkogXUEs13uP0/ntUTC2qPo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751243998; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rGhZHNmzHnkJA08PBV1XUuA1nhWaeDgT/XvxAzzLceM=; 
	b=G06Hole6qk+A58tehQ8eYoHGqHK9GI2FgCk0lbJGW2FF2upYJowrdPNKTmZ4J1qJMpFrvEn5kmoEbm0kfF3c5o6EkImzFe5j4kA5JBPtbO0yEPGUp0mRdaV19CZXeHm29w8v4zCtm1VxyusskADrifDJD4JU051hieVE1YQQVf4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751243998;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rGhZHNmzHnkJA08PBV1XUuA1nhWaeDgT/XvxAzzLceM=;
	b=Whmfn5YD+PzdvcHIwIH3ZHdzlA+Vi+piC8LwOYuCPDlRgTd8ognkiEjxF+ZP/sS4
	7Dt0EhPjAJKGhG2ROWXazUPv3MAWrmUDtom1l1mDWVzCnh+kFQDLrz3V5ham7xWclEX
	JCyOteo7XPg4YCGfT3p5xaBzAK/1akELCH2ZvbQ0=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1751243996229220.56972103993655; Sun, 29 Jun 2025 17:39:56 -0700 (PDT)
Date: Mon, 30 Jun 2025 08:39:56 +0800
From: Li Chen <me@linux.beauty>
To: "K Prateek Nayak" <kprateek.nayak@amd.com>
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, "x86" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"Sohil Mehta" <sohil.mehta@intel.com>,
	"Brian Gerst" <brgerst@gmail.com>,
	"Patryk Wlazlyn" <patryk.wlazlyn@linux.intel.com>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	"Li Chen" <chenl311@chinatelecom.cn>
Message-ID: <197be46bc2a.c4caa389979847.6405320630005594342@linux.beauty>
In-Reply-To: <1b706790-2fec-4582-a425-55eeff36c32e@amd.com>
References: <20250625034552.42365-1-me@linux.beauty>
 <20250625034552.42365-3-me@linux.beauty> <1b706790-2fec-4582-a425-55eeff36c32e@amd.com>
Subject: Re: [PATCH v3 2/2] x86/smpboot: avoid SMT domain attach/destroy if
 SMT is not enabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi K,

 ---- On Wed, 25 Jun 2025 13:45:22 +0800  K Prateek Nayak <kprateek.nayak@a=
md.com> wrote ---=20
 > Hello Li,
 >=20
 > On 6/25/2025 9:15 AM, Li Chen wrote:
 > > From: Li Chen <chenl311@chinatelecom.cn>
 > >=20
 > > Currently, the SMT domain is added into sched_domain_topology by defau=
lt.
 > >=20
 > > If cpu_attach_domain() finds that the CPU SMT domain=E2=80=99s cpumask=
_weight
 > > is just 1, it will destroy it.
 > >=20
 > > On a large machine, such as one with 512 cores, this results in
 > > 512 redundant domain attach/destroy operations.
 > >=20
 > > Avoid these unnecessary operations by simply checking
 > > cpu_smt_num_threads and remove SMT domain if the SMT domain is not
 > > enabled, and adjust the PKG index accordingly if NUMA-in-package
 > > invalidates that level as well.
 > >=20
 > > Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
 > > ---
 > > changelog:
 > > v2: fix wording issue as suggested by Thomas [1]
 > > v3: remove pointless memset and adjust PKG index accordingly,
 > >      as suggested by Thomas [2]
 > >=20
 > > [1]: https://lore.kernel.org/all/87msa2r018.ffs@tglx/
 > > [2]: https://lore.kernel.org/all/875xglntx1.ffs@tglx/
 > >=20
 > >   arch/x86/kernel/smpboot.c | 18 +++++++++++++++++-
 > >   1 file changed, 17 insertions(+), 1 deletion(-)
 > >=20
 > > diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
 > > index 7d202f9785362..4b6daa1545445 100644
 > > --- a/arch/x86/kernel/smpboot.c
 > > +++ b/arch/x86/kernel/smpboot.c
 > > @@ -494,13 +494,29 @@ static struct sched_domain_topology_level x86_to=
pology[] =3D {
 > >  =20
 > >   static void __init build_sched_topology(void)
 > >   {
 > > +    bool smt_dropped =3D false;
 > > +
 > > +    if (cpu_smt_num_threads <=3D 1) {
 > > +        /*
 > > +         * SMT level is x86_topology[0].  Shift the array left by one=
,
 > > +         */
 > > +        memmove(&x86_topology[0], &x86_topology[1],
 > > +            sizeof(x86_topology) - sizeof(x86_topology[0]));
 > > +        smt_dropped =3D true;
 > > +    }
 > > +
 >=20
 > Instead of this memmove, wouldn't just passing the "&x86_topology[1]"
 > to set_sched_topology() when "cpu_smt_num_threads <=3D 1"  work?
 >=20
 > Something like below:
 >=20
 > (Only tested on a QEMU based VM)
 >=20
 > diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
 > index 3818b16c19e1..1793248d28cd 100644
 > --- a/arch/x86/kernel/smpboot.c
 > +++ b/arch/x86/kernel/smpboot.c
 > @@ -494,6 +494,8 @@ static struct sched_domain_topology_level x86_topolo=
gy[] =3D {
 >  =20
 >   static void __init build_sched_topology(void)
 >   {
 > +    struct sched_domain_topology_level *topology =3D x86_topology;
 > +
 >       /*
 >        * When there is NUMA topology inside the package invalidate the
 >        * PKG domain since the NUMA domains will auto-magically create th=
e
 > @@ -504,7 +506,15 @@ static void __init build_sched_topology(void)
 >  =20
 >           memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]))=
;
 >       }
 > -    set_sched_topology(x86_topology);
 > +
 > +    /*
 > +     * Drop the SMT domains if there is only one thread per-core
 > +     * since it'll get degenerated by the scheduler anyways.
 > +     */
 > +    if (cpu_smt_num_threads <=3D 1)
 > +        ++topology;
 > +
 > +    set_sched_topology(topology);
 >   }
 >  =20
 >   void set_cpu_sibling_map(int cpu)
=20
Yes, I also agree. I would switch to it in the next series and add your sig=
noff.
Thanks!

 > >       /*
 > >        * When there is NUMA topology inside the package invalidate the
 > >        * PKG domain since the NUMA domains will auto-magically create =
the
 > >        * right spanning domains based on the SLIT.
 > >        */
 > >       if (x86_has_numa_in_package) {
 > > -        unsigned int pkgdom =3D ARRAY_SIZE(x86_topology) - 2;
 > > +        unsigned int pkgdom;
 > > +
 > > +        if (smt_dropped)
 > > +            pkgdom =3D ARRAY_SIZE(x86_topology) - 3;
 > > +        else
 > > +            pkgdom =3D ARRAY_SIZE(x86_topology) - 2;
 > >  =20
 > >           memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]=
));
 > >       }
 >=20
 > --=20
 > Thanks and Regards,
 > Prateek
 >=20
 >=20

Regards,
Li

