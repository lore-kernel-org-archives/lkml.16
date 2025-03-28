Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0A314D70E;
	Fri, 28 Mar 2025 21:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743196244; cv=none; b=fzFbqWHFoKiUAjHUwqxv36HjQM3wRR/HoccFQVb2eXV2xolsDgZ0dRjCgDLE9lN2uKBSQUWHID0F3darNrsKBHl9sZgoGoEQzdnoW7RkUI1qXVFTIuAMViE9yjiQPppUNWOowVZdFBHZ3P+TY13szyuPn1uGXeY3Ev+iWz8R/S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743196244; c=relaxed/simple;
	bh=/ibwAnYUQ4lPbNyTOX1GSLSiMDUHzVgDMTvzd1ydY8g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=c3F0ZC/iYzic8kiCmZoewnT5yKlAezZwDoDsTX7GUCU8IE+5zvMkzfJqX/UU34CD0pxthqra1M7+Zo6JCSVNVDeF558tIWpDoDojeTC57KeCxcIolM9gJ+0ot551izbIzAz7HoGdaJjdekTdyVwP+jWy/GaCm+euJHee1wAFznA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8deutnq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8deutnq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22435603572so54058695ad.1;
        Fri, 28 Mar 2025 14:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743196242; x=1743801042; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfLYlVON29j1ltLuYPXQpIO/gVdYegJiNrWhGqgsDnY=;
        b=e8deutnq81wzBXL/H03M/uYbtp3xO3xKBpU6wWT3cTia8LklzM7P9byVtvsTFVC/97
         9/IA3VqW1kYQevhpD5HveBt6EkHWBcYQ9mzk9TUA12UnpjOXNGrmY7P8u6Gcx9aIxQox
         Kk+Tonv3mY1vkVCowkqAVTZYVxGciNFl6u6LNfZc5DsHsH/pnU6FOpNf0shZnc2cBui0
         BV8PA2goWwh4ByveZTOYXQ6W6yOO6GxIxlnlNvDlKWoPDC0zqR7/iGlctE7KRl41/g2c
         QK0kg9VBNGhyaDWWijeqw43j8ND7friAFBTMyPrp5DqVckJu6v6NVpLRq8h0/MXK4PF6
         RmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743196242; x=1743801042;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cfLYlVON29j1ltLuYPXQpIO/gVdYegJiNrWhGqgsDnY=;
        b=Tg64pmg4cYfGXApsKkJ02xMQO8HUPOdtcf65KH3dttrpDM6MNom/vyYd/sliNauZV1
         Balb3kYBedrnl76LuduGSrbD2Ihi/j32hcUmO7KviNTfWKA9cfGhXIvB42xgfrOB+Sju
         p5eH1xjUovbO+aG4i7WfJvB1FyN14ZIQjU/IGqoKcCo+DGvbK1VkxvgNq83en9hXr0wV
         ex2dBniafc8SkmkDxhObL/ECrXJGTacot1LE50rv8x6pbLokG2WJsa1s4KuSXEx/KSPQ
         sgII4JOZLNXQpEDfc3zovoCdZjWEHpkuRXqI5PgsuS9xL/ATI7/EL8ZE3ZU6S801nUtT
         eN7g==
X-Forwarded-Encrypted: i=1; AJvYcCUkVJ9Jkzh+gPZ6rjce3gjLeI32CMju1zIy56yi3KsHN1fsMxNhJGm45xljQw8zUjFk3+tNTmcwdRrOUYM=@vger.kernel.org, AJvYcCVhUPdrTVx0Nvnoap0gKTm2Rl7ZMHVDYrOa8FmvCuiUU5W7eOV9OgkfFmzrMU2uuaKOAF/7ht3WJlVW4hYYqrgTBjWjZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRf8JZ2Bouc9InmimFnRfnnAw6PN3o3R0UM18ckCM6MFbVNqc2
	9B82IaczwMVf1VbCr4rw7kPUqWLk82diWKfxHX6CN3NInMJWP+iN
