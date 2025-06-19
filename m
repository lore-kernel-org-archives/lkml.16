Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4638B1C7009
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750349092; cv=none; b=MgxNgLKtmQpB3Qevt0UgwM34kl1hFyqejav7BB1IHfcYZZwziIF7T7y6ZpsJ+fZrpZhH8uJqjeWcQIAF8tk/VPT2bPLUnd7tuzJkPg0RBGH+pIYoGPTzXzspPG0+ePe8vLChJ8uT8WVmOOgm52TNZAT8jtQl8mhq4Y2QDs2KRaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750349092; c=relaxed/simple;
	bh=BmQIXJ4BAJNwBIu08HfxrKR1bQ1VXWznNY5Rva3+ZCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SfXSKJzsTC0he6v+6hjeriKk/Jj7n+6AKKcD7oA5cVqSJwbvMJ0mTTBszAfvyTj//4+fSf9E4CEN00qlUxdxaY6v7xgAbaGntOjmU9aInZpqNc4KYk+O6xK7VZkRQIvnykR94lsZE9t1zudFiVNpJ19pANdaS1WiYaWJscS75pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QwWvj73d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QwWvj73d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750349090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnOhBasCiJjIhYRxZYUdwPDMPuwY0WvKyYdO2+gnZTM=;
	b=QwWvj73d102xS1o3/h1Sx6+9r0TYj+nr+ChEcPrQpXwRrRuAMGtX1P5iWY8SJQBJXNwJlf
	eSt9ObpsmzVGggppkLCwZ5Cih1wBJ9Y4RekipPl8LgpfqmMmMWYrYyfA4qe/dQvnAq9Nxp
	ksR/ioJxMT8mSiAly/P35D4atd9ZL78=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-AFXRErhdP_aNRM7WeMFd3Q-1; Thu, 19 Jun 2025 12:04:48 -0400
X-MC-Unique: AFXRErhdP_aNRM7WeMFd3Q-1
X-Mimecast-MFC-AGG-ID: AFXRErhdP_aNRM7WeMFd3Q_1750349088
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23632fd6248so9206395ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750349088; x=1750953888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnOhBasCiJjIhYRxZYUdwPDMPuwY0WvKyYdO2+gnZTM=;
        b=Tkk97K86C4kPX/AdqNY8qvDOa8hQEKtaUYbmKNwnUSWfVFJIm0gFob2GlLtFJHxKfM
         IXA2x1ITu00lCGZwxI0ZSQdUkSxJKv8UFKnFHMlyxdjAjIwdzIXWVzWo4jLe5SAqmjQ3
         j3YbxzwRncnZl4JAnnO0dA5NLOY+/eqg4EJ71aKhFdfNJtQcXyUSjC3lYGfrWsKHokaz
         y1r4+/ebLYNUNIH2k1ZFF1pXR/DrUg038U/zX6Q2T9ijeKry36IR0nABY0/OcuwO6A2m
         LllNE6e4huL4xAqKcTr2cnurXZHscERzL/PZ+qF0L+1yW5SvaI1eUQP+vubSTfNDARsZ
         3YIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDRSk2OnOZl40s5YgtWidUb3rc0XnVA51+8QZP4oCdq7LkMBkaUSwqtLB3PCfqsUe4uOwztk0NjXbHtPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUBMsPumJLmvuNFHoZalhTXmzhQ5l1cLrdVvCeW+J4MvpEiTiY
	R8GrPdSg814Pn1MaFlGszbXX6faBXEmUf4LH8yRt4haIovOD3qB5ATjkGxyFpuNVW+a/8kQ5+65
	L1SLyMTZEkwP7sU/FNfC17tCyrUY01keirvqTAg4HMlKhF0UcFwBOv57hRXmSByEmcg==
X-Gm-Gg: ASbGncufWOGrovmK/V3k7+PQsEz5moDiWGhuS/47z6NNNno9yQ/gl2Lz7tBB+3J4rNe
	c5iLHb0wUettVQB0rIosx+Q96eSiUVTi9QhzndwaGML35fXKlLb3wSBrhuRjRuB8UnXIUyW9X4u
	Wwkuoyqu2HmD35V94Ck+y2hjqIRqgGpxL+wP2hUKePMncJlxyAD++XI96T38Pm0/nR3KQqLA2zs
	1t59hlI8gS/796N8Z6C1LrlVJsqvYE3x8er/vDiH1g1sF9w+2XpvXGGRPmW5c9RaR/VIr3ebZE3
	cjxdgLFVfRtBybWwWRDjCUI=
X-Received: by 2002:a17:902:ecce:b0:22f:b6d6:2737 with SMTP id d9443c01a7336-2366b32e726mr380404055ad.10.1750349087827;
        Thu, 19 Jun 2025 09:04:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjJXAklTpU4bxpt+jnWBfHNJB4kATINyoW2fUcIAggJV9+NymIlKk9BuBUHb5XP9WcmOt80w==
X-Received: by 2002:a17:902:ecce:b0:22f:b6d6:2737 with SMTP id d9443c01a7336-2366b32e726mr380403205ad.10.1750349087399;
        Thu, 19 Jun 2025 09:04:47 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deca379sm121411835ad.210.2025.06.19.09.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 09:04:46 -0700 (PDT)
Message-ID: <18151eb8-60ec-438b-b9fb-026efc8b848d@redhat.com>
Date: Thu, 19 Jun 2025 12:03:29 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
Content-Language: en-US
To: Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "will@kernel.org" <will@kernel.org>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "david@redhat.com" <david@redhat.com>, "seanjc@google.com"
 <seanjc@google.com>, Aniket Agashe <aniketa@nvidia.com>,
 Neo Jia <cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Krishnakant Jaju <kjaju@nvidia.com>,
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
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>
References: <20250618065541.50049-1-ankita@nvidia.com>
 <20250618065541.50049-5-ankita@nvidia.com> <aFLqiAyXZLoOTepi@arm.com>
 <20250618163836.GA1629589@nvidia.com>
 <SA1PR12MB7199835E63E1EF48C7C7638DB07DA@SA1PR12MB7199.namprd12.prod.outlook.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <SA1PR12MB7199835E63E1EF48C7C7638DB07DA@SA1PR12MB7199.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/19/25 8:14 AM, Ankit Agrawal wrote:
> Considering the feedback, I think we may do the following here: 
> 1. Rename the device variable to S2_noncacheable to represent if the S2 is going to be marked non cacheable. Otherwise S2 will be mapped NORMAL. 
> 2. Detect what PFN has to be marked S2_noncacheable. If a PFN is not in the kernel map, mark as S2 except for PFNMAP + VMA cacheable.
   Q: 'mark as S2 except'... should be 'mark as S2_noncacheable' ?
  
> 3. Prohibit cacheable PFNMAP if hardware doesn't support FWB and CACHE DIC. 
> 4. Prohibit S2 non cached mapping for cacheable VMA for all cases, whether pre-FWB hardware or not.

