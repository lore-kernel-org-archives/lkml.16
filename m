Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3B138B;
	Mon, 19 May 2025 02:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747622286; cv=none; b=V93Vw0EqCtQkADtjPEDl576vcTUH+ECdUR6nkqtjcL8OiO4KBtDuM4a5JArSh5JJICEskKN/kNuFsFN9YNTDNSo/REE5hv0JmGPPbgxCllrpHBdDnKQ8prN/XPiVI3NKyeB5Be+aDUl2vW2GhNoFzV38oWxSuDL/ddIgn+rAjUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747622286; c=relaxed/simple;
	bh=Fi9iTL2RpY1O1X2GC20VNbD9y6O0/qOwuKgv63jYQyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDqB6cdAAdy0TVfM8NlECUnZMfk2pvKTRSJG7XpnpP51AkRLXBE/ygBnmSyZJ/xImxZRfQmfnmmjCIU1ySsGCbAxdBra1YFB+kz/3NMjJw2lXQbpf6d3cedL+QtjTztMBK3dPSN8R3R9Ayvyqd6EE384356NC7MjkqpggME+z5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uayfnIty; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uayfnIty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747622281; x=1748227081; i=w_armin@gmx.de;
	bh=iaBeFUmod4MT3CfW49GRiYeC2fwreh8gWgZTnVDrxwk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uayfnItyi3BsrGQeL/oE/RtZVvYc/bMGgY2on2z+CVwf5eolhX38fNzu+isHhAbu
	 ZawtDJLQ2jkJgwqpp8vD+niEZgsbzcISqt0LfzptsEH/7bNJ5PZmhqZDSl0x0ytBr
	 B+74dbP4XbKZD9z/h0IOIFMcTHWAmWzDy1LiznWqQB5xgD11IxL9ofPhe0muV6zfa
	 ON85IUwneE8/dV/yhpPrGVkvQqkS2fjSB2230q7/kGLeRQieJowyjOjnPkjnX/QJH
	 /gHjF4KhoDBiSLuIgoBEmfJ3+UUIyEWW7Pq0tk04FvBUWokRM61oSHzAKDyuEatjz
	 U5T10v24tvMftDf1Bg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCbEp-1u7nys1eR1-003FD6; Mon, 19
 May 2025 04:38:01 +0200
