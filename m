Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A6F1E5B7E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506592; cv=none; b=U89MPnYR/P8gWIFfxYcWKUJxcJZD8I3agzaUQpUoO/GZ025W1czaR4MN/VpXW7F191tlmlIKWQXC1Z4tM1lKOGI8mepDoW5PF0xOo5u6nEHrmNLog+jWphmrQyuaBBxpbS5F5vuyAYR4JN8KNS8WrkIJ1xsvKbeSs9UdhGJmsuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506592; c=relaxed/simple;
	bh=VAL8eQeQLv1jZ0ItTtHH0GpG4kM4IKAFMuR0hxuIUN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncdG6mTm0A68vGRRrZKOKINzNvbpKSAgvrp2NfNOXZ2mJx/hdLtx3j6UPkwF1rU756zJzIK7qMm4+XRmD3oi0MzvmqeuT+AF9rO4APOQWSgWFSvkTo7m7JwZhqMT2iNIeNn8fmE8bVH2tGpJRUj0dIgoluMlBr3P/LFTdGwQN9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h7blEy0s; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h7blEy0s"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227aaa82fafso103323985ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 04:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743506589; x=1744111389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rHfK3avWXg/wr5RZir9EpDN+jJ5pXFV8xfPClJ4u5GY=;
        b=h7blEy0sZCXPLZWJu/75R93+W7BNR7FLyBIXvvDSmE2gyFhgXsr1Xet+8FQ8U2RMQL
         sZ5OVxAdwOczBCh2ZDP5H5Cjh7fz5Fq6xm7BE1b9rPwUWYy7Cs5AOgxaaujnWnLUO3eN
         Kebvuf6HO7DRvy4lBBRwuSQE0JFktb849GZ4+ZsqV40qs1VcqXv/x7CfhuqA6iwgaN8j
         uSPkz/bqnLZH0hAFc2SDBNKV7omFI8dj27vD056swTndP8IJ+CFA+QaSFavbUpIc9h8x
         ez1p9v5SU4uU7PHl1vPRYkZRPSRzjP4isGaRyKI3uXfF9gn+IVzOusPBpkB5nFHUopP1
         Yx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743506589; x=1744111389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHfK3avWXg/wr5RZir9EpDN+jJ5pXFV8xfPClJ4u5GY=;
        b=NSAUle91WcM3ZdDdISnr0MGdX64bIY2XDZRkOHhIZ0iyQgGiqd+u5z26xZ68R05twC
         NmW8KnXyiOnhWFIderT360jA3EsGKczD+v2LG0Q6bpbMAN0xzf/yGwXerdHNaf6liAnf
         ApudzYBDMscYlfNN0GLw4DF1t/m/dtZQJ/CMi27hM/y/zOheq4a99zQa8kJpEEtzYPg9
         A1jI0Iway4ggH+Xqc+HpftcU97Ao0F3K2UHo+8944fahCiElzDbH7KRtxPWLk2eZxNzx
         D/9TEWh2LMAetzo2K3T5S1fVsRM9vGGKAT0A/HlizIAar9H20bBsJQVTWpME5HHfAGDc
         /gww==
X-Gm-Message-State: AOJu0YxHEvQdmZ2ICPa14fYHNd08oSY8zLigZ+YZwLTgIL/yFuBtG5TK
	8IphGtBP+7K+DliKPulY8AGiDdStuXB90eAzaZxHp5yO+NnsLabK64FpYzKBH08=
X-Gm-Gg: ASbGnctz1jptxm9h1JJDjmL3Fo7rgA5qymo/0UocZJKVMi+O33pRo+oiCnznUyrACYc
	D3OTcoRNj4gX9/uz99fx4N63jM6c9sW9FIzKKTIgtNVXi/t2iiwvptIZP5XEkMo2sZhjdoEoaAZ
	GHFBRPQB8/RElb9Pvnw43LAEhp5mMizlUGr4aEb+1jblUtOob2GrsgLP5XKpHBRhUhOK866BjFX
	7OuQN+c83MKTzb2X3X1QiZXkQoCaw3NusEzZqRMYPVJRY+N67pKtHNmUDExrBY+htbtwTXm2SFy
	hUWfafhURTGCeCz64Z/MBtHjtaeRD2lwoMM+TCpDLVBnRK6EX4VTj4Gj
X-Google-Smtp-Source: AGHT+IHETR0ZDX3a2JwDqDubub9VhOb/rg7MYqbwYjCU/FGmaqg6uSF35xx+BLX7z3+XFAebMVnSyw==
X-Received: by 2002:a17:902:da83:b0:227:e7c7:d451 with SMTP id d9443c01a7336-2292f974b3emr209239775ad.29.1743506589196;
        Tue, 01 Apr 2025 04:23:09 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf14csm85705505ad.137.2025.04.01.04.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 04:23:08 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:53:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: Re: [PATCH V3 2/2] MAINTAINERS: Add entry for Rust bitmap API
Message-ID: <20250401112306.z5krtedzzxphlwez@vireshk-i7>
References: <cover.1742296835.git.viresh.kumar@linaro.org>
 <cddb90075c7f892e30f5039c3b3d14e6a239d915.1742296835.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cddb90075c7f892e30f5039c3b3d14e6a239d915.1742296835.git.viresh.kumar@linaro.org>

On 18-03-25, 17:21, Viresh Kumar wrote:
> Update the MAINTAINERS file to include the Rust abstractions for bitmap
> API.
> 
> Yury has indicated that he does not wish to maintain the Rust code but
> would like to be listed as a reviewer.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Yury Norov <yury.norov@gmail.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 315cff76df29..c55db52590cb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4026,6 +4026,12 @@ M:	Yury Norov <yury.norov@gmail.com>
>  S:	Maintained
>  F:	rust/helpers/cpumask.c
>  
> +BITMAP API [RUST]
> +M:	Viresh Kumar <viresh.kumar@linaro.org> (cpumask)
> +R:	Yury Norov <yury.norov@gmail.com>
> +S:	Maintained
> +F:	rust/kernel/cpumask.rs

Yury,

How should I name this section now (since we have separate sections for bitmap
and cpumask abstractions now in MAINTAINERS) ?

BITMAP (CPUMASK) API [RUST]

or something else ?

Wanted to get it right before sending a new version with this change.

-- 
viresh
