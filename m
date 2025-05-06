Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190BD262D1D;
	Tue,  6 May 2025 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540211; cv=none; b=EjrNrRqZRVebW+eeXJQVDh6kSslXcYQIXE1t7wNim512wr4wjdtVRJ1MDk2l6u6155vyo196mRfLR8kakMDkbGTOE+ehvcPwEDS6zOZzZ4I/EceyUTweIVSC9Js3KJaD4eEHqrpE3uVuzAtmlQBwBqgAZu76yE9TWtKUmSqvTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540211; c=relaxed/simple;
	bh=BJiHT11q0saT2rPoVo6tJ/adn5RRMRGNhrNvV8HIKrY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RrMdYBDcezLUxgqhi1kBR5TIR9acQLqZABBD5LK32VVR6E98r2cT+var0B8HtqGRLj+Bvwr5U6injeCgJ1c7S0lQbfCfpiHUCOwp/mSXSE7jdcrMvZUN2ggXX/YmGA/1wnEq6XeOAqxF7gUhniywdJYNBs0+ovtffVZCuO3FWfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWxfLk4Z; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWxfLk4Z"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7301c227512so3988034a34.2;
        Tue, 06 May 2025 07:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746540209; x=1747145009; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zhDK2mA+xX6sqEp6y/H5o2as57Tdk3DigpbEzsikrxk=;
        b=aWxfLk4Z1KX8sLw/A52rWUQOb6A2/2B5SZQa8BVKySTerA6+O7UOfLIiZmZ3xqtIRw
         mbeg04/mJkurQRNE0FEy1YXn7Y8uKoUQqbiCGfWQL1GeA9eeCKu3R+ds1B8SEZtNtLuj
         Ufk0iNVZZDU94lq/N3oOaNYrPG23mdT4540j9eQQnZx7odUOxRjRuNLDFR5SgIYDCYK7
         FZf82XAi9ujN7my0SFfvsssW6Y0729yIkEtnqSXvm/ZaN5I3ID7ziI6+1c7WKR1GQsPi
         jxx8I5/2ltemqXlo4RobPHi9/cTMT4Fwp+m4EzYjuvHtc9lce89lTGwehNPEdsfXuqcC
         cSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540209; x=1747145009;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhDK2mA+xX6sqEp6y/H5o2as57Tdk3DigpbEzsikrxk=;
        b=Hc5s+wCLSkBfYhj5ggUlYb+DVOkppzZzwr95hoIvi72opuHh77Y4g1G3HfKN1O8t9m
         WKsXqOMMjWgNRe9yw5/siopyIe3s5YNMquM+QRU47zshhnl0Q06SxUrSbOLkXoaQ2uQA
         +gq2kKSwvFY5XEcBrEG4vS9+D9wtwVt6jUPOtHmSnjrcwD0S6F96rNqtci1NlrJJSagu
         R0HinmylIJurZetnyNg/Yc1RWPSFzcsWbHw+MSayTWukFt+qJi1e8R5tS2WwbW17VLXV
         aZ/RXA8rzGY2yIIMWeyIx2itEIT9yh9G3ql/3A6joRtUN0tSS4JdRkSRYUEOeZg1kHbK
         +MEg==
X-Forwarded-Encrypted: i=1; AJvYcCUmcpbUFhh5vr+ZHHnp3EuGEMjG1drIF5ovEfLkcmEKSpxq9U6SOy+0dcfAZrQfKluC913fvjuNLQCWzHQ1@vger.kernel.org, AJvYcCUrPBSpT5BqQ0TMBJ1Iuhu77fH3anZdMCLZd5OXRdTGbmeTijgL8h6T1E+xu9HstcGYXhtMHdjpUL87XmW0T8xn2Mk9yA==@vger.kernel.org, AJvYcCXEhKXZ4Ytio4gxIZjWX24Pg0s4fiuGxS7lhhRENokrhg5Rxqmt/SKWoaweQdJAMPA/WpssneViBto=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXGdKKMEf3QfgwaaGQhSBz3srS1UrviqYjEi6b2FGa1pAJOT9T
	u5exzO1wsfAxLlmtuToCKxJQHSv100KaRY3wAkKaLDnSKnrDSlwm7X+XKg==
