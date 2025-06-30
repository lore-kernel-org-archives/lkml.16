Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C70B2367CB;
	Mon, 30 Jun 2025 07:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751269694; cv=none; b=U21yeSGBEh9N8+bbwN6Wc8dhX9jLJznrXGI4ZO7TnRrZfDeQ91SDMIhlAtXb+UVi/P9udCmi4X8jda02richNKiHyVD3Yl87cU8n21WlDnZmV7IqaAx0HPKWA8kNZajp8LShS5cfeRhkbiLZZB00AHccZzA+l/y4a70oMqjNd0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751269694; c=relaxed/simple;
	bh=VmVkc4NDqlE1eCTqylwVONlN47uave8nHFmJ3UNaPUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLGdO+Zb3Z5yw2Z/kSWiV8ZqjWgfZELw0It6GNNf+TU8QaBTD6SOG0GMI3Qi5o9YXA8UXS2hLxME9bL/qxtNKi9xdrYjNNM/Ki4fAYkaxcrYBeWVj4c/OAVd79SFnxVR0LSBzSpmAV5RfqW8hW0b4RNzmzqDaF3D5IqCg8NKGVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYbRsJfK; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYbRsJfK"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b544e7b4so1789942e87.3;
        Mon, 30 Jun 2025 00:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751269690; x=1751874490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXFSBFS/Fsc3zonUF83Eqw+cmF6YkWtHb9J7Fk7Gc80=;
        b=LYbRsJfK2t9ZCQbcPNYPqb8isK6HXU5PwMbcK6q0z0YHpTGVUZFguJn/6eXcPq6nt+
         h1aPA8OJzZJPkJGrQZJOF2qaD/GtVdgvqj4bglSdA1olfLVhMqN/VW0asmIx2QF4v/0l
         trUjPvObYREVj1aTir0W7QRA+IWOQ+R9y9PD8RU9Lte0sFuYuqNMb9jW2vhQJc2IV+rR
         aBVjFlR6SMOWLtddZsZ2Lgnpz0PNj/+0Au68RQFsgtxZchsQgAHoWSh6Fjg6x1+5X/ag
         4yiuh133nVP+QC456ZLFBsxCkoUBDVcwAlyKyOBPa0OD9vA46xe33oAvDkJnIPN4kN/J
         zXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751269690; x=1751874490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXFSBFS/Fsc3zonUF83Eqw+cmF6YkWtHb9J7Fk7Gc80=;
        b=YfGll3WXFgeMd8y3F5c+eew6E2QHr3tN8m2h5S+lmVajO4H1ir8n2Xqk6DGjW/oSmN
         lcI+IpmgFTLnmnXFxu26yk3v7DwLyvKzPJN0b+aojbSLVWAl0zDLG90/tRADMa+lEs1A
         J/osiEGisDbsEUnl5Oxe2QuSL3EBa1b3vySmxeBTO+Dl30KsCqD/a5mSFOJnlXsJaX2N
         OGKiGtaWp4POskNfvSsbGbQETmgjJziYzAQz7X+JKi95qfN9M+bjOqyo0uXrF9KnDA+5
         mkSY+SvQFquTZ48A3kOIjBVM/K52agPXanm6cdPWk5tbrS9L40E0yWJIT//wuRksjA9R
         CeNw==
X-Forwarded-Encrypted: i=1; AJvYcCWnL6HuwpPYBehDMI3RkIcqajxMrcS2Y5XhUI6SAbtmLh2ST6pjrleq5yY5B8Ijx/b06DWq6VzoH64qCz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLswrPhL1C2pM7nNgEr+sRdxRt6bILBgdDAjUkXpEEs8UcKbi/
	Gk878q7tirSwwLR0jXcYnBgHmHeFWQ37+1zhSpj2gt1YEdaSUMsbHHKw
