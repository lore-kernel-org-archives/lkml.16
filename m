Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E5621CA04
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 18:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748630074; cv=none; b=iJx5uqxHa75R3f8mPGQhtjnunCoMclQbnKH291U5O5hXXjqu79NjIctQXsnzVsSIgUDpFUssx7mV9dHep2AT90KG2sjO11M155F5N5kxQGpsK5gFZgkPE6v3xhtWzCctNM0+AY/kIvPDqrkBj+ll79yGByo7VXsbWePx12ezxLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748630074; c=relaxed/simple;
	bh=I1qweUxMwQAMZdMw+/xS2F03mtwGRw6sAEvVJaWkHio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pnWQxud6h6g7Fb/iVq6ECTRSmGEi9t7t1K5ulTljqIg6x3tEQ17mGfe1UYVg9nPC3wyxwrMhyBhKS69jJxNhy4PZaouwQtLjGKfYNY4DbE6SYaAuPBrXzgSpiBDKNhoESaKPcWlrGB7k3Jgg8xpCaKcNvetOMBK2lf5JVawW72Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KAGxV9in; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KAGxV9in"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748630070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BZV+aBQAgS7/ANJw8jO7o/sxZUwh/psYla57JLFsPxM=;
	b=KAGxV9inE5/Ad9eK9exQXosFxBLBVp5BrCo6Disa0nZkaQ+Y2HGqNOnF7wIsVWnUBSyXWL
	WvOTYjD+j3BIE8i0/KTr5dRHK3U1LcYtHlDQvAPlfUNyG8TpPCs2l4xEPNa13e2g1HShTJ
	UgRTewc1zA6RW61xd3c/HIZV+QRu7f0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-zZ9BcUnpPE-h1ppz4qJZRw-1; Fri, 30 May 2025 14:34:29 -0400
X-MC-Unique: zZ9BcUnpPE-h1ppz4qJZRw-1
X-Mimecast-MFC-AGG-ID: zZ9BcUnpPE-h1ppz4qJZRw_1748630068
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so18512035e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748630068; x=1749234868;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BZV+aBQAgS7/ANJw8jO7o/sxZUwh/psYla57JLFsPxM=;
        b=IRInRjFzZ3yOA7oph9rwx07vHwVaBTPr/xHuO/8lBSN3m3trMwH1VTMDgzEfGWa4JX
         1yDZXE9ZjaA2uj86CnpM7Lw+3BhfLF84DNXIsnECFTNW3Ts9YTc3haJ1aCj+M371c5kU
         ToB+V/ZMJCP0d/bERQ3+kExalYTEMiHKZz0KKoSifCThXfqg2/V9C4ARv2mybxrvBI/Y
         ftsQWa4u3a3XkV1com4kkHjFKXlFeIXi8fUB2KDXCgmjTVem35wBg3cn1j3BLp8uA0DN
         +z548r/ZW8D372C2Prqfc6TgW2s8ccVKNJBxOYHAAgdotkTAayuKofMPFlOvjIkJY4lc
         KQdA==
X-Forwarded-Encrypted: i=1; AJvYcCWBw9UOESA2MtfNdm7kHlQrfk0lEGNojC527uGTFxDPtV2JaCPh1YRnkXgEMLfiyOfNscmABhIlJpEMStY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPYoSKQKyFRL7iwBMuOi0iSSCUnLt5T6n6zhwf8Ome5Nrc1kdj
	z+56D+ow2LyKqadkXbhoq9aHa/4hQXJybmSO/RNxkgs9nOJbvTi8unITak3PEuNAXpqwDT+hgdQ
	20I1JElggcfQyrsRYzdc1l5kMPsL5DeugWAqbta4JGxKvAhMQ0rahBcnyfWwLRdAG5Q==
X-Gm-Gg: ASbGnctdLNzFOHaw0WTVx+e5jFuMO3hQr24VYXZW7ccsFxxEZPKL0g9CAHorHAfcVBH
	pPPoqDamoeUcS5uG7YrMYOfNK6Iz02iMVkHqrLOo3wGVJJcN1sTWQvOAWjW1wE/3/2WDOo1RhiP
	u2q8oNAyEq/M8hW3HoRSueVOwd44jHoKttkUiRutYEpooBwtnTCrv9DTrZTthAc8NMu02uyq29r
	NS+Ws4Li+TvKDrIGuOWFzjjG5BddiaghktZ3yuxbaxVdygfSxa08GaeNZtjN92yrcRZlT7H2hrX
	WsqPEYRWs7PoObvOyhc6BHPp74dJOHJAXg0RCBOH/pD9sp/mKTZOnFgoYwQuWg0mnca6Lo7Vgol
	Jkuyq0i47ss0zFZHQTF5ziv1DAJC1oakw0omGug==
X-Received: by 2002:a05:6000:1887:b0:3a4:dbac:2dc1 with SMTP id ffacd0b85a97d-3a4f7ab16abmr3314061f8f.54.1748630067778;
        Fri, 30 May 2025 11:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4NVAy54+opBF8sRLwzv0VdyKtt7A/mCOnZq+cWe/C5ahGQFGETuXDqBFRVgMWhKZdHhATMw==
X-Received: by 2002:a05:6000:1887:b0:3a4:dbac:2dc1 with SMTP id ffacd0b85a97d-3a4f7ab16abmr3314043f8f.54.1748630067437;
        Fri, 30 May 2025 11:34:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a1678sm5475714f8f.99.2025.05.30.11.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 11:34:26 -0700 (PDT)
Message-ID: <0dcec9f4-eef8-499d-a96a-dc6ab3433039@redhat.com>
Date: Fri, 30 May 2025 20:34:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: Oleg Nesterov <oleg@redhat.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, lorenzo.stoakes@oracle.com,
 mhiramat@kernel.org, peterz@infradead.org, Liam.Howlett@oracle.com,
 akpm@linux-foundation.org, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 pulehui@huawei.com
References: <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
 <57533126-eb30-4b56-bc4d-2f27514ae5ad@huaweicloud.com>
 <cba0155e-d2b9-41fa-bc51-f3738ae73cff@redhat.com>
 <956124be-c73c-4023-9edd-25372f3f865a@huaweicloud.com>
 <ccf359b0-8baa-4209-b2c3-75e3813ca804@redhat.com>
 <20250530180920.GC25160@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250530180920.GC25160@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 20:09, Oleg Nesterov wrote:
> Well, let me say this again ;) I can't really comment, I don't understand
> this code enough.
> 
> That said...
> 
> On 05/30, David Hildenbrand wrote:
>>
>> I wonder if there might be a clean way to move the uprobe_mmap() out of
>> vma_complete().
> 
> Me too.
> 
> Not only the uprobe_mmap() calls in vma_complete() doesn't look right
> "in general" (at least to me).
> 
> To remind, vma_complete/uprobe_mmap/install_breakpoint is not even called
> in, say, this case when VMA grows and moves. See
> https://lore.kernel.org/all/20250526173845.GC4156@redhat.com/
> I guess we don't really care, but still...
> 
> 
> But just in case... I agree with Lehui and Lorenzo in that we need a short
> term fix, and the last patch from Lehui seems to fix the immediate problem.

Oh, there was a new patch yesterday. Too bad I wasn't CCed on that.

-- 
Cheers,

David / dhildenb

