Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DBB158545
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 03:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746070981; cv=none; b=jTtdxIk9hReorPIm750vEb4J4rQDRFI2gghjXDAuiIBDYCZ5SbF0WHju3Lt9+hPDHN1ujMZFzY5C5QHstXVdjdPti6zFjj0qHhRP8Pn2v/Q6dYZSjdhSABmT0M8Lt78xLPAeXH+NRuleoUf1jSqDxgAp1LTpXx6NoIgc552jNiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746070981; c=relaxed/simple;
	bh=rCfk93JTwE7IksYYV61B6JuTCbu+HHdPHtJEQpV6aCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVhmNICZxq/dbkPLOZCJr7rTMnLXxzXcf+BYqnmrocWeBB7GOm3wZH62KPZyJ9F18YFlqNExLX8VYGrVk8aLjZ5tWWZMGn0x76B7urhR1ZjQP8+AJRLIVrVHsjok0Fr0cG2XJmsdfDoGIRjrqi0bcXwibxEczgKieyiH9jbN2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XKyAFHF9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XKyAFHF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746070978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JC4AbsVCdLJ1p7UYeSXewTdrjDsKeZ54RhtL8jSgmm0=;
	b=XKyAFHF9nx6GM9PE/5EOToUqSFaTdxXqVR5E/bRfighZzyGzYUiPdbqFUjozPFIUyjOC5k
	2v7FwUx5pMpUlfZzBHpx/yW4rRykPg7eg5EzRblAFCNneJ+l+Br5Sui7D0PcKA7zmmgDse
	g+Y7G5QSCm+NMjkhrt2nvW9zZJVXxtQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-TFLxfsq_MJKO6aROAfRTQg-1; Wed, 30 Apr 2025 23:42:56 -0400
X-MC-Unique: TFLxfsq_MJKO6aROAfRTQg-1
X-Mimecast-MFC-AGG-ID: TFLxfsq_MJKO6aROAfRTQg_1746070975
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2242ce15cc3so6363355ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746070975; x=1746675775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JC4AbsVCdLJ1p7UYeSXewTdrjDsKeZ54RhtL8jSgmm0=;
        b=V7w68srZlJQxTqsfLq53SgiSc67Vqi4C9700w4h+qj9ejNGtsz+nGkrxi/OHEp0S8t
         CnPV9OCNHa3lNM5YiMLqF6lBL/i+2CtLdcnJZZ3KIGQJT2oDTKpOCmW24jPmFFU6gIOF
         mACLQQcAPjlxbqUXBGT+M63r2GNAMNnc18oJ5vdSmUptVC7A2iDxP7F/gpJMMwGME3fe
         3hfT4tf2iTmpU8WneXzD+fd3H7JdLN/IA7dd1qWopleepWGdH8vpArlXOm7qNJumh6N3
         uD8qqKdxHWKMl3ctSCxfUpStC5DizzYo1EE2YXzRGViJYt0fCt2w6U8SN1hF7OrynZm+
         bHJg==
X-Forwarded-Encrypted: i=1; AJvYcCWs+PHg5HcLbrVc4wi+aXvjWSaWlGBzjeH9NAMKq0jNsQkl+7gDkZ1xU+pO29Ct2pZjBXjQwSUke52Vnnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsydNCWched61ZQDPoGAcaqvrPX+10i1zqQ7dfFhqTq4OVOkXk
	gP79sqSnsT4HSyYF3ao7LIKGDLfoztSPqSscvkq4jeuDwo6IUivSTWc3soIhA9Q4n1FZ+zDOyqL
	oNXQwkrMGUoouAnSPuFWk0q65pUZHbo0NpgcgLRn+nssbC50panuhVdowzUUg+A==
X-Gm-Gg: ASbGncukGMaxjMIzFqwcoqoSgtFxuQnkgoF/YJNenhrcYcToVWOLyDQ1a7pEs/6XMV3
	o4Ol3hJbV1oYNLt2YKv4J/238+gJfTkh6ZTZv5QzO6kh79ybzWhpZS9jpXEY15mTUFu01+3rrME
	VVUfKjy+Ipoxf81FOL9vuOelnv2K8eVJcLxbsT/+rQLaLo+tRzEmhO9I24MxRS62irfw/zYh0sP
	L7hkHxYMWm9NW4jvX7fzOqIjjBKdIz3VdA5+6rlkKK1GhTmNmQHgGUDswEiOuAXXQUeaU/UeDti
	MhkehGk5U6kt
X-Received: by 2002:a17:902:f548:b0:21f:4649:fd49 with SMTP id d9443c01a7336-22e0863efbfmr14694035ad.49.1746070975362;
        Wed, 30 Apr 2025 20:42:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6XeA16VOaq6zL1nFcqHpvVwTJjX64McCuJNjLU9eHJvxIX6JXOCTvpbcT/Z0Dp6bPnFYLIg==
X-Received: by 2002:a17:902:f548:b0:21f:4649:fd49 with SMTP id d9443c01a7336-22e0863efbfmr14693805ad.49.1746070975009;
        Wed, 30 Apr 2025 20:42:55 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102b03sm130327715ad.194.2025.04.30.20.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:42:54 -0700 (PDT)
Message-ID: <f61ef14b-9a51-48c5-b88e-518461c988cb@redhat.com>
Date: Thu, 1 May 2025 13:42:46 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 36/43] arm64: RME: Initialize PMCR.N with number
 counter supported by RMM
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-37-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-37-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Provide an accurate number of available PMU counters to userspace when
> setting up a Realm.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_rme.h | 1 +
>   arch/arm64/kvm/pmu-emul.c        | 3 +++
>   arch/arm64/kvm/rme.c             | 5 +++++
>   3 files changed, 9 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

