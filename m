Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324E528EA;
	Fri, 16 May 2025 07:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381676; cv=none; b=Ri3RVw2FT1J2z4fb30AR/n7piyIJQCgmF9VDwYyjyDvM0nZ/cVNybkm/K4bKWIJaNYN1+ycjdGhYLx4dVRpw6ws/a/ziR3N8pw+J5i0bWtpV8otKBJynOw/lJHxxR09GWYWjeajuVQHKFcHihwTrV5WDXTbgvUkRqL1BSJ7cjww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381676; c=relaxed/simple;
	bh=JJv+HY/5vWYIpGd/62mFaYjJMoxm35ZrwUO6zMwTn30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RyLVWPSN19V+/PISLLBNqj6MPIjTLNMPGWhbGvS3n14BJsrYQD2/cvnsvSBKlQpDr4cnSEpHkvNVKT4wB3DCuqjsjARI/ORgeQ1Lso5KoQdFO8SL3r+OqkR270dO27dpYLEj2LqSseYDPbMzDEy2lSGro41p/pdCxR4JuTOcKRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6Wz+XDP; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6Wz+XDP"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-327fa3cec3fso14378101fa.1;
        Fri, 16 May 2025 00:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747381672; x=1747986472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrSq6+VEuHJsRGf8myadx7zoK3k+PF9pl61CnGWQF0E=;
        b=e6Wz+XDPbftgG5+IeEhnFo8bvHvOVz6Yt7pDomFutuLTF+r0MaFuTG9eP98bKe49gI
         Butq+KuAmE9nGq9aFdtqYDMn9xJmvG6WXGmWD7VnYLax8jOpE5YcPkMxIDVhaVWZCBkt
         Jb5AvnsrVrGGzfM5LzXaTTNuDbeXrlRLYOX/AI2o4K+/sGohCgxMUcFz8T3ke0d+2qse
         GqCSlyX0cWnfXEvswH+ITmOVvashakX2mVIePbggnSdLse7lCqfEKEEScSZ0HJBa/SpU
         NcmQFqgwnJ0KHtCA4VDgBmnQLlBuYXG7ncesYG1WvY1V9KYGzdaUfTaidVuTjgm8svgJ
         O/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747381672; x=1747986472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrSq6+VEuHJsRGf8myadx7zoK3k+PF9pl61CnGWQF0E=;
        b=J3wwLpr4WKy/6d4P3xOKfZXGNKJl9Yljhx/MHHtWDPeWpYb2bqSX8Yk32xbjfRAzzi
         Vi8pEMOrG+1+X5ubbLLiY3320+1s1WFMZPR/Y7w6GpOqo1L+r/BAQmoCgRtKrq+pCgg2
         ZIdaymt1zrZsBJiYr0ekWbRP4cTEzZsVRSF55Yzd+4TePWhmdEUv5BT2VFn8mkKIQxv7
         qAUFeTsdWfOPyBLjW6WYM0YBi3uA7eoWGCZdXJMqHsxk/dVz4jvtFh60DfImPq2GNGnq
         4yRxuTvJlDYNj7SIp9o8oUKDKJygc3M0cvAb01GP5HOrK+yy3MvyuXqNKvj0GYBbbOTI
         LTvw==
X-Forwarded-Encrypted: i=1; AJvYcCUiVSpvNyMmoT+Ld98LcsYoiU84YASz7teAebm3egSMI5khfrjHntFI8nuZNslhMDpqRejCgVm7ZaqAFG1Laa4=@vger.kernel.org, AJvYcCXR6Dr7lytSaXm4r/i4+indcwO4YXkcqnG7wFm7vi2hZIMe8xztW/6IWhRpuKcWrpA88wTO9tL6egvS9Iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaxH30WFddqpBmVGfF4FZze7N3WrNSsWHk4Qq4HiHbsFA9V/Wz
	B34qREHAFCSiTowP+EHiYaqKKCFpoLtASz7W7dgoiK83mOHl92raSlZY
X-Gm-Gg: ASbGncveLvkHj6pI0sxxkGpI/lXACrB8KZzZqkS26X39F8jbiJ/rUQpauyD0oQpyWR5
	5X9Ph9vbbrbqEXiEbiUytZGevr3UbuwLQlAcJvhyIXq+wND5J+q6jzaYhbOsKa2SA9LaTHGFvS6
	ZuyWmG57L8TmlyYU61kuKg1mK8Ls017ttfTjYWm7LLN6oDcvdx4GwPw8KU0f0a9jfivsDlpt35z
	pLcozxFxYMEsExogXYAbp1TXWWfIDDKOXmVqlYbmOzpdQijJeV37cESa1HTChd+QpjL9rnWHYvd
	GQ8OKGhtsVhzOBByG0v6pGvviQ0AtVtMOA02UQjLMiLc8EswaNFTlBFhBGS7BEwg5hK5FydHv4c
	BcQ7mWt03KQGpN4FuWH3PdQpljUj/
