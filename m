Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9757D202C5A;
	Tue, 10 Jun 2025 21:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749590599; cv=none; b=gUXHm0vu+4BT/3iwIwtkmsBpnzFr040rVoMJuLJNrGc5ZeWzrtbfN8M/HyR9ug9Y6NvDP4pUPZ/b8gWzF2/ttWKxyVzWvJAjUXN2AcG3ofscMZ1sn69aeqkODODYvD3+sPg9VMdtw30lEptEas7Ez54sfdMx3PPZGo20fATX2R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749590599; c=relaxed/simple;
	bh=IuRrlH8f0+L+EWs5x0H1jHsNYnXVQbeYgLVtkUWCLzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKMjRyEfa0jK79PFvKwiYxaAyK7nAD5fYagVHGfMHXw7+X6HQdzF0hh2opmZTeUzq25GLIkKfwQ7OzQ9R4uggGvFaHVrndb/xrfK4lmYYuRjVwWzxgwi8P2G6jSQcxf/mmIK9Nf2gebKKKW3GKc4p//pUKRgr41F+u4JxUMTK3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AF91vbhx; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AF91vbhx"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a5903bceffso76883441cf.3;
        Tue, 10 Jun 2025 14:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749590596; x=1750195396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4QQQuFpaDk14/cZrTJuJecarJD8XRFsV/RDktzG3Tc=;
        b=AF91vbhxAmKoETFO3+Zr0Wko5QG3fH27LFnifHHPahrbwZNIAz/EsSqQEY7udXCU2T
         R/4cMhX70gyzOKo98zZ0P4T39Pi4dux8GIroAWJN2zDuCGPoAdfHQpTC+ocTdfaaJLxU
         dAO0pZo72BocyqhffdvTSbJVQkbXeM3fB+6EJHIsZe7n/0W2oRnj6iBGXO/kRfc1jSQX
         3Kh3ggPFIQ4eIxD7ztYUqtC983B07AYY86zRxVyj2JfK7uAirbtoBfIxD8xKerX45oHr
         t68OgkYZ4au05utmvy2AoZ97YVBe7vc/oCDvPknK/j+WJCMyFIzH2N1VjXGvK2jEIIqi
         uLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590596; x=1750195396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4QQQuFpaDk14/cZrTJuJecarJD8XRFsV/RDktzG3Tc=;
        b=Ld34LNRGJD2rwYDYOtwSnTVGeDj6MwLz4Rlp7w7t5re8oEYOGHFTRFotJVagyPmaDo
         yQsn9uwMZ6oyCtizUm1HGoKR2K6mmD61i6zuIk0VzmtVl8eZEldduXvssFoxj/e6G+DC
         HsufbXU9jzCpePnGUaf1ID44qOxYv/NVogAo3Grup5Wz7myXNtpg377F8maGbyIHffX3
         14ChViDonPj6QOpxsOqN86AzJLlSYM3F0M40SIKvU0a2nOzBZRlT+0b8tsGHkjIcrQyq
         Cc7BQj93mqcVhJ3kXg7KGr/o2p+VyGCCo1Wvxf/rN2ZcxeGQ35hj3/XI1qqqGn4dxfYi
         Dv0w==
X-Forwarded-Encrypted: i=1; AJvYcCUM+pXsbCS/M48VHfXKqBJpLDI6mWxgUp4nmmp7eb20Y+MI2La5pqsc3IwsLFPGvdAEZ3RM8j5mstSds8kttx8=@vger.kernel.org, AJvYcCVi48P6wtiJnNRsAgYrnZBpCP/VWx1E2lCkAJkY5lyKLwdlRec2ahRowNaCgRNUVb19IUVwogBlNA7++oQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YweSp+EGl/jvE53GnCSznZaBuD34NUbf6TaZxx1wTUy9dDeXLjN
	u/MDe5Qw77fAhjg6k+QlP++5vbFOrB2DSB+W+IZtBlgwDFkAOCYbR3aH
X-Gm-Gg: ASbGncvGs61uTXXcRBpm6kWEpPvuOhY/ecGf2FTK2AWS1kkxMhwtgfwLyG6Vlc5xJdj
	WRg0OuuylPU+ToD4h9BQ9PGIAkPkg/cZSnzUapgWnVARZbfqH6Krr/H7c5LzCVafK86e845fv9n
	qF6j/b6MeDQp8NMtbHc6wOl7bpSZfdmv33XilOuY5zxvCv2ngI74FGnRH49ePqTu3Jzx3NeTYlw
	M9wRofgeqSvhhx/6fOUKi8osQfhlWUFyp1gUTvb3uTYrioUBARnQkAqaWW9/nWkzLENkxkMl85x
	aVWpAeyQkuKoQQ/bxDW/tHVU+bJ+/y3F/jmY1mtPeWNOt0+bn2LqHVWUILnVUP2X2myysHnWe7C
	OsRH4BaQ7Zde+9z3vy+ZpQUsWhZv/qErttb/Pi1iHy1nlnOp/7qkW
X-Google-Smtp-Source: AGHT+IGXwxZ2/+37QbUoUjwBnIjMrRRvsh+Q8aWmtzOu1FLR13nFkXNqETmMmtxwsBqRWTU2nK0S9w==
X-Received: by 2002:a05:6214:1307:b0:6f5:40d5:e51 with SMTP id 6a1803df08f44-6fb2c3255e3mr14836006d6.11.1749590596361;
        Tue, 10 Jun 2025 14:23:16 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b1cb9dsm72132226d6.70.2025.06.10.14.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 14:23:15 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4C9961200068;
	Tue, 10 Jun 2025 17:23:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 10 Jun 2025 17:23:15 -0400
