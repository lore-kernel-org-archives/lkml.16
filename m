Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525B11E47B3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210370; cv=none; b=aWVIgesQVXFohx+o/d3yzbwouVOXhG3wNsKVksfj9yGTeI5VkRluw9Qh5Q1ApRZFQeVdUvHFCTLbH/ZdpUmSKvN75/wLBCqvtJSzSri71IHrJqYExmVCDsp4wuprAog3V1RswNqSLkXMLYxbikd3R3E7+Ih+9bMDATGAC3nykPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210370; c=relaxed/simple;
	bh=J2AWAFUoypdSGO9A68K8w+antOoUBt3RUAaiuzgC+Ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZ/x0NR0et6gMp3P1cz2HqivxEmnp1ZCB00GnsH9jqtl0Xynx0H+NWXWLDyLXjCL61f6obE7HQDYu1q6WnCCIlnPgiA2X6icii/+jZ8Shv2KLV/BWSTMS6pFb22yETPvboyyLfWnnjFsJqzsqOe9He3k31dy9Uk36aDT2kUFcDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CfRhVmI6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CfRhVmI6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749210368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qwnxzLGuikn5a2Uu1FwM95+rWoyE1NoRjTg6LUKAAow=;
	b=CfRhVmI6iXD5YacCWICjtsatA4GKinjha2Epk1cadXQK9wPwAsPslVYhznR/Y2G1iyaSgE
	DP6O4uNanAGNMeF9wtw0Rx4Cs3bCb2LstfneKmCXBpu95qZY0Z2Op5L2WVMBaI0em+H1ps
	IPzLJwJg+rJesgW+qGcIslyffjTLOQo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-c3SeHRu7Mbqaq_V5GieGYA-1; Fri, 06 Jun 2025 07:46:07 -0400
X-MC-Unique: c3SeHRu7Mbqaq_V5GieGYA-1
X-Mimecast-MFC-AGG-ID: c3SeHRu7Mbqaq_V5GieGYA_1749210366
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-441c122fa56so10148515e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749210366; x=1749815166;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qwnxzLGuikn5a2Uu1FwM95+rWoyE1NoRjTg6LUKAAow=;
        b=PcwJ3PzRoF/I1vJxV4jXE2UacbhqsGEBfwat4cr8wXgtYOHbZnkSQsjOzwQ26lEmmS
         dj02EeExcIUwApwCIxH0pvPB4qgUAuJ9iBCanfBToCAGhX+BzhoaDyJv4zrEUUD85lql
         7EeKbF/i5F3D9ff+I9akXudRZh3abNsWsUJRNcOM9BElQEHCZvtZxIP2+JI1cQAu9iQv
         b2rjdcAXCQbNdSYY9yXZXc2QLGPSeESWD+7vEJ0H6WbbRvehGdOPJum8NOqOkkyiLEVf
         zrVYB+jLWMY9nejJt1Zrm3VuOXVL7PQcTGsZzGfztttdopZEHrslmyd8Tc8C75Nmwm2J
         cGAA==
X-Forwarded-Encrypted: i=1; AJvYcCXynh+zdgS1mJVu+fAI9hHOgrsrdgJ30ZBMiUjCsf3A+v1sb6mzAl3FCnfAtEII9hdQVfNRy2a+/GQ3lzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUlDeyWrcLO4fheNVVKCz7Os2W4RBYwf7+bX9X2yTfeMpt+TC2
	IpWcNhJYz4y1BWC/lXPF//XuiznwllAUBla5+pw54M+/G+3koQh1NhCNqBnOC8Zcy/bpl/DYWjB
	pXe+4t1/gcB+GegaNGtJBDkj/RgYVeYIvMvJQgjSWaSfpLICMYnTPDGOz2lVYexl6bg==
X-Gm-Gg: ASbGncuU7L/8coTptdegNTXNN5xSk6mYXEbz1Divq/R7S51oPrTBZBKUD6/hvP48y1J
	r6ghIWGZ1lCrEgXLHVrUj8EP/plrlopvzF9t/w1x6eE6RN7HRMtaS9cR5DwccGXBCrD8zM4EU8h
	ZmypBU4HYsGgtvjowPRwaVRv4EPoKxo36+Oi5OGpNpOc7zjegDuJMooR7ZHPr3+x7KnsHExTXHq
	ZzxXOtZ6pi5IPEo5g8o+9wLs2aTTaJeHTLq8rwGFI7TUEuYc5gXhXnylgY78SZMVdJXEJNVnlql
	wTBBCIGyCwS9m9KDqcVevzc7IfBKEu+DsaONdo71C3cv3rU2lKFsJNzdVm3eMvWRnfdqXwqMJfR
	pLrvM/T6Z9QeFOKPt9w59rcUm+S5iJfJg5e+iBkDNNg==
X-Received: by 2002:a05:600c:83cf:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-452013372ddmr32778095e9.6.1749210365910;
        Fri, 06 Jun 2025 04:46:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjzcs090F8tav40sXaS+Cr9WkEYuBvjbJtxtLvRqkf4lrviPP8mct4QF7+XzINTtttI0W7xg==
X-Received: by 2002:a05:600c:83cf:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-452013372ddmr32777945e9.6.1749210365514;
        Fri, 06 Jun 2025 04:46:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375bca3sm21271175e9.39.2025.06.06.04.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 04:46:05 -0700 (PDT)
Message-ID: <1ef7699b-d094-4ade-966f-d17f4d9a3613@redhat.com>
Date: Fri, 6 Jun 2025 13:46:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10]
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250605142305.244465-1-osalvador@suse.de>
 <c4a96aa2-10ae-4dc1-abd8-be91f7e8b583@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c4a96aa2-10ae-4dc1-abd8-be91f7e8b583@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 13:30, Lorenzo Stoakes wrote:
> Hi Oscar,
> 
> I don't have time to dig into what's broken here, but this series is breaking
> the mm-new build.
> 
> NODE_REMOVED_LAST_MEMORY for instance doesn't seem to be defined, but there's a
> bunch more errors.
> 
> Are you expecting stuff to land from other trees that isn't merged in Andrew's
> tree yet? Maybe from slab tree?

(David replying)

no, this is standalone, and probably just an error in the patches.

IIUC, the build bots reported this this night as reply to patch #4.

-- 
Cheers,

David / dhildenb

