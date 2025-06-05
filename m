Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530DD1F30B2
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095730; cv=none; b=lJaoLxpBWJN1vcWmhOJXPrL8PHoQTXr7YTG7G9h9rmTADOPtItRzAVx9EJ3ZPRPlz312Kdd5y9JdVZoy5UZvgO307PrB1x0c2F3qZpYM6LODWJchHBiOQFTRC4OsLcydj9o9mdQ1O17yiH+tHjQ7rT6iyzls9Yv6UGVffVaC+gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095730; c=relaxed/simple;
	bh=6vV8BBBuLBseH4drZNDS1JiYTzhPY15/Bct2tXlZ1l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y6p6Aih7iKiO2bIM0YxtOqTkAV3odi9UxVv8KmnWg1GouyCAXQHE2V+K3tIycNd8C0Ct/rneob4SQoAu88LNNmeORyA5e4LVGd1QNpEIUZtjCUSQtb03c7hWSmisHpAbA08kW9Jefk7OLyK7ltTAy6vFywDshNGGIAEMSr1lYGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rg38A2ZR; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rg38A2ZR"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so385337f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 20:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749095726; x=1749700526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFw1hVm4aqEwlAr8rCOCLfQ9NHkEpt5q96evQjKko24=;
        b=Rg38A2ZR+pFs0Fu/u3YaCQXsyaOmWMPJz/3FfRx7uj7r0ZjD13wtpEytl0hZG0VmjH
         sJmw5FI1Gye+Bi2StfUljj+vQhfIzCpered0LEgpQ83POfIbjOpKHCRdBor15NZCQ88I
         CtDRTtQzUyekpoxMmA3AUAKYjKdr8SosBVMNJDop+SEQ0f7OL+WyvMn+PpHLJp/1VqbW
         rNlYKJrz/4D5Cpyo4d9fTVI+CNxcfCOd9ELN0H4Nk4e5B0kYxcxyKYs4xOop45eT4Dwy
         F6IQjmMX8QMWG1GPkWZTBqe1qaW51KsuRF2BgXs3Eaq2FJMM+aIjzPBVHJD0MpqWCQFZ
         Rvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749095726; x=1749700526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFw1hVm4aqEwlAr8rCOCLfQ9NHkEpt5q96evQjKko24=;
        b=hbvrD796yKGqRbok7MEKkXaUGf/+O4rQ/uC+O10TUimdy6aiHBdBgw5fwTk1eQdU2b
         T9CzW0o3X8shunUK8w9o+Lpwh4b0yZYhF1HK3LdyHmpXp25A8ZslFcE5J/PfsfOZNY0O
         CF40sYCjOz4IZ2nviwp8hpqD0U6L4/TUQ6ZsETk5S5dfwa8fY9nPOtjMB/TcfCWlJ/UY
         eunW+6erF0GrLLJ5NbhKd0MQ/NdIGv9gqQTfqWgxoJLHvrfo6t+DceWm+SKdmtSRfj8j
         7ANieGYDuw9DzmKElo0sUtwQiz5iU2EnB6sWYX58c9JD4qpX0NCT+QSSXcxZKifOv79G
         6z8g==
X-Forwarded-Encrypted: i=1; AJvYcCUPpHIY5oTRqVbBopmrosmPtVpJ+vlHDUb9TpCKP+t4Mj0PwzTRayv2BzQhHObOByGJEbRiD6rZ8OObBpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfHZodOJdHt5d2DWfv0FVqGJsgbrxsNoGzPmd1N8fWrWLw4cd4
	dvsP+xAmOQs4a20Y8JKOXWH/qWfqe1bknwqXKWobAhqaV4iVwTyCx6gS
