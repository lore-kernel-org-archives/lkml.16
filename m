Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61A41F1524;
	Wed, 14 May 2025 07:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206063; cv=none; b=DC7XCSCJgkj/Z4M5jLGjGWqaQ9ZkHOznw5wC6iM7XnkKYSOYmNDndsCmQ+g13JP9sQJRPRh/iq7FR5RbOSO8jCQFpz047QnzmVCKiPFt0eA7QiPwzxmU+w8ZYLwUg9kf+5Bx956Atk/2wJgUzlPH60qZuEFYhccRJaRHaL8JZAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206063; c=relaxed/simple;
	bh=00TG9hraW+ho4aYNxAKghUbX1JBVLpm/zp47GHTcitw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cThG7r4rm3Ez9UhC6x7fM4SOPmPmKluINqIEMfyNaU4W2vno8nUoc13/sk2llb3q8RT2BjkPBUCPfa3EOAXuj5RgDNMUnbw0LqEpyP4gjzSDNAN95CcOgqYtIRaHCdaNqrF6gl88eykOBYOx/UzcSbvfyaEGjFftpjk3FmyBrHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPBehcNK; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPBehcNK"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54acc0cd458so7128138e87.0;
        Wed, 14 May 2025 00:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747206060; x=1747810860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e4UWq00FQ3wfcO8+cSz3Rl5HWcj+xSQgpD/JijtD+sU=;
        b=YPBehcNKbzjobQyqhRAJSyjd7U2srH1qw3sKXU9irKjZ8Pm70t9KH3qviwH3xSHULf
         zypxvWTmVla8+BDbjHYDSHNXfSfZ80O0BOo4c6tKm2VYKw02SV9G+wh8yI4Q8Q5Ppo7n
         qrTvBkbSmj0eJmPoEerHMsD31HZiBKS2k4IIbq+PN3HfdyjFkDFxRD2jUevo821HOFw9
         zkc4EIPt2v6ARxOi09Blm7tGWvNhJVcTP39y3w5i89U+IMMPnJ+aYzRG6X5YfkpzruUt
         cSeSB1ymUk3PCmeHU332ojNn+Czc2zFboOTlr+m2VVoS5JVfIGI/sWGLO9kNybpS5Z5w
         q3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206060; x=1747810860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4UWq00FQ3wfcO8+cSz3Rl5HWcj+xSQgpD/JijtD+sU=;
        b=pslAg+o9b5LDGfRXz3N3QTDYG62bTj9qd7QGM7rYHMKSOm81AYmS5e5eCMWZqGU6jD
         W7SWEn2DZtyHkRyixGgAc5JYHiSmhD/HwUThpWScOVN4sJJtaSGgBd8dP3kZxR/v1cUE
         Z2Bf3VMYgYWgt542M0ZkdE88WqqH9RbwhYmUYkGLCO7KTZXviYsWwWndp2fkvIU2T7OB
         JzqaBmp3Ic7+QUGa97op/2nsoup+R/8EVvOPRKB4AS2sJjYIdTdlz4Rjj8v0GKBfDLXW
         XYXv4zyMZJ7854qGrsdVHrYBuSxnlaR25QKNBQe4hxUZHuuStoJgP7e3Ko/T9c+uKgMB
         Hx1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPzC6ETVycgO//9Iz7aNc/IcSVgIvGUpV7K2F6nbl93g0VRE3qO4lgMLxd2VDx4Q1/BDkiY2AzBKNAl6I=@vger.kernel.org, AJvYcCW9rGi75p+SX7OYsif5oc3OnJvkZKTDIky834UtJVgqWRytuu1EbiF7Y894TXmz9AknT9K+KDIBjMjxUybrLKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGnHhMmmtcLL61OGsyHG9cX2Ho4l0MkGOLRuaNlJht+TWUYtmd
	ekPo+DYj5t4UdPWQHsutyKycDU1qRT8VQiUcVpJ89UffdAuFwNcs
