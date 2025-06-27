Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D851C6FE8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037100; cv=none; b=I8uamO/6NQFGse8GQe1SAz6ndy01zX7vrIHwbqZ/h4TDu1lCbmi3KNE1+2cw7pY2nUxewkhDWhn7VsG0gSvRqi70oZq5vYT66R815ARQ9e5ieQoEp37UYI6a3nasfrxULn/F/vZ5qgZk5YgQH9zxQhI+pqrzIMFn4H5Oi3Q9Trg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037100; c=relaxed/simple;
	bh=ayu1FzL5ayHX6AU6fpRDATcVa+PwntqY+TtUU69IjIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlNPPf6R4Mg7sp+GCa3uo1BnvwnG8OuUmvsEPvOjrZ3rfyJu0Z2HD9pgaz/h5FI0MMqBNeMFKDS6j+9YXTmHuWMdGVTNr0+u1/AIwXoI4AOCgICNEr9dHY9J3iHUt5IpYLon6AOLDrh8KhdlLIrxzopIb4E3FZDy1/EOIerp3Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aXhXFbky; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aXhXFbky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751037098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+PNsEGmUdKDZVIiKSYv92rxKW85xGPPGhxRXNnfISEg=;
	b=aXhXFbkyNC8IISaDP8KIQ/wAUj0GVNlRSJTTMF7beNUpr+shCaJxl8Oc8m7vsNqiSssAa3
	EqpZxThOJCmdrwmfC2QCX6gHMA+hdZfRiWVMohLG1Uy6V7PjpUv99GYuZu9+E8ny+AP1J3
	I+e6ttlxgbz5f7wz4eCdf4+J7EGALZU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-j19W3R3UNvSzis_xxpUQuw-1; Fri, 27 Jun 2025 11:11:36 -0400
X-MC-Unique: j19W3R3UNvSzis_xxpUQuw-1
X-Mimecast-MFC-AGG-ID: j19W3R3UNvSzis_xxpUQuw_1751037096
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a5780e8137so1662712f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037095; x=1751641895;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+PNsEGmUdKDZVIiKSYv92rxKW85xGPPGhxRXNnfISEg=;
        b=h58whb7B1uV2fFJhdLRzfC8VtMm9ClYeW1SeSgYfYFJGFDa9f/yClK5frTAmKAuDDk
         OCyA+PqBTTiZ5943jEBBydNk/TJaxcjl1pIdxv1g8Z5OPm7YP1UoTC+D5zZl2yvBd2PG
         kgwL2I4dEKWHdaju2u5t6foHo7pCV6L5NOJREL/bnlfMFTY/0ubv6F12y+4Y+wqQQy7G
         jPocTrC6iFzKCI65Fgv9C/EHW46T5pHo2jiYXvVcSVoc0+fFYr5MOxCe1R9VcOL/h9x3
         gzZ1qZl58xsik3NwjwL9U4duFtf0I6qoX+w9438PLpsynRIEfME6MrtHrcvfQOP0WUby
         Y2Uw==
X-Gm-Message-State: AOJu0YzFNwtiX3OLg43CIldeNAWei2Uh1/zrV4l1/2aHdUHW3M2Ns8/a
	qtsywRk/nC/ThrkO2B0Z/unDyWhOE2oZ02SEU6SCGaXAFIszV+W1hFfUiFNzWPvPWkXUVBVlqG8
	blAUGzK52RbxjTJKEpNI7ZjN/KQ24n5+UbVd/zMZmx3aPD3JkQO1rV+fvCkh7Su2htQ==
X-Gm-Gg: ASbGncs/8hAEILmA1jG5OK5Hri8Y2eZalv5QuCTCrEH39Tezbj6awtQSFFz8HT4PY7L
	2QSqsgYziW3//OgZ6gh6IGvOwqujIB9onJCd3uKfmm+2XosVbMgNwdD75Whh5JXTuTQiGQVvTR4
	KqqPuYP6J6Q1y72yEJ2kApHfZxVb3YErGLvatmAiWSF2eQUWng+Gi9D79ZXdU0NHMDVp/OR90vQ
	qRMvWNIWRDMBJoW9ztnAXCdSaRX2Vue+6hsEj2ALAdeJpEPFiqOeo8YKziFyV/tGg9Zem47ztvj
	1Tx7mT3GHmT+NE8esZHq19t5PHeKgHs4RKRjEhZLLmAuHdQbtDowbdv7XWB50Z/287jkPE6R6ep
	rFfHKoGYRJQruOs4nNu9CiNICxG2eQReZeZXCOqLGGOVcGBC65Q==
X-Received: by 2002:a05:6000:2304:b0:3a5:3993:3427 with SMTP id ffacd0b85a97d-3a98cd53803mr3566993f8f.26.1751037095310;
        Fri, 27 Jun 2025 08:11:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8Qgu2Jgl2J7TvZL3VLP5hIT3tuNl/X1NnEivDIyY3t6UUq5bn/J9s9D2KOD5yjpIyfdMP3A==
X-Received: by 2002:a05:6000:2304:b0:3a5:3993:3427 with SMTP id ffacd0b85a97d-3a98cd53803mr3566938f8f.26.1751037094761;
        Fri, 27 Jun 2025 08:11:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:5d00:f1a3:2f30:6575:9425? (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e62144sm2997866f8f.92.2025.06.27.08.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:11:34 -0700 (PDT)
Message-ID: <ea2d92fe-3083-4aaf-b8ae-1dc950a01d0e@redhat.com>
Date: Fri, 27 Jun 2025 17:11:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] mm: remove boolean output parameters from
 folio_pte_batch_ext()
To: Lance Yang <ioworker0@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-5-david@redhat.com>
 <CABzRoyarK=NnwXis3PUAC_x4YpULUQv_jq-upNpnNQhAPypR1w@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CABzRoyarK=NnwXis3PUAC_x4YpULUQv_jq-upNpnNQhAPypR1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.06.25 16:34, Lance Yang wrote:
> On Fri, Jun 27, 2025 at 7:55 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> Instead, let's just allow for specifying through flags whether we want
>> to have bits merged into the original PTE.
>>
>> For the madvise() case, simplify by having only a single parameter for
>> merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
>> dirty bit is not required, but also not harmful. This code is not that
>> performance critical after all to really force all micro-optimizations.
> 
> IIRC, this work you've wanted to do for a long time - maybe even a year ago?

Heh, maybe, I don't remember.

For this user here, I realized that we might already check the existence 
of any_dirty at runtime -- because the compiler will not necessarily 
create two optimized functions.

So we already have runtime checks ... instead of checking whether 
any_dirty == NULL, we now simply do the merging (checking for 
pte_young() instead) now.

-- 
Cheers,

David / dhildenb