X-Gm-Gg: ASbGnctkAq+UBQ0hTMH7Bgb0Z9Yrsrr8CcIlzvfyueEByHZ4mA+67mE+ursN7XCIY2C
	23VvzbaNpYnGu7/tJ+tJ8TTHrx6BgHViOOhDkBE4/tAdry/OmnhEyUXKVLz50AkaFNIdfcGEfmS
	ugqclKvgHzPRWjJAqSH71TdgPg8J3wFMbQ9VLsCBWHoYdDwwxvcLSyrrNqWdGSuf1V3PT2SZzyM
	BDuLT8eq6iOBEXjpX1HFKWOZDPP9rZK8nkD9hTO3S7iIgvsRr5ERM2CSH+QbsIB3YHO5roHsgZo
	/6Px3AWmtmv3G+eYdD1xtLGLYKzjrXpCaA==
X-Google-Smtp-Source: AGHT+IHJcXoW58VBCADMEocmcJO312Oc+QJ/N/zvJXr+FXx96vgWjtF+jh4Rt9llS4SqK98DSQaZyQ==
X-Received: by 2002:a05:6830:40c7:b0:72b:aa98:9af2 with SMTP id 46e09a7af769-73206e9dd08mr1904751a34.25.1746540208943;
        Tue, 06 May 2025 07:03:28 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d350a8e1sm2046569a34.64.2025.05.06.07.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:03:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=e1dd0e2d319b941edae69a76746165184d53ab0b7df2841f51e22fbc2a78;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 06 May 2025 11:03:23 -0300
Message-Id: <D9P4TWUVLG8M.1A075SO65RWON@gmail.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>,
 "Mario Limonciello" <superm1@kernel.org>, "Luke Jones" <luke@ljones.dev>,
 "Xino Ni" <nijs1@lenovo.com>, "Zhixin Zhang" <zhangzx36@lenovo.com>, "Mia
 Shao" <shaohz1@lenovo.com>, "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H .
 Chiu" <codyit@gmail.com>, "John Martens" <johnfanv2@gmail.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 5/6] platform/x86: Add Lenovo Gamezone WMI Driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, "Hans de Goede"
 <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
 <20250505010659.1450984-6-derekjohn.clark@gmail.com>
In-Reply-To: <20250505010659.1450984-6-derekjohn.clark@gmail.com>

--e1dd0e2d319b941edae69a76746165184d53ab0b7df2841f51e22fbc2a78
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Derek,

Sparse throws a couple of warnings when compiling with C=3D1:

On Sun May 4, 2025 at 10:06 PM -03, Derek J. Clark wrote:
> Adds lenovo-wmi-gamezone driver which provides the Lenovo Gamezone WMI
> interface that comes on Lenovo "Gaming Series" hardware. Provides ACPI
> platform profiles over WMI.
>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
...
> +/**
> + * lwmi_gz_thermal_mode_supported() - Get the version of the WMI
> + * interface to determine the support level.
> + * @wdev: The Gamezone WMI device.
> + * @supported: Pointer to return the support level with.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_gz_thermal_mode_supported(struct wmi_device *wdev,
> +					  int *supported)
> +{
> +	return lwmi_dev_evaluate_int(wdev, 0x0, LWMI_GZ_METHOD_ID_SMARTFAN_SUP,
> +				     0, 0, supported);

The 4th parameter of this function takes a pointer. NULL should be
passed instead of `0`.

> +}
> +
> +/**
> + * lwmi_gz_thermal_mode_get() - Get the current thermal mode.
> + * @wdev: The Gamezone interface WMI device.
> + * @mode: Pointer to return the thermal mode with.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_gz_thermal_mode_get(struct wmi_device *wdev,
> +				    enum thermal_mode *mode)
> +{
> +	return lwmi_dev_evaluate_int(wdev, 0x0, LWMI_GZ_METHOD_ID_SMARTFAN_GET,
> +				     0, 0, mode);

Same here.

--=20
 ~ Kurt

--e1dd0e2d319b941edae69a76746165184d53ab0b7df2841f51e22fbc2a78
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaBoWsAAKCRAWYEM49J/U
Zr7jAQCDj3QyXjVyToGl/WybUiZi9N0W1bpv6mDDyjIbBwhJ9AEAqSYVkwSirDbC
EnrkFQPcq5x6lBs/T0s6cztmnWTZPwg=
=FwMi
-----END PGP SIGNATURE-----

--e1dd0e2d319b941edae69a76746165184d53ab0b7df2841f51e22fbc2a78--
