Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45C42147FB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874328; cv=none; b=i+ywUnidmQquDRKZ4uOcE3CEm36Sq2dSahvVVlAZ5dNc+qi+BB5L3p9+4uU35f6A1JNntQYtksl1xgFLdhlku7T9cSt/B3Vbcz+WuP3PwOvbZWGTK/6f7IWPCPaKzTkC2jZB/3DOPUJkkGVBlH2wGvfIMh57XbJWFrWSRV1YCPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874328; c=relaxed/simple;
	bh=KqBt26TKbedgvXhAYoOteV/lXdlwl35l2szXAqqI/KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZ1PCeEgMDU4Hv//6jXTvhiz7C78GQyhIyot09WKSDhDuZEofZpd0s0EKEY4/xTH9VSIF9mQhx9gOzbj19LsAduZJEZ46a0qTdSD2TXOcfSjyJV+euXZ086IYPMamgZJSKp0lI3dVZru3DmQ2Nypm1aC5GlS3sj1fBhs6pzcy/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EqkQMGo8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EqkQMGo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744874324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bmSUkpgdK8g//zTzlgndh4Cu65jFajKMCK56s9Izn2Q=;
	b=EqkQMGo8q2zSau7VoRk7Nz69f6QG55ZySStFpmClme9xXtraGAUZvjE1zks0zweOUHSjJJ
	B4pmA3B+qnKPbS08pfQmn3nsPz2GawXt5mN5ot31v6sqZjl9U0DeIgUDz+a33QPU670N1K
	ZPwqjaEQSnttZF6LhMkcY23+XO57tXc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-gD1fAyvXMkWMMpv18GZr9w-1; Thu, 17 Apr 2025 03:18:42 -0400
X-MC-Unique: gD1fAyvXMkWMMpv18GZr9w-1
X-Mimecast-MFC-AGG-ID: gD1fAyvXMkWMMpv18GZr9w_1744874322
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43947a0919aso3808685e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874321; x=1745479121;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bmSUkpgdK8g//zTzlgndh4Cu65jFajKMCK56s9Izn2Q=;
        b=msBwAMfb/UJ6A3/WnEGxSqHS4dpePlnprdD3IEG00fHBB0/qF40VD+ciBWdti1V90m
         lwwu0bJhY7bzUvBKvnwsqiMcg5t2U3f4jZmb67wrk+0gJCs/HT99cVqAcUKxV1qeXC6E
         jEPBvnbNwgM6nsZjwkldecwZFRXXwGgbk3IXZ6lfkEpD+BHOJ2QI3rQBRyWCK40hTtHZ
         VvBMe6UeLYISQY1ClGnBSXzdpSKTPWxRdlEYVmeiq4JemGg1B0jfKmlYkeHN2kEzablK
         Z0dWCw4e46ccna7Yiy9YTIugb4uFzwj80wd3ZysC62osjWUKKbgf0OMTaM3n6hzrHeW/
         HhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP+8K9lpwO4EK7FW1zQ9qazG3D5k0pDlA+JcQF9J2lo1g8JCPT4ur3OKBS6MeJSJFzwm17mwjnZTtm4Jo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNqLASd57wtokWOlBdURRWfQ4pmWzg8uwwMo3qVjpQ1hxxwAiF
	zuax9ACOmvubeWPC4Ng7o61XAYNH2qgJBt9EH4otZSyfTbiTi5hGMxSKzJi2hgKtYDRCMDfg44k
	1dmQfZHpww4LmWyuTnKHmRRSjP1XToAKEhncnuBbN9mzFijhElZB3BgRA6zqIrw==
X-Gm-Gg: ASbGncvmCPfC50TwFYUdNMU15zZi/syTA0OwnMEfOvuvwX3Asi89tFGB5g0UTVwoZSt
	EP1P04QbDb7X+OLt6I8lHzfQQ9/9/Wa4sVJjJnDEMHJis4QppatKSkPu+d/rEFM/e8wtjPp+Pg6
	/s8vjW9x91TvIp6Na3ikPYhOx6wU5RmIlNh6ijiTNJpkOJ/3AS+g3qhxYf2q5H8EYwALSYG5VZG
	Txf+zaJbqJK/S/lycArrhpq4VZ1EbMNNXD6DAQqLGXrcoI1oSsRymIYaWQHbbx3rrRdhWCfzQdC
	2OWihkjcvDPIxmwMTV591BGMEJaFVjYrtM3J2tdzunYZVjo1Sk8Rk7sx3ZTxHtXbkYaSSmPbSFc
	4hGcuHZjfl3gsue530mhS9hSzdQfJRg3mPcrF/vo=
X-Received: by 2002:a05:600c:8707:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4405d5fccd5mr48887165e9.4.1744874321506;
        Thu, 17 Apr 2025 00:18:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7O/fIzC1C6NrzDLMPScZGhgDYsOSvouSKqJl40ol57ok8JYa4zHptZ2/POyEImueU5svAzg==
X-Received: by 2002:a05:600c:8707:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4405d5fccd5mr48886915e9.4.1744874321118;
        Thu, 17 Apr 2025 00:18:41 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:2700:abf9:4eac:588c:adab? (p200300cbc7062700abf94eac588cadab.dip0.t-ipconnect.de. [2003:cb:c706:2700:abf9:4eac:588c:adab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ed1652a91sm14191026f8f.75.2025.04.17.00.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 00:18:40 -0700 (PDT)
Message-ID: <83f17b85-c9fa-43a0-bec1-22c8565b67ad@redhat.com>
Date: Thu, 17 Apr 2025 09:18:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: fix dereferencing invalid pmd migration
 entry
To: Hugh Dickins <hughd@google.com>
Cc: Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, willy@infradead.org, ziy@nvidia.com,
 linmiaohe@huawei.com, revest@google.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250414072737.1698513-1-gavinguo@igalia.com>
 <27d13454-280f-4966-b694-d7e58d991547@redhat.com>
 <6787d0ea-a1b9-08cf-1f48-e361058eec20@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6787d0ea-a1b9-08cf-1f48-e361058eec20@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.04.25 07:36, Hugh Dickins wrote:
> On Wed, 16 Apr 2025, David Hildenbrand wrote:
>>
>> Why not something like
>>
>> struct folio *entry_folio;
>>
>> if (folio) {	
>> 	if (is_pmd_migration_entry(*pmd))
>> 		entry_folio = pfn_swap_entry_folio(pmd_to_swp_entry(*pmd)));
>> 	else
>> 		entry_folio = pmd_folio(*pmd));
>>
>> 	if (folio != entry_folio)
>> 		return;
>> }
> 
> My own preference is to not add unnecessary code:
> if folio and pmd_migration entry, we're not interested in entry_folio.
> But yes it could be written in lots of other ways.

While I don't disagree about "not adding unnecessary code" in general, 
in this particular case just looking the folio up properly might be the 
better alternative to reasoning about locking rules with conditional 
input parameters :)

-- 
Cheers,

David / dhildenb

