Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2842248883
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749784097; cv=none; b=kiSWlw6tTwrPJu9gdu33K585XaotB8SYwsL8E114uUMXA6hTT/MNenw6dc4scKqEUW8BxDomkj1bQO+7fka0MXO7CrjStLotrD3pjy4Q5APJc51jotExLQl2D4Y9Kjsu3y+zb3NckdYSfm32r6q3vhfBO7sd3y3L2/6kBRPSU90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749784097; c=relaxed/simple;
	bh=F/cPlJRxdRgqrcVVwCfuopWvR2TZ7HOAdOh3IpnzUjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FULUXqfCnNbx9643WEBNnwNOvRnKRi6IWX9F8MGurS1YO+AmPYwWw/G7A8+uxNzfQCbwDEL0VmJC8VNDxOdAXjwj/06i6GrmG3W2FmhXYVEQqmrE1a6AGmG+6BNIu6UEoSBHTT0lXi3aSAW+BbJej9TBzBO6T66EL+MtBBK1UiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CaQGbVll; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CaQGbVll"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-236377f00a1so15752795ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749784095; x=1750388895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WIYd06ooslrA2HtyvTs732OcgY4BnneKr/vzwTUEOyE=;
        b=CaQGbVllxnKlBeCX28izrqY4icgwAw03huMMQ1F02/WLRvPxK1dV0VOklAhushOTlM
         OTe8n0rox2Mxry+uHPq2IzEedzJ2XQ7KBkkiq9pB6pBwZ+s6RRrHqhDHL2yfrlQeihkA
         0PCDcXf0HpMCjUx1YLrNIqHQCpmIVxiXM23w8f/AiXMFLuCye3Zx5Ss8BDRiGz7U6p8M
         Bu6bhZS8uA/6f7b2fdInJGaAyBVyzS9jYupId6JtNFgJ1zoks95w8UeFf3XPV1erac8m
         EXPCWubTWDhVEjVxH1GMngJH24zICCTdUFQx8+DdM2lqtkMUNDO/UyIYWrjJa81cB/Em
         6DXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749784095; x=1750388895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIYd06ooslrA2HtyvTs732OcgY4BnneKr/vzwTUEOyE=;
        b=pF+75zTr3iO8r2AM3i8iPS1KMdb9/HZz9eLcMatxcLC/MbU/Rthow+8T4y8vDF5Cn3
         obIms8kDk59Qiukq4nYQ2cnDrUicZNLUukeiEG8qrPzwFmqz16TSgXe6pDaD+fmPemQv
         XADl7sVmi/LHc30cbdbPsNMZrelNdw3KrXf9LhelyBFr4z43Qqb5vDghxcUxKWpDtOOa
         hrkLWGcuPulP7eON+7Efw4l6vsZsP9UzwASsZ56fgQ/Pc7JRxA4nDB+hzmBMNH38Cx6c
         Bka3CIT0yImZHaFmSnTJMemYjtwAQym3NzOJXjSE8dT9VwHD3IVI4EUepQ4GxRqwhmbq
         j2Lg==
X-Forwarded-Encrypted: i=1; AJvYcCX1N+EBBjSOns3hqCeG4wSrNDfEB1fBBfzOvJkouMxdhYQjLl5xge5QlyouAqDtzzih55hnbsb6LOeyuQE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8H7ddFXRDlqUPRBu3lRSuDrJACG+ouIH+h6u3xRF+xJTA4TO/
	uKjUYUauaoxMjrxzgd9DHcK8/2Gdy0NBKo9edvKadqs0mc8/QW0WvasUaRErJW1Etvc=
X-Gm-Gg: ASbGncsCZW7bHDwN1aFAqdX5FP0PCNdbrXhYBohv1LusITfxLmy/IU34vl0ogQuCvec
	q97EocCn46Htgcn/H2io5WKkLVPPlOJKLaGmCVELANJHeQ7W5NRaubRYS7tZJlKhdjquAaoGYfP
	FT5TB303BsVr0UlNBTkwM4Ko/Fxb8zfCxfQzwM+C40w13N769hIzbZAZadE3vcvR7UMtvSy6vCA
	ffh4prvOZMLdQZ+VvkpzuCNtujt1vturtu/uni0SdqIzNUDbI7O2aj3cFB0yefhX8sKIEZoBdz5
	l4OW7jNv1AYKx+mWSLS51Dale2TwmMBhlNTySd1+++3uoJDAQoNJEaYoG5xLOFjUZe41iu0cKQ=
	=
X-Google-Smtp-Source: AGHT+IF8Y0wgnlnJ7uFcWUJUQNglN2V/OKcklcaqSOverj9hfKklxcYvgBJpD9CVwi+TFZv3FW4+8A==
X-Received: by 2002:a17:903:1210:b0:220:ea90:191e with SMTP id d9443c01a7336-2365d8910f0mr21711975ad.4.1749784094946;
        Thu, 12 Jun 2025 20:08:14 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de782f1sm4555785ad.134.2025.06.12.20.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:08:14 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:38:11 +0530
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
Subject: Re: [PATCH v2] rust : Update the bios_limit_callback to use the C
 FFI types #1170
Message-ID: <20250613030811.ytegbtlw6rgwtjgr@vireshk-i7>
References: <20250612104127.10299-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612104127.10299-1-abhinav.ogl@gmail.com>

Hi Abhinav,

Thanks for looking into this..

On 12-06-25, 16:11, Abhinav Ananthu wrote:
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index b0a9c6182aec..e97607ed86c2 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -1277,7 +1277,7 @@ extern "C" fn update_limits_callback(ptr: *mut bindings::cpufreq_policy) {
>      /// Driver's `bios_limit` callback.
>      ///
>      /// SAFETY: Called from C. Inputs must be valid pointers.
> -    extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kernel::ffi::c_int {
> +    extern "C" fn bios_limit_callback(cpu: c_int, limit: *mut c_uint) -> c_int {
>          from_result(|| {
>              let mut policy = PolicyCpu::from_cpu(cpu as u32)?;

There are a couple of more FFI callbacks which use `u32`, `usize`,
etc.. Can you please fix them all, basically all callbacks with `unsafe
extern "C"`.

Also please rebase over linux-next/master, there are few recent
updates available there.

-- 
viresh
