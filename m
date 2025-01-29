Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A6A19340B
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738179995; cv=none; b=o7me4W8cVmD2TfuVvaG6oB8NVxZnzkLBRxbWFlArOuW7fvpq3sZ2cs9QAjVP5rxTQPHH7+X6ZGxj8c1Y1NDkIDn5iH1qRDv36JHFadp06JgAg+ocg1qqriaQ5KSEcPjzm4+JJa6z0XpgH37Z1hcg2vR5QVBjYvvNfYTQCOVDNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738179995; c=relaxed/simple;
	bh=ZCKhtbbpHa/R4rb/sE0fEZ3548nZnqie1z/puRRtdq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RsYG57llOemGCPrJmYOW6hUdVdcF+ovX7px0YgOhP1s5/siQEbrL81MJoFidMegr3ck5en02HpIWhF9Pgm+aPUMdKd28fuRlAvjQl1Tko/fYMvnJ1i6QN5AJkzOT6krB3zeHK/r3rp0xDigi680r9C7aghl4+UHgU9VIRO+VSik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enoL9ayQ; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enoL9ayQ"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e53aa843a24so1995319276.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 11:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738179992; x=1738784792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xgRC8OeXxOl594KDgwrGWdhbUQ/t+LE/hIy8Z/jf0C4=;
        b=enoL9ayQs8aO4pTPUiIXhk/7EB+/DOZI6KDeKNai1c2bBvkL3udLdvchCm2BGG19de
         MTQyrAM4Ar9xjqkarP4InP1TYauny+9UWJoGUK/VB0VdicxEdWskW5MUw6kW2nkGaopm
         o5prVw2+YHOdvKDCQ+vVz7qhmGdgXqcK0EVAqJJZ1PQQ33jWmf2fDbdHUE17bI1oc23n
         yq2OXV7birMVHFLELfE5DCdwJq4R0nQuPc+wHJI65OXlqXSgvpmByRHLN66pQ+JqExuF
         q9x09emE0Lk/9AZynJy87pkNn39LH1y3Iz+gQ0oMtng3swiP/DSbwgKCifhzdRdKR5Km
         JC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738179992; x=1738784792;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xgRC8OeXxOl594KDgwrGWdhbUQ/t+LE/hIy8Z/jf0C4=;
        b=B6fA4liSDa3b4PyUkaAQWESLZOXy5x3zADSQjrwAgT+6ScV0IAlHeV01bVWd1tX2es
         XFT75dHmBPOK/UGyJYuRf7NH7nsK/xLy/oT3Ueero2vAcHW2j6nXP2yYO9lYKNYlZmw1
         TImO4Pgq9PFmVNji/QUQz7UEi1X7k+UzVjiQdZiyoa680BJ++4xI3I+ChE0uODk2iDd6
         aBRcKbvEljKKEKqGDvTskCfr4WrzHj9XxZx4su+9ZTk1t81r6flfCtFRcfLg4b9YM57K
         Ze8N98yWhAWF0CUf9TW9xFP9C8Ch5MyDaUZS1Atc82QLNt6CZcjenCVudaDICKXSu1ts
         NO6g==
X-Forwarded-Encrypted: i=1; AJvYcCVAVprXrc6e+lCRGWGAMBvYpb0dIaF7Qi4zAM8S1ioi60tjlCKsUFPBsS/vC+iUGAopWCYZcEmx8nOX93E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZn/iZgLeGCPTo9+3iCMUafK4V8oekglg64P801IlKf5VzOdOY
	7Qr17sOQ+SjGOXjokGIzjUfI+TGMQvCRquhbysNlwWsuyHzVLNQj
X-Gm-Gg: ASbGncvITK5b9xszB9Ro8G9Dn93f+ioQx9B8V8DYbHNJ5UGNxT9mzkOnZ9epjUxRv1r
	4YcMkFlBe0y1nYJQWg0ujZxFH9HT3Kat0e/h/JcIJwN4Vtz65PtZ/yLeclDOaZBFiWSa0Y7NoFe
	ANIPKKc7YlxVFxWWdL/qbarQFFup+f01KSMGee2VIzAzZQdEiMrRYKu6gZkgJG2haj3zuAAixDl
	XNpX75GXk/CpDZrfry8hb2GPctT+BE2DvftYM3w+ewALeh8C2QIrd8oENxjoet9ldWL60L/b1Vh
	Gznh1tPNsvwlHSrKiSg=
X-Google-Smtp-Source: AGHT+IGZHZoRwpLASNm1lhdI/ftLWBK3eJ7E8KD+ljLTQamiuyRlOXTcUIBefFe1tbw2L5oeT2CPAg==
X-Received: by 2002:a05:6902:2207:b0:e57:87db:22b5 with SMTP id 3f1490d57ef6-e5ac88a6cdbmr674094276.6.1738179991974;
        Wed, 29 Jan 2025 11:46:31 -0800 (PST)
Received: from [10.138.7.94] ([45.134.140.51])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e583b867f3bsm2594747276.45.2025.01.29.11.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 11:46:31 -0800 (PST)
Message-ID: <4b7da777-87bd-4002-a2a8-b44a89281f12@gmail.com>
Date: Wed, 29 Jan 2025 14:46:30 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource
 object
