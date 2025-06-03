Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816DF1C5D72
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951024; cv=none; b=nCsh1PkPY31iHjOnFO+hVF3kE7tVHkPGD9DI8OPIMmEZMCN3n8J+uRIuUp7xjInVqGl3vcF2UAjMbgnRnLKQ4Ve0biEccfSujHS2ZNKR/cQL8amM+CQ+43EbSplWC8Wj1yU0M9KdpZs2Hzw82/DSZqwA+u1WatDs4/6zpbqxFVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951024; c=relaxed/simple;
	bh=PNBCbtHacciRjGJIUshcSY6wyXemX0p2lmL+yLw6v1g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=i8GvPUL7x03EgRQxye2yZUMCN5osR0VCCXwM6EO5nLkZlZR9L3GN9S8Obr9BVhgL5hMt7czGaexpKoZBk0CJyeBvrd50WEqruMhfo9s+XrVju5/3Gycw9Zs8OYCz1HA/uBFkvbUg7YcWy8R8xrbTJFqHZfJ2y6mY6agyUVo3qIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x9tbXX+X; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x9tbXX+X"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60477f1a044so9351424a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951021; x=1749555821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ubw5qr1vqTEQqkyLWzcVCvsavrNjo50AY7n8fFMjQxc=;
        b=x9tbXX+XfH2nSEw133b2razXgHKNwcxaEeOyTFB8/3XIHosEkXOE7Xje2VQLhzDNUA
         ufU38/ry8olVOggfEyz3l0e7p6sJgxWQrQRXB+Vp50KWW1hbhX1A5jjgo1BECMCQxzUI
         DJ2wcnsQRlJdgxSBtooNDa0DGCK8teCuLUGyKfdXFhWM6Wkm10qAA6So9FPDTlAOfaYG
         R9702pF2pgieQzn4yDAf0rDkO2r21caXxeJvMV5li0HjE6WtmAgFHKFCygzSGgSQbQSr
         bVg3QmG2HW6qZAISH/fa6ziun7kvfnRLMaJDAuS9oC3icjh7NUZxqpQF0aELbNlrXd3n
         ALlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951021; x=1749555821;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubw5qr1vqTEQqkyLWzcVCvsavrNjo50AY7n8fFMjQxc=;
        b=HZduZ6xNuA3k7MnTGt/AKdJDI8b+5JmQ3p+Xrj4YwcHR/tAehKVtyG9TqrSeznkyzn
         sGxx9lqDEMAP6oElyuFsy3+Rr9/TWJqvT/TSAFed1XGF8e+ELLacM96tz5/dzIIehvDj
         myzBHOhkWICZ2BP+fDnuZot/VpPowUWIRXcUp7/XMr3vzz2GbZf5jmBUGLf8L1CZiWzw
         J6A4b+hEtL5bBjsrxvNXYNxoiSELd9VsFN1KjrtK5aHDsftgCa+z3fJROC3I9BpKrHaV
         H1CJqk8hKF7bI1n3rnoRk7rJpgg0outwcu49CFQwAfBelDyp2j+8f0TUpDNxvkLLA/qp
         98Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWO+IbglL1aAK3+GbU0qP9JHjP8ZpKpCJOTD1p0VSg9eqBbEvDsv4sMai7Apj5SbaRBRIovQ5vxilOkwco=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRzESg7QeNw94dUSWd56pq1BI3Nvna/kg5+ZvxXcgvtkS1syp
	trJUwhikOgP26NVS+BOStKoQKw3itQzL9wJTndZGSsaivjcm3rwZFFmkONBJ63j4qMA=
