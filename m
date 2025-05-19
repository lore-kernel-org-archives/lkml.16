Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169AB1A5B91
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747672239; cv=none; b=rQwCYtbbtsp8xsjEvec0+BrwJuAoyl6VGslvjisMxNhQrJJWgxaEsR7MamCfJqfQH99cpYtewjZDHMVlh6j9VbE2qs98Vyo8wlw8Dq8g5o/61bRA1DwQGotTLp2Zj/Vqly5M7rafEyzhFzAeM/UEoP13f8HdxUgnikhFJHLvACY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747672239; c=relaxed/simple;
	bh=bjR+fWyNpdimCrx/x6lirhCwUBgDy9D5far5u75wSuk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uIKXPUQKcrKu6yhN+ihegQMzmacFCbeOg14OvYSQGjMIhkJXk6FHSwUJoU0u3qVi20HVQIGXqPnIMDeXui9srb290DNcMobTSFibrbbNuvMZe3khGpyD8/hC9dt6asKGhb14FBL+G0ZbYq7As0U9VeQbpvqkumBWxXXaRG/kyEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hTnAmpkQ; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hTnAmpkQ"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso2928509a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747672236; x=1748277036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4KSVGOuD15jSHI9/IXVbKsdZrrPjge70aQQi1SohTU=;
        b=hTnAmpkQJGGD7gVVHFe0TISbZLIqvxnzePglrVqGKHLXoXtp8/fOH244DBK58Hz4zx
         Lw2E/rEgJoeBpxatUoomR2Vt9I2IMsiAUqPQsFSlN8JKx45djS7e23IyCsf3dSkH989k
         uje1TZ1e52lMj/W6g/cyzN+zWUmEZx2slAmj2N8zNEEsMZHnNkqRZyFr1gu2CeCDSKrT
         hjD0+kmSwBt1nju95N7eeTdTeAKGPXa4KiXP01/1/PVveyF2ZlH6HUzFdvMb/UIHjxhw
         xdbVNSyon7YiJzXRm1ddicEbO50JoGKqG0oywBov63lVjT7lasshTzgb36k1eLstC2Za
         FozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747672236; x=1748277036;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f4KSVGOuD15jSHI9/IXVbKsdZrrPjge70aQQi1SohTU=;
        b=Tg6e3DPicUAuVQciIoXXIGBSmPb2ZBpP/enhFVgxbPO/nS5C7v49ievKK7cOgJjMvm
         oWLdzGRIcqO+5W8opUb1IA0l+l3vBo77ud6UeXY0ycZCAHLWmhyD+VK3s1CZi2oZEICQ
         CwkAaxc2ZpBtFKJkF94PLlVX3fT3rUfY4mnHWrm5+kPSLFfWw8CdCOB1VxJqjKkjs+QW
         5aEO32OKsAbBf37dpivG2a/ZaFcR5Q9x00lQs136YvvtpcjVSy0x5LH8YP0imgYNroea
         Q6qQIGj/gCIEx1DzGAOSlXBmhg1UcAGThAHWvbD7h3zMnDZ4LfZU2JCOhhQ89Bo48biR
         LkdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsukjwg9uBRapA3hXILP5M+puMuwrlBZR5we7Z81u4aSL4d+QAo40ghkHOKfhk/kfr87YngDxZxw+kAnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoqyV3LzyIKXx/E3qzZeqbfZf061ZR73+ZjW74avLOuWMKujf2
	hAuB1jiUOG48lx/QG0p4ELkBZB3vP5lzuKMGPwX0jWap+UQK0/AgEeMEp+TvQ0af6bazLCTNz4q
	mM60MzA==
