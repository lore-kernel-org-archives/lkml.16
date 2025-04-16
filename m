Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D1218FDD5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792358; cv=none; b=GV51ENNeZFt3ex5V196TN75Ddnm/yShHA+oUPTGZbDkcU6E8SthXwesnZoK3yj1XS/xUpgXKYLvo7zg13LLSmi1lDhJOspGHeo7gIE1SCPoieesfXjIs1eC5GclOmw8GjQogFERjOzejSzHJNPlJ/OcC5TrPpP/lkfQ9C+D3Dt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792358; c=relaxed/simple;
	bh=7UJJWhi+F8gARN1ffmntexv4u9hVvmh8ymCHg9zPHyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZVkXhdlcjG71zU6ILNDWoSbZkyS99p46dcX7hj4IcHBW7jWJmzf+MvtaKnv1VUbiLdRaYXknxIoQv79o6MgCbg6PJ+Dpvr2CSmiyKXBZmwFG6eRmDdezF+3THbBQRWn4rXbha/lXp8OWSvFNkXCYJpdpwKu3y/F/AaTFSrxsGMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dy2HTBZG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dy2HTBZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744792355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3pNhxsezbWTR8OeYwsLXxNjkGvRlToQU0Vob189Bp68=;
	b=dy2HTBZGqqD49kT2qBoz7uxL5hAdWjktd8FbGXyQukfxnn/QL3rOpITuAWow25b7iExqLY
	RepyHgPHlS/AcX8ve5wH7XkEOD+OVlLLD3fHKRWqHdg8qKHUAja8XYF/soXGMNz/skSGGZ
	3vDTkYG4y4J7a7JAF7gzJ3OV8mrGAjk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-t_OvuYQZPMGUTQK_YbYgYQ-1; Wed, 16 Apr 2025 04:32:32 -0400
X-MC-Unique: t_OvuYQZPMGUTQK_YbYgYQ-1
X-Mimecast-MFC-AGG-ID: t_OvuYQZPMGUTQK_YbYgYQ_1744792351
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39c184b20a2so3087817f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792351; x=1745397151;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3pNhxsezbWTR8OeYwsLXxNjkGvRlToQU0Vob189Bp68=;
        b=oCCdg5am57wi3+dz7n1KdLdCZAdzukG+wrBZmYOHiSbDg2yoQQ4NW4lJreyrHZnBLg
         4n991UT0O0Nh89F4QBgEeCoZcwGFbQP6g26dMSKcxM2L0uVgteUc2h1dllBKDBsIDeaF
         Winkg7xJC5ulpGIbMrgBzd8wSXCl5aD+T4jTzYTvVioFWdgjWjwfWxuKweb7tq16PA4M
         HJzK5OohrSPoFRqsXv8IEXOm9IfWpXFyo1X8Fk731GFINAAJBc/PPVY4O/uloMxPv49N
         Xq1TpOGiVyW+C627EI35D/aOZbmBM4McIo3TvztHYd9TTJrqJV3jK7F7cphcOJP0uEs3
         We3w==
X-Gm-Message-State: AOJu0Yx43Xb5frbA57it2SPUhhkxItUkJjPDtLOINM74cVstL3QFi/Iq
	1pVOtcc2RJT75iq16BK/i7FAqhFx6Me3hf2Ahkv4hkJYQ2KSFj7eU57U0i2raah9gP+7xDB7sq4
	pv9WAJF+Rkh4IMd94W9MWIIgVkwY+heoOknnGaok/9jyerBH7RVtnxiV4DGRzWg==
X-Gm-Gg: ASbGncsiCWenvnlHxP0PDqLeI7CWPbXhBew64tAjb+QD55o0VA2cwF6Mllz9We2NDZ+
	X37VX4kCr5y7yzeTWqohlsGSFrlNQY1TEjLk8hZr0hpaCiLnbHGoLTV8P2fJfdBB510v4vS8yA5
	lkZGvPcuiADXdwYxq5IP1xi9vIadS88SRF8CRu3hooeentH6lH4yRjWsTj0n51NGUs9E/oHGQl1
	vZlZAGbcTiE1i18KzNPhX4nGoTyh7oRFZNRWah08JZBLd95trjCnf+ahxT2QZIwdOGoZ3mKGcCX
	nGmooMmPbQuP9ztmcyiL4/+8XIChPCXm/JGUL64Eceox2EJaNjPtH3zJC+RPwhVv2w/QKKPiFBx
	Qyd6GAVQfyhkBRjzvRATFFCDt1+nvehbGfdhF1Q==
X-Received: by 2002:a5d:64ae:0:b0:39e:e588:6721 with SMTP id ffacd0b85a97d-39ee5b12fccmr966319f8f.3.1744792351009;
        Wed, 16 Apr 2025 01:32:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKzFqx4jbdukRr7EZ5oQEsvKp01jnyNuCZHT77BtJHtpFjws4rRoNEYY6Geg4VgDacHg5X0g==
X-Received: by 2002:a5d:64ae:0:b0:39e:e588:6721 with SMTP id ffacd0b85a97d-39ee5b12fccmr966289f8f.3.1744792350677;
        Wed, 16 Apr 2025 01:32:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445737sm16145106f8f.88.2025.04.16.01.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 01:32:30 -0700 (PDT)
Message-ID: <34c54df6-9a7c-475d-9b91-0f8acb118231@redhat.com>
Date: Wed, 16 Apr 2025 10:32:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying
 processes
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@infradead.org>,
 Oscar Salvador <osalvador@suse.de>, Ryan Roberts <ryan.roberts@arm.com>,
 Zi Yan <ziy@nvidia.com>
References: <20250412085852.48524-1-21cnbao@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250412085852.48524-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.04.25 10:58, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> Promoting exclusive file folios of a dying process is unnecessary and
> harmful. For example, while Firefox is killed and LibreOffice is
> launched, activating Firefox's young file-backed folios makes it
> harder to reclaim memory that LibreOffice doesn't use at all.

Do we know when it is reasonable to promote any folios of a dying process?

Assume you restart Firefox, would it really matter to promote them when 
unmapping? New Firefox would fault-in / touch the ones it really needs 
immediately afterwards?

-- 
Cheers,

David / dhildenb

