Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DDB8F40;
	Fri, 30 May 2025 21:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748642062; cv=none; b=PiHoTNh6NRBqiSfjTad+npVYoLTWGkznnbnxEzIfeM8pVEVOoYHR0MtFVaoRGJACx5uD1tMmCeijkm4x/AXCR8cn5ElOnGzUBcz3ASRM+76/aT1KZVSoPC5JvXTF0ECXpG44GdJqii8dzJ56d7+ERom2+8J7R1m0/udsj3hnNCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748642062; c=relaxed/simple;
	bh=2hkDgdU7DziWt95wLS541CNXtbNnbm4zso6KwGhYdq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwTx71Fwqke7L3twzRCK5hvYuRPMEir0WtZkSFcxGXKpIgROUuX7twv2ZkZC8C8TUL4g1C/JbxVNzQgh2x+tOyTcqG43RkU7hIZhppCJi6G3sbbrCxWVkX5q+p8EzZXBZZ8ngSNmIrXqZBoF6Xt4mvzba8gjjSuYlwBhcNbFTLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fXkH5z9v; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fXkH5z9v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1748642052; x=1749246852; i=w_armin@gmx.de;
	bh=V8337gWTuyWBcLLS7kqnP89lWjixb0VUekUL970IJ2U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fXkH5z9v5cg7xBIsdRpEmzHSY43s9NJpRVSdAfHwOF4DlHileeNuMBYxJ4nYLaco
	 VTb6yBGDghT1cYri7xAcUEPpHIoyRWVOwzr0nZfaJoqy/ucX2wK/RiLkunJTOS12f
	 q6o4x0lWFHV6lNkQA9oqng3NveXPzefDiNMV0y6yAXBdfc/hrA++5TUgUjDnFDoNJ
	 F2goBLNW/wrtqBk3YssN8/CKAOnsFYgWVyVfObtQzG3cEdXsGlBCkjfP3nkDcXFnp
	 eSjN7PoJitYHv+K22HnLexJZHwoimgrhy33sNI4uced99lQZ3TDu1M7OAIvUznl5s
	 QMQSv5Dhhr5laaHdHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlTC-1umBIw0VsM-00qfPR; Fri, 30
 May 2025 23:54:12 +0200
Message-ID: <6d9c9069-b672-4e06-917a-a1928d9fd993@gmx.de>
Date: Fri, 30 May 2025 23:54:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: alienware-wmi-wmax: Add appropriate labels
 to fans
To: Kurt Borja <kuurtb@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250528-awcc-labels-v1-1-6aa39d8e4c3d@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250528-awcc-labels-v1-1-6aa39d8e4c3d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vER6s/wPur1uQLVoGdd2giWvdw+zVMrYBw/JiIB1NF8qc2DTxwB
 aqGQagdbUOgjfiAXlHAps21eDw2Hk/ZaDbsiznkqKlmi9gcOYRwPdAkYg/mABxLBHrXApZn
 fomMeOUFfMDVxJQw+4Ekmr/oDxVv/ZSSwlqA352s0X9jAssf/K9ykkGNm9PNHc886n2hbwK
 bI9W+f/alqiD9x7hgS5CQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uCACgn1TsJ4=;fNAkZxFGq9VMwTsIINpXX8G5jYT
 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

Am 28.05.25 um 12:47 schrieb Kurt Borja:

> Add known fan type IDs and match them to an appropriate label in
> awcc_hwmon_read_string().
>
> Additionally, add the AWCC_TEMP_SENSOR_FRONT type, which was inferred
> from it's related fan type in supported systems.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi-wmax.c | 100 ++++++++++++++++-=
=2D-------
>   1 file changed, 63 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pl=
atform/x86/dell/alienware-wmi-wmax.c
> index c42f9228b0b255fe962b735ac96486824e83945f..b25eb3225d8e5385384880a9=
cb480aaf3cb4d0a8 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -273,9 +273,29 @@ enum AWCC_SPECIAL_THERMAL_CODES {
>  =20
>   enum AWCC_TEMP_SENSOR_TYPES {
>   	AWCC_TEMP_SENSOR_CPU			=3D 0x01,
> +	AWCC_TEMP_SENSOR_FRONT			=3D 0x03,
>   	AWCC_TEMP_SENSOR_GPU			=3D 0x06,
>   };
>  =20
> +enum AWCC_FAN_TYPES {
> +	AWCC_FAN_CPU_1				=3D 0x32,
> +	AWCC_FAN_GPU_1				=3D 0x33,
> +	AWCC_FAN_PCI				=3D 0x34,
> +	AWCC_FAN_MID				=3D 0x35,
> +	AWCC_FAN_TOP_1				=3D 0x36,
> +	AWCC_FAN_SIDE				=3D 0x37,
> +	AWCC_FAN_U2_1				=3D 0x38,
> +	AWCC_FAN_U2_2				=3D 0x39,
> +	AWCC_FAN_FRONT_1			=3D 0x3A,
> +	AWCC_FAN_CPU_2				=3D 0x3B,
> +	AWCC_FAN_GPU_2				=3D 0x3C,
> +	AWCC_FAN_TOP_2				=3D 0x3D,
> +	AWCC_FAN_TOP_3				=3D 0x3E,
> +	AWCC_FAN_FRONT_2			=3D 0x3F,
> +	AWCC_FAN_BOTTOM_1			=3D 0x40,
> +	AWCC_FAN_BOTTOM_2			=3D 0x41,
> +};
> +
>   enum awcc_thermal_profile {
>   	AWCC_PROFILE_USTT_BALANCED,
>   	AWCC_PROFILE_USTT_BALANCED_PERFORMANCE,
> @@ -314,7 +334,6 @@ struct wmax_u32_args {
>  =20
>   struct awcc_fan_data {
>   	unsigned long auto_channels_temp;
> -	const char *label;
>   	u32 min_rpm;
>   	u32 max_rpm;
>   	u8 suspend_cache;
> @@ -896,6 +915,9 @@ static int awcc_hwmon_read_string(struct device *dev=
, enum hwmon_sensor_types ty
>   		case AWCC_TEMP_SENSOR_CPU:
>   			*str =3D "CPU";
>   			break;
> +		case AWCC_TEMP_SENSOR_FRONT:
> +			*str =3D "Front";
> +			break;
>   		case AWCC_TEMP_SENSOR_GPU:
>   			*str =3D "GPU";
>   			break;
> @@ -906,7 +928,46 @@ static int awcc_hwmon_read_string(struct device *de=
v, enum hwmon_sensor_types ty
>  =20
>   		break;
>   	case hwmon_fan:
> -		*str =3D priv->fan_data[channel]->label;
> +		switch (priv->fan_data[channel]->id) {
> +		case AWCC_FAN_CPU_1:
> +		case AWCC_FAN_CPU_2:
> +			*str =3D "CPU Fan";
> +			break;
> +		case AWCC_FAN_GPU_1:
> +		case AWCC_FAN_GPU_2:
> +			*str =3D "GPU Fan";
> +			break;
> +		case AWCC_FAN_PCI:
> +			*str =3D "PCI Fan";
> +			break;
> +		case AWCC_FAN_MID:
> +			*str =3D "Mid Fan";
> +			break;
> +		case AWCC_FAN_TOP_1:
> +		case AWCC_FAN_TOP_2:
> +		case AWCC_FAN_TOP_3:
> +			*str =3D "Top Fan";
> +			break;
> +		case AWCC_FAN_SIDE:
> +			*str =3D "Side Fan";
> +			break;
> +		case AWCC_FAN_U2_1:
> +		case AWCC_FAN_U2_2:
> +			*str =3D "U.2 Fan";
> +			break;
> +		case AWCC_FAN_FRONT_1:
> +		case AWCC_FAN_FRONT_2:
> +			*str =3D "Front Fan";
> +			break;
> +		case AWCC_FAN_BOTTOM_1:
> +		case AWCC_FAN_BOTTOM_2:
> +			*str =3D "Bottom Fan";
> +			break;
> +		default:
> +			*str =3D "Unknown Fan";
> +			break;
> +		}
> +
>   		break;
>   	default:
>   		return -EOPNOTSUPP;
> @@ -1051,40 +1112,6 @@ static int awcc_hwmon_temps_init(struct wmi_devic=
e *wdev)
>   	return 0;
>   }
>  =20
> -static char *awcc_get_fan_label(unsigned long *fan_temps)
> -{
> -	unsigned int temp_count =3D bitmap_weight(fan_temps, AWCC_ID_BITMAP_SI=
ZE);
> -	char *label;
> -	u8 temp_id;
> -
> -	switch (temp_count) {
> -	case 0:
> -		label =3D "Independent Fan";
> -		break;
> -	case 1:
> -		temp_id =3D find_first_bit(fan_temps, AWCC_ID_BITMAP_SIZE);
> -
> -		switch (temp_id) {
> -		case AWCC_TEMP_SENSOR_CPU:
> -			label =3D "Processor Fan";
> -			break;
> -		case AWCC_TEMP_SENSOR_GPU:
> -			label =3D "Video Fan";
> -			break;
> -		default:
> -			label =3D "Unknown Fan";
> -			break;
> -		}
> -
> -		break;
> -	default:
> -		label =3D "Shared Fan";
> -		break;
> -	}
> -
> -	return label;
> -}
> -
>   static int awcc_hwmon_fans_init(struct wmi_device *wdev)
>   {
>   	struct awcc_priv *priv =3D dev_get_drvdata(&wdev->dev);
> @@ -1138,7 +1165,6 @@ static int awcc_hwmon_fans_init(struct wmi_device =
*wdev)
>   		fan_data->id =3D id;
>   		fan_data->min_rpm =3D min_rpm;
>   		fan_data->max_rpm =3D max_rpm;
> -		fan_data->label =3D awcc_get_fan_label(fan_temps);
>   		bitmap_gather(gather, fan_temps, priv->temp_sensors, AWCC_ID_BITMAP_=
SIZE);
>   		bitmap_copy(&fan_data->auto_channels_temp, gather, BITS_PER_LONG);
>   		priv->fan_data[i] =3D fan_data;
>
> ---
> base-commit: 9c96808f10d84156b5e98e16176b725ec5a1386f
> change-id: 20250528-awcc-labels-372162572ad7
