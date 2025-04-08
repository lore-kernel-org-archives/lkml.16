Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30521ADC2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103151; cv=none; b=WQ8v2D6JcdZFfxsArULwJKffufAmxG7GoOUYA9Hl1rusFCMHgjmHS0BeUm/fGBmqNrGJQ/4rU6b26ioNuA9xXg8ur6DXd1aCIzgVqQqglS3ePNNGn+PGuThVAW99KWKwHvfsi49WSCpwYc2JdJ9SPkxOvDF900OUwYlLRziHL3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103151; c=relaxed/simple;
	bh=9mAxb5feoE0Ny0tBUP8tdL4TkjKLrJVrOw57UYOVu9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UaMQZCTQ/KiLK+/xaqf87Km4s1Jcid03aCqrq/MGh5JfrFoALBjOMGX09dJi1aJelUYV9LRA/nGayKvA4vou5Cy5n9Je2281yy/WTd3rXInvdOmH7ROPnloFb0DcOOnd8tR4Q3/bVYj4F5vhKv1uHHCjArUH7ZCtbCJv29U28vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jCTCf3i9; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jCTCf3i9"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a04so57779531fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744103148; x=1744707948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mAxb5feoE0Ny0tBUP8tdL4TkjKLrJVrOw57UYOVu9U=;
        b=jCTCf3i9zkd10PSINjiYzd4x5hTMFv6cLHoTDAQ2acqfo71qX4tlomTDr3oCKabH+h
         KlXFS1ZwVodShezmcM92mTLc18FD1UFvDqsURf6u6kHni2ATIShRTxF4G/BKPmF6nUxu
         LY994FWsa36sh89WzU+PVmhadc2wA4sgJdEIIOPCfzjRT7hbYOuWQ5S4ZjgXa1wJ/hoy
         n79rM4CdkPLiZNxCoxANhoAoFa+4E5uAaGhQ8CCUwdiRlrp0vIpE7WYub4to1TsxRvXg
         T+D6IgxilpV16qUwUl/VgrYDGS5oisX+nABsuOMbXHm/SLFdrEPilwbjP2CL91Lz1NQe
         mMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103148; x=1744707948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mAxb5feoE0Ny0tBUP8tdL4TkjKLrJVrOw57UYOVu9U=;
        b=JvqaHOmJ76abojBcLoQBu5ZPRNGzb73hlHn07eA1dqaO7PN5FvqgcynUW9KdPTAB0G
         kfXP+tEe8wBwcyySQVs01pRHL3cD7/yKO1iOE+MVRB3qZJgMfW5kS5TXa3ZYXg25991D
         XyAz0eCItE3JDYilS8selJ/jQUCAV0wuCWEC+J2PoFErIexh7C3YhlY3QPqtN4FCe8Ug
         TsicRMcF7I8DxijgmhwwpO6Kz/Ak5e+2k6WnZnXciUVcv1b1t+OSUmGlHK2TbOB89/eV
         qtzqhSahbbqjFtt1sGAwwfcVpzIkWU9Mzzg4jYuEoSmPIknIoefOLZf/KORrtBV7RpZj
         vM0w==
X-Forwarded-Encrypted: i=1; AJvYcCWlQ9G8YGUbXixuoBlovZ/uFxRKPwmxly6fVXVxWu1lzcRupUAN2YybpIwxA8YkLTz83JLTtWG4PYeqa0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtVNy/cH7Ua3MD13kHRhtvXM56LWwhdO8vGtFtbvZ/YeBWVl1f
	pYx+Ge4j+YPimopyTG7MuHEJv3FmIvohCLj4Jsb6BEN2zeuSVQ4rgTX3rY9VdG96CaCQJyBsA/A
	Qm4saAbeLahk6kJj+6UYazKOwVSxTRIzJOEHo0Lj9bJlaYedj
X-Gm-Gg: ASbGncuzQ30exp59jEsvCFXSfas16Z/XKcaCl2XXVZV9eq7lmJxW5xGt7U9m1SZXLai
	mkCUxZaFMr6ZplA4WxPQKGTAzDy4zn1Ges8Bha8IoDZqnIt+KKqvUa3Xpxzf5HrUT6KBSvxikiE
	BVCgaXmvD+jj3eOfbdOFbSomrHKDRduXwK7hqCcFiaLtK9neCNGmuSDCMs08mTK2by1HvE
X-Google-Smtp-Source: AGHT+IGv7/tVX/9zm5BciYmQt4+6czjZ3tL8CxZuYRul1dMr4A3pb/LmiH2xn1ZK/3Wmk0LPofeOGGww9RvYOphOdWI=
X-Received: by 2002:a05:651c:896:b0:30b:d5ed:55c7 with SMTP id
 38308e7fff4ca-30f165b0ea4mr38935231fa.36.1744103147923; Tue, 08 Apr 2025
 02:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408082031.582461-1-jindong.yue@nxp.com>
In-Reply-To: <20250408082031.582461-1-jindong.yue@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 11:05:36 +0200
X-Gm-Features: ATxdqUHAa7UVbGoJunzY0xoW-ARJdBXka4xQ5saOkppnRcZ6txjqtbwM_fD_Y_k
Message-ID: <CAMRc=MfuHs=7vda2CaMzHfVDXe41TV3u3ezPmt38xJ9=8JD1sA@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: Allow building as a module
To: Jindong Yue <jindong.yue@nxp.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 10:20=E2=80=AFAM Jindong Yue <jindong.yue@nxp.com> w=
rote:
>
> Change the config to a tristate type and add a
> module license to support building it as a module.
>

I can tell what the patch is doing from the diff. I'm much more
interested in why this change is needed.

Bart
