Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CED28F3
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747894095; cv=none; b=LbDXHe/VyZaw+wWyGJicsF/ZNtD/w84dLFVorWzVXy/E3iSKTCTQ4Dz8w59LHXKrOLiXSOxKRDvzfSA3w1EFnqifIKW5LH3bezEuz0kLroiFiETqZ/xRxUWbl2AKK3elswy9DM5Xn31tR2zQMS/j2sCC4xWAX7717Z4+6Sd3aag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747894095; c=relaxed/simple;
	bh=1E/r0oyI6fmkvpJ5TQ6+ch48sHttRVAa4ut8aFDXwPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2RQwGhvmoN2Slq4d0PKwo7qSWIcDFhWFBktRXjomRUS3VrEHtA9K0Nb42dho/s9jHzL4AieIfuK1wbbrzjlPFV9zh82szSHEl/ZtBUOHCP9KY+LOq3h1p6w2JGPDKM0WvSR8Ou5xy/zZc6bZBEWos/SwrqWVTrHCrQVcNjinvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klZqbxmP; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klZqbxmP"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-afc857702d1so6586677a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 23:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747894093; x=1748498893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U36H2wWEFauYEEMSa49AZxUwXKu8FeN0HzMSY10Qhpk=;
        b=klZqbxmPWB7RgnyJ5I6kGjrgmrCY4bMVGPdsG+sKC46nvg094bd9kvzSExJwI9KI4B
         VgKscs34hXoriIKeXBPtSVV2aaP63O3AP3zV9UcGkrbqPoEjAsTz5MbQJvgG88aK+B97
         OjnsD82aXpkNTXv5dM38q+0iW7zYgj4cuEJjS4EGaxhMX4OhwB95GZtCv0Ke/znwXF4X
         lmU+W6ZkumiRXH0JOZRqsBSCc/9HddWIRpOwPVV4f1jXN07+3ojZDwOx0eplPzZo1ZpJ
         LG/mYUvFJnpJNhj0XHFASJTit5yMJ1LhkghN6sXXx6AZGSLP/GgX6fcVmr5XIQBvTYFw
         XJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747894093; x=1748498893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U36H2wWEFauYEEMSa49AZxUwXKu8FeN0HzMSY10Qhpk=;
        b=kOebSm7nH/+d/ON4g26mrwu3pu3jpNR4k+zOXqcDiHef9YyHhzSOjjMraammoiHpba
         VU6DOWF5adG1Bs3h/NfrEgUOMBQ6KannBIjIAaY9HhiGbzwziuykIe3X4tqPCro/R/pD
         IJC7PZRMRi4qCEcciyTjHHuo0NKtnIGWfzMwIyMzHMtwllgpv4chGInss2ObQGLIa+65
         yskrOjpvRRjuLLqvdw8IptVk/dkTia8ed7sx61etcg65h4KM/dSXk+5BLSiAv1MTAWLO
         kLzDciyWi1DlhjUeXinLHNK3P0Em/k/icpDzA/B+Ttt8yKCbzgM/f9MQ6AVi4M9qcCdK
         8y0w==
X-Forwarded-Encrypted: i=1; AJvYcCXEfj8EYkkE6PdUoIgVJ4Fmbyp5ktsea73gciKrcsabScSJ+O9qVpYi8AkhV/X2XjzNWsueldZ/jw5u9Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOPklThjg7YHsiWPXFY3kT12dYM6C8GTUIb62SbEKRAaCtaxyt
	iT92WyRokKsG+lEswZeVWtMeloRho2wwLTTZdEPgpZ/nglgQ7dNKGRMpHzOFU+w/nkINpQKag2W
	E2v3v6ZsI+ctrTx8MkGT8DjhJ30JY1q8Efw==
X-Gm-Gg: ASbGncslK0dOr+A6cDPjqdukYRYpeBQnGfMdh2zQkiw+FPvTff3CojkkCrHSJo3hf/u
	uhyQsAaNQCRdX/ZpXZgPmKEbPG3E9YIElBboESs7GBK5uiNVNMYFinhkIWH+GsoMlUYs0bfYtrn
	+o5ZW+oSnHWSJILDjcAKuuou3hgo7ARw==
X-Google-Smtp-Source: AGHT+IE9W3/67pyzzG5bsjEEBnH07y8AiipEu78C3cAPr2w5kuaSHv9IVxPhv/H5TnGO4GqzACkRex6QwdqPxvVJFyU=
X-Received: by 2002:a17:902:ea08:b0:220:c067:7be0 with SMTP id
 d9443c01a7336-231d43dca32mr284472635ad.6.1747894093371; Wed, 21 May 2025
 23:08:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 22 May 2025 09:09:57 +0300
X-Gm-Features: AX0GCFuVRNCfWGnfZ558VOZX_-jhCVuZC7ziACuj_BPkZuPzMGG-o1p_cqn-_zg
Message-ID: <CAEnQRZDKUHfWMXC5oe+kSpLpR5manxx63cxDOMrFEqi6a4VxPg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: imx: Fix TXDB_V2 sending
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: jassisinghbrar@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	mailbox@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 4:51=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
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
> +                       ret =3D
> +                       readl_poll_timeout(priv->base + priv->dcfg->xCR[I=
MX_MU_GCR], val,
> +                                          !(val & IMX_MU_xCR_GIRn(priv->=
dcfg->type, cp->idx)),
> +                                          0, 10000);
> +
> +                       if (ret) {
> +                               dev_warn_ratelimited(priv->dev,
> +                                                    "channel type: %d ti=
meout, %d times, retry\n",
> +                                                    cp->type, ++count);
> +                       }
> +               }

This could result in a infinite loop. I would try only a fixed number
of times then bail. Please use count to break the loop
after let say 10 tries.

>                 break;
>         default:
>                 dev_warn_ratelimited(priv->dev, "Send data on wrong chann=
el type: %d\n", cp->type);
> --
> 2.37.1
>
>