X-Gm-Gg: ASbGncsNXbwrbXuMRt+fVxmz4wldGhF+pi6Sl0kBrbUMFyH4hDia+ddApvWuGPZD7ef
	Kg2jBAN+z6wzm9C4vLXRGDIsJEiujN23SAMmmy4/FHhER1Lg3I8skwAkC2HviUclOUnmAbzZyNs
	zCi2cpiu3QXHUp9vgBo19qgiVcWt/AstWh69QBY40FANZca5uwAAC5vZTozRM8E5Nbk3pARHrBK
	XXydTvvePQnCNeSiGXL6zYDS7AStiijDgOgyICnsNqyO+8+hePxEVFWcTA4FV+Uj/kAqfwg7oNV
	bgo0EZYM+71yTmoXbV6mm+KrMmG75qdy5fsj9fwpUWnA+MRfFExbs4q0pght
X-Google-Smtp-Source: AGHT+IGnG6VIuLl9nqDMaZzRwmhoM9nz6ogi2ZgDE95nbti3Gup7V8oVPqG3h7hrx+FWDi59W2Bv6g==
X-Received: by 2002:a05:6402:5106:b0:604:e33f:e5c0 with SMTP id 4fb4d7f45d1cf-605b7b6b7ccmr12087155a12.30.1748951020735;
        Tue, 03 Jun 2025 04:43:40 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60567169810sm7354284a12.78.2025.06.03.04.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 04:43:40 -0700 (PDT)
Message-ID: <a4a5855c-6d58-4fc5-85d7-4727d27efbe0@linaro.org>
Date: Tue, 3 Jun 2025 12:43:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/25] PCI: Perform reset_resource() and build fail list
 in sync
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 William McVicker <willmcvicker@google.com>
References: <20241216175632.4175-1-ilpo.jarvinen@linux.intel.com>
 <20241216175632.4175-25-ilpo.jarvinen@linux.intel.com>
 <5f103643-5e1c-43c6-b8fe-9617d3b5447c@linaro.org>
 <8f281667-b4ef-9385-868f-93893b9d6611@linux.intel.com>
 <3a47fc82-dc21-46c3-873d-68e713304af3@linaro.org>
 <f6ee05f7-174b-76d4-3dbe-12473f676e4d@linux.intel.com>
 <867e47dc-9454-c00f-6d80-9718e5705480@linux.intel.com>
 <a56284a4-755d-4eb4-ba77-9ea30e18d08f@linaro.org>
 <7e882cfb-a35a-bab0-c333-76a4e79243b6@linux.intel.com>
 <f2d149c6-41a4-4a9a-9739-1ea1c4b06f4b@linaro.org>
 <19ccc09c-1d6b-930e-6ed6-398b34020ca1@linux.intel.com>
 <c1c0bacd-7842-4e9e-aec4-66eb481aa43f@linaro.org>
 <f8f15489-8b31-4672-9fb9-161c7c4599dc@linaro.org>
Content-Language: en-US
In-Reply-To: <f8f15489-8b31-4672-9fb9-161c7c4599dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/3/25 11:48 AM, Tudor Ambarus wrote:
> 
> 
> On 6/3/25 11:36 AM, Tudor Ambarus wrote:
>>
>>
>> On 6/3/25 9:13 AM, Ilpo Järvinen wrote:
>>> So please test if this patch solves your problem:
>>
>> It fails in a different way, the bridge window resource never gets
>> assigned with the proposed patch.
>>
>> With the patch applied: https://termbin.com/h3w0
> 
> above is no revert and with the proposed fix. It also contains the
> prints https://termbin.com/g4zn
> 
> It seems the prints in pbus_size_mem are not longer hit, likely because
> of the new condition added: ``!pdev_resources_assignable(dev) ||``,
> pci_dev_for_each_resource() finishes without doing anything.
> 
>> With the blamed commit reverted: https://termbin.com/3rh6
> 

I think I found the inconsistency.

__pci_bus_assign_resources()
	pbus_assign_resources_sorted()
		pdev_sort_resources(dev, &head);

But pdev_sort_resources() is called with a newly LIST_HEAD(head), not
with realloc_head, thus the resources never get sorted.

pdev_sort_resources() exits early at
	``if (!pdev_resources_assignable(dev))``


