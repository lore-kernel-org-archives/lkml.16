Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F928F4FA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750736217; cv=none; b=MYazpYAAvFl58bgZYKIUWonE5zNGrvN9B56/72jtbCVEMpZN0B9uUxLTp2lMHwGmMpqh0n8l26oJhrU2AOdaWFYXKr65sZa+ZTVukkBgDxTe3b4GE9aS0tsOiociyrV3qxEbMaEWUkKwqveNuYHBRnosteUq7LddQyCR/l3LRIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750736217; c=relaxed/simple;
	bh=UY3IojpQyUv3Jn73EeeZbckeMVWQd6o5JPpktixAIbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovb/MdKY8DsTEoaJMsWKYBmbCxhWm90s5Yu3s3NX9v+Q3FlxQu3Jv3UqCSubk0w0LmQf4ZuD8+Dhycveax7TLoNDQBIwwoP0/wPe7CtSBojJOhqrDwNgjeWGkb0A0OUmTmKkPMvod9TUZToJZFJtduRjyocKsm6DCchNP5z9WRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=j1rxCX3u; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="j1rxCX3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1750736191; x=1751340991; i=herdler@nurfuerspam.de;
	bh=PGLOeTg9ZpmQ29tpAZ09HP3dQ0wMbgdjO5Ud0pWiU9A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=j1rxCX3ueew1cJ9Cb8Qzur5QlRIEeCgthUHXzwdkCvPTYUFkf/ZwdxtftwZE62hC
	 rzUkfISMbMCnsi4NYc+rK6uSxziWMpzysNLv1ntRlNogbtf+CCRUxQW1Y4LncTd0F
	 X8RwBt1AxNJguiTI0dHZC494F+TZ/qXnq9o3J8vd2rNHxLmluvjvxwViE+lnT/HWG
	 yTSicfZsnZf47e/9PY773Gn70qJojoEZin6KzrD+QJc1sgfpeo5wzAsbkCR/+fdCi
	 thNxnFVsYzjie0HEc7Dxy3KE8lez6emESKDpVGHtVa/P7XVEnFH0k649YF7x/3do8
	 zar/CT8bOdvV66iR2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([86.62.8.215]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MI5Q5-1uZ9Ev3fi3-00GyAZ; Tue, 24
 Jun 2025 05:36:30 +0200
Message-ID: <4cfd2806-e461-4aa8-bae3-516b309bf260@nurfuerspam.de>
Date: Tue, 24 Jun 2025 05:36:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: av7110: Workaround a compiler warning
To: Hans Verkuil <hans@jjverkuil.nl>, lkp@intel.com
Cc: hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
References: <202504262127.FkkWHzfs-lkp@intel.com>
 <20250426215409.36852-1-herdler@nurfuerspam.de>
 <dc177375-5e28-40da-bab1-d0627c70bd85@jjverkuil.nl>
Content-Language: de-DE, en-US
From: Stefan Herdler <herdler@nurfuerspam.de>
In-Reply-To: <dc177375-5e28-40da-bab1-d0627c70bd85@jjverkuil.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o/AmFKJLRFFsibUEwbGCr0tlej3extVrXOcIttXTxPgKPlTAQAR
 VAoXaOAOGb4yYCpwxRNhDwxScnSqD32nV5EFFa166HDZKw0eLLT8xDjcXRfeGMjE0+xCSI6
 nmaQPyspDW8gxOCiq4+HUUzqm8aZWEsUQwIB7lr739xIx6zdIfSU1hPW3n70qo6s5ZsDV1g
 P4p3KUyVPNkIoF17NxTRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DLLT1zA8Wis=;PLzIyK3HSZ7CkzQEFcjLqfj9E1l
 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
 eX4/W+dKiuxIrmbG

Hi Hans,

On 20/06/25 15:33 Hans Verkuil wrote:
> Hi Stefan,
>=20
> On 26/04/2025 23:54, Stefan Herdler wrote:
>> Avoid compiler warning caused by an empty block statement.
>>
>> Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202504262127.FkkWHzfs-lkp=
@intel.com/
>> ---
>>
>> I could not reproduce this warning with gcc10 here, but I already had s=
imilar
>> warnings with gcc12 on other projects.
>> I think it has most probably been triggered by the empty block statemen=
t.
>>
>> I'm pretty confident this patch will fix the warning, but not 100% sure=
.
>>
>> The kernel test robot will pick this patch and test is anyway, if I'm c=
orrect.
>> Let's wait, if it complains again.
>> That's the best I can do right now.
>=20
> Is this patch still needed? I noticed that it wasn't CC-ed to the linux-=
media
> mailinglist, so it never appeared in patchwork, and was never picked up.

Thanks for the hint, next time I CC the media-list too.


Meanwhile I think the patch isn't necessary.
In haven't found any other evidence that there is something wrong.
- I wasn't able to reproduce this warning.
- Debian has recent builds of kernel 6.15.3 with gcc 14.
    The kernel-package contains the "dvb-ttpci.ko" file[1] and there are n=
o
    warnings (for this module) in the build log[2].

The warning still doesn't make sense to me -there is no function statement=
-
and the code looks o.k. to me too.
The only debatable thing is the empty function block, which is generally
suggested to avoid.
Meanwhile I think a null statement ";" is maybe a more elegant solution he=
re.

Is there a recommend practice for this? I haven't found anything in the
documentation so far.


Regards
Stefan

[1]: https://packages.debian.org/search?searchon=3Dcontents&keywords=3Ddvb=
-ttpci.ko&mode=3Dpath&suite=3Dexperimental&arch=3Dany
[2]: https://buildd.debian.org/status/logs.php?pkg=3Dlinux&ver=3D6.15.3-1%=
7Eexp1&arch=3Damd64&suite=3Dexperimental

>=20
> If it is still needed, then please post it to linux-media and it will be
> picked up for v6.17.
>=20
> Regards,
>=20
> 	Hans
>=20
>>
>> Regards
>> Stefan
>>
>>
>>  drivers/staging/media/av7110/av7110.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/me=
dia/av7110/av7110.c
>> index bc9a2a40a..962536ed7 100644
>> --- a/drivers/staging/media/av7110/av7110.c
>> +++ b/drivers/staging/media/av7110/av7110.c
>> @@ -159,7 +159,7 @@ static void init_av7110_av(struct av7110 *av7110)
>>  		 * some special handling for the Siemens DVB-C cards...
>>  		 */
>>  	} else if (av7110_init_analog_module(av7110) =3D=3D 0) {
>> -		/* done. */
>> +		goto init_skip_analog_module;
>>  	} else if (dev->pci->subsystem_vendor =3D=3D 0x110a) {
>>  		pr_info("DVB-C w/o analog module @ card %d detected\n", av7110->dvb_=
adapter.num);
>>  		av7110->adac_type =3D DVB_ADAC_NONE;
>> @@ -168,6 +168,7 @@ static void init_av7110_av(struct av7110 *av7110)
>>  		pr_info("adac type set to %d @ card %d\n", av7110->adac_type, av7110=
->dvb_adapter.num);
>>  	}
>> =20
>> +init_skip_analog_module:
>>  	if (av7110->adac_type =3D=3D DVB_ADAC_NONE || av7110->adac_type =3D=
=3D DVB_ADAC_MSP34x0) {
>>  		// switch DVB SCART on
>>  		ret =3D av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, MainSwitch, 1, 0);
>=20

