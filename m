Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82091216E1B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750940430; cv=none; b=B7RHZiy8UPu+jSNYTCPNBzC2QwITTbGeMQg4XhdePUFEZo76uEQ1BKbQdqKudTpVV4MZZXu6Sl9qfaqmTyVMtP309OEXiwRHX1LE2dy4N0jRicj/uZP9+ZnpGRWgWZwi/h7HoMPYq2jZcsumIPO0ooEu9bB8Qg5icxkQH29FAaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750940430; c=relaxed/simple;
	bh=qkXCd+Bbs8QNW+Fx/2Wzm1gDcAzwRQw/k1gMr+d9PHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4J2RfWw2G1mjCBHiaALCwgyDTI8FMaCMp32batmkIRdqGKAq2ZzK2nT8dvjHh8ofpLzothrLYItp+N9HHmfY8tg+kDMjTLQKf6+cBp0tOO42x4Bvf6ao7wh6p3eW/tz6/F01W07x8foufSc8Z7rHJSQHMWOgTPt5u3Oa2AM73M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jBu51d0W; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jBu51d0W"
Message-ID: <f95f6777-7445-46dc-be53-b3ae5594bf39@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750940426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9sABBcbcL1qfYZGfdc7T7gO/5yx4mDv09tlOoXIb1QU=;
	b=jBu51d0WSApZ0RPmF9+mPKKzznqbNDKG0kwcAOOaoQs5nhl99f/cLxLukllRjP0zH2gyLV
	3038LhaqIgRmGXdzHS1QqbEyPeFBPRzIrJIdyVG0tH481mJBrb88wTdKrUR0mVKCF/VcO8
	cZmmYNAqrpoCIk9gBN155n96upldt54=
Date: Thu, 26 Jun 2025 14:19:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 00/15] ASoC/soundwire: Realtek codecs: wait codec init in
 hw_params
To: Bard Liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.de, linux-sound@vger.kernel.org, vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, bard.liao@intel.com
References: <20250626115625.536423-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250626115625.536423-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Bard,

> The current code waits for the codec initialization in the resume
> callback. It could cause the resume takes a long time while waiting for
> the codec being attached and initialized. Move the waiting to the
> hw_params callback when the driver really needs it and shorten the
> resume time.
> The change is mainly on the ASoC tree. Let's go through the ASoC tree.

While I certainly understand the desire to make the resume time lower, is this approach desirable in all cases?

My main worry is this: not all functionality in a codec is related to the hw_params. One counter example would be register settings related to jack detection. You would want the regmap settings to be correctly applied in hardware registers even in the absence of any streaming request, no?

The other weird thing is that historically the codec initialization was never on the critical path, it was several orders of magnitude faster than the controller. It wouldn't hurt to provide broad-brush information on what a 'long' time means for a codec resume, so that we can really see the pros/cons of moving all the regmap initialization.

Another open is that SDCA defines the notion of 'blind writes' which would typically be done during a resume if context was lost. If we start moving some parts of the initialization to the hw_params and others remain in the resume flow, that will quickly lead to complexity in managing configuration.

The last point is that this is a change for Realtek codecs only, would other drivers for other vendors require this change? And if I may ask is there any merit in speeding-up resume times even for 'legacy' non-sdca parts?

> Bard Liao (15):
>   soundwire: add sdw_slave_wait_for_initialization helper
>   ASoC: rt722: wait codec init in hw_params
>   ASoC: rt712: wait codec init in hw_params
>   ASoC: rt1320: wait codec init in hw_params
>   ASoC: rt721: wait codec init in hw_params
>   ASoC: rt715-sdca: wait codec init in hw_params
>   ASoC: rt711-sdca: wait codec init in hw_params
>   ASoC: rt711: wait codec init in hw_params
>   ASoC: rt715: wait codec init in hw_params
>   ASoC: rt700: wait codec init in hw_params
>   ASoC: rt1316: wait codec init in hw_params
>   ASoC: rt1318: wait codec init in hw_params
>   ASoC: rt1308: wait codec init in hw_params
>   ASoC: rt5682: wait codec init in hw_params
>   ASoC: rt1017: wait codec init in hw_params
> 
>  drivers/soundwire/slave.c          | 17 ++++++++++++++
>  include/linux/soundwire/sdw.h      |  1 +
>  sound/soc/codecs/rt1017-sdca-sdw.c | 32 ++++++++++++++++----------
>  sound/soc/codecs/rt1308-sdw.c      | 32 ++++++++++++++++----------
>  sound/soc/codecs/rt1316-sdw.c      | 32 ++++++++++++++++----------
>  sound/soc/codecs/rt1318-sdw.c      | 30 ++++++++++++++++--------
>  sound/soc/codecs/rt1320-sdw.c      | 32 ++++++++++++++++++--------
>  sound/soc/codecs/rt5682-sdw.c      | 29 +++++++++++++++--------
>  sound/soc/codecs/rt700-sdw.c       | 27 ++++++++++++----------
>  sound/soc/codecs/rt700.c           |  6 +++++
>  sound/soc/codecs/rt711-sdca-sdw.c  | 28 ++++++++++++----------
>  sound/soc/codecs/rt711-sdca.c      |  6 +++++
>  sound/soc/codecs/rt711-sdw.c       | 26 +++++++++++++--------
>  sound/soc/codecs/rt711.c           |  6 +++++
>  sound/soc/codecs/rt712-sdca-sdw.c  | 28 ++++++++++++----------
>  sound/soc/codecs/rt712-sdca.c      |  6 +++++
>  sound/soc/codecs/rt715-sdca-sdw.c  | 37 ++++++++++++++++++++----------
>  sound/soc/codecs/rt715-sdca.c      |  6 +++++
>  sound/soc/codecs/rt715-sdw.c       | 27 ++++++++++++----------
>  sound/soc/codecs/rt715.c           |  6 +++++
>  sound/soc/codecs/rt721-sdca-sdw.c  | 29 ++++++++++++-----------
>  sound/soc/codecs/rt721-sdca.c      |  6 +++++
>  sound/soc/codecs/rt722-sdca-sdw.c  | 26 +++++++++++----------
>  sound/soc/codecs/rt722-sdca.c      |  6 +++++
>  24 files changed, 320 insertions(+), 161 deletions(-)
> 

