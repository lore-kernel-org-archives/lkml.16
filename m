Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F76224256
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900080; cv=none; b=t1CjMdYMN5Nm709B6PKDIub/J62pht4bVDEJqhWlHUXjYhZZW0gHM0/D4J+6emJMysOXEaPnzkL1+K2nVBsLgvFDvgBKiTTRaGrj8/fKIsBmbpjd5EfFIUAEhgycL38r1ax/6Als56L4ZN0y0Z6pH8JpnQ/7XzC4H5RaydBXfOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900080; c=relaxed/simple;
	bh=oawndc3u6OFeNXbkn8onoaiERrlvNEUPYPsJqnlMj3g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=KRj0t9+gSqgWtHyicJddPGsyCGpyRQPnaQhx2kVaJ3zI45HgWS2R/DEazCPiDuFcdW9twxNg3jjBNuzC6g19Vy92gxwF+T2Y6OJ9CZU76u7v3yCQcAc3kBqnrSbPlLXRaum/KHMMGDfaAavObDIkZtyeVH3sX4BeJKIu/Kakr8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Fojo3Oc3 reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Fojo3Oc3"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3dc6f6530c5so30290965ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747900076; x=1748504876; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSRz3DaXBxnm8FuwtommREWFzr69OZg5+bKQaLg1jag=;
        b=Fojo3Oc3H06coOR7chfBFvcK8GGYRppOZgKiv/ZZ32e5UXpuXTpVyrPl51ke3EaLOR
         YZNThfr6NT2MUlQBaA+ZWtzd9Tj3HDt9LcL+b32QbWTvsUgG6mZnRYogFNpvf4wzeUdh
         +4XJUG6bdEp4rEqNIAW3yJFgGB5lTgZo6KxJQZxSadJpu/z1AuidoVGEUfaHrgaLoifB
         knYLGmxDduePn/EoEA6uUY2+wsLhfboXZtzC082v1tpMv2ZDOW8aEko181dp6snaL4xW
         4w4Y5lr3xvAQeWmH10eYcZc1LS0dhrdkT9EA2yppPE+p+Z/KjZ2D9wF7WKZYUbMzLsVL
         Vv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900076; x=1748504876;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qSRz3DaXBxnm8FuwtommREWFzr69OZg5+bKQaLg1jag=;
        b=gofs4JpPIvHeWtYGCBZjPU4OaDw4s4zte3NOmVUfRnWsvWBcd4iv+wophVOhFYMs0a
         JhTIej9OrMDnmLJI6mve1+sUXgM7zKyiOITqwpPUoBJ+rN8sMWw0KorG9Z/wggUNyq75
         UjRY/S62Tb3eHhNNfW3yfdsAdQgMJRzpqnkrNWNOwlUmbUGPYItwdGkP9Av7go21bhHR
         F7O9bbHw9VWlVtN8KXxUtYDokcAO91oa/WYBY/tQcea0YiLGnivDoyU/qyN41WGxfjuM
         UQldiT6pfD+X4Mt0RINjfCZG8dxFWgeW8BfBbZb1Uh9eTMcwXI3BqshjVgsa65lv27Jt
         Pr3g==
X-Forwarded-Encrypted: i=1; AJvYcCXRHDzcEbmq7F96VK7udDIAidq9croWj3MZdXoufXNow4gYjPhau7psEk8TgyieDHu81+MuNxTFjQ7w6s4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZPlZDE9MkjquqGkKpbCQurazS9D/F+T9YC1mSBrhHeds3Am1r
	+7hNn27TjdKjwoCb00mGBXllfvbXKqG//EwskRi5aR4EsNTurT8caJ/YM8PLHNz5uHE=
X-Gm-Gg: ASbGnctndMq+dCbnYNhgz7gvsaK9c/oH0SJWnkrvjNwJ6jnBvBEpwTOcWFdxJDVAC9x
	VmDtPehuIO1W1kbezySeRz83ND8rmGmnpckrunkIE5V3y5D9FwAaKBhoi/Y9+LglQfqC21GXJTB
	PsAaxYodMon73AdaqAGs6QzwTthIrN3u1tWGegeYA03oY9346kLmcTrlx/iGcGnxwxNYUMZzJdk
	p1WxBfKj3WoNhbOMvIjnzt5AUQRPkS//eksuXSuEJA7GyKHimiVp290RyvxKuzeaT8t1Cc/PDec
	KZ2ZLumtuXdbZ5uPaJkuI1DRtZRstFtGwB5PK6u4I6WXMG+2swnI5wOLeRo=
