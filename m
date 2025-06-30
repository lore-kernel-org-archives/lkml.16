Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD5B502BE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751247297; cv=none; b=i1i1pWjhoYX4KeXWnjp3MdM5uSwrMyvOFM70YxcvAhrXYcK4JeOZT0vQn7641NpdzioefQNCULVRUsjsMNDnnFHAk2MOusyQXMpS5R1LxYR6jnvzc/4EnuFZ6F5TPN18N0BjFH+Zpl9GWnvGJwqjEX18ryQFn1Ci1lJ0Oxk/wf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751247297; c=relaxed/simple;
	bh=wF5gotrb9qB+PlS5scQ1TiWZOg8RfnX2uXNbHgGXZKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=in0/Ad+1X0t9SXf+chWmoSjaNh7ciQGFZZGft0C2iIJKa4ZzJdjBTVsp4iLE8xMIC/EWGCtSF/FyqjfWX8ZTzMwQof4QtKcL16IEjYzPoknKFJBytu3LjFsAEMObmLDTM/Ae87Cq3U25HJqmHQyEawo3QANolur9kz43knLnVJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LqZwwduv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LqZwwduv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751247295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/qQH9RJPnonpFeg/AK/zTPsMMa2zq1+qitSA3lVbN8I=;
	b=LqZwwduvST7h2fnfeezRk4CL1qa3dzmpJgxBLmAMg4BkbuvFpKCw6NE8Z5kiFoF/jefXe1
	MHzFRNXKdtAh9VYOK4OQ2s9tst+j/qFSAxP8+yMV9JxyU4j0b4WgzDf5gKB9R8oGXKvGsL
	Q0ViF8rNAWl5PluNJcfmpUt10WWEY9Y=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-uFpXKICuPLOvTKgUhi1g0w-1; Sun, 29 Jun 2025 21:34:53 -0400
X-MC-Unique: uFpXKICuPLOvTKgUhi1g0w-1
X-Mimecast-MFC-AGG-ID: uFpXKICuPLOvTKgUhi1g0w_1751247293
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23632fd6248so12400265ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 18:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751247293; x=1751852093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qQH9RJPnonpFeg/AK/zTPsMMa2zq1+qitSA3lVbN8I=;
        b=b9UDAFfqSSRb+DDpIKtnt/Z0X2G1c2G5BYlA0YMUUNcWLhXwOOFLNuI2DA6QKaTTzh
         8pHP/ld4+xsbi7+6eJkb8rkd2qu1ECgxzUWHS97s5SDgcqELPiTjRKgCewhKIjNVj2Bh
         8CsTTqGkkkNKNvs2MrgazknAyFbXfUrtxXCI5lIIIlFtfIva2tLFBBNCof0Bh0a27Qon
         kAgDtTA7IH1ME8MOSOSmJEjLPX0rqyuc5PYfVafyKgHwHm3ga9t0lb8WkHAwsKxcOFvT
         rKUTUm/QuK8j1WyKty4ZsuiNp2AZ6LcVvC9anQq/WMTr4lMHMgK+arA8z2P60Xfo5Qmu
         f6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1yPpH2B/vLpCoeGsK+ZARoahEL+jaHwGW8ryCC0aw/mitRCC9vuhIaavmMbpgxLY/I3jN4u/HLKn7Hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyvoN7wlJ9ag6qF8wL4mZuT99ozPV1Dw15nQ8tkLSejbgbFkjo
	U18Kr47aKpP8giQGVvRrYi3kkIOda7c+XP/W+vOYoF68pWI0lWwGHLn3EaiJm73/aMLBXSsAOBA
	A9fS6H7bk29oY4u9h8PpB9Xhb/yaHtNU0ZGdTRj5tfb9fFRU/ZBx+FciTwDLMgfjpbA==
X-Gm-Gg: ASbGncvIKwSFkYwU2P19sQeqFfpp6XevQf9qvT9umoaC8VVSp+OOZAebo1Vq/zM2Eck
	2Fh0CthHjP1WB16CC7PHjjhos5YLlhsmSW9NnMDOwunIV6T4i/xyIDa5MGgBPOVT3sJnO5hOApz
	JbX/G/Upr8lVutBW54cQ0W2bPyxM88vjfRm4bglz754Ut6rmhwwEJ2FD1M3rrC1GK8AAAoxRCXF
	AXK/t7UctuDQTm3iGu6VLPP9+V7YcxvkleAlwD+DkuWCSoE68HZGJVggoprSK8StajG9307/maA
	lclD+NUZxBoYXT+QzA1AvCqo5ANiKGZT3aSF2GDVvtpfnsE9NCevvreZhTp9Sw==
X-Received: by 2002:a17:902:e84a:b0:235:27b6:a897 with SMTP id d9443c01a7336-23ac4605682mr190427425ad.34.1751247292741;
        Sun, 29 Jun 2025 18:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHES26D+vJKldUn3WQKkDcVbdtC6ULklx4j6LsOEXcAWhCMBS5RJ3y8LUPW9OLSx0GatAbXsg==
X-Received: by 2002:a17:902:e84a:b0:235:27b6:a897 with SMTP id d9443c01a7336-23ac4605682mr190427195ad.34.1751247292444;
        Sun, 29 Jun 2025 18:34:52 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bc6b8sm66940115ad.203.2025.06.29.18.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 18:34:51 -0700 (PDT)
Message-ID: <b39791bd-1719-4768-9e6d-f8e918ab5669@redhat.com>
Date: Mon, 30 Jun 2025 11:34:47 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: acpi: Enable ACPI CCEL support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, sami.mujawar@arm.com,
 aneesh.kumar@kernel.org, steven.price@arm.com, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
 <20250613111153.1548928-4-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250613111153.1548928-4-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/13/25 9:11 PM, Suzuki K Poulose wrote:
> ACPI CCEL memory area is reported as Non-Volatile storage area. Map it as
> PAGE_KERNEL.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kernel/acpi.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