X-Gm-Gg: ASbGncuQhcTxypu4MYT1ZRzpVN+nyXekYPRMQtPnh+L29tfUJaFCICFBYXMIr5bYw90
	CJ3XrUFG6d3/bmfjx0u1YysPt0U9557Lqr2cpluS/xmEh8QdjUTb/rF7gPGTYCtlqdbvYazPAMA
	Gg/aKtpKslELiqu1tTklq2GBViAmuBa1Z4T/F9AdZtB9+3yfKpR0GfrI+2kgyRlHjjf/ZaCmZPB
	9d+iDzzGfO3hhsnM39kZnjjCOUA8pRRLOqlpUX1TQ8nALM1nldvCGdzEGhTg5T7nZW9e+HHXeXS
	Qq347od/6f3E+S+tO7rcNfG0XjqXhUuwFdKuEg==
X-Google-Smtp-Source: AGHT+IFKk2aZFdHQrPsMaG2vuH+8BButCOW51T00SFLOVDp2+VvvgAFXqAtg8ClAaESuXx4Z02/Hww==
X-Received: by 2002:a17:903:181:b0:221:7e36:b13e with SMTP id d9443c01a7336-2292f960d81mr9237725ad.12.1743196241966;
        Fri, 28 Mar 2025 14:10:41 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f8b4dsm22951505ad.237.2025.03.28.14.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 14:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Mar 2025 18:10:39 -0300
Message-Id: <D8S7HSW86YNX.10MBR87MGJUPG@gmail.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hdegoede@redhat.com>,
 <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 02/12] platform/x86: alienware-wmi-wmax: Refactor
 is_awcc_thermal_mode()
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com>
 <20250313-hwm-v6-2-17b57f787d77@gmail.com>
 <be5a2029-a00f-7ed1-fb90-af1122b6f127@linux.intel.com>
In-Reply-To: <be5a2029-a00f-7ed1-fb90-af1122b6f127@linux.intel.com>

On Fri Mar 28, 2025 at 11:17 AM -03, Ilpo J=C3=A4rvinen wrote:
> On Thu, 13 Mar 2025, Kurt Borja wrote:
>
>> Refactor is_awcc_thermal_mode() to use FIELD_GET() instead of bitwise
>> operations. Drop the check for BIT(8) sensor flag and rename it to
>> is_awcc_thermal_profile_id().
>>=20
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 33 +++++++++++++------=
-------
>>  1 file changed, 17 insertions(+), 16 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pl=
atform/x86/dell/alienware-wmi-wmax.c
>> index ed70e12d73d7fe5d89f3364c5367820bf47e3c1e..80aefba5b22d6b4ac18aeb2c=
a356f8c911150abd 100644
>> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> @@ -34,7 +34,8 @@
>>  #define AWCC_FAILURE_CODE			0xFFFFFFFF
>>  #define AWCC_THERMAL_TABLE_MASK			GENMASK(7, 4)
>>  #define AWCC_THERMAL_MODE_MASK			GENMASK(3, 0)
>> -#define AWCC_SENSOR_ID_MASK			BIT(8)
>
> I'd prefer leaving this in place even if it now becomes unused, or=20
> actually I suggest you move it before the GENMASKs to keep the values in=
=20
> order, and leave an empty row between failure code and these id related=
=20
> masks.

Sure, I'll move it to the top.

>
>> +/* Some IDs have a BIT(8) flag that we ignore */
>> +#define AWCC_RESOURCE_ID_MASK			GENMASK(7, 0)
>
> (AWCC_THERMAL_TABLE_MASK | AWCC_THERMAL_MODE_MASK) ?

I prefer not to go for this because AWCC_RESOURCE_ID_MASK will be used
for all IDs in the following patches, not just thermal ones.

I'm doing this because I found that Alienware Aurora desktops also used
the BIT(8) flag for thermal profile IDs, not just sensors.

