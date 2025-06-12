Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63659143736;
	Thu, 12 Jun 2025 04:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700972; cv=none; b=RI3izXpu0jY6zx57pDA6M7Hs7kWByI58pvhm7gD5TgG0F4eQ/y0pgLGD5Bc0nne5eOFT539iDSlCmWEAR3kmY+3WEaPDYaRWll+pW4TpIm01ETpa0+Q1xGgw5eWR75+pBiG9L6aLOLKfTY7h9w3lgG4Iv+Bt+ozBfZtChIDt2k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700972; c=relaxed/simple;
	bh=lIEDox2si9aWnHQhhVwH7AAcHQL6E2cr1kTYuwCid6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eoWx+7v8xWW6ZjEK8ypmh0PCH7IXD3PyR+OHPWVisgysIusfVsb98KgeuDzzKxvASQPUSN8iWiT0MRg2N6Hsmml6m9ukOi7abIBhZD0LaW96bpvlVg9KszS6FotCEDO1g1P0W9CMzkIIiQ3qhWQVnc0rXaxiQKcTDLshpJWc/NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8MMkvvu; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8MMkvvu"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-730580b0de8so855026a34.1;
        Wed, 11 Jun 2025 21:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749700970; x=1750305770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W0mjarcmxyrPycEDkdSsleCaF/YzWa1TNh36qHpVsnY=;
        b=d8MMkvvubEWaTo9EAIxFRYTFeuU127rdNOI3EB0tcIpX6a0HGdwuXrEQnHlsXxnSLw
         fJbqDXrkYqwotpZz0ROpy5ZBqeVZqUN4CGgvbBkhdlusQ2/vLGKmHagfx4pXvzL+zioq
         mmAK4lWj2qjA66kCjOxgHRZ2V7SQQC4CQ4faz0b42ZEtGRKcERxgC8w0TwH/Dh4NdoMr
         4dWZdmEA0csOZ3m0P6VeQqEy2N+qXK2d/S1HLCT4USMGPzDgv7fitjyxsnPvEkciIsao
         DxZh72bH8TUUqTkBAol4wn74DhNu3LeNWvnpkfn4sPWIkZas81ms6JHaSp9VhlnVW4TY
         vwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749700970; x=1750305770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W0mjarcmxyrPycEDkdSsleCaF/YzWa1TNh36qHpVsnY=;
        b=aDWiiDnFSi5gIIS6CviCjz/Y2fRZYiT6SJ5IEEGMuxssvapmlkCRIJMUiQLgHzXoAu
         0TCTKuE2QdfYL7dpN1aHJkhJjmKQuDwjm65+dGJWnVDtdj9sdfuZqtH9wmfqfX2insBd
         bChbO+jKRIAwA8zEIy/S9EM7FHB8W6md/2BcLLn1GwXhi9JBaHOnra5cQAdaWdtiLA22
         vFE7+PmaJi52f4qeu756jRPZLJoRD3LkZ/I+2SfCufWnDbeMTMBQsNmWm8Jmboyyz0T3
         jYH6Fd11+VNvKSd+zHz7CEOCMcpqXDu0BoissZyW+kj3JUc1j7XZRP443nfVQhJLwIuu
         O1Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUUPFeSl+DKQyjpscXGhTEZghA/AoeFagC5ei0PsWS7xakmlFPUmFo1eFrmd7zgfCHriUaj8ZGTcFhaASTa1lE=@vger.kernel.org, AJvYcCXGDi8y7eeY8Cl/62wR9hqnvvJH8Zeh4KnpvXzKaLI9eYBi9HQO6hqZPhLg8bqnxASXsSCSagXZxxvzGrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/eYk4BdDCe6KssdmIqpYuj8XeP904rZro2Mw9CrADAAcvMmI
	AzOwUcJaBWvg0dFg+92frfw2qO64I1vi9FrWtcNVcSZ/+yGK3H0W9AfH
