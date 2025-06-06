Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A5A23E34C;
	Fri,  6 Jun 2025 21:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749245445; cv=none; b=aPWDz8xmgcCPG3jEw7DqhZcmrg+udHAeZq8C4WJloKzS7vV6Bp4V9FUEQ6c9paHMdHQJvwl/xgQk3Czlm/5OmMAVxa98o1CuYmfPBevcCY21SSklCmmrtAvHzZbexuHJOFAKBPVdG5I7BoEMpn3PbJOv78NTevJm1vayxQGBCQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749245445; c=relaxed/simple;
	bh=SS4GSe+jGz1c7YxTaBkkzauoL8PE0XuM11Xm2pzctDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6TQDmiXJUNjAHYT8Ir06ddtsV2zxxxIiYnWzSOP8OHeaAEBNuA+qHKO5ZIHIPIH4nQDmgM0H6ADGOduvjDdwv5gNV6KpgZDe/+S720IbU4hTSyb38qT7t6rhE6Orm3E3mRRnBFdox+ynM9qcP3SPda0Ys0CNBaJNOXOOtPkCd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=r4fUomNF; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="r4fUomNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1749245424; x=1749850224; i=w_armin@gmx.de;
	bh=SS4GSe+jGz1c7YxTaBkkzauoL8PE0XuM11Xm2pzctDA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=r4fUomNFPJlUVeBTAbl1sSj1bueBru91psWusanmY6sICZ7d2Z+qOZCCBgutVI6t
	 5sS61SYAGyBLe7mTcozF675SYPm69BcL7M3FO3HGskdZwj2atiopYULvSEpWhlNnv
	 z8Ics7Nh9NNCusr8bgcMldThG5aewoylQsKN18OCC9/CBFg4pl6PMDniiFg+kwVaB
	 8SkfVwJLXxFdcFbAWVgsbj09ZdvfcSOk65Ejr36hZtv51rSMZuFDvdlS5kVL/ZDqt
	 qsr1zyrse5Buvi4rR4Pk2WIEo5AlpsVgGgodSuo53sZvS5WpMirclJFG3/erOA5OF
	 MYzujW64SVXufxZupA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf4c-1v5H7K06pm-00c1st; Fri, 06
 Jun 2025 23:30:24 +0200
Message-ID: <0a3a06df-5da9-4b39-bf38-0894b8084132@gmx.de>
Date: Fri, 6 Jun 2025 23:30:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hwmon: Widespread TOCTOU vulnerabilities in the hwmon
 subsystem
To: Gui-Dong Han <hanguidong02@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: vt8231@hiddenengine.co.uk, steve.glendinning@shawell.net,
 jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
References: <CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com>
 <3f5feb87-330c-4342-88a1-d5076538a86d@roeck-us.net>
 <3401727c-ad93-42df-8130-413eda41ab3a@roeck-us.net>
 <CALbr=LYe3p9GW2Z_RUxKG+w2Q1wfWGRW=dRLoTraS7qJ7imdgw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALbr=LYe3p9GW2Z_RUxKG+w2Q1wfWGRW=dRLoTraS7qJ7imdgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:1xmPSwo0fCqaCoqdIIQHY62NXf3hfCLgjgilXUpYNWlaZhI32xN
 1npMoBsw/UxMxkC8oTmFBM3omQPXw32i/lSrUSspb4SytqAcfGP80Kj/WVmrMUMcsukyJnG
 tC76vJenSMFN1ZrUaPQ8gjCteoCTvsad5KJNtyhhWFViQ7niDMrQl/SDJX1eF5Q8uUVMBYG
 b46/YPu1bCUh+rlEZZBsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Vda5T44NeT0=;xgkkiwdrri+54rCks6aazaArMso
 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
 SoPoWyzQYVfk4UFwZvPdiGR9w

Am 06.06.25 um 09:03 schrieb Gui-Dong Han:

>> On Thu, Jun 05, 2025 at 07:33:24AM -0700, Guenter Roeck wrote:
>>>> I would like to discuss these issues further and collaborate on the
>>>> best way to address them comprehensively.
>>>>
>>> I'd suggest to start submitting patches, with the goal of minimizing
>>> the scope of changes. Sometimes that may mean expanding the scope of
>>> locks, sometimes it may mean converting macros to functions. When
>>> converting to functions, it doesn't have to be inline functions: I'd
>>> leave that up to the compiler to decide. None of that code is performance
>>> critical.
>>>
>> Actualy, that makes me wonder if it would make sense to introduce
>> subsystem-level locking. We could introduce a lock in struct
>> hwmon_device_attribute and lock it whenever a show or store function
>> executes in drivers/hwmon/hwmon.c. That would only help for drivers
>> using the _with_info API, but it would simplify driver code a lot.
>> Any thoughts on that ?

Hi,

i am against adding a subsystem lock just to work around buggy drivers. Many drivers
should use fine-grained locking to avoid high latencies when reading a single attribute.

Thanks,
Armin Wolf

> Hi Guenter,
>
> Thanks for your quick and insightful feedback!
>
> I agree with your suggestion. Adding a note to
> Documentation/hwmon/submitting-patches.rst about avoiding calculations
> in macros is also a great idea to prevent this class of bugs in the
> future.
>
> Regarding your thoughts on subsystem-level locking, it sounds like a
> promising approach to simplify the drivers using the _with_info API.
> As you mentioned, some drivers don't use this API, so they would still
> require manual fixes.
>
> For the subsystem-level lock itself, I was wondering if a read-write
> semaphore might be more appropriate than a standard mutex. This would
> prevent a single show operation from blocking other concurrent reads.
> I'm not entirely sure about all the implications, but it might be
> worth considering to maintain read performance.
>
> Thanks again for your guidance.
>
> Best regards,
> Gui-Dong Han
>
