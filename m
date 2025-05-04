Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB79BE46;
	Sun,  4 May 2025 16:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746377986; cv=none; b=X8CXsp9f668OR60sM7X0AVQqVQ+srFTqA3sAh7GWAQ9SGCfnX1wvjpFXebwSilJubBUghE6SC2vWI3ZtWnQ5/3urj5wvdde1KpvuPIHmI6EdwBk+vGVesPh+64L3fHuhTCUNzSc+HUFjET/gfw8E1NO2rdWgDGtgOQO0DyZ2fug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746377986; c=relaxed/simple;
	bh=aSF3nFwPaiFyuTF0BU2N2hLX0xrN81msykKS7jpgkFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bt4dSzAduVcOU+z6KV+G/o36KySRW/2UiAjUoPCAz2/1BrLAs7HihxHblZ8n23oQI8QpIldbTPlE9Gp7aZ8Sthxbq+4aaY23WGHq+2HdLjP8qzzeLNU5A+xIud8EBp61KySAhw262Anu0GsuvewmNSvwuMI/pO96LOUAJOIMJy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=YzyfbYbK; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="YzyfbYbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746377982; x=1746982782; i=w_armin@gmx.de;
	bh=kqeH+gbAVdLwtZNHkBz1OoS8RrOD0otkZxqyLCeTfzs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YzyfbYbKaDVuqpYXR0bX9CQYuMVbicHs7kgVhQtF15H20yHosbv4glJKIwKiKN2t
	 cxirhVRFsTRV70n7mX9jTwvq64hnXPwHRjK89w1JNqyfPuvra0t+iPrOEAPIRZ1HT
	 rKfHK6vBMEPS0Agg3txkecW3SjZ3tnJWsicFBxiKwxS6euP5h2Bjs5g0uK9IJSxfw
	 614rpLIimTvzOlJS0jNyvOYn9R9YJnN9c+xPmD8RNCij81CzIvCkmukpTz0DKPEy0
	 8yc6DtFpAKh+cJqj/KYeU8DdXc7nPYbxDuCchsuRXSz7vzx8uo0gzPCL+Zm8Jns7T
	 U4LA3jziBzOBcDkImA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6qC-1uubTN41me-00aMny; Sun, 04
 May 2025 18:59:42 +0200
Message-ID: <9625330e-e3e9-49ea-9979-653091dfbe16@gmx.de>
Date: Sun, 4 May 2025 18:59:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suspend/resume failing due to SPD5118
To: Guenter Roeck <linux@roeck-us.net>, Luca Carlon <carlon.luca@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, lucas.demarchi@intel.com
References: <4e0827d4-137f-465c-8af6-41cc68ddaa8b@roeck-us.net>
 <20250503005828.6128-1-carlon.luca@gmail.com>
 <f1ef9677-2650-48e3-834a-fbe9e2830b04@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <f1ef9677-2650-48e3-834a-fbe9e2830b04@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RqmtiPxl3j4B7+y72PFRCpFoO/uI0QCvdzjVnf+HAvNnLHBdcEH
 p87Mqq67QyvAw6k1pTUyAYheFiRJLCjF0gcCbS3PRmT8+KssfCXE78PhibhNHRTNMfHnmK/
 PMXop/jdGeCbg4kuiFX7/f5Md1pYGKIZM2i+LenlnrTyI6h6kSXzLjB3666yKOlk+6K93OM
 dQYXmr0W9A35oxN74xJpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f+1ImPVzKqs=;K4d0KnkWlPW1PNBvpDqegB+vjjc
 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

Am 03.05.25 um 03:40 schrieb Guenter Roeck:

> On 5/2/25 17:58, Luca Carlon wrote:
>>> =C2=A0From the context it looks like the "sensors" command was never=
=20
>>> executed. To get
>>> another data point, it would help if you could load the driver, run=20
>>> the "sensors"
>>> command, and then try to hibernate.
>>
>> Hello,
>>
>> yes, I did not have the sensors command installed.
>>
>> I removed SPD5118 from the blacklist and I rebooted the system. This=20
>> is what the
>> "sensors" command is reporting after the boot:
>>
>> spd5118-i2c-1-50
>> Adapter: SMBus I801 adapter at efa0
>> ERROR: Can't get value of subfeature temp1_lcrit_alarm: Can't read
>> ERROR: Can't get value of subfeature temp1_min_alarm: Can't read
>> ERROR: Can't get value of subfeature temp1_max_alarm: Can't read
>> ERROR: Can't get value of subfeature temp1_crit_alarm: Can't read
>> ERROR: Can't get value of subfeature temp1_min: Can't read
>> ERROR: Can't get value of subfeature temp1_max: Can't read
>> ERROR: Can't get value of subfeature temp1_lcrit: Can't read
>> ERROR: Can't get value of subfeature temp1_crit: Can't read
>> temp1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 N/A=C2=A0 (low=C2=A0 =3D=C2=A0 +0.0=C2=B0C, high =3D=C2=A0 +0.0=C2=B0C=
)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cri=
t low =3D=C2=A0 +0.0=C2=B0C, crit =3D=C2=A0 +0.0=C2=B0C)
>>
>> [...]
>>
>> spd5118-i2c-1-51
>> Adapter: SMBus I801 adapter at efa0
>> ERROR: Can't get value of subfeature temp1_lcrit_alarm: Can't read
>> ERROR: Can't get value of subfeature temp1_min_alarm: Can't read
>> ERROR: Can't get value of subfeature temp1_max_alarm: Can't read
>> ERROR: Can't get value of subfeature temp1_crit_alarm: Can't read
>> ERROR: Can't get value of subfeature temp1_min: Can't read
>> ERROR: Can't get value of subfeature temp1_max: Can't read
>> ERROR: Can't get value of subfeature temp1_lcrit: Can't read
>> ERROR: Can't get value of subfeature temp1_crit: Can't read
>> temp1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 N/A=C2=A0 (low=C2=A0 =3D=C2=A0 +0.0=C2=B0C, high =3D=C2=A0 +0.0=C2=B0C=
)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cri=
t low =3D=C2=A0 +0.0=C2=B0C, crit =3D=C2=A0 +0.0=C2=B0C)
>>
>
> That means there is a problem with the I2C controller, and you'll have t=
o
> black-list the driver. I don't have a better solution, sorry.
>
> Guenter

I do not thing that the i2c controller is at fault here. It seems that whe=
n loading the spd5118 driver
for the first time everything works until some point where the spd5118 dev=
ice stops responding to i2c
requests.

Please you load the i2c-dev module (sudo modprobe i2c-dev) and share the r=
esults of the following commands:

	sudo i2cdump 1 0x50
	sudo i2cdump 1 0x51

This should return the register contents of the spd5118 devices. Please ma=
ke sure that the spd5118 driver
as been blacklisted and unloaded before executing those commands.

I suspect that somehow the spd5118 driver confuses the spd5118 devices, ca=
using them to lock up.

Could you also please tell us the name of the RAM sticks you are using?

Thanks,
Armin Wolf

>
>> I then tried to hibernate. Hibernation failed and the output of the=20
>> "sensors"
>> command did not change.
>>
>> I also tried to rmmod spd5118 and modprobe it. The output of the sensor=
s
>> command does not show spd5118 anymore.
>>
>> Hope I did what you asked properly.
>> Thanks for your answer.
>>
>> Luca Carlon
>
>
