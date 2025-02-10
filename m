Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D513C25E464
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214376; cv=none; b=d8JP9jnHJFChURY1BbPglvaQQXMADgFaZMxNRWC2ezZLmoKBmqkH4FsY568ra6bLzHOnVelWsb/2aIgZ6naJ6ex+DtQMMpBiy3H2zO6U+PXKOk6TIVwW9zncVUh4QoeqHkzfzCF5oupqIO+9wAB9Z9mvuvJgGuMGhOZ5THDffZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214376; c=relaxed/simple;
	bh=BbE1NPV6pkAhM8QjnUZu8drl74MJljLQIQHTE0TQfJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNXqdrSINS4uYk+qhu7C6YQi2GF40MurJLPiGKMAM16we3vTXgwxfIjAOcL+lfzvh9UPW4jBAayXVmhmyScpH+wi1qHmSSeUTu7Ee6z964ke/vXPSutbH4IQZrRQVxvDLNgbNJXrSw6CC/EdEA/suUBmyTC7iWCYGMhHDHBfUgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=B4uYTsKJ; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="B4uYTsKJ"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6f9b1bc594dso27550017b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739214372; x=1739819172; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GQHvYxw9TC0a/hgF8QnKVxqks9sj1+2Y1os4NAgJLRk=;
        b=B4uYTsKJPuOqYyET0lzjHDLGqgc6OBc6cvV20CqkJIOxosUyEhIAXhxVsdukBWErBF
         555jleNEWX0MDk6tJO+ai1JXlZSDR2Hi3pgO+wyXu4QquC6RhWKZlVjkyMLGejuf+ysg
         1S5NhbWEOt3UZ/7ny4BZWeNdeVaxgMRH8XJEoNoCJ+uBab31cnmbK6rgjARh4oUN4rag
         9e+m9+5A/yxRVzQ1h/bOFqjMtIxnD2k5w5HRU6bDTj9Q6jCqOT6zGh2sK4GRjwdOieDn
         lycoMWtfuGOvSNAmiYwaesSCKsMWWhzMyEuBxLH9MJ25WuJeqb6UA85QA/cTUmK6GcvF
         y/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739214372; x=1739819172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQHvYxw9TC0a/hgF8QnKVxqks9sj1+2Y1os4NAgJLRk=;
        b=kqVdN/MQNZIrUPPWUTR62XLiU2Etp+66M3pKfc1rPmC5ChypknFQblz6FcSqH2Bif9
         XjYD+shu8cWLieJLbOdqnDwOFVIyelxsQp6FVWrYbBBN0RFgiOsQweLu6D87pBsLCB6j
         +Jf2tDqquluIp3WLAINVqhm5v/j1BttP5vjGKPOR6605H9svKzZBZq/te7k2h0v2bMb4
         ncb3JtKoRkyB5ovmCoxlgtqhHb/scgu+tZPfzsfDST9catYh4r65q4qRV+E6a4tATKtm
         8W1gQSfsdwYnixBHKalg8/x32hFIJ50sJlk99kQmL7ENv8bs9kF7w0td6qf0vM5aE4Tz
         4Z1g==
X-Forwarded-Encrypted: i=1; AJvYcCXiydPjutiZbhrNKdnHGTK9qrREOa5JLXUT1CwY7Qnc5px9N168+VUsssUHej1cJYlQhj0EneeFZ3gO/mY=@vger.kernel.org
X-Gm-Message-State: AOJu0YykM4qQMwPG70UrPZTcL7EQ4Tkzrv2SUWJ7uTFanpOyLFU5vRzj
	sZDWex+oyorukhuE9LJBGOk0TGVJr9KQAGjzsMk03HMtJtUijN2IZpjvpA8aPZIiMFArlx+5onF
	BdVphJfuN8cEJ5hXyKcHHGFJjsT/pkNRCx5gJVA==