Message-ID: <3a64d00e-3ca8-4a9f-9d72-e62712dc20b9@gmx.de>
Date: Mon, 19 May 2025 04:37:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan
 curves/platform profile/tdp/battery limiting
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Kurt Borja <kuurtb@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250511204427.327558-1-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:G3o7YRZPyomh+bfseKd5ShCaK/WJtWDhA1am9cwRLuv+td+oa4h
 AWbtWJS9PyuSAOxTk6l+p2wPtlTRmmqLXhugQtS+oYg7bhDQbRSsAdqZ1ExdkfAu8XigG1p
 Xmfxn8NZUWNKprKaC8wAS17aVL7FE1XikeYL3XempdljkswaYPvsnl5533cfxgiqgPQgPYG
 QAlILlc6LwdF9Pqnq6uag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:atxpXWArFds=;Fs/+hUp1YhLnxn4vyFl1j3znhHt
 XasjguGsabJvJt1BaIOhorhEUqhl3I214HXsQOoLfyM+A8pNvf6hFaehyjIVpnxFLZj2DEMH3
 9hiOeKk8mFI00EQ6NRzbgGGCw2IQZ4/Wh3t0HYNviXBSV+zWLEwtkudL4/U5bX0q/Nj+zcfUA
 DjNggMI2amvXfR2uh0hm4k2x6USvbe2K7fEfOV+ar2CEgBbGGXxO5iopzaWlK7VMAlqDXi7wk
 tZoF7RWDwF94SItlAikrGSA1tU+s3QoVb+hhKuvRjF27tB4FfRTeEfl7QfcZ2g7dBpw24V2rX
 lbi6ecGhDZ8IVjOLzfJQAoALd/62yTz1dWtYTETQcIM6Mf4GsJMJgcFdWQECliVywSdpsaKZy
 TX49vhP73wAn3Am0KMBeHXi6evv3RiFoyrXTn/kLEgMrEvJhI8Z601ATMXtxiF9SzLzpUxZvI
 aUkVk8n/0+W2vXAYZMBVRyFcVR3XX5Ht9pAu418nKm7yhenAPJdxXTpvYLSFlFB+bXW71QQDx
 Rz8nJPTakD45I+7Se0FSnadusYIuui/5sApsj9C4fkJpJMvuFexCwQZBQMknsrf5Zs2B/Ba2t
 4k4VRwFXQhVSFT6XW4wMn5EESI83dBHjmsx8wlZjhMXoUlXOshAzPZmBF/zYfL6qAKJcaKf2K
 mzt8bO45eKWe3tejk9yxKq/tO3GLx9gB6PO8PWZ10XXVQ/3Fs1k3lt7ks3YFnD3/UQrUxE4tt
 z3fVcN5LPfipowPTYkrfXijcbUN+0Es/SoHZooDkhwpJDWnzrwXQwDgixSM/tGjE3Hsg2Z/vP
 DgemcZoffDXkwTAiKeu+37xHj4C4zr9KXSDN8R0mSkFaxdtykmpD2P12aeieMX5hYo2QHFVr+
 j3ceQTisEdwggiqXRaxqX5CXPzQ1Z/0Hgx5iWjfDjRAZAa4mxSD7c5o0fpgBfjK6FwmpZrA0i
 hvh77q3acgICiMouk/Kd6MUjAVrPZNrh3n+dRvXN651YVtr0U+yjS69ivTbKVq0Ptyze06zZL
 Fhp74qVZ4pzZnfg/+p9isPP1Mype0BKfQ/7oJ2FPD7J318qFaWmgBkWbgxk1to2E8C+TGFW9T
 /tj6P1DpUdS48+SR4xadqfOvtrbuhlmwvzm3x9UX2od1bCjuaMSkp+PATWAnWEm0wflNwJdn0
 gBbbw2FCbMfu2iRALenRUUd5E4VQu3qo+UmMwXRhM2KJln8+TjNhtJEzaaG0h/UEl9R4n9RPn
 t4NmC3R2Qx2XZCosYK9nt1B446cbSgSzTMv3vQ+lypAIiJoL9b+bAULeBVK8oEY+jwwG3vLES
 v8qSWvVTBDhuru4O8ZthjWmomOsInKJTU9AHxejpnAOd2Lca8t3Ejb/TfsISH+trSRpeHfCCZ
 1fk5fCVnjiY/sEQRIr+MDwAbUA4E5mZiKx8n09p+j3cYAdDnm2lD8Ii1zygnsqlEUBtDbTtun
 2o4seTl8SgmUNyIk098Yf4xN9Cz1J3/oltYT+b2J1lPA3W5GkXt0063wyDLF0g+tmTyH6vfKW
 7IK3+JcaPnoYxnRdXs8T7f2Vk0JEG7bz93tIDrUd6TGsl9n317qDGpV/syb7gmum7u1fHZGl9
 bjBCgxQMrm3VkE7IhRtfpnPR2qW53qWTWNvdUAzeoQjWUPjisYAfSX7/vnkTpTxgMzeN+RNyO
 QwY6lvOUlNrxENyipYy1KGeORpW1iEqRjWqueywo+q3LEqDOstsnsNFz8sEZrn+X6hG7/CBQL
 whqGPdSYlFuMHtZWxo6J6i696uOHNkjYWiOVdWF60lIml7ozE/glPXqVNge1sW9QcgoXESA2v
 7u3kU3T3a0c7TlrCXzQEO7RyNkvQi1Sboi6oLL+qBl9lG8VGoFsIRQi2D2dW1rwJgzWKZWKWr
 O8TZNUdIU4NutfbQousrS9DjYk/NJtcdv5RKCdDUqT6sdWoqai0gv+JnST9+sG1knoo63tNYS
 Le7KL8tiNK9MIofxDwUjugTPguMVDJgVRy4lWkaWPdFOSZHpunfqQ0GmaGAN+610y0+G1FQ9q
 Tt28WKbi/NHaKFiEcOfQJ7EOsbOWBNWWyOXEs/q4WI4BmdAaAWs6YE3pkEYdmgoG3ennIcMcW
 Wwynep08im3am6vCSFqZ1jqpPSXjTVNv2V7tFXi5+F4heNT94xOZieonp82ZGIzmflueyu4xy
 di1/dlE9Xvgw797h56ZVKblJxJuv6IoHVqTrVYZYvXqR3EagTcLhgQRbCgeEc5IS06L95JEso
 B2OV9xrnWUV0oHzXF+LjlQ8kkTZq2Cet/0JWcJ5d2VVThj0kBe9ELscn0VYT1eaZRzruWum2u
 rlAWevtrQYHMU+NrCsM9NHwkiwkwrBioNFgqNoClsvONXK8yfAjSQuASqo4BAkEN3kOZM4Duq
 eCE9tuGaOwpwDSSwc/fn0PJaLZObONzfn5rIOEM0hKRZShGZGPmMpbryrEYyg24sEKAqsJGLk
 O0/FdC1IbftBah8LwIg1UAWK73LkbX37nJvAuDCz/mUNakvCOnrqdOCMS9M48d+E3cmDFuGwp
 O0+DUf9FCTi48avxFoaFpum9+FNekT11f0TlkOEohtuzEQOWq4EW+am2mX1J251yfGM7HCc0R
 D9ClooCtHZ/9onG5NRJC90NxqkqHfpQinE1RFOxegl9hggUSisqw1K3ZNxfyK4lo9dW39st8m
 Sfi59/G2YiMG07EywmHsaaOScLrA1RWps1O1EDaiRF6hJuNXJwLgPKD+HtU8Vv5JBnUzTmO7P
 +4UNHQ7CjIgY7Tlhrlf8P5lLuMwzbjDtk7F8FFoHQHaPkSL0n3SxVcsSN2yz+nSepINRBNlw/
 JfbAaqanYQ/TLcHYTitBIzF9zFI/7CnCk23vmwXFgK1Wz/xMWScXKZ/MhHGcUYU/s84gMPJU+
 N4agwAxiIABFjiWOGy6+RLvYBHCn6zmC7mdkn0+V0uAX4KaVi2RdFISMK3AbB0IgHWbCzaEmm
 w5gPbG/6ZmOGaXzQhPLXODpNnYVp27NIVX1SCqzKX6d0tE6sJN4crhXpn0rRfg1cIRXNQpJLT
 UZiMi0Hoz1dUrGlFVaZ1XBs0gbA2TydQibKcjUmLITvPBefByDghZhzusFhdRvEGA==

