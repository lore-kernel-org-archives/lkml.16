Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E82B27C14C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322895; cv=none; b=RF2JLfSppidNDnB1ZKkdvBTs0pkD/Z+ZIBtBGW9zOFlsCIKOy4x0W/X5YUKsD7vSP81VIxi87xgr/77WxfRi5B5MGjt/PMrPXuOfLq7CcEkO6dAGNfIS++qDZz34hSAcjZxEtu2iT/hM5F+gDdvo7AZj1HbjZa6eUPY+qe58AW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322895; c=relaxed/simple;
	bh=QtU2Ig7cGv1x0ko3lwFZZnUxK0bVZVM2/DS0YTIIr7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+oUtV4J/Cy29HtpdxUypSlJ1SxNnCrYp+tJM1rBwXzwfuFQCePSQbPmMuRoHxNXgiV/GPNKFsYdU/hP0Sw/jr7FbWkpGSr5hZF0XQEvyBAmo+tgcaxS3wQMnOasqLF2JIjlO+28zdR3QmPbInG075KOVIg0NsB2yzozagCHmD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s0ma3+ha; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s0ma3+ha"
Message-ID: <b286bbf3-0da9-4e84-8d21-7720970833c3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745322891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=560PmuLzdPLFRtzJQ00UO0YuM1ATzDDsC+io5ks5k4g=;
	b=s0ma3+has+LVQeEEGmz3avw/ZU52ASl+KH3KlZFm+ItjQoCxvUteD4NPRXbs8BCAWK6TZS
	s87fOnJ93+emLFgqljMqxOg0IpVXa4gpWQebcGTz0lYOiYqwjqOLBa54X39h+EGZf1zjrc
	w+QUV/FZS9iRflQ9oBgiuLrSIeXj0sY=
Date: Tue, 22 Apr 2025 13:50:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] soundwire: bus: Add internal slave ID and use for
 IRQs
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250422104245.958678-1-ckeepax@opensource.cirrus.com>
 <20250422104245.958678-3-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250422104245.958678-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/22/25 12:42, Charles Keepax wrote:
> Currently the SoundWire IRQ code uses the dev_num to create an IRQ
> mapping for each slave. However, there is an issue there, the dev_num
> is only allocated when the slave enumerates on the bus and enumeration
> may happen before or after probe of the slave driver. In the case
> enumeration happens after probe of the slave driver then the IRQ
> mapping will use dev_num before it is set. This could cause multiple
> slaves to use zero as their IRQ mapping.
> 
> It is very desirable to have the IRQ mapped before the slave probe
> is called, so drivers can do resource allocation in probe as normal. To
> solve these issues add an internal ID created for each slave when it is
> probed and use that for mapping the IRQ. In the case that
> get_device_num() is not implemented this ID can also be reused for the
> dev_num.

Humm, I am missing something. Does this work in the case of spurious 'ghost' ACPI devices, which is quite common for Intel DSDT?

In this case, each 'ghost' device would be assigned a dev_num during the driver probe, but that dev_num would never be used for enumeration, would it?

Let's assume for the sake of the argument there are 16 ghost devices and only one real device that gets enumerated. How can we guarantee that the real device is enumerated with a dev_num <= 11 (the max number of devices supported on the bus)?

I see the patch add a limit during probe, so now that means the number of ACPI devices MUST be lower than 11. That doesn't sound right to me and could cause some configurations to fail. It's perfectly ok to have ghost devices and no limits on how many our BIOS colleagues decide to list.

Using a dedicated IDA for IRQ mapping looks like a good idea to me, but I don't think you can really use the same IDA for dev_num



