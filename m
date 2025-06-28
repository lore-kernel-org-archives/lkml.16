Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3021B8FE;
	Sat, 28 Jun 2025 06:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751091611; cv=none; b=I4vlNx6QVGsXyMV6fkMU2HT0GqJB5c+Yx1ijx9ne2vPqN7IoljQ3BgFRbCuvTeKRYLTeND0GOJSKufF+GRZQWtZGw5HmCRWuPa4hwiONCGrHHuG8uuqySHb1EbDpTCTl8ZoJpmGQ4l+tA1QKU1sw/jFUNJjx2UQV24OPXAU6Iow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751091611; c=relaxed/simple;
	bh=USb5tB84MasePKo0R/I022b3AyE6SjD/wOTDY0flXCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICK7ZaO4yd0PH5rwKtVJS+r+8UMwk2AbNOeDCl/a9fG3W5V9VH5/KP8wTYAwcU/+WgOehh+q0/gz/VsHZzKcqBylgIVDy2knInq+GaVbgrdWWr+qOqJLm6MyPvyG4msCDLCcTyXLr+q9NIlxto+jj11HJDqvc9LWjjuJhkrkF60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=Gg5ZfB0J; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="Gg5ZfB0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1751091601; x=1751696401;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=0Jw9WoK86l96kRZKWgR+Okp1m97afGHFtEnaUA3ZiMg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Gg5ZfB0JlHnGLeLX54iOz//ASLcjE7W1ObTuuPfRSxpgFmwa/jBQrg61XpWW0350
	 n5/htFYAnesoC5VIoJx8o9vMlBC/LYc4zqIxOBV+4Wy/XRAcsc9rEHzK77+huYWMB
	 jSaZW6neN2YIW1nCCgguITJpu2QAYtXjWDVd2WOqr3hNS2aA1tZERCtqhG0R7lC10
	 CLOqYuFw9s7v3OiiqwCBYEjnoSnYZNNSqZrkp3qH5YQPDolz2pI8pHbUXzGfj5299
	 0peq/7Blv2znxrEGBU8blVlW4JUfBclrJqR9PP5CZdsAXrbPLWB9QheP3YGWdt0Nc
	 LUpZXs198GNVm4BuDA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MLzSD-1uDaxn0hyD-00PXW9; Sat, 28 Jun 2025 08:14:26 +0200
Message-ID: <fbccc241-f957-43cf-9aa2-120e192cad55@oldschoolsolutions.biz>
Date: Sat, 28 Jun 2025 08:14:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH v1 0/2] Introduce dummy regulator consumer
To: Mark Brown <broonie@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, konrad.dybcio@oss.qualcomm.com
References: <20250607212654.126412-1-alex.vinarskis@gmail.com>
 <8a688e9f-012e-461c-a916-f06b34fdd913@sirena.org.uk>
 <CAMcHhXpVKaWX8guog_M+5wHfJ+6uxBteNnV1xCjcDJuGFWOCkg@mail.gmail.com>
 <b481298e-319f-41ce-8a56-e3f78b8649ff@sirena.org.uk>
 <CAMcHhXoioEJH+KnLYbXmnt5eyGT-tXg0-CzLQpvj=8Jy5sGXuw@mail.gmail.com>
 <6fcbedb3-eb41-449f-9b6d-10699153c9dc@sirena.org.uk>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <6fcbedb3-eb41-449f-9b6d-10699153c9dc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H45rkvEiz7UEsXmnA4Ugl6kXBaxAZt6DcgwG8zElzme3tYWPJ2q
 Gks3njfXYqB4xKe97cAOdSTRv1Zb/4y4kf3NGykmAeaoa7gYTIN3uQQWUU94ovrjb5T5izu
 6Fu0kdnbGUerZKGcuUWofHVhAasJBMGnIiLwMLKhjGkoj/oU46Lchl7dQtITFRwOx3eIMi5
 +Atco8d96h6dpRzbXYrSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:61SNteo+R7g=;WDnwOZfWRqmHMUzFaMlEaFutRZL
 aNqNotU1CwcdfhGkpeE+4cvjdymaB9/k6NPlN3bd8RJqTwLqmIu7+T2ujP1I+wbI3cmsNzFFs
 aEzDpU8jpvRBH7ye0mtb6PlEv7ZwevUvVei7XrYt5DO0iVP5jDXRfOXtKw7smcYd9+YMt/+RL
 UQtRwY0x8+lRGGYd40//eEZEK2fvk2gIs9LqSQp5gg4w7vXaLSc/t6dGoNkmYIvYr8vgWIQHN
 D6TuEvcFRaBPfSMPok0PSPNGR3I1/qHv7u3eaP8tgArZt1AaOziGQ4YrX/CwbRTS48OIlr9Ny
 L/dNKBQ8GBuqJZfIcbS1ASOYzO1VSKgmJhYoc37rZZR6ncUN8eFDmwfQUqIza2QJx4ifiixsO
 lKERH+EWOzUmQSFWjmLK8d/FRFamrZbxCO4Sv+4wYJ8QZukY6EuR1kuPo9Tq8mVPGSLaf3LsG
 2NEUT2t3fo/FV92z2OINFtKGNWi8lLI6tvqlqdNE36SPlx2b8W2QHA4gxsZ7vkRXR1Zlg7b5w
 Y2LKF4Uii53ZK/YqLhh8qM72GZK5lW8nOu0sd7NKNJhPT207RbCPvxxLmZGmdCDd/J+u291fN
 NvIwgBwc+nCiSSN2vVov7Q8T/5EFFwkm6C00689LUygJVHyz3Q1E3hOPUK+v9+6vv/v37k2vX
 7xeMVRuX6i+/frkFtYLMMZZ8grVCPAbEH1vZu+DFc7rTg+vSUD6RfgFNih9CsTlYXpfQ9yiIP
 QjHRHYf8dH1fWwX7llhQnSm+1j1XUAMF4/c98iDkpIoXVcbJFF0qzVXHC2+pHtpeCLcTfyqYq
 dC7qKVaTke3J8sC8NxWPGKcHDALw9NDuRki49TNgDYFnx4uPJ4Ic+hdOZ4k7TubHbPfZljE29
 rSpktQ9QNIHDj467kbGTZMcnU0gPs1AsEup/DLz/gGeT2M/peVJii30pdaZo1OeUVGAZ34kz8
 N9HtdlnVBLmioZVbrH8PTTeEbBIynA8QzZ/lExcGmW1i6m0y6pX9Okj4jiO2riS4gqZYoV16Q
 ZzZQ2VNMNmEd5BZz03rneAzZpapIPMpZlQb7MjoynsNTgXnMAJ2z2ukaTr5G9YcLKtec0iSOW
 YUIbmVlRsWKd8+EbmBCRjQdOJfk8gr0DIxcrNuj9TTSqP+IugrT6PYQ6xXLeHs3HOfCO4A8MJ
 qOMkPn7K79kHgEFNaP3qg5a43twVJ2phtClrl7eGg4CEYSrf0RFfCgYcdBpo7Z72cVha+eKcK
 h3B21fLNJCSCtmrqbBK8qCH7rAbCYVwUmThkCDh8760L80flI8us25Z/8znGRQ9EEUyrcGl7P
 dBE/XkpIcNNJDTRoekWbF4FjPCz0K2z9NHIFGsj/P1ZShJvY2sTxSUgMxLoX8bX6PTdaQwkiB
 0LvGUQvS5kGvuDEtcsqsooRTlKHsqk5UniyzOQMhHWBoIk8U09o02OX6P+GvH6pf5LiOaFtke
 1aCadx8HPmLFep5itQa3jvimlgrLTvBlJMU8KL2JSqz7AYUkhNMbf/x+yOAiAfkV5n0HbOpT8
 LTyHddhz46v57HfGqhGRqUuopJT34zPqaAMtNpMB72W3JFsXsA1oqlz6uMjHES52lnSP18b/z
 180GBXR9AYFFo/BB8LX8fqPxfJaCH7u

