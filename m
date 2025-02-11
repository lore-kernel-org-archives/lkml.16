Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BC926157E;
	Tue, 11 Feb 2025 17:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739296062; cv=none; b=DjnvzrK7FUrhJ01Fihv6mTAS0CcF05m0TM65K+b52kWFdhlEiSu4dIUvm4e0mPKWk95KZBesy1XG/2PMHYEX/WQ0gonyr1UGscK74MCxTLjBwGJMhiEgCWtcDArCUozlb58F5HVJ4/oWiJNldsNImhPnhgvrA2ykaSESXWyNwhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739296062; c=relaxed/simple;
	bh=qcDohKswnGe3rd4ob1BXRwf0qBe/j7Dt6XdSSh0tjaw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ctxi3bFE8bLEaY0Pv6jbO5q4enmD7peOBUQbouL5a/f+OwIES3vEn031pbes5fxsZx+MkxU7b2PLkihXefTKp0cfHh7TdxPuaj/PsuIHdAMyf46mrkCSEUZfqTNPxqfmMjVGTKFKMZHgV9z+pNcJ7l96Iz94vyTGPxPw1sgUGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmciAK0P; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmciAK0P"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e5b32f64ffeso4866305276.3;
        Tue, 11 Feb 2025 09:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739296060; x=1739900860; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+mno0kzNBXuu8tS0hoMprhStdna23yjUGsI9SeY8A0=;
        b=ZmciAK0PQraLYpRGZBMOz/8hMW44gC1c6w4mGiZCm7rMnxmsOiiGk59bk9IG4aVSU/
         sQEp8fhZoWRDeHNndZySK34ad+MfhR0R2kkkfww2Wr33coNxzvT5sWAqnoSvU58TvKf9
         g30MTfhl/51KJavZkTcTmrlMHGwYCWyQ63uOqYjSiC7+XwNDxa4wds6n/lwPHJvZC8b7
         cADKB5fb4b8gusBvc2sucpBP1c7TFGUpCg/D3HkMxZhSyidKQlOTJbBtfkLhk+/T6ImU
         wfLpR0Dm5AfAuieKNk5GhM07DsynwZw69WAvh+ioBGyEtH+XLWdoskUEGwyESTmYQRZW
         i3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739296060; x=1739900860;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+mno0kzNBXuu8tS0hoMprhStdna23yjUGsI9SeY8A0=;
        b=gINiH5kzdRjfSG62ldDcnDhI9ac5/gQAdmkuCpJ2rZBjTOicIqQXv8b4kVrEtBnCBY
         R5erDgzpbILbL+kih4Avjepjy9wt81zROaPUrNXarfJGlZnN+t/PR/XpfGRFfbraVR3g
         2g3ZSZD3R1ei3vAa3uwnXEI0XL4iUEqbJAk6jvGf/9IClKPWC21pBiMSDmLY9nmIOhcB
         Ocbh6BSLhKXhX0K5E1DxY3/OIQnYJMTRQcCSb+VIdh1PMPUVopspf6AC273P7dHX+35K
         SE5E/DOGMpuz0hk7ZUo/3A02RwZMX8J2Kh9kAdxshQ7GFFSByZAKDO4dCfnA5gw3g48J
         Wbtg==
X-Forwarded-Encrypted: i=1; AJvYcCWFYzJyFKVCrhwPEGkVOSHGEF96eNr4RbafwZ42ewmqIr1eSFSUseqq2/66BTwpGF6FQzmdQb/lAUoVc6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvqH/D1N1WYBKEj8zaUaeKgtOeZ7KYnWcyz5lBhdNsMg9PbkwW
	M5v0ny5EcZw3fPmvBHyn4/T6/XfFrchiz2Fkxvh/ip09jYqxE8dt
X-Gm-Gg: ASbGnctL0gsdYKCB5xgG4IQvnHsTIYKQ/RDOJbFZNZJ03bTqEp1PWoWx1GMvKkITI5d
	nqa+JdF8pFdvzQRcfFxVYDYi0otxFWrvtugHjLW93CrdQiS4Q+icaaqjFCIn0P7CIXeOnzVA0jV
	XFqTo0J3NyDsGKdUrM4qEwXdl2Fty1j7cQAlExt9b3lvX1TyNh/8hF/qiim3++4M/2+jIqIZOy0
	Tdq2IAdbyYH0ayRVXjGjm9A3fI58z6Ad4vN0kXO/RmzdAedV1Gqzf5MTJLMBcV9RvPWIgbT0aXC
	gKDoHGEM
