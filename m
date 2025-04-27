Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50A627701;
	Sun, 27 Apr 2025 01:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745715715; cv=none; b=o9WFlgY411MAnJPld0hlrxyxkFIVnPX/Nm4R1xKL8ce7xFoVlN1aNRV65cJzt7PjPcD3dQLWXAFcyC57YbO4myJkG2NHty2pZoEyDHtIckYQNbNkuDSgNUvPU8ab2OERze4PXAz5KPHNH5juY6DN6ZFxk8I8yyXg+h30Vd8Olag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745715715; c=relaxed/simple;
	bh=vqv9v5rnXCwKtxgPMuiYpT31DWaAoWEmgfzycSL4NrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0SQ2DxoKk2H1bE1KFvDEhUM7ZFkcGWlvXgZmk7VtYqUmH6LN6LGE4uBi+Nu0VVLXserXElSdUExytGpLY2g/q5PjH8qainH/ZvIPzvjbWvu0AE5zMsSGSLoeZlinnlIDj4dm4HLUrYGLSr8TwCNXY9YXYJWbgpmRNvArI9VjIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hjkRDDXl; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hjkRDDXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1745715680; x=1746320480; i=w_armin@gmx.de;
	bh=qQyyQoQJzg4RBslZ28Rdjxme2SssleAe9fm+ndnG0RE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hjkRDDXlQmsRE3a2UmBMLmql0KX2gihMlTGE6z0tUG0cx29VGOhFhHg9y/R/1aDs
	 5RPZIdYgOX7xB2zHSxG1NuzoikHWEhuuerTywYOQP38Pc/kXPFizs9GXgi6Mwx0+B
	 owGe5HuYDJS9zMSyEtx9BJ/+HlNLdEx4twIZP902FNbrS3DDB9tFw01qszdz1uGIF
	 Aht8tFIjuJCgrQHSdbkKzHRlJE6fn2d3OkiqKvI/2p510d7okJS+3rllRPINgitz/
	 D6xcdfCRPJvz5MQr+g9/Lc/65AjRV7hQsaPI8A17U8MuhKaQA/9wcVx16o5txPr3T
	 SBODY9SI5iUCXZ96sg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPog5-1uVCjr1oN1-00Tc59; Sun, 27
 Apr 2025 03:01:20 +0200
Message-ID: <4e18573b-c07d-47c5-a601-cda4b28482f6@gmx.de>
Date: Sun, 27 Apr 2025 03:01:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: wmi: alienware-wmi: Add GPIO control
 documentation
To: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>,
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250423-awcc-gpio-v1-0-160a11bc3f9a@gmail.com>
 <20250423-awcc-gpio-v1-2-160a11bc3f9a@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250423-awcc-gpio-v1-2-160a11bc3f9a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Nm0o7oEWGx24ERkFp+MJm8KgwzDN0bDqDR+0P+yPuRsnoaX/x78
 OJVCgYBjLPKFLFtd0wsr+nmZjf0uGX4mQDgEiQpaa4F0eqXn+QnLXkBSGIvkv6eqAP/ZMWr
 Q3AqwukzGFg+ZA72ikG8C7/XU0QNRfnnfu+TmUwKEXM/a5Y1s/yaw4WKPwdW+QfIprtYUMj
 RfBQAIcowz/CExHo5WnYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:u4WAabhoNRQ=;eSvXBCrTD/nMPslKjoIoK4E57ie
 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
 cq0uUgAnywZBZ+L8h3CsaFDTQ

Am 23.04.25 um 09:49 schrieb Kurt Borja:

> Add documentation for the GPIO control methods.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   Documentation/wmi/devices/alienware-wmi.rst | 85 +++++++++++++++++++++=
++++++--
>   1 file changed, 81 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/wmi/devices/alienware-wmi.rst b/Documentation=
/wmi/devices/alienware-wmi.rst
> index 79238051b18bc5de9b502325017cd5c5fcf41748..8751199834b8e2a3a4abf2b7=
35e4ac6067d93c6d 100644
> --- a/Documentation/wmi/devices/alienware-wmi.rst
> +++ b/Documentation/wmi/devices/alienware-wmi.rst
> @@ -231,6 +231,77 @@ WMI method MemoryOCControl([in] uint32 arg2, [out] =
uint32 argr)
>   AWCC supports memory overclocking, but this method is very intricate a=
nd has
>   not been deciphered yet.
>  =20
> +GPIO control Methods
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Alienware and Dell G Series devices with the AWCC interface, usually ha=
ve an

Hi,

please remove the comma.

