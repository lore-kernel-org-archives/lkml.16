Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3304728A41B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295074; cv=none; b=YhARIVvRo63t8WEr05VJVHq3Yehv6YOw7FdDpJjCYth34GqOwXPXcPn2Pg3rFAPyLWz+uvfI+JYpN8x7Q7jmWTiFcjh8GWJkREm6wvcS93nHfPX7fjP0q/VKhwwMG4QDSPE4ngU0PlJ9DrkbfrAvHSk/3QKmUQOEJnW9YOX1Hs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295074; c=relaxed/simple;
	bh=/QL5zwKwieBN79ZEH/LZkaqk2hB688KaLoWSaExzylQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Re0x1ug3R7UQ/Nvae/B4G3A1kAja68ad1TOC5hSOtdtMxhcuZN7BhpdWAlkYRGi9BT1hs/ZMVO7dapk16hfSUL+I1PNqdMXm0LCTLRejjhafEbGZhnHQLcjHV1Fv8rcaPbF0mNVOWPTSP7m40/tMeUtRtkBM663SZis5OhPxnAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bQ19+Bo0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQ19+Bo0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744295071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cogrv9qSy5JJwLnX5CdBGBAIWbaDO9BCFw+0D18Jb6A=;
	b=bQ19+Bo0rF+n7cf9bL9JL/VnD2ouQnO0qWWbiVXEzpwecFSfQdZeUIdb/zUkXiphDoPddL
	5tou4RMGg16o9IOeSfolvFmm/CeYl9woJSCQrCBhNfKddTRCqh01vkCEUOBFvgVwLs83EO
	tvJcecHOk2cj/vTEXRw6Euo6d4TkUCs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-x2gLDrvDP02116ZNmr0avQ-1; Thu, 10 Apr 2025 10:24:29 -0400
X-MC-Unique: x2gLDrvDP02116ZNmr0avQ-1
X-Mimecast-MFC-AGG-ID: x2gLDrvDP02116ZNmr0avQ_1744295068
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912d5f6689so538167f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744295068; x=1744899868;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cogrv9qSy5JJwLnX5CdBGBAIWbaDO9BCFw+0D18Jb6A=;
        b=pxjxeax88C4rSSTg8+CFFGARonXNDwlAMzbWMpWiM84X2ZeOQ3WTssmNhVjBoSuv9z
         mqFuV01McZH9fpvhWisi1PlBvlsl7dxD/l2o7DW13I0pB179Nt0HcEcntWcwzb4wd6au
         npTvIpxS7lH1wY/+6orC9FRRmmkKFJ4X6D7s1A2xh1n9gM+0hCJUzirueRFWdh1P+5pA
         Qzd58i9eU3+lJXebzz91Nx8gQdOtAKHyBX5cfmQMcdEWgQVdWkdJrgvXujWp/vff+udV
         3lvzRtWO63NlB3PiTfgm2aa+H4KzKyWRftFK6eUAG7jcjH4YpXSK1Kq4MvN2b+MPiurU
         s7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCU57H5xX9j19/LEuvAZVkH61s8nJ80Htj2GtnHRAyb6vTmeTljsCu5WKdiCVB0uB5JRyvQHgY3FA1Artds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZCbVrOmeB0Wi81UxRGrqJwmehI+Sqvc0AVa69iefBnXE8fEK
	cpszBE4ZchEMqCkgdp+7ONJjXESp+lkCDy9Qx8wiAjtohzPFpIL9BT2/J9QeEaldvhWHjsJUCks
	sQfVSBhsvCdZAPAqbNUCidfAMlwEe+M8zaaFqWutQMHpuRPqJr6vBWXt98cmhdA==
X-Gm-Gg: ASbGncu7F0y/gynvLTsAPuW412WQyRQLmWqkZFWKl2cjXFJNnFcbV15Snd6ZEteI+wJ
	Tp+TmIAAMAKil3H8LVzIDaduvqXLuLAOtWk3tq0K9RFMDc2bvLQH4SlzP6If9bOlczFUH3cVcV4
	l8PQeWGD1Jh86pRT+SJTApHCqDDOeOvt6pYgnr9CNG66fvM1EzyWMSQFA0V40HVIZhMhUz+9FLO
	rMdWUTyHDQGT0vXT2GxnwFWRzqvEDWeFn0XrwuUvEBkL9YieOAWJrL6/im0S+p6bunTrt36zN49
	qlsgxPsAhntluTlMUfx9xJXBuAjc3unPmm+6F3vCrY9apXtYzZN5UsslyPet4DEjT1UsVR3Ohax
	VMOuQpf6oLvbrLXFohnAzVnz4GvfqRuelHTMM38k=
X-Received: by 2002:a05:6000:381:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-39d8fd478d8mr2312656f8f.24.1744295068431;
        Thu, 10 Apr 2025 07:24:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8Bn7s6DpPfYgcl/M2M53UOPYHKLL0imCRu25NntEj2VeeysQV0NHjc1D5fGBcavhpUKgDjA==
X-Received: by 2002:a05:6000:381:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-39d8fd478d8mr2312638f8f.24.1744295068036;
        Thu, 10 Apr 2025 07:24:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71a:5900:d106:4706:528a:7cd5? (p200300cbc71a5900d1064706528a7cd5.dip0.t-ipconnect.de. [2003:cb:c71a:5900:d106:4706:528a:7cd5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0cb7sm4998161f8f.75.2025.04.10.07.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 07:24:27 -0700 (PDT)
Message-ID: <32c7a1e6-37fa-4d40-b09f-93712a69f062@redhat.com>
Date: Thu, 10 Apr 2025 16:24:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/base/memory: Avoid overhead from
 for_each_present_section_nr()
To: Oscar Salvador <osalvador@suse.de>
Cc: Gavin Shan <gshan@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, adityag@linux.ibm.com, donettom@linux.ibm.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
 akpm@linux-foundation.org, shan.gavin@gmail.com
References: <20250410125110.1232329-1-gshan@redhat.com>
 <9deb3725-8991-43d1-8c3d-56523fabff28@redhat.com>
 <Z_fNx7hTOR8St0SM@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z_fNx7hTOR8St0SM@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.04.25 15:55, Oscar Salvador wrote:
> On Thu, Apr 10, 2025 at 03:18:00PM +0200, David Hildenbrand wrote:
>> Staring at the end result and the particularly long comment, are we now
>> really any better than before 61659efdb35c?
> 
> I think we are.

I think you are right. The whole comment can IMHO be heavily simplified. 
Makes it sound more complicated that it actually is ...

/*
  * Create memory blocks to span all present memory sections. Take care
  * of memory blocks that span multiple sections.
  */

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

