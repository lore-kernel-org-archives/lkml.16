Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3649221FC9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487099; cv=none; b=rEindUXiPN1oiI2h0cL32Kap/ghsASaCUpKCvX7KynduBarTdi+5cTKxYfUSHg8zHLhXHb0gMfsEctSyX8v88dp9+lK0JrEt6UM9j8XaHkC0nlsdXk9ne9J1IYTEeuZyo+dTTPZrUqzQ+IkoW0alVMd8aQU/+IZ1v144cYF51Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487099; c=relaxed/simple;
	bh=66p9WhAjN8+qM6y4SLl6Y2ic3zePpmalXggNHuX8Ipo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MrnFm40aX4l6Z5QMIXoTTE22AfzRPQS40N7W7EuuKHcpIaEOByvruL/VFNi17ZScDb9T4E3xNpBhdaveLMKvfXAOXmlj5isYhBRZuxsxHCA/PDc0M3dSDf3qvW1AhFPV1ySplAcdkpq7RSMCFIKwp91fBzUdeVdlYcmhr455bA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uIKvko3R; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uIKvko3R"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso953248e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745487096; x=1746091896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVONgDkywsv0iUs1Rs/iF4ZeRFnwYCs7FWkvBJg2vb4=;
        b=uIKvko3RW395roNqfFh04m3Pug1dXrRLK+GPiqVlWpXjQcmijTVmsE6FEthi2wEoVR
         376ajPZpKjipFScRc3hPqpGNezCZShW5zZJmx6wSalo2idIQ2VoIaeyRZp2ZAe3Fu5Qs
         y7T648Y2t+Bo5sKrd/ni7dNlsKzU9fjOrv3e5OIp3oVOz6WpCoNURJl3dbMqObB5Q5ya
         lhwfDztU6ONTwHFRNQ3N0o29YPI4nZznK3GCY21hDHVJmzGyWzTquR+slxOoRKJr6rk/
         d9zHkzE0y6rv/evqWFIzGZj8rzJ2n3IOoAvgfr8+QIfFvU0dd0IGsTq2Hqb0WM4I30rb
         UHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487096; x=1746091896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVONgDkywsv0iUs1Rs/iF4ZeRFnwYCs7FWkvBJg2vb4=;
        b=jT4uCEmjlWef06PA6Zca9/pkV6A4M0qUpDi6Ex3RfcoIkk7SjAKxBP3ivupxGqwjaj
         HRJwrioHnFZ/kGBJ3gtLF1Ooeo1j4nUSqONMRjzIIkIHCtJe/AazteeTuxQF+pv3QrdH
         UvSuBxv11/i6EJnwqE8QKlDULMIIGI8jqa8+8JzP8P+6wVODR9x9+i0iVCOgGUM10219
         bIQMn9gN9aM8QreAARc3fPdpWgO17JCZB4oiEq1h0g2VMY9a5QDNdog01Yw3I8Abym+C
         F3IfRT7soz980dCtqUq3NX+8ycb7ceFWha+bhZrUfKLjTYeF4JVF+AG06/4XDwcsgAKr
         Xj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3f7x/4PG3BR1+VegNiK7qfAlBYIZgwi1TKJLA4UVF05wHsxn8aNSCItDqMk8LAEix9ElbGiu5ww9JDYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF5GJ2QK0RxtyY2YJauwPEx/9gWXCPb7SvHEIi/kygtHPb3Ohr
	FbA52wmKKLoIn+Jf0OgOH6axiIg2Z8sleNxKQr5M2h28GwwPXqv7NbPpx3UQFftWKVWBSytMJm2
	tJxLdX3FeW3Gbzq/eo6Qe+FxItjyX1tIfwfthHQ==
X-Gm-Gg: ASbGncuiNhCL+cYzwkis97U7unTj/jx4H0M52vaYVZPsrJ2Yy5JkfDxHX6TL8g5YPWu
	WcskegHhHJGThkECdg0PDR8bDO6AYCbpl8Wn+OLY0byYTW/6rnxt8tOv0BML1kXc1cvlYWj3SvA
	STrrxJzjmfUOVvMUD+COeabcbAuhpEnAocdsE1it5nTum4VO5ed9AD0w==
X-Google-Smtp-Source: AGHT+IHGzfqVm5DiI57G06hdv0RbA4ie/G2gk+CyiEFdlczu0797VWCMAj3KLEFzAK3ogReXfsixBadmL2wpmlPxhpM=
X-Received: by 2002:a05:6512:e84:b0:545:3032:bc50 with SMTP id
 2adb3069b0e04-54e7c42255fmr500642e87.19.1745487095942; Thu, 24 Apr 2025
 02:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
 <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-2-f3fde2e529d8@collabora.com>
In-Reply-To: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-2-f3fde2e529d8@collabora.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 11:31:24 +0200
X-Gm-Features: ATxdqUHuYt0fFmQbTufFKrTTQ50DPP7STko6I100ngQ7wHqRNewsR7rV0zZ35ts
Message-ID: <CAMRc=Me20ZLb-vb6jJyy9pvWbwWsxVrxREbQOrmVyBY-S046gQ@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: ethernet: mtk-star-emac: rearm interrupts
 in rx_poll only when advised
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Biao Huang <biao.huang@mediatek.com>, Yinghua Pan <ot_yinghua.pan@mediatek.com>, 
	kernel@collabora.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 10:40=E2=80=AFAM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> In mtk_star_rx_poll function, on event processing completion, the
> mtk_star_emac driver calls napi_complete_done but ignores its return
> code and enable RX DMA interrupts inconditionally. This return code
> gives the info if a device should avoid rearming its interrupts or not,
> so fix this behaviour by taking it into account.
>
> Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_star_emac.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/=
ethernet/mediatek/mtk_star_emac.c
> index 23115881d8e892a622b34b593cf38e2c8bed4082..b175119a6a7da517f20267fde=
7b2005d6c0bbadd 100644
> --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> @@ -1348,8 +1348,7 @@ static int mtk_star_rx_poll(struct napi_struct *nap=
i, int budget)
>         priv =3D container_of(napi, struct mtk_star_priv, rx_napi);
>
>         work_done =3D mtk_star_rx(priv, budget);
> -       if (work_done < budget) {
> -               napi_complete_done(napi, work_done);
> +       if (work_done < budget && napi_complete_done(napi, work_done)) {
>                 spin_lock_irqsave(&priv->lock, flags);
>                 mtk_star_enable_dma_irq(priv, true, false);
>                 spin_unlock_irqrestore(&priv->lock, flags);
>
> --
> 2.49.0
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
