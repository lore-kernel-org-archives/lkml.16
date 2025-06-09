Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7314E19F41C;
	Mon,  9 Jun 2025 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481624; cv=none; b=fZBpQH835vvzSx8v8wrDKC2pAmjsZ/L1CLXpvvdUT7jKcI+AGrV9TlzzvwXLvuWrN0TxKyUGNH3v58PGe+GpFtKGClUS4e/Xm3sch4+kfS+MA9aPiouhgLDlSygSdAPCfmHoUD0nyK8gOuiTW3LBuH8gPyLbfd8zAvR8ERAUpVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481624; c=relaxed/simple;
	bh=LOaEDRQ4kYrwi4Xn/mnj3m+pzhRaACbyXtEqKfL92Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/ETga7oSA/fjsoZvVBkTBQDVf0btQ6qQyYHDQjOAHW9giqjMEilrevaxhIxBhYJCGStuyHXf/RjWNeo+WwMxYNXdfhBXJ3gMQGRArquUK0YvOpnfqqRVBhEa1ih55GF8Jbm8Z+yH6heHrP3sN2DPqX7PxIRLSFiQdep4oLJMks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MGoQBXIz; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MGoQBXIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1749481618; x=1750086418; i=w_armin@gmx.de;
	bh=LOaEDRQ4kYrwi4Xn/mnj3m+pzhRaACbyXtEqKfL92Yg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MGoQBXIz5mmdHjbAmMo3uGXNLq5YMACJbK/KBOz+wdVCHJiIKz/RpNZPRIPiC1Ro
	 KC9OQpjbAafRoZX8ABuB7FFMMfge+xp/hBwPzMW6WANyomZTan7ZrLcPbhNo5k3AA
	 UdxJNGBHJOP9ZH4SjeABtznE/bu9AKnOT2LBKeKkVdfK2hb979PK0GP7SVh84U4ws
	 HJNlZl60UVRR89jFR/BpQgmE0CBU15FOfRD4nkhXPbOpOun95Yn+ltA2R7oPPJ1Ww
	 L5W788GYgsKAYxxE1oAzYrFSG+yjPUravj0AtS7D6fh0CAqKeeeEQvbhzNogXf6iF
	 2J6vzCbRwDLFfuI+2g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOGU-1ugaNg0OtS-00xMg8; Mon, 09
 Jun 2025 17:06:58 +0200
Message-ID: <474af450-fe05-46d6-90d6-d5ac3408cf68@gmx.de>
Date: Mon, 9 Jun 2025 17:06:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hwmon: Widespread TOCTOU vulnerabilities in the hwmon
 subsystem
To: Guenter Roeck <linux@roeck-us.net>, Gui-Dong Han <hanguidong02@gmail.com>
Cc: vt8231@hiddenengine.co.uk, steve.glendinning@shawell.net,
 jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
References: <CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com>
 <3f5feb87-330c-4342-88a1-d5076538a86d@roeck-us.net>
 <3401727c-ad93-42df-8130-413eda41ab3a@roeck-us.net>
 <CALbr=LYe3p9GW2Z_RUxKG+w2Q1wfWGRW=dRLoTraS7qJ7imdgw@mail.gmail.com>
 <3f56be7b-d5b4-4753-8649-62ee21d2c6bd@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <3f56be7b-d5b4-4753-8649-62ee21d2c6bd@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xsgQzJV4+yM2+gisrx6ewIahjPqv4GmwxppmExVkL0RmeiYsQhw
 A2QGDrccch6X2QhUCJnqpsT8XzlLCrEWbHcs4cmQ5wl9G9oyB7GirdJcBo8q8KI2rY7aPZk
 sWcXZbT5QWESpBDMND2HBOIeacDyOJ1fuM58YG1GUJAJim9eGpvgdVuXsaYlu1iZiJ63iyJ
 Zgjj5SVSogvfb29tYl7Ew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lqURk9qVMWk=;IK90yXlHprrrLWOEcGtOsyZ5KG9
 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
 PitI=

Am 07.06.25 um 01:22 schrieb Guenter Roeck:

> On 6/6/25 00:03, Gui-Dong Han wrote:
>>> On Thu, Jun 05, 2025 at 07:33:24AM -0700, Guenter Roeck wrote:
>>>>>
>>>>> I would like to discuss these issues further and collaborate on the
>>>>> best way to address them comprehensively.
>>>>>
>>>>
>>>> I'd suggest to start submitting patches, with the goal of minimizing
>>>> the scope of changes. Sometimes that may mean expanding the scope of
>>>> locks, sometimes it may mean converting macros to functions. When
>>>> converting to functions, it doesn't have to be inline functions: I'd
>>>> leave that up to the compiler to decide. None of that code is=20
>>>> performance
>>>> critical.
>>>>
>>> Actualy, that makes me wonder if it would make sense to introduce
>>> subsystem-level locking. We could introduce a lock in struct
>>> hwmon_device_attribute and lock it whenever a show or store function
>>> executes in drivers/hwmon/hwmon.c. That would only help for drivers
>>> using the _with_info API, but it would simplify driver code a lot.
>>> Any thoughts on that ?
>>
>> Hi Guenter,
>>
>> Thanks for your quick and insightful feedback!
>>
>> I agree with your suggestion. Adding a note to
>> Documentation/hwmon/submitting-patches.rst about avoiding calculations
>> in macros is also a great idea to prevent this class of bugs in the
>> future.
>>
>> Regarding your thoughts on subsystem-level locking, it sounds like a
>> promising approach to simplify the drivers using the _with_info API.
>> As you mentioned, some drivers don't use this API, so they would still
>> require manual fixes.
>>
>> For the subsystem-level lock itself, I was wondering if a read-write
>> semaphore might be more appropriate than a standard mutex. This would
>> prevent a single show operation from blocking other concurrent reads.
>> I'm not entirely sure about all the implications, but it might be
>> worth considering to maintain read performance.
>>
>
> Various drivers need write locks when reading attributes, so that=20
> would not
> work well. We'd need some flag indicating "this driver needs write locks
> when reading data", and then things become complicated again,=20
> defeating the
> benefit.
>
> Guenter

I agree, different drivers need different locks. From my point of view dri=
vers using the
with_info-API can easily implement such a global lock themself by using gu=
ard(). This also
allows them to choose the type of lock to use.

Thanks,
Armin Wolf

