Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D84C1E4B2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743138390; cv=none; b=JE8XcNwju3c1E94z/06d00Ujxcn8bYVlXGrzk6qvdFGYfOS1shNepa1fgWFYBYXW5cMGS19FSK7D53dfkSNVoFxlBlW1T4nqevXiixcPZzTNWFxaN95fH52zpZC+YJDXlVSdmexJEbBTPt7s0J2d27or9RAPtso93hIo+mRWS9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743138390; c=relaxed/simple;
	bh=YCGo1ZlNZbYJZfxnMTNaYZ+l8gPgKLITig/234QhJJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQ28NUWeRDSjQk9o1GAnbaGhqQNVoF2kINVbbl+YUSyVtS69Ssc5vWI4f4q+OuPN1C2M/VggYzLt92hoCDYbMqUn07vgGNz5ryW34C/BhHONuDL/zM63ZuYJbfZYVAnUBL6stIJW/6nPZ727mF2SvOdjovDionRLnZjiO+49mS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dUv1GAG0; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dUv1GAG0"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86b9d1f7249so1554931241.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743138387; x=1743743187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCE7GTntYqSA2aC4XD1nczisWULGvBASqmrfxCUaKwc=;
        b=dUv1GAG0NVDW0zAvRrfFwM4aIx6yK5dCKSlrH85IAPm5olYV9gDlD6JifGhX9dHI9Z
         p1T1BsfRgG/vucc0aa1IJPu8gkyGKrBiWHmqxEklp+8ws5psG2KLyr3+0aT/lNaZBSbh
         em0Xvc+t8UnJza1nkX0Nt480O8dgqGHPDpB4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743138387; x=1743743187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCE7GTntYqSA2aC4XD1nczisWULGvBASqmrfxCUaKwc=;
        b=K9vLm3uCTp+lzcO0S4DSHgP6GtJQnhx0MIklwONe46tv8cITDNUuCdKdys/ZHErcuv
         YdftILjSJrrAfW8YIlOXRl1ufehY0rdCWm7FUgAy7+W5NjUwvpWrA8JjBuHt7Ezuvdkw
         U1p7oEBp9NRi6vK2Co+hbJAxdVAQ9XFGCzAu+9PkLZQnsC4npRgZuuNF5BVp0ibQ/KpM
         EKsMfm3ViieurVwzjYjt8KsAsTKy00joVFScOL/Vi4fbBFWg7nGPmguYc1QeAeayeFU6
         irQLknnw1p0QXAXYtrp0ZmtaQUaUonNEUneCjupdURUJjE9t0n+/5rx3ec1drp0K5cG0
         PEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNC7O8nELpKgiV1w7CjVyQjLnkhLBuYHbrkz2+EspteGayvWz2+nL6W5InYhx3oMWTgDg5nSNxsFReS3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD3Syet/W6UVH5ABzPtQ9t5g2CCraetEhslBmnIip8tQWoufpx
	ZVMBeX9BE9Cjd/EFmhdgINTufzkKxfUVaqoDWCcHGE1q4CxXraOV1WBwUVxl+fi8O7eDcLn49b0
	=
X-Gm-Gg: ASbGncsLqOI7Q0MygTwdxUKb5cPYVO4jVoyZ+iQ462TtfflCtgucKXOA8aJXaUWmLsW
	qz8d2jmVmKKMJokxbfhuHzlsihI9/Wn8NMOw2QqFbTYk7eyrKVmUKkjf2oDQovjrKuZV2SUn+su
	IMet3ZAMGVaz1qYIHSU69nLhDiNIMRTLOuKRvU51cvYAVpjMrhCg6Zsi333yOVTfgW2vBdwOXs4
	UK4n1boV6VoRHBIoB+Wtdl4K4nqCd6OGwzp0bWb0CXEKcnXgTNyKSd5vazd8ij7DSK8fSkRSVOT
	GQRyNyAGAihLKS8MWQBOIGMlZFUThNHe2iUTV22MFW6GPvC4wQC406Xs4m1+CPkxSv3uFwohzcW
	hfFTM8hI6VWIv/V8=
X-Google-Smtp-Source: AGHT+IG9sQcwHMqiu0NilHhVrNAVtTrCcOzI8bckmPXdsqpAm+hCGGXFiBleyIC77gvWLHh39GbJsA==
X-Received: by 2002:a05:6102:418d:b0:4bb:e80b:473d with SMTP id ada2fe7eead31-4c586f57509mr6323754137.6.1743138386991;
        Thu, 27 Mar 2025 22:06:26 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260e7e1320sm280165e0c.14.2025.03.27.22.06.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 22:06:26 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d2fba8647so1743920241.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:06:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIlprYglZS7hfGb3vh5sEszqEPbaDT3c0wq0Uf4PtNNF28e1SZbKHxBovdmpusDQWK7xYwczrsxghxerQ=@vger.kernel.org
X-Received: by 2002:a05:6102:1594:b0:4bb:c8e5:aa6d with SMTP id
 ada2fe7eead31-4c587067e55mr6354275137.17.1743138385225; Thu, 27 Mar 2025
 22:06:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325081331.1965917-1-fshao@chromium.org>
In-Reply-To: <20250325081331.1965917-1-fshao@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 28 Mar 2025 13:05:49 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngKqPNwQphqD=31nJ_aLFQSDZTutRkXBoJQ2toh88uU4g@mail.gmail.com>
X-Gm-Features: AQ5f1JqpvGGgqSHXl4XTQPZ8DaVc0ASCtP3cW5-tkw39h3dpa_7wqVobe709AjM
Message-ID: <CAC=S1ngKqPNwQphqD=31nJ_aLFQSDZTutRkXBoJQ2toh88uU4g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Simplify INTERFACE_CHANGE_INT reg
 clear write
To: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 4:14=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Simply clear the INTERFACE_CHANGE_INT register with 0 and replace the
> indirect `x & (~x)` pattern, since they are logically the same.
> No functional change.
>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---

Hi,

I noticed that Xin sent out another patch [1] to completely remove the
block where this patch tries to modify, so feel free to ignore this if
applicable.

[1]: https://lore.kernel.org/all/20250327120558.1272081-1-xji@analogixsemi.=
com/

Regards,
Fei

>
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index 0b97b66de577..df2d1dd95d01 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1586,8 +1586,7 @@ static int anx7625_hpd_change_detect(struct anx7625=
_data *ctx)
>         }
>         DRM_DEV_DEBUG_DRIVER(dev, "0x7e:0x44=3D%x\n", intr_vector);
>         status =3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> -                                  INTERFACE_CHANGE_INT,
> -                                  intr_vector & (~intr_vector));
> +                                  INTERFACE_CHANGE_INT, 0);
>         if (status < 0) {
>                 DRM_DEV_ERROR(dev, "cannot clear interrupt change reg.\n"=
);
>                 return status;
> --
> 2.49.0.395.g12beb8f557-goog
>
