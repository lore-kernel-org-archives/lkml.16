Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14401C1F02;
	Fri, 28 Mar 2025 21:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743196607; cv=none; b=NnYEH7KUnqiGW0yJcSGfousw7zXsKeW1KDGyDZBuGtMWA/+RLojpdquBmGlr48bmsU9gHhQTQDtWY/DIVs6zPuQ6+vUXvyLitOGgkwVfwlqnBOwLbgUPoAxmKE4qrz5dxCudbZBPfeyTvXsTo7x4cPNRgPSZcOy73ElvVck7Wcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743196607; c=relaxed/simple;
	bh=Cq75cGWaNXGgJPlvDR2m7QPBSOCXA3dE6y5mQk9wX50=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=d+h4pyYzuPipf6ThuWUuT1oKT3Z01wITbEnezk6ymIYY2hRkvQaJmeA0BSpmQ3CcH3m5SX+sY3cElrjKsSm1GDAqzYK3L1Ij1ZLV2CGO8BKr3sCPud5mE+FoOG1QOYT3kOeEXc2llS+UufV5eZm2Zjg/XKsLz8Z988Q2Yy809VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hgiu7PIb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hgiu7PIb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224341bbc1dso52624305ad.3;
        Fri, 28 Mar 2025 14:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743196605; x=1743801405; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQdvqWnU1/MoyOl7aQRdpiuixcuM6V34/ep3gwrpUas=;
        b=Hgiu7PIby6xvuivTy+raej+y7SlOn6+kcmy3LgvQZfO6D/piEEdSC5mtLQYfFA7TV3
         hVQbX01/UhX49HPeSXVcOVN9v7GCpjvqdhPrQsYQUjAkJ9rpAH4GOQ7Izd4TOjaRY6bj
         J1JStXPEaa3oxx5j8SzqBOju+vmRm1ri6dPqsFnW2PBGMaxCTyi5kmcbyLw8p+8ydqNQ
         3akgEFBtWTy2wJncDz1rXgBJ64QdmPBIU9PxIwyjMu0ZancMo4CzYpbiULZ4vEitg+2B
         NVecoPveGHznTY6gYQQM/PlMGwX4r5oUXXPSnGEKxnICZCNJcMNtroVceWe6ji0ux0YQ
         6krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743196605; x=1743801405;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PQdvqWnU1/MoyOl7aQRdpiuixcuM6V34/ep3gwrpUas=;
        b=hs5/sLi/Y9JIC5WW4xqZJLwLAabBq8tpCpUN1DozQxRTj5+GXL4gu1RZYzt0ssK8EU
         bvg60WzoSoYZT54/boOSsN3hLhbwO6XJdQI4j+10sO6SZgyttWC8PvV/Tx9TfbQ3HZhN
         JOBBFSyaau8GU16rXZc+hwNhq/2WhqNI/GqDqUrqhKuWtJqeN9eqLGg2wFUObCwn2ONz
         Qh+D/KHKLEcD4cq9QuIvUXft6Zv/C+USPuH6t/CqV+gOAvIlAbXCnvAD/hrr9waEzRqT
         8AtzDiHDiSWvawDa+Ev3jepKpOtUj8klaKJ1tOk0iqK+ZYagrATLriy9dXplRT0cpr8z
         8wCA==
X-Forwarded-Encrypted: i=1; AJvYcCWISYDgiybW20ADy2K7jadYNvpl1z6Od9khimofMPmZZeJZ+yLNkUhHryBOPQ1+zaJFaa1i68n5+c1BzD6aT0laCjrxog==@vger.kernel.org, AJvYcCWJeD8JKzJxTT/oazDEtA2xGr66j5gl1HUhJuLQhktdK72luCkGU3Pi9CKaxK5HNcrJKZidzVYXBDKZTys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Alm7nZadnpaofAoy6R59AGfsP+Q8ITyqSn9ViL3Ap+YzBdbI
	xjWFsLGHXT/IcUn9c8jg4ccNKE53U4y76wL6M5pvMYjv1L9jyNTV
