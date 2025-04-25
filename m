Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02E725DB0A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594577; cv=none; b=jzkYZzJJ292ydqdQFEC62/kfpTTXQqhootfwkScZAJCIL1ARzD2kY9tU6yCk0PulPOB2J8Rtvy8keRJaTsTsMfT1MwraQjn0nQqkEYN/x9Ne2Sa3W6zb0tm76GeOip3Sw2PvfkkLVRriBNu1IVVxElqH2yvQGFK1Ri1JhlueTjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594577; c=relaxed/simple;
	bh=pProaOAcY22PUYh6aXXhX0tcj+PiRJFj37d/6nPGIUY=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gRcwNIoM7qyrHNc6GRbU0PRwNlKUbq7Lpt/ueEsPcDy5O96hKRP3mGeJGr/grQTG6wNaUPeRGL6BieQnzskXsxSoTK5MYNLFviSwUHglpdM8CDogX/bb3lJyf0QlcYuotE3Fvlhwbr6ES21p180kcvtOyy6MMmj5PLG+sn0Lxeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L+5OHTsY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L+5OHTsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745594574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pProaOAcY22PUYh6aXXhX0tcj+PiRJFj37d/6nPGIUY=;
	b=L+5OHTsYhzxJQI9Jph7t+sSLvwmKy+JmepnpNVRGyY5PiFmfETIt4jA9RJnEZvPoZF6Dmf
	dukktU5uoFOQb2XK5FFH2u69GrLQR+Rq/MmLuhhDVNe0zinoSSIMiaZ4WKMQYFB+NRuZi6
	V66yn510lZug2b5hbH96p/fN/FqMnIY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-TPqowYV_OSmvlHsWWLbCLg-1; Fri, 25 Apr 2025 11:22:53 -0400
X-MC-Unique: TPqowYV_OSmvlHsWWLbCLg-1
X-Mimecast-MFC-AGG-ID: TPqowYV_OSmvlHsWWLbCLg_1745594573
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5cd0f8961so480709785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594573; x=1746199373;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pProaOAcY22PUYh6aXXhX0tcj+PiRJFj37d/6nPGIUY=;
        b=xIScsZSReQrAWAoG5L2iuPJGXLbFd3f2s209aFATvZjV4m5zf4SRlzLR6WH/w1ISK0
         mVFxPtTjx+l9Iw4fUuMf7fArB8nFt1bpzPj5Arr047Ifrb1plzwbXmRAgC8vR3by3a26
         OsVEGSGg7ESp95lRBVBpY4Ak2vRNFDoFxtHW6/1r9GbFZDwTgxvwWyRvG3q+H6WH6uQ7
         NuwuYVqxPaRwgZ7KS7fPzPB3txPJAA5f/g07VaJODt3c0LxivR4BI79862DS1+GqPoqM
         rFoe4wL+R0JagagHZZGAtHG8jsq0+Yp51UCW4QLPSZu6f5Fx+krPMC9jSFOk+6eq87qc
         +pUA==
X-Forwarded-Encrypted: i=1; AJvYcCUUr9EBINTwh1YwiHkNnt8vYaioDqwnsS3WVJragBsyB/Z/Ni2sPcdoDrQXFVgEjb5aTspp79WHrJDe/Jc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc3S+Ln+/iEot5TeqxRM/guKVEGsOw3sxW61v+68QPYUzsgELL
	8nEVcSxretYzAdr7mUVG2Juf4YfOxn4ILqrHhsH5ZDfNDVzmpxtpoheq98SDO+PtnYf1uwMzItc
	Tpq+VvJBgavYmGjcX+cW3V3quULLZ0mMZazyglk65v055L1mNNYEbewaUoZKF9Q==