Am 11.05.25 um 22:44 schrieb Antheas Kapenekakis:

> This draft patch series brings into parity the msi-wmi-platform driver with
> the MSI Center M Windows application for the MSI Claw (all models).
> Unfortunately, MSI Center M and this interface do not have a discovery API,
> necessitating the introduction of a quirk system.
>
> While this patch series is fully functional and tested, there are still
> some issues that need to be addressed:
>    - Armin notes we need to disable fan curve support by default and quirk
>      it as well, as it is not supported on all models. However, the way
>      PWM enable ops work, this makes it a bit difficult, so I would like
>      some suggestions on how to rework this.
>    - It turns out that to fully disable the fan curve, we have to restore
>      the default fan values. This is also what is done on the OEM software.
>      For this, the last patch in the series is used, which is a bit dirty.
>
> Sleep was tested with all values being preserved during S0iX (platform
> profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
> least for the Claw devices.
>
> For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
> his new high level interface is merged beforehand, we can use that instead.

Overall the patch series looks promising, however the suspend/resume handling
and the quirk system still needs some work.

If you wish i can provide you with a patch for the EC-based quirk system. You
can then structure your exiting patches around that.

Thanks,
Armin Wolf

> Antheas Kapenekakis (8):
>    platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
>    platform/x86: msi-wmi-platform: Add quirk system
>    platform/x86: msi-wmi-platform: Add platform profile through shift
>      mode
>    platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
>      attributes
>    platform/x86: msi-wmi-platform: Add charge_threshold support
>    platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
>    platform/x86: msi-wmi-platform: Update header text
>    platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
>      unload
>
> Armin Wolf (2):
>    platform/x86: msi-wmi-platform: Use input buffer for returning result
>    platform/x86: msi-wmi-platform: Add support for fan control
>
>   .../wmi/devices/msi-wmi-platform.rst          |   26 +
>   drivers/platform/x86/Kconfig                  |    3 +
>   drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
>   3 files changed, 1156 insertions(+), 54 deletions(-)
>
>
> base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2
