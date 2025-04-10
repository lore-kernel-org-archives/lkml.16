Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE091BE251;
	Thu, 10 Apr 2025 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282085; cv=none; b=SWaoVw0Msonlhfv/nahIgiM/cl7Dg+U33ermiYk9Kd0xD2DBTRSFybsl6WY54B+Oin5C9v1n6LFvxGcu0HEHivRjvuojfMqETqvyeUALmmPdL/y1VJIR5vzqsV6g3QTfyxDPqLD6aHipPej5WrgudFBPXgYTVFyxlc7geRyx+gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282085; c=relaxed/simple;
	bh=cGLWvchrfLR7zhi+J73CP0vruS4QypgLHhmrKJ1biEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzjEw6uU4BAMBYINsAnLuv51waZ4I75DN4IawuUSYwA+iT0ecGfitAy2X65LXAtFmFxjww44zX33Yp9lmmhRI9aKYj2S1Wkm5AGYU6dtQVisn/KCRgswajLWCms+GDWBRQk1brTKyNAroer16HTJwTxsfR54+gWgS7fJFeocgcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwuNn/e4; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwuNn/e4"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549946c5346so780759e87.2;
        Thu, 10 Apr 2025 03:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744282081; x=1744886881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dHWj7S6vcwSOKxDCquC2leHCOUIgqVrIQcFhFrWcmR0=;
        b=mwuNn/e45kJrvfURhDLIN5YlC+KGqJmOTU+rpqGwrPUT70dppwAMpf91Hy9ZXedz3t
         p3yOiagPx7m5n8Hlv9oXAnJ+f4Y4xZRlok5RY2q23uRNF6OJE+hJqtqEWHGWWK2dR12B
         9eZ0SYRlW4p7V5kDujQ8yNP6FTOzSEEs1HBygbBdzEY29GtoNU4SdKlM1jyayLAyFoeI
         02aasCC6HqivaGbrU+uhidU7DzO3xhBMYeOhiPC6tg5BWr1ep+HOuWNW5uoxjHxXfX7P
         RsmZctYnZZV4yL2+iBZQ8ICRFkRzLd9Ej88+gGbo0cBrfjrNVlmjD4ZPrquhFVgOUE7t
         8hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744282081; x=1744886881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHWj7S6vcwSOKxDCquC2leHCOUIgqVrIQcFhFrWcmR0=;
        b=oqSZHwiimzPrxgkXljZSWJSucqeQtUau0xoErt9U/5V8kzO0/hPyRxVCY9xUHHq3/u
         DJAXhDW/ao6I4Pzmy6RRbztknd6bO0ZgXT9OSYrTbv3t+/curHFRu4O8jz95tUiqieoP
         vHNi/p4tgV1YfInInevIF2HPgbbhUjBvzBwADGqLrIle6kPQzGq+Gl2U0S1ewKA+4CTB
         bvejykxr2gKfZ7mCx7eGfVk52cjOGya8CC0JE5I6wpbW01kgltfYaKNd5/gQedF0+8sF
         DHT36c8LY8ykycJ1K6s7a5TVoPvW8s1U8aghXSpzSjRpUZz/XVoPRQnxGLYVDgT2kw8o
         XDlg==
X-Forwarded-Encrypted: i=1; AJvYcCUPuwlXJ8Ql+KnS6xMso+BMgSiCDsF5N+2GBKFc7WFVsFNxQdQYFOXMW+QBVEIAdBM8Ov296bjhVH9W/PI=@vger.kernel.org, AJvYcCWO7LKnKc+yanH7b+8vSWj+wswSlyXf5x7FhfP5QEXNZIUR7GRf5yCm5EavU5Rc6yNVJBKlum8bCyPho+pIz2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCGpEekgFh/mkifsPalZFXH78lBSiCXIsDv8d1P1AlQ1wefOxf
	6i8MI1ot+dcvY/jMb6ReWzswX4QTGdojFAW1m56AyuIvE4IV5p7/
