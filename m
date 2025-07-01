Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FAC15E96
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365998; cv=none; b=XBW7ZSSbbfJDPO/97YyqARN9DEuryiTnz72qEOsIA/j3ztHYgPrElHlQtvg0yFA7tHf7znu8PA9tibfgtVX/cVPzXLXrphO8pEDU1sA7BVt9xLAQ6xEMtTLAVfgeyLUv9lhaywchzTvsMRyN2FTGi65mIwPY5UYdX/lusNqcZ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365998; c=relaxed/simple;
	bh=QCSyPRXZTLQan3kdBlQpmruhGIRn/0Th3vInjWm13QI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Lvjgjemgsvsy4ep4RNNRNSqxIOh25TYdY6PBTur8h+PS98QNlrDPoAOaivmoEUp9xfzss5Uuf2yThPVI7F7/Q8K9kb+gatkpgQCKcI5qcR+ZpFuo3UifWuNhORLvhDu4jhAIcjGPudRr/n2SrSqYUiARdtOdQIFm4V6nba2FZm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=snV9boYb; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="snV9boYb"
Message-ID: <fa12aacd-a8ef-4f3f-9d1f-3ae42c25b7e0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751365984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BvP7MP7Eeq9pLNYV7/bXnNgVnW43ucGjY5DRm2gNQ7E=;
	b=snV9boYbmS891wKCRR/wG8+dP7EBPEKJu7A/lZ/a1jI6ZsbM8HXqvRuI4Xbj3TU3PjmwwP
	RLXXKrV1gLZtke04dSIX29jsyoUsZvhnwGo3VHmfx1FoorWgKlag70PTjuc2ZeuQxOumk4
	mq6jQ2sb7u8AWUUl0RKkCxFnsC6z6S4=
Date: Tue, 1 Jul 2025 12:33:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 00/15] ASoC/soundwire: Realtek codecs: wait codec init in
 hw_params
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
To: "Liao, Bard" <bard.liao@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250626115625.536423-1-yung-chuan.liao@linux.intel.com>
 <f95f6777-7445-46dc-be53-b3ae5594bf39@linux.dev>
 <SJ2PR11MB842425A1CE631E71E4AF26F0FF45A@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <6e9878bc-856c-4319-b535-ab8f565f2460@linux.dev>
Content-Language: en-US
In-Reply-To: <6e9878bc-856c-4319-b535-ab8f565f2460@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


>> The main issue is that the codec could be attached after the codec resume.
>> Sometimes, it could take 100 ms or longer.
> 
> I don't really see the problem here. The codec device (in the Linux sense) is trying to resume, and you want to wait until the hardware device is fully configured, no?
> 
> Moving the waiting part is asking for trouble: the device will be reported as pm_runtime active, but it may not even be attached on the bus, and thus any register access will lead to invalid read/writes.
> 
> For example, starting a register dump via debugfs would fail if the codec is not attached. The machine driver could also set jack status that would fail as well.

exhibit A for the last part: see rt700_set_jack_detect(). We absolutely want to make sure the device is attached *before* configuring the jack, that means waiting until pm_runtime_resume_and_get() is done.

So at at minimum, you would need to keep a wait_for_completion() in the resume method, but it could be demoted to a wait for the enumeration only. We do have to complete() for end of enumeration and end of initialization. 

If it's the initialization that takes time, it could indeed be handled in a more asynchronous way, but I don't think you want to even think of a case where the codec finishes successfully its resume routine before the device is enumerated and can be used for register read/writes.