X-Gm-Gg: ASbGnctR9m0v+KjtHuL84JNcPqzE+bad9TGY8+WI95qwYOqWOdE0IGZLwLPLJMXMMID
	PZvF+PDm6eYabyD5yvN3YCqXdohFCNxz2bNqeL3fkF6Va0BXTCNk2SU3odXmFWJEfz/7MFo70Ml
	owI1SA7R4QoJfwZ2BbxLaWa84YEuAJlhGhgVQeKqxPO/goOXAyXGyqvMV4y4+1ckYhTFFH5DKa1
	sNAUw2zIKGyGqbts0yJOJmHOWBumcd7/JSLBNOS6BaCabnmLe2AwYRCrcwHmnoQhpy5K4CsAwC4
	S9PMiAc2YoZ9GYK3VAZ2x7HgkETK4NtXpRffzUuy0pTQnXWOpmm5R8h7GsM0MenagVW3HjS+UPh
	zYFuakH0BksOvU0vH8vhSAfoYPUNkFhrT6TSyPD92SkPnajzI3W4Ih210j9OzSpcdut4=
X-Google-Smtp-Source: AGHT+IHs9o7cJ+ssmBhszqk9ddF0qXxrKNkv9fb9GFLwxoeRPawQyEP6ki2Pz/VW8vyNBzgyPg9SqQ==
X-Received: by 2002:a5d:5f51:0:b0:3a4:f430:2547 with SMTP id ffacd0b85a97d-3a51d8f6105mr4140212f8f.6.1749095726307;
        Wed, 04 Jun 2025 20:55:26 -0700 (PDT)
Received: from [26.26.26.1] (ec2-18-153-191-229.eu-central-1.compute.amazonaws.com. [18.153.191.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a52bd85d51sm192467f8f.94.2025.06.04.20.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 20:55:25 -0700 (PDT)
Message-ID: <d32ac499-fadb-401c-bb8c-9c3616da302a@gmail.com>
Date: Thu, 5 Jun 2025 11:55:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] iommu/vt-d: Remove dead code in
 intel_iommu_domain_alloc_paging_flags()
To: Baolu Lu <baolu.lu@linux.intel.com>, Wei Wang <wei.w.wang@intel.com>,
 kevin.tian@intel.com, yi.l.liu@intel.com, dwmw2@infradead.org,
 jroedel@suse.de, linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20250530091325.694456-1-wei.w.wang@intel.com>
 <f1f55968-28e0-4c5d-876b-1c5499b3c01a@linux.intel.com>
Content-Language: en-US
From: Ethan Zhao <etzhao1900@gmail.com>
In-Reply-To: <f1f55968-28e0-4c5d-876b-1c5499b3c01a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/3/2025 10:39 AM, Baolu Lu wrote:
> On 5/30/25 17:13, Wei Wang wrote:
>> When dirty_tracking is enabled, first_stage is set to false to use the
>> second stage translation table. dmar_domain->use_first_level, which is
>> assigned from first_page, is guaranteed to be false when the execution
>> reaches the location of the code to be removed by this patch. So the
>> handling for dmar_domain->use_first_level being true there will never
>> be executed.
>>
>> Signed-off-by: Wei Wang<wei.w.wang@intel.com>
>> ---
>>   drivers/iommu/intel/iommu.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
>> index cb0b993bebb4..1145567c60f9 100644
>> --- a/drivers/iommu/intel/iommu.c
>> +++ b/drivers/iommu/intel/iommu.c
>> @@ -3418,13 +3418,8 @@ intel_iommu_domain_alloc_paging_flags(struct 
>> device *dev, u32 flags,
>>           spin_lock_init(&dmar_domain->s1_lock);
>>       }
>> -    if (dirty_tracking) {
>> -        if (dmar_domain->use_first_level) {
> 
> This *explicit* check enforces that dirty tracking cannot be supported
> for a domain that relies on first-stage translation due to the lack of
> enabling/disabling dirty tracking support.
> 
> While this might appear redundant, this prevents potential issues
> if related code is modified without awareness of this dependency. 
There would always something sooner or later like this to stop the 
improper configuration/coding , under an assumption that caller path 
always coded perfect, indeed, we could remove a lot of error stopper code.

But that world seems never works like that.

Thanks,
Ethan
> 
>> -            iommu_domain_free(domain);
>> -            return ERR_PTR(-EOPNOTSUPP);
>> -        }
> 
> Thanks,
> baolu
> 

