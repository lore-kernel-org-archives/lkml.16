Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF1035950
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751247275; cv=none; b=ikFpQbUgy+q0V8MhuGYddk6oN7yjPLBE0x81b4/YKqAmk2Ke6RcPjzsuRRMIzTbUS+2T2KU48VA1gUWRkwcGiogUdM+KQNKGZDHPHi+dZJQ2+45J3OJcyKpj2uh+uHoEo/FB0ZxYbrzhQ2xXXp/uFJLwtH5o4Bw954cQlrc35V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751247275; c=relaxed/simple;
	bh=2JlZaTJSDkX8TZZvTYlR+Sb3OM0lhNCMJz0amSxdz/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USzymBgx52HckTOunUEPu3UiKLWjNiOAVRQWFwPm5P+kWSMcLfzKEwcnPNMEUMUX4fj66eNhxyGMlzOy0f/+uHfQpcvz80xwOLFHvKxyFnveiPhfwl37InycK69vyCe1pmnTYMHXlehW6MrGDdPOwjQ16GpGUlUNUUl7rfjDUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gOdZCGhk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gOdZCGhk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751247272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qkaiG6BzF1PG0uFh9m4Zeh0OUW/5zOqA3hn+Jr8DLpM=;
	b=gOdZCGhkHBhF2K+Ax6o6xbNoXi92JUHyje8UvYw6OaW/9dJihAQsuVpDuqsRupJcOl0nnY
	sCJnvPQKc2+KN3JDq5B11wL4ekaY5Cw0uAlGwcRB8AtZFKBX5uChdCpIngzn5eL9v0Nq+k
	1Qtb1duA7qTfeLFHM9EvL0dsuxL5jxA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594--8VqDLtmMyuvBdhgizJS0A-1; Sun, 29 Jun 2025 21:34:30 -0400
X-MC-Unique: -8VqDLtmMyuvBdhgizJS0A-1
X-Mimecast-MFC-AGG-ID: -8VqDLtmMyuvBdhgizJS0A_1751247269
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e3f93687so23680005ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 18:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751247269; x=1751852069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkaiG6BzF1PG0uFh9m4Zeh0OUW/5zOqA3hn+Jr8DLpM=;
        b=XhL+SS6yIdFRauP2OyI8gcaFsnC/fGu/Zbjfi/9XCH65294riuaX/5/DQLrSEYleji
         IC4YZKLOGRD4WSeFQFss3wbFW8Sv/CFBjxrdbwyNne0MUaMpzGWxCRPne03DGc5357UX
         s7mkUFQPTAkHqhDwypA1cNC8yozPaNWg+UP96ukP3i8ionoRCtuBliof2vEVVk0tOE7t
         gOlb4lCpqBYGSFOCsU2jIUQWd4J5Sf6maCtlvP00MHpelMbl1ifK/t/i0np1uFAhdlFW
         BrvVGCoXw6AqnaBigYEuJctwKX6l20lO5i19dvkgjbAIJ5DCEGgEHTu23CVoIYpIoIbA
         Kg7w==
X-Forwarded-Encrypted: i=1; AJvYcCVE3psRUs/R025XClT6zd5Oa3mOq0IyG9pPP3pcPqoM1RlIHFBMGVJXCDT5LKcpl2QLkd/433SKuzJ1DW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs6Eqy3E+LeWvwM//9szyxnMivcUAJ+MQ448gS3Gn7CkaXYata
	MkH5BYXh/Lf081CSSOc/IDVOPnU4smqQPimBm53S+sXTNvcLasSMBI1FfiOeWK8WI71edZc52ET
	SYSoAy87cKRPTWloACpAi6ST3PpS6L8B6WUmZ1A93jISC+1DljcpC/ou3s7Up0AkPPg==
X-Gm-Gg: ASbGnctbzDyqBMZEXT3ayB1clMmgtwu9A9AphU3cqaV5uKI81b+x5BDfwFuh3TIzx/9
	4kLy7Y1qgpjMoNNYUELzMmMDOUXwvlyNVZDdpG5slkvmQl8KMR8wab2aKbAB8H3dHx6GLv/36w6
	Mfyq4m9JFNf5MOO7NI5NK3Q/T8J+CUI5th/IlOIAAFUrQcxEpIupbTaBX4jDTLIeU/jM/0LzDj2
	9HYafBw0wZdUvnzJ8Srh7zxavWXN0ftHNB/3S1X6prSO6odd//zv6VYAQizlerghQxNhE72jqO7
	twhrCwjPTL8JXOdE+ZP0e87msp1R+fc9nyRLdg/Rb9BZIfi6bYe7Wx7bpzzoGg==
X-Received: by 2002:a17:903:2f4c:b0:234:eb6:a35d with SMTP id d9443c01a7336-23ac4606503mr160851505ad.27.1751247269574;
        Sun, 29 Jun 2025 18:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2PQPQfZ+cIi6+VZZqGwMAkLWfLrl0j1n2vFaqhsTvqtq3OtrGsXBSiIbHCuTtKFDWI/MDwA==
X-Received: by 2002:a17:903:2f4c:b0:234:eb6:a35d with SMTP id d9443c01a7336-23ac4606503mr160851265ad.27.1751247269236;
        Sun, 29 Jun 2025 18:34:29 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f17f5sm70543605ad.62.2025.06.29.18.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 18:34:28 -0700 (PDT)
Message-ID: <1af300e8-4db4-4073-8db5-bffd8c0190fb@redhat.com>
Date: Mon, 30 Jun 2025 11:34:23 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: Enable EFI secret area Securityfs support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, sami.mujawar@arm.com,
 aneesh.kumar@kernel.org, steven.price@arm.com, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
 <20250613111153.1548928-3-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250613111153.1548928-3-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/25 9:11 PM, Suzuki K Poulose wrote:
> Enable EFI COCO secrets support. Provide the ioremap_encrypted() support required
> by the driver.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/io.h          | 4 ++++
>   drivers/virt/coco/efi_secret/Kconfig | 2 +-
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

