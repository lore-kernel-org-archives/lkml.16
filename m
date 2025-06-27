Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107BF21ABCB;
	Fri, 27 Jun 2025 22:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751065004; cv=none; b=j5PNFdTUNvoxyca/xSxTeZOB8znCAhWLz9o1gw8mn0nqtTMQpYoOzg2SA47z3eb7g0CO+czea9cJMAP+Ix4wa76YoZ7FgvlhWsmB6SUab6AXlP4FW6dYtGlfDLZtYmm67fMNQ/6aL0dmzehWEqw7WRxU7N+bzkJ79czZiYpV+Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751065004; c=relaxed/simple;
	bh=xP9I9qlYdpZT1dOF+ucPElGQ/N4btOQDPldfNkCWPT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhh2qdsg6JVYXDMiJB7KtFYDsxvDGyZUT2HsYF5bcCkD/6F8ZSrnmYhCoXvYb/WipPZ4JQmoW2jCZKySlB61V+trwKp881VYzlAL9ZzBHQRSpf8yJr+7+eIqucRi7wSbS3JcxV36s7Ok3YVfICKm4D43EvgOPZclgehsT7dVyXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXFqoy+W; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXFqoy+W"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fd1b2a57a0so23586106d6.1;
        Fri, 27 Jun 2025 15:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751065002; x=1751669802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDoIoBHK7rn8NNEmc8cLOtE3R2Edk/u3sKpTOmNcF9M=;
        b=MXFqoy+WOOZFIdF0MGQDtR56loIQ+KbVWqPZ3jHIwzIuD0iruW4iQbNDj22K6a5RoX
         c2ID7CkmStLRu/NWsjLKSORFMFeWSR0DPXlNMpt2RNgUT3Mtbc45OGbx8WzDDEefdvnY
         hqfSRX1nLVggyAUZ1crNuteY7MF+AQVaKpzc5iW76A9lcmQD6cBXm7ASo4/U6czURsZ/
         EJVPMV9CTVhXJnqsy7mnOKmg5vqKqnDfMIOd5ONF18qxkszWfm+TbP1z1ZwlFlE/b1Uq
         NZX5dKPIfBRfpIlaahkOW3ElXrlXvdqdVyyBEo60JUGbgg5bz2TW9WePSxsTStywpRf2
         qNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751065002; x=1751669802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDoIoBHK7rn8NNEmc8cLOtE3R2Edk/u3sKpTOmNcF9M=;
        b=kdmDymHxvi/SSPGfZFXNbXNEn5g2sbTPQ7F2O99Ff0VARXqYyI5F6BWbzoEbyGOJWj
         dNbZT1rbenvCOO8WBLg6IrXMRKesFyZ0dp+2FVhIeVnKKyLQaT63EdmonP5gbJXYXdhZ
         q6dvN+45IMSxRoMub41UI4in2T6A0MR2V4a3Yj+sLY81tkcD26N5Q75yd3hRQYHqWh4n
         DKZkEYRbhOBDmEnrGFt/r96gs/m5S9PRUu5J2VSpvhZjNgq7dV26SbIgcH/x4ny1xim+
         x1oBaSz5+ectGZihDRHoO1u9IJIxaLMj8N/PGsVonFelZNzgjDUFKozOIsSzHwtxTQYC
         3awQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKO+572PamwbR92t17ZvUyHp0DCmUrgzwPKm3iWdFV0D4HJBMb2h0Kbiojj7bHo7ekt8AHLacQwsIO2is=@vger.kernel.org, AJvYcCWo5ffr8k2fTxCUn2dL1YwEc5eTsUZbb5qD/gMozvIgTKZ6wa0QwEA5wspQT4dNE2//fnULVoJ6akdHuWgUkls=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAlPkGMMK2645qho3umbGSz+D1XR7T1PwycuuCh0pNayvSdCpu
	B1uj5YzjFO0z0wToWc1BppeLHxXc/xekDsTwW98wJiv1LGBg8mVjulfx
X-Gm-Gg: ASbGncsgsirWrA/GDClpZBMMvL93MlYmt6DptUq0nI0d1dSsJPutct7FJLABvV2pau9
	lrod+BVlIV1g2Flgyd9VlqoB5tFxCUDSWm5BLHGDEee+9da+ZM08zFfH3wr+rhH9Qc+ajvHws2c
	wzrCpLgi8vXhu7kQOtu0MnIEdMb7q2XYRUTn8oQ6pSmBy8AiCRl1xDMjwQHhIYpvJbXWvbrOEcX
	I+pT2VdK805zlMZEeatCfi7c2jTRD0lNgfJfUv/2F6t/dcAMbKk/huGfWLXMDTvF4Gzrua/Csxe
	QEqaTsSyYom3KLBQngytIhnQ6UL4k9idQM+xEgVs7UUgyBHly/3NA274ognmzQ8+li3nVZT3+wq
	y0ty8/tTrRUBOyVXf3kzAVrP8iG70s9ox55ehngpE8i2jApPAs2RE
