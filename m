Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5320E28ECE4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043918; cv=none; b=Ym1l9IkpRF+sXStwA3cvW/E6/y58VLQ0prKNwTznp+Qf0b/Rkr1NnrpostXTScPbgnpBCKoPgG2RvQn0FFbWk02WzjQZ//1cNhorswI/qIrrKaRk0gd7hWqSWY5PDilFpYKQdm4Y25+8hwQ64acD4Cj6Old9xgWd2kChJ+dH2MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043918; c=relaxed/simple;
	bh=O4p6l7rBXQaRRM9UG2LP564Nihs+2sZX1zb0j3V5gys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIjWu/UWyROl+LySr3Pmw1GukbN17m93LO43DLtNBXd7Ai6lD8IblOc6sJwuR8EB6tkjWwg4lmkuFjWeJwai+Msj4xuvv+bvU7FcU0b7RB67PQs8Z3YkhQLyCP6oBx0FvOXw+NsgPDdbBk6gfBL6I9ZRYEKzUosiPTxBiBYU3u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I0ZpeLf+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I0ZpeLf+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749043914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=g0ak6P4hoXZV0IlX+BuzhQGv8bbw0xx57RHIQQN6xpI=;
	b=I0ZpeLf+qFCmgMGKDEdwNX5X6lRmciek5p7by19eYyUay92z1nqoHSDqhTBcOutSCRUKRQ
	+H19pDjB/MZD26e0hwxoZqGOfzfFL65poPuCJa5VPBWRtbqJVcY7SkvAI2im/clPzba3RI
	7R+orqwO0tZj41ivfC/7mQeRjoY60GQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-xw-ulHPQMiad9kjSaHmElQ-1; Wed, 04 Jun 2025 09:31:52 -0400
X-MC-Unique: xw-ulHPQMiad9kjSaHmElQ-1
X-Mimecast-MFC-AGG-ID: xw-ulHPQMiad9kjSaHmElQ_1749043910
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso1938224f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043910; x=1749648710;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g0ak6P4hoXZV0IlX+BuzhQGv8bbw0xx57RHIQQN6xpI=;
        b=Qw/hrTrhS9PEzELhkd8MDyMlHV5uW3mbyT8VEU5njFNl2d2t9hQPVL4lsh6ia5M0NL
         LoxBSX61KlejJ3LFTwRGtC0QtFCcNptwQCpyFKPhHYCWhNNub148/RsUpNYAVV0PSNk0
         x2pyuOiZETK0/yXsCaDV/W3gJ7qKe+skLHmcPgScHKl1ENMLjOJdP+5y/HQl5oXohUDT
         qyZKknO9hqJ1JKxSEFiMNW1qNNdWn/QhFL1vdM0/VTTSjjDSw5mnu+6NWpWi/8Zoye0z
         zKNdRAhY7AYlrj/kwPipuUNUclZtL6Cyqg42woj5PkOZVj9+HHGnAMRdI91iUxwt/8E0
         +klw==
X-Forwarded-Encrypted: i=1; AJvYcCWH0pV1EIabu0tLB+5xy1AZqMM0TpSL8YD8CZPGNPOdtReX1iz1sKZVk/pKwvpDs4o4+nXU/NgDk81C/Kg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2SK9NsOFLPnVvdH7F9MW/FhhQG3Yfby9xSsfoLqB77OvOOtQa
	LPs+ikTQ8lmMy3MLbSBe6LMR0aUlpKBE18BGMiQNx/oCDJuslWNO2IE0MYYlZfIREw7uwBIbce6
	K/9OVwI1Krc2IhL/USSPtS42nO7S9VimoyUS496feoxSpu0sT2zbvT1RVcx0QoVqjmw==
X-Gm-Gg: ASbGnctFsQTTa8iGvXW2qEaUvPs6t1fCHHjIRRK12vse2Vtwlnz+k1hkA92Pvn0YhFa
	QldLQCgGBGNSl0VUKbN7AQ7JbAUHheXSl+i2tGvoYW/iYCtzbwWscHJ17FLEcYKBbPo5a/VOHSW
	qxOOv+ZIuQD6whVJa9XG+2Zm+u0Y389TqC9Yj1rZ1rBfuB4+LUkZs+z5CX92wJLecYZD+gD8YWD
	17lTmhh1K/tK7UP0j2GSZzXPlDlpa1NrI8H30aa4YqQVXwriDaBhY7lSEMV3753fm8edTRhAjS7
	UhP8ymJn2U37WP7/pHWrC+r8p/c77M2qhwATeSLsoMdNSdJju/QJ7XKcBGmTRcx3m8LnoN5A2NE
	50rELlegJ53YqBwAQq2mpy0i5YtQ823iFkdhTXBI=
X-Received: by 2002:a05:6000:420f:b0:3a4:c75c:efd5 with SMTP id ffacd0b85a97d-3a51d96e747mr2414349f8f.46.1749043909877;
        Wed, 04 Jun 2025 06:31:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuM2gMUpQSJdpex6F6doEYF6luunnpKyBL6ysGIZNUcXOZj9kxWx4CEbjV1uSXlRCdGrEK/g==
X-Received: by 2002:a05:6000:420f:b0:3a4:c75c:efd5 with SMTP id ffacd0b85a97d-3a51d96e747mr2414289f8f.46.1749043909452;
        Wed, 04 Jun 2025 06:31:49 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c91fsm21855003f8f.35.2025.06.04.06.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:31:49 -0700 (PDT)
Message-ID: <b92484b6-c028-4969-8efb-aff747c38f83@redhat.com>
Date: Wed, 4 Jun 2025 15:31:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: rename CONFIG_PAGE_BLOCK_ORDER to
 CONFIG_PAGE_BLOCK_ORDER_CEIL.
To: Zi Yan <ziy@nvidia.com>, Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 isaacmanjarres@google.com, jyescas@google.com, kaleshsingh@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, masahiroy@kernel.org, mhocko@suse.com,
 minchan@kernel.org, rppt@kernel.org, surenb@google.com,
 tjmercier@google.com, vbabka@suse.cz
References: <20250603154843.1565239-1-ziy@nvidia.com>
 <d6f18e51-47a4-498c-ad66-60fa2d8efbfc@arm.com>
 <957DB2F9-9C7E-486E-95EA-1E6574F82D4B@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <957DB2F9-9C7E-486E-95EA-1E6574F82D4B@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 15:26, Zi Yan wrote:
> On 4 Jun 2025, at 0:36, Anshuman Khandual wrote:
> 
>> On 6/3/25 21:18, Zi Yan wrote:
>>> The config is in fact an additional upper limit of pageblock_order, so
>>> rename it to avoid confusion.
>>
>> Agreed. This new config has been similar to existing 'pageblock_order'
>> that might cause confusion. Hence renaming makes sense. But instead of
>> PAGE_BLOCK_ORDER_CEIL should it be rather PAGE_BLOCK_ORDER_MAX ?
> 
> Or PAGE_BLOCK_MAX_ORDER?

Would also work for me.

> 
>>
>>>
>>> Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")
>>
>> Does it really need a "Fixes: " tag given there is no problem to fix ?
> 
> I have no strong opinion on this one.

Probably we want this to go into this release. No need for a Fixes: I 
assume.

-- 
Cheers,

David / dhildenb

