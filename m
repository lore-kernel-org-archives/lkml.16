Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1D02EA17F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619667; cv=none; b=mDwSkCnriDKQNlO2vYKieoW3UR04XYwbBu/lu4paFpl5CLAyQce+HfHEBMy+3lhAAqppQkutaAzXeFcxsp5VW1xUfrkXaZRpxxY3H+Bmqu4rrHGKyYYnJ/W2yijHgtx7RZEOf+ACn4+hSovZkJwl5C+P10+2+MJuITkK5b7Qw30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619667; c=relaxed/simple;
	bh=f01+/+d1XLTUFc4UC8xyL1lZLSP86t0bF3BHim2xIzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFCeI4vHic8+s79HJxhKUuxOmi8ctbxbO4DS53jCcD4LP5jeEwfCVFCiiJvDUhScVZblFM5Q1WLCRs4g/5cI3dpkWKtoJ6j/9JaBban+bbf3dLYa+pi8ClvcqHomYBs9y+WzFKJAJCBCtDGi+XC7Qy9hVe8Cvbk4jqxKTXsVr7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QXqQ86eB; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QXqQ86eB"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b5165cf5so1042068e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751619661; x=1752224461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGg0wyJ8KAmIjSaK0H/nMj/AJ/mfSEWt0jqoZQ0jjqU=;
        b=QXqQ86eBmboWyCN6XgvQwWiwVMY6iFtVfzqteDuAe/CKQ2SXm2G0jO047Jg8SsvIJe
         xaBrMRZ32PoUpF803zSeiYuvp8Cy8RtCvgK1rxyf87sgW9+i2ONoIOtAEKX/NH7dTQnF
         vr7cbVy3ycQlmdhK5THoOtEndV6pV7Cd9ro53p9s6HT5xuT8A3t7IjOoez9DM1GD9yzh
         RpOXUcEpkriQrLMBTM7rZYruvVsE6ewGQHCLtL9c4NruDVp6D9NPoJ3NhpCJMx6C83FM
         9AO0AcVlXTwxqyNGqETMRNRPmY07GsKrpsfuSMm5dy2nU8AYfBZaE+bYVadLZ+tfbpEj
         rgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619661; x=1752224461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGg0wyJ8KAmIjSaK0H/nMj/AJ/mfSEWt0jqoZQ0jjqU=;
        b=Tk4IRBxzez4Mx1OTIf1GgHWIjvtyeRju3ZvrAWF0pD4fzJbvgEETCQhXn4t7Gd7NOw
         32bH8ijJSvizV2S3Tt3CpwnurzZJUFL085TyuMlKqjDv5u1k07KAbwz52B97aDEY875Z
         N42kPwwwPcuPFJVYYuUfDdvyror8zMj/2zcmKe/wD2oS10NXH6qruR3Q1a9jWrXMGCWH
         Qhy0jeFM1vzYQ1S01fkgaUeped4iCHVicWPM7/Eb3rI3HNi8Y5ewh/4ViC3VhR79srkL
         ta2ayvfHb3cz9SGqJkOf/Ra28eGn520J/k6BDLINtFpHMgjctqMudAUdMjM47tSGxdxR
         9J2g==
X-Forwarded-Encrypted: i=1; AJvYcCXPYtv4g3pcsLAmhgLm8RN9MhP3P68ldGLF3U1Qllu7VYMI0mbYyNsWkYUQ94ZjNqMKeZ8bVKGm+C/ctdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdstOQ4ft/8Txoo45Sru6ggaU9+0OWeqElycRrayoZIp5DiB8S
	1ATDBiMQnuRX3IMHDl4+w/+D8URPyhTeaYSkN/t6GPGVCk4CGMTIU/19/mC+S++2YM7vVaAskFI
	1/jlBtSVstjhjRrswALlXq2KaduS0DsGbtEggUL06cA==
X-Gm-Gg: ASbGncv2HQFHJy6I3ot3Y+4mnwBbOViiUvkgLdLmwDczFjBRArpuxzbNMsyp9wJJ+Eb
	nlO4QZ7Qjo9ggj701+PTODLfXsguLTNX79f4MqeUGqM7GeWp4iziKS562VAlB/8GZwzWHIjtHdi
	nzaxIssvQV68MIBpPc6bAp/gvYHX047DBhbt2aMVDKepv/yhEtOtqdBZFjlILEG72gEW4M1bQbm
	g==
X-Google-Smtp-Source: AGHT+IE5A7Qpn2fHe3IyqjqEzjlqNYNE2mHbcn3t6AEuEEL0CMWc04hr2ZJMVVPzs0NtOe/o/dX+X5us1ObF+NrmG9A=
X-Received: by 2002:a05:6512:250f:b0:549:8b24:989d with SMTP id
 2adb3069b0e04-556d05a738amr570751e87.0.1751619660444; Fri, 04 Jul 2025
 02:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704185641.430ae617@canb.auug.org.au>
In-Reply-To: <20250704185641.430ae617@canb.auug.org.au>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 4 Jul 2025 11:00:49 +0200
X-Gm-Features: Ac12FXxCBYjNfFP1OStTgTeGYx_69fDp2ljdeAPPq9NLbDE6_W7nIeVT6KMWz8g
Message-ID: <CAMRc=Md7Znq6Lww3-i+sRW1LZMD78s7vnVYnDwVKQsjn7OMhvg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the input tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Lee Jones <lee@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 10:56=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>
>   drivers/input/keyboard/adp5589-keys.c
>
> between commit:
>
>   43a8440f3969 ("Input: adp5589 - use new GPIO line value setter callback=
s")
>
> from the input tree and commit:
>
>   3bdbd0858df6 ("Input: adp5589: remove the driver")
>
> from the gpio-brgl tree.
>
> I fixed it up (I removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>

Ah, I pulled a tag from Lee's MFD tree containing 3bdbd0858df6
("Input: adp5589: remove the driver") but I don't have 43a8440f3969
("Input: adp5589 - use new GPIO line value setter callbacks") from
Dmitry's tree. Dmitry: is it too late to get an immutable branch with
these changes? Or otherwise you can drop 43a8440f3969 from your 6.17
branch.

Bartosz
