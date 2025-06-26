Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3724D28934F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926339; cv=none; b=AJzaDf+voECrLhv8ZaSWOlyV917kWOxImiDT3LobYE9BglnlqNlr11Ty4ZzKy2Zx0LQRB7AHjiezpejVSYHvMQDVDK0FZmuxMXLpb+OQgMP2OJSOhHuWOVkfNGCun+vk/Q7q7+7x+dbnqucqjIH1VwIcBSnB+x4v0EAJ40AKaAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926339; c=relaxed/simple;
	bh=tcbJ4dMHWa+h9imojMEcUHTRNC8LuPrUj/4HSqv1epI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SI7UWrjncOgpPNxkkO6cXnwQo0ciWMVGBps65r6x6/KwVaUvdlf+h3Un5AUAqkKuEx7hIbw/JG/ADMg7rKJoUBmT4fGb1iwkQI2NWWYEwhbi0CHK4Pqhua+lSEyZvilojKVxMAO3vDEAgIIwj0jNtUwRajO7K3/JE8VBFhle/3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vxnKb/Za; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vxnKb/Za"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b584ac96so730971e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750926335; x=1751531135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KiWcI/ZEWKnAMfwKiluqNNZ9TMq7+QkURM7ieGMhCI=;
        b=vxnKb/ZaUgxtnVa1WM2x2l6fxPib1MEdwgMostPsDxQV9aNZZ37OwVFkCIzCnMjaPm
         iRzUvTNnM9Roh4wIK41jbK+b2h85ZtQr9iymbVuQ60Cq6wXDc++8GULEa35gtzjD7okJ
         q+sbMMCqhSdn5DbXZUkO3AGBPrm1KnOfUHGU3EKTs5EidA2mBjrTEunnJs8uIRQ2hnif
         F4eXuSFJ7sWZQN8eP2d+BK1CojcEJ+odw3l46WO/0uokHNnMDimoVG0eb8bMgwtSJpzH
         4DXT10WM9Tir0+bO4uh36WLT9ACJIYziG6/iWoAumKV5T9mo0fVO1mFzlCgb/eUoyJNs
         HgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750926335; x=1751531135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KiWcI/ZEWKnAMfwKiluqNNZ9TMq7+QkURM7ieGMhCI=;
        b=r3wWIfBDYzH8kMnn1oSrPfJ7Gn1Fx37BlRHLo+vXXurKMTqoqCcuzoyDGh4vj1yy31
         CusHQA9cD/HEwsrrPl8wdHnb5X532HSWtd2DkSg0wg4yOhu7GXqz/2pZujJQg7Cycvcl
         bNTmlBFWJLKe+x2W1lBFDjTTL6XmywzuzVZ1lBz+axsj6evv7y5AVlkMS2VWGD6cjoZc
         mQMPp9LGdCJct8v81BlVy2HnBUX59HAPrDVQKFZ8whzsyRA4jPeOZBM8/JnrYoEQsCmR
         K05i9cEhSXYJvnGqwk2lhWfK9msmgXeRwGHwxe3B1bGOI7J4hdaJA6OIyFjd1V21qxHe
         +dDA==
X-Forwarded-Encrypted: i=1; AJvYcCWpx/Rn89ZyynUV8EuQRmLRzX8BKsu56O7Kgaz267reuIK+ak3NtUrdma5SaJgQ9CBer93c6BVm+vHAlbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXXiGff+ZQ3BvlfHL/j/2vVlbp2eXQJq562ousq0kAPHSHAiN3
	vV5wEEy5gxtDNE/K8qbIl0m92dNQ8utCjKYL72eX7ZJnEjnKGZciZwKrM0hTFJOKCo2QsHbEh9A
	3gMolh4ZBGN//kgTH3SKSc6Ryon8RzdxZnLyWUcRLi6GQBOSwZocwsmQ=
X-Gm-Gg: ASbGncuVW7ZYGpdgPyPTZDr9WFxL3baaeCeG4Uu2kkYy1Ma/3Bz3Y8VCnn3HUgpqiDZ
	l/lMloVyN5Wsacr5PEQgRBmk1r/7b7CCAnFORHx1Mb+hEEy6FE9VnQpXE/zBhFGTJuCOY8RiHMN
	bOaCSfhAdDhhMpYN8e7w06TtENI7FqD8Umt0ovAE0QNHqQRVGTFqaJ4GuLf2lnJqsd+dpXTaHor
	Q==
X-Google-Smtp-Source: AGHT+IHiqTRhc98U7J30Q+L+jrTc1jmBUQy5Vyfvw1Z//zKbgr/TNUKjoi9hEvxXZFQA5uGpKkHKIMlulcDni5LExCA=
X-Received: by 2002:a05:6512:2399:b0:553:35c4:db08 with SMTP id
 2adb3069b0e04-555029e70d5mr987473e87.30.1750926334687; Thu, 26 Jun 2025
 01:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-icc-clk-memleak-fix-v1-1-4151484cd24f@gmail.com>
In-Reply-To: <20250625-icc-clk-memleak-fix-v1-1-4151484cd24f@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 26 Jun 2025 10:25:23 +0200
X-Gm-Features: Ac12FXycIznnP1tC18vY9u2XdsRu_8gKuTWQBbtsSoPJ6qYsnL72hgxsDeWsTrU
Message-ID: <CAMRc=Md5+pSxx3kxhrYpt_oMUOCUkzxeWEy=YXnhY_4053gqRA@mail.gmail.com>
Subject: Re: [PATCH] interconnect: icc-clk: destroy nodes in case of memory
 allocation failures
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 7:32=E2=80=AFPM Gabor Juhos <j4g8y7@gmail.com> wrot=
e:
>
> When memory allocation fails during creating the name of the nodes in
> icc_clk_register(), the code continues on the error path and it calls
> icc_nodes_remove() to destroy the already created nodes. However that
> function only destroys the nodes which were already added to the provider
> and the newly created nodes are never destroyed in case of error.
>
> In order to avoid a memory leaks, change the code to destroy the newly
> created nodes explicitly in case of memory allocation failures.
>
> Fixes: 44c5aa73ccd1 ("interconnect: icc-clk: check return values of devm_=
kasprintf()")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/interconnect/icc-clk.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/interconnect/icc-clk.c b/drivers/interconnect/icc-cl=
k.c
> index 88f311c110207757f0609e5cec7d377a91133c6d..93c030608d3e0aad7d9c1ed81=
a51dcde0d3f85ab 100644
> --- a/drivers/interconnect/icc-clk.c
> +++ b/drivers/interconnect/icc-clk.c
> @@ -117,6 +117,7 @@ struct icc_provider *icc_clk_register(struct device *=
dev,
>
>                 node->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s_master=
", data[i].name);
>                 if (!node->name) {
> +                       icc_node_destroy(node->id);
>                         ret =3D -ENOMEM;
>                         goto err;
>                 }
> @@ -135,6 +136,7 @@ struct icc_provider *icc_clk_register(struct device *=
dev,
>
>                 node->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s_slave"=
, data[i].name);
>                 if (!node->name) {
> +                       icc_node_destroy(node->id);
>                         ret =3D -ENOMEM;
>                         goto err;
>                 }
>
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250625-icc-clk-memleak-fix-4462b5153970
>
> Best regards,
> --
> Gabor Juhos <j4g8y7@gmail.com>
>
>

Thanks for catching this.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
