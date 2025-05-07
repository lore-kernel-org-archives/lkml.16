Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1230635
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596377; cv=none; b=p/MUmYmt8UuGDtW9djExmGftYTsJ1WayCqQ+lE7DQ8P2oR46lJ03LC7CeBDiA2toVt6n6VtHY2G2NRWatuFXRqwwaQDzw4bbfXb2ae8Cp3R2aQmoIDyqbrvsH8vsG62R908+7HpeQ+ZPJa3mXBArFshMtJqkBIHEiYZZXiCXemc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596377; c=relaxed/simple;
	bh=md6T3Rq/SdZSdZidJF7yEFAplthl1mpuJszFU6ZXh6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPQIwTlJp8+yCz1f8Zsl91fm1huiTgUToM05QpM+WG6hb+yL+cUmlrQJiN9WbJMbxy+e/NPn92CfZVHEW7HpHLPwi8OsJWbsh5Q2nvSWkKUJjKvQ1hMmOiqOwyzGaoQ09VVpwfGfgqR9rtpdV7GyggeJ1JswoLVje0h5OdjF8zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 922062F;
	Tue,  6 May 2025 22:39:21 -0700 (PDT)
Received: from [192.168.0.12] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 949C13F673;
	Tue,  6 May 2025 22:39:27 -0700 (PDT)
Message-ID: <b6774c27-0628-46d8-a186-bfd378ee538f@arm.com>
Date: Wed, 7 May 2025 11:09:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] coresight: Refactor runtime PM
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-10-leo.yan@arm.com>
 <0ebbc509-9e17-4b93-9a72-b9e7cc03637e@arm.com>
 <20250506101604.GD177796@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250506101604.GD177796@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/6/25 15:46, Leo Yan wrote:
> On Fri, May 02, 2025 at 02:15:49PM +0530, Anshuman Khandual wrote:
>>
>> On 4/23/25 20:47, Leo Yan wrote:
>>> The validation for driver data pointers and clock pointers are redundant
>>> in the runtime PM callbacks.  After a driver's probing, its driver data
>>> and clocks have been initialized successfully, this ensures it is safe
>>> to access driver data and clocks in the runtime PM callbacks.  A corner
>>> case is a clock pointer is NULL, in this case, the clock core layer can
>>> handle it properly.  So remove these redundant checking.
>>>
>>> In runtime resume, respect values returned from clock function and add
>>> error handling.
>>
>> Although not checking drvdata and drvdata->apb_clk does make sense, but
>> why change the semantics on the resume paths as well, which now returns
>> stored error value from clk_prepare_enable().
> 
> Let us assume if a clock fails to enable during the resume flow, with
> current code, we miss a chance to detect issues in the first place.
> 
> I understand the clock enabling failures are rare, but propagating an
> error in the resume callbacks would help identify potential issues.
> 
> It seems to me that this patch does not change the semantics of the
> resume paths.  It enhances the resume flow for early error reporting.

Alright, fair enough.
