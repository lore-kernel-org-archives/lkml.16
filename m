Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9457A2C375F;
	Fri, 13 Jun 2025 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807922; cv=none; b=gXUqN5U+ioMF9vR+JEnDAVasspmIIh0nfSh6O8EkoX50zA0beKWO70rrhgT86mi/46YsugK8nPx4HiBgDYkmT8Ufg+PnLmdAv+hwLKGxj1W/vmzd21mZRiJkKFJ7ZEsxYGl84Aqrd6zzyP0EUt0zGri0SwIXLSvOXae9JWQvYz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807922; c=relaxed/simple;
	bh=2bAxLZdmW+dB6hgjHfQTeJYs5D2kkGbxxoTra19Jy04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hqc+aRuvnctxVwb410d16WzeIOTPNN2kuqmC3OC2p54Mk+/kvZM5mw8c0NDUld1TY6cRC5gpiEMv17b0qcNDR+KZbxO5ocHGAJfN/L/xQMYAfQAoJX6sqPVB5fo3lJFBdDgNEgpOlDTXfDc1p8bsXfv91gopS5MbIqFsLT46+bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEsrf4HL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEsrf4HL"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5534f3722caso2269894e87.0;
        Fri, 13 Jun 2025 02:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749807917; x=1750412717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxrGh0fCLnQwX4nzD6CTGfjfOhrw6Z6qm6oKUUOWy6s=;
        b=iEsrf4HL//j5UXUqUNl8z7hwoQQoXzsJSph8cF8Fxeg0leH7tU7aVy+DdCZCH9/+KD
         KbL4RAWarGUCSBSmRtOrRGcG03E0RZ2NvhQexojSAQn14X84+w3nDbN7LKvyFc+gKGtd
         oZ/2zNpqmIzQRKF/taXxz5FnrBPFgdKCee6Hurdm3JIeIMLK5WkU+9dMJGxqRY0JWx7o
         txIqJDUsdKMqKJ49sDZeVmLDerwC7twVzdrihAAa4bH5hBaPIat/KwQtSXmPUi8yQhNw
         I293HwRsTBNq417Kf3Cy5OxCeB5si1No8HwJcyr1hCK/sesy+kVdrVCbPt4CsC9h3Jgu
         aTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749807917; x=1750412717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxrGh0fCLnQwX4nzD6CTGfjfOhrw6Z6qm6oKUUOWy6s=;
        b=NVYLWYsSHxBQoXYJZ8iOZXm9y2DhsJFnqSKVqm5uVWykU0+KXmECTKKaR71BV46Q18
         j94j9KdgGObTeNF2Hsq69/fKWLcZf7uV3TTFZ4qcj1Iime+otmXhgucQFGYk+a7oFBzo
         mvYwQoGasjCO/NZpW/9mN6UwtG00O4G1/Pz5RDI6v7r7FAHJBrxNsrHCs2xAMdymgOqg
         3fcnATJqdUOkUH7m058ieAfhuHHxtim+p+12k86/cNHLXuykgGK7gsUhMp2da4H1U6sD
         N24YKZWMP1EcHhlHijM9m/v+7P1YMozH9gc+xBpE35kSscTsSDa9ue57JQz/F7bsyOJb
         E17g==
X-Forwarded-Encrypted: i=1; AJvYcCUhPkL4RzEbcMlvTDNNWu1pimcHgzt/xBuWhTl4gI3P070GXdjQ+++gLN6+pJXzmnYF3PJR2HTET2aa0r/gYMY=@vger.kernel.org, AJvYcCVRsyw5jHReG6PLH1iat+WCRqTHRV6vKypZPRl6A4cP3xRZjc85QvgVf416hsdvQ3jWW46cFIbCNqkL8AE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTWRwr7bfuZXZHP15UzYf+M33ppWfBnXzXk95/rWEvlvRClw55
	JJ6XDCOIVNVQsCKwdOx6jAnhrZ+AgLGA/FChfdETsSuhNMmlzii2i+cO
