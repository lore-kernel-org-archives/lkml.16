Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FAB1C1F02;
	Fri, 28 Mar 2025 21:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743196685; cv=none; b=VNCijyucPMJC/iMzqDZELKIjCiFub4TxALKqmqn3TtAN1sL1fK8iAynEUYbBH3F78ku0XE/vxzDIIKLORafvthw2UDe4l0p6w8fQG+S5nUNs7mo9bBVGEF2GOztRHW2tA/sTwEtDABrt3ca1Qj2uX5CcsKnpB5LnTyuLl8iKXQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743196685; c=relaxed/simple;
	bh=PnHk3qnIsGxZdLU0f/FFdBIybXSgGCc/pHE0Xe+HrLU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LFG1GLNMiGmXlkMn7t+YRDuJccoFBhwJHs3mvzmdzy1uNwMagHneoIS5hSxFxvarw4CLub9x5/pWK35uy52z8lmCY/BIjRMGXKUZ+5WZl+JVh0cTm3VJgkrQAxXbFJdRMuqXJCRgbEbFyIttREoLum0bmIXDGQPi5DS06dwAPKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dr4Wk+Wf; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dr4Wk+Wf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22401f4d35aso57357225ad.2;
        Fri, 28 Mar 2025 14:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743196683; x=1743801483; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kM5ItMiDJhwjXcAQqzQBmgiFHmTYmlCDgPXTp4wGvho=;
        b=dr4Wk+WfEZkGa35bCxIN725EOFgB2T2SuEDC8qET1mqGnhIR7h+scMEgF25o6CCnHp
         +hXKsqfss1+KZQJQjg3GSxCmcPVKRGl4Jaq+6s1Nwty3NMkrnYHaW70gnyhLmlA2ILxi
         8LORVEZEJIwNpobxup71XWpReX/1t3/uHusmR8SQB3WYCiQRaJhra3GaA+HZ5prooqVf
         39SBd49wOKBoAZ5PopIUgoSaJpKyqqEyEC6HPJJrzEhmSmhzRbKAL03YKm7ztvQeDaWD
         vqTSCtvQDox7b0lCTOMjP+EPx4YnVja8ezv6w+tIwWJZ0n7jPTrOj1sArjw9aTrk41T8
         vUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743196683; x=1743801483;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kM5ItMiDJhwjXcAQqzQBmgiFHmTYmlCDgPXTp4wGvho=;
        b=J3HUdr+nBZLdLBcn5NP/9PMbGLZd20v/XIJrC3AqBBm8FIwCTe77o2Nv9LumRfRi+v
         8q4wzywO2cUqBfVEi1n+r8GMFHJpQcF+5lTCny1T7E2H6eJab15GVQTHewa9isRz0o1u
         jmTUQ9QvOW5UkYIuGMnaBPJUsYKCaM2m+qZmpgbZCOoVvAilrbIwha0IwmL4pusCW54U
         0CpIFQ6WVJf7BRRHj127HrcQC30vKHm8W0MWF2aKqVZ2s3VahdepXu3uc8/KWyLx+NMW
         vRQHhibCO5/RNgrSIsuBUCCV8KRrGdtCkhMKJ2i7NSpsAFpBYD6fS0KT14brPhMy3f3s
         9XEw==
X-Forwarded-Encrypted: i=1; AJvYcCUGlccY9PJOA6Z9q4/wlNubXEK/f1x0NAUMUgZnDgZ35/h/Bfl3MhpfY6gehXkYlS8kinOf5YqouN9+HPN8CUnkbkuBKA==@vger.kernel.org, AJvYcCXCCxDjCAEDoyRhQL6x0RoZ1dx0js3+o9LHUwFSeegZp1wjSTgqjPLSfCL0M6uoUadzGPD0AEbgtayh1Fo=@vger.kernel.org
X-Gm-Message-State: AOJu0YweCCJu1aj+dPrAJfeMzRWeT3TVO49U0TOQRpEuJnDs4rdZO8U1
	4SxYz/+5nPfidvr3oP2dOnJvWWQKq7J7HorNPOqOCN3MTaSGjaO7
