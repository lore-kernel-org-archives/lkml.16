Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B7B297A66
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869545; cv=none; b=ph0kGl1jKXwzniSczIsSOGx3W5bKeAJSU0gpgewjYXlcIiJRe3n+Yxdk6fT0YAYnADktRWEojXJTLGZWjqJFeDBFsnhThR8niodT3ApaDgWljyQ+lqrdK602Rzac23ObFR6l+5FW1BbqaOYs6RvYl8ILUkNf+/u7lfLTxJN8lQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869545; c=relaxed/simple;
	bh=YggQZ1TyVDh4eowW2USUjCGtu+akNt8AE6k6QX1iIxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhIgMXuK35fHWAG5fiVoFXYSfsfC9NkRyXn5F+mbtVlw6DFD22lru9wMFZO85R0NlJkeau9bwmjxHSZChCgHV18yIilrbbZtnR/nAiOcd8zsLYAtHU4VGVVMKTFVEH+z5g8De+V03drrIiwKi1sazKcqnBOtiL5EV8TCbJyDs0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dymBWsXw; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dymBWsXw"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73bb647eb23so4359374b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869543; x=1746474343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGHxp6lqAYRQInWBjVpHf7WApOQAlT577yEtZ4eKCyA=;
        b=dymBWsXwqBIy1keTzhg/91DiYUnQ6jpsEXNDd/G+AL+VjL+jFaiDZ5QJ8dDaqH7HFN
         7Q4x874LFFgGg+XrF9PpmHOMHZS14SqoBv2mOh/u7y63xYlm/kFlsRkVA0OSSHQ5rciy
         mYpSJKyvBmkZ425DOScbinCVll82fjqarqMgbBZAsZOPLaNppSDt2lGC7l4BREU85c6M
         R4i39yBzerbRPPl0WrVbokEsimxAsDrtvxj+cftuM0zBjzl+nh2eWOIDdO1UD+XOfQdF
         De3dg35p6yTBNxAoQDoh5EYrRt5qj1q6P66c/1RoEuNNRLamhF2kQUAcFXUSFPE1eIzj
         oGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869543; x=1746474343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGHxp6lqAYRQInWBjVpHf7WApOQAlT577yEtZ4eKCyA=;
        b=PaZe5KHaIAVyng61OG3Zt2qHifzLYDP1eOjyE8WzNdXtVhakljwop94Il/PgHujbfJ
         mTpJhAVNrY91QaPPtNiG7e7bDP6WuDwi1KAUWeyRE1vkWOxHgp8cTz7fO4WHBeVJiEf1
         8kSSujHPmCzmj0xovV36toGDdED9gXqphjJjST7F6Di5kwkUON8b0tIJon+g4u9lleui
         ya8u7peFWJTcbTPqNbvmjHc7zYba9pajs85B1mzRjyUM023awTM97CEQmDOu9CIIN+FY
         aOSG/NIMmLcVHQ6+as3xziukEuDZqvaa6yhMh/2iHQg42hz7sQC/nQwmY2PNqJY8GQLu
         cJfA==
X-Forwarded-Encrypted: i=1; AJvYcCVBuk/Az9r8j5oRwLsokEQh4MnZhKCFGIEQGE6Q5B3GKIn3Ew6HHWnnxjeXCSaorseXqMIQkvMkQPOVeYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGVbmxRAoZjRxLrzJMlfEYO8y1Msfjh9ghfIkZW8bLsTh/gTPD
	xprq+/9WigIqoljS3Qnhp9qa2YLCob+oecsi4V0gABgkM3qEjapx4FD2gyZSSw==
X-Gm-Gg: ASbGnct4+rliGWXsCdWkCm4jOw9CTUDETRtytq78ABZndp2ZvF26cU/orInEEik2w1R
	7QtiG4V+7I7iFhw1E9NG0H+dZsTR4n8fFral3U71KdVd8R3/dpCkwHp2zJJa0fkyqwVCbxj612n
	AHDC9xKNc26EQp7EiFObhNVuZpjUMLseAwITSKzPWvf0O8F6jEG4whBSZlCy8NeKpH2ZvSUmlN0
	0LWuouDE7cIv1NkimeZLpz5L3Jyf9g3wHOhjltM8KD/ov3Npjx/hQGnu0mVZw5CRMGXT0o1do6k
	mb1ZpauXoOvgngRMwnqHAWGSxuZraL8M4VLolPdOkLqkWh08sU95H2Qc9XvPcmO4CdV1Q+Ne/p5
	C3iC2PTGy
X-Google-Smtp-Source: AGHT+IFYlvYhne57m4K5klZLGQL12xu5rF8UHasgAgtYn7L+ZI+rW0iA6PRZDAtjG6kMT4NaEVhDYg==
X-Received: by 2002:a05:6a00:4644:b0:736:4d05:2e2e with SMTP id d2e1a72fcca58-73ff7280114mr12876072b3a.6.1745869543146;
        Mon, 28 Apr 2025 12:45:43 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2593f621sm8429207b3a.39.2025.04.28.12.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:45:41 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:45:37 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 7/8] platform/chrome: of_hw_prober: Support trackpad
 probing on Corsola family
Message-ID: <aA_a4Whqm35-pdKk@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8X7Hm8zNZQujXZIe"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-8-wenst@chromium.org>


--8X7Hm8zNZQujXZIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:45PM +0800, Chen-Yu Tsai wrote:
> Various MT8186 Corsola Chromebooks (squirtle, steelix and voltorb
> families) have second source trackpads that need to be probed.
> The power supply for these are always on and their reset/enable
> lines are not exposed.
>=20
> Add them to the probing list.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Changes since v1:
> - Rebased and resolved conflicts with "spherion" trackpad prober
> ---
>  drivers/platform/chrome/chromeos_of_hw_prober.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/pl=
atform/chrome/chromeos_of_hw_prober.c
> index 019578bc7ad0..10dbaede0541 100644
> --- a/drivers/platform/chrome/chromeos_of_hw_prober.c
> +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
> @@ -57,6 +57,7 @@ static int chromeos_i2c_component_prober(struct device =
*dev, const void *_data)
>  	}
> =20
>  DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
> +DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
> =20
>  DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
> =20
> @@ -88,6 +89,18 @@ static const struct hw_prober_entry hw_prober_platform=
s[] =3D {
>  		.compatible =3D "google,spherion",
>  		.prober =3D chromeos_i2c_component_prober,
>  		.data =3D &chromeos_i2c_probe_hana_trackpad,
> +	}, {
> +		.compatible =3D "google,squirtle",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_dumb_trackpad,
> +	}, {
> +		.compatible =3D "google,steelix",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_dumb_trackpad,
> +	}, {
> +		.compatible =3D "google,voltorb",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_dumb_trackpad,
>  	},
>  };
> =20
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--8X7Hm8zNZQujXZIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/a4QAKCRBzbaomhzOw
wjG2AP4ijnSVnwRAZNpFtMiKPIOjyp13MuNiw9PMzfMbCr+MRwEA9hFqvOc+hmFl
cJV85xxmxWaYDZTsW2Gw5ByJNl+JBAo=
=LvH0
-----END PGP SIGNATURE-----

--8X7Hm8zNZQujXZIe--
