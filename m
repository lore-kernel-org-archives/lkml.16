Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDD72E11AA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824604; cv=none; b=aOJUPDkJ2+a++g0qXfdBVS4hYbVzhCf3A4P4i2NqL9KfRFzvHZEk6HCwhGFnCAgmkDAZNDh5gDNKxwadaW8UBiK9t+SERe3PCbCJ0FlZpiybzfywTbx6m4sxQ0kfxNBikXqfVY6eb18atVmJ7HJP3/zdMyrYrIeFAufh+7qpJOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824604; c=relaxed/simple;
	bh=84RcY3DfzLp25TcLhTlTuyGAU6oDl+5WCZicaPJ+WkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsjQSC2XI1C7O70QOZSQm9YiwulaP6pNQxr0MKcvyR1Y68wRm8gsx4rx1SXM/yuyv4nwPC5/eVlatnxbbGKDlBnA4g9yzpGH8cnAogkUm9+YbS+rpiry5etc9YxuK28A/UvAjTPoavom77INFEM/kIVAuqvO/z9hVRWpOmTNj/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwCToN27; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwCToN27"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-441ab63a415so24689035e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749824601; x=1750429401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84RcY3DfzLp25TcLhTlTuyGAU6oDl+5WCZicaPJ+WkQ=;
        b=ZwCToN27XnBZuqEhJAoSBWWJiZWgIix8y8IChYUNjm5cd8mE6vm0vXCXQf/KppoTHr
         GB6GXoy30Hr/yfAKkwsVUaD0j3OuCiTykHyG0pNg9eOeSB9Gbj6xdVJ1qLodFQxv+mrN
         aCxklojjBpq6APSE8ZZK3RJOJJILa/4ygGOpaUoMxxFdRisIK6+j5OzB1L2HmGBedsX0
         rWoHHXgDajLycMwhVM7cBdZdYxtFz1BZbxJF30ZWZ/cCKwWAGZqSwuwIUdBdGYO3wRN7
         itBAZtS2id4CoIu6Fk4cFOagMt9m/sqqK64v3J0Pe9zsUcgWGU2XFY36YQCFFs6OYyF2
         e8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824601; x=1750429401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84RcY3DfzLp25TcLhTlTuyGAU6oDl+5WCZicaPJ+WkQ=;
        b=hzWAxFRgyyk5mu4aOSdi3lx5xBS393RC388ClmRVlvMJ3yrqNqzkiAz1lg+/zqspb/
         b7PCxYaKAcrMOqmJ0Ffin25HVfytSZZ5qOeHvLRfsjSd7o/UIKoMvQ8B/LPfMy+Gl0On
         24ToFOwWzpVMZDryVcR2YTya60lRb65gDCXlHu1+p4nUrjtNXxzRvIm6eYL/fNd2JY34
         gjSZF0QP7nGiSd4ptzv/WG/wB1WcF7F9Y+y4enJl/I76xsHWkkQptNVjYcl5OfXq4m7k
         TMRZEwkXgkQgDzA1rfZZtf7kFD5D7smsURQM/Wp0e+MsYzBVeJEY7/bLIAWwyB8dGaQe
         TZiA==
X-Forwarded-Encrypted: i=1; AJvYcCXidxpF25XrieGDosn44b0Xj4gmNS60JDk7NUj3iUSYYOTUXr0SwYWT7DPr8r9XszZypb7/H0EHyAmgV5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzceA96SAPts8hwLLRryu+DJaChIL6zU05X2u8lVlp4K3SOLfsx
	5oJfKhJO2B5ItsyVkp9u81Uyt7p42Jz2kVGbOuhZ2ePJm4oQ3a45PDPS
X-Gm-Gg: ASbGncsfYW5UItHypqx/kAcHCzQWUwT7ba7sLXqlTx3xxpuMNUJafSIWY0xv9vAUuwk
	zdZLyHg/XlamR3WhHrzXMBmZUwSzHfVEF+H7gV/RpwADX5AxTDh/8B4N6TQTeHr1tWABsi//lbo
	G53P5Q0YdwSIf61ykWnxbe0n8IEWjfEwjxDfDh+EFdOlvlqtZyOxhl/IjQKz5J84IO61kWrk4lS
	fu9VgXPsYdkl0z6Rn5yWp4Pb6EtHqp8H4wE1OitRDG54ESMI2L1wxLQlhhqokFzS0UhAMRiUqEL
	xdCbwJDT9VQtNcCzAvqY+ic9GzsH5xifwOC61G9ZKlsOqBg4ja8ciwDQzII0rVAZ5rFLfhruSL/
	fIlHmLeN1WEi+EynHf1ibaBD8DSim0b8bNBAPN1KdZLcPhOXXhhi5dQ3Jsw==
X-Google-Smtp-Source: AGHT+IFgxrebvzgWr4HuigiiNgf4KeU1NI+nQXYGx46ksABIGgE/Qu352CXSVtYKZn6vksiHyzfGRA==
X-Received: by 2002:a05:600c:890c:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-45335675dd1mr22066855e9.27.1749824600913;
        Fri, 13 Jun 2025 07:23:20 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4cc7bsm2486501f8f.86.2025.06.13.07.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:23:20 -0700 (PDT)
Message-ID: <cb6d3f39-e0a2-4618-b36d-fff8724bf619@gmail.com>
Date: Fri, 13 Jun 2025 15:23:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com, david@redhat.com
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/06/2025 09:00, Baolin Wang wrote:
> As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
> the system-wide anon/shmem THP sysfs settings, which means that even though
> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
> attempt to collapse into a anon/shmem THP. This violates the rule we have
> agreed upon: never means never. This patch set will address this issue.

Hi Baolin,

I know never means never, but I also thought that the per-size toggles had
priority over the system ones. This was discussed in [1] as well.

My understanding with these patches is that if we have:

[root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/enabled
always madvise [never]
[root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
always inherit [madvise] never

Than without these patches we get a hugepage when we do MADV_HUGEPAGE, but with
these we won't get a hugepage anymore eventhough hugepages-2048kB/enabled is set
to madvise?

I know this isn't ABI, but this would break existing expectations.
(For e.g. we have certain 64K page size arm machines with global enabled = never and
2M = madvise, and we want 2M hugepages to fault at madvise).
If the whole thing was being implemented from scratch, we should have definitely
done it this way, but this can give a people a nasty surprise when they upgrade
the kernel and suddenly stop getting hugepages.

[1] https://lore.kernel.org/all/97702ff0-fc50-4779-bfa8-83dc42352db1@redhat.com/

Thanks,
Usama
