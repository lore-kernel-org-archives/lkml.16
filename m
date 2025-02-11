Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E227D1F0E4C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265307; cv=none; b=lTPjtY1Uud4KiJR5Z4DXoaJQaEwCao+cXgHK9nRqHa0q7hHZcIATAF2fKpQd/MX7LBN86+Os7nkV0ThsKIHQYWcoBknxu4Tt0wS9I8jt9ij9qvMi0RvH9OLFUezATyWmL0E1MprNvVoatX46PB0PNODPHekG4uBwvwg1O7I2V98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265307; c=relaxed/simple;
	bh=hOdph4K2ZakFuSjnXv25/ZSjgtjSbeOb0GeohJ9FzVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nY7OeLwHt6yLomcpsbrQ74N/IJlRsjvPVfJUoDqhcjH/aTCDyD3W1NXfB891P6eSoUNx3h0cF0QQY/iQ2KKLDlG9rIHXIPZ9CKnjbBk5jBiWYL/lPmpLqem7lRRhUHK6Gb07TOj9oocTbhXp88FPPvkVMuGyosmWFs9GpR75YM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uem9LCJS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uem9LCJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739265304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E1CgnQdw1MTcf+E2KOk8fQeB+zJoMsB5cCPEscDizr0=;
	b=Uem9LCJS6IaLGe1i2sObcgRN+w0CbCsXcTW9aMjJem4hr57ecEuf9ALCfUqqd5EpCWrZMm
	F2DXvYmTogVOucBEb40gLjaHqlw5Ggk6tLnOeUL5+Vw+h9llYt5V6Z3dwezqaweRmh9FEh
	/nf1PexieNpkun7Y+P12RIbPGMiaqlQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-VH92cu8HM8mteB7WtA6uSw-1; Tue, 11 Feb 2025 04:15:03 -0500
X-MC-Unique: VH92cu8HM8mteB7WtA6uSw-1
X-Mimecast-MFC-AGG-ID: VH92cu8HM8mteB7WtA6uSw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38dafe1699cso3501291f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265302; x=1739870102;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E1CgnQdw1MTcf+E2KOk8fQeB+zJoMsB5cCPEscDizr0=;
        b=tdEuNHMqOP03WB/j+iVJ7eAj6+iGuSp+BZb+4npX128LplTJH/8raF/oq4PUmMZkDy
         jhS3wKWNjigBt7cEtFwAAvZWR02QEJUuHGranPfUPDbMKiQiTIl5uKY9zSEqfdCWY18p
         Qg7nIul7Q7dQPF9BFVfAlw6q7S9auPl+OJZ+Kv7cWSnPK57liqZhHXPxexsxIoQnbQbD
         3dqwBDSHYYwUiw76ZQHUEuTgXW24PBkzOTHwosm/Q1bz2H0unYH00EsOMX5WMOs9Kzem
         t5QSy7vHHxgaDjl5FBGXET92mypc800QrA/r2XxJDsYozNHVe+PyA+3d0VEG1J33qqn6
         aWhg==
X-Forwarded-Encrypted: i=1; AJvYcCXKctpdSpMS5xumd5Z365GYmvg8E0ELXTHz3TZXIV6Lfj4bsr6ttfrhp/hzqlL/3WE+jfsTMkoDIDsKJsM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywz18lcTICzikTJrsNNGPCUxYfDMAPEab3OtOuaJanKjuPOHLc
	NdsIB4tkQBu+TP38dyarMBGJ/jxp4sQlBIZf1iSRlZAa7Bh+hBpLSuFsqUsQog99hDsJouE99Sa
	HV2+nPFs0bZOENEHCNxiW2cUNSocDqK0YexrOCzS9vzqQtprpOg8zOGDxuS9x+Q==
X-Gm-Gg: ASbGncuRlQ+bvmMec4AnhIbNoa0Uk3m/E18cU3odvZH62FWodtAXZfwdqA4IDZph47w
	8JRn3lltM5NJGx+Ga0cn+DYGDsS9roul3cQFQlJqWVGEwH8xyshfKgB3BvD+XyWmlP61iSU4Ieu
	ymnk+ImmctFuLVWRPCEVNvIGkNWyg3y5x59vpP67J7UCV3qh2jsXBzX1L8H0PWAP2RSJs+KsX0h
	uhTJXNgVuy2NCiT8Coa9Dd+M023JVk8yAnb7QQ2a6kUmqnqrjPjPJ/YjJyBQvZDzlzpq02f38y4
	kvdpchqaImplGi3zA/w4OZ2tmE0xBsAR/LeEjhc=
X-Received: by 2002:a05:6000:1542:b0:38d:d0ca:fbaf with SMTP id ffacd0b85a97d-38dd0cb6ab6mr11005429f8f.18.1739265301871;
        Tue, 11 Feb 2025 01:15:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnGH0ZBSQ+Wzhz9/JFNowdyf3Qf4gToGQ631475G7TwcMk0H1baA5CMmZ0j/EuTEWFXmGQmQ==
X-Received: by 2002:a05:6000:1542:b0:38d:d0ca:fbaf with SMTP id ffacd0b85a97d-38dd0cb6ab6mr11005389f8f.18.1739265301453;
        Tue, 11 Feb 2025 01:15:01 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4d826c6sm8823110f8f.69.2025.02.11.01.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 01:15:00 -0800 (PST)
Message-ID: <34bcf011-b4ac-479c-92ce-852623e73039@redhat.com>
Date: Tue, 11 Feb 2025 10:14:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25) during
 compaction
To: Qi Zheng <zhengqi.arch@bytedance.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Ezra Buehler <ezra@easyb.ch>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, Vlastimil Babka <vbabka@suse.cz>,
 Ryan Roberts <ryan.roberts@arm.com>,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 open list <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
 <Z6oxUdrVBPd5ZTEu@shell.armlinux.org.uk>
 <5d50d714-197f-44c0-94e0-ff70ee51e866@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5d50d714-197f-44c0-94e0-ff70ee51e866@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.02.25 04:45, Qi Zheng wrote:
> Hi Russell,
> 
> On 2025/2/11 01:03, Russell King (Oracle) wrote:
>> On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
>>> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
>>> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
>>> dereference resulting in a kernel panic. The culprit seems to be commit
>>> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
>>> Reverting the commit apparently fixes the issue.
>>
>> The blamed commit is buggy:
>>
>> arch/arm/include/asm/tlbflush.h:
>> #define update_mmu_cache(vma, addr, ptep) \
>>           update_mmu_cache_range(NULL, vma, addr, ptep, 1)
>>
>> So vmf can be NULL. This didn't used to matter before this commit,
>> because vmf was not used by ARM's update_mmu_cache_range(). However,
>> the commit introduced a dereference of it, which now causes a NULL
>> point dereference.
>>
>> Not sure what the correct solution is, but at a guess, both:
>>
>> 	if (ptl != vmf->ptl)
>>
>> need to become:
>>
>> 	if (!vmf || ptl != vmf->ptl)
> 
> No, we can't do that, because without using split PTE locks, we would
> use shared mm->page_table_lock, which would create a deadlock.

Maybe we can simply special-case on CONFIG_SPLIT_PTE_PTLOCKS ?

if (IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS)) {

...
}

-- 
Cheers,

David / dhildenb