X-Gm-Gg: ASbGncuboJGzQ4wwpDiJS6b5xHEXRJ7h+5xHFYpMF7GZiH0W0IG5oRSGhkcfH804TAq
	0Y9eiTOEOCCPoByUyPWEI1YlAu65tOOWFQsf/AQvEf0lkNYZI2wYkIc0/jRJ8B+E+OpRNuSYx/C
	GUcqFHB96Vct1A/kFakKc9kaaC2r1rM/ICi2pypxwp3UhIqmS3m28TtWXCpQ4Ff7pYgvKc28hzS
	zZUOksaRSezsMrZ2Ru8lMpJCTbS2nGgY5MkWJfKN7Ydm+ejz2hMp9jlVXks18watpgcoW7XRl5N
	HLN2lwMV7T64xuUL0TMNlmE+qje0dywttwk8g/uVx0M4FeZGy5pSyPKRiQ==
X-Received: by 2002:a05:620a:319a:b0:7c7:a63c:319a with SMTP id af79cd13be357-7c9606b05a4mr434229685a.9.1745594572983;
        Fri, 25 Apr 2025 08:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6em+X09lALI/H5J1BXx46XSb5pfUcEyWkE5OIrodgaIGgquVEvwQi2aqd6SqAbIBWR3hbaA==
X-Received: by 2002:a05:620a:319a:b0:7c7:a63c:319a with SMTP id af79cd13be357-7c9606b05a4mr434224385a.9.1745594572413;
        Fri, 25 Apr 2025 08:22:52 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cbca1fsm228970585a.36.2025.04.25.08.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 08:22:51 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <8a85a074-d4fe-404e-9438-131963a51051@redhat.com>
Date: Fri, 25 Apr 2025 11:22:50 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cgroup null pointer dereference
To: hch <hch@lst.de>, Waiman Long <llong@redhat.com>
Cc: Kamaljit Singh <Kamaljit.Singh1@wdc.com>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "kbusch@kernel.org" <kbusch@kernel.org>, "sagi@grimberg.me"
 <sagi@grimberg.me>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <BY5PR04MB68495E9E8A46CA9614D62669BCBB2@BY5PR04MB6849.namprd04.prod.outlook.com>
 <a5eac08e-bdb4-4aa2-bb46-aa89b6eb1871@redhat.com>
 <BY5PR04MB684951591DE83E6FD0CBD364BC842@BY5PR04MB6849.namprd04.prod.outlook.com>
 <623427dc-b555-4e38-a064-c20c26bb2a21@redhat.com>
 <642a7d6f-9d8b-4204-bc81-4d8e0179715d@redhat.com>
 <BY5PR04MB68493FB61BF28B5268815381BC842@BY5PR04MB6849.namprd04.prod.outlook.com>
 <20250425145450.GA12664@lst.de>
 <3fef1073-3a7e-45ab-8448-a144d5fb6a73@redhat.com>
 <20250425151140.GA14859@lst.de>
Content-Language: en-US
In-Reply-To: <20250425151140.GA14859@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/25/25 11:11 AM, hch wrote:
> On Fri, Apr 25, 2025 at 11:04:58AM -0400, Waiman Long wrote:
>> On 4/25/25 10:54 AM, hch wrote:
>>> On Fri, Apr 25, 2025 at 02:22:31AM +0000, Kamaljit Singh wrote:
>>>>> It should also be in v6.15-rc1 branch but is missing in the nvme branch
>>>>> that you are using. So you need to use a more updated nvme, when
>>>>> available, to avoid this problem.
>>>>>
>>>> Thank you for finding that commit. I'll look for it.
>>>>
>>>> Christoph, Sagi, Keith, Others,
>>>> Can this commit be merged into the nvme-6.15 branch please?
>>> What commit?
>>>
>> commit 7d6c63c31914 ("cgroup: rstat: call cgroup_rstat_updated_list with
>> cgroup_rstat_lock")
> I don't see how that is relevant for the nvme tree?
>
The nvme-6.15-2025-04-10 branch used by Kmaljit includes some v6.15
commits like the cgroup commit 093c8812de2d3 ("cgroup: rstat:
Cleanup flushing functions and locking") but not its fix commit
7d6c63c31914 ("cgroup: rstat: call cgroup_rstat_updated_list with
cgroup_rstat_lock"). That can cause system crash in some cases. That
problem will be resolved if nvme is rebased on top of v6.15-rc1 or
later as the fix commit will be included.

Cheers,
Longman

