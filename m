Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE31F2080F1;
	Wed, 16 Apr 2025 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817034; cv=none; b=tgy9+nm1qMJYqFSuV7ASdIq6uEVI8VqQOYbx8c/X8cgCunerO2YM3lI6AXVbdgbTe/r8x2FiS4Sdda+LdDSi22AxGCz7o2NkzPjNfWxWN4r923BrqqASZP6BGGWifqq33HDChmDpTmuZONdr3c6y8E+t/5UDsXLDb+AQC/QWJdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817034; c=relaxed/simple;
	bh=6+Xff3WmVmrU7Jwc0/xmBLRH1QISypH8FTA0rZNist8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCLhj2eHlaktbfwZyHTA/YH2OItK1TEzzXs8m98Rsr73Zy3YPOGeW2OPTycMi3ND4rrcaBK8DKwjedfFBm7Gy8pEdPC2IjQTAeNocUvVcBAli2MvnAcHdPOT7CENRKXVNJyUwaqgzYZjNaaL1npvRKw2TQpKe7WZCo1zOO6mvXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=botiQ902; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="botiQ902"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac345bd8e13so1188161266b.0;
        Wed, 16 Apr 2025 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744817031; x=1745421831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PzCfD8AVoCom/Bn2tq9P2rJP1QmLxaxUFxS9I84+6mE=;
        b=botiQ902K1l76N5tco4Z/882lQQZyWtmqcqEy76f3MjP84c930hYFknISaU8C3zxzv
         qrKz0HmngJJ+73mYghBR+tqCxWctU5Mb6Sd34GbLVMhCHX2SYyfdj2cDbyzQd2ngE993
         lYZ/jPIuPzx3XL3qTQIZOEu8+9+vb8ras5wfy9mcsGBxfZDpDaG/DXlsU8Tas+2iwuj+
         7TENG9yn6MZpMFTkDSBn9d8F8W+KvqZEFHHJGOUsAPYituYVZuUGbmC9cNT7w3/PgAKd
         Njqsg4Nr1ZrLojQ8cWxVCDLGp4TsLWvhyBN7F3llU8utftdvAZLUwinHuQW4f1A9kFz/
         Jtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817031; x=1745421831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzCfD8AVoCom/Bn2tq9P2rJP1QmLxaxUFxS9I84+6mE=;
        b=MXWoXB+RxW8HM1wU62+5+45zwy3n2fKOzIpvuDIquV4wDz3c/UzUpc/9Pl8FYjd221
         fGLXBIu44Ps7MaLIJFGimMLKS+Qqo9EdA64v263+oTa9SpXo7Lab2LbqHKZ01er9c5tJ
         OPZ/u+lmS/6M9hounXwMdMw0OxmDht14ZNgpWbegDoarT9Q1L5AeSqQ9UT6qWpytk9mv
         EyJpDPsD0LZm/Mf8jjwKULxNrZC4Jfyfd+jE1dj79E1atg0TryOWrFlQHP7BqdBZ4PGA
         mXYYzzeeoS9Nx87EJx+e1vZn1jmL9Axu33VSttZPESJnXboA7tbi9Ok686vO1MvKUIFb
         E5nw==
X-Forwarded-Encrypted: i=1; AJvYcCUXTKC87nXjSRvQIkHATV6IaJPiB+D//qEkCAlkhTg5gwDYIi69WfMFRK08a2vlPilNOx7Q2hQwyVuelG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL4TOQ97EtNfJpX3x0C8FnxiCsZz2MWBG5CjVHlgLpdy4Tr1bp
	cr31z3aAzhaLbPIjDSPAd8mQnBj3FSLAp/Ouzi53ZZqq5Pzbq6vX
X-Gm-Gg: ASbGncvFt6EqD1a95EtahQ/H4OgSW9WmA7q7L+z4nzGehj+8E+t46Hvy5d0Ewa35OE0
	RRT948/HeP/BDB2h7r3x+3zuqCeHvX9uy1+Rz35xhlg/5C1DVt5Hf7cGWUYgWG+dYx/Sn0Tli1m
	LJ+HaQ+a6osPFiA+wFYOqG58Z3NMYA71XYR7YMAscYELylcAI5wNnno6WaGPDeNSGWgyWE+4EYL
	+Bnj5N+G9HDzviTa56ydCkim6iwBOsUQpwgklx73zuguy6G1Qdhn3Mh3QbZmr9nVXqSG3U9MKoP
	h9ttu/YG3wSqDaGThNSvpnOlsOYnbFA9t56CrligNvhBYTRlNNiKEg==
X-Google-Smtp-Source: AGHT+IEs1ZzVQ8GjIKt9qqGPXdjcq0XJQJLPFj6DXGnlrIrkSbfc/kHD1jmt0knZEI36Xqzxj1ImOg==
X-Received: by 2002:a17:907:3cd4:b0:ac7:c585:c3bc with SMTP id a640c23a62f3a-acb428fd7e3mr232409866b.19.1744817030809;
        Wed, 16 Apr 2025 08:23:50 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d1cc9fdsm142973466b.157.2025.04.16.08.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 08:23:50 -0700 (PDT)
Message-ID: <dc70e77a-87f3-4759-acf2-854c679e8cde@gmail.com>
Date: Wed, 16 Apr 2025 17:23:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] rust: pin-init: internal: skip rustfmt formatting of
 kernel-only module
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250414195928.129040-1-benno.lossin@proton.me>
 <20250414195928.129040-2-benno.lossin@proton.me>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250414195928.129040-2-benno.lossin@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.25 10:00 PM, Benno Lossin wrote:
> The `quote` module only is available in the kernel and thus running
> `cargo fmt` or `rustfmt internal/src/lib.rs` in the user-space
> repository [1] results in:
> 
>     error: couldn't read `~/pin-init/internal/src/../../../macros/quote.rs`: No such file or directory (os error 2)
>       --> ~/pin-init/internal/src/lib.rs:25:1
>        |
>     25 | mod quote;
>        | ^^^^^^^^^^
> 
>     Error writing files: failed to resolve mod `quote`: ~/pin-init/internal/src/../../../macros/quote.rs does not exist
> 
> Thus mark it with `rustfmt::skip` when compiling without kernel support.
> 
> Link: https://github.com/Rust-for-Linux/pin-init [1]
> Link: https://github.com/Rust-for-Linux/pin-init/pull/33/commits/a6caf1945e51da38761aab4dffa56e63e2baa218
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
>  rust/pin-init/internal/src/lib.rs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
> index babe5e878550..56aa9ecc1e1a 100644
> --- a/rust/pin-init/internal/src/lib.rs
> +++ b/rust/pin-init/internal/src/lib.rs
> @@ -22,6 +22,7 @@
>  #[cfg(kernel)]
>  #[path = "../../../macros/quote.rs"]
>  #[macro_use]
> +#[cfg_attr(not(kernel), rustfmt::skip)]
>  mod quote;
>  #[cfg(not(kernel))]
>  #[macro_use]

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>