X-Gm-Gg: ASbGnctYLMFYWzIghzi3MWTNywwI6z70Ig0weyN2Nn2FGa/AnsY8+JRvfZwQttNq7+w
	9gBK4NK53NMPlfhdQZP8lm2SelSmDRKak/IJINgR99l7aseky9om3yXgqOObi8CjWv8UdzeRlhM
	oWpJjc6tC7w3RS2IiwG3TtPpT7cxLrQCZedqpL4zNvO3yJNbv8HAD+zuLeFG5gkHTMgGBa26sTr
	KGivfuqEdjW6817W84Lgk8oK8taauR7sBQV5dft65HqgLgBHk697I8j/sCNtXF9DEo/jNreEPtk
	MMcL+Wo7ePMqYP2H/nh42gjOy8ZU2UcsOI/hnD//MO0ntbQSBR2pNqsEgZeCcwCU4qKcjYsJp8Q
	N1hKKzFmbuj7dhmmV8w==
X-Google-Smtp-Source: AGHT+IHqX5l/kcuKqLCPF60f6BqiCxTYZ4htKWdJyJeyOLAxTlcGym2HuOu5+eqmF8ESjMtq8wYXwQ==
X-Received: by 2002:a05:6512:4010:b0:549:4ab7:7221 with SMTP id 2adb3069b0e04-54cb688ae13mr701719e87.50.1744282081053;
        Thu, 10 Apr 2025 03:48:01 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d2387d9sm111307e87.92.2025.04.10.03.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 03:47:59 -0700 (PDT)
Message-ID: <dbfad5a9-7e31-4674-b1e4-9d0ad55b64e4@gmail.com>
Date: Thu, 10 Apr 2025 13:47:59 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] rust: dma: add as_slice/write functions for
 CoherentAllocation
To: Alexandre Courbot <acourbot@nvidia.com>, a.hindborg@kernel.org,
 benno.lossin@proton.me, rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
References: <20250410085916.546511-1-abdiel.janulgue@gmail.com>
 <20250410085916.546511-4-abdiel.janulgue@gmail.com>
 <D92VBJWRTE2N.1O4IA5X7I1YFS@nvidia.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <D92VBJWRTE2N.1O4IA5X7I1YFS@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/04/2025 12:57, Alexandre Courbot wrote:
> Hi Abdiel,
> 
> On Thu Apr 10, 2025 at 5:58 PM JST, Abdiel Janulgue wrote:
>> Add unsafe accessors for the region for reading or writing large
>> blocks of data.
>>
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
>> ---
>>   rust/kernel/dma.rs | 85 ++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>
>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>> index a61da5eeb017..880f6f04ba86 100644
>> --- a/rust/kernel/dma.rs
>> +++ b/rust/kernel/dma.rs
>> @@ -218,6 +218,91 @@ pub fn dma_handle(&self) -> bindings::dma_addr_t {
>>           self.dma_handle
>>       }
>>   
>> +    /// Returns the data from the region starting from `offset` as a slice.
>> +    /// `offset` and `count` are in units of `T`, not the number of bytes.
>> +    ///
>> +    /// For ringbuffer type of r/w access or use-cases where the pointer to the live data is needed,
>> +    /// [`CoherentAllocation::start_ptr`] or [`CoherentAllocation::start_ptr_mut`] could be used instead.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// * Callers must ensure that the device does not read/write to/from memory while the returned
>> +    ///   slice is live.
>> +    /// * Callers must ensure that this call does not race with a write to the same region while
>> +    ///   while the returned slice is live.
>> +    pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Result<&[T]> {
>> +        let end = offset.checked_add(count).ok_or(EOVERFLOW)?;
>> +        if end >= self.count {
>> +            return Err(EINVAL);
>> +        }
> 
> Not sure if you have overlooked my comment on the previous iteration or
> if I completely missed the mark, but my understanding if that the bound
> check should be `if end > self.count`. Also applies to the other methods
> of this patch.
> 
Ah sorry about that, just missed that part! But will definitely do a 
follow-up that includes this (with other changes if needed).

/Abdiel

