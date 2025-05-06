Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D0D2517B7;
	Tue,  6 May 2025 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540429; cv=none; b=bQheL7MvyJNCtLWangxlVRebwT/VvP2VNfahiV+2/jDUrK34QnQHOPaJmVghT/Yeeuu3znMwj0gwLVAwTLGfezJa6M31vix/LHbFVdMCBUPf74XiITf7qlrsufg2afLjfhpurL3Z/Uu+nkKzqpvT0ZNsSORlNBdQ62t42JkVS+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540429; c=relaxed/simple;
	bh=WXtaGT7lF0uTLZg96UgqxuWVaRi/I0lqkAIvcA8kRHU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=jikcNivgkhfMaamiIX02pumng4pD6POO39zBac9sVntTkVTH/YZSC/HYBB2w/C/sbsuye2qi8kQ8QG95E8XGnbzZ72x7mls9kAq3M9rZGjhSSa9R9o2IWlCVdb1zkXOfaVTHaM1Hm9RKOvbwhe1WTdzInafFik5opUwrFjQvFsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUPh0Heg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUPh0Heg"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2255003f4c6so59521695ad.0;
        Tue, 06 May 2025 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746540428; x=1747145228; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=voe+/4nXQyObHFxQXaFicmcPG7Zm26GMrBpX4/agWt4=;
        b=JUPh0HegpGiUAznR1cYDTADZIeot7ZxbLGCxRmI8/jzpQS12sKmFGQYXMhxKuOwAvm
         YoAdIE5pZvqzRRWwhqDUb0ybliCybR8hp5wmUFUFLeSXJSA8Ut4RWtKESqCoiL0tI5Su
         cC3UUf2vc+JN/S1Z2AkuqKeMaowRHpLya1qlBs28oVwEH1Hihe1efzN0jYSxQmx9x8Rc
         QH6ZOG6OuUrF7/OS9lrtr7sqfKgvXeDL9yhBh3NOy9M/tqgW/s74cfsLwdPcFMNwH5qH
         +BrvrImIGTmeZadiOrN4Emxrfsyg3fbq9urjx9afjVRKklTOP4uRGrovCkv0e7PGic9Q
         Jj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540428; x=1747145228;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voe+/4nXQyObHFxQXaFicmcPG7Zm26GMrBpX4/agWt4=;
        b=X+fktZuDfT2vi82acUKaiuCDmeGQt3YpZa91zK3VQigV1NAaWMyfd1cmy8CbAmAdtH
         6Xt41qWeN20o49qNhXbQt2yGhrdT7JnI9QOrvh3FXvCM237Ipb/cGk1LUC1rFVj5I1uk
         dQpc8pZSh+Nz8W3Gm5N1nfWQF4dl2xV1ogBqLVgWSOlMkexiqZjqY5zv4/ojhKIRE18H
         8syEeIScmteKoVre8e9Y5KIw1VzP4azcZiCzNWQn/D/jKS7fCJ1rUgN0m/QY0f6nWnZh
         ZC4zFFpXhi/fa68VgrxVGFbodZ/GEFIrUWlat/Fe/itdqzbZtq7hWapKzNhnZmI+dtQA
         qgZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7NoS73CZt9QQG2cbV1Lrm+ZPdoJ+bavOGEiYV+4T5QyWduvA3gLWxmBJi97DQwfVanPalYeSJMflSC3Nw@vger.kernel.org, AJvYcCWaWmJxi5VlyeFJ9aLCe82U+OE/gkf+N4as1/cfJGYcqcSFemJiGo+W12KMEqIC0DNxCkXEoXYqFPQ=@vger.kernel.org, AJvYcCXTv/AoRgT+vUOB+9xieiePjySoc+djV4LwRq+sgxypoE/4bnHAhlhPi0ngFgW0YY4TRAW1s2+ph5wghZV3Db9wCDENpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNsfM0KzV5xv1FUKZYoMc81MK2+xExTDH3/MERZJ+grXv7SQ1k
	Ke1IYQ0l7xNpLRY/h0m6tdaBecfBlyYo8WpIPtHrjIIhuszaneDt
