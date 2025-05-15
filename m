Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB41FDA89
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747295734; cv=none; b=DskGPbR8vH+Nbl6ABK/XMzgFhxmI/25VVWdGyXuWj8+TnwJiBfMtijstR1e2Xqcp+7/HUpp3agRL/j94g66/jrIXrpMMLmmRN6CefStSliX43CyOscxvKl8T77RI6Pkpp67ywcdgvhTHJrbmiawK5UVetZAwCJz6kVAiq18jmZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747295734; c=relaxed/simple;
	bh=cX4iHA/76CrC0x/kK4iJhso0zk5j6YV8f0Ey3gTE8Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0o1MuLPg6NDO+hvT+VOK+0OyL8i9hNUZ+tnfb1T4DOVfzkqJNOFsPkCNjaKetjZUCmLvirlZ2gWUheeCymaqfd3/hufUEiiyTaY9HV7w8iyuAmFkU1B34WTBPfU0U8weCP40KwgJOV7twJTyUhiCc4ZtYTlAvMLiN/73CL6Tq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Tqoq2Go+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gJQmb5AT; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Tqoq2Go+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gJQmb5AT"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7E625254013B;
	Thu, 15 May 2025 03:55:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 15 May 2025 03:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1747295730; x=
	1747382130; bh=h43T7rm3If5Xirba1/LFixOPHnj6xUMjsJQM8wm17OA=; b=T
	qoq2Go+1iwGYqCxLHfiP6vB0025Cbol5ol6ssEghAuiSSD38nAWOKYYkqqyZC/tB
	iLMqV6c6eHlcXl3xyA7hWU8Zfn2C/V++GjtwG859KC5ozCLJyNPG3Sn1LnPAPxZf
	sNrloI/V2KlwWQRgnTJiDfE7E8dzLR30JrlK29cVTYUWA6/WeNGMqVQ+qFbJoOLH
	Qhs/LbRfaEj81bCPbGsA83xkOVR56gcAPlbpVrKE6lN9QJMdYP5QpHL7qJZbsLRY
	qIfIvygknaYLyyvnmTKDiZN85rBZj4bhaeEETAPpVnLFnw46CGbsrJ1gD7QLCdBL
	bDL94x8RE3vx/cSZd6OVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747295730; x=1747382130; bh=h43T7rm3If5Xirba1/LFixOPHnj6xUMjsJQ
	M8wm17OA=; b=gJQmb5AT1jUjjiE5ZGtLTBpUNBgzum5m4uY7uGNLZm9uWAjC38C
	cKkKwPhd8HVmGIB4uAZrQd3wDECc5xZL3nBVXx0dD8S877xaj1SSIUuPz2iVwWQ3
	HKPl51Vhw8GXVj1jgSk/8EOzD9VSU2NxpxOHOBkH9Sl+LcLO7Nw8u7EVXSnWC/tc
	lKhEEKIRhQScg89fX6kL9GKZDpu+xz+Yvz+s2/C0PiPtsGV8yxEOAP1SeNXLvUFu
	TK7Idu/aN8a9BKsJQLKADJO83/bHGUi2s5AsWk2CsQrUR7d1kNSty0WGNt99rPIP
	poejN7WA5yfc+0K/MeuLkM4VB2xqkmZku+A==
X-ME-Sender: <xms:8Z0laPtAvKWMWEY6b8Xi4truGdjGRoueCe4hIkRBsQKvwwZPWrg9eg>
    <xme:8Z0laAdJ44xw-WDFJtODRlWc5QnoHrLwTpLKz7BZbdMxS6zVsxsSN6vkgx9B_mnPd
    BNwrcuaUA5OVYcVllE>
X-ME-Received: <xmr:8Z0laCy6NowoG1RdS1qFWiG2vySL_wv6oFVDrYIHUrCtO0MsFtghwdMxUSG9tRddKu2e-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddt
    vdenucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilh
    hlsehshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfh
    hfffveelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghm
    ohhvrdhnrghmvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghruggsodhg
    ihhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhorh
    hvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegs
    rhhgvghrshhtsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:8Z0laOM4BOyNPwtbZNFwlOAjy7RwvB6UVoC1liEICMeevPdpt98Pfg>
    <xmx:8Z0laP_ub9Crw3W5I4KMr--yQ9iRnHwckPU-Drpp7Z7rt_AMORNSDA>
    <xmx:8Z0laOV4XEZ_klXjKYM85r8S5w0G89EVIHdESW6qEeZFwzFndZVqxg>
    <xmx:8Z0laAfJtoXQHHGGB36VtX1uxhTqGZ_E6NJAevgydMvoGCfsVhUApA>
    <xmx:8p0laD0aGb6i4c5_EVZ79CjULjy7x1lmLCkGTE1Ilm28SWKKAjJ0exBL>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 May 2025 03:55:27 -0400 (EDT)
Date: Thu, 15 May 2025 10:55:23 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 2/7] x86/cpu: Allow caps to be set arbitrarily early
Message-ID: <u4abxvlhfrg4pdvtsej6zh2wizb7krg5okps347uwp5bhselwp@7e2cbs5scxpr>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-11-ardb+git@google.com>
 <aCWQOzCla7i__iEl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCWQOzCla7i__iEl@gmail.com>

On Thu, May 15, 2025 at 08:56:59AM +0200, Ingo Molnar wrote:
> 
> * Ard Biesheuvel <ardb+git@google.com> wrote:
> 
> > From: Ard Biesheuvel <ardb@kernel.org>
> > 
> > cpu_feature_enabled() uses a ternary alternative, where the late variant
> > is based on code patching and the early variant accesses the capability
> > field in boot_cpu_data directly.
> > 
> > This allows cpu_feature_enabled() to be called quite early, but it still
> > requires that the CPU feature detection code runs before being able to
> > rely on the return value of cpu_feature_enabled().
> > 
> > This is a problem for the implementation of pgtable_l5_enabled(), which
> > is based on cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING), and may be
> > called extremely early. Currently, there is a hacky workaround where
> > some source files that may execute before (but also after) CPU feature
> > detection have a different version of pgtable_l5_enabled(), based on the
> > USE_EARLY_PGTABLE_L5 preprocessor macro.
> > 
> > Instead, let's make it possible to set CPU feature arbitrarily early, so
> > that the X86_FEATURE_5LEVEL_PAGING capability can be set before even
> > entering C code.
> > 
> > This involves relying on static initialization of boot_cpu_data and the
> > cpu_caps_set/cpu_caps_cleared arrays, so they all need to reside in
> > .data. This ensures that they won't be cleared along with the rest of
> > BSS.
> > 
> > Note that forcing a capability involves setting it in both
> > boot_cpu_data.x86_capability[] and cpu_caps_set[].
> > 
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/x86/kernel/cpu/common.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > index 6f7827015834..f6f206743d6a 100644
> > --- a/arch/x86/kernel/cpu/common.c
> > +++ b/arch/x86/kernel/cpu/common.c
> > @@ -704,8 +704,8 @@ static const char *table_lookup_model(struct cpuinfo_x86 *c)
> >  }
> >  
> >  /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
> > -__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > -__u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > +__u32 __read_mostly cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > +__u32 __read_mostly cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> 
> This change is not mentioned in the changelog AFAICS, but it should be 
> in a separate patch anyway.

And why not __ro_after_init?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