X-Gm-Gg: ASbGncvnLAAio/CHzrI7+/mgO9JOzx3WlfXimyk22XKURKiS0B7txZv+7P7ELnNJfXx
	i7kaWHsZaTdZFYQLf55iPSWYK50wlcSUhf7/NZxSxo2+d9Z4z6Ke36OPlBrJYP7dqwPxzArZWCB
	W8//62vtMkzP6foKzK2MaDrdAyzDLaXOKFtIS4YJxAvag1W8Lt0sr0pac5aLgQomGagkQxA7qEV
	T6WssfBNIO4AAAxn6VOcSJGUl0iCwj8q45MT12jr4zbDJ0a5Ctz6/hsShFfAQSES5mt3ezwAwf/
	6lqlAQmOpW2/70Ojmq/MwNHu53RsfzvRPMGXKw==
X-Google-Smtp-Source: AGHT+IEgjthqdq03xySw0fw1gDiZrOK53FoxCuE0evUJbZW8d31nnltpw9rglMXXdHBvIAX76wb3yQ==
X-Received: by 2002:a17:902:748b:b0:224:2524:3047 with SMTP id d9443c01a7336-2292f97578dmr8231515ad.26.1743196604426;
        Fri, 28 Mar 2025 14:16:44 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba0e4f0sm2104479a12.72.2025.03.28.14.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 14:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Mar 2025 18:16:41 -0300
Message-Id: <D8S7MF97YEGI.21PR2NBB42QRS@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hdegoede@redhat.com>,
 <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 03/12] platform/x86: alienware-wmi-wmax: Improve
 internal AWCC API
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com>
 <20250313-hwm-v6-3-17b57f787d77@gmail.com>
 <45699e14-6d51-8116-b252-a7a20ffe8e8b@linux.intel.com>
In-Reply-To: <45699e14-6d51-8116-b252-a7a20ffe8e8b@linux.intel.com>

On Fri Mar 28, 2025 at 11:51 AM -03, Ilpo J=C3=A4rvinen wrote:
> On Thu, 13 Mar 2025, Kurt Borja wrote:
>
>> Inline all AWCC WMI helper methods and directly return the newly
>> introduced __awcc_wmi_command() helper to simplify implementation.
>>=20
>> Drop awcc_thermal_control() in favor of awcc_op_activate_profile().
>>=20
>> Add awcc_op_get_resource_id(), awcc_op_get_current_profile() and a new
>> failure code.
>>=20
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 150 +++++++++++++++---=
-------
>>  1 file changed, 91 insertions(+), 59 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pl=
atform/x86/dell/alienware-wmi-wmax.c
>> index 80aefba5b22d6b4ac18aeb2ca356f8c911150abd..b9dbfdc8096c571722b3c7ac=
3e73989e235e2eb9 100644
>> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> @@ -32,6 +32,7 @@
>>  #define AWCC_THERMAL_MODE_GMODE			0xAB
>> =20
>>  #define AWCC_FAILURE_CODE			0xFFFFFFFF
>> +#define AWCC_FAILURE_CODE_2			0xFFFFFFFE
>>  #define AWCC_THERMAL_TABLE_MASK			GENMASK(7, 4)
>>  #define AWCC_THERMAL_MODE_MASK			GENMASK(3, 0)
>>  /* Some IDs have a BIT(8) flag that we ignore */
>> @@ -443,8 +444,7 @@ const struct attribute_group wmax_deepsleep_attribut=
e_group =3D {
>>  };
>> =20
>>  /*
>> - * Thermal Profile control
>> - *  - Provides thermal profile control through the Platform Profile API
>> + * AWCC Helpers
>>   */
>>  static bool is_awcc_thermal_profile_id(u8 code)
>>  {
>> @@ -463,72 +463,107 @@ static bool is_awcc_thermal_profile_id(u8 code)
>>  	return false;
>>  }
>> =20
>> -static int awcc_thermal_information(struct wmi_device *wdev, u8 operati=
on,
>> -				    u8 arg, u32 *out_data)
>> +static int __awcc_wmi_command(struct wmi_device *wdev, u32 method_id,
>> +			      struct wmax_u32_args *args, u32 *out)
>
> Why did you put __ into the name?
>
> Some people oppose __ prefix altogether, I don't entirely agree with thei=
r=20
> stance but I don't really understand what the underscores here signify.
>
> Normally I see __ being used in three main cases:
> - non-__ variant does some locking around the call too the __ func (thoug=
h=20
>   many funcs use _locked postfix these days).
> - func is "dangerous" and caller has to really know what he/she is
>   doing / be careful for some reason.
> - non-__ variant exists and somebody cannot come up better name for the
>   internally called function (not very good use case, IMHO)