X-ME-Sender: <xms:Q6JIaKAcKM668ElxPhaO3QQwyP9vIIZYR_wuVGaQTIzq-OVmIPv29A>
    <xme:Q6JIaEgMQjyqxEdCsDbgTmpegUMerIKqsiWg5_QNoORAvTAhwHS_76a5RfrROPu75
    7VeCzbKSpsE7Lx-HQ>
X-ME-Received: <xmr:Q6JIaNlC6LiYDLxxfrkvRhKNYHD1LvD97eAnA72NWCJHFM-_dldpMM5h1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduuddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedukedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepvhhirhgvshhhrdhkuhhmrghrsehlihhnrg
    hrohdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrg
    ihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdr
    nhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
    dprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdr
    hhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhh
    hlsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:Q6JIaIzY4nlXartlEa7Umdn-dDZNsXzTDMniltatBNnWB_lLdOEM9Q>
    <xmx:Q6JIaPS_d_lnkwzlXStu4AQJxkT9Vt9OsqxxRdksBtF0Iv-RtWRj3g>
    <xmx:Q6JIaDaPSNyDBnSCB24LYWX0IQn4Cne0f5D3aTBsizTKksJ4IxhGnA>
    <xmx:Q6JIaIQP9UcdLQt7tAW4mf3T3BRi_lQiyPbY-hop8Xr_booBy5mwlA>
    <xmx:Q6JIaBAAqZ3Y-LiWuaYPSqJ3GNGmKcUaxJ0SmRejTopbODhB_b7-RTR5>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jun 2025 17:23:14 -0400 (EDT)
Date: Tue, 10 Jun 2025 14:23:13 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] rust: cpu: Add CpuId::current() to retrieve
 current CPU ID
Message-ID: <aEiiQSTe-U1q0fOL@tardis.local>
References: <cover.1749554685.git.viresh.kumar@linaro.org>
 <a2e12436661fca452de5c417242328ed6f413511.1749554685.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2e12436661fca452de5c417242328ed6f413511.1749554685.git.viresh.kumar@linaro.org>

On Tue, Jun 10, 2025 at 06:51:58PM +0530, Viresh Kumar wrote:
> Introduce `CpuId::current()`, a constructor that wraps the C function
> `raw_smp_processor_id()` to retrieve the current CPU identifier without
> guaranteeing stability.
> 
> This function should be used only when the caller can ensure that
> the CPU ID won't change unexpectedly due to preemption or migration.
> 
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  MAINTAINERS            |  1 +
>  rust/helpers/cpu.c     |  8 ++++++++
>  rust/helpers/helpers.c |  1 +
>  rust/kernel/cpu.rs     | 10 ++++++++++
>  4 files changed, 20 insertions(+)
>  create mode 100644 rust/helpers/cpu.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa16..4255186784c4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6254,6 +6254,7 @@ F:	include/linux/cpuhotplug.h
>  F:	include/linux/smpboot.h
>  F:	kernel/cpu.c
>  F:	kernel/smpboot.*
> +F:	rust/helper/cpu.c
>  F:	rust/kernel/cpu.rs
>  
>  CPU IDLE TIME MANAGEMENT FRAMEWORK
> diff --git a/rust/helpers/cpu.c b/rust/helpers/cpu.c
> new file mode 100644
> index 000000000000..824e0adb19d4
> --- /dev/null
> +++ b/rust/helpers/cpu.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/smp.h>
> +
> +unsigned int rust_helper_raw_smp_processor_id(void)
> +{
> +	return raw_smp_processor_id();
> +}
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 0f1b5d115985..16fa9bca5949 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -13,6 +13,7 @@
>  #include "build_assert.c"
>  #include "build_bug.c"
>  #include "clk.c"
> +#include "cpu.c"
>  #include "cpufreq.c"
>  #include "cpumask.c"
>  #include "cred.c"
> diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
> index 7549594fad7f..a946c8a9d1a2 100644
> --- a/rust/kernel/cpu.rs
> +++ b/rust/kernel/cpu.rs
> @@ -102,6 +102,16 @@ pub fn from_u32(id: u32) -> Option<Self> {
>      pub fn as_u32(&self) -> u32 {
>          self.0
>      }
> +
> +    /// Returns the ID of the CPU the code is currently running on.
> +    ///
> +    /// The returned value is considered unstable because it may change
> +    /// unexpectedly due to preemption or CPU migration. It should only be
> +    /// used when the context ensures that the task remains on the same CPU.

I would also add "or the users could use a stale (yet valid) CPU ID",
because there are such usages in kernel arleady, e.g.
kvm_pmu_probe_armpmu() in arch/arm64/kvm/pmu-emul.c.

With that, feel free to add:

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> +    pub fn current() -> Self {
> +        // SAFETY: raw_smp_processor_id() always returns a valid CPU ID.
> +        unsafe { Self::from_u32_unchecked(bindings::raw_smp_processor_id()) }
> +    }
>  }
>  
>  impl From<CpuId> for u32 {
> -- 
> 2.31.1.272.g89b43f80a514
> 
