Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523E018C32C;
	Wed, 16 Apr 2025 22:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840883; cv=none; b=WmPP+TTUf0ePR1EnSgPTNQj7Dr4/IkjsuTtIAznruME2FzzFK0Em6/4n+Q14hofzXkOAUgjUwSlDQfJp9g9tovQ9lvQF3MeqcJ8ILsDgu+cTaFRr53XMgbAFo3OhOqjMV4Jvyl9uLRspPflWwuFkCAexIQl3ti5fxLCilZkclEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840883; c=relaxed/simple;
	bh=L4MgRch3n9c1KufpkXn39X1HvR5hlyU7DSGSXUBqQSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0M5CrOCABv1A7smgz8jw51MTtdZ8153lkEUpL91KzoHP+qikkCDhN7VC6vcPzx6HCubeGnRtrckGCa9FLwaYdO2cvOlPvTUHc3icn2br7Qu34vn5PYJF6fRCp7CwcfyQYkN3POODRQV9KHUqtwLmvG7n+2FY9SzoWP5YaOAscE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KA3pK8Kk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KA3pK8Kk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so1123045e9.3;
        Wed, 16 Apr 2025 15:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744840878; x=1745445678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/lV6+CInPTSw7XEpvqqKGuKnOwypfMwE2pBhOO9OjNU=;
        b=KA3pK8KkyOBpl+4L2NnHzqBzo+dcri+j5VZDpoq2LNQbs1z7e34gh8pMOrzlxhimOs
         H0RaTEVQ16YAAE03oSKkLVBRgywxngSA/bk1BW3LsRLgrx9IGxsaV3PaXWvVogAn4Y3b
         Rv12N7KHeGxhFby9vcptybKKzCzIGSd+DTUXejXGyPjhaaph72DZ3aV2jDKzzu7XHokv
         pL1t8KJsxh7gKwRHo4q3UG5VUtGAdmNlmsWSOWnQAPqglh9yFx66ms1+VZ9xBzULb/bN
         1ZhXkJzlQX7I0xpHG+0NfKzKvx60r/8SHyRaXFl5iBq+haZKigVLeHLWQldYF8dMX40b
         3sTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744840878; x=1745445678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/lV6+CInPTSw7XEpvqqKGuKnOwypfMwE2pBhOO9OjNU=;
        b=eg3dO9ql/Gv697ClZysa0OUBIzJbw4q3LYw00/B+QT1NVFuEPMekIgu7iSZuXcizCH
         61DIqe5qmQio5bJeuIGPOU1s8sg+XR7hzgxJ82YZZuWioghoIuzp59z9m269tDxMQLNM
         iRe5r3mGGJJIoTR0Ln9BQKs89JE3VH6oZ8idRN9+P07mK9G+/y6u3aRTLWEDlFPAlK1k
         N5nUvsSOFhFgzxl2b1N80WRiDI9lXuhVc+WzLjfRj1QZ4RVQIBZjHbPU+85YGpTuhA9M
         rN8qR6/nwh+09rzsq279Q5FJMsC2fUqA1ff+lqUiBBqY07hDzThW1IkPGjhq4P9Kvb/C
         YN7A==
X-Forwarded-Encrypted: i=1; AJvYcCWglCqtsWhz+K1VQcsMFisskoo5OZQHr0eBPE+W7lDzm77gmT8hifMw9oaJW0TjICjY4Jd1k+yIFh7gVbvY6/M=@vger.kernel.org, AJvYcCWl68ebovJ+ggemM2nA5XYehrg5PTgxqDEklzZbJQKItUav0xrCSquD7mE0jd2xU9G+eTyJ7xU6deA=@vger.kernel.org, AJvYcCXorUBebnC1C8zlvcvanZuGsZd3WeERPVatunDtum5AxCDC78l7Z2afdlnacHf9mcSBhDNzIW6qk367/6iE@vger.kernel.org
X-Gm-Message-State: AOJu0YzvPPXMm8BivJhOa4kll60fCCe/T2jfbFXPX1Ylj2XPW5Nb4J07
	8AlcWUDxffV49ty1N+xRP7dkamJFO/6idS0RS35K3vNGm8I35eIW
X-Gm-Gg: ASbGncvE44jfdjtXTR7fQoQrbQepOQgHnAetHgSpu+vVsUDTopL7kFFdTUY7tNUlsaL
	cfhHta+TX3sFkKYPPcStLdBQeAT8W7MGgcygqJ9zMRLsI0DzEkjURA/SrZBwVthifirbll9drvs
	/G9FlTr+Fkv422894fcBFIKSjpPRIsOM1eNaVcwQdWVkZf+7SssFfV7pEMBi6CqlAnKADIBaST9
	MHK6zrUK9W97o9EcmiMA2PCOll+eW3+iwfpJFqQeycaM7k2xVJv2/rYU3ZMiwugxqz6NYDReikr
	qbFBX/FMjzuvbaDCR8Hg9HGzlqM9ZhubsREOM4OG2ACP2yR0GKGC7A==
X-Google-Smtp-Source: AGHT+IHDB5igOdf8D7I91/XLgiiql7EqukCBRn3xTUw2ip02ijIJoY5OBJ2FUuERlwy+bQ6MNRxlLw==
X-Received: by 2002:a05:600c:8519:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-4405d624d6bmr38577325e9.14.1744840878257;
        Wed, 16 Apr 2025 15:01:18 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d3453sm32129515e9.16.2025.04.16.15.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 15:01:17 -0700 (PDT)
Message-ID: <e18be147-faa4-4ec6-b52b-4ff7d2119a27@gmail.com>
Date: Thu, 17 Apr 2025 00:01:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: rust: explain that `///` vs. `//` applies to
 private items too
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 Viresh Kumar <viresh.kumar@linaro.org>
References: <20250416112454.2503872-1-ojeda@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250416112454.2503872-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.25 1:24 PM, Miguel Ojeda wrote:
> Sometimes kernel developers use `//` for documenting private items,
> since those do not get rendered at the moment.
> 
> That is reasonable, but the intention behind `///` (and `//!`) vs. `//`
> is to convey the distinction between documentation and other kinds of
> comments, such as implementation details or TODOs.
> 
> It also increases consistency with the public items and thus e.g. allows
> to change visibility of an item with less changed involved.
> 
> It is not just useful for human readers, but also tooling. For instance,
> we may want to eventually generate documentation for private items
> (perhaps as a toggle in the HTML UI). On top of that, `rustdoc` lints
> as usual for those, too, so we may want to do it even if we do not use
> the result.
> 
> Thus document this explicitly.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72n_C7exSOMe5yf-7jKKnhSCv+a9QcD=OE2B_Q2UFBL3Xg@mail.gmail.com/
> Link: https://github.com/Rust-for-Linux/linux/issues/1157
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>