X-Google-Smtp-Source: AGHT+IEG8W77MeONJnBqaY3Kk6tuHXRXvYrpqiOJH8hduazBrd/kiXsmtoZpvJrUizpMHw69vmC2bQ==
X-Received: by 2002:a05:6e02:3784:b0:3d9:6cb5:3be4 with SMTP id e9e14a558f8ab-3db84322dfamr259928015ab.15.1747900076239;
        Thu, 22 May 2025 00:47:56 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a5besm3021494173.13.2025.05.22.00.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 01:47:54 -0600
Message-Id: <DA2IV4ZGT2M8.3QXO3L57VXSA5@brighamcampbell.com>
Subject: Re: [PATCH 1/1] usb: typec: tipd: fix typo in
 TPS_STATUS_HIGH_VOLAGE_WARNING macro
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Jihed Chaibi" <jihed.chaibi.dev@gmail.com>,
 <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>

On Wed May 21, 2025 at 3:48 PM MDT, Jihed Chaibi wrote:
> "VOLAGE" should become "VOLTAGE"
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Nice work! I was able to successfully compile this driver with your
changes and I don't see any further references to the misspelled macro.

Patches which fix issues which were introduced in some previous commit
typically indicate the offending commit via the "Fixes" tag. Admittedly,
I don't know if the tag is reserved for technical bugs rather than typos
such as the one you addressed, but such a tag would look like the
following for this patch:

Fixes: e011178579b57c03 ("usb: typec: tipd: fix typo in TPS_STATUS_HIGH_VOL=
AGE_WARNING macro")

> ---
>  drivers/usb/typec/tipd/tps6598x.h | 2 +-
>  drivers/usb/typec/tipd/trace.h    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/t=
ps6598x.h
> index 9b23e9017..cecb8d11d 100644
> --- a/drivers/usb/typec/tipd/tps6598x.h
> +++ b/drivers/usb/typec/tipd/tps6598x.h
> @@ -27,7 +27,7 @@
>  #define TPS_STATUS_OVERCURRENT		BIT(16)
>  #define TPS_STATUS_GOTO_MIN_ACTIVE	BIT(26)
>  #define TPS_STATUS_BIST			BIT(27)
> -#define TPS_STATUS_HIGH_VOLAGE_WARNING	BIT(28)
> +#define TPS_STATUS_HIGH_VOLTAGE_WARNING	BIT(28)
>  #define TPS_STATUS_HIGH_LOW_VOLTAGE_WARNING BIT(29)
> =20
>  #define TPS_STATUS_CONN_STATE_MASK		GENMASK(3, 1)
> diff --git a/drivers/usb/typec/tipd/trace.h b/drivers/usb/typec/tipd/trac=
e.h
> index 0669cca12..bea383f2d 100644
> --- a/drivers/usb/typec/tipd/trace.h
> +++ b/drivers/usb/typec/tipd/trace.h
> @@ -153,7 +153,7 @@
>  		      { TPS_STATUS_OVERCURRENT,		"OVERCURRENT" }, \
>  		      { TPS_STATUS_GOTO_MIN_ACTIVE,	"GOTO_MIN_ACTIVE" }, \
>  		      { TPS_STATUS_BIST,		"BIST" }, \
> -		      { TPS_STATUS_HIGH_VOLAGE_WARNING,	"HIGH_VOLAGE_WARNING" }, \
> +		      { TPS_STATUS_HIGH_VOLTAGE_WARNING,	"HIGH_VOLTAGE_WARNING" }, \
>  		      { TPS_STATUS_HIGH_LOW_VOLTAGE_WARNING, "HIGH_LOW_VOLTAGE_WARNING=
" })

Consider making "HIGH_LOW_VOLTAGE_WARNING" inline with
"HIGH_VOLTAGE_WARNING", or vice versa.

> =20
>  #define show_tps25750_status_flags(flags) \

Reviewed-by: Brigham Campbell <me@brighamcampbell.com>

