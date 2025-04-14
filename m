Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7530C2E645
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660529; cv=none; b=ID5X1bm0URIqgNqLrkjsmfEQ9iZzmUszixdrrzAVgchRNw6uJNECErtrzshi8zkOj2njkYvLb81eR41qIUVGXA6oTZN5suN2Y8YK8cYpSm2Kkhs754UoSaGkIwy7LIPPLiGiBEbOBmsNvlTsroZxXcB54FTmGqszBotK3eMzYis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660529; c=relaxed/simple;
	bh=um7KY1goRBfoVujd+omY/E95dCOWx2kO/R7QV2JW/eM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KOe4CXq2jqLKfeaqEW+8iNVkawV4YwaG78K/aFWwaL19QZdFnJw45vWowbR7RGjiug0sQtgkK2ZByrC5RoHh2/0nXngci9LdYUTK6KsWVFlwrKgsrRt6xRAUnYBSgIgtNIzTn18URlSlG49vfEwJHLQ82dDEx5FpQ+KCOpPMwZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qz8dSeYD; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qz8dSeYD"
Message-ID: <77b8a156-49af-4900-b17a-b2b3fd11eba0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744660512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jE0M98+rObl+Zn7RowjnVlz8XhYfQEBVKI1/h9Xj26U=;
	b=Qz8dSeYDWFs5SXRoR9Rn+XEfoBi4dQlx/KJ8IDAgOp2304GhuuRGNIkqKAY3Ki0MuS/J38
	aJuq6zxTM8c1f4oMvpyIytxdNp4KWOFWHUz54pdaAsnGR6P0fYyYXvPX0ZrfoO5SsEmSeI
	61HmYPshoLWuCW+aHvhXwNwg64DGomE=
Date: Mon, 14 Apr 2025 14:43:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ASoC: SDCA: Create DAPM widgets and routes from DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20250321163928.793301-1-ckeepax@opensource.cirrus.com>
 <20250321163928.793301-2-ckeepax@opensource.cirrus.com>
 <2b899796-b9fc-49ef-a4a7-858baa90a36b@linux.dev>
 <Z+KROae2x3nB6Ov8@opensource.cirrus.com>
 <a5aa25de-919f-462c-8aab-996fbc381de9@linux.dev>
 <Z+PTl4fg5tRoXmEE@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <Z+PTl4fg5tRoXmEE@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Delayed answer, sorry...

>> How would the state of those DAPM SU widgets be updated
>> though? I think we need to 'translate' the GE settings to tell
>> DAPM which paths can become active, but the SUs state is set
>> by hardware so I could see a possible racy disconnect if we
>> make a path activable but hardware hasn't done so yet.
> 
> All the SU DAPM widgets are linked to the single GE control,
> the same ALSA control is shared across all the widgets. So
> all the paths are updated in a single DAPM sync, and on the
> hardware side with a single write to the GE control.

The race I am concerned about is between SU values represented in DAPM and actual values propagated inside the SDCA device. There could be a delay between writing a GE register and the SU register values changing.

>>>>> SDCA also has a slight habit of having fully connected paths, relying
>>>>> more on activating the PDEs to enable functionality. This doesn't map
>>>>> quite so perfectly to DAPM which considers the path a reason to power
>>>>> the PDE. Whilst in the current specification Mixer Units are defined as
>>>>> fixed-function, in DAPM we create a virtual control for each input. This
>>>>> allows paths to be connected/disconnected, providing a more ASoC style
>>>>> approach to managing the power.
>>>>
>>>> Humm, maybe my analysis was too naive but the SDCA PDE seemed
>>>> like a DAPM power supply to me. When a path becomes active,
>>>> DAPM turns on the power for you, and power is turned off some time
>>>> after the path becomes inactive.
>>>
>>> Correct, the PDEs are modeled as supply widgets and those are
>>> powered up when the path is active as normal. The problem
>>> alluded to in this paragraph is there a couple times where
>>> SDCA topologies just have a permanently connected path so
>>> things would always power up.
>>
>> Ah yes those loops would indeed be problematic, but no more
>> than in existing non-SDCA topologies where we used pin switches
>> to disable such loops. All existing TDM-based solutions used
>> pin switches, I was assuming we'd use them as well for SDCA.
> 
> I wanted to do a little more thinking on it. The general
> concern I have is that typically the pin switches are added
> along with the "fabric" widgets in the machine driver. As this
> code here is effectively creating a single codec (function in
> SDCA land), it feels like it is probably inappropriate to hook
> up pin switchs at this level.
> 
> To put that as a more concrete example this code will create
> input widgets for IT 31, 32, 33 (the UAJ mics), however it
> would be unusual to hook a pin switch to those. Something
> should be creating an actual microphone widget, attaching
> that to the input widgets and attaching a pin switch to that.
> Typically those actions are handled in the machine driver,
> there is possibly an argument for handling them in the codec
> driver for SDCA but I felt it would make more sense to progress
> things a little further until resolving that one.

The SDCA spec is supposed to describe what's physically connected, so when we parse the DisCo descriptors we should only see the level that is typically present in machine drivers. The codec descriptors are not generic at all, they should only describe a specific way of how a SDCA codec is used. The traditional split between codec and machine drivers does not really apply for SDCA, the SDCA descriptors represent the *machine* already.

>>> My opinion is that even if we end up adding the pin switches as
>>> well it still makes sense to allow connecting and disconnecting
>>> the inputs of a Mixer Unit.  These are typically where two
>>> audio streams come together and having the ability from the
>>> host side to say if you want that connection or not seems very
>>> valuable to me. As in SDCA land you basically make that choice by
>>> directly flipping the PDE.
>>
>> I have no objection if there are both pin switches and MU switches.
>>
>> I view pin switches as a more generic mechanism that userpace
>> has to set to use a specific endpoint.
>>
>> The MU switches seem like debug capabilities to isolate which
>> path has a problem. My experience fixing Baytrail issues is
>> that you want a default mixer switch to be on, otherwise you'll
>> get warnings on unconnected items or 'there is no sound' bug
>> reports. In other words, the MU switches are a nice-to-have
>> mechanism to disable default paths, so even if userspace
>> doesn't touch those controls sound can be heard on endpoints.
> 
> The mixer switches do default to connected.
> 
> What I like about having mixer switches is it allows a
> clearer specification of intent. For example one can power
> the capture path and one can power the playback path, but the
> mixer switch makes it clear user-space has an intention to
> use the sidetone rather than just those two paths being
> powered coincidentally.
> 
> I could drop them for now and just have the mixers permanently
> connected, until we deal with pin switching, but I am inclined
> to leave it as is and we can revisit later if necessary.

I bet we'll revisit this multiple times :-)
