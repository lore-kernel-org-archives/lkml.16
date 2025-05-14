Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72E0215067
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259886; cv=none; b=FmZ+XvXHP7Yz/XmhbQDGN2z4BH5iBT975CpzYYucEzdL9mU9g5zdjC0rkNhNM6+D+dROhfFor3JxC6UE0HNgNGo6PTyMEi5z9RKCp1+dX5Eb5ASIU2TOCMHeDRgEKxeHvfc93awjBC0I5R3VHAXkfJQPthv5jAzB+VO/7RI0vqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259886; c=relaxed/simple;
	bh=Y0k6zt80v/NzClDM2+/2DtplJHKsCdpnYYoaTVipjNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYCPTWCW+vQI/42UJG995XM+VvL7UiPRzjO0Avvl4fug/st8d45QI/7w+bq+kCNj7BfMb9WvqLcBG0WX9OvWSj4++IHsCivEdFZqUDp3AtA5O7zHgO3Vh2ZQ/HyWsPHkejcBGzEKVcWxDFhThcVgLGVszpviy1E40R/hiaSIoCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=AEKEmHW/; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="AEKEmHW/"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e7b451b708aso228363276.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747259882; x=1747864682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cd3hwDzjEL8BVjWNpHIodN9KpUcVouQgmKQ6Ucvmu/M=;
        b=AEKEmHW/hvVLg8mQhMbspM92G5vZsiXE2KKqSDJYtAaspXQjrZS5ookhCyd+BNxw0i
         81kB/zOp9jd+l1nyeYTAJWcm7Tdywu7S75Z87Ude0CYOYjBh4++0nr7mMoVzvPDiiuWe
         jlV+3f901xMQqMOwnD7+KYrGNxU7+BL/Ysq0SkaMWArSp2shAYjs5tvinsasfZY57AL6
         ZvM2jtvD4dD5dcEVYYpfzii5xw1ykjuYlyRVmlmsqbimg/UWpwp/0HRTpnvW4qFV8/hi
         xStttFqJZfHfAyM5jonl4PlRRiQ/dGPPDT091ocHdj7j97/WWcokhZgMuTN4USrm2WiJ
         TiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747259882; x=1747864682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cd3hwDzjEL8BVjWNpHIodN9KpUcVouQgmKQ6Ucvmu/M=;
        b=pMZnSy1HsSON/P0yi/EoRH8XrTsWdBRr2/tuD/wed/6giQfE0Z2cuigha2XKvq56CG
         n4heDSSPUCi0gxUpzaiWAnoEQJyE09upoB0nQUYRIvF2PwEEybgXDSw6iJJUBEsb7/L4
         22K12uEqIZXi7maaRsbZognwdVcpD/Hm1hF5sTjr8eveYy6SdrNscuUbhoNwtN2hrDWo
         JCLduYbxrSpoqDj2+yOGNuZb6r0LFTg9JPJvHScOVGp2xySXvI/zCTf3sRuDqzQrcfgT
         J4CMeDCeqN70yvKh5OWZoOxvOH+eMcW2CqTmam2h7zSILsyHdJe2MGJvb4ng9bcVcFHf
         75aA==
X-Forwarded-Encrypted: i=1; AJvYcCWRmy+c1qkgiJcLWpLvNCyjBz7/Zto1IYT0YNTdcSkCA57vJlX9+e/DMpABk5DjlT/1riezo+UcVtd3sQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/rkcUFkhmus72gTmToMiW/xA1lUkOznyIOkLd/HRbTNZWhR2D
	hpCy71ETc3u2P5L9AIRxkMpR43TT2fBlIf/aiNhIZRPasr1uDWzU+2WXUywO2vVLvWoTgvKq1gz
	47QL3fPX9itH8gw4lDeJ884vMNfsH7OdoHry5
X-Gm-Gg: ASbGncuQpbmZH6ZSSOYpneQY35eqo7nwgKzJyqsZxZLXXfdzY6OMvaUkKIxRbtQ2SOs
	h4QD2YpfN8VVgd5dW4zJOR5JhzYqUqOjb6M8EsoVpT6y2ZAQg/OPhc12vP0fQhBywMPN3D5kwzf
	hShUDqKaItYP9iKqSZuyrIvIgard/H5Mw/QMpr+S4Sgo0=
X-Google-Smtp-Source: AGHT+IHAu8/NGifUGGvqy1muRemXjrNd0svPOPeQFyYnJTSpuDaE7BUNisyhGtBUb1e5c878a+beHwpBV6XXMuiK0sc=
X-Received: by 2002:a05:6902:114e:b0:e76:8058:a065 with SMTP id
 3f1490d57ef6-e7b3d4ba991mr6148542276.6.1747259882613; Wed, 14 May 2025
 14:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428190430.850240-1-ebiggers@kernel.org> <20250514042147.GA2073@sol>
In-Reply-To: <20250514042147.GA2073@sol>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 14 May 2025 17:57:52 -0400
X-Gm-Features: AX0GCFu-8Aa284A3Wv4qgq0Bn3X2NviBEUYoaX5YYoj-p-8WsCK_D4vIgnJJLjo
Message-ID: <CAHC9VhRL=Jsx8B1s-3qmVOXuRuRF2hTOi3uEnRiWra+7oQJvrg@mail.gmail.com>
Subject: Re: [PATCH] apparmor: use SHA-256 library API instead of crypto_shash API
To: Eric Biggers <ebiggers@kernel.org>
Cc: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 12:22=E2=80=AFAM Eric Biggers <ebiggers@kernel.org>=
 wrote:
> On Mon, Apr 28, 2025 at 12:04:30PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> >
> > This user of SHA-256 does not support any other algorithm, so the
> > crypto_shash abstraction provides no value.  Just use the SHA-256
> > library API instead, which is much simpler and easier to use.
> >
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >
> > This patch is targeting the apparmor tree for 6.16.
> >
> >  security/apparmor/Kconfig  |  3 +-
> >  security/apparmor/crypto.c | 85 ++++++--------------------------------
> >  2 files changed, 13 insertions(+), 75 deletions(-)
>
> Any interest in taking this patch through the apparmor or security trees?

Something like this would need to go through the AppArmor tree.  As a
FYI, the AppArmor devs are fairly busy at the moment so it may take a
bit for them to get around to this.

--=20
paul-moore.com
