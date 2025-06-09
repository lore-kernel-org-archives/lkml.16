Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0CA20E71D;
	Mon,  9 Jun 2025 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481407; cv=none; b=dnSTxlWCF5ZgQow6vSIlRv/R0TmdDR2PJYz4H06yuBeUXxISet4ZmxzhAhfrmQuj6Z/Vn6qhqBDn+qMXc+lDt/Mmo3PHKUn4/p45qas2lSu60eOHBbOXP/+eN9SZky+bRzGYEyOtNuTD0Ti71TFb6Atyy1NM9T5N6wQoqkr+eqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481407; c=relaxed/simple;
	bh=te9mvffqCREp87q3ohFeOWU95PBzSm1z999O0/Nq+YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFC8oM6KBVeOAuVl+2LNKUxqcyqgl/M9yZH0dJ2ILKTl5t2UcqkjqBkOPtUhhwLD4qqWozgOz4Hrz+bHcYEm+1pB4QK8YxrVE+r3SLJT5K/jUeIGa6uPnoY1eS90dYc71ZNk5v1WkiTVE2syTSySinIRObu+5ZLemE7cJB2AkgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=PcWfWChQ; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="PcWfWChQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1749481388; x=1750086188; i=w_armin@gmx.de;
	bh=te9mvffqCREp87q3ohFeOWU95PBzSm1z999O0/Nq+YA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PcWfWChQ5s0VFspucQzX3Ft2vkh+c6Gur1httrG90ASIJT1/Pj6L7ES+Yy8bMXSY
	 USPOI3UV43pi3BwnWNg5iYXC5T7IIYhn0/O2rmYBc7ZwBfpm7rVEWvxHO78TsJmCu
	 MRHYt5bDUBCBImUd5sJONIQYs8BR/uhLApOYaKF9+95FNGuwyOSokph8lx0/cmMWP
	 5x8eNFFZ64Nz3khlg4WbSebYU+Pvt9eeP+whlEvj2Una+Cq2D7/fUAUnNKa97O7Vn
	 rhDNrwBDYLFw5YDOQQacfyElio1hsq41QGkYxBspqVmGpXhx20DS9U1bn7009fYaR
	 icvKmdPY24euSz+9fA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3DNt-1uQ1T71rHZ-005XPH; Mon, 09
 Jun 2025 17:03:08 +0200
Message-ID: <06476e3b-3334-4c26-8762-6b410feb740d@gmx.de>
Date: Mon, 9 Jun 2025 17:03:06 +0200
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
 <0a3a06df-5da9-4b39-bf38-0894b8084132@gmx.de>
 <72661c37-c4f4-4265-9fa4-e4b31b43f6df@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <72661c37-c4f4-4265-9fa4-e4b31b43f6df@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g4/ClnNOa8Zi1pUoL05tePh2J3ypd/Jkg/gqCbkgbFWK0/V0EDi
 DQ38244iaoed5jo6BLqY2shRqY23bKQtTL16E3RlnQjbfz1DYh8m+5FTRDoir929yHSMDdy
 6Z2jFodbp0QBF4FzFnq2kwYKdoVy6y0pg8DLHwZ0nLGAM0IOiJd06SRyKSZJ8jbHP4e9Ta/
 PX2qW8g6HrmAn5jAl0WTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:43tp462bf/0=;w3Sz38rme9aD9wFO1omhI2sss48
 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
 3sELztm6lHMPJC6kFzY6JTQmv

Am 07.06.25 um 01:20 schrieb Guenter Roeck:

> On 6/6/25 14:30, Armin Wolf wrote:
>> Am 06.06.25 um 09:03 schrieb Gui-Dong Han:
>>
>>>> On Thu, Jun 05, 2025 at 07:33:24AM -0700, Guenter Roeck wrote:
>>>>>> I would like to discuss these issues further and collaborate on the
>>>>>> best way to address them comprehensively.
>>>>>>
>>>>> I'd suggest to start submitting patches, with the goal of minimizing
>>>>> the scope of changes. Sometimes that may mean expanding the scope of
>>>>> locks, sometimes it may mean converting macros to functions. When
>>>>> converting to functions, it doesn't have to be inline functions: I'd
>>>>> leave that up to the compiler to decide. None of that code is=20
>>>>> performance
>>>>> critical.
>>>>>
>>>> Actualy, that makes me wonder if it would make sense to introduce
>>>> subsystem-level locking. We could introduce a lock in struct
>>>> hwmon_device_attribute and lock it whenever a show or store function
>>>> executes in drivers/hwmon/hwmon.c. That would only help for drivers
>>>> using the _with_info API, but it would simplify driver code a lot.
>>>> Any thoughts on that ?
>>
>> Hi,
>>
>> i am against adding a subsystem lock just to work around buggy=20
>> drivers. Many drivers
>> should use fine-grained locking to avoid high latencies when reading=20
>> a single attribute.
>>
>
> The point would be driver code simplification and increasing=20
> robustness, not
> working around buggy drivers.
>
> Anyway, what high latency are you talking about ? Serialization of=20
> attribute
> accesses would only increase latency if multiple processes read=20
> attributes from
> the same driver at the same time, which is hardly a typical use case.
>
> Guenter

Some drivers read all registers (fan, temperature, etc) when updating the =
readings, and depending
on the underlying bus system this might take some time. With a global lock=
 reading a single value will thus
take as much time as reading all values.

Thanks,
Armin Wolf

