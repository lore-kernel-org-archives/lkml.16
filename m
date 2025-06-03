Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0865D7262D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943534; cv=none; b=qLolEBp2k/lUiIE4npf/USugMXHlr03rK9+it8kq1tQbiu1/Fpminf4V0tnOVXAqMnlj9W+m5oRBrkz9cwYbP9SwRGzYEBj+nzi5rYrtMPH+DLy/Lgbaeor/R30sRdjLA5gDt1DFVSwFMcBknlYJ/crndy8wWF3KB0gXSix9Zn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943534; c=relaxed/simple;
	bh=F52fkWcRgvovSO8UWAJ8sTUOII5xqBanedEgQxzsqZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NESz5Adt3C8N8aUwck2VH/f8kAVOaQBNdyYxxJsuH75Xwk/SpGNfGjsn5SNEKeDRiXHromvU4LVKku33kGlKtukOHu4VqKfdcetIDuLX+HoCgRVDyYACfbkUqYaDuVgv2ID+dMmW/UMML3LYPc/AntC4vpi19Fhy1lN5CM4Jt4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CdZKRgAk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdZKRgAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748943531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KFpTr8HeZOjxbU6TrRNGcqfkxaxEB49nHh6nOqlW1N4=;
	b=CdZKRgAkXlApMc2GY0iuA9vz8YrHOzD9+HUTQ0yMahPuuxrLzRjrcf4sM5ro6gHboWy02d
	/brTUTuf8TdkkqbR3dcCSD6aBPv/QwAPnC4cwAx8wcBZVXBT+WFD6FqAcvRYEQBZNVCsDz
	fRZzTGT6KlpOdJ0KJ/MVccEmEXfowRU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-ZrhqjR4FO621tSYya8WLHw-1; Tue, 03 Jun 2025 05:38:50 -0400
X-MC-Unique: ZrhqjR4FO621tSYya8WLHw-1
X-Mimecast-MFC-AGG-ID: ZrhqjR4FO621tSYya8WLHw_1748943529
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50816cc58so920764f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 02:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748943529; x=1749548329;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KFpTr8HeZOjxbU6TrRNGcqfkxaxEB49nHh6nOqlW1N4=;
        b=Nl0Br0ty0cTmzdIuhhp1BUFfurM2nGB9fxVvvOOqsQdZQ0Fl7E8YcP0ovUa3WbhR8Y
         qPIT1i/tPBpYgcylG42wql5En3gwnJJrkbzlsHoWbQ69q5u1zEiiOU8rRSaZyWsxrsZW
         DDmXk3twgMnHSsNlp4bhTczf4I5rioUQkaa7nNZRcwPt0yin10yWTNUBKWPI4RP/jbF+
         Gfg7795zmyfdVQKUpkLMUrm/SCL7LSiDoJxFvM/UBuqfwcVR8iGiMxjPNhbV8I+wrTZD
         Coa+iL3eP5kQlxspPUdZAXnRgA5pbak3Rm1xuNbG9xpsseLSSHXjz5VAw3AiC3ss5574
         wyqw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ37AxauP6nZP8ZA+iuw0qtFusAW0u1H9QzGigMATElZqPdDiagqiKsRBVToI6t30fgyFexAByvQRebAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2n84Yve/u7Qa/b3h6x9GMow2cKG/7vpLvvfLxJRmsDY1789q1
	4Iu25D3Cvhk+DIZHgj1HqVqWfYj7ZrBZYS/KD962KM/bpipvM9tMyaNq/VR9ijzGIaR18k0KmIZ
	8tVsIACqE6nA5iBQXRGiE5tZhhpR/lB5/QE+d7H4gCleL6nJLhFuKlqTMtnHPedYHBg==
X-Gm-Gg: ASbGncuGAbTAzUHYjkAwshYBUtM1zWYVHMZLS2hKbIXpanziwHlmykU1yjOx4LnzvNk
	xdUrf/OTonPyUzUkVf8oPhBOwVpdHMS5OwrVScFHm3qZShsJ5H6dzRmyYwAcsekud+4sNpvtG03
	hTqH6M25q7yzEZug1HN31rgP1LgGGTVxYSui5Y0HHjuSVSUZubFNtTYpPBgyYTNsrEOci94dhV2
	wNJdkLwvd8/MAKBArpcWZEAY3KAsS/uE1pjnN9JV8QP4VWpXx9h4yb8/yc+WgR6mkSwddVSXqF3
	EqT0LQ0cx7m6T9wiDCBOVIx/Vw8s+SpIsDIU4mrdZ7Pdo3SnqcThD4vfDWcM9i9OGUlBZ/qOvc8
	VH+E4UewwS6llHH7mlJzXYPFhv6G7p1aATFFjCLs=
X-Received: by 2002:a05:6000:26d3:b0:3a3:621a:d3c5 with SMTP id ffacd0b85a97d-3a4f7a4c833mr12168929f8f.19.1748943529298;
        Tue, 03 Jun 2025 02:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvrGT+MVWFvBAj/aPmTub2du8L7tph7l3unm0TX097OZ+50ELb55QUTdKDl4hIDEjG573PYA==
X-Received: by 2002:a05:6000:26d3:b0:3a3:621a:d3c5 with SMTP id ffacd0b85a97d-3a4f7a4c833mr12168902f8f.19.1748943528913;
        Tue, 03 Jun 2025 02:38:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a? (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe7440asm17993567f8f.58.2025.06.03.02.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 02:38:48 -0700 (PDT)
Message-ID: <46fc14be-d2ec-41ad-a01a-69cea0074021@redhat.com>
Date: Tue, 3 Jun 2025 11:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Kconfig: Use verb *use* in plural form in description
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Juan Yescas <jyescas@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250603061303.479551-2-pmenzel@molgen.mpg.de>
 <05576df8-20a6-417d-a4f1-867c4d30a9ea@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <05576df8-20a6-417d-a4f1-867c4d30a9ea@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.25 11:31, Lorenzo Stoakes wrote:
> On Tue, Jun 03, 2025 at 08:13:03AM +0200, Paul Menzel wrote:
>> *workloads* is plural requiring the verb *use* in plural form.
>>
>> Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")
> 
> I think a fixes is unnecessary here :) I mean strictly true, but we don't
> need to backport a typo fix :P
> 
>> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>> Reading the sentence it feels like, something is missing before the
>> *please*, but I am no native speaker.
> 
> Seems ok to me as a native speaker! Though I don't claim to be the most
> erudite...
> 
>>
>>   mm/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index f8bb8f070d0d..e3a07687ed0b 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -1022,7 +1022,7 @@ config PAGE_BLOCK_ORDER
>>   	  or MAX_PAGE_ORDER.
>>
>>   	  Reducing pageblock order can negatively impact THP generation
>> -	  success rate. If your workloads uses THP heavily, please use this
>> +	  success rate. If your workloads use THP heavily, please use this

Should this be "use THPs" ?

-- 
Cheers,

David / dhildenb

