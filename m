Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE7F1C863B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 06:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746168406; cv=none; b=N6Q+vMmSLwXOoCDMzYgwwR9cCJva4Ah7Ar0POOBPmOWlh+42iaIqB/AVtz/799on6zbFtZPK3DI9byAzc2wLwPcqjei2sUHv252hg01ZCURUEMjboyLtk8h8JctRjyzI+bP28Se52ZlfHvBmmXbqrMJuu7k+0v+03O4QmzEG03A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746168406; c=relaxed/simple;
	bh=fqyO7/+3WlP04t+i1zwgrSl/eHuQSlAWb074iqZmVZ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FOpWwQKstja04CeNxHLezRH7ngkex8MSZf1Ky9dvbaDtJSMVxhVEAc53Z9w/sAuxwOellF0+V3fPIRG2lh7d3meA/4DYxlkspDPPcVMsUZyv2bXfXZPImFMpHMmyu2I32NfsMigEHiTnvBHksBriNQ3rKC/L+mwjcRQ2XAO+j6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=qkU3ZpTl; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="qkU3ZpTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746168393; x=1746427593;
	bh=VHTmHzjuS78jw3qgLUdXQzELoskeGzhNFoEyTHdUSEA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=qkU3ZpTlgf0OJ8iPRMr+pnca2lSWx7OG/bEHwUzsP4YlYxsIPLozHC/hj2UE7x6c2
	 19CS0nOXecjparHD2P/3FtttAxuL+eHiz2Q9mdMAxjREH+Em8P3j4W3kQpkqbmfpDS
	 TPByQZtxvXhDs0b5aR+MquBzP7FaoCeE9lzLEAihs0rnTLoy4iZYibCCX1hSE/ObAn
	 7G77nAITXTPKo2DcQkCuHX1mpaM7ISM7JGfsyH/Y7AQRLmKUMLtfE1sQXTJVw8+CeQ
	 znJMdX24wQ0kyYacAF4tV00cKZGfGHpihYUnig225G5hVaTTbHs+YzyqqlPmkNbpeq
	 1jOttQOIi/oGA==
From: Esben Haabendal <esben@geanix.com>
To: "Matti Vaittinen" <mazziesaccount@gmail.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>,  "Mark Brown"
 <broonie@kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] regulator: bd718x7: Ensure SNVS power state is used as
 requested
In-Reply-To: <52221c62-689c-44d2-b65d-07a5301090b3@gmail.com> (Matti
	Vaittinen's message of "Fri, 02 May 2025 08:24:51 +0300")
References: <20250501-bd718x7-snvs-reset-v1-1-1fcc7088200e@geanix.com>
	<j3M49vfoxys9iFGLs2PwAULHoQsSQsHAKmaT1D2QCwyjUJNzjxXKESFYkXasW3_3owOakk-tXosNLIgfnMC6vQ==@protonmail.internalid>
	<52221c62-689c-44d2-b65d-07a5301090b3@gmail.com>
Date: Fri, 02 May 2025 08:46:30 +0200
Message-ID: <87tt638q7t.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Matti Vaittinen" <mazziesaccount@gmail.com> writes:

> Hi Esben,
>
> Oh, it has been a while since I've heard anything from these PMICs :)

Still alive and kicking :)

> On 01/05/2025 17:48, Esben Haabendal wrote:
>> With the introduction of the rohm,reset-snvs-powered DT binding [2], the
>> PMIC settings were only changed when the new property was not found.
>>
>> As mentioned in [1] the default for BD71387 and BD71847 is to switch to
>> SNVS power state on watchdog reset.
>
> I suppose you mean READY, not SNVS? Commit seems to state:
> "By default only wathcdog reset changes state from poweroff to ready."

You are absolutely right. Sorry about that.

>> So even with rohm,reset-snvs-powered added to DT, a watchdog reset causes
>> transitions through READY instead of SNVS.
>
> The original idea of the rohm,reset-snvs-powered was not to configure
> the SNVS to be the target.

Makes sense.

If we keep it that way, then I think we should change the description of
the binding. "Transfer PMIC to SNVS state at reset" tricked at least me
into believing it would actually make the kernel setup the PMIC to
go to SNVS state at reset.

Maybe someething like:

    PMIC is configured to go to SNVS state on reset. Bootloader or
    something else is responsible for configuring the PMIC to do this.
    The driver will not change this configuration when this property is
    present.

I guess back in 2019 when you introduced the rohm,reset-snvs-powered
binding you had to keep the code for writing to TRANS_COND1 in the
default case for backwards compatibility. But in hindsight, I think the
asymetry caused by not doing the same when rohm,reset-snvs-powered is
used is what caught me off guard.
But that is water under the bridge...

> The driver was mostly built to assume that the PMIC has been
> configured by earlier stages like uboot, and configs in the driver
> were mostly introduced to make power rail enable states controllable
> by the software - without risking the rails to be left off. Thus,
> AFAIR, the values set by boot (or other power manager MCUs) haven't
> been overwritten is the "rohm,reset-snvs-powered" has been found.

Got it.

> Configuring for example the hardware watchdog related stuff at Linux
> driver boot is somewhat late, since watchdog should probably be running
> already - and hangs might happen prior the driver probe.

Yes. But this specific configuration is not too late to do at driver
probe time, although it is better to do it as early as possible.

>> And with the default reboot
>> method in mxc_restart() is to cause a watchdog reset, we ended up powering
>> off the SNVS domains, and thus losing SNVS state such as SNVS RTC and
>> LPGPR, on reboots.
>>
>> With this change, the rohm,reset-snvs-powered property results in the PMIC
>> configuration being modified so POWEROFF transitions to SNVS for all reset
>> types, including watchdog reset.
>
> As far as I can say, this change is, in principle, fine. The
> "rohm,reset-snvs-powered" shouldn't be populated in the device-tree, if
> SNVS is not meant to be used. My only worry is that the BD71837, 47 and
> 50 have been on the field since 2018 - and I am not at all sure all the
> device-trees are sane...

Yes, there is no way to know that fore sure. Even verifying the sanity
of the in-tree device-trees will require quite some work.

> And if we configure the reset to use SNVS state, then the software
> controlled regulators will not turn ON after the reset. Fail to mark
> them in the device-tree and the device will be dead until battery is
> drained or removed.
>
> Is there a way for you to set the "target state" at boot SW?

As of right now, not really. I am currently stuck with the existing
bootloader. I will replace it sometime later, and at that time, I can
make it configure the PMIC properly.

> I think that should work as the Linux driver won't touch the target
> state if rohm,reset-snvs-powered is set(?)

That should work, yes.

> This is not NACK to the change, this is asking if we had a safer way,
> both for other users and also for you (since I still think these configs
> should be done prior Linux driver probe)...

We could create another device-tree binding to make the driver override
PMIC configuration to use SNVS state on reset. But, in order to maintain
backwards compatibility with the rohm,reset-snvs-powered, I don't know
what to call it without adding more confusion. Maybe something like
rohm,force-reset-snvs-powered?

But although I found the bidning confusing at first, and currently is
not able to configure the PMIC before starting Linux, I agree that
it is better to have bootloader or something else handle PMIC
configuration, so it is setup as early as possible.

/Esben