X-Google-Smtp-Source: AGHT+IFCU9MSnpICIKm+jetw5cPBjIgYpEzSNVMlwUJfw80d7drV1D18juGzglx+pCiPFa+ffk/mFw==
X-Received: by 2002:a05:6214:43c8:b0:6e8:fbb7:6764 with SMTP id 6a1803df08f44-700131c3c5emr86130976d6.45.1751065001802;
        Fri, 27 Jun 2025 15:56:41 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e45b1sm28095476d6.69.2025.06.27.15.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 15:56:41 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id C069AF40066;
	Fri, 27 Jun 2025 18:56:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 27 Jun 2025 18:56:40 -0400
X-ME-Sender: <xms:qCFfaDXcj823Tc-8ZF5Jys9FLLrEkchqmo14rSPBgbUB7j-Gl9ZOrQ>
    <xme:qCFfaLl86gQ94x3dMygc0JsAAFxXy12juYnZ7EWVoBsW7NjtLUpCvh2zh187NUPfJ
    x3b5m_StXigEhxv4Q>
X-ME-Received: <xmr:qCFfaPao0SNxWwmU98n5t35zfk3oDs19U8LyX6-N0emJaIXszsGZ_JGi4v2BUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegurghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtph
    htthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgt
    ohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggu
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprh
    gtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidr
    ghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguh
    hordhnvght
X-ME-Proxy: <xmx:qCFfaOVgvfnuri2a5V2w4IbqVqnr044KMguTSOirQCKCI5dj1HPzzA>
    <xmx:qCFfaNnDD6By1AnwE0SCj7DpGWlZ5eoV_YOPuGG2CEVRLYHYVCFxOQ>
    <xmx:qCFfaLf1nYsqF1_kvTmlr56PekgW9-9RiCEeE-sf22HXE6ABbQRFRA>
    <xmx:qCFfaHGaVQZk3Pv01x3ZDx2qiCM8kZF0hQ9dyjh5vn8dRG1usE16Hg>
    <xmx:qCFfaPkUEQJcbn2Je1iX-1ydBDVHrUFhgfIbKGOCFEFDnkBWXTIcCHIQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 18:56:40 -0400 (EDT)
Date: Fri, 27 Jun 2025 15:56:39 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>,
	Alice Ryhl <alice.ryhl@google.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Carsten Haitzler <carsten.haitzler@foss.arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Ashley Smith <ashley.smith@collabora.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] Introduce Tyr
Message-ID: <aF8hp5-e5LrHTWfT@tardis.local>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>

On Fri, Jun 27, 2025 at 07:34:04PM -0300, Daniel Almeida wrote:
[...]
> +#[pin_data]
> +pub(crate) struct TyrData {
> +    pub(crate) pdev: ARef<platform::Device>,
> +
> +    #[pin]
> +    clks: Mutex<Clocks>,
> +
> +    #[pin]
> +    regulators: Mutex<Regulators>,
> +
> +    // Some inforation on the GPU. This is mainly queried by userspace (mesa).
> +    pub(crate) gpu_info: GpuInfo,
> +}
> +
> +unsafe impl Send for TyrData {}
> +unsafe impl Sync for TyrData {}

I think you better just mark Clk (which is just a refcount to `struct
clk`) and Regulator `Send` and `Sync`?

Then `TyrData` will be `Send` and `Sync` automatically. And the total
number of `unsafe` in this patch goes down to 1.

Regards,
Boqun

> +
[...]
> +// This can be queried by userspace to get information about the GPU.
> +#[repr(C)]
> +pub(crate) struct GpuInfo {
> +    pub(crate) gpu_id: u32,
> +    pub(crate) csf_id: u32,
> +    pub(crate) gpu_rev: u32,
> +    pub(crate) core_features: u32,
> +    pub(crate) l2_features: u32,
> +    pub(crate) tiler_features: u32,
> +    pub(crate) mem_features: u32,
> +    pub(crate) mmu_features: u32,
> +    pub(crate) thread_features: u32,
> +    pub(crate) max_threads: u32,
> +    pub(crate) thread_max_workgroup_size: u32,
> +    pub(crate) thread_max_barrier_size: u32,
> +    pub(crate) coherency_features: u32,
> +    pub(crate) texture_features: [u32; 4],
> +    pub(crate) as_present: u32,
> +    pub(crate) shader_present: u64,
> +    pub(crate) tiler_present: u64,
> +    pub(crate) l2_present: u64,
> +}
> +
[...]