X-Google-Smtp-Source: AGHT+IEPAgCtEoMT1Dy9PWUXsMfinArPefbdmYY6hpI3rekR9+YayzJUONasdrKBVzwoDgBWCdjimA==
X-Received: by 2002:a05:651c:110e:b0:30c:160b:c76c with SMTP id 38308e7fff4ca-3280773721cmr6106691fa.17.1747381671858;
        Fri, 16 May 2025 00:47:51 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085d11desm2818681fa.96.2025.05.16.00.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 00:47:51 -0700 (PDT)
Message-ID: <e9ce5d1e-1465-4a0d-97f4-0495e02c8189@gmail.com>
Date: Fri, 16 May 2025 10:47:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] scatterlist rust bindings
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: dakr@kernel.org, lyude@redhat.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, airlied@redhat.com, rust-for-linux@vger.kernel.org,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Petr Tesarik <petr@tesarici.cz>, Andrew Morton <akpm@linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Randy Dunlap <rdunlap@infradead.org>,
 Michael Kelley <mhklinux@outlook.com>
References: <20250512095544.3334680-1-abdiel.janulgue@gmail.com>
 <78DB1F66-9DF5-4679-ADC4-177BED5D4FDE@collabora.com>
 <CGME20250514070104eucas1p1b2e420e8827d55521bd9aca3e1341ee7@eucas1p1.samsung.com>
 <77afb898-fe6e-480d-9b7a-05cc31d8545b@gmail.com>
 <8eedf638-9fa5-470e-976e-9b18971f7b46@samsung.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <8eedf638-9fa5-470e-976e-9b18971f7b46@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/05/2025 15:12, Marek Szyprowski wrote:
> On 14.05.2025 09:00, Abdiel Janulgue wrote:
>>
>> On 12/05/2025 14:19, Daniel Almeida wrote:
>>> Hi Abdiel,
>>>
>>>> On 12 May 2025, at 06:53, Abdiel Janulgue
>>>> <abdiel.janulgue@gmail.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> Here are the scatterlist bindings that has been brewing for a while
>>>> in my
>>>> local tree while working with Nova code. The bindings are used
>>>> mostly to
>>>> build the radix3 table from the GSP firmware which is loaded via dma.
>>>> This interface can be used on top of existing kernel scatterlist
>>>> objects
>>>> or to allocate a new one from scratch.
>>>>
>>>> Some questions still need to be resolved, which mostly come from
>>>> the DeviceSGTable::dma_map() function. Primarily, what if you call
>>>> bindings::dma_map_sgtable() on an already mapped sg_table? From my
>>>
>>> Perhaps we should introduce a type for buffers which are known to be
>>> mapped. Then
>>> we can simply not offer the option to map for that type.
>>>
>>>> experiments it doesn't seem to do anything and no indication is
>>>> returned if
>>>> the call succeeded or not. Should we save the "mapping info" to a list
>>>> everytime we call DeviceSGTable::dma_map more than once?
>>>
>>> What mapping info are you referring to?
>>>
>> Basically the dma_data_direction enum and possibly `Device`, if we
>> decouple SGTable from the device. So this approach would mean that
>> every-time SGTable::dma_map() is called, unique mapping object(s)
>> would be created, and which would get unmapped later on the destructor:
>>
>> struct SgtDmaMap {
>>      dev: ARef<Device>,
>>      dir: DmaDataDirection,
>> }
>>
>> impl SgtDmaMap {
>>      /// Creates a new mapping object
>>      fn new(dev: &Device, dir: DmaDataDirection) -> Self {
>>          Self { dev: dev.into(), dir, }
>>      }
>> }
>> ...
>> ...
>>
>> impl SGTable {
>>      pub fn dma_map(dev: &Device, dir: DmaDataDirection) ->
>> Result<SgtDmaMap>
>>
>> But I'm not sure if there is any point to that as the C
>> `dma_map_sgtable()` doesn't seem to care anyway (I could be wrong with
>> this) if the sg_table gets mapped more than once?
> 
> 
> Standard DMA-mapping C api doesn't have the notion of the object,
> although in case of sgtable structure, one might add some flags might
> there. Originally the sgtable based helpers were just trivial wrappers
> for dma_sync_sg_*() and dma_unmap_sg() ensuring proper parameters (and
> avoiding the confusion which nents to pass).
> 
> It is generally assumed that caller uses the DMA API properly and there
> are no checks for double dma_map calls. It is only correct to call
> dma_map_sgtable() for the same sgtable structure after earlier call to
> dma_unmap_sgtable().

Thanks for the clarification! I think this double mapping issue can be 
solved by the suggestion presented by Alexander Courbot.

/Abdiel
> 
> 
> Best regards

