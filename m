Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DEC224CC;
	Mon, 10 Feb 2025 02:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739153903; cv=none; b=Jz3gdq21WnT0C/yKjxs4oZ5rVjYl3DWxIKDyhetNyIbPn9Zkyf5TUFZiYTUVEq1vFXrPJm2ll0IDaX3obBOGAZf2ziJ7dHBvgBCXIfAw1dk6mqL0Fna2u3CQtY9NK7pJ7yibm4U2gSxBRBIi5bDPEqurWy+LYlDQW6ueTKJj7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739153903; c=relaxed/simple;
	bh=5wdGOtQ+WCoVtj83txux2ncaqVrSvdPlm2bBpsnktOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aV0clehCPkn7KIkfney+sEgp99W18RWezqUAJIxB6vMEl2RrpbFDn2Kcf0YKbVf0qA21JF4pYD6z1RGcV/NPzMgu8JoBneWGuwVANpUj9PzB0pkXlv1GmOyq0Jjx4gS0l7OIIVLtV0gqOi5QRvmri8TS+1jdXnuDbn6duDKHGtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWZksRA7; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWZksRA7"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa1a3c88c5so4540318a91.3;
        Sun, 09 Feb 2025 18:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739153901; x=1739758701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pra/oOUTQO2yZOLjR2ZipvGGXwjEY9SiYtTQgWiqLL0=;
        b=hWZksRA7eSRgX66vk/3pDShaA0w/IC1LphxUukVwpk5Fe2Bd/yYxabO8DLBH9FoJ7j
         AbWoAE6Q7rZ164eUfqJmR180l1q0l0lNmMIA98yPm/aJfqDUEcTdKRAsKhliaf2AjyEL
         uzxAsv5xYgaTfqJYhp5yEbeJNXDPcbNy6SOeBFMoibvwJSFKOAFthdMfDU8FMoHWkLMV
         T7wJV+BD5QSoaxZ0oLcTUC6uDI3MIDGDnd/O4FDh8ocVJkxinWKDvoNReilaSGKVax7G
         zjBhZpxydWmrOwCS5Ib6acWQTqHatxcdMWwKxidu7E1lTQ3WrRg1heI8LAimKOlthRUA
         ztVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739153901; x=1739758701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pra/oOUTQO2yZOLjR2ZipvGGXwjEY9SiYtTQgWiqLL0=;
        b=e3IkmiNgsA0ZlCpwkmwg0ItS4AN+Y1/Vt9a/i+pCbmq08x6K8Ik+ORZmJzJdjHl7BO
         N0I5khVxJbhtGBPgYJJNhQq4Rzes2b3r2V5cLgvQFrgO1/nITmWgdnlq9+j7hYSN+CMK
         Fi4oYsAIUVJZirgIJydJgGvv6ymVLJOUv/RtiOyNnaKuccbXyNT5Cxh2VaYEhxbBkgP+
         vEtdifXZ6vid4JQcohoo2xFhZRXonv0O/x8mHkPkQgFcU/BdPgD2JTywO3+bmcF2AH0F
         YW2EarwaO4wqnwI2p4MCQUWAOsBP4s4oxk7csJ4EAIeNqVO7bHtJyuP3wijKDUKAAbCf
         iIrw==
X-Forwarded-Encrypted: i=1; AJvYcCX24coh5IkUoVG12E1bGfvYeilz8WQN9MLfar/MfzOXTRuZc8xQ1UK6iOKBgzjAGRPvUIL93t46bww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9qw3kCqBWgOj078E9o5dEjMbsbxAazgXNl+vbC3UaLGmjpeS
	cYg1+ZshfajQgO55YVYUuojKJmoI8wzIsldjOi4cvPBG13B33BS5O0T90A==
X-Gm-Gg: ASbGncttoCsRUmdpzJWr/FiK66hvyVvs/9QEA1N7zMjfNfpV60L3Io5b2CfEZ39z+7z
	3a2VtNgKpbkuwxvyYxFpIvzbpdGl7VSEfeKHZFPWLOuPbmYbbY2R03kbgKjnY01mXjm3uWHpVep
	4CGQS+PEPEdWMYr6VsR9W4/pOkkBbHSiELi/QI1CKbsEyJ0PR67TUvXUrDnoc3xZrJ93HR2YOTp
	11Ujq0X4GjhKnEnhDVAjRdNV3SBhEZeI11iWitaWO2lXpw0UMGn31LN+Vm8Wh0JjWuuDQ8SuvbX
	Y4TWjvEDQ9WOWDs=
X-Google-Smtp-Source: AGHT+IGAVndFTV+DV78WX/Ayo0O2pEYbWNwUS8TyCwA96kczLn+f3VS4tdoh+KmpDqgHmFzfI9jSjQ==
X-Received: by 2002:a17:90b:368f:b0:2fa:1f1b:3db9 with SMTP id 98e67ed59e1d1-2fa243f05b1mr15799780a91.26.1739153900950;
        Sun, 09 Feb 2025 18:18:20 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa184ac945sm7260682a91.46.2025.02.09.18.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 18:18:19 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 8CB9F4208FB4; Mon, 10 Feb 2025 09:18:17 +0700 (WIB)
Date: Mon, 10 Feb 2025 09:18:17 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Brendan Connelly <brendanjconnelly17@gmail.com>, corbet@lwn.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dmitry.torokhov@gmail.com
Subject: Re: [PATCH] Documentation: input: Add section pertaining to polled
 input devices
Message-ID: <Z6lh6QC7qwuw71N9@archie.me>
References: <20250208173554.209688-1-brendanjconnelly17@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MzJliMcHmfnza9QT"
Content-Disposition: inline
In-Reply-To: <20250208173554.209688-1-brendanjconnelly17@gmail.com>


--MzJliMcHmfnza9QT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 08, 2025 at 12:35:54PM -0500, Brendan Connelly wrote:
> +Polled input devices
> +~~~~~~~~~~~~~~~~~~~~
> +
> +Input polling is set up by passing an input device struct and a callback=
 to
> +the function::
> +
> +    int input_setup_polling(struct input_dev *dev,
> +        void (*poll_fn)(struct input_dev *dev))
> +
> +Within the callback, devices should use the regular input_report_* funct=
ions
> +and input_sync as is used by other devices.
> +
> +There is also the function::
> +
> +    void input_set_poll_interval(struct input_dev *dev, unsigned int int=
erval)
> +
> +which is used to configure the interval, in milliseconds, that the devic=
e will
> +be polled at.

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--MzJliMcHmfnza9QT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ6lh6QAKCRD2uYlJVVFO
oykjAP0Wg05htKkLMtzwvpBRhM2345oR/4W/HgFEivvwW8i9MQD+PGdhYFvIJ5qH
hN33E8vEbFoJprBBPAr4pDNrDS6uTw0=
=H9Fp
-----END PGP SIGNATURE-----

--MzJliMcHmfnza9QT--
