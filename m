Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93E31917F4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745818618; cv=none; b=k+whjcmNEQwPXY9GQ/m8HSNsSXbdaDYJxa3Z2vZWdABfgBiM3W3qJA+5OaS7RsvsJxiPsHblEq36wy4La3FnWUKl7gqeDqQghpMAKuG5daFMK4F5N/Inw1EHdtf/sSldCes8q/FnNfCA0SvkVRaUGwS1fH3i6ylrurO3upBhRx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745818618; c=relaxed/simple;
	bh=UyBUln3dyMPnUouVES8zGryM/J3iqSjus+mRmlsJreI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plpc0F1GKWWjXByPwhPQT1GAj1pS55KNuiFMos8hxz34P2049bcxeGhQ/aiTowyGU/1i7WEj1Rigf5dRu/Q66EbwRiteUKTqCRM6l9SecNXGOdJs/GAHBnRyV5roldeXT+ZEe1bvktFeXZ67H4cFeSRvb/WLyYmtMCTta0d3fNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M0KwnD5i; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M0KwnD5i"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72b0626c785so3936635a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 22:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745818616; x=1746423416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DgXzVkgKs9qu56NnzAnpeis7CjshTrDPwgTt5feY58=;
        b=M0KwnD5iY2SUXL4ur5XSEhnWHmcu2esRCo+ZWXroY5Z5RlcHBTvaLdAbBwwoeZQToR
         SLb1lvI3Q1DIb5VSlLLoKj5zMuzgxDbRMAMN+mdRkVypdcqaL8pTbd63ZJ5qlKENIp2J
         jFOzR3P8+HohNOtEZ8dJqZYd6k3G3K+TZ1mgo51XrIf81jLgZZk5fiy/qMpSXbd/wzEd
         t7YpQduzwrx2/3gy+JpUayRzghQ6gIM4kOnxHq/Upgg6vtflS4eT+1ZmFnbODIZoFGpb
         yrDqYZkBFc/ffVpEdsCgIEbMgHjWtS72dj7meUtYc5gHRdw/czabPQxUUa5i9lTgqRo1
         pySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745818616; x=1746423416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DgXzVkgKs9qu56NnzAnpeis7CjshTrDPwgTt5feY58=;
        b=vc0QVWzb3p0P5z1cAv3Shy1CDGKkBOeHmbIZERRJJXq/4tQPvHuh61wLCD5JaHKDly
         Br7BhtdIt08/qyPpVTaQRGOvrZJhAFxjBmUUl/nxsPvwpzOtgBfQrANoRXXFsFLfg94s
         h7xEfdEjiLCA/3nx2dpgGwQOHaUFsGDF9cuJUDObyxdHUCt0pHTVuBN2iGLDz2YA2L0O
         88+3LvJDksEheaasT6IRGtFUDRo/G/u5wCHMA4HZPoxHbobbeehBu5y9/RiMaNJ5XGXa
         m/0LX2C89PSKjhCnQxnDGCW99I/n9tbRpG1YLxrNhSdqYzCVhAGLPj3xt5vJ/vMvU8n2
         xl1A==
X-Forwarded-Encrypted: i=1; AJvYcCXymXxpemky2EFNa5/GxR66ikA9+4h881xKJQPDvKl/CoSyq12gXn9yODJf7Yr83256/fi/tIt+RWvd+W4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEOYrCj80ONmYIUZ62QyLkXxpvLPvdWYtEW44Qm1m5qzPiG1pm
	Mp/Bxnq2eBSEWrlz1ivE1OZBjK91GT4xFm0cNI44u8/pfqc8RUbGQ7XUYOzsb9MQ5lG4Sn//KEf
	fhiH2WQq4/9Bw5rYcZmfugENfTbQDWOgLjUg6Yw==
X-Gm-Gg: ASbGnct89kGd6OoT8m4y2wtFldtkvYyxOhv3JMdhSRjVjngTKiXBiyvh7+f/92YNBgj
	L89UXfMlFBXTPIM7CeqjMJMm+WSqHeD5zKl8DqmzHV6SnaqGDTAXoC27spgKu/lfUZp6U7hpqGP
	4qqdbk4n4QG7MPDa98CtKbmtg=
X-Google-Smtp-Source: AGHT+IFEAZRIecQs/5ho+4sdlKzcEtjRPiPl9mzAhAZQHqaaoNOnH2hh+V1py6BPhNxKIAQs/+qQPSSCiOojJ3R6MFo=
X-Received: by 2002:a05:6870:5687:b0:2c1:5fe3:22eb with SMTP id
 586e51a60fabf-2d99d7db482mr6183589fac.15.1745818615556; Sun, 27 Apr 2025
 22:36:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410075635.3558712-1-nichen@iscas.ac.cn> <aAnD4_WXl8gE2bGv@sumit-X1>
In-Reply-To: <aAnD4_WXl8gE2bGv@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 28 Apr 2025 07:36:43 +0200
X-Gm-Features: ATxdqUH8ERKDgz6d1jsWVyzs_lZV-J3m6BSoYXzVYfGcYlIFSHEr6PDO1MdfDa8
Message-ID: <CAHUa44EHpcn8g0Cg-nvg+DskvbD5PZzEg9b7N_Uj4VGF53NF2g@mail.gmail.com>
Subject: Re: [PATCH] tee: optee: smc: remove unnecessary NULL check before release_firmware()
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Chen Ni <nichen@iscas.ac.cn>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 6:54=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Thu, Apr 10, 2025 at 03:56:35PM +0800, Chen Ni wrote:
> > release_firmware() checks for NULL pointers internally.
> > Remove unneeded NULL check for fmw here.
> >
> > Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> > ---
> >  drivers/tee/optee/smc_abi.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

I'm picking up this.

Thanks,
Jens

>
> -Sumit
>
> >
> > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> > index f0c3ac1103bb..26f8f7bbbe56 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -1551,8 +1551,7 @@ static int optee_load_fw(struct platform_device *=
pdev,
> >                 data_pa_high, data_pa_low, 0, 0, 0, &res);
> >       if (!rc)
> >               rc =3D res.a0;
> > -     if (fw)
> > -             release_firmware(fw);
> > +     release_firmware(fw);
> >       kfree(data_buf);
> >
> >       if (!rc) {
> > --
> > 2.25.1
> >
