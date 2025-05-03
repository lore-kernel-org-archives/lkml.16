Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DBB2DC799
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746264219; cv=none; b=uUhQmGMBk0SyAMSTUA+i+JjG5ML6ZA4eEoAOlyK05AuA+EUauzGfnEoTCPOtUE2Bgy7InagZUjL3ovmsIQi20G9WiWZamcznZis2BnH/xtXUUFL2mw7bS5ytTmnnSJo0NblVIxgey3taUDiJul/cuSC0buCNsl575uhPW5K6y5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746264219; c=relaxed/simple;
	bh=Z7Pkh20h9gqvbuP8aRZrEXBHsAui9bfF3Qy6MI7v4nY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JdBMh6lrtTtNjLulkvZoi2awJyQC2W+851L6T29eFDfDFZSVUULjJA0X97ULMzdER9ncQqaC2Qj7hhvVhvVrQM3SmvFj1n676TCDMYyHUxF5jhWNdmtVXh4G0rLv4GchfG6ZrLP9Q3YeUNJJUvkmC1wLT6pYVpFksnZv+saD5mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=sQSQggf0; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="sQSQggf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746264205; x=1746523405;
	bh=5IvgW1PWHO0efI/A1lL7w/lZr+cnRRpURexAgtbqhOA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=sQSQggf0wMsMPOJvhMxHRfA7o+wKM27pVQUzYLgAktEZOrGHysDYiC+66cf9+94fV
	 nw94EEw/n0TUFPqLiki/FatigRMjKY7oF/gUFjTeiCvtF4WeY/YNdH3N6oJDYyJ632
	 5ugFD2ZUKvk6jpHVtRVtztAWwagn/3tklwm8zlgxQhF89bEptIvCUawvR4ZW0V/PgY
	 GmU3+5qWGPhPhxEAbelmq5+beYbdJ49ohOQlGI5DxDMQQ5Loi6EeUzCOl+7Ndz0sXi
	 YFBcQLZz/2dpXt1ePMZbiFgB+Fa2oQpPWa5i0/+CdMUv0YjKvA+Rtqa0o4a4FTfmgH
	 HoQ/c0+q9ZEWg==
From: Esben Haabendal <esben@geanix.com>
To: "Matti Vaittinen" <mazziesaccount@gmail.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>,  "Mark Brown"
 <broonie@kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] regulator: bd718x7: Ensure SNVS power state is used as
 requested