X-Gm-Gg: ASbGncvzyFN9E0V4dYBUcSDpj0UErC/ki3IIIeAdBv4ETfSTLDR0YAlVrFXu/9XD7+Z
	xkeKR3LZXAxAU94fw2/fBqgXSO3P4ZfXy3ZAo4UF1FjEWpJiSB47YqUmZT0skT2e3ASxWWIkTXl
	NkZMd/P89pLL9RSdDOE3OU7S7aYIUl
X-Google-Smtp-Source: AGHT+IF0tZL586tW8GGxeKA1tKG8GTUu6ZxMVARFBs0eFcDGr5bElYO+qGMDJQAhG35dHcXOrlWVp0l/WbPydKTEpSI=
X-Received: by 2002:a05:690c:4444:b0:6f9:ac35:4483 with SMTP id
 00721157ae682-6f9b29e5926mr121879627b3.25.1739214371748; Mon, 10 Feb 2025
 11:06:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com> <20250204-imx219_fixes-v6-4-84ffa5030972@ideasonboard.com>
In-Reply-To: <20250204-imx219_fixes-v6-4-84ffa5030972@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 10 Feb 2025 19:05:52 +0000
X-Gm-Features: AWEUYZnA3pQgJDo0ZfsATW499IeRezl6cMBBmQLRAPfYQOID6yvwO8rhTG10ULk
Message-ID: <CAPY8ntC1-S6zKtDvmc6EgyxP+j6rTShuG8Dr8PKb9XQr2PeS_w@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] media: i2c: imx219: Increase minimum LLP to fix
 blocky artefacts
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jai

Thanks for the patch

On Tue, 4 Feb 2025 at 07:05, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> The sensor's internal ADC supports a minimum line length of 3448 pixels,
> which may be too small to use with analog binning, where ADC operates on
> two lines together. Switch to a higher minimum line length of 3560
> pixels to fix the blocky artefacts seen with analog binning [1].
>
> To keep the same default framerate as before for all the modes, lower
> the default fll value to compensate for the increase in llp.

Extending the line length as you've done reduces the maximum frame
rate of all modes by ~3%.
Why do we need to reduce the max frame rate for non-binned modes which
have no artefacts?

Default frame rate is a relatively useless setting - any sensible
application should be setting the blanking controls to configure the
frame rate that it wants.

The datasheet does list line_length_pix default value as 3448 (0xd78),
and 3448 is mentioned numerous times throughout the datasheet for
calculations. Deviating from it for all modes is a brave move IMHO.

  Dave

> [1]: https://github.com/raspberrypi/rpicam-apps/issues/281#issuecomment-1082894118
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 8239e7ea8ec03849b339c1f314485266d4c4d8bd..e4aa6e66b673bb7a8942bf8daf27267c2884ec95 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -74,7 +74,7 @@
>  #define IMX219_FLL_MAX                 0xffff
>  #define IMX219_VBLANK_MIN              32
>  #define IMX219_REG_LINE_LENGTH_A       CCI_REG16(0x0162)
> -#define IMX219_LLP_MIN                 0x0d78
> +#define IMX219_LLP_MIN                 0x0de8
>  #define IMX219_LLP_MAX                 0x7ff0
>
>  #define IMX219_REG_X_ADD_STA_A         CCI_REG16(0x0164)
> @@ -286,25 +286,25 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 8MPix 15fps mode */
>                 .width = 3280,
>                 .height = 2464,
> -               .fll_def = 3526,
> +               .fll_def = 3415,
>         },
>         {
>                 /* 1080P 30fps cropped */
>                 .width = 1920,
>                 .height = 1080,
> -               .fll_def = 1763,
> +               .fll_def = 1707,
>         },
>         {
>                 /* 2x2 binned 30fps mode */
>                 .width = 1640,
>                 .height = 1232,
> -               .fll_def = 1763,
> +               .fll_def = 1707,
>         },
>         {
>                 /* 640x480 30fps mode */
>                 .width = 640,
>                 .height = 480,
> -               .fll_def = 1763,
> +               .fll_def = 1707,
>         },
>  };
>
>
> --
> 2.48.1
>
