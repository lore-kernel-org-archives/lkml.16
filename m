Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D79B1DE88C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749533538; cv=none; b=OKLIu6Amt/FeYYzau2GRTY9MvfzZBLUAsujFvALsRpizZJTJcsO7c1nu/6HQzmMMckGytWaVmaFM3lZhp/OK2G19adBLbjmH76o9OUuBYIppy+2WoTQXqNimbN9W10PAz9aZvJkeRi0ALcbBsBF7Gl6KjLONBp1TUTT/m1TlOoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749533538; c=relaxed/simple;
	bh=bkLGiVKpyRVpOWae0LVc2RcV5SRuIpPHHWDbzjnIBls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C8GAnyyqSDe4tOY/enfGYEfJrX1qoDf1nNqLczhCPN8IazhlwzE8Vx2AuOB7bQhLLhzqPxqUc5sgj/+wyVBlFFs/MmOA9szXkt9mUrD2FpIIieyJfhdBoL2dPyaeWoEtMwZDjBUUK/2jgTXflo1Qp4kNe8GglWWBX7/GFjKCoHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsyNraDk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsyNraDk"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55365c63fa5so4269275e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 22:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749533535; x=1750138335; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufN8SLcw2uf4mmiSTDCAru3Hk1Hxw6TngZ9JM+GMlRI=;
        b=RsyNraDkDbmkEcHGOQzaz5jP7ad8je+s6e4cojHjSoFbNUqAxYS+CMXLtjuFPROUsf
         8zkPx7Tfe2bWLHS3/8adgXfltOvV7zvEigPF0czubPYjTfhG+UGrQvtxf4UYZa4OqvVw
         LO4+wFwa4o1khEI4/9TY1T87YeByYfDIhwB0mcOEBRCKU7YE1MeV+7xZfwFLfV6s4o/b
         mFCC0riea52FufyRl2u6fVOVahV1dkkY79ZhKtiTcBvQ+wvg26ZZAUV5FJERwpFh1GMC
         ByabjWmZEd3OkcV3x3L79Tj16OIacS92RbYw3xkw5TPbZ5HS4InUrMZz5ZVSpbX9iyQy
         5QYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749533535; x=1750138335;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufN8SLcw2uf4mmiSTDCAru3Hk1Hxw6TngZ9JM+GMlRI=;
        b=auhG4Bch30M0s5ygxhiDWgm6v93Put4V1yU3pdr/evt3bt0CsXFf66c/wJvQN0rvBP
         cDtVlprAWgDoAZuxjTvQjDCzVcWdvs53M5+E3Wu/0y5nBadAvm33eUKK9wUhV5MY2yho
         eXK8Qb0fcXuLex1u5B8cP25etXEhs8RAO0LSCV7iYvKbPYsbaS2noxvsWBgFqf7o11Wt
         t6RiKVY3D6CD7jIJFJzRTWxsmEjL1nFRRPb8dOs6y/a3p7kLaeHo+82luSKiZRwQoSQY
         0QVhpnIPe7nJ4+ojfPbpHZXUVDfKEavUnHEuUdLomjkYhQsRXg1i/qzm5WGtYLdhMfn2
         TV1g==
X-Forwarded-Encrypted: i=1; AJvYcCUIIWdvu+Q8lxYJtvg4Ri1TPwxvmocp/d5HnpEQEYDc0v1MOyxGJGlla7bYBSEjtkzBjyt/UMWxNw88en4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+hT/NU9vb2hziLajdVZ/LIMm2oAem61U4JLhy/KrTvY0EB5MH
	QFKhOYwQJ6B28oTJPkjX2v/tQ2eCVtydHAV+Iv52s5XP4grSHl/+WCZ/
X-Gm-Gg: ASbGnct91f7TdO8LJT2TI1I7LTLjnGhXUc2+N3XrPkQ8wKvFUmNoLnxj53IbRKmfIIA
	r1Xx+mQmVhRbgmsUbjrjWJ2p1ae1RtpXEm2LIwBjLRhT5FFcX8fGCmbBjutYgFrU7ACrz9v1l49
	gm8NJE2kUqm948IDXfwRgR40yzW7qXo28UJn65FsKP0yr2j/q10F3Kc7UboD1SedIA1F+k3WLlx
	G/vwrBK/le2usw9/NalZk45wSwi15VrJKjpQ6N4MPONMdSqqY3AnOrMRx5oGIcL3HY5JtgnjS/j
	YnmDxaKQPlW+5D9o1yWYim4ZRy+SQy7MGPub0EFxAbb8lZAZXmXXDbHuHma7JFxPAq8z