In-Reply-To: <2996270f-d03e-45f7-9b6b-c5675c39515b@gmail.com> (Matti
	Vaittinen's message of "Fri, 02 May 2025 11:20:32 +0300")
References: <20250501-bd718x7-snvs-reset-v1-1-1fcc7088200e@geanix.com>
	<j3M49vfoxys9iFGLs2PwAULHoQsSQsHAKmaT1D2QCwyjUJNzjxXKESFYkXasW3_3owOakk-tXosNLIgfnMC6vQ==@protonmail.internalid>
	<52221c62-689c-44d2-b65d-07a5301090b3@gmail.com>
	<87tt638q7t.fsf@geanix.com>
	<6JY6cJAFrLw-8XD2zgLh0lxzqzEVtz-49qgct8PAirT1ik1BU1glEyOJJg8lgYnivBWFz1vi7-faSRX_yCgmrQ==@protonmail.internalid>
	<2996270f-d03e-45f7-9b6b-c5675c39515b@gmail.com>
Date: Sat, 03 May 2025 11:23:22 +0200
Message-ID: <87ikmi82ut.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Matti Vaittinen" <mazziesaccount@gmail.com> writes:

> On 02/05/2025 09:46, Esben Haabendal wrote:
>> "Matti Vaittinen" <mazziesaccount@gmail.com> writes:
>>> On 01/05/2025 17:48, Esben Haabendal wrote:
>>>> With the introduction of the rohm,reset-snvs-powered DT binding [2], the
>>>> PMIC settings were only changed when the new property was not found.
>>>>
>>>> As mentioned in [1] the default for BD71387 and BD71847 is to switch to
>>>> SNVS power state on watchdog reset.
>>>
>>> I suppose you mean READY, not SNVS? Commit seems to state:
>>> "By default only wathcdog reset changes state from poweroff to ready."
>>
>> You are absolutely right. Sorry about that.
>>
>>>> So even with rohm,reset-snvs-powered added to DT, a watchdog reset causes
>>>> transitions through READY instead of SNVS.
>>>
>>> The original idea of the rohm,reset-snvs-powered was not to configure
>>> the SNVS to be the target.
>>
>> Makes sense.
>>
>> If we keep it that way, then I think we should change the description of
>> the binding. "Transfer PMIC to SNVS state at reset" tricked at least me
>> into believing it would actually make the kernel setup the PMIC to
>> go to SNVS state at reset.
>>
>> Maybe someething like:
>>
>>      PMIC is configured to go to SNVS state on reset. Bootloader or
>>      something else is responsible for configuring the PMIC to do this.
>>      The driver will not change this configuration when this property is
>>      present.
>
> I am not objecting this. And adding your suggestion at the end of the
> mail should make things, well, not pretty but working.
>
>> I guess back in 2019 when you introduced the rohm,reset-snvs-powered
>> binding you had to keep the code for writing to TRANS_COND1 in the
>> default case for backwards compatibility. But in hindsight, I think the
>> asymetry caused by not doing the same when rohm,reset-snvs-powered is
>> used is what caught me off guard.
>
> Yes, I agree. It should have changed the reset target from the day 1,
> but as I didn't do it right back then ... We now may very well have it
> somewhere it shouldn't be, and changing this is somewhat risky.

Exactly.

>> But that is water under the bridge...
>>
>>> The driver was mostly built to assume that the PMIC has been
>>> configured by earlier stages like uboot, and configs in the driver
>>> were mostly introduced to make power rail enable states controllable
>>> by the software - without risking the rails to be left off. Thus,
>>> AFAIR, the values set by boot (or other power manager MCUs) haven't
>>> been overwritten is the "rohm,reset-snvs-powered" has been found.
>>
>> Got it.
>>
>>> Configuring for example the hardware watchdog related stuff at Linux
>>> driver boot is somewhat late, since watchdog should probably be running
>>> already - and hangs might happen prior the driver probe.
>>
>> Yes. But this specific configuration is not too late to do at driver
>> probe time, although it is better to do it as early as possible.
>>
>>>> And with the default reboot
>>>> method in mxc_restart() is to cause a watchdog reset, we ended up powering
>>>> off the SNVS domains, and thus losing SNVS state such as SNVS RTC and
>>>> LPGPR, on reboots.
>>>>
>>>> With this change, the rohm,reset-snvs-powered property results in the PMIC
>>>> configuration being modified so POWEROFF transitions to SNVS for all reset
>>>> types, including watchdog reset.
>>>
>>> As far as I can say, this change is, in principle, fine. The
>>> "rohm,reset-snvs-powered" shouldn't be populated in the device-tree, if
>>> SNVS is not meant to be used. My only worry is that the BD71837, 47 and
>>> 50 have been on the field since 2018 - and I am not at all sure all the
>>> device-trees are sane...
>>
>> Yes, there is no way to know that fore sure. Even verifying the sanity
>> of the in-tree device-trees will require quite some work.
>>
>>> And if we configure the reset to use SNVS state, then the software
>>> controlled regulators will not turn ON after the reset. Fail to mark
>>> them in the device-tree and the device will be dead until battery is
>>> drained or removed.
>>>
>>> Is there a way for you to set the "target state" at boot SW?
>>
>> As of right now, not really. I am currently stuck with the existing
>> bootloader. I will replace it sometime later, and at that time, I can
>> make it configure the PMIC properly.
>>
>>> I think that should work as the Linux driver won't touch the target
>>> state if rohm,reset-snvs-powered is set(?)
>>
>> That should work, yes.
>>
>>> This is not NACK to the change, this is asking if we had a safer way,
>>> both for other users and also for you (since I still think these configs
>>> should be done prior Linux driver probe)...
>>
>> We could create another device-tree binding to make the driver override
>> PMIC configuration to use SNVS state on reset. But, in order to maintain
>> backwards compatibility with the rohm,reset-snvs-powered, I don't know
>> what to call it without adding more confusion. Maybe something like
>> rohm,force-reset-snvs-powered?
>
> This should keep the existing users happy while also supporting your use
> case. Together with fix to the description of the
> rohm,reset-snvs-powered (as you suggest above), this should work even if
> it's not really pretty. I am not sure how the DT folks see this though.
>
> Another option is to change the rohm,reset-snvs-powered to have a value.
> Something like:
> rohm,reset-snvs-powered = "default"; or
> rohm,reset-snvs-powered = "forced";

I suspect that device-tree maintainers will not accept changing an
existing binding to a different type, as it would break existing
device-trees. In this case changing an already defined boolean property
to an enum type. But I had the same idea :)

>> But although I found the bidning confusing at first, and currently is
>> not able to configure the PMIC before starting Linux, I agree that
>> it is better to have bootloader or something else handle PMIC
>> configuration, so it is setup as early as possible.
>
> Probably yes.

I will start working on bootloader support for these devices next week,
so for what I am concerned, I can live with doing something like
proposed here as a temporary out-of-tree solution.

What do you think, should we leave it in the current state, or can we
figure out a way to allow the driver to actively change the watchdog
reset to go to SNVS power state?

/Esben
