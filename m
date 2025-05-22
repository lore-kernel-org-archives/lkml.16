Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3206A1F09B3
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924000; cv=none; b=DNIn8WdHBh6xZwWs8mP5XHaKQIayu6zrFBncyQJQ5vfGF65j1jsOss4kUdhY/ROguOK/iKoN2vq1g+SV8fDp0bt+UAK0gLA4jCEvx+0a2/Zx02Hzw4+0fAR1B2hW/XfhNHmgIeVMe19RMpB6hiH0xdiAtNGQDXGL2Mupoc8D+8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924000; c=relaxed/simple;
	bh=pFm2zIvgiBGcCdXpksFzoUZ8o0UGo7b59ZsWH8nK9Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adrpsEtpZj0Zqg8vCd+EvzlrPmXa8R96sFZj1uJTvm2njFWnTCMHY5LrgN9/bAu893slb5w3K1bHSsBMC1TMi4YWub0zKFNqIvFb6p1ayYqbz2qlPmPCIapE/ImcZRu7GIyS5qMVT6rF3kyCYnTPaWwFzaTKpFtHMLYr2spGG94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYe6PKLP; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYe6PKLP"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2d54b936ad9so2887905fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747923998; x=1748528798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/A33PMiQZi7B+yBG25G8T9Mv2qAG7AQkcIksX5iQLc=;
        b=GYe6PKLPbjM/rZAB07UKobEsI/dYaEf5hSxlEQpiR97jrMFQCDAEhyDfsB9Tvs4dyu
         UoEv5mbpxYmLmMDfhg/ezdR827THbNeZc4cxslMe+aDV0JjZrWPmBvhgy5lUzwE9CpcJ
         7oQX07Qt1GhfifqwT6bnucOWCAzHHi7oNZ4+U2KkNX1VHg474z+kXjl/zownaC96qqq/
         yzU1WgtvgRA11UEGExSldIRYpzrqeRlZpk/ySzk7T1U6m5rlWSU8/74GsR8IsiV/DTH+
         rRigdxa8XX6yJ1PUHvmK1h8iKLOMs724Xhlj564Xu/0cxdOYheVEQEM6KhQpohukl8c8
         3jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747923998; x=1748528798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/A33PMiQZi7B+yBG25G8T9Mv2qAG7AQkcIksX5iQLc=;
        b=NfZMxD8uyiez0wuSR82kLIlKF5ygnJwrusyNMuJb7dsMTVV7vdrGu4iXiq41mPf2jH
         lfu71tHP3q+ei6DHza85hGCLiJPzWaRiA5uTgFr54dHPLQTVwdfVk/X0pFQyzq2EP6In
         +ymuh61gQaMrxVU2v5XrCXsSO3LrG7xkdplcy+jnQhNzxQBrVrTO8Jea3AsZcJpoV5mP
         1YS7zfmE18A7m/fEexQq9tMw7V3U2bP8bcyebWGDNWhIDi7JyznasuoKoan/iApbO7jy
         z5221vGXj6nzO9XXwqVnsi86MG/DL+cOMsjA9HD5O5kPepMBZp0hNYpX3L9XtF6NJRf5
         E4HA==
X-Forwarded-Encrypted: i=1; AJvYcCVcgNb4TZ7Rn4BS74+nbwbsX+aG5Hqqg6br/IFWSpvuG2cuW4lf5nuH84pOzRxcO4+PLzZFE5rLT0AYtcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrI7kxv1HvNn4Xo6QNIi503X9T2hqhhBxy+LjAUV7dqoLK3eWY
	GjCEYriWOZxtknynSKNg8k/HYMHahbeeAcuIBTknxLMj1QZWxJ9DYxXOCZhBX3eGLYAdzq/yIDu
	lKsyBO28+FTWUhddgJaOjc+0hwuTSll8=
X-Gm-Gg: ASbGncv5jTxnhsxZfLsiVMI8X6vx6vNM2iIwdWto1w93Yat33CUz/Yy0PTQ/tjLayZj
	HSpnr5oCp6nDmuQahOTl6pG1S+JRFm+SvSzNLC4Rhd3EjDNf+Enqnn5fs49orHlzDHpaQhgM1OB
	wIOYDmjPj/FXL4Mtv4uEJMcpu0TFUpuu7+jA==
X-Google-Smtp-Source: AGHT+IFasGXYJwj7OJUMsTUB4kivLSdn/44D8WhpmTf+mhlWsPkahY4qS13v4kKGGOknI5Fo1nq5EbXL83EaOftSvd0=
X-Received: by 2002:a05:6870:9e0d:b0:2c2:5b08:8e42 with SMTP id
 586e51a60fabf-2e3c1ed9f7emr16579212fac.27.1747923998032; Thu, 22 May 2025
 07:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 22 May 2025 09:26:26 -0500
X-Gm-Features: AX0GCFtasETiZuNGdlMvkRCVQ4E8fN8ZJu-KkF_A9xx8QyFPXNOI67oep8lmyZo
Message-ID: <CABb+yY0dqgPhe5_p+=cyRAbSwSL+qCZXV1G+QQ2kQh7Axh_7Tw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: imx: Fix TXDB_V2 sending
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, mailbox@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 8:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features several processing domains, Cortex-M7, Cortex-A55
> secure, Cortex-A55 non-secure. Each domain could communicate with
> SCMI firmware with a dedicated MU. But the current NXP SCMI firmware
> is not a RTOS, all processing logic codes are in interrupt context.
> So if high priority Cortex-M7 is communicating with SCMI firmware and
> requires a bit more time to handle the SCMI call, Linux MU TXDB_V2
> will be timeout with high possiblity in 1000us(the current value in
> imx-mailbox.c). Per NXP SCMI firmware design, if timeout, there is
> no recover logic, so SCMI agents should never timeout and always
> wait until the check condition met.
>
> Based on the upper reason, enlarge the timeout value to 10ms which
> is less chance to timeout, and retry if timeout really happends.
>
> Fixes: 5bfe4067d350 ("mailbox: imx: support channel type tx doorbell v2")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/mailbox/imx-mailbox.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index 6ef8338add0d..aef8d572a27c 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -226,7 +226,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv=
,
>  {
>         u32 *arg =3D data;
>         u32 val;
> -       int ret;
> +       int ret, count;
>
>         switch (cp->type) {
>         case IMX_MU_TYPE_TX:
> @@ -240,11 +240,20 @@ static int imx_mu_generic_tx(struct imx_mu_priv *pr=
iv,
>         case IMX_MU_TYPE_TXDB_V2:
>                 imx_mu_write(priv, IMX_MU_xCR_GIRn(priv->dcfg->type, cp->=
idx),
>                              priv->dcfg->xCR[IMX_MU_GCR]);
> -               ret =3D readl_poll_timeout(priv->base + priv->dcfg->xCR[I=
MX_MU_GCR], val,
> -                                        !(val & IMX_MU_xCR_GIRn(priv->dc=
fg->type, cp->idx)),
> -                                        0, 1000);
> -               if (ret)
> -                       dev_warn_ratelimited(priv->dev, "channel type: %d=
 failure\n", cp->type);
> +               ret =3D -ETIMEDOUT;
> +               count =3D 0;
> +               while (ret) {

Maybe    while (ret && count < N)  ... esp when you already increase
the timeout from 1 to 10ms.

cheers.
