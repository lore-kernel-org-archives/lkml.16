Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CED0BA50;
	Fri,  2 May 2025 01:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746149572; cv=none; b=gTZp/0+Xk98cPFI34V/gLb+fwGsAMzfvAt1HwYmFeHpyriO0EfaMrPHw2aaarPoc4lkFaGPE8YZAUb2xSGyT2/FFYKqj7PUrzjjsjx+oq1+pajlmwoY+pSwQ+M1z+QyVocuIIwBh+YQwBrbLDh8vqMmLSM5rixHd3U9wqhkCRHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746149572; c=relaxed/simple;
	bh=mc34lPAN3zUNn0Sak394IwbAJAZ57LWa4Yg5Ac4DzcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7jH3Yj9BIu+Bq/p5s9YbkNzRz0mkD/VSPVVRSStiJh6qt43JxEohu9/nXEdun0CUdYZhqYEtQfA68NI9y0zTsFmETc9ddL41k6Jjy1n1Ig2eWgmgWe9s3FUOEFdtixzxJhyMotjoLGa5dOqKrxWR/7Eeic7zWQ50V4BUA/uFPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=d3IwUnfc; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="d3IwUnfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746149567; x=1746754367; i=w_armin@gmx.de;
	bh=XkPgCkRr1484DbkQ7ByYdhmbf8+9nEO4Ey1DCW+uUwE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=d3IwUnfcqrQWZiBZUFNW10zX1grtTYpF959X3g77gebyGEz0TVEyXbJyF3DsEzmN
	 iV6p6PyzNrW+SGpGH+hkNTwoerUF3BrA4CoFIwUAiEn9aZ6LxGUWI9FIaFHE9dRKS
	 39ppzsW0jwyEH/KWBuKQjV/4yPXSSEu4d8lzeUrTyiCa1GotQu/XYjzO3NWnZn0yX
	 dRkq64S6x5UNi2ADFYahfLO2tOLXiqrsZe3e/YxXZAKtczg/qSBSfHAxj0LXlgCaT
	 /viMD6RDpH2A5oHzAUNri67pQIh5xvPjARa30JrJUEzqeVXxNX+q4MHaTlmyWkSUP
	 v/OWwJPzh+BEb6spfg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUjC-1v2Dev0d0c-00zpLt; Fri, 02
 May 2025 03:32:47 +0200
Message-ID: <dee4fd21-d9b4-450a-97ee-211559df516b@gmx.de>
Date: Fri, 2 May 2025 03:32:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Documentation: wmi: alienware-wmi: Add GPIO
 control documentation
To: kuurtb@gmail.com, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>,
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250427-awcc-gpio-v2-0-c731373b5d02@gmail.com>
 <20250427-awcc-gpio-v2-2-c731373b5d02@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250427-awcc-gpio-v2-2-c731373b5d02@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UqohOsoc/8RE/r1UEkRluoToR1cB6fMbZUlTAa5phAMDYkwySOm
 DVrN+VLQgA7+IdYpYlR1iWqOeLey2frGu4S5/NAeoieuKlMjEnDLZ69eeSwKXGySoRB5ayc
 PEj1Dun1p3e7IT1UOfmFHWRQWU1kqvF4PSoqWfXed78bA6ztiIsgPn/6J3c0aeRbGzyhnZ8
 gFbUPC/v5Bd2RbJvt6T+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VBCIdcFDVFM=;WAILSXy36iznzawRsVEtzuzFyiL
 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

Am 27.04.25 um 08:24 schrieb Kurt Borja via B4 Relay:

> From: Kurt Borja <kuurtb@gmail.com>
>
> Add documentation for the GPIO control methods.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   Documentation/wmi/devices/alienware-wmi.rst | 78 +++++++++++++++++++++=
++++++--
>   1 file changed, 74 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/wmi/devices/alienware-wmi.rst b/Documentation=
/wmi/devices/alienware-wmi.rst
> index 79238051b18bc5de9b502325017cd5c5fcf41748..2a6052efb9ae0e3fe0a5d9d5=
775073234dfc96fb 100644
> --- a/Documentation/wmi/devices/alienware-wmi.rst
> +++ b/Documentation/wmi/devices/alienware-wmi.rst
> @@ -231,6 +231,70 @@ WMI method MemoryOCControl([in] uint32 arg2, [out] =
uint32 argr)
>   AWCC supports memory overclocking, but this method is very intricate a=
nd has
>   not been deciphered yet.
>  =20
> +GPIO control Methods
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Alienware and Dell G Series devices with the AWCC interface usually hav=
e an
> +embedded STM32 RGB lighting controller with USB/HID capabilities. It's =
vendor ID
> +is ``187c`` while it's product ID may vary from model to model.
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
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> +| 0            | Device Firmware Update (DFU)  | **HIGH**: Enables DFU =
mode   |
> +|              | mode pin.                     | on next MCU boot.     =
       |
> +|              |                               +-----------------------=
=2D------+
> +|              |                               | **LOW**: Disables DFU =
mode   |
> +|              |                               | on next MCU boot.     =
       |
> ++--------------+-------------------------------+-----------------------=
=2D------+
> +| 1            | Negative Reset (NRST) pin.    | **HIGH**: MCU is ON.  =
       |
> +|              |                               |                       =
       |
> +|              |                               +-----------------------=
=2D------+
> +|              |                               | **LOW**: MCU is OFF.  =
       |
> +|              |                               |                       =
       |
> ++--------------+-------------------------------+-----------------------=
=2D------+
> +
> +See :ref:`acknowledgements` for more information on this MCU.
> +
> +.. note::
> +   Some GPIO control methods break the usual argument structure and tak=
e a
> +   **Pin number** instead of an operation on the first byte.
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
> +| Pin number         | Set the pin status                 | - Byte 1: P=
in      |
> +|                    |                                    |   status   =
        |
> ++--------------------+------------------------------------+------------=
=2D-------+
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
> +| 0x00               | Get the total number of GPIOs      | - None     =
        |
> ++--------------------+------------------------------------+------------=
=2D-------+

Maybe you should write that the "Operation" byte is theoretically not nece=
ssary for this WMI method,
but that we still have to provide a dummy value or else the firmware will =
encounter an error.

Take a look at the documentation for the msi-wmi-platform driver for detai=
ls (grep for "CreateByteField()").

Other than that:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

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
> +| Pin number         | Get the pin status                 | - None     =
        |
> ++--------------------+------------------------------------+------------=
=2D-------+
> +
> +.. note::
> +   There known firmware bug in some laptops where reading the status of=
 a pin
> +   also flips it.
> +
>   Other information Methods
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  =20
> @@ -239,10 +303,16 @@ WMI method ReadChassisColor([out] uint32 argr)
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
