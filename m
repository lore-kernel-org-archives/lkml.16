Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA7B28DEE2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716972; cv=none; b=d8R8CxEA4pzVq5C7KQwU2VmS0TsS5YUy0Rw539sDpWZNjBwfDg8NaDCsAHk7F0ghAY7izRcjn49ORnLTwBW34ZZm0tloxbElrgwtBsB+6+y5tDg7+APQUEjY5vsDk1nGiow914je7ZTnYEmOkV3W29Q84lEzoMSz3ieZDyPjOE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716972; c=relaxed/simple;
	bh=ecxh0DIByMnHf6ygrYZHPedHniG1Gc17UjqLlCDNNks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5ksRkh6yfWJCqtSvC6NBENQXsKzWiE0tH8zFQy4/uTBbM0ExkaxGu5xenB3uuxuwKBjDpz+KrJ5Ar9OnNI5y/Lkk8Cw0B7wZHsdBldnpT8fkpzCxmY4IMbR50InnbMAW59LpRzGGt6U4FMmS+rwx/fkfVD8Gqc2CUBjp4yndtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=huCG0Owu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="huCG0Owu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744716969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lXumDY4xCMKyDj7D8VQa+feWOdO7T/uIrMyU2wfkHqQ=;
	b=huCG0Owuxu1rsuWNK336525M3QZbkfkE4QFWYrJ+2auqXZF0xcHP3UXrtDrHUcrKiGnB5T
	U8hBeOMMaS0frz9vK2Ev010xMJroJBatVGi69TWfJcKzuMkeLpnJkSKJH9SnOwQP4d1wfN
	xNEHmK1lNavhd2+mL0B2c9aVxAr/al0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-brveIaBdMMGdMe70KWjXNw-1; Tue, 15 Apr 2025 07:36:06 -0400
X-MC-Unique: brveIaBdMMGdMe70KWjXNw-1
X-Mimecast-MFC-AGG-ID: brveIaBdMMGdMe70KWjXNw_1744716966
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d08915f61so32380365e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744716965; x=1745321765;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXumDY4xCMKyDj7D8VQa+feWOdO7T/uIrMyU2wfkHqQ=;
        b=os75dneaoGAizYXKyY/FFHOa521OgZ2izXCnidNESj/8iHjGxLe5JmF/Co+LSQEPmP
         kBb7po+7cCocmkQ3T3IcAVcyUip4ez2Dkoe+S6g2QY9nK6U4ANXTP2gvjClu6t/PbbkW
         U7LoRCWO5Y/KW8hwhhaWW69JRHTzwuwoZf5WekQW6NvcVr7s2mSd1IyVdpcYpmxqUdLt
         81td0wlX0uikelWH9rymsW0hEV4Y+XCEO94AGZ3DJOv2CBy3JnJdLjCVgIql1a/4/Wx2
         usdi61s72ffAX8sLYKuUN9E80vR91qcdOyl9LWtK1BhoulYIaDADXEcwAv5Tv4Oef8Gv
         +vOw==
X-Forwarded-Encrypted: i=1; AJvYcCUPWHf/U2XE07X91tzqVUZrWiVDsxoW1ErsrHOXD7IvKagyFInSGUBc0MQW1/yFyV26NWrnKVYhyl6ugWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlB/kb2tpAjYI8bjVsnwXYJuuZGH38/qPxgvxLSXcpla+1HzIn
	tYSe4klXXLk4R4XwyE+0RaIj6SIRXlBHlk+RFXMKpPjF3KuZyMihMGbOJu/TfwnRYAB3+aoZRyM
	vlk6yC0XgugL3WhVuPo9bETs6SeLLiu/DNpeaf+F16LAgjKJUN4dfFS6IbUbn2g==
X-Gm-Gg: ASbGncsx3B9HUKOg8sfGt0zfdpdM4g+dBV9J++Go8kat+z3L8MxmWx5P3fy3K253JEF
	A3KQrkUYmAn3w2ajwODNoGD2xP1crvG+YsUHlcfBx2AZvfTlo7ptYgpGtft0jqrueoJGSUgtr1O
	reJEbKvkB420ztUB6FN4hDT+Le66wndu5b9sd2FCWisf1lzhkmVE8I/U17aBL/ZLnA8fEEDL5HH
	6iFyHoLoTgFM5Hke6+QtDb7bucSYbhxnX0gMvD4KvvwESSzb+BKusXrL7YG0WjVVZ6T5Eh1/EVZ
	x8BEF22GT17dJilV
