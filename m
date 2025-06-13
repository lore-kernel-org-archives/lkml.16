Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFD42DA767
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749801660; cv=none; b=lks4oQGlSGutAE/RdAbaqtgXTEZ480TOMDcNIewpQuo7LOal3rOTHriHCPNXPC97LLgxpikyZi3KX5ZZfvsyvEcofS6wLHzc4v67eUjARoHvMlmY7W/K5J2KvbJxGvEX6kNaBzMEmYu0y8Plm5bGToydAsaCKL3n9yHEAqpnqbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749801660; c=relaxed/simple;
	bh=Ws8XhwtwvWOU55Frj1wRUPb+hHnGps1SWIULhHNYZXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIZQCf72G6Ewq/JFl4CZX74LlVSxaSpCXHXzZxlAxb1OtIrh7tq471A5NwgdWAsv78MsIFg7R38W1cW2q4NTh8hZsyDV/YtzDih1BZ6GoI6iWq8fs+a5dd4xkLEHzXXuKDp4Kpj5IpJ8eemOS5Lvsy2nrdQVES5athxmbrlbg4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=rnQI1S+L; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="rnQI1S+L"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e7e7b8b934so10230137.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749801657; x=1750406457; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=scJh8d+O+EnR5/uIkek0nD2hCc6IGYE1UTUEZv0y62o=;
        b=rnQI1S+LscwI4TCgTek8nlAfwjmrkn4EfzRnEpMN2VTpb711jc9XR+EOcZ/2k+Xh5W
         MwgDnKA0INONsaFZX+xZWNbK/IUUzdlMKITtszCy4houosCFOAIuohN/Kq7a533Zza2v
         NgYYyybTJYFUHH14EPAuMGzSxRqgsCMKWJsEcT1CJos6jr7aCZx62wtxFCBxJWTggGIq
         R7s1yp+BXWXpKWVxpWTbrqvwhA9EbDerPT/4dnMJZXCTqS7HilXV0VDwscl3RnqOa3/B
         TnRc4gapa8/MxDjhOHslCfDcJAoYIfqmyxD9HoCmNF9wEIfht5yPJrxCb+nogr8uAF2p
         SeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749801657; x=1750406457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scJh8d+O+EnR5/uIkek0nD2hCc6IGYE1UTUEZv0y62o=;
        b=P08iQsfURq31j6SI85QJbn5GoSVRr2ekdKbwmCoZBJMcf6Cp0jO981EVYlGhZ7UBxD
         fzFQb/3RV8Nc28OB7zxtiLkUyyNenhV1Y2S8QvpXisaS84GWjq7FRaigrO5RF2HWJfgD
         WtrT/gqUvPtup0LNgQ+jnnlGeTxSUdRI1tgcP1ajiXvMMaG8R/Wxfi64fX2IPn/HP8Qm
         YcWrzRTIecMpWQZiJ7y6OpDW5813LjOZ/osUw5GvgKCyCqd9BQINVAGh14xsK1k0cRjl
         DDtjKTB14YqucFCGwlLqciTakiLVKrletFoBSzuzTyfo6fmpaPAEQYyZIzEgo/H4WICr
         6Aqw==
X-Forwarded-Encrypted: i=1; AJvYcCUPP1TdpkqbotPiJzPf4jPySpQqC7u1WGBVqWUBlhWgPvfhce6GBA+n6xy0JTbQbrWmMZNNINhYzKegCj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBULzru/Mv0Q+wdZPvMPejWUL8dSAQvMmebW9bA7C048BnpJU9
	aE4Q2KwgyLIKXxsPi9qmgn84KuVrY7QvW7Xhb/qvd0NxCFltQcAgye6RXbHXxZYgYWp6oIWSkkd
	fVDcq1NjyQxgELvE3eRS8kKnGN09/F2Iu4fUlg2Qnog==
X-Gm-Gg: ASbGnct2+LULAyyk0mziaU15YV7fDkuGXYKw1VHIXYS2JMfrgyvt970yqakrchZLzz2
	kTHjoNkWNihph2dtSeKPuD5m6xA9CLnPhvPNpwPxe7VlZtFlAGV9Hd94CYVqU5Nl5W6eFCacjJB
	98TuGUnFKURVClPVyLJGHpGjcocYJWIf15A27Aa8Pw+oI=
X-Google-Smtp-Source: AGHT+IEZWUu8qgwgkkTm+CsEr8/FtKkNy57Yjq6xd1uwQZiobmrafqc2LqOzs6ELakL2gDMWs9lVgnozIjy/ssY7uWE=
X-Received: by 2002:a05:6102:80a8:b0:4cd:6339:36a1 with SMTP id
 ada2fe7eead31-4e7e360e5c2mr419047137.0.1749801657328; Fri, 13 Jun 2025
 01:00:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
 <20250606-pispbe-mainline-split-jobs-handling-v6-v7-1-46169f0622b7@ideasonboard.com>
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-1-46169f0622b7@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Fri, 13 Jun 2025 09:00:23 +0100
X-Gm-Features: AX0GCFskqlJzEMkB9GaVu-uc5hw9nEwjPjnaSfW8bP-WdW4AyG8urU3mzC4FJLI
Message-ID: <CAEmqJPp+jG7tX+urwPdCs=Nxi54v4j0_hxaeYUB6GUzB6F3JCg@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] media: pisp_be: Drop reference to non-existing function
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo,

Thank you for tidying this up!

On Fri, 6 Jun 2025 at 11:29, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> A comment in the pisp_be driver references the
> pispbe_schedule_internal() function which doesn't exist.
>
> Drop it.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 7596ae1f7de6..b1449245f394 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -368,10 +368,7 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
>         ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
>                                      &pispbe->node[MAIN_INPUT_NODE]);
>         if (ret <= 0) {
> -               /*
> -                * This shouldn't happen; pispbe_schedule_internal should insist
> -                * on an input.
> -                */
> +               /* Shouldn't happen, we have validated an input is available. */
>                 dev_warn(pispbe->dev, "ISP-BE missing input\n");
>                 hw_en->bayer_enables = 0;
>                 hw_en->rgb_enables = 0;
>
> --
> 2.49.0
>
