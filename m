Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDA61C331E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917436; cv=none; b=nZ+ysDQ23cZcIFNeZuq4tKd9dZzKuYdlwgfGgOFzLxGbVBaZ4xBednbHrEg5Vm1UgwWH66xi5UgLdgW2LadArlAFKyI+QXSXDdiabvtVLoAmGtER2nHQdbla/RTEoNXRQepEa2KaRXxj9ts1EtS8mtPU4pEkQdho38wAGnfJYkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917436; c=relaxed/simple;
	bh=R0PMLhji9fjSmPvfPMOxgYvbpmy3XQd+J6yLU+3bdoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8WMXpHUplyft4/J69N2/McPrLumgNznmex+6IiLDvttns5Xc4Tfj21Yc4aOa6VJN4m1EOWfh8G4HZYoBx/lI6tr0oBtDPXEL2i9xWXtxVwJHBxiHLdMdsx9yDG7QAdrNFfIwh3LbnqtAYTm70up6jxEy2RVhlwThZHSJnYRNn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xfHZoUFg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xfHZoUFg"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dc9eba8a1so358878f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738917433; x=1739522233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0PMLhji9fjSmPvfPMOxgYvbpmy3XQd+J6yLU+3bdoQ=;
        b=xfHZoUFg8loXywdhe8EwwPlr4IUmNwZQXl4VFoNRIHXokzlPTeSINZ9onal8/B/tYZ
         rR2IPnvAoJQTWr9nTdGtPhTLbK1fL47NKV4Xz2VqyLFd+TWixyb5dbx8P2ESwkr1q/yo
         V5ImPVbUenmCQiR6DyMrusBuoQrpNkMsm3sliwC2EqZZCaibETjPMRwOXGSlt8lQyUP/
         0nokh5xySmqZC73Q7tr496/hSdhOlEO5x8tvmjjrd2lwQStfD64gTd8PTgsxq66TnaqW
         2Ay4xAGewaYXD0A8PRp1KEzaYbqi1EyYToDm/MqaQbwo9W3snRHpKUyvXkAwJiT4F00z
         nBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917433; x=1739522233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0PMLhji9fjSmPvfPMOxgYvbpmy3XQd+J6yLU+3bdoQ=;
        b=WvlsSGzO9HMvo75Xq/S4O9AwlxuPDuBkfhHJV4j8N+/JlxrhQHNWCnMRR6bVCeD8hR
         zbATw2gmnc2J3Rh9Ht5n8XvwmhJ+OjWf5RHbgv5mtVTWXxA0sp5sx+66FnOTtIKNBUZx
         RY6zVs+TMe9nuau1O8qL4cSn5c12YtD15CzefuUHooygCRKEeQ1LdFjBNtrozLsLAQlS
         YcfYd9kmoU201Dr7zNqdyj63FsbddG0utb9XL4ygtfUT3VXHwPMMbpvk11a9D7DArU3j
         YAe/1L7gYh/gvBuqH08vA3GIni4p2m/vo5Xy3/afKPJsjqhV6/4znurKoG5q1Wvx86rs
         3dfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkh3weF5dh5M7cS3dGYQcvcl8ltfoYvV60s9Y04LFZd0q1za1GvSQv+Y3W1SliiX+J2d94DatwLuVsAHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT94LC3IHqudOLUVfOvmFuq+v5eV/1NuGkbFA2t0xfjrzRSzQV
	m/hwZTmH0LDPsd33DLMOC2rRqXepFr4rzXxTN8QTTwF2cZljfCCPjMMScJO6IgY=
X-Gm-Gg: ASbGncvmQOmkSFVK74CqsKsnrPQuQ67zl2eQOj7HcxBalx2dA7wttlITPZjFxo7syKG
	CeWL281MntLaMMeNW1siIqN8jUOJct9Cd/7pq9L6i0/kbBC3Pv5t0dtgNVvN8k1W0GsDmC2YL8u
	6oIowHMjOlqqCCmbxFI8ONYYdqVaxKJ7Avt1UFvfRsZu864YGrDyPSWVzB1PQa26QqeF/y40qDr
	rrrGoosZY8YNRIGTKBdMgVegnc5ob0M3vY9On/j5eSQflHdD50VCvkCG6akjjk7cg0VvjHNslvE
	Rwf8wsf/SAnL/4QZLUJw9cH7
X-Google-Smtp-Source: AGHT+IEk2mxWIfMDHVJOzZSEe/KJXR5/OMo7AWCGcI2mKjnjA/PXTh7IPzwqWMFGzSCaAXZ6+mptZg==
X-Received: by 2002:a5d:648e:0:b0:38d:cf33:31cc with SMTP id ffacd0b85a97d-38dcf333729mr117058f8f.34.1738917432919;
        Fri, 07 Feb 2025 00:37:12 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fd23sm3807124f8f.71.2025.02.07.00.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:37:12 -0800 (PST)
Message-ID: <1c1da131-a7b1-4c2e-9866-d7833a134033@linaro.org>
Date: Fri, 7 Feb 2025 08:37:10 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad
 Input Page Program
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-2-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250207081846.362919-2-linchengming884@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Cheng,

On 2/7/25 8:18 AM, Cheng Ming Lin wrote:
> Although certain Macronix NOR flash support the Quad Input Page Program
> feature, the corresponding information in the 4-byte Address Instruction
> Table of these flash is not properly filled. As a result, this feature
> cannot be enabled as expected.

You need to prove that all the flashes that you touch need this fixup,
i.e. dump their SFDP and show where's the wrong bit in the SFDP table.

Identifying wrong bit in the SFDP tables would be easy to spot if we had
a SFDP decoder. Something that we all agree that'd be a good thing to
have, but nobody can allocate time to do it. Pratyush I remember has
started a draft. Are you interested in introducing a SFDP decoder in
mtd-utils?

Also, if you touch all these flashes, will you please update them and
get rid of the stray flash info fields? I'm thinking of name, size, and
no_sfdp_flags.

Cheers,
ta