X-Received: by 2002:a05:600c:1e18:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-43f3a9aad9dmr116295565e9.25.1744716965522;
        Tue, 15 Apr 2025 04:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENkTE6bgF5Rb9zhuxM/+FO7GOrmCPiOvR+9BRMeJxMAeIAq7zucZTzAlJuAYb8wTmelGeqiw==
X-Received: by 2002:a05:600c:1e18:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-43f3a9aad9dmr116295435e9.25.1744716965159;
        Tue, 15 Apr 2025 04:36:05 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.109.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43f2338dc13sm213154095e9.3.2025.04.15.04.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 04:36:04 -0700 (PDT)
Message-ID: <e6606b04-6154-4823-80a3-dc47392dcc59@redhat.com>
Date: Tue, 15 Apr 2025 13:36:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/67] KVM: x86: Reset IRTE to host control if *new* route
 isn't postable
To: Sean Christopherson <seanjc@google.com>,
 Sairaj Kodilkar <sarunkod@amd.com>
Cc: Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, kvm@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, David Matlack
 <dmatlack@google.com>, Vasant Hegde <vasant.hegde@amd.com>,
 Naveen N Rao <naveen.rao@amd.com>
References: <20250404193923.1413163-1-seanjc@google.com>
 <20250404193923.1413163-3-seanjc@google.com>
 <ad53c9fe-a874-4554-bce5-a5bcfefe627a@amd.com> <Z_kkTlpqEEWRAk3g@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z_kkTlpqEEWRAk3g@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/25 16:16, Sean Christopherson wrote:
> On Fri, Apr 11, 2025, Sairaj Kodilkar wrote:
>> On 4/5/2025 1:08 AM, Sean Christopherson wrote:
>>> @@ -991,7 +967,36 @@ int avic_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
>>>    		}
>>>    	}
>>> -	ret = 0;
>>> +	if (enable_remapped_mode) {
>>> +		/* Use legacy mode in IRTE */
>>> +		struct amd_iommu_pi_data pi;
>>> +
>>> +		/**
>>> +		 * Here, pi is used to:
>>> +		 * - Tell IOMMU to use legacy mode for this interrupt.
>>> +		 * - Retrieve ga_tag of prior interrupt remapping data.
>>> +		 */
>>> +		pi.prev_ga_tag = 0;
>>> +		pi.is_guest_mode = false;
>>> +		ret = irq_set_vcpu_affinity(host_irq, &pi);
>>> +
>>> +		/**
>>> +		 * Check if the posted interrupt was previously
>>> +		 * setup with the guest_mode by checking if the ga_tag
>>> +		 * was cached. If so, we need to clean up the per-vcpu
>>> +		 * ir_list.
>>> +		 */
>>> +		if (!ret && pi.prev_ga_tag) {
>>> +			int id = AVIC_GATAG_TO_VCPUID(pi.prev_ga_tag);
>>> +			struct kvm_vcpu *vcpu;
>>> +
>>> +			vcpu = kvm_get_vcpu_by_id(kvm, id);
>>> +			if (vcpu)
>>> +				svm_ir_list_del(to_svm(vcpu), &pi);
>>> +		}
>>> +	} else {
>>> +		ret = 0;
>>> +	}
>>
>> Hi Sean,
>> I think you can remove this else and "ret = 0". Because Code will come to
>> this point when irq_set_vcpu_affinity() is successful, ensuring that ret is
>> 0.
> 
> Ah, nice, because of this:
> 
> 		if (ret < 0) {
> 			pr_err("%s: failed to update PI IRTE\n", __func__);
> 			goto out;
> 		}
> 
> However, looking at this again, I'm very tempted to simply leave the "ret = 0;"
> that's already there so as to minimize the change.  It'll get cleaned up later on
> no matter what, so safety for LTS kernels is the driving factor as of this patch.
> 
> Paolo, any preference?

If you mean squashing this in:

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index ef08356fdb1c..8e09f6ae98fd 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -967,6 +967,7 @@ int avic_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
                 }
         }
  
+       ret = 0;
         if (enable_remapped_mode) {
                 /* Use legacy mode in IRTE */
                 struct amd_iommu_pi_data pi;
@@ -994,8 +995,6 @@ int avic_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
                         if (vcpu)
                                 svm_ir_list_del(to_svm(vcpu), &pi);
                 }
-       } else {
-               ret = 0;
         }
  out:
         srcu_read_unlock(&kvm->irq_srcu, idx);

to undo the moving of "ret = 0", that's a good idea yes.

Paolo

