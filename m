Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E370382
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 21:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751318153; cv=none; b=sVymZDDVd9+XJxbZr9FaAFxkxrt+L42wgiG+6PP0+HOwklW01HMD6kPSWb/SEs7V9hfj2vyPqiqLbOFYnODxfr65uxNlZXpdcV6jfsfRS9KpvKrOZB/uB9VBO2RZ+kQODCLpjtUzh4DrmKG6GR1yYIJbsoq6w4bRDC5uPyB/TSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751318153; c=relaxed/simple;
	bh=EGUon6c0S5wpmsyNf3auE4SlWk7SFOne67nKm/p9eaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9z5MqvPfxsobNCKE4ThhRRr1pV+WtqvlRp+k3l8mlBcSsRgRaKsQ3qNbk6WFupNI/38Do6ReMnL8hLFGbg3m+uFZFMMICD/2rRYY0fWuU6ewes2XJQUe2iOqqdEDxv1X0LA2+xckQsAkrOg1tW1DpShH39h2mH3qYG7+7jvgTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=qWgKdeSx; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="qWgKdeSx"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234f17910d8so46885085ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1751318151; x=1751922951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui5dGJRoAHrxep2bvtPWXcSrwRnwojJa521Ykl4R4a0=;
        b=qWgKdeSxtfuthwyhcRUpqhtxbJ4JVweEL6ykeugSgj1zN6lULJ+yCzKW71D5a+Bqzh
         /YssF/mH/E+mK+N3mLxVjJx6D7ZwQ+rOsTpguJFtatkdjVWh1teT4xmwZQk3TsQ2feVy
         lSJ8iczo530+IrXsqmdJft2d5zjY/WWBqmlff1h0uy8ImuWuPGJxPvqGAm5VEuAuRhm2
         nh0sZnmJa+rzTNfk78hRzebCGwTtP/a7M0ec4H/1E9CvsUoJ1Cr39hnwtWflIkT/znAT
         0iAytVWDaXjvFvbSVKVIqgTQNkGw3zfjVZKfhlW2Krc4mVBBZBhpYijO84H1BlC2UPJx
         u7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751318151; x=1751922951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ui5dGJRoAHrxep2bvtPWXcSrwRnwojJa521Ykl4R4a0=;
        b=liAmny0P8mT4LK0ABW2C3KL8aORAiRqsIB0Ogsxv0vikN0DUWewDKOHtt5l5q/6NUl
         TNGR1AxjJBAZqfAeeVSfdbFs9COpFJeGwupW0sLqkO1LYxXe17HdZ6UQnKp9Jol/fQRj
         0R1niMTkgGCjmhOwxdoMkrmxgIPm3NkzJv1tQqPgdV2wL/1zRrcKThKQkBWvAwMivCdh
         qt2DFPS7MkW7N432tr5TyRRURk3USNsjGZqlegVa0er3pNmLAk+AfxVM5YjDFfNUha0V
         bmqxDnTGASKI4/EO92roJlDgGmn/Hf5HKB26HC1+8WTjiBGiiRg6E+lmVJf1GpnEqvaB
         8izA==
X-Gm-Message-State: AOJu0Yym+UzSL7RYcwA9yg8tDw/pSw3dZ+MhLHtHpTl+JJfJTfNw/3GZ
	qNDgeJqijDSOigDMpDYiLxcxw9mXnfeS50Oo+pgyNSmpO9BBJEYpQWlWLoRpeSl4G6E=
X-Gm-Gg: ASbGnctLQdivax2BjgZV6cfECKZW8nYMFBxsSLyJkhgvbbD4fDMDRWc/0adp+GFFv92
	T3SzJGczOx6VEWndcei0jIB9Dv952znump+hp+157vzFHfFnRaKA2asmmUwM4IG4t8TKRd4QdaC
	16rKGPisUrzpdTOw2GfStUPMaw7+Dm1LF2zETesVAy9ituVyCrHXNo2MoGXGAumzHmmhs4AerQ6
	USj4SBYe35ov6feajbwj4OTjZUNoE6vJiDi4BsFlFCjc1Tko6+lGdcJczIWh6ykuRhkoCAq6cBg
	ko+eK5VbW5O2I+zHXI3aW9Wv8BSmbo7g44pH+lHpQtwhVR08tBF94Hd30ZYCnzJ17nsHxGigyQ=
	=
X-Google-Smtp-Source: AGHT+IEyw7233FYYeEFBhbG1DmnWndFTQcE89Yo/ew7d0gNg3b/uX0RLSZbwsu33rmRds6xFsAeFYA==
X-Received: by 2002:a17:903:284:b0:234:8c64:7878 with SMTP id d9443c01a7336-23ac45c0f4cmr182206965ad.11.1751318151393;
        Mon, 30 Jun 2025 14:15:51 -0700 (PDT)
Received: from x1 (97-120-252-192.ptld.qwest.net. [97.120.252.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3d27dbsm87144555ad.256.2025.06.30.14.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:15:50 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:15:49 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the thead-dt tree
Message-ID: <aGL+hY7q3+R+v9PR@x1>
References: <20250630072646.23076119@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zu7H1/6luxU1XJuA"
Content-Disposition: inline
In-Reply-To: <20250630072646.23076119@canb.auug.org.au>


--Zu7H1/6luxU1XJuA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 07:26:46AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> ommits
>=20
>   66cba75806a3 ("riscv: dts: thead: Add PVT node")
>   9c2f4c0b2731 ("riscv: dts: thead: th1520: Add GPU clkgen reset to AON n=
ode")
>=20
> are missing a Signed-off-by from their committers.
>=20
> --=20
> Cheers,
> Stephen Rothwell

Sorry about that and thanks for letting me know. I've now added my=20
Signed-off-by tag to both and updated thead-dts-for-next.

Thanks,
Drew


--Zu7H1/6luxU1XJuA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaGL+hQAKCRDb7CzD2Six
DE0FAP9drjMFn2HMy1sX8aRa+8QdbEGvZBQ1GDrR/K+FqXKpHwD/SfuV0lXMb1yk
RlTPsnJEANaVl6hAf3q6y1Vl1iI7RQ0=
=Cq4Q
-----END PGP SIGNATURE-----

--Zu7H1/6luxU1XJuA--