X-Gm-Gg: ASbGncsUmCWxx5AueZ3M/hY3P6xraYKACiefhw9wm7H8g0/F3jMT+aOZfvHKNHBTn21
	hY6IgkrnDt1tIH+AwiaUe/pAvg/xAvZg6ReTxEXA5Ymz/1L1zvfjRtL8t/Ci4NxFN6QgQo5kJoQ
	VywkkzFLM6vx/A0haOnXSUUAA7r4Noby3m4mxoE0lj3G4GO9wGkexMq2DO49Azkg9w7eTeADoUZ
	cu3Gvj3IvAnQghZRhnNBaq2R3MBwoaCJFsL4SWbAIQVkRTuQv6bZrj1EgJvFB0M+SYP36Zukgvp
	3lgTtyhZ/UbQp9j9ADXZXRYDhW29+C8KpQ==
X-Google-Smtp-Source: AGHT+IHKS8DeMPUm4YmUHOSkL2q7nnf6Tm5kMgFtcqfHzGGiz8KwigDUOsLjoKrhLcXsM06HMEg/QQ==
X-Received: by 2002:a17:902:d508:b0:223:5e6a:57ab with SMTP id d9443c01a7336-22e103570bemr227935985ad.39.1746540427680;
        Tue, 06 May 2025 07:07:07 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm73860675ad.201.2025.05.06.07.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=47f4e849a0bb507ec94d0535baf510c1d52cc3ad2843bfeec9b2e3d21d74;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 06 May 2025 11:07:02 -0300
Message-Id: <D9P4WPCRV2MD.VZE4Q37U0O63@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, "Hans de Goede"
 <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>,
 "Mario Limonciello" <superm1@kernel.org>, "Luke Jones" <luke@ljones.dev>,
 "Xino Ni" <nijs1@lenovo.com>, "Zhixin Zhang" <zhangzx36@lenovo.com>, "Mia
 Shao" <shaohz1@lenovo.com>, "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H .
 Chiu" <codyit@gmail.com>, "John Martens" <johnfanv2@gmail.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alok Tiwari" <alok.a.tiwari@oracle.com>
Subject: Re: [PATCH v8 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
 <20250505010659.1450984-7-derekjohn.clark@gmail.com>
In-Reply-To: <20250505010659.1450984-7-derekjohn.clark@gmail.com>

--47f4e849a0bb507ec94d0535baf510c1d52cc3ad2843bfeec9b2e3d21d74
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun May 4, 2025 at 10:06 PM -03, Derek J. Clark wrote:
> Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode" WMI
> interface that comes on some Lenovo "Gaming Series" hardware. Provides a
> firmware-attributes class which enables the use of tunable knobs for SPL,
> SPPT, and FPPT.
>
> Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
...
> +struct tunable_attr_01 ppt_pl1_spl =3D { .device_id =3D LWMI_DEVICE_ID_C=
PU,
> +				       .feature_id =3D LWMI_FEATURE_ID_CPU_SPL,
> +				       .type_id =3D LWMI_TYPE_ID_NONE };
> +struct tunable_attr_01 ppt_pl2_sppt =3D { .device_id =3D LWMI_DEVICE_ID_=
CPU,
> +					.feature_id =3D LWMI_FEATURE_ID_CPU_SPPT,
> +					.type_id =3D LWMI_TYPE_ID_NONE };
> +struct tunable_attr_01 ppt_pl3_fppt =3D { .device_id =3D LWMI_DEVICE_ID_=
CPU,
> +					.feature_id =3D LWMI_FEATURE_ID_CPU_FPPT,
> +					.type_id =3D LWMI_TYPE_ID_NONE };

Sparse warns about these symbols not being static.

--=20
 ~ Kurt

--47f4e849a0bb507ec94d0535baf510c1d52cc3ad2843bfeec9b2e3d21d74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaBoXiwAKCRAWYEM49J/U
ZsmRAPwJddV2M9l+UFAPQzb22LLuvs8fhXMzmfeYLOfGIETE4gEAjGJZT+BR9q+l
ILyDtJolFEx6fhyTXFm1/Yf4MRNsCgo=
=qFJI
-----END PGP SIGNATURE-----

--47f4e849a0bb507ec94d0535baf510c1d52cc3ad2843bfeec9b2e3d21d74--
