Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F165141C64
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245531; cv=none; b=ASksKY5h4WXdJGs939I1b+z8nsQBd8Tvz+W1P36+VNetBgiadaoatBtTDlSNi2nMCNq6mwaykUYxBPn4mNUeKSdptWmel4S7p19h88Q8q8ZznVh9QhKLKWTJXdCiju+c4D6Dm3wAYy6PjjpKZnLC7dgF2XSg09XLmsNsYUYlztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245531; c=relaxed/simple;
	bh=5CkWKjN5+8f2fNdmEHJYXDfBbIvNsU74dfnhD1oJdSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxcNWkSmWobarlrNZij+kD2nuNJkDZDH4yZgpY+5zCXR3FQhOAeWYfZ2LiST0lF72EZ1Vv6RSnQ0nJlLGxYt/LdcRKCacNNIIAKZUGlKY6hFu1Pou+wJ1c2kq8caiEwxSsCn+doPgS8KzmLyWjFo1x0h3y8il5uMYNXcOHG+zdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cVvp3yAO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cVvp3yAO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f6022c2c3so47285425ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739245528; x=1739850328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZuCVGHj2siA1FeN0jM50/1UWhVlGr3BCjxNx1sMgmQ=;
        b=cVvp3yAOSFN1RFMVGKgQTxBIQ1BwXyY2bMGb7FuuGBd1kzJK7MlPv7cM4S6ItEU+10
         lLLkfd2LHJZjfEPRESzgNKser7XSjBodTFX7t3TUHe2luNNbM5RIWGupAHyO8yStpa/f
         RKb94KXcSDd/0jwWGlrisBzBD1VLuRwXim9AVZe/efiAIyh1WA63g62s8PutAs5L1qd+
         UqN2AC7EvCGl6djsjA+j7mEwV0/gcUY60sn//oc6KLKZM7fdvcoiQzS3Xa9bHOIsWqzx
         5Kf1qv+KdlMI5jdzMNBnFsl3YyUz/Lh9catJKBE7EniiuG9OKPtEZxEWWX90hQu07y8f
         04yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739245528; x=1739850328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZuCVGHj2siA1FeN0jM50/1UWhVlGr3BCjxNx1sMgmQ=;
        b=ZtamBHCnls85lPTu2NX+a4rglQiyEfv8iilAhm4t5LVImawbMUE7BwxouCWerc9byv
         DR7nhK6IYPw8yqztqtItzpOkqC/5PgtAurJvOWHHkena5CnNSsPJNRh8omcQAc0eig0N
         0aPWn2vNyQb5Sb1DdeR7N6hNJ4oE9vp7vZ1V94Jfq8JiL1UCqlKXgn8v7QPOaH9xU91F
         hfPOZ9n4qJoG1SVKjDwdMpskUtC3SUzRPGvBykRJeP8+dKkGYLsHHpB+rd7+mJXyoEgS
         zweNIJbYWhxulpSxK7PAxg0rf7gc4B24iR2Sx8WazDocZsT4FhNxEHQdxzZbBqkGO+vf
         9Xnw==
X-Forwarded-Encrypted: i=1; AJvYcCWFMglz90z7Ubd9M2cuj+CrL7T4YW31lZWmN84bbzcGT9z+LOvEgczeMUTZGRRUYJnY3X6i6Y/5qq6zR9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9V8omDClx7MWjpmhafjgLTyjINcmrBA7Vz9Sz3KosqJwOg6Eq
	E6ZPbNaGJd4Go3/y8oE6+hfcAa7fqA6GN5YOhf9VzDEaWJ+XkYxDFupBtkb8PVY=
X-Gm-Gg: ASbGncsexpBvtnPngHd0cwdWlI2t8tDKK3rRxGAR/wLTvP8TcUFWXo/H/EWKkhmo7JR
	uohE5on0Vua6uodF0ceqyOy2aw3AhS2gpDR6dYf9l23tvghhLymHT0W7pHS2gYScVWnRgwmmJ+/
	23QsEsxsgE39Aq7SXgeMeExy94kmUBXaWdR1trq7I6UjWo+QDlNZWJebbl0cQYQnIIQWa474T/g
	wACXaFLgdI2PKm426PP+6BoKwbOpsRXzVKnkxV5h1N713YHMSkvxnp6eIdQTaYE9FhXbUZAM3gC
	G7ZGdJWrUDQK3BvPVXzftuKuKvyx1Vg56CnEU7PGUA==
X-Google-Smtp-Source: AGHT+IHDT5ZHgM+82fxxyVFS+emJuJ8X1+3KqM06GzB5RQUXgFH/rG4FkcHvF8IbgaPTrjU21R58hQ==
X-Received: by 2002:a05:6300:6713:b0:1ea:f941:8d8e with SMTP id adf61e73a8af0-1ee4b7260e5mr2764148637.16.1739245528143;
        Mon, 10 Feb 2025 19:45:28 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7307b967019sm4702806b3a.109.2025.02.10.19.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 19:45:27 -0800 (PST)
Message-ID: <5d50d714-197f-44c0-94e0-ff70ee51e866@bytedance.com>
Date: Tue, 11 Feb 2025 11:45:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25) during
 compaction
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Ezra Buehler <ezra@easyb.ch>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
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
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z6oxUdrVBPd5ZTEu@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Russell,

On 2025/2/11 01:03, Russell King (Oracle) wrote:
> On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
>> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
>> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
>> dereference resulting in a kernel panic. The culprit seems to be commit
>> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
>> Reverting the commit apparently fixes the issue.
> 
> The blamed commit is buggy:
> 
> arch/arm/include/asm/tlbflush.h:
> #define update_mmu_cache(vma, addr, ptep) \
>          update_mmu_cache_range(NULL, vma, addr, ptep, 1)
> 
> So vmf can be NULL. This didn't used to matter before this commit,
> because vmf was not used by ARM's update_mmu_cache_range(). However,
> the commit introduced a dereference of it, which now causes a NULL
> point dereference.
> 
> Not sure what the correct solution is, but at a guess, both:
> 
> 	if (ptl != vmf->ptl)
> 
> need to become:
> 
> 	if (!vmf || ptl != vmf->ptl)

No, we can't do that, because without using split PTE locks, we would
use shared mm->page_table_lock, which would create a deadlock.

But it seems that we cannot simply bring back do_pte_lock() and
do_pte_unlock()? In make_coherent(), we traverse the vmas and exclude
the same vma, but different vmas may also map to the same PTE page,
right? In this case, we still cannot directly hold the pte lock.
But this part of code is quite old, maybe I missed something?

Thanks,
Qi

> 
> but I haven't checked wha tthe locking context actually is here
> (I've been out of MM stuff too long to know this off the top of my
> head.)
> 
