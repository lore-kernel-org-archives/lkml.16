Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4775879CF;
	Tue,  8 Apr 2025 02:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744080225; cv=none; b=I9hbe/s3RoH2BT/sQziBgbF3Qwy0xmXf4IxtedeI1tjxvd6IbDW3W6cg6/oO6HlibiBXNjgbLu6x2QfEyPBBanP2CCvEC3vVB2y4/+MnzNav6YWO88hImvGB2GH71aO/o8r59BToGX5GoWzP8tn23zjGdWRf7BAC25+J+RQfWRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744080225; c=relaxed/simple;
	bh=uMJrwov1IZxKFW0XGBsQ/tzJB+eGUEzjRoiJvWFEqXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtcRUUg5/RgKY5r7Pw8ZFdueRgWlNSuUaohS0oPTYBrLyQpBVW/4O9sRBsS/rkjFIUbYh9HQzlQguFnlmOucBKsRGp005y5nIa+f+40x6YNM0w/wUyiIBYPhznH79xh7a9W9gOsin3RkgGS6qF80zaNS/lcnsI676jzn6GerNRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lp91UWfr; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lp91UWfr"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7376dd56f60so3634476b3a.3;
        Mon, 07 Apr 2025 19:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744080221; x=1744685021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/OtvVm6zScWbSjh6iMXwvJQ3OZdxi/HpzsiqDN7FpA=;
        b=lp91UWfr+DF23Ka7wsqWg0hJ2xKNR6NYpgEYTbvUGwbgBnUXUGo4kM8TDQSti6FiDz
         NF/lShOGXhMGKlOgbBjOlGzrgGpbpJFKI6PPBJNilxh14BxK5iKdDo11odovv4LrS8Lr
         V5Bto+a+ynRVJCzddstjPCaf8Ki6DsuzW5PTpGYyHT68cjJXB07CCcIprXxsiibxyS8k
         XguMPCfH++F7MxFno0yCkB7akQSqW1B7cw4oQGdBNneR35B9ySY/3zx4SnvCzDIiHeXw
         Lwhcp9GMuc9s4kuhVypU8HsSKbztSrhs7+kKx4kRRyIL0KIdj8qXtJvZwuOFaSqv22Me
         6RMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744080221; x=1744685021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/OtvVm6zScWbSjh6iMXwvJQ3OZdxi/HpzsiqDN7FpA=;
        b=VqupIZHcITmtiV73ISbVpd5XFYM4x7zocUbbat1JtC3gO5+06pZJKLWJwmZCkmHjzq
         ODUEUIfYAzhQUQp4yi/kPmGpDrXW97WcU6gCv62GpPJBImkzW/tZfVFJwVCJr7Pp33FM
         omWBd1tN3lU8jCehitXPexgSMUFEkPcPf41VTUuiU1Aui76WEPWImHaJt4VvKoVudnQf
         27MtOvj4cL0wRfnikYtlmSNCBC1GlNr49lVMyEfg0JWAVAwuCHz9D6kQwgs1MHjcH8zt
         oceOGQWQvrfUixEpDxR+pcSsbGxp1ZuG2eNNzzyKCrb214jQqSzIIQTQn7jetjueX/PL
         a+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkqM3k2Zifie7TI+KqabWi16lw7KSX+Co1M7AefnMbPoETeXK/cKpSbKcZ6M4AhefzPCZFm3TD9X0=@vger.kernel.org, AJvYcCWMcJ+8eOQrDEzmoseY0jlx25qEDcmBbicqgzjYeTsF1/Vlz9iyCvFrXV5eWqsz1Ks5c8Sr8LB77u6d1pMYCgsXWCyVAQ==@vger.kernel.org, AJvYcCX1LIOf1j4jnaNAcPGxv6ulvJf4ziUPp26VADgazu5DIIs3AP+alDjfk8S1EwWn65PlzhlGhjuWS+xgyA+N@vger.kernel.org
X-Gm-Message-State: AOJu0YzAm7b28n2eIpYtmE4uDq4aIniQMIV2EytbaHQ0CPc8q6TLfW0g
	3hAUE816kzTHFLQ5sVF8XXXiWdY1qOLdfniYGU9S6y9KETfT4w9n
X-Gm-Gg: ASbGncuwWY2dIpUM2Xs7zHR9Nl7X0o41AFAjgiqEKLHgzFalKZy8RFE9h4J7nwQx5dQ
	gcLxnfjZT+I38dYXCAUVL+87csDES8RcoJ81r1/JWmlw67Ym3cmw3ZIZrhgQ7z+jTXiN9TzFkM2
	PhRJsMmLK2ZmTMOjkTeLQg8wWRYGJCbQZiWKz9APS7dZ/ke03Xo2Rmz4mv9qNPocyccIoon3YJW
	sX8w1Nc5cVreTacIs/vaYHMCh6Y0kq7yaKegABY3NTgo6jfUnpipcByUTAZN5kDpMtSk/IYskTE
	cc1zbc3KJtDQo54eGocCSQGXm0am2VhdQ1KnseY27m6e
X-Google-Smtp-Source: AGHT+IGYJY3Vw8eQZB3fM7nHVZhinPtXWjfzVKGVrZd+aXEvu0+KorEQ0ZkcCaKU6jpo7PFAEqoaVw==
X-Received: by 2002:a05:6a00:188a:b0:739:3f55:b23f with SMTP id d2e1a72fcca58-739e703c33bmr19565974b3a.14.1744080221174;
        Mon, 07 Apr 2025 19:43:41 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97f36besm9307315b3a.72.2025.04.07.19.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:43:40 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 00674420A696; Tue, 08 Apr 2025 09:43:36 +0700 (WIB)
Date: Tue, 8 Apr 2025 09:43:36 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v5 1/6] platform/x86: Add lenovo-wmi-* driver
 Documentation
Message-ID: <Z_SNWC4zWC3hoXef@archie.me>
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
 <20250408012815.1032357-2-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5GXWb2ZFP6f/j9R0"
Content-Disposition: inline
In-Reply-To: <20250408012815.1032357-2-derekjohn.clark@gmail.com>


--5GXWb2ZFP6f/j9R0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 06:28:10PM -0700, Derek J. Clark wrote:
> +LENOVO WMI DRIVERS
> +M:	Derek J. Clark <derekjohn.clark@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> +F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +

I get a new Sphinx htmldocs warning:

MAINTAINERS:29601: WARNING: unknown document: '../wmi/devices/lenovo-wmi-ot=
her' [ref.doc]

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--5GXWb2ZFP6f/j9R0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ/SNUQAKCRD2uYlJVVFO
o93UAPoCWyKkA+MUDv8s3SY4BWwFsI0SKZz9E5UV6iJfRcbAjAD/S9TXAkttDxWn
FU2BVXhtWYb0RI3K7q5pcftRmfoBqQc=
=Ltuz
-----END PGP SIGNATURE-----

--5GXWb2ZFP6f/j9R0--
