Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED0D25B668
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628454; cv=none; b=ODNTiBy+vDUfgwUWvFcczzcR6Aqg5XbMrwgWQun49TwIvjsyeTCTokGwA8RV9sk70HwNJbWlQXywYvTd3DGuC2UtoSUA8OatiIyH1GPS+VSl4knyrv/riVmj5Lk642dPrmuKRi2IKtEXodoPk8r0ldmjIQCZHFLPXHDOM11RXeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628454; c=relaxed/simple;
	bh=MRVn20PJQXmMHSbxjTrXdO+mN+SWycfUqMRbhjpNJig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZqefXbOf/6BM/4Dkn+V26Bxe4R5qLznKsuyqf0wj936JUvJ1Sd0CyB8o62sg3cobpXvVfU0lQJ12UkIT7U02RoL55anijloAeTk6xSfFWZDwF1Lz42abQY+rGw2HA4AWEq53s+dCbpcnDL1eTybiTMVYejwlg5puAyARh0uu8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F4391007;
	Mon, 14 Apr 2025 04:00:50 -0700 (PDT)
Received: from [10.57.43.213] (unknown [10.57.43.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 67CFC3F66E;
	Mon, 14 Apr 2025 04:00:50 -0700 (PDT)
Message-ID: <34488e3a-9d59-4774-94e3-6369ab3c235d@arm.com>
Date: Mon, 14 Apr 2025 12:00:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] coresight: cti: Replace inclusion by struct
 fwnode_handle forward declaration
Content-Language: en-GB
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 James Clark <james.clark@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
 <28dd049e-65b1-4111-8a24-ba9765bbb1f6@linaro.org>
 <Z_zeIdZMhF31DL4o@smile.fi.intel.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <Z_zeIdZMhF31DL4o@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/04/2025 11:06, Andy Shevchenko wrote:
> On Mon, Mar 31, 2025 at 02:40:51PM +0100, James Clark wrote:
>> On 31/03/2025 8:14 am, Andy Shevchenko wrote:
> 
>> Reviewed-by: James Clark <james.clark@linaro.org>
> 
> Thank you! Can it be applied now?
> 

I will queue this via coresight tree, for v6.16

Cheers
Suzuki