X-Gm-Gg: ASbGnctIJGiEHoCt3QbajzlvS2nQgmkwvjXTNCaqQhSC92JZlfLsuvaZmDLtLCktNZi
	fs/XcMkfNkT6ifLi5iUdMf72ZrNCaud5B4peegwG4BrkqLXFVyN4XNCjgy6RQXJA0fTSd3a4jkP
	GA90tVIBCKz5Wizmpt/VUobP68Lgb7Qh25+81FvomhPQwvkgqRpWa7Uve3MZxuGt3PyGQcbLPYB
	8FrpG3nJHUyiDZ7UhE/iRjxsYzMANLS8ckxY6PjNll3dhZ6J4nlSgDOqFM3BgRNjJ75Q4QhSMen
	rE7s9e99h/7+Hz24FL34iOwMrH/OrOIKDAX59qpZKsd1CAEy
X-Google-Smtp-Source: AGHT+IHM+HeMgCSU02DyxiSncFw5S/9c1F4DuxKpXuYdadeNxV/kUiJzx9aOWA64eyclVOcQGRmSHA==
X-Received: by 2002:a05:6a00:1a89:b0:739:4a93:a5df with SMTP id d2e1a72fcca58-739803ac1f9mr1051268b3a.12.1743196682720;
        Fri, 28 Mar 2025 14:18:02 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397109d361sm2338536b3a.138.2025.03.28.14.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 14:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Mar 2025 18:18:00 -0300
Message-Id: <D8S7NFGKJZ9P.3IYBM4PUKHTOF@gmail.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hdegoede@redhat.com>,
 <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 05/12] platform/x86: alienware-wmi-wmax: Improve
 platform profile probe
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com>
 <20250313-hwm-v6-5-17b57f787d77@gmail.com>
 <a9a21cb9-a0aa-4450-4573-51fbc674c9cc@linux.intel.com>
In-Reply-To: <a9a21cb9-a0aa-4450-4573-51fbc674c9cc@linux.intel.com>

On Fri Mar 28, 2025 at 12:03 PM -03, Ilpo J=C3=A4rvinen wrote:
> On Thu, 13 Mar 2025, Kurt Borja wrote:
>
>> Get and store the AWCC system description in alienware_awcc_setup()
>> instead of awcc_platform_profile_probe() and add a check for integer
>> overflows to avoid misbehaviors.
>>=20
>> While at it, replace set_bit() with it's non-atomic version __set_bit()
>> because `choices` belong to this thread only.
>>=20
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 61 +++++++++++++++++++=
-------
>>  1 file changed, 46 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pl=
atform/x86/dell/alienware-wmi-wmax.c
>> index a8a13779793abbcc8d1263474cac6227d524a6f5..0530f25b956f73f47c0354f4=
0dac2910448c894e 100644
>> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> @@ -38,6 +38,9 @@
>>  /* Some IDs have a BIT(8) flag that we ignore */
>>  #define AWCC_RESOURCE_ID_MASK			GENMASK(7, 0)
>> =20
>> +/* Arbitrary limit based on supported models */
>> +#define AWCC_MAX_RES_COUNT			16
>> +
>>  static bool force_platform_profile;
>>  module_param_unsafe(force_platform_profile, bool, 0);
>>  MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal=
 profiles without checking if WMI thermal backend is available");