X-Google-Smtp-Source: AGHT+IE3mNRc5IqWsZadj2HTJOqYQ9kBUlaS8166nyR5C+scfD5kPRKhf3sRjoZ8GUt1UaI79vYfqA==
X-Received: by 2002:a05:6902:2d08:b0:e58:dbf:ed05 with SMTP id 3f1490d57ef6-e5d9f0cd0e6mr348178276.10.1739296058863;
        Tue, 11 Feb 2025 09:47:38 -0800 (PST)
Received: from localhost ([2800:bf0:61:1288:72d5:e7e1:d832:2e3d])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a60f8c8sm3398326276.14.2025.02.11.09.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:47:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 12:47:36 -0500
Message-Id: <D7PSZTY8T63W.16GP7U21D7GEZ@gmail.com>
Cc: <platform-driver-x86@vger.kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Armin Wolf" <W_Armin@gmx.de>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 04/14] platform/x86: alienware-wmi: Refactor LED
 control methods
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-5-kuurtb@gmail.com>
 <Z6t76t_4nIXwFX5Q@black.fi.intel.com>
In-Reply-To: <Z6t76t_4nIXwFX5Q@black.fi.intel.com>

On Tue Feb 11, 2025 at 11:33 AM -05, Andy Shevchenko wrote:
> On Fri, Feb 07, 2025 at 10:46:00AM -0500, Kurt Borja wrote:
>> Both WMI devices handled by this module specify a distinct interface for
>> LED control. Previously this module handled this by dynamically adapting
>> arguments passed to wmi_evaluate_method() based on the `interface`
>> global variable.
>>=20
>> To avoid the use of global variables, and enable the migration to
>> non-deprecated WMI methods, let the WMI drivers define upd_led and
>> upd_brightness operations, which completely replace
>> alienware_update_led() and wmax_brightness().
>>=20
>> Also define alienware_wmi_command(), which serves as a wrapper for
>> wmidev_evaluate_method(). This new method is very similar to
>> alienware_wmax_command() but is WMI device agnostic.
>
> ...
>
>> +static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id=
,
>> +				 void *in_args, size_t in_size, u32 *out_data)
>> +{
>> +	struct acpi_buffer out =3D {ACPI_ALLOCATE_BUFFER, NULL};
>> +	struct acpi_buffer in =3D {in_size, in_args};
>> +	acpi_status ret;
>> +
>> +	ret =3D wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &ou=
t : NULL);
>> +	if (ACPI_FAILURE(ret))
>> +		return -EIO;
>> +
>> +	union acpi_object *obj __free(kfree) =3D out.pointer;
>
> Actually we have ACPI_FREE(), but it's not big deal (as of today) to use =
kfree().
>
>> +	if (out_data) {
>> +		if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
>> +			*out_data =3D (u32)obj->integer.value;
>
> Unneeded casting.

Ack.

>
>> +		else
>> +			return -ENOMSG;
>> +	}
>> +
>> +	return 0;
>> +}
>
> ...
>
>> +	if (legacy_args.state !=3D LEGACY_RUNNING) {
>
> With inverted conditional and duplicated line it will all look better.

Ack.

>
>> +		legacy_args.state =3D priv->lighting_control_state;
>> +
>> +		input.length =3D sizeof(legacy_args);
>> +		input.pointer =3D &legacy_args;
>> +
>> +		status =3D wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
>> +					     location + 1, &input, NULL);
>> +		if (ACPI_FAILURE(status))
>> +			return -EIO;
>> +
>> +		return 0;
>> +	}
>> +
>> +	return alienware_wmi_command(wdev, location + 1, &legacy_args,
>> +				     sizeof(legacy_args), NULL);
>
> ...
>
>> +static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
>> +				      struct wmi_device *wdev, u8 brightness)
>> +{
>> +	struct wmax_brightness_args in_args =3D {
>> +		.led_mask =3D 0xFF,
>
> GENMASK()?

Ack.

>
>> +		.percentage =3D brightness,
>> +	};
>> +
>> +	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
>> +				     sizeof(in_args), NULL);
>> +}