X-Gm-Gg: ASbGnctSsDUkr2YxvmaZdutJJnYOAwbRzT2wH4i/tKjb1gNPbgCBxeN0v8t7EgFcrO0
	IxJmNk6rCDN9wJwgbp1S5m+cJ7cm+Cy/6J+yYT1xrpDPmzpjx/hKpoxxQKQRqb3jCWvv76yNTYu
	jrYdTG9Iv7LgwMunPCBJSvzgUAiOJBac5btQwVUuHqeDbOF5o4lCu5YqIE32bbpTnxDHKKw2da5
	3UPI+AgB/yjeHRW9LC/PFpzhoXjNjT65cqAUa9ILEb7vp4BCOCuWjE6YNE5MBdKkHTThWlq/k5Z
	KgXSkmfw83xJkktyWPgviTQFZH44+Z1f9uTSlqgVuc9frl9w3Bf8Gl29N8NudW1Pc+utBX4O/0I
	/auOk3c95m0DYJAshvh74DJeTb6WIzWz9igCH97A=
X-Google-Smtp-Source: AGHT+IEjGFbT+2UJY4kKWiRGgpwWa5SKukWH4D3VbO4nfmfAhxfFEnGkspsGJRSmRO+9iY3LZVTzCA==
X-Received: by 2002:a05:6512:130c:b0:553:2438:8d02 with SMTP id 2adb3069b0e04-5550b8e9404mr3472093e87.47.1751269690098;
        Mon, 30 Jun 2025 00:48:10 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b240103sm1329013e87.52.2025.06.30.00.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 00:48:09 -0700 (PDT)
Message-ID: <a5679ca1-aa22-4a05-92fb-f1e95805c864@gmail.com>
Date: Mon, 30 Jun 2025 10:48:08 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: dma: require mutable reference for as_slice_mut()
 and write()
To: Danilo Krummrich <dakr@kernel.org>, daniel.almeida@collabora.com,
 robin.murphy@arm.com, a.hindborg@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250628165120.90149-1-dakr@kernel.org>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <20250628165120.90149-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/06/2025 19:49, Danilo Krummrich wrote:
> Given the safety requirements of as_slice_mut() and write() taking an
> immutable reference is technically not incorrect.
> 
> However, let's leverage the compiler's capabilities and require a
> mutable reference to ensure exclusive access.
> 
> This also fixes a clippy warning introduced with 1.88:
> 
>    warning: mutable borrow from immutable input(s)
>       --> rust/kernel/dma.rs:297:78
>        |
>    297 |     pub unsafe fn as_slice_mut(&self, offset: usize, count: usize) -> Result<&mut [T]> {
>        |                                                                              ^^^^^^^^
> 
> Fixes: d37a39f607c4 ("rust: dma: add as_slice/write functions for CoherentAllocation")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>   rust/kernel/dma.rs | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 25dfa0e6cc3c..2ac4c47aeed3 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -294,7 +294,7 @@ pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Result<&[T]> {
>       ///   slice is live.
>       /// * Callers must ensure that this call does not race with a read or write to the same region
>       ///   while the returned slice is live.
> -    pub unsafe fn as_slice_mut(&self, offset: usize, count: usize) -> Result<&mut [T]> {
> +    pub unsafe fn as_slice_mut(&mut self, offset: usize, count: usize) -> Result<&mut [T]> {
>           self.validate_range(offset, count)?;
>           // SAFETY:
>           // - The pointer is valid due to type invariant on `CoherentAllocation`,
> @@ -326,7 +326,7 @@ pub unsafe fn as_slice_mut(&self, offset: usize, count: usize) -> Result<&mut [T
>       /// unsafe { alloc.write(buf, 0)?; }
>       /// # Ok::<(), Error>(()) }
>       /// ```
> -    pub unsafe fn write(&self, src: &[T], offset: usize) -> Result {
> +    pub unsafe fn write(&mut self, src: &[T], offset: usize) -> Result {
>           self.validate_range(offset, src.len())?;
>           // SAFETY:
>           // - The pointer is valid due to type invariant on `CoherentAllocation`
> 
> base-commit: c7e03c5cf06a90ff234ae3c628c6b74e5cba7426

Reviewed-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>

