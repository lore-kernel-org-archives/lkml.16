Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936FB1F463E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746440264; cv=none; b=OhF9c7euSUVE8/guRGHpJNAassRPh2AzOopwyCv2xc4w4sQy3MUwG8iOasSdPiyGoKRctF+cPYrWdkWO0VM4VM8373N5RhxDUyxOU7zInMTyRc5wsiAG7tZqBQlrYNhdXnpE9zzXaMrLfJ6qQR7jCWQENNu2+KRxreLU4jnFqUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746440264; c=relaxed/simple;
	bh=UTcS1pyxZ8q5WfNJRwyAPG8NzPU5Uk/M4PLi+Mr7kMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKuDcehDySVofQfj7SI/LIcRUlhQyMVv4CTzT53iuYw/mF0P4FhqfraTO7G41iSrpS5ImJhWVuZCEmo582LUiVsoqxyAw8lFcxj8hSaChZF75mdy482vOQaP9ZuSbZqDMscuFP1yUidu+P0pQhsT1rZjPYshW7kcSc4jKR3HMcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BX9qGgF3; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BX9qGgF3"
Message-ID: <70240985-5f8f-42a9-b5a6-74fd6713f6f3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746440258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aAAH34Bu2XqaO23TD7PI0jLXdYDNGFWelhpUofjwSyg=;
	b=BX9qGgF3C3wvzMHiAPs1/hs9ptZ2kDP4gq9dIXbLeOXDNB79JghNEItoeK+HpOkoSvRES7
	wWklgYS1KrTUfbp886az4kGS5KhgekOkzmn/ps7BXrvuu3T7yYIJTPyk6enHXT4maTf0Sc
	pHoEX/uTq6NsgsCFpXkdhvsZdxE43ho=
Date: Mon, 5 May 2025 12:03:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] Fix minor issue in SoundWire slave IRQ mapping
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20250429101808.348462-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250429101808.348462-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 4/29/25 05:18, Charles Keepax wrote:
> Currently there would be problems if multiple devices on the same bus
> attempted to use SoundWire IRQ handling rather than the IRQ callback
> mechanism. So far only cs42l43 uses this system so this hasn't caused
> any problems.
> 
> Thanks,
> Charles
> 
> Changes since v1:
>   - Don't reuse the new IDA for the dev_num
>   - Expand the number of devices allowed on a bus to 16
> 
> Charles Keepax (2):
>    soundwire: bus: Simplify sdw_assign_device_num()
>    soundwire: bus: Add internal slave ID and use for IRQs

LGTM,

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> 
>   drivers/soundwire/bus.c       | 31 ++++++++++++++-----------------
>   drivers/soundwire/bus_type.c  | 10 ++++++++++
>   drivers/soundwire/irq.c       |  6 +++---
>   include/linux/soundwire/sdw.h |  6 ++++++
>   4 files changed, 33 insertions(+), 20 deletions(-)
> 

