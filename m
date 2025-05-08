Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F9378F4E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 00:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746663896; cv=none; b=dm1S/ALvqqwfkviGMdA+/TmUcqukgRFAmUt1UzbqyBG6l8lEuiddxYBBunMzAQRTZHkTTIh7gh8oRdwEIdeGe/gRqR5+p3MNCxIkzAUWxRR6eGKvl2Aym867RT9TmcBysrvjxDy8LgNYbijCeOhijLeGaa1FPGmVn5EoxwooebU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746663896; c=relaxed/simple;
	bh=+M4FEN/6VWjOBMZr8f0YY21+Z/Xd00SqsGaVddREc0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxRMaWqnx6Uw7O2uxALPGeKVHyt/8PdgBfuF+mkkDtH7LRcEdjGO06+sZyhcoOBH2/wV8ZDAfsD1iaIIWtjmFt3Sq5FuLNCYxcvFGAs75UB6gg2huzuGsIwRp6dI0kzx8J7EZa+xwRnWHFy8nPL6Ib0RpT+nsK1DZ4xPK8lWu2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UJ1Og3jl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UJ1Og3jl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746663892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9HgcA+GEZvObAcEh2COOJwVolQxRQjimAkm+36NZ3tU=;
	b=UJ1Og3jl8lIQ4DqoeLKlmcAZoVzqdi0SDoOJSAU9c5diQMeZS/RIqXDWXWRYNqpzD+r65w
	HKsvLRw4zPeIz5nWCYI8R921hgY7nVbkvPjO4HU7ze9e1ffh40LwUphTRelYFriyKd1Knq
	aV+t1XW+eAX8vUUA/iUqj/goZJO9hbM=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-kjpPBwlhNG-_BhHsvnq83A-1; Wed, 07 May 2025 20:24:50 -0400
X-MC-Unique: kjpPBwlhNG-_BhHsvnq83A-1
X-Mimecast-MFC-AGG-ID: kjpPBwlhNG-_BhHsvnq83A_1746663890
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b1d9f278aecso195226a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 17:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746663890; x=1747268690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HgcA+GEZvObAcEh2COOJwVolQxRQjimAkm+36NZ3tU=;
        b=Ml/Yw02K4zBPwz3pmlwngXHrfu/VmTA9txqoBUMjSpXU2rJ2aropNPx5iyPwLZbEHa
         5ZYpJHd1HgkuXOlcBawzpNXGBDzzm66v1shOxUk8rLOVuyxxl4BKff0C/jpyO92X20L1
         +ufQFjTXl0VsPo6HnCMTZHSAQE2frPXUny00Ck3ghF4QO6uJuzHGKXIWZgki+rsU7zMB
         ggKk32+rb70pKzBNwyBnqGfZETa7iQAhnhw3MUQnyUNHZB8Zwv77Y8ZQgnY67gvXj8Q+
         tYrHvE05YjIwhMKHzkh6Pgb7LL2cpbYTEZkXx4h4bKp1nWdzXRkcpO2WEsBbhAU4rS46
         KHBw==
X-Forwarded-Encrypted: i=1; AJvYcCVc+2sAjRoVVQGm0b/mOF5YexyzlHKrgmq+yXYUK4ndyxe9I7YN2w9F55EkbBUrEZWjDBJ9oV5PJA1Ys8o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7b5HO3rVX9w+2vXg1HzvkfHavGqUfDMvEloDonj+QIVUhWpfj
	F+r0H54MomyCWwP93HLMounXwg9WwBPGAi1UeJwFtl2lSNqFjKnKkrAHD7Z6geWaQhXwi5LA0jH
	4Mv+o+3o+mVQqRqF2jvEh5K6ptYuiht51HWwnoqMaIaVLfzatBqmYF6IrfmiNuA==
X-Gm-Gg: ASbGncvmKVZdW4uXdAwcnnfrFapyodwRplXlLPmpTW8EsiqYiC2t6kVG7Wz7iLR4JS1
	zTAmlQREv8e5swuSDq95oNFZ6iVGGclUNoXBqdBv7BD01D0zj5n4A++F4tBvlUMbE6+xeVc2bZs
	f4c0PGMrdjZ/oT3MQlY9ZEeql1QDNyIJPR00YupkaWi81WaybzC11m5WhGCKMgRRrE3+jWsAbS5
	rWrHbTPSp4N7NOUgTV7ZJPvbmKw2KlrFdjjnA0ZgQ1qdg0qTXEi4gJZHGyaUiBnGQbsTHWTTuQj
	9Kp2QS41RP6f
X-Received: by 2002:a05:6a20:ce47:b0:1f5:8153:93fb with SMTP id adf61e73a8af0-2148bc11565mr7275558637.10.1746663889870;
        Wed, 07 May 2025 17:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkSEc0BIT0XhNYV17IYbaP5fkwntd9qeYQtp9PZH0RGNmeuFUv+jl9d36QtCKWb7HSgaLewg==
X-Received: by 2002:a05:6a20:ce47:b0:1f5:8153:93fb with SMTP id adf61e73a8af0-2148bc11565mr7275523637.10.1746663889500;
        Wed, 07 May 2025 17:24:49 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c697a6sm10158269a12.63.2025.05.07.17.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 17:24:48 -0700 (PDT)
Message-ID: <5b8ea515-788e-44b8-b7d3-a85329b584dc@redhat.com>
Date: Thu, 8 May 2025 10:24:42 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: SDEI: Allow sdei initialization without
 ACPI_APEI_GHES
To: Huang Yiwei <quic_hyiwei@quicinc.com>, will@kernel.org,
 rafael@kernel.org, lenb@kernel.org, james.morse@arm.com,
 tony.luck@intel.com, bp@alien8.de
Cc: xueshuai@linux.alibaba.com, quic_aiquny@quicinc.com,
 quic_satyap@quicinc.com, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@quicinc.com, kernel@oss.qualcomm.com
References: <20250507045757.2658795-1-quic_hyiwei@quicinc.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250507045757.2658795-1-quic_hyiwei@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 2:57 PM, Huang Yiwei wrote:
> SDEI usually initialize with the ACPI table, but on platforms where
> ACPI is not used, the SDEI feature can still be used to handle
> specific firmware calls or other customized purposes. Therefore, it
> is not necessary for ARM_SDE_INTERFACE to depend on ACPI_APEI_GHES.
> 
> In commit dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES
> in acpi_init()"), to make APEI ready earlier, sdei_init was moved
> into acpi_ghes_init instead of being a standalone initcall, adding
> ACPI_APEI_GHES dependency to ARM_SDE_INTERFACE. This restricts the
> flexibility and usability of SDEI.
> 
> This patch corrects the dependency in Kconfig and splits sdei_init()
> into two separate functions: sdei_init() and acpi_sdei_init().
> sdei_init() will be called by arch_initcall and will only initialize
> the platform driver, while acpi_sdei_init() will initialize the
> device from acpi_ghes_init() when ACPI is ready. This allows the
> initialization of SDEI without ACPI_APEI_GHES enabled.
> 
> Fixes: dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES in apci_init()")
> Cc: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
> ---
>   drivers/acpi/apei/Kconfig   |  1 +
>   drivers/acpi/apei/ghes.c    |  2 +-
>   drivers/firmware/Kconfig    |  1 -
>   drivers/firmware/arm_sdei.c | 11 ++++++++---
>   include/linux/arm_sdei.h    |  4 ++--
>   5 files changed, 12 insertions(+), 7 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