X-Gm-Gg: ASbGnctDK+igDfH6GZPsQAqp6wZXP6EKDgHFYJcXfS5l8eBVUQA0ADHrP2LOGmLSzel
	u81+Ljv9J3a+a6GYc3VpTdq3N63afpDo9L8W/EGm7kw1DW86nBl3mzUeZkjJi6tQVb8Su5kT1Mw
	EYfygeKTXwGqTStFHhbXnplLUJ/4z4WAla04m83suE5tUUpDzTGRP4TU2OlaCmMy7zVuUfhGIyw
	nEyJrvDI82RZmN/Jf+BpdZuNQ+JtR/0Yw0qe79+C+HJivvVJQanZ/KPBOj/WUSuUGX0F/QZ1iSR
	UkhKX5/WxReJMCI7MXoZweuG9OINUbUMI1HkC8DLf2Af+K1hKFc93uMOEK0QzgcsOuVhVy4xSYP
	d4WcRgX2dDqWkZUQr82Yw84N923ppN35/yA==
X-Google-Smtp-Source: AGHT+IEG5LMC3U0VLmxul/USdQsOfKZQtPUB6pR2Z6QPiaZEH+d8dKvUsjlBs2rPJQZUZEaLNYH4DQ==
X-Received: by 2002:a05:6830:7207:b0:723:7853:8791 with SMTP id 46e09a7af769-73a143add19mr934555a34.0.1749700970287;
        Wed, 11 Jun 2025 21:02:50 -0700 (PDT)
Received: from [192.168.86.39] (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a16c9d67bsm146579a34.58.2025.06.11.21.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 21:02:49 -0700 (PDT)
Message-ID: <2c9504c3-2498-4b59-8e26-0911a8be8e96@gmail.com>
Date: Wed, 11 Jun 2025 23:02:45 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] rust: device add support for dynamic debug to
 pr_debug!
To: Alice Ryhl <aliceryhl@google.com>
Cc: jbaron@akamai.com, jim.cromie@gmail.com, daniel.almeida@collabora.com,
 acourbot@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
 rostedt@goodmis.org, viresh.kumar@linaro.org, lina+kernel@asahilina.net,
 tamird@gmail.com, jubalh@iodoru.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250611202952.1670168-1-andrewjballance@gmail.com>
 <20250611202952.1670168-3-andrewjballance@gmail.com>
 <CAH5fLggTL9Ej8rcakd-gDz+h0dZhA1PRzxf+76EjxotOBJW7fg@mail.gmail.com>
Content-Language: en-US
From: Andrew Ballance <andrewjballance@gmail.com>
In-Reply-To: <CAH5fLggTL9Ej8rcakd-gDz+h0dZhA1PRzxf+76EjxotOBJW7fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/25 4:38 PM, Alice Ryhl wrote:
> Please define a STATIC_KEY_INIT_FALSE constant in
> rust/kernel/jump_label.rs and refer to it. You can use mem::zeroed()
> in the definition of the constant.

Will do for the v2.

> No, we can't use mutable references like this. In Rust, the real
> meaning of &mut is exclusive, not mutable. (And the real meaning of &
> is shared.) We don't have exclusive access to the DEBUG_INFO static
> here - the access is shared, so we must use &_ references instead of
> &mut _ references here.
> 
> Note that by using Opaque, it's possible to mutate the value even if
> it's behind a &_ reference.
> #[repr(transparent)]
> pub struct _Ddebug {
>      pub inner: Opaque<bindings::_ddebug>,
> }
> and then you can do DEBUG_INFO.inner.get() to obtain a mutable raw
> pointer to the contents.
> 

Unfortunately, static_branch_unlikely does not work with keys contained
within a Opaque, because it uses offset_of and sym. I can create a macro
specifically for dealing with Opaque::<type_that_contains_a_static_key>
because I imagine that many uses of static branch will end up wrapped
in an Opaque.

Best regards,
Andrew Ballance
