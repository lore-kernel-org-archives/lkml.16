Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413EEAF6
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751243390; cv=pass; b=cstu6ComD/GBK4g6WKSupmQJEQ034BAd2K3vicYSfyTpeaR9IGbidMy8xs5AH2r3Gqv8sX6NYGNibZoIan57fdC3HW2CuwKof4qKjbEng+de5sJNnrVlIWz8DwhB4CgqylCyf0PObNR+CNcncvJ1mCt30iQKYl6rc3SxZZWJ8+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751243390; c=relaxed/simple;
	bh=BJt3XXfanqyFN0jBVgmU6GKo8cIVYRozinzM/Ew4RRs=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=fiilcbsLouoxJi81cB+TEQar6vuuexMmA6EIk7WovSaxc/CgEVsgskXMQN5+uF7L6eC3Ear1t4xGqSVf1xYy/c0mefZnp8+shMQoOZYpaa5DyDSMlCROPHrnLcAZuZd7g938V6qsFSBILtNHGKH5XqWE6TwxnQmKnAJOU9VxEnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=nzP1lwSB; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="nzP1lwSB"
ARC-Seal: i=1; a=rsa-sha256; t=1751243343; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VJfayEiTfrx0hfdP9aVfyXzDxbPTs10WWP0Rb5Uadau2JDsCmzOluWYlhQTfsb+kPZi1/hiWEyhhertox4jwqogRYzfdaaRX3PMSUgZ2n1Mcu0u7nDIQ9+XXpPF0pO3DrRQ1nyXc8pwF+j/vcSCWmxMnCoAsHlO4Nv3fJoUPqDA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751243343; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pyCV2zkxQ09iJsN2MN6SD7QKamfb36y9mVO1zU4O6RQ=; 
	b=nqKfmdE9Y9S93GYGfPvJ+d72ShMCS5sAR0683hhb0ZsnCgyegygI9P51Ub2TeXKVm2dRXJ4ztTR3SjtiCIkZHxlHompdLH3jJ100DZKC4BkLY9OPZnBooueu5GpbsGfUyMILXKbisNkuEYndBJoQHPX7MD0sWKaSQaFp2LOjmNo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751243343;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pyCV2zkxQ09iJsN2MN6SD7QKamfb36y9mVO1zU4O6RQ=;
	b=nzP1lwSBB5Ypn68RkI3VcFiM0TgXNN7jjDsNhp7SNDFjxtPC5zpoheXLAfNAVhrM
	hbabxq0d1sJ4S0LMW9b6LZg4ZWsK28MYje+VnRFpTXJkESTmmEVkw6A3vKTZurPUSgS
	owR/WudrywzFyQwvhyxZen7OeHFomjbVr0sq8YE4=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1751243341662187.656659684067; Sun, 29 Jun 2025 17:29:01 -0700 (PDT)
Date: Mon, 30 Jun 2025 08:29:01 +0800
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
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	"Li Chen" <chenl311@chinatelecom.cn>
Message-ID: <197be3cbf43.ddde9ea9979051.5386583481090657375@linux.beauty>
In-Reply-To: <20250625082932.GA1613200@noisy.programming.kicks-ass.net>
References: <20250625034552.42365-1-me@linux.beauty>
 <20250625034552.42365-3-me@linux.beauty> <20250625082932.GA1613200@noisy.programming.kicks-ass.net>
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

Hi Peter,

 ---- On Wed, 25 Jun 2025 16:29:32 +0800  Peter Zijlstra <peterz@infradead.=
org> wrote ---=20
 > On Wed, Jun 25, 2025 at 11:45:50AM +0800, Li Chen wrote:
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
 > >     as suggested by Thomas [2]=20
 > >=20
 > > [1]: https://lore.kernel.org/all/87msa2r018.ffs@tglx/
 > > [2]: https://lore.kernel.org/all/875xglntx1.ffs@tglx/
 > >=20
 > >  arch/x86/kernel/smpboot.c | 18 +++++++++++++++++-
 > >  1 file changed, 17 insertions(+), 1 deletion(-)
 > >=20
 > > diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
 > > index 7d202f9785362..4b6daa1545445 100644
 > > --- a/arch/x86/kernel/smpboot.c
 > > +++ b/arch/x86/kernel/smpboot.c
 > > @@ -494,13 +494,29 @@ static struct sched_domain_topology_level x86_to=
pology[] =3D {
 > > =20
 > >  static void __init build_sched_topology(void)
 > >  {
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
 > >      /*
 > >       * When there is NUMA topology inside the package invalidate the
 > >       * PKG domain since the NUMA domains will auto-magically create t=
he
 > >       * right spanning domains based on the SLIT.
 > >       */
 > >      if (x86_has_numa_in_package) {
 > > -        unsigned int pkgdom =3D ARRAY_SIZE(x86_topology) - 2;
 > > +        unsigned int pkgdom;
 > > +
 > > +        if (smt_dropped)
 > > +            pkgdom =3D ARRAY_SIZE(x86_topology) - 3;
 > > +        else
 > > +            pkgdom =3D ARRAY_SIZE(x86_topology) - 2;
 > > =20
 > >          memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom])=
);
 > >      }
 >=20
 > Oh gawd, and you all really think this is better than dynamically
 > creating that array?
 >=20
 > This is quite terrible.
 >=20

Do Thomas and you still need to agree on switching to a static array? I'm u=
nsure of the rule.

BTW, initially, I had a patch that didn't include that dynamic/static array=
 change. I don't know if this is ok for you:
https://lore.kernel.org/all/1965cae22a0.12ab5a70c833868.7155412488566097801=
@linux.beauty/

Regards,
Li