Content-Language: en-US
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>, Huang Rui
 <ray.huang@amd.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <40485636-7ea3-4e34-b4bb-1ccaaadd4e47@amd.com>
 <62aeac90-1ba6-4e22-9465-fee95973a6bf@amd.com>
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <62aeac90-1ba6-4e22-9465-fee95973a6bf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/20/25 4:54 AM, Huang, Honglei1 wrote:
> On 2024/12/27 10:02, Huang, Honglei1 wrote:
>> On 2024/12/22 9:59, Demi Marie Obenour wrote:
>>> On 12/20/24 10:35 AM, Simona Vetter wrote:
>>>> On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
>>>>> From: Honglei Huang<Honglei1.Huang@amd.com>
>>>>>
>>>>> A virtio-gpu userptr is based on HMM notifier.
>>>>> Used for let host access guest userspace memory and
>>>>> notice the change of userspace memory.
>>>>> This series patches are in very beginning state,
>>>>> User space are pinned currently to ensure the host
>>>>> device memory operations are correct.
>>>>> The free and unmap operations for userspace can be
>>>>> handled by MMU notifier this is a simple and basice
>>>>> SVM feature for this series patches.
>>>>> The physical PFNS update operations is splited into
>>>>> two OPs in here. The evicted memories won't be used
>>>>> anymore but remap into host again to achieve same
>>>>> effect with hmm_rang_fault.
>>>> So in my opinion there are two ways to implement userptr that make sense:
>>>>
>>>> - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
>>>>    notifier
>>>>
>>>> - unpinnned userptr where you entirely rely on userptr and do not hold any
>>>>    page references or page pins at all, for full SVM integration. This
>>>>    should use hmm_range_fault ideally, since that's the version that
>>>>    doesn't ever grab any page reference pins.
>>>>
>>>> All the in-between variants are imo really bad hacks, whether they hold a
>>>> page reference or a temporary page pin (which seems to be what you're
>>>> doing here). In much older kernels there was some justification for them,
>>>> because strange stuff happened over fork(), but with FOLL_LONGTERM this is
>>>> now all sorted out. So there's really only fully pinned, or true svm left
>>>> as clean design choices imo.
>>>>
>>>> With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
>>>> you?
>>> +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
>>> in complexity that pinning everything avoids.  Furthermore, this avoids the
>>> host having to take action in response to guest memory reclaim requests.
>>> This avoids additional complexity (and thus attack surface) on the host side.
>>> Furthermore, since this is for ROCm and not for graphics, I am less concerned
>>> about supporting systems that require swappable GPU VRAM.
>> Hi Sima and Demi, I totally agree the flag FOLL_LONGTERM is needed, I 
>> will add it in next version. And for the first pin variants 
>> implementation, the MMU notifier is also needed I think.
>> Cause the userptr feature in UMD generally used like this: the 
>> registering of userptr
>> always is explicitly invoked by user code like 
>> "registerMemoryToGPU(userptrAddr, ...)",
>> but for the userptr release/free, there is no explicit API for it, at 
>> least in hsakmt/KFD stack.
>> User just need call system call "free(userptrAddr)", thenkernel driver 
>> will release the userptr
>> by MMU notifier callback.Virtio-GPU has no other way to know if user has 
>> been free the userptr
>> except for MMU notifior.And in UMD theres is no way to get the free() 
>> operation is invoked by user.
>> the only way is use MMU notifierin virtio-GPU driver and free the 
>> corresponding data in host
>> by some virtio CMDs as far as I can see.
>> And for the second way that is use hmm_range_fault, there is a 
>> predictable issues as far as I can see, at least in hsakmt/KFD stack. 
>> That is the memory may migrate when GPU/device is working. In bare 
>> metal, when memory is migrating KFD driver will pause the compute work 
>> of the device in mmap_wirte_lock then use hmm_range_fault to remap the 
>> migrated/evicted memories to GPU then restore the compute work of device 
>> to ensure the correction of the data. But in virtio-GPU driver the 
>> migration happen in guest kernel, the evict mmu notifier callback 
>> happens in guest, a virtio CMD can be used for notify host but as lack 
>> of mmap_write_lock protection in host kernel, host will hold invalid 
>> data for a short period of time, this may lead to some issues. And it is 
>> hard to fix as far as I can see.
>> Finally I will extract some APIs into helper according to your request, 
>> and I will refactor the whole userptr
>> implementation, use some callbacks in page getting path, let the pin 
>> method and hmm_range_fault can be choiced
>> in this series patches.
>>
>> Regards,
>> Honglei
> 
> Hi Sima,
> 
> I modified the code, remove all the MMU nitifior and use 
> pin_user_pages_fast only. Under this implementation userptr fully
> managed by UMD. We did a performance test, it decreased by 30% in
> OpenCL stack in Geekbench6 benmark.
> We use AMD V2000 for test:
> use MMU notifior + pin_user_pages:
> near 13000 score: https://browser.geekbench.com/v6/compute/3257793
> 
> use pin_user_pages only:
> near 10000 socre: https://browser.geekbench.com/v6/compute/3496228
> 
> The code is under clean up, I will send out later.
> 
> And I found a another thing, it seems like in intel i915 userptr
> implementation, the pin_user_pages is also used in MMU notifior.
> Code path is: 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/i915/gem/i915_gem_userptr.c?h=v6.13#:~:text=ret%20%3D%20pin_user_pages_fast(obj%2D%3Euserptr.ptr%20%2B%20pinned%20*%20PAGE_SIZE%2C
> 
> Patch set: 
> https://lore.kernel.org/all/159353552439.22701.14005121342739071590@emeril.freedesktop.org/T/
> https://patchwork.kernel.org/project/intel-gfx/patch/20210323155059.628690-17-maarten.lankhorst@linux.intel.com/#24064663
> 
> And I didn't find the hmm_range_fault code path, maybe I missed it?

A 30% performance penalty is consistent with the GPU being forced
to use 4K pages instead of its preferred 2M huge pages.  AMD GPUs
have TLBs that are optimized for 2M pages, so using 4K pages will
cause lots of TLB misses.

CC Christian König who pointed out that a highly fragmented
physical address space is a bad idea if you care about GPU
performance.
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