Oh - I didn't know. Andy also mentioned this prefix is used for
non-atomic versions of some functions like __set_bit().

>
> I don't see any of those apply here, this looks just an ordinary wrapper=
=20
> function, thus the question.

I did it to indicate it's a "private" method, so it's not used directly.
But ofc that's not the convention here, so I'll drop it.

>
>>  {
>> -	struct wmax_u32_args in_args =3D {
>> +	int ret;
>> +
>> +	ret =3D alienware_wmi_command(wdev, method_id, args, sizeof(*args), ou=
t);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (*out =3D=3D AWCC_FAILURE_CODE || *out =3D=3D AWCC_FAILURE_CODE_2)
>> +		return -EBADRQC;
>> +
>> +	return 0;
>> +}
>> +
>> +static inline int awcc_thermal_information(struct wmi_device *wdev, u8 =
operation,
>> +					   u8 arg, u32 *out)
>> +{
>> +	struct wmax_u32_args args =3D {
>>  		.operation =3D operation,
>>  		.arg1 =3D arg,
>>  		.arg2 =3D 0,
>>  		.arg3 =3D 0,
>>  	};
>> -	int ret;
>> =20
>> -	ret =3D alienware_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION,
>> -				    &in_args, sizeof(in_args), out_data);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	if (*out_data =3D=3D AWCC_FAILURE_CODE)
>> -		return -EBADRQC;
>> -
>> -	return 0;
>> +	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args=
, out);
>>  }
>> =20
>> -static int awcc_thermal_control(struct wmi_device *wdev, u8 profile)
>> +static inline int awcc_game_shift_status(struct wmi_device *wdev, u8 op=
eration,
>
> As a general rule, don't add inline to .c files, we leave figuring=20
> inlining out to the compiler.

Good to know, thanks!

>
>> +					 u32 *out)
>>  {
>> -	struct wmax_u32_args in_args =3D {
>> -		.operation =3D AWCC_OP_ACTIVATE_PROFILE,
>> -		.arg1 =3D profile,
>> -		.arg2 =3D 0,
>> -		.arg3 =3D 0,
>> -	};
>> -	u32 out_data;
>> -	int ret;
>> -
>> -	ret =3D alienware_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL,
>> -				    &in_args, sizeof(in_args), &out_data);
>> -	if (ret)
>> -		return ret;
>> -
>> -	if (out_data =3D=3D AWCC_FAILURE_CODE)
>> -		return -EBADRQC;
>> -
>> -	return 0;
>> -}
>> -
>> -static int awcc_game_shift_status(struct wmi_device *wdev, u8 operation=
,
>> -				  u32 *out_data)
>> -{
>> -	struct wmax_u32_args in_args =3D {
>> +	struct wmax_u32_args args =3D {
>>  		.operation =3D operation,
>>  		.arg1 =3D 0,
>>  		.arg2 =3D 0,
>>  		.arg3 =3D 0,
>>  	};
>> -	int ret;
>> =20
>> -	ret =3D alienware_wmi_command(wdev, AWCC_METHOD_GAME_SHIFT_STATUS,
>> -				    &in_args, sizeof(in_args), out_data);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	if (*out_data =3D=3D AWCC_FAILURE_CODE)
>> -		return -EOPNOTSUPP;
>> -
>> -	return 0;
>> +	return __awcc_wmi_command(wdev, AWCC_METHOD_GAME_SHIFT_STATUS, &args, =
out);
>>  }
>> =20
>> +/**
>> + * awcc_op_get_resource_id - Get the resource ID at a given index
>> + * @wdev: AWCC WMI device
>> + * @index: Index
>> + * @out: Value returned by the WMI call
>> + *
>> + * Get the resource ID at a given index. Resource IDs are listed in the
>
> Use @index to refer to the argument.

Ack

>
>> + * following order:
>> + *
>> + *	- Fan IDs
>> + *	- Sensor IDs
>> + *	- Unknown IDs
>> + *	- Thermal Profile IDs
>> + *
>> + * The total number of IDs of a given type can be obtained with
>> + * AWCC_OP_GET_SYSTEM_DESCRIPTION.
>> + *
>> + * Return: 0 on success, -errno on failure
>> + */
>> +static inline int awcc_op_get_resource_id(struct wmi_device *wdev, u8 i=
ndex, u32 *out)
>> +{
>> +	struct wmax_u32_args args =3D {
>> +		.operation =3D AWCC_OP_GET_RESOURCE_ID,
>> +		.arg1 =3D index,
>> +		.arg2 =3D 0,
>> +		.arg3 =3D 0,
>> +	};
>> +
>> +	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args=
, out);
>> +}
>> +
>> +static inline int awcc_op_get_current_profile(struct wmi_device *wdev, =
u32 *out)
>> +{
>> +	struct wmax_u32_args args =3D {
>> +		.operation =3D AWCC_OP_GET_CURRENT_PROFILE,
>> +		.arg1 =3D 0,
>> +		.arg2 =3D 0,
>> +		.arg3 =3D 0,
>> +	};
>> +
>> +	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args=
, out);
>> +}
>> +
>> +static inline int awcc_op_activate_profile(struct wmi_device *wdev, u8 =
profile)
>> +{
>> +	struct wmax_u32_args args =3D {
>> +		.operation =3D AWCC_OP_ACTIVATE_PROFILE,
>> +		.arg1 =3D profile,
>> +		.arg2 =3D 0,
>> +		.arg3 =3D 0,
>> +	};
>> +	u32 out;
>> +
>> +	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL, &args, &o=
ut);
>> +}
>> +
>> +/*
>> + * Thermal Profile control
>> + *  - Provides thermal profile control through the Platform Profile API
>> + */
>>  static int awcc_platform_profile_get(struct device *dev,
>>  				     enum platform_profile_option *profile)
>>  {
>> @@ -536,10 +571,8 @@ static int awcc_platform_profile_get(struct device =
*dev,
>>  	u32 out_data;
>>  	int ret;
>> =20
>> -	ret =3D awcc_thermal_information(priv->wdev, AWCC_OP_GET_CURRENT_PROFI=
LE,
>> -				       0, &out_data);
>> -
>> -	if (ret < 0)
>> +	ret =3D awcc_op_get_current_profile(priv->wdev, &out_data);
>> +	if (ret)
>>  		return ret;
>> =20
>>  	if (out_data =3D=3D AWCC_THERMAL_MODE_GMODE) {
>> @@ -550,7 +583,7 @@ static int awcc_platform_profile_get(struct device *=
dev,
>>  	if (!is_awcc_thermal_profile_id(out_data))
>>  		return -ENODATA;
>> =20
>> -	out_data &=3D AWCC_THERMAL_MODE_MASK;
>> +	out_data =3D FIELD_GET(AWCC_THERMAL_MODE_MASK, out_data);
>
> Should this be part of the earlier patch??

I think I'll leave it in this patch, but I'll move it to
awcc_op_get_resource_id().

--=20
 ~ Kurt

>
>>  	*profile =3D awcc_mode_to_platform_profile[out_data];
>> =20
>>  	return 0;
>> @@ -583,8 +616,8 @@ static int awcc_platform_profile_set(struct device *=
dev,
>>  		}
>>  	}
>> =20
>> -	return awcc_thermal_control(priv->wdev,
>> -				    priv->supported_thermal_profiles[profile]);
>> +	return awcc_op_activate_profile(priv->wdev,
>> +					priv->supported_thermal_profiles[profile]);
>>  }
>> =20
>>  static int awcc_platform_profile_probe(void *drvdata, unsigned long *ch=
oices)
>> @@ -606,8 +639,7 @@ static int awcc_platform_profile_probe(void *drvdata=
, unsigned long *choices)
>>  	first_mode =3D sys_desc[0] + sys_desc[1];
>> =20
>>  	for (u32 i =3D 0; i < sys_desc[3]; i++) {
>> -		ret =3D awcc_thermal_information(priv->wdev, AWCC_OP_GET_RESOURCE_ID,
>> -					       i + first_mode, &out_data);
>> +		ret =3D awcc_op_get_resource_id(priv->wdev, i + first_mode, &out_data=
);
>> =20
>>  		if (ret =3D=3D -EIO)
>>  			return ret;
>>=20
>>=20

