Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBBF2E41E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378618; cv=none; b=ezhMGBSkXO0ZgbsK4hTt5QRj0A6HKvIzT2+aYR5uzY7dhAS647jWtDTLYvLjOagIT/41AbL6YAtQHXp5OUC3pmq78Psg2+at5eTXE0R1E+vWNmKkc72a+9IBiK+HDOMvyF1eVi6hbk/qpRHLVeREayj3RVUZUXnLjPk1O/187SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378618; c=relaxed/simple;
	bh=CJewpNtDiYZKR0vYTwM+1BlRGsnnKuzz930O/B6QLb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxTXyOwxSoINIuoA9NmNpRWAJq6byaOqsYl9onliTsWZr1Mr1klReAOtbO5KPdYE3dWfpjsYKXx2P16cp9d8120H8DgXL272c8qDT9bivs6X6BGHicoOXFznsflzwb1LDJqI6GY8F6TZqPiE6GlQfa0dNos6c5FTmKr3j3Qf6YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=REiY1uFl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="REiY1uFl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751378615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RTx+g/ICXN+t4dz9YafghFmb5+aFmfAwgPNFgDgkBAM=;
	b=REiY1uFlBpUymDdMWdeHUq8TYwmQzdlFDTjNs++z91BG7B6yGmMwQSEVOGdg2eYMH2DJQz
	/LUwosIig2FtGRNI3wW9txQFrOofHk1J4S5yZ5/oA1pqyhxjzpn1XRsCxtRehXnczAoHAe
	IwuxpCe8CW1QMN6dtsrmHjxHnbQDCHE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-Cs8i9ayQMHKGo0GuhTFv1A-1; Tue, 01 Jul 2025 10:03:28 -0400
X-MC-Unique: Cs8i9ayQMHKGo0GuhTFv1A-1
X-Mimecast-MFC-AGG-ID: Cs8i9ayQMHKGo0GuhTFv1A_1751378595
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6da94a532so2180264f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751378595; x=1751983395;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RTx+g/ICXN+t4dz9YafghFmb5+aFmfAwgPNFgDgkBAM=;
        b=EW+fTw+resMUNa4unpDZSCm2C/+cd6hYp+j6xQlYArmMKGfp43smdESvmcXzWK6vAj
         /6R1q/kiwGWB4P0o9KTzdkXIwc9w9Koi2rGIn1ggqMZOKdIpzTIrV4KLUqUOuegReGMk
         2y2V9JnBBVH1GjhxnIBmPkAq4EPsIWQJFNWOAo/p0he4h8HKtLvaRzabnCI6NZkqzk4g
         Ag6ilngjskwyWqsAFeyZWLTq3kw3TNAnMwkzz1RRLQ57al1U+ZsD2rKv2VXhiNp5i+TP
         RIgvsPKNdY+9ReLvzg9IY3eKtMezKq3ZYHrHVB+jR6JfyOIq9oCRZQdQBHiW/WGhqsHe
         kJGg==
X-Forwarded-Encrypted: i=1; AJvYcCW54lfiRceEKBps9G7lLIXlRm4dRZcyIlklq7Jn5QaYCS4CsaVXQmMr8PLlXRz4fMEk/MwFohvezytjzyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzENBksLoLPCXvWCVgvSlODAUZC82cAQDkHQz7xeKuTA42aK9/J
	LKvYgfUKMXYOv1+oUc3BdOr7crt3MmnoOgLVj8Fn9Ex1ZUOUhs0gV3TStKJYKV8ncvyQxxZkbaR
	+8TWb4KE6OvGJ4EwWXQocIDuWd2bDQxG4x3iaMErJhTCk1OEwtPeri6XBuH/759wHzA==
X-Gm-Gg: ASbGncswmR4TkOLahzEItUlAEQUs8qxu5/uK+7mhyIcuyQHO2tbjgcqONbaUnRDrHpa
	bj+2jEdEYIZSnRZZmzUWDFbNxkGvmM913U4KMa4Mo/diMuTdKjK4+yzEXuuAay/fLEK5+/wv/Zm
	0AhY7nr52brTsnmWx181YeCVlYDP4a0OFhPcOxo506d3d3o9XNEbmpyrgl0FaHImK4INqBC6KcV
	8M7xfxiB1UYWTTwx4fNNe8dVlKIcsl9pifaCBmQ07/dvH4YlGJnLRtAzHFCTmi0wJytCOL1Gcpb
	mwzH+uq1b8WHAydh6lZMJKXPVcdMZhvpnByVaCUTB6f1X5y2pTerW+4hDqTATyGeYzeTziAIcAk
	DBzrj4MEZM7p420BadfNX7qHcYS9TV1ZVj+1mtIQmCuD7ey7Ogg==
X-Received: by 2002:adf:b64f:0:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3a8ff5201efmr11485712f8f.42.1751378591832;
        Tue, 01 Jul 2025 07:03:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7R3QME11ZBj9+BG46czHqpSceP+vF115DNdQ6LNVtWM1I1Qv3+VwohoaUOVRnSiIQOjQm8w==
X-Received: by 2002:adf:b64f:0:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3a8ff5201efmr11485359f8f.42.1751378588233;
        Tue, 01 Jul 2025 07:03:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a87e947431sm13377312f8f.0.2025.07.01.07.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 07:03:07 -0700 (PDT)
Message-ID: <330f29ee-ba55-4ae6-a695-ddaba58d5cb8@redhat.com>
Date: Tue, 1 Jul 2025 16:03:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
 21cnbao@gmail.com
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, stable@vger.kernel.org,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>
References: <20250630011305.23754-1-lance.yang@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250630011305.23754-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 03:13, Lance Yang wrote:
> From: Lance Yang <lance.yang@linux.dev>
> 
> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
> may read past the end of a PTE table when a large folio's PTE mappings
> are not fully contained within a single page table.
> 
> While this scenario might be rare, an issue triggerable from userspace must
> be fixed regardless of its likelihood. This patch fixes the out-of-bounds
> access by refactoring the logic into a new helper, folio_unmap_pte_batch().
> 
> The new helper correctly calculates the safe batch size by capping the scan
> at both the VMA and PMD boundaries. To simplify the code, it also supports
> partial batching (i.e., any number of pages from 1 up to the calculated
> safe maximum), as there is no strong reason to special-case for fully
> mapped folios.
> 
> [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
> 
> Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios during reclamation")
> Cc: <stable@vger.kernel.org>
> Acked-by: Barry Song <baohua@kernel.org>
> Suggested-by: David Hildenbrand <david@redhat.com>

Realized this now: This should probably be a "Reported-by:" with the 
"Closes:" and and a link to my mail.

-- 
Cheers,

David / dhildenb