X-Gm-Gg: ASbGncuPskoDELSbkVO+gXBgSJalIgftORRtyQVTcBfkRqZAaSWPxB6I0QdUE6h/bZZ
	o2x4NgfZw9+FFJ27Qpj7r2PzFlNIoD9zphKZjy7kpr7fj/yGGoRFBsiso8FBbqhRjE4QWFMcbFe
	QJjwEU6s/LLxIUErUf5rTvmot46ZJQ7E/COMBxRDoBk/yfFmWzBn0/O7ospPsOBfDc4gh0cQT55
	xEFp+3PkN29prLlfzvgzDa1y78JtxK6pPfktesgnhkDOCvJmSIv5Oq934MJV0Ij4qK0zvBZ0WAw
	JDZp7+7N8BI9OpfnXgM/joT928QO3j8kCiR0XQm2TQQvjOTDdY8BYhY0xVbVWuwpel5W7AIQjXy
	ozVUrV/z+ikuzX4YLRQO7phe1QI9GHYuVwQGHniY=
X-Google-Smtp-Source: AGHT+IHiJOoevlgKdwDSnmotX6IPm3Uj1/yrY7CfWWn7/KrZu7vk47zHN6lD4iwOK4EjOUhVQcIvWQ==
X-Received: by 2002:a05:6512:114e:b0:553:2f61:58eb with SMTP id 2adb3069b0e04-553af96f227mr619887e87.49.1749807916268;
        Fri, 13 Jun 2025 02:45:16 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f7799sm381819e87.229.2025.06.13.02.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:45:15 -0700 (PDT)
Message-ID: <0b71832f-f3a9-4109-baa1-f29a8327d872@gmail.com>
Date: Fri, 13 Jun 2025 12:45:14 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rust: dma: add as_slice/write functions for
 CoherentAllocation
To: Alexandre Courbot <acourbot@nvidia.com>, dakr@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
 rust-for-linux@vger.kernel.org,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Petr Tesarik <petr@tesarici.cz>, Andrew Morton <akpm@linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Randy Dunlap <rdunlap@infradead.org>,
 Michael Kelley <mhklinux@outlook.com>
References: <20250602085444.1925053-1-abdiel.janulgue@gmail.com>
 <20250602085444.1925053-4-abdiel.janulgue@gmail.com>
 <DAC2ILD2DSIZ.3TF8W39X5DDH8@nvidia.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <DAC2ILD2DSIZ.3TF8W39X5DDH8@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2025 16:05, Alexandre Courbot wrote:
> On Mon Jun 2, 2025 at 5:53 PM JST, Abdiel Janulgue wrote:
>> Add unsafe accessors for the region for reading or writing large
>> blocks of data.
>>
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> 
> A couple remaining nits/questions below, but FWIW:
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>> +
>> +    /// Writes data to the region starting from `offset`. `offset` is in units of `T`, not the
>> +    /// number of bytes.
> 
> Reading this sentence it occured to me that `offset` may be ambiguous
> here, as in my mind it rings as being in bytes unit. How about using
> `index` throughout the file?

Thanks! I don't have any strong opinion about this, I think it's enough 
that the subsequent paragraph makes it clear that the unit is in bytes 
unit? In any case, this could this be updated later after the merge?

>> +    /// ```
>> +    pub unsafe fn write(&self, src: &[T], offset: usize) -> Result {
> 
> Can this function be written by leveraging `as_slice_mut` and
> `clone_from_slice`?

using `slice::clone_from_slice` would enforce the length of the coherent 
allocation to be always the same as src data. Not sure if that is what 
we want. Also, instead of just a straight memcpy, this would go through 
a 2-step layer (a call to `slice::from_raw_parts_mut` and then the 
`slice::clone_from_slice` itself)?.


Regards,
Abdiel
