Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8076D283FDA
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368669; cv=none; b=Iz2tDTaG6oGzptlvmAhcV21sYpiMRYrr/dbaXpK2eAm8BUbun7Q2uLayeMidfDwgVEMq1kUmN6C+g41b2qZadnTz2TTsCqOwfKggnUS2A10r802sWu4CEmzJNyWb1N42980z9EHYPGMjd8JAB/PQSGbUnCaKNYC0wZ9J5p+sWwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368669; c=relaxed/simple;
	bh=Pba0PHIEYIGNrf6XjJ6nlDeAkd8emTX4pz2cTHqOo1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2UPN88rO/hvgL45vRoHeiXEc2iH7iqhK2v0eKD22DnrDNtVBQ3MS8OY86/43LR39kwpLS2cVkCEIgwLVUUhcnxVZCrsJKwfFYj86r/9VJgdV1wZh6UyyiweE1f1TexBGB4CrIPSfaqzRWawZDazlNXHAsl1aEcJWd8pWV9mXbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AcKh1dl0; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AcKh1dl0"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-43cf257158fso31951555e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748368665; x=1748973465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K66IbQMbjje707cA7mD5l9PP1/zHD1PIxR0a5Pb7bKE=;
        b=AcKh1dl09BJNIrEtzO5y7K8k18nGIPCE0WjRxjU2h4vbth9eLkCuPykk5CpWMjuKBw
         ErbtEi+Y4OS7Wjjw56BGtsDKYnemLCy1vzp6WuBauRVUCcSWmcdfxMibegATfMirNwgn
         i7KARmrXOvpBN97SpVVor6TGV46mb4LQPpYbaZuHCVs07r1qjAQVnp1rltm8O+kzLVE+
         RzsomXZrFk36qXsStK2SeaNK0+VMtUk2eWKBROyvqkMmfSqvm9bTGIpnrfsOQDTrQIdQ
         vFJWy4LqP3LtCviBCvAtx079WfmjwZqnjLIWTmocN0J2lO5UvUA+Kyccjurk2ABBqUeV
         sTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368665; x=1748973465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K66IbQMbjje707cA7mD5l9PP1/zHD1PIxR0a5Pb7bKE=;
        b=oOs83Mn2VnsPZ/viytcbrvR25hDInnBIshO6dD2Ms2ytT+ayo2ezgoEvqaMEfk3GzX
         j3pG2aE4U5+wMtRT791VPKWVzzUB7KeHwd1Fn6W0QyAhXxsQe8Q2Ancd1zYsqfkA1C6W
         H75VH98JHRAbIQhK7tWVe7GXllNTZMhhHaMP28AVBlTAJsBYdnjdxzkEzfOzVh85UD17
         35YcfKG37IDWSHYKwf2byK6We4rkHb3hsl8StoS0gm6rIOuLZeZMp8XTvZ6RPU6QHUW8
         kvWTii+5R6tRx6/6Bfj3t0gXOGlHyzv21IKAWrL3IZo4v2SehuRdpzffGBHyukJaTol2
         OnTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGowOy41qhd+IT8AL5y8DDFezi2BSBfHS54Ibh86tNkxHiBMU/pZKuOmqhZq/BJk10EO3ySZm2romN8CM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUKFmPH3UTQglwSBKOvupRq6ZmqmdvObyEi4k9LQn/fqvS5/8X
	NYec/eheAB33CzG62sfyHHLr0IViSJZu++VwM8/CrXoQAFCsDd1UzcfJsuXBh7a7c6E=
X-Gm-Gg: ASbGncvol72NdsryTQOYJ/UsgMbdnutxX6slKpJPZrR+v8H4obvaCS84HoSgGT+s9jr
	2Dh+94/8CXNIXybEA7IofcNfA7d2qpz7cA2sH3KazRXnUahzcbsXbyYow4fEYGLRFwSKVlDf+wh
	daeCQge97T2lGY3pTcgCPjdJkoPfrcbPXVuew9QWo4o+IjK7FlrzgrMkLHfgh6/6wKjL400BG0K
	ySDC+dwleGOhn8Chq/Q19S1mPVlyi9KxHBAzBia05ToxoxKYvIxgs9qmpxIlEd/QzGjus84ijms
	QshGcy8NGVyXOWPtp5vKmr8pVp9zaBDLJAt5r3fa40b+IXQpUkMSiZGT