>  =20
>>  static bool force_platform_profile;
>>  module_param_unsafe(force_platform_profile, bool, 0);
>> @@ -168,8 +169,8 @@ enum AWCC_GAME_SHIFT_STATUS_OPERATIONS {
>>  };
>> =20
>>  enum AWCC_THERMAL_TABLES {
>> -	AWCC_THERMAL_TABLE_LEGACY		=3D 0x90,
>> -	AWCC_THERMAL_TABLE_USTT			=3D 0xA0,
>> +	AWCC_THERMAL_TABLE_LEGACY		=3D 0x9,
>> +	AWCC_THERMAL_TABLE_USTT			=3D 0xA,
>>  };
>> =20
>>  enum awcc_thermal_profile {
>> @@ -445,20 +446,18 @@ const struct attribute_group wmax_deepsleep_attrib=
ute_group =3D {
>>   * Thermal Profile control
>>   *  - Provides thermal profile control through the Platform Profile API
>>   */
>> -static bool is_awcc_thermal_mode(u32 code)
>> +static bool is_awcc_thermal_profile_id(u8 code)
>>  {
>> -	if (code & AWCC_SENSOR_ID_MASK)
>> +	u8 table =3D FIELD_GET(AWCC_THERMAL_TABLE_MASK, code);
>> +	u8 mode =3D FIELD_GET(AWCC_THERMAL_MODE_MASK, code);
>> +
>> +	if (mode >=3D AWCC_PROFILE_LAST)
>>  		return false;
>> =20
>> -	if ((code & AWCC_THERMAL_MODE_MASK) >=3D AWCC_PROFILE_LAST)
>> -		return false;
>> -
>> -	if ((code & AWCC_THERMAL_TABLE_MASK) =3D=3D AWCC_THERMAL_TABLE_LEGACY =
&&
>> -	    (code & AWCC_THERMAL_MODE_MASK) >=3D AWCC_PROFILE_LEGACY_QUIET)
>> +	if (table =3D=3D AWCC_THERMAL_TABLE_LEGACY && mode >=3D AWCC_PROFILE_L=
EGACY_QUIET)
>>  		return true;
>> =20
>> -	if ((code & AWCC_THERMAL_TABLE_MASK) =3D=3D AWCC_THERMAL_TABLE_USTT &&
>> -	    (code & AWCC_THERMAL_MODE_MASK) <=3D AWCC_PROFILE_USTT_LOW_POWER)
>> +	if (table =3D=3D AWCC_THERMAL_TABLE_USTT && mode <=3D AWCC_PROFILE_UST=
T_LOW_POWER)
>>  		return true;
>> =20
>>  	return false;
>> @@ -548,7 +547,7 @@ static int awcc_platform_profile_get(struct device *=
dev,
>>  		return 0;
>>  	}
>> =20
>> -	if (!is_awcc_thermal_mode(out_data))
>> +	if (!is_awcc_thermal_profile_id(out_data))
>>  		return -ENODATA;
>> =20
>>  	out_data &=3D AWCC_THERMAL_MODE_MASK;
>> @@ -597,6 +596,7 @@ static int awcc_platform_profile_probe(void *drvdata=
, unsigned long *choices)
>>  	u32 first_mode;
>>  	u32 out_data;
>>  	int ret;
>> +	u8 id;
>> =20
>>  	ret =3D awcc_thermal_information(priv->wdev, AWCC_OP_GET_SYSTEM_DESCRI=
PTION,
>>  				       0, (u32 *) &sys_desc);
>> @@ -615,12 +615,13 @@ static int awcc_platform_profile_probe(void *drvda=
ta, unsigned long *choices)
>>  		if (ret =3D=3D -EBADRQC)
>>  			break;
>> =20
>> -		if (!is_awcc_thermal_mode(out_data))
>> +		id =3D FIELD_GET(AWCC_RESOURCE_ID_MASK, out_data);
>> +		if (!is_awcc_thermal_profile_id(id))
>>  			continue;
>> =20
>> -		mode =3D out_data & AWCC_THERMAL_MODE_MASK;
>> +		mode =3D FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
>>  		profile =3D awcc_mode_to_platform_profile[mode];
>> -		priv->supported_thermal_profiles[profile] =3D out_data;
>> +		priv->supported_thermal_profiles[profile] =3D id;
>> =20
>>  		set_bit(profile, choices);
>>  	}
>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Thanks!

--=20
 ~ Kurt