X-Google-Smtp-Source: AGHT+IEJiFnC2gfQ7Sh6XXLSq6SfZcT3l+x+Jl3yiVsEeEg0mS3ROoWoY73IjUwsWREQ8yqDSAbbCQ==
X-Received: by 2002:a05:6512:2242:b0:553:3892:5ec3 with SMTP id 2adb3069b0e04-55366c354f4mr3868020e87.46.1749533534242;
        Mon, 09 Jun 2025 22:32:14 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772254dsm1410567e87.111.2025.06.09.22.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 22:32:13 -0700 (PDT)
Date: Tue, 10 Jun 2025 08:32:06 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: bd718x7: Clarify comment by moving it
Message-ID: <a90cb77e66a253f4055bbb99672dc81c7457de66.1749533040.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H5wfHmrPnWzjcXtx"
Content-Disposition: inline


--H5wfHmrPnWzjcXtx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The BD718x7 needs to disable voltage monitoring for a duration of
certain voltage changes.

The comment explaining use of msleep(1) instead of a more accurate
delay(), was placed to a function which disabled the protection. The
actual sleeping is done in a different place of the code, after the
voltage has been changed.

Browsing through the comment and code after the years made me to scratch
my head for a second. I may have figured why me and so many fellow
developers are slowly getting bald.

Clarify things a bit and move the comment about required delay directly
above the sleep. Leave only a small comment explaining why the protection
is disabled to the spot where the logic for disabling is.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 drivers/regulator/bd718x7-regulator.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd71=
8x7-regulator.c
index 1bb048de3ecd..e803cc59d68a 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -134,9 +134,19 @@ static void voltage_change_done(struct regulator_dev *=
rdev, unsigned int sel,
=20
 	if (*mask) {
 		/*
-		 * Let's allow scheduling as we use I2C anyways. We just need to
-		 * guarantee minimum of 1ms sleep - it shouldn't matter if we
-		 * exceed it due to the scheduling.
+		 * We had fault detection disabled for the duration of the
+		 * voltage change.
+		 *
+		 * According to HW colleagues the maximum time it takes is
+		 * 1000us. I assume that on systems with light load this
+		 * might be less - and we could probably use DT to give
+		 * system specific delay value if performance matters.
+		 *
+		 * Well, knowing we use I2C here and can add scheduling delays
+		 * I don't think it is worth the hassle and I just add fixed
+		 * 1ms sleep here (and allow scheduling). If this turns out to
+		 * be a problem we can change it to delay and make the delay
+		 * time configurable.
 		 */
 		msleep(1);
=20
@@ -173,16 +183,7 @@ static int voltage_change_prepare(struct regulator_dev=
 *rdev, unsigned int sel,
 		/*
 		 * If we increase LDO voltage when LDO is enabled we need to
 		 * disable the power-good detection until voltage has reached
-		 * the new level. According to HW colleagues the maximum time
-		 * it takes is 1000us. I assume that on systems with light load
-		 * this might be less - and we could probably use DT to give
-		 * system specific delay value if performance matters.
-		 *
-		 * Well, knowing we use I2C here and can add scheduling delays
-		 * I don't think it is worth the hassle and I just add fixed
-		 * 1ms sleep here (and allow scheduling). If this turns out to
-		 * be a problem we can change it to delay and make the delay
-		 * time configurable.
+		 * the new level.
 		 */
 		if (new > now) {
 			int tmp;
--=20
2.49.0


--H5wfHmrPnWzjcXtx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmhHw1IACgkQeFA3/03a
ocVyjAf/fMLHEyLqvtA+MvTXCYOVcwSj8mlMB3gwar519A0wJGf8PG5WAUCymHXD
avM3sQvaIhKJHkl5IAGmof0hNTQBbZrpeZjgPmvJVcw2KjscXlSon/kRjJbEw8mt
o4qOJKUt17tubptH8c0nEairKl2teUqRJFedjKiQ5ZjnRJOmq3cdkoPdG+mKDZ2k
xkr7zl6nV+pBAoQrPMBy+4H7aFNQI59c7gUavbnNfg8uJJlxRcXNs5yTxASbFSRv
4E18Jy2lYUvkMnL2B+fnGxZ+1Wxgd8jybN3uUXha5b+fH9XQCCW0jUibOrt8w+R/
KZUyFnEN1p6vbClDPkxpbhCxUnFuZg==
=cJqQ
-----END PGP SIGNATURE-----

--H5wfHmrPnWzjcXtx--
