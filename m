Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B6219302
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320971; cv=none; b=XyuXvaJ7szFkWjQS5dLP5BTE7Vz9KBS7kFiVGC4/198DCD/bqxfyR9GL+EEULScj6SeUwCtT96Aej0bmZMp0Qzay0+XDsK+CImKbJFMbG4P9iSep4dhsFgkY/comG8nmjt0I7ebwGFCPeaD+nec7ZEvoPa0AQ9gD2aVWcmZY7XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320971; c=relaxed/simple;
	bh=zbCaHIDni1is8/1VUzP5in34Xsb1zCdrBhY2rcfVogM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWjHzMVz/Ouh6AcCXKjihVMuq/XmGO2Jn3wZIbhz7mBymsDz0ISt90nI2dZKr8DrzcWiODE5UQ6yZVgEBxoXe/1wS+Ik0COKo7L5lXa6WnCncVnIWMAYnY3JQj6r0ghVt/qFCmcs4bg8OpblSK9iSbD2jqSuqD14bos+UQlDIKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u8v7oyyW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u8v7oyyW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234d366e5f2so7185775ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750320969; x=1750925769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K0QlyepxER9o+isFGhwtQG1hSRbSpj4GjpamIkQZ6oo=;
        b=u8v7oyyWlZAH69i2vyRuLq3eCxKH6PSQVOfbB1OGkxzD3G/neLFRkeH3U6BkP+0RV/
         GxroyUZHACTJrJw73GNG8ln/XW5yCPXYjXkMyvBJwQJrmpEbyaCB6KiAg6Zst6ZrVklJ
         F1xz4uIU5Nq2n6Eepnmwr4CeCAVrESY4bAUM3mgOi0ek+1EB4UEBkwViJ/O6ASA527fd
         QiY9X0ma1Oz12+iwLYbXfjXwkh3acuEUWvWsreFmMA4hspdYocd/A2/ZZEtpEI7EOv0F
         2aSqrVZV9pyd9Lmxvs7+I4MZW9HhLQcsqVpVIwPkCENUGXTx2fzEgJUzuPT7v2TsWdt6
         oVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750320969; x=1750925769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0QlyepxER9o+isFGhwtQG1hSRbSpj4GjpamIkQZ6oo=;
        b=cP20Qt5DD+Pf6zene99SegTAnX0ordClYXOaXln4jfqRqAeOvgGZD9f5KGSkAijtB0
         dL9kEVlDdsmTr8k15kUNpDiLGFn9KgLbM+3JSCnET13fyTqLAUZcAKzRKLGrF6VaFK4/
         S+wha73U2HqiGdeKdb5GAPR863Doko/8nrteyysH+HGr/CEB8mnFOPXgLP1quvHvk3zR
         q6BdCRSXOJBby/5TAwLb8Epip7RXOkgU/L9D7DcjAHbCx+/+oPHt8NCYIMGWglItMDm2
         T9u1Z4sFQ+NNMKKNpCpUl+x6Y4Bb2xqD7jrSyGzzWZ6AA7CCh92G1A5TYjx64I0txYwT
         sKrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM1qRp7FyeskU+PKubplqxe+iQbLZh2+ksXL/IuNpGyEXvP1oO68vDLLApc8xzeWbItcgjMr2sF2iiQQc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3JAJlx3BfNUd/xbwPmcrBwBJ9mk8e87miOdMIv3xwzZXiQAqJ
	IOOQoBFQaEu+gvlEJ9yLrfmOUsmftRHOwPxCw45WRjAvGNEnlC5pZ7ePLfD3K46JJPY=
X-Gm-Gg: ASbGncv9B0xV7k7RkgsdvtS91mlLbz2xyzAmM4T70hQZocIep1lFIA4jPVEGfFp8nRK
	nWGO3NvObnyAg9e/0wePe5rW5mzNaa4r/k6QytVnJu+umw1Yh2KhvO1UJEghAxMUp05mc/Gf04O
	MU4+mPJeN/M4OWvIt5jdTe3nf0DVhX5C2VCj9v1zJcuEaAB5vN8+xhfx4oOLIS4qRAzgWlUalot
	Efq8dzg908u8SLIKOWF2IZCREhUCWqKrI7cX7EkEWgdOb9ZYcjBBw5kQSAU11gtcb/9q8WilZy5
	kjhKOxKCNmSCrpbszjlJh8kWNWpjgke+0eOs4MRAUl8pw+OmVz35w4YbfFSFcbE=
X-Google-Smtp-Source: AGHT+IEawLEh5ih0nom5h84EhiR42/JMCNTCVEdgMiTCqrC/LqbAHFqUFmpjyl3R9tYM3sjCCxQHtw==
X-Received: by 2002:a17:902:ce0f:b0:234:986c:66d5 with SMTP id d9443c01a7336-2366b3137b5mr354396845ad.5.1750320964113;
        Thu, 19 Jun 2025 01:16:04 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a4d6csm114635095ad.88.2025.06.19.01.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:16:03 -0700 (PDT)
Date: Thu, 19 Jun 2025 13:46:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: cpufreq: Ensure C ABI compatibility in all
 unsafe
Message-ID: <20250619081601.yeulh36lhrqxo4ep@vireshk-i7>
References: <20250613101815.18092-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613101815.18092-1-abhinav.ogl@gmail.com>

On 13-06-25, 15:48, Abhinav Ananthu wrote:
> Update all `unsafe extern "C"` callback functions in the cpufreq module to
> use `kernel::ffi` types (`c_int`, `c_uint`, etc.) instead of Rust-native
> types like `i32`, `u32`, or `usize`.
> 
> This change ensures that all Rust callbacks have signatures that are
> ABI-compatible with their corresponding C counterparts, which is critical
> for FFI correctness and safety.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1170
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
> ---
>  rust/kernel/cpufreq.rs | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Applied. Thanks.

There are few users of kernel::ffi::* in cpufreq.rs and opp.rs, if you want to
convert them as well.

-- 
viresh