Hi there,

On 10.06.25 15:51, Mark Brown wrote:
> On Mon, Jun 09, 2025 at 11:15:09PM +0200, Aleksandrs Vinarskis wrote:
>> But how would we approach the lack of particular information, in this
>> case all possible VID/PID for an embedded camera? VID/PID was
>> identified by checking the actual device, which does not rule out OEM
>> switching camera SKU on the next batch, same way they do with other
>> peripherals.
> I'm not saying this a particularly great or pleasant solution, just that
> it's where things are at.  You're trying to solve an OS problem with a
> firmware description which is a bit of a mismatch, ideally the firmware
> descriptions would be better but that's just not how ACPI laptops work
> unfortunately.

Just like dummy-regulator is an (undesired, but apparently life-saving)=20
solution to the issue of not having enough info to correctly specify the=
=20
power supply, it is in this use case, so to speak. You found the enable=20
pin to make the peripheral work, you make an educated guess and define=20
it as a regulator. For power management to handle it, you need a=20
consumer. For all this its nearly irrelevant what the device id is (USB=20
discovery runs via the USB host controller in this camera case) nor is=20
it really relevant what the voltage is (also an educated guess what=20
stand-alone USB devices would get via the bus).

Of course, it would be better to get the correct info and describe it=20
accordingly. But more often than not, reality bites.

On that note, another example. I replaced the WLAN and NIC m.2 cards on=20
the Snapdragon Dev Kit with an Intel i226v m.2 card that fits into the A=
=20
slot where the WCN7850 was. To reliably enable it, I had to:

- either keep the whole pmu-wcn7850 definition (with wcn7850 consumer=20
description, regulators apparently on the card and all) in the tree

- or "wire up" the vreg_wcn_3p3 so that it is activated and accepts any=20
consumer.

This didn't go well.

vddpe-3v3-supply on the pcie slot: works, but no USB-A for whatever reason=
.

Dummy consumer for the regulator like this

 =C2=A0 =C2=A0 lan {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D "regulator-dummy-consumer";

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdd-supply =3D <&vreg_wcn_3p3>;
 =C2=A0 =C2=A0 };

This works, reliably. The i226v card doesn't have a node, nor does it=20
need one. The driver for this card (igc) seems to be at odds with power=20
management, so you need additional kernel parameters anyway.

I'm in favor of having a driver like dummy-consumer to make things work=20
when the info for a better definition isn't there. Like dummy-regulator.

> It does seem a lot easier to just mark the supplies as always on if
> there's no integration with an actual client driver TBH.

Exacerbating power consumption when suspended.

with best regards

Jens

