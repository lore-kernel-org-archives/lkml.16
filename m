Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB72C2FB;
	Thu, 26 Jun 2025 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939096; cv=none; b=fUmZvFqgU+ZMakjwEzurKVCPytrG8QLZAE2ZFIMifSZp51e+0kjGLyukP1Uk4JtdmrTZVo4Enm7rE2XxIF7DKpat2CXNpmTe/V4I4Omc1cOR4i42WaYiK3dO2MKALVd6LmftgFT+Ur+xfX+k+Kawk0iuoFN2hgZg44ZJcmlYOtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939096; c=relaxed/simple;
	bh=VlanypWYi6DkuZeH7DXWPijDtve33MpM2UftEXp/Xnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qReBpx5gq3dC4EX8wLeccjbFIAUA5M5PmhzlET17N04iYBlEBN24H8NFOR4Yy1/27LE8WQYO9nxIUoHZ7LnsMd989Fu6YvMKxjSv6uBWQSCl/00xM8XZ7icvHWONr7R1EZowuH8SAy9l4FoRul2ROoyYxhE4FC54Qno7eyH1JwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWe/PbSN; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWe/PbSN"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b60de463so1013357e87.3;
        Thu, 26 Jun 2025 04:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750939093; x=1751543893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlanypWYi6DkuZeH7DXWPijDtve33MpM2UftEXp/Xnk=;
        b=BWe/PbSNEMiIrbIolifWtbIrtMBeR8vpTEnlJy3pIyBMx1w98vdlsKAoyKHNk8nzCT
         7kwap2ZgH+AYx4Er51Oc+5okcSjzp5gE31BVi57EB6OxhkVbiy0IxV5OBJVrkKei0Mlb
         72ZCs82BQVVwcMZRjRW/Tkjhbam+0nfQUa/6Mb4ScjdLLhwt+0pMf5puOvAyIuLK1FWb
         TxlZf8JKbUsfphSEFjW1C7VjTz9u4hAGH1UbrTvfkenA8rcVNUF3vonnrIAOXyoC6qCZ
         PRjyH4aVa6UAishkppbOvoK12i6zo4eZhe7tcWridPXcYXzA9ze39yQWRwAxDakS+eyj
         KMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750939093; x=1751543893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlanypWYi6DkuZeH7DXWPijDtve33MpM2UftEXp/Xnk=;
        b=WgYTtLsmjFiXM/Cs1qIzLcBdVOT8aLyilIXmcyM3yWXAjEDBJVjmyNl+tV+vcYERG9
         Wd9n20H1i85ilca3E7e1+KhNeKKZPf/9NkVmDBkM3i4NkLkhFd3Fyz9LOBDtuNvchIj6
         2ZUhiPsO/USfFIwq3H0RURyT7zBgZpDIWXzjZsFSRj5Z3kIpQK6YRBd8no3AsZvCNzRA
         7yyTOqNaf2Pos7oLOfKDAYS6qxLg0MmUb6ki6BfsG3XVTcQztOyrpaL5pTBI9wTA+SuQ
         dYP476X5lvj8gLPTk6K1CEvtl8EiiZ3xo9+tOOM/ugybwJ730CtHO0RRZjF41VQZRAAm
         L/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpW/mnaSGV505FD0qIt9syFgno3yQiUsNvvwz1OzRnq7dDZKoqf/IcAESlUbeBttnL8DVhSep72LGHP84=@vger.kernel.org, AJvYcCXmfl/SWfbd3QywhC6uTUNEkdnSROugqAf+ozZmKxnQpCkjCBRODHW0wyUeReHfGCOZUrEvOVTQC6S6KWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKy7BMXIizVRvsSLSa8zPbVOxydOidH7hs++VGVF/FI8fmWx44
	BuI6kIU43J+be4X/iJdXcIFpg5o+lCdDuFTToUUSkzvgRzirIswfk2J3UbWnfpN7X6NCGWstl6f
	OuU+dD8t56M/UDcf98hasSY8iTCLYswvtaA==
X-Gm-Gg: ASbGnctmSs/0XvLH93b1hcMKAlJO0aL5x5+vm44m/aq80wnW18RColo7ldHWqrsmPD/
	2KvoIUMuCzNE73mkEI3w920kOz+xu8d2xh2LlSI7UDdOHDrflXYoRLzLg4t68bgARBzsz8TKBe2
	jrUMMA/6TgNP/P3T4+nPCNb9SnvlxUO5qb67H9KopaIYs0ufuJbX2XWear7J2Myjl1TYSC0HDna
	IY=
X-Google-Smtp-Source: AGHT+IGvTmFBk5nT2DVIEmz05QGopwwqxq0TAa5dvxo3BGqE6HCnql9lFMU54ewp377mYOo49nC8A4/0Gx1muG1AmSU=
X-Received: by 2002:a05:6512:3b22:b0:553:3486:1d9b with SMTP id
 2adb3069b0e04-554fdd2e9ccmr2177274e87.30.1750939092502; Thu, 26 Jun 2025
 04:58:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626115218.141874-1-arun@arunraghavan.net>
In-Reply-To: <20250626115218.141874-1-arun@arunraghavan.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Jun 2025 08:58:01 -0300
X-Gm-Features: Ac12FXwhZEuK0fXt-9AZx9DOhPYa85XcfkJGgo_W0bWwT9VIbQev5B9sZrKJyn4
Message-ID: <CAOMZO5BgsU0ijdoaZs5e=qwb2PYZsEnx_RxfgQ+dosL8hPRKyA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: fsl_sai: Force a software reset when starting in
 consumer mode
To: Arun Raghavan <arun@arunraghavan.net>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pieterjan Camerlynck <p.camerlynck@televic.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Arun Raghavan <arun@asymptotic.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arun,

On Thu, Jun 26, 2025 at 8:52=E2=80=AFAM Arun Raghavan <arun@arunraghavan.ne=
t> wrote:
>
> From: Arun Raghavan <arun@asymptotic.io>
>
> On an imx8mm platform with an external clock provider, when running the
> receiver (arecord) and triggering an xrun with xrun_injection, we see a
> channel swap/offset. This happens sometimes when running only the
> receiver, but occurs reliably if a transmitter (aplay) is also
> concurrently running.
>
> It seems that the SAI loses track of frame sync during the trigger stop
> -> trigger start cycle that occurs during an xrun. Doing just a FIFO
> reset in this case does not suffice, and only a software reset seems to
> get it back on track.
>
> This looks like the same h/w bug that is already handled for the
> producer case, so we now do the reset unconditionally on config disable.
>
> Signed-off-by: Arun Raghavan <arun@asymptotic.io>
> Reported-by: Pieterjan Camerlynck <p.camerlynck@televic.com>

What about adding a Fixes tag and Cc stable so that it gets backported
to the stable trees?