X-Google-Smtp-Source: AGHT+IGWVp+1pe2g72Y3zco5kiY52P50nzKLHDIXvLoqcgNBLuwmb5ic8TmQyg2vlxnYIHLktroXHw==
X-Received: by 2002:a05:600c:1e1c:b0:441:d438:4ea5 with SMTP id 5b1f17b1804b1-44c9493e6b1mr107966315e9.20.1748368664703;
        Tue, 27 May 2025 10:57:44 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29548sm290642395e9.4.2025.05.27.10.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 10:57:44 -0700 (PDT)
Message-ID: <c2393238-d1cb-43bd-b67e-08105a9834fd@linaro.org>
Date: Tue, 27 May 2025 18:57:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 4/4] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
 <20250407-arm-brbe-v19-v21-4-ff187ff6c928@kernel.org>
 <20250519150621.GA17177@willie-the-truck>
 <20250519215651.GB2650608-robh@kernel.org>
 <119c9a70-6ea8-46f0-b877-8a433d97ce84@linaro.org>
 <20250527105035.GA26328@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250527105035.GA26328@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/05/2025 11:50 am, Will Deacon wrote:
> On Wed, May 21, 2025 at 04:58:42PM +0100, James Clark wrote:
>>
>>
>> On 19/05/2025 10:56 pm, Rob Herring wrote:
>>> On Mon, May 19, 2025 at 04:06:22PM +0100, Will Deacon wrote:
>>>> Hey Rob,
>>>>
>>>> On Mon, Apr 07, 2025 at 12:41:33PM -0500, Rob Herring (Arm) wrote:
>>>>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>
>>>>> The ARMv9.2 architecture introduces the optional Branch Record Buffer
>>>>> Extension (BRBE), which records information about branches as they are
>>>>> executed into set of branch record registers. BRBE is similar to x86's
>>>>> Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
>>>>> (BHRB).
>>>>
>>>> Since you picked this up from v19, the driver has changed considerably
>>>> and I presume you will be continuing to extend it in future as the
>>>> architecture progresses. Perhaps having you listed as Author (and
>>>> crucially, in git blame :p) with Anshuman as a Co-developed-by: would be
>>>> more appropriate?
>>>
>>> Shrug.
>>>
>>>>> ---
>>>>>    drivers/perf/Kconfig         |  11 +
>>>>>    drivers/perf/Makefile        |   1 +
>>>>>    drivers/perf/arm_brbe.c      | 802 +++++++++++++++++++++++++++++++++++++++++++
>>>>>    drivers/perf/arm_brbe.h      |  47 +++
>>>>>    drivers/perf/arm_pmu.c       |  15 +-
>>>>>    drivers/perf/arm_pmuv3.c     | 129 ++++++-
>>>>>    include/linux/perf/arm_pmu.h |   8 +
>>>>>    7 files changed, 1006 insertions(+), 7 deletions(-)
>>>>
>>>> Do you know if James Clark's tests [1] are going to be respun for the
>>>> perf tool? It would be handy to have some way to test this new
>>>> functionality.
>>>
>>> Yes. I dropped them here because I've been told by Arnaldo in the past
>>> to send userspace stuff separately.
>>>
>>
>> That version of the test was out of date so I've pushed the new version
>> here: https://git.linaro.org/plugins/gitiles/people/james.clark/linux.git/+/16e4a18c2d5fc53736f05c9052b1d11d74909707
>>
>> But I'll wait for the driver changes to be finalised before posting it. Or
>> Rob can take it back into the patchset.
> 
> Thanks, James. I just wanted to make sure that there was still a plan
> for upstreaming these separately from the driver. Have you had a chance
> to run them against this v21?
> 
> Will


Yes I'll send it once the driver is merged. And yes they're passing 
against v21, but I'll retest v22 as well.

James