> +embedded STM32 RGB lighting controller with USB/HID capabilities. It's =
vendor ID
> +is `187c` while it's product ID may vary from model to model.
> +
> +The control of two GPIO pins of this MCU is exposed as WMI methods for =
debugging
> +purposes.
> +
> ++--------------+-------------------------------------------------------=
=2D------+
> +| Pin          | Description                                           =
       |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+
> +| 0            | Device Firmware Update (DFU) mode pin.                =
       |
> +|              |                                                       =
       |
> +|              | **HIGH**: Enables DFU mode on next MCU boot.          =
       |
> +|              |                                                       =
       |
> +|              | **LOW**: Disables DFU mode on next MCU boot. (default)=
       |
> ++--------------+-------------------------------------------------------=
=2D------+
> +| 1            | Negative Reset (NRST) pin.                            =
       |
> +|              |                                                       =
       |
> +|              | **HIGH**: Turn on MCU. (default)                      =
       |
> +|              |                                                       =
       |
> +|              | **LOW**: Turn off MCU.                                =
       |
> ++--------------+-------------------------------------------------------=
=2D------+
> +
> +See :ref:`acknowledgements` for more information on this MCU.
> +
> +.. warning::
> +   The following methods are only exposed to DebugFS if the ``gpio_debu=
g``
> +   unsafe module parameter is set, as you could end up bricking the MCU=
.
> +
> +WMI method FWUpdateGPIOtoggle([in] uint32 arg2, [out] uint32 argr)
> +------------------------------------------------------------------
> +
> ++--------------------+------------------------------------+------------=
=2D-------+
> +| Operation (Byte 0) | Description                        | Arguments  =
        |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+
> +| 0x00               | Set the Device Firmware Update     | - Byte 1: P=
in      |
> +|                    | (DFU) pin status.                  |   status   =
        |
> ++--------------------+------------------------------------+------------=
=2D-------+
> +| 0x01               | Set the Negative Reset (NRST) pin  | - Byte 1: P=
in      |
> +|                    | status.                            |   status   =
        |
> ++--------------------+------------------------------------+------------=
=2D-------+

Maybe it would be better if you just explain that the operation byte selec=
ts the GPIO pin to toggle.

> +
> +WMI method ReadTotalofGPIOs([out] uint32 argr)
> +----------------------------------------------
> +
> ++--------------------+------------------------------------+------------=
=2D-------+
> +| Operation (Byte 0) | Description                        | Arguments  =
        |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+
> +| 0x00               | Get the total number of GPIOs.     | - None     =
        |
> ++--------------------+------------------------------------+------------=
=2D-------+
> +
> +WMI method ReadGPIOpPinStatus([in] uint32 arg2, [out] uint32 argr)
> +------------------------------------------------------------------
> +
> ++--------------------+------------------------------------+------------=
=2D-------+
> +| Operation (Byte 0) | Description                        | Arguments  =
        |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+
> +| 0x00               | Get the Device Firmware Update     | - None     =
        |
> +|                    | (DFU) pin status.                  |            =
        |
> ++--------------------+------------------------------------+------------=
=2D-------+
> +| 0x01               | Get the Negative Reset (NRST) pin  | - None     =
        |
> +|                    | status.                            |            =
        |
> ++--------------------+------------------------------------+------------=
=2D-------+

Same as above.

Thanks,
Armin Wolf

> +
> +.. warning::
> +   There known firmware bug in some laptops where reading the status of=
 a pin
> +   also flips it.
> +
>   Other information Methods
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  =20
> @@ -239,10 +310,16 @@ WMI method ReadChassisColor([out] uint32 argr)
>  =20
>   Returns the chassis color internal ID.
>  =20
> +.. _acknowledgements:
> +
>   Acknowledgements
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  =20
> -Kudos to `AlexIII <https://github.com/AlexIII/tcc-g15>`_ and
> -`T-Troll <https://github.com/T-Troll/alienfx-tools/>`_ for documenting =
and
> -testing some of this device's functionality, making it possible to gene=
ralize
> -this driver.
> +Kudos to
> +
> +* `AlexIII <https://github.com/AlexIII/tcc-g15>`_
> +* `T-Troll <https://github.com/T-Troll/alienfx-tools/>`_
> +* `Gabriel Marcano <https://gabriel.marcanobrady.family/blog/2024/12/16=
/dell-g5-5505-se-acpi-or-figuring-out-how-to-reset-the-rgb-controller/>`_
> +
> +for documenting and testing some of this device's functionality, making=
 it
> +possible to generalize this driver.
>