X-Google-Smtp-Source: AGHT+IHdD7pDTmybbOoF0eWUomF+Dc6wrJbhdQrr2AyQaxIc76a+qPVG6HhUpU53jIaifh6zWn/RWlywOgs=
X-Received: from pjbnw12.prod.google.com ([2002:a17:90b:254c:b0:2ef:8055:93d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28c5:b0:2fc:a3b7:108e
 with SMTP id 98e67ed59e1d1-30e7d4fea80mr21437627a91.4.1747672236291; Mon, 19
 May 2025 09:30:36 -0700 (PDT)
Date: Mon, 19 May 2025 09:30:34 -0700
In-Reply-To: <aCgw6sbpE6f42sC_@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516212833.2544737-1-seanjc@google.com> <20250516212833.2544737-5-seanjc@google.com>
 <aCgw6sbpE6f42sC_@gmail.com>
Message-ID: <aCtcqlP8MAqgyTbd@google.com>
Subject: Re: [PATCH v2 4/8] x86, lib: Add WBNOINVD helper functions
From: Sean Christopherson <seanjc@google.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Zheyun Shen <szy0127@sjtu.edu.cn>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Kevin Loughlin <kevinloughlin@google.com>, Kai Huang <kai.huang@intel.com>, 
	Mingwei Zhang <mizhang@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025, Ingo Molnar wrote:
>=20
> * Sean Christopherson <seanjc@google.com> wrote:
>=20
> > From: Kevin Loughlin <kevinloughlin@google.com>
> >=20
> > In line with WBINVD usage, add WBONINVD helper functions.  Fall back to
> > WBINVD (via alternative()) if WBNOINVD isn't supported, as WBINVD provi=
des
> > a superset of functionality, just more slowly.
> >=20
> > Note, alternative() ensures compatibility with early boot code as neede=
d.
> >=20
> > Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
> > Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> > [sean: massage changelog and comments, use ASM_WBNOINVD and _ASM_BYTES]
> > Reviewed-by: Kai Huang <kai.huang@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/include/asm/smp.h           |  6 ++++++
> >  arch/x86/include/asm/special_insns.h | 19 ++++++++++++++++++-
> >  arch/x86/lib/cache-smp.c             | 11 +++++++++++
> >  3 files changed, 35 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> > index 028f126018c9..e08f1ae25401 100644
> > --- a/arch/x86/include/asm/smp.h
> > +++ b/arch/x86/include/asm/smp.h
> > @@ -113,6 +113,7 @@ void native_play_dead(void);
> >  void play_dead_common(void);
> >  void wbinvd_on_cpu(int cpu);
> >  void wbinvd_on_all_cpus(void);
> > +void wbnoinvd_on_all_cpus(void);
> > =20
> >  void smp_kick_mwait_play_dead(void);
> >  void __noreturn mwait_play_dead(unsigned int eax_hint);
> > @@ -153,6 +154,11 @@ static inline void wbinvd_on_all_cpus(void)
> >  	wbinvd();
> >  }
> > =20
> > +static inline void wbnoinvd_on_all_cpus(void)
> > +{
> > +	wbnoinvd();
> > +}
> > +
> >  static inline struct cpumask *cpu_llc_shared_mask(int cpu)
> >  {
> >  	return (struct cpumask *)cpumask_of(0);
> > diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/as=
m/special_insns.h
> > index 6266d6b9e0b8..46b3961e3e4b 100644
> > --- a/arch/x86/include/asm/special_insns.h
> > +++ b/arch/x86/include/asm/special_insns.h
> > @@ -117,7 +117,24 @@ static inline void wrpkru(u32 pkru)
> > =20
> >  static __always_inline void wbinvd(void)
> >  {
> > -	asm volatile("wbinvd": : :"memory");
> > +	asm volatile("wbinvd" : : : "memory");
> > +}
> > +
> > +/* Instruction encoding provided for binutils backwards compatibility.=
 */
> > +#define ASM_WBNOINVD _ASM_BYTES(0xf3,0x0f,0x09)
> > +
> > +/*
> > + * Cheaper version of wbinvd(). Call when caches need to be written ba=
ck but
> > + * not invalidated.
> > + */
> > +static __always_inline void wbnoinvd(void)
> > +{
> > +	/*
> > +	 * If WBNOINVD is unavailable, fall back to the compatible but
> > +	 * more destructive WBINVD (which still writes the caches back
> > +	 * but also invalidates them).

While poking around the SDM and APM to figure out a decent comment, I reali=
zed
this comment is somewhat misleading since WBNOINVD is itself backwards comp=
atible.
I still think it's a good idea to use alternative(), e.g. so that explicitl=
y
disabling WBNOINVD in the event of a hardware issue works as expected.

> > +	 */
> > +	alternative("wbinvd", ASM_WBNOINVD, X86_FEATURE_WBNOINVD);
> >  }
>=20
> Would be nice here to use the opportunity and document both WBINVD and=20
> WBNOINVD a bit more comprehensively, to point out that WBINVD writes=20
> back and flushes the caches (and point out which level of caches this=20
> affects typically),

Due to memory encryption technologies, I don't think there is a "typical" b=
ehavior
these days.  E.g. I'm pretty sure CPUs that support MKTME or SEV+ invalidat=
e all
caches on a package, but I wouldn't classify that as the typical behavior s=
ince
there are likely still a huge number of CPUs in the wild that don't poke in=
to the
lower level caches of other CPUs.

> and to point out that the 'invalidate' part of the WBNOINVD name is a
> misnomer, as it doesn't invalidate anything, it only writes back dirty
> cachelines.

I wouldn't call it a misnomer, the NO part makes it semantically accurate. =
 I
actually think the mnemonic was well chosen, as it helps capture the relati=
onships
and behaviors of INVD, WBINVD, and WBNOINVD.

How about this?

diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/sp=
ecial_insns.h
index 6266d6b9e0b8..f2240c4ac0ea 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -115,9 +115,39 @@ static inline void wrpkru(u32 pkru)
 }
 #endif
=20
+/*
+ * Write back all modified lines in all levels of cache associated with th=
is
+ * logical processor to main memory, and then invalidate all caches.  Depe=
nding
+ * on the micro-architecture, WBINVD (and WBNOINVD below) may or may not a=
ffect
+ * lower level caches associated with another logical processor that share=
s any
+ * level of this processor=E2=80=99s cache hierarchy.
+ *
+ * Note, AMD CPUs enumerate the behavior or WB{NO}{INVD} with respect to o=
ther
+ * logical, non-originating processors in CPUID 0x8000001D.EAX[N:0].
+ */
 static __always_inline void wbinvd(void)
 {
-       asm volatile("wbinvd": : :"memory");
+       asm volatile("wbinvd" : : : "memory");
+}
+
+/* Instruction encoding provided for binutils backwards compatibility. */
+#define ASM_WBNOINVD _ASM_BYTES(0xf3,0x0f,0x09)
+
+/*
+ * Write back all modified lines in all levels of cache associated with th=
is
+ * logical processor to main memory, but do NOT explicitly invalidate cach=
es,
+ * i.e. leave all/most cache lines in the hierarchy in non-modified state.
+ */
+static __always_inline void wbnoinvd(void)
+{
+       /*
+        * Explicitly encode WBINVD if X86_FEATURE_WBNOINVD is unavailable =
even
+        * though WBNOINVD is backwards compatible (it's simply WBINVD with=
 an
+        * ignored REP prefix), to guarantee that WBNOINVD isn't used if it
+        * needs to be avoided for any reason.  For all supported usage in =
the
+        * kernel, WBINVD is functionally a superset of WBNOINVD.
+        */
+       alternative("wbinvd", ASM_WBNOINVD, X86_FEATURE_WBNOINVD);
 }
=20
 static inline unsigned long __read_cr4(void)
