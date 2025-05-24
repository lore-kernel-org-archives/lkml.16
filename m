Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD72DCC1C
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 02:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748054344; cv=none; b=gUv8LfLDEzrWJx5yUXSslxr7mcKBVPH3R8OwwmDnMn0H2FgBXTJyTIsUaWAT7CJ9A4yCHIx5GjAPXAOgpAkTjqHtgP59JDvfJLIdpG0pnHgwAVqPVf/rDONNRzxjE/O8KRCJ3fnpQKLMU8BMEmB4pVrPLQ8rBHVsEjhzlQOH+iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748054344; c=relaxed/simple;
	bh=Vh18pFzKqpQe6hUFH/zjsBEjMWLf6Gf5RXVQdbysPwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpVAx+f4zhi+1CO8vN9TSADr40+RbWbd5+xI/U4Nfw45Icgl4uq8mBzs4APtVHY+WsyIKd85Fi0qNFteJJim1P/ODG6I1+5G4CTitbFagigI87C/QI3FXnDa9LoHVQ7UgA0pQfOh2kfZJMH51PHrirW91doXxP4Jzcy0EYWRTso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NVTaWFJr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NVTaWFJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748054341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQHeLaYHvKxF+GHtQN6xMn9GC9P8oUvc+3z8s3Wst4A=;
	b=NVTaWFJra2J1MPGZpuxQz+NPBwrlXUiXwA7zsIv/CX2bDmVoeIGEU8vRjf5xsqXV5G2HD2
	iucK/P4ezRc+gfxTRISfukErX/tKBwYZiRKq284dx3ISOeaE/H9r153Qy+ngqtEPaysCja
	6/XY220XVMzKZDlxNTOivWKgc5KCHVA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-zQg9lPT4PjaHa_IfAwSXKA-1; Fri, 23 May 2025 22:38:59 -0400
X-MC-Unique: zQg9lPT4PjaHa_IfAwSXKA-1
X-Mimecast-MFC-AGG-ID: zQg9lPT4PjaHa_IfAwSXKA_1748054339
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c760637fe5so74809785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748054339; x=1748659139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQHeLaYHvKxF+GHtQN6xMn9GC9P8oUvc+3z8s3Wst4A=;
        b=fmFnEwmqYnN7uJHp4qvQEtPfhARLvFA/m/DoIFjIW8TB4oHul52SHigMYWNUf/Ie05
         6nxLW9mxBXSb813HYPVtw5FZxzouluOg8lTnej7CEvr8Ym+ACN9LqCfvH8L9dx8uKGaK
         DXMtzo5AAfojWbT6XFkh1tRcb+iXuzit7iXwhEpFQNcgv7aNzLxX+0k+943UlwROLpCb
         t6OiX72n8gI8zF3wBMHb1Kbgar+/STeeneyXcG9w8UviYhcFzBa5S6Ap4zxT9Vl1eQzk
         t7ePpEvmneWY8eRdMZ/pGoHQpq9B0nmECsxOooOvmjkzEifYJ6wMcg3NXY8S2bhkvlEK
         NuXw==
X-Forwarded-Encrypted: i=1; AJvYcCU74AY0jP3H9zmTiVPvJfsL8Qfml3D+4R3n7RZhcoFfonWG3P92CNzSlvns+jWVpYEnralQWPQNfIn2/DU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFUcVycWhjHo0k/BNtZBCUWJN3YB47nf4PVgUjBF8Qmp6kFHpq
	RXuiCldLybw+Mo8BHDeEyxBjonwfroXI9R3C9CqiiYnBwK35/takqJ9oAlKl8HBDBgJ1whq6g5M
	aQGUk+Ka6ACEz6Chel5ndpik5L+4Iwd/GKvcvkqkUjzF5ZQDIyDbeVNI9K85lrrkqyA==
X-Gm-Gg: ASbGncuHzwcoYZ4az57+Va/sY3nwxQ0qcUNDn8ZycElcnU/kZ6H3NhaDHE8zLEijiQj
	RsADpKySm4nq2tsthZsNJQghNPe/WbXla/s7w4mhrHDjhSNvxQdEZ4IWKNgkBKjWr6wlkI97BBL
	E7CWDwxXmq6wUBFbbN8SHkixfvh0oACoIghSMb01LUoMsBiLQjepXRShl6g6ldElDWkPq17Im+9
	D4Wp4MBkrjMbkXuUQpsNOhvkgOG4h0ZLSRAT2ZTbEzEXjeQAOWLg4Op24IZgns32NnLsUnJq+fD
	WjiTWIEWDOMe
X-Received: by 2002:a05:620a:1d0d:b0:7ca:c9cb:ab1 with SMTP id af79cd13be357-7ceecbbd282mr229953685a.7.1748054339357;
        Fri, 23 May 2025 19:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErmUUHEKNy3Y7AV9txFdGa7R9r1caA7oXdVsktniXZg9N1+JC4HDh8WDXEKjBXaAJ0HK1AXg==
X-Received: by 2002:a05:620a:1d0d:b0:7ca:c9cb:ab1 with SMTP id af79cd13be357-7ceecbbd282mr229952285a.7.1748054339037;
        Fri, 23 May 2025 19:38:59 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467ef2fbsm1271523485a.59.2025.05.23.19.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 19:38:58 -0700 (PDT)
Message-ID: <12136dc2-41c2-45f4-b1f0-cd9d2e853e76@redhat.com>
Date: Fri, 23 May 2025 22:38:52 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: New function to determine hardware
 cache management support
Content-Language: en-US
To: Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "david@redhat.com" <david@redhat.com>
Cc: Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Dan Williams <danw@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>,
 Dheeraj Nigam <dnigam@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "sebastianene@google.com" <sebastianene@google.com>,
 "coltonlewis@google.com" <coltonlewis@google.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>, "ardb@kernel.org"
 <ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "tabba@google.com" <tabba@google.com>,
 "qperret@google.com" <qperret@google.com>,
 "seanjc@google.com" <seanjc@google.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>
References: <20250523154445.3779-1-ankita@nvidia.com>
 <20250523154445.3779-3-ankita@nvidia.com>
 <9ffc7686-0dc0-4978-8cd8-f12a1c148b63@redhat.com>
 <9b429da4-8db6-407e-9721-178e01fd1ebb@redhat.com>
 <SA1PR12MB719939317BA885F8CD3DF970B09BA@SA1PR12MB7199.namprd12.prod.outlook.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <SA1PR12MB719939317BA885F8CD3DF970B09BA@SA1PR12MB7199.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/23/25 9:41 PM, Ankit Agrawal wrote:
>>>> +/* hardware support cache management */
>>>> +bool kvm_arch_supports_cacheable_pfnmap(void);
>>> Won't this cause a build warning on non-ARM builds, b/c there is no
>>> resolution of this function for the other arch's?
>>> Need #ifdef or default-rtn-0 function for arch's that don't have this function?
>>>
>>
>> ah, I see you have the weak function in patch 5/5.
>> But I think you have to move that hunk to this patch, so a bisect won't cause
>> a build warning (or failure, depending on how a distro sets -W in its builds).
> 
> Thanks Donald for catching that. Fixed in v6.
> 
Thanks for fixing the nit.

