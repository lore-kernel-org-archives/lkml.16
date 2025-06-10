Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D768923ABBE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563460; cv=none; b=EcJgIrIvoI0p99NG1N/RPQYkY+m2PbVZvsCJmDJc1IJqzFZOjoHwFmcbgQEAFpYQY/btW3/CteN2S+U6faEBXBPRx7NCWRmRyuqk5CKoxXpCmahzlt6QQztm3UcUUi5od8s9+JzYtgu4nmqPAl448aoNsLxTMrP+p+/DSs0ZIUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563460; c=relaxed/simple;
	bh=h4S4qXsxNClFRPavFrSL5VPIFTv8rXbohKWGXFSTiEI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bWqrAQvf5Wpz7c910LAp9mQrwajWMQrseMvRkCdJGX7BHHJm87TI/KE6LRL+D5HRURf1MQkAMEpwl+C7DyfIBHAJj7Wc3zODs0jIwdrzQ1NhIpGExDe5C7opqXI94YoKnLpIlfv5ubBwcixsJGKyJjbKvj7tlfBue7I8K23rVWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C0Yn2Zwu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C0Yn2Zwu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749563457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8AZiv2BWFM4GhtysbZzbwwVGm/Lo1Gm6qrn3+2ylp4E=;
	b=C0Yn2ZwulvUaDHql3SezRUSKmbP82HvHe8XZ9k5ZU/WD1kxbPyxVdOc6qoItg9h/9lgHOk
	/CUGk6KxH/vaU65oEgR4kPSFP7eNzciDTBbViB2ZXAXzXqhEUyOSPOKriLJiUfUZcsGVk7
	k42gFAozzvvDuBUBWRbMWVKZIipoXZ4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-N0VTtoR_NdexmYwreD0ycA-1; Tue, 10 Jun 2025 09:50:56 -0400
X-MC-Unique: N0VTtoR_NdexmYwreD0ycA-1
X-Mimecast-MFC-AGG-ID: N0VTtoR_NdexmYwreD0ycA_1749563455
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso2519413f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563455; x=1750168255;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8AZiv2BWFM4GhtysbZzbwwVGm/Lo1Gm6qrn3+2ylp4E=;
        b=EoM/KR6SNZ/CnuqV9SXXDEA8YURW0Q4rLvUd+RZwDzvn626hEncVCRl8VNgGzcwZCo
         vaoHzxjoPR99XHYGwLs+HPfB6Vkvs+hpsvwDx7SZviuWAUk1mcMLEKvkJPyZznYMWHKI
         A18vQ5RL+Bzd0SieFGPp7SpcKUuenK9tDwavQ+nBX0IJNt5/3JrZduYRC1zho/E4vj3M
         CemLNuWwi1UL6zpnooHQ+YEiW45rKA9rD3dwuMmHk6rhS9G2UiEZIRwyn54DEPMju8kJ
         7ciKpzKijpKI50ZG0YVfkueYJJcpAQcsXX8S4TRtbFuAzbQ0OJ9D0wezrJOoLUro7/CI
         JmPA==
X-Forwarded-Encrypted: i=1; AJvYcCXpAHCoqn7hK1lNkMkjXI57lISVqfuE2UHjsSiEaYN2y+AIY7OzIhxOa/0+3nZw5Y8mDo/4Ev13uBvhESk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2M/nBaMCqzAz9NOnloVSB6F1+yXX3eEPFh/03vo47wi42qmai
	6CP1cnVrMdejeDaNjPFDX+v69SOjlFkvdjRJQHeMsur/pNqppa5VmUpEHzrv2DEfAbPKd5A1GDo
	SLga1bgxZXXGM5bq97pgIwOcVwA/o9vlh6PgydbSNszqzMoXM2J8rUdL06gjVWnrx7A==
X-Gm-Gg: ASbGncuPqq4mBEdNIPNj45Dd794/Vql0GeW+RjfJfff//k4eS02fXnAUE9+Mg5nwPzK
	dm/qODxnoPg61qNjuVeryt0/VYNCw+CrzdyvSm7c2O38Y3Ubyapp/jJ+CNgjrYZb3q5PgASYmo7
	CI2hF6R+1L5auuzM/vA1v8mv9qaSQHw8qSn4DlLEhSGxyRVbZN2qb40NZHqa0dkcnQrbMQLOsV6
	2Idfsnuj97JkHbhLzeyEr1DUoDV0iwyJeenQeEle31uL/nfIov1LieUjUMPNxLEE+8M+Wrx7o9e
	ODinmNHOUy2/ct6RJKpw6fK5BGlf5aldAKFhnen8zKblOKYaRm4OVw5+nycUHsEaIPZRm2k=
X-Received: by 2002:a05:6000:2389:b0:3a4:f786:4fa1 with SMTP id ffacd0b85a97d-3a5316841c4mr14614325f8f.2.1749563455528;
        Tue, 10 Jun 2025 06:50:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJKrB4JYjJGiymCLMDjzBOek1jTekdNGl4zWkT4PdFepViV8CQdeLU5rPmaZjMcFcjiosmIg==
X-Received: by 2002:a05:6000:2389:b0:3a4:f786:4fa1 with SMTP id ffacd0b85a97d-3a5316841c4mr14614288f8f.2.1749563455083;
        Tue, 10 Jun 2025 06:50:55 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452fba4621csm131448645e9.13.2025.06.10.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:50:54 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:50:53 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Miguel Luis <miguel.luis@oracle.com>
cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
    Colton Lewis <coltonlewis@google.com>, 
    Ricardo Koller <ricarkol@google.com>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Zenghui Yu <yuzenghui@huawei.com>, Shuah Khan <shuah@kernel.org>, 
    "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
    "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] KVM: arm64: selftests: arch_timer_edge_cases
 fixes
In-Reply-To: <B77F70F2-EECA-4E10-9F00-972F6AE27831@oracle.com>
Message-ID: <8f15a5d6-0f73-194a-8fa2-b7ba8cc8c5b2@redhat.com>
References: <20250605103613.14544-1-sebott@redhat.com> <B77F70F2-EECA-4E10-9F00-972F6AE27831@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463806286-426200590-1749563454=:18875"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463806286-426200590-1749563454=:18875
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hej Miguel,

On Mon, 9 Jun 2025, Miguel Luis wrote:
>> On 5 Jun 2025, at 10:36, Sebastian Ott <sebott@redhat.com> wrote:
>>
>> Some small fixes for arch_timer_edge_cases that I stumbled upon
>> while debugging failures for this selftest on ampere-one.
>>
>
> I’ve tested this test under three circumstances:
>
> 1) Original (!HAS_EL2 && !HAS_EL2_E2H0)
>
> 2) HAS_EL2 && HAS_EL2_E2H0
>
> 3) HAS_EL2 && !HAS_EL2_E2H0
>
> Tests 1) and 2) returned in approx. the same amount of real time (about 12s) although 3) doesn’t
> seem to return at all.

I've never really looked at nested stuff, I'll try to set smth up and see
if I can reproduce that..

Thanks,
Sebastian
---1463806286-426200590-1749563454=:18875--