>> @@ -212,6 +215,17 @@ struct wmax_u32_args {
>> =20
>>  struct awcc_priv {
>>  	struct wmi_device *wdev;
>> +	union {
>> +		u32 system_description;
>> +		struct {
>> +			u8 fan_count;
>> +			u8 temp_count;
>> +			u8 unknown_count;
>> +			u8 profile_count;
>> +		};
>> +		u8 res_count[4];
>> +	};
>> +
>>  	struct device *ppdev;
>>  	u8 supported_profiles[PLATFORM_PROFILE_LAST];
>>  };
>> @@ -624,37 +638,40 @@ static int awcc_platform_profile_probe(void *drvda=
ta, unsigned long *choices)
>>  	enum platform_profile_option profile;
>>  	struct awcc_priv *priv =3D drvdata;
>>  	enum awcc_thermal_profile mode;
>> -	u8 sys_desc[4];
>> -	u32 first_mode;
>> +	u8 id, offset =3D 0;
>>  	u32 out_data;
>>  	int ret;
>> -	u8 id;
>> =20
>> -	ret =3D awcc_thermal_information(priv->wdev, AWCC_OP_GET_SYSTEM_DESCRI=
PTION,
>> -				       0, (u32 *) &sys_desc);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	first_mode =3D sys_desc[0] + sys_desc[1];
>> -
>> -	for (u32 i =3D 0; i < sys_desc[3]; i++) {
>> -		ret =3D awcc_op_get_resource_id(priv->wdev, i + first_mode, &out_data=
);
>> +	/*
>> +	 * Thermal profile IDs are listed last at offset
>> +	 *	fan_count + temp_count + unknown_count
>> +	 */
>> +	for (unsigned int i =3D 0; i < ARRAY_SIZE(priv->res_count) - 1; i++)
>> +		offset +=3D priv->res_count[i];
>
> Doesn't this change go slightly beyond what its changelog describes, coul=
d=20
> you please amend the changelog to explain it.

Sure! Only difference would be that now we also sum the unknown_ids.
I'll mention it.

>> =20
>> +	for (unsigned int i =3D 0; i < priv->profile_count; i++) {
>> +		ret =3D awcc_op_get_resource_id(priv->wdev, i + offset, &out_data);
>>  		if (ret =3D=3D -EIO)
>>  			return ret;
>> =20
>> +		/*
>> +		 * Some devices report an incorrect number of thermal profiles
>> +		 * so the resource ID list may end prematurely
>> +		 */
>>  		if (ret =3D=3D -EBADRQC)
>>  			break;
>> =20
>>  		id =3D FIELD_GET(AWCC_RESOURCE_ID_MASK, out_data);
>> -		if (!is_awcc_thermal_profile_id(id))
>> +		if (!is_awcc_thermal_profile_id(id)) {
>> +			dev_dbg(&priv->wdev->dev, "Unmapped thermal profile ID 0x%02x\n", id=
);
>>  			continue;
>> +		}
>> =20
>>  		mode =3D FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
>>  		profile =3D awcc_mode_to_platform_profile[mode];
>>  		priv->supported_profiles[profile] =3D id;
>> =20
>> -		set_bit(profile, choices);
>> +		__set_bit(profile, choices);
>>  	}
>> =20
>>  	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
>> @@ -664,7 +681,7 @@ static int awcc_platform_profile_probe(void *drvdata=
, unsigned long *choices)
>>  		priv->supported_profiles[PLATFORM_PROFILE_PERFORMANCE] =3D
>>  			AWCC_THERMAL_MODE_GMODE;
>> =20
>> -		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>> +		__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>>  	}
>> =20
>>  	return 0;
>> @@ -695,6 +712,20 @@ static int alienware_awcc_setup(struct wmi_device *=
wdev)
>>  	if (!priv)
>>  		return -ENOMEM;
>> =20
>> +	ret =3D awcc_thermal_information(wdev, AWCC_OP_GET_SYSTEM_DESCRIPTION,
>> +				       0, &priv->system_description);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* Sanity check */
>> +	for (unsigned int i =3D 0; i < ARRAY_SIZE(priv->res_count); i++) {
>> +		if (priv->res_count[i] > AWCC_MAX_RES_COUNT) {
>> +			dev_err(&wdev->dev, "Malformed system description: 0x%08x\n",
>> +				priv->system_description);
>> +			return -ENXIO;
>> +		}
>> +	}
>> +
>>  	priv->wdev =3D wdev;
>>  	dev_set_drvdata(&wdev->dev, priv);
>> =20
>>=20
>>=20