X-Gm-Gg: ASbGnctsaQKzUM7nrAYEN6ifwexYWQdvydOqmtt+wthTTVnI2mh3gRPMWJpPDele0R6
	bmEgcu0HtG98L8GTbMkb6svNNGC3m+/oxC3wXEvhq1iipu5JMjhLCtwQqmVJ39gU3revoNy4RmI
	Jd84Y81ivR/pb4hEwu9uxbTTEIIijb+EDlianRtThM4a7gpBiuoRHnx0+5j1EPW9VyjkeWFn5I7
	D67afmK1eWs5sWEp+sbpiVFg/+0v5FdYlt0eLsmFvnGbgfC9K4B1ARpLbr1gdZsZKgYSyQHuqe1
	/l+X+bEwkhExxOjUkI76iI1Ki0Ed4HqW7m2aYtHxo0P4qmYMu15zx/p3MCJY151L+jaWdT7lxSN
	n4k32ppK0n1E393QUSmGlhrRE76xpANkOe1I8w4k=
X-Google-Smtp-Source: AGHT+IHFvZG1KdFnKOihoApsIRTLV2xT/k/MQynT2nLT5kj+9wfpveOdmyHEDnx5dVQDVckkFIOS+Q==
X-Received: by 2002:a05:6512:6c4:b0:54f:c57d:d25 with SMTP id 2adb3069b0e04-550d61ddbe6mr762503e87.48.1747206059504;
        Wed, 14 May 2025 00:00:59 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550d747b54bsm145249e87.216.2025.05.14.00.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 00:00:58 -0700 (PDT)
Message-ID: <77afb898-fe6e-480d-9b7a-05cc31d8545b@gmail.com>
Date: Wed, 14 May 2025 10:00:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] scatterlist rust bindings
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: dakr@kernel.org, lyude@redhat.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
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
References: <20250512095544.3334680-1-abdiel.janulgue@gmail.com>
 <78DB1F66-9DF5-4679-ADC4-177BED5D4FDE@collabora.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <78DB1F66-9DF5-4679-ADC4-177BED5D4FDE@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/05/2025 14:19, Daniel Almeida wrote:
> Hi Abdiel,
> 
>> On 12 May 2025, at 06:53, Abdiel Janulgue <abdiel.janulgue@gmail.com> wrote:
>>
>> Hi,
>>
>> Here are the scatterlist bindings that has been brewing for a while in my
>> local tree while working with Nova code. The bindings are used mostly to
>> build the radix3 table from the GSP firmware which is loaded via dma.
>> This interface can be used on top of existing kernel scatterlist objects
>> or to allocate a new one from scratch.
>>
>> Some questions still need to be resolved, which mostly come from
>> the DeviceSGTable::dma_map() function. Primarily, what if you call
>> bindings::dma_map_sgtable() on an already mapped sg_table? From my
> 
> Perhaps we should introduce a type for buffers which are known to be mapped. Then
> we can simply not offer the option to map for that type.
> 
>> experiments it doesn't seem to do anything and no indication is returned if
>> the call succeeded or not. Should we save the "mapping info" to a list
>> everytime we call DeviceSGTable::dma_map more than once?
> 
> What mapping info are you referring to?
> 
Basically the dma_data_direction enum and possibly `Device`, if we 
decouple SGTable from the device. So this approach would mean that 
every-time SGTable::dma_map() is called, unique mapping object(s) would 
be created, and which would get unmapped later on the destructor:

struct SgtDmaMap {
     dev: ARef<Device>,
     dir: DmaDataDirection,
}

impl SgtDmaMap {
     /// Creates a new mapping object
     fn new(dev: &Device, dir: DmaDataDirection) -> Self {
         Self { dev: dev.into(), dir, }
     }
}
...
...

impl SGTable {
     pub fn dma_map(dev: &Device, dir: DmaDataDirection) -> 
Result<SgtDmaMap>

But I'm not sure if there is any point to that as the C 
`dma_map_sgtable()` doesn't seem to care anyway (I could be wrong with 
this) if the sg_table gets mapped more than once?

Regards,
Abdiel
