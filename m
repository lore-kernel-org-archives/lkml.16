Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C86C1DEFDA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745601278; cv=none; b=gSTFo33gSpMLWNJ3RWNhD/eGGycg2rtncsMj1o0aw+amNErUaPVWv4t2RffLZ+GNrm2oV/nOF/E1ZWQ+L/J8IKReQCCL+uZ+HXjx5Uex8aBDcba8NHD/D1nSef0XAl93n6wEmOtm/j1nRDPIDoqQZ9JCYEztnaM+W0DpGLe1kFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745601278; c=relaxed/simple;
	bh=Lm2N0n4u1FlM9Vtf3w6Fx40mc0HytZ/KQT9CUeJY2p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDWaCSz71qy7q0maHGh8n3vHGh9rRupVzNZc0GTsAazCVqTjxtwvI0+4qxbvOcaXCZZt1qTD0AvRHJWHPPULTkaoO8hk3HtgdlQ3FuVhVSkUcKmlutnOPcAMLbbhzaxqQyFBZe35R5GdS0g5d65+OFrq9PMEKKVkiJj3p86dUwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xmmbQezi; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xmmbQezi"
Message-ID: <dc069aec-8f34-4745-804b-936e0466559c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745601263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R5HHbZEVfAo5xHjVAfeinei8cc6O8D95xrShblmNxCw=;
	b=xmmbQeziKHWdI391OleiVoTdZ0Ul+dSemlipkTYjGz6VcQh4o4OAvsCsiJ5Oau5gRqJCd+
	XV8ASeYUA2sBQ0rXIL3o+BK8h5efUDaE+TVs5vxNJ3kAkyf8lQ+gQxKADk7L9OQD6bm7QU
	hCFCHNLQMcDNNOSj5DNth/RVDa25peQ=
Date: Fri, 25 Apr 2025 18:35:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] soundwire: bus: Add internal slave ID and use for
 IRQs
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20250422104245.958678-1-ckeepax@opensource.cirrus.com>
 <20250422104245.958678-3-ckeepax@opensource.cirrus.com>
 <b286bbf3-0da9-4e84-8d21-7720970833c3@linux.dev>
 <aAeHgqcQCtuFKW/A@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aAeHgqcQCtuFKW/A@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/22/25 14:11, Charles Keepax wrote:
> On Tue, Apr 22, 2025 at 01:50:13PM +0200, Pierre-Louis Bossart wrote:
>> On 4/22/25 12:42, Charles Keepax wrote:
>> I see the patch add a limit during probe, so now that
>> means the number of ACPI devices MUST be lower than 11. That
>> doesn't sound right to me and could cause some configurations
>> to fail. It's perfectly ok to have ghost devices and no limits
>> on how many our BIOS colleagues decide to list.
> 
> Yeah it will limit the ACPI to 11 devices. I can't say I am a
> huge fan of the "ghost" devices, like its ACPI it is for
> describing the hardware, so it should describe the hardware.
> 
> That said my thinking on this was I have not seen a system with
> more than 4 real devices on a single bus, and not more than a
> couple ghosts in the ACPI. So this didn't look like a big issue.
> 
>> Using a dedicated IDA for IRQ mapping looks like a good
>> idea to me, but I don't think you can really use the same IDA
>> for dev_num
> 
> If you are really concerned about the ghost devices I could back
> out the part that reuses the ID for the dev_num. However I do
> need to know the maximum number of devices when the IRQ domain is
> allocated. So I can't really see a way to avoid picking a maximum
> number of devices for the bus. What number of real + ghosts would
> you be comfortable with? Although I guess if not using it for the
> dev_num it is then fairly easy to expand if needed so perhaps I
> just back out the dev_num bit, but stick with 11 for now and we
> can expand if necessary?

A maximum of 16 devices total is probably ok. That's 10 more than the worst-case configuration we've seen so far, and I can't think of a case where more than 10 ghost devices would be listed.

