Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F9A27BF79
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857465; cv=none; b=B5wRL9cc0VloiVndIzS1wTZJU2jLM8BNl1+tMuzunauxo6xMSYcEKXDlLL70NPPaK9bOUkDvuAyMw3Rroz1W5nJZr9iK0HURmr206wUnqnOrhGs4L3ujCMtX1aFg+0owwYLtiQif7KYOQkbr6EvM2463RxUyrpq3HV3ddLjLyDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857465; c=relaxed/simple;
	bh=aBET2R+cdNEs2JBLTJV2J6n/I6DLqblbM0N9jJcdptE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ta5TFD6c7rlv+hb+1T0FN43Mu/riMlePsgrHyAObS7EIyITwodAOuv2GPvqckCx+8ZMgqPtTCm3nvGRfIQkt5LHQuEvMp6Y51epx016CDoj5TUIPxfLH7xBZmiNnY6aI1QzNRwbXgL0NsuhgC+xOoZYWXwj197kD1IpyJwxfr1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kLsizspE; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kLsizspE"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6fda22908d9so37682257b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745857462; x=1746462262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vEM8AjK36qQ7ZkludDbMcF49w6ZyxlSpknwM0aWu08=;
        b=kLsizspE8BU1GrXFUIXDRwYc++r0+F7m4bFeihtAODYfbJXA9F2UaIMNdwl3nB0kzU
         X4eEQBklMSne74bqJ3xgbZhWoMymESHGOQEoUar9b4x7IxjhG4x+6guiKXrJQue1UzL4
         5lnnIA6lUrv/ldB/fyGji9wMVyc2cRHiw+pWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857462; x=1746462262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vEM8AjK36qQ7ZkludDbMcF49w6ZyxlSpknwM0aWu08=;
        b=A1gtrw3ea7fwvmChyP/ZIdVHZFvoSlz8/va9efKO0fUl2dPagDnkOegqmvRGwocTku
         3GRq7U09c9lqpppE9EK8VloV2wZhXVcw+r//rNmP1W90KnaqK1SJ/P6Ai0oQ0YmAbC5r
         gEV8RzyXh8YtI1pwPdAbikDF2bl/e+HdhG7LlL3k3d3FLHa8SNhD7eDGaSUZFv7M7vep
         WVTcz4+126coTyuSBwqIo/Ge69g+ayGixT9/lYTrfEDZtF464CZLMsoKQG40ClVB/uJR
         CbDN2FtVfHZTiK8vqwp9EtOPyU5Ih2LB5uI/hYdZ81stgQrDh1d+jQkzIwLblD6ucgSH
         pkwA==
X-Forwarded-Encrypted: i=1; AJvYcCWcNKu/ECsvdH+3RxE119ET2H9CdG7S2zl//feFCtWNapkyNc6NNbNU8QejCfwEYqplozPi5vJSsrtv8Y0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyhm5GgxOR6SPTGZVZ1paWdBNXvtz6SCsOQK/GRIs9v7R2uLC2
	Lg8Rl0gT1Ov8pOQuzl42kYEWHOnGJfl/aPAySRvBTcEYAyz1BHkMG2+sNw8T2l5ddUC9LhcI0Dv
	PUAfa6N9y6D7Ahy7Q/8A1lEA3TMNyrkBENIik
X-Gm-Gg: ASbGnctZAWl5qevJ+GbpR/I/I7gNIXBGEFXBF+DP/9zFY6sFSQ3Fs7MoiDT2j6Z2Jtk
	ZH4CyJNAxzfkd8YdA+iF4unkLBqPtvTrI/g4z+2iU2+dlEwYj2bU7BT0HKQ14j9Y//57uNgXPpQ
	2NVzxCIwb1lxMY05/E8AP1UQ==
X-Google-Smtp-Source: AGHT+IEhniT1NFmVEmjCJcZ/tyyHLtc8q6IQL+mdJBR1gMRGoa/2Ox7aQE8eMb4K8ZNe3XWShmP+9vlTRiq6Qvv+Pv4=
X-Received: by 2002:a05:690c:7082:b0:705:5fde:1b82 with SMTP id
 00721157ae682-7089966442cmr6121787b3.13.1745857462449; Mon, 28 Apr 2025
 09:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426024810.3876884-1-bleung@chromium.org>
In-Reply-To: <20250426024810.3876884-1-bleung@chromium.org>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Mon, 28 Apr 2025 09:24:08 -0700
X-Gm-Features: ATxdqUHQarXuxCaiWX4uFxpbdmPmqgWPPrC_naZwTg8naWtVoPfxvgrCj4bzKVU
Message-ID: <CANFp7mWQPy2z1dWtHSw1uzMnUCcRJfaqJvGayyjmEvVjnM3KXQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Set Pin Assignment E in
 DP PORT VDO
To: Benson Leung <bleung@chromium.org>
Cc: jthies@google.com, akuchynski@chromium.org, tzungbi@kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	sukoo@google.com, bleung@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 7:48=E2=80=AFPM Benson Leung <bleung@chromium.org> =
wrote:
>
> Pin C and D are used on C-to-C cable applications including docks,
> and for USB-C adapters that convert from DP over USB-C to other
> video standards.
>
> Pin Assignment E is intended to be used with adapter from USB-C to DP
> plugs or receptacles.
>
> All Chromebook USB-C DFPs support DisplayPort Alternate Mode as the DP
> Source with support for all 3 pin assignments. Pin Assignment E is requir=
ed
> in order to support if the user attaches a Pin E C-to-DP cable.
>
> Without this, the displayport.c alt mode driver will error out of
> dp_altmode_probe with an -ENODEV, as it cannot find a compatible matching
> pin assignment between the DFP_D and UFP_D.
>
> Signed-off-by: Benson Leung <bleung@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index d2228720991f..7678e3d05fd3 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -22,8 +22,10 @@
>
>  #define DRV_NAME "cros-ec-typec"
>
> -#define DP_PORT_VDO    (DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BI=
T(DP_PIN_ASSIGN_D)) | \
> -                               DP_CAP_DFP_D | DP_CAP_RECEPTACLE)
> +#define DP_PORT_VDO    (DP_CAP_DFP_D | DP_CAP_RECEPTACLE | \
> +                        DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | \
> +                                               BIT(DP_PIN_ASSIGN_D) | \
> +                                               BIT(DP_PIN_ASSIGN_E)))
>
>  static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
>  {
> --
> 2.49.0.850.g28803427d3-goog
>

Please add a Fixes: dbb3fc0ffa95788e00e50ffc6501eb0085d48231

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
