Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCC11DE2B4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743531539; cv=none; b=e2nL5Dd1ddNOEoiWewj5MQ1ALBxerA8XcDCr8uZCoNyU86DQSIC3zkP63rqtLMozN7oghJ3+oqh3aF7VW4EsbBPfUHt+YutXnV+8vzP6hkl3/zB76qSmsJXmqIFL2dUHn5abL4Cj8MQjd6SPzK73cDWvXet3d6k1aEo7IPOWfJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743531539; c=relaxed/simple;
	bh=k4nbEj2HOrkVKd3meibvEKz8GTVSNgISM5g0cAlbbB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/nrNFVH3ijSs6mXfN47+s+QmEoSXvOhvM3PY73bYZIwnr4mUh6GZrDS27N1Vh1hcCS4kZDZmQt1UFoKK3qVDDjmri8pF7D+2bUpucpyYWO7MXk5gsM5sEgota/W5UGWn3d33vDBCbEJK687pxeGOW6sSWaubFDMHIP0+iS8hMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=craftyguy.net; spf=pass smtp.mailfrom=craftyguy.net; dkim=pass (2048-bit key) header.d=craftyguy.net header.i=@craftyguy.net header.b=GZg9ADIz; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=craftyguy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=craftyguy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=craftyguy.net header.i=@craftyguy.net header.b="GZg9ADIz"
Message-ID: <7e287401-98c4-413f-8108-134d5e43d279@craftyguy.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
	s=key1; t=1743531535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPDdthZvOKQegQtqGLkhrEwgHRPScxP/qocRmzW8nbA=;
	b=GZg9ADIzt1neDQckUX7aNRGvlukEVYj56hWCAdR/hMVBomhLpwnaXTdbC2h1PND/4irDiT
	HjDw76E7lycsAF1KvO15jn3uO8RxYSOvmudpU1CJ76omexpvW87QzIEZKZtGegljFnNoks
	KbBogy6tvjI2T236d/wQb/SpZM1atC+rwW3D6F5ZkQQ9YGvplzC9uYSVWV48Gt5kb7cu9r
	/pzOcRrTRi63W0VdsEuzQqIRFu9F2n/YTJGZS/3SjRwDN8/4RTKyUL/neRC1NYGNz3ddb3
	LzeDonS9LtBQ9zGLG0rY6CCOLIjH23PG2tugNLWr4HsxPfagfBsi4KBqf6UgbQ==
Date: Tue, 1 Apr 2025 11:18:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: fix spurious DP hotplug
 events
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250324132448.6134-1-johan+linaro@kernel.org>
 <dd1bc01c-75f4-4071-a2ac-534a12dd3029@craftyguy.net>
 <Z-JqCUu13US1E5wY@hovoldconsulting.com>
 <Z-QSg7LH8u7uAfLg@hovoldconsulting.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Clayton Craft <clayton@craftyguy.net>
In-Reply-To: <Z-QSg7LH8u7uAfLg@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/26/25 07:43, Johan Hovold wrote:
> On Tue, Mar 25, 2025 at 09:32:10AM +0100, Johan Hovold wrote:
>> On Mon, Mar 24, 2025 at 10:05:44AM -0700, Clayton Craft wrote:
>>> On 3/24/25 06:24, Johan Hovold wrote:
>>>> The PMIC GLINK driver is currently generating DisplayPort hotplug
>>>> notifications whenever something is connected to (or disconnected from)
>>>> a port regardless of the type of notification sent by the firmware.
>>>>
>>>> These notifications are forwarded to user space by the DRM subsystem as
>>>> connector "change" uevents:
>>
>>>> ---
>>>>
>>>> Clayton reported seeing display flickering with recent RC kernels, which
>>>> may possibly be related to these spurious events being generated with
>>>> even greater frequency.
>>>>
>>>> That still remains to be fully understood, but the spurious events, that
>>>> on the X13s are generated every 90 seconds, should be fixed either way.
>>>
>>> When a display/dock (which has ethernet) is connected, I see this
>>> hotplug change event 2 times (every 30 seconds) which I think you said
>>> this is expected now?
>>
>> I didn't realise you were also using a display/dock. Bjorn mentioned
>> that he has noticed issues with one of his monitors (e.g. built-in hub
>> reenumerating repeatedly iirc) which may be related.

Sorry for the confusion, let me clarify:

The original issue I reported to you on IRC was *without* a 
dock/external display attached, only a PD adapter was attached. With 
your patch, I no longer see these drm hotplug events in this scenario.

After confirming that your patch resolved the spurious hotplug events 
when using a PD charger, I connected a dock+external display to see if 
the patch caused any regressions there for me. It was here that I 
noticed a periodic hotplug event firing 2 times every 30 seconds was 
still showing up. I don't know if this is expected or not, I've never 
noticed it before because I wasn't monitoring udev events.

>> Just so I understand you correctly here, you're no longer seeing the
>> repeated uevents with this patch? Both when using a dock and when using
>> a charger directly?

With PD charger only: no more spurious hotplug events firing

With dock+external displauy: 2x hotplug events every 30s.

>>
>> Did it help with the display flickering too? Was that only on the
>> external display?

The flickering was only on the internal display, and your patch here 
seems to have resolved that.

-Clayton
