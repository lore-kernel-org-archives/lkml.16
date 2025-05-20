Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B1A1F875C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747780937; cv=none; b=cFV1z8Bil5Tf8sefK5RkQ6uZWbdzOpKtz5zkmU4yShOPnpMCBVVZrGFR2hPBY1QwWAkxm6YWS3ogsdrXVMTEtcHjQkXhqwHR6wzg6QEK8D+ZH+rdcsjIofEeoAw8e5cDxcVDQ3PaGh6p9g4LMyZ1y+WG+pZHMccp7I+FFuhsvBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747780937; c=relaxed/simple;
	bh=F+0KGjJEeMGYRbcevFKEOSgGE0ujrUpdmrmtWjYGodk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HaPlQXzGTL6C0fXn6slZd45mu7HaPWQa/ho2mF+bcSrFdJIXeeDVSfzAERfoVtQzjDKE6osZKO7t3Fk6W1pGrYKdLmM0EWUrTQuXCA4aClC+rd90gJZIyuqtDxoqY681eYUs3HCEY4jS6Yesk1oglJfOTbke7dcfb+QgoQWSK/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U0COWbjy; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U0COWbjy"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-329119a3a8eso32015231fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747780933; x=1748385733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+0KGjJEeMGYRbcevFKEOSgGE0ujrUpdmrmtWjYGodk=;
        b=U0COWbjyNECRHl1cur8aqhDSQ7FmsyklzbRM8AC8XYrjIjuUysuXjW1OaV4qRCYs1u
         tu9eCeBKf0FqnopXuNaGjEysh8jYZyv5KmKMkp9e0SYbWLz6Bj+n6nfSnw/msNesI4F+
         DCAc2NGfhNt1OTGfYqMZ58L9YazZ0uUJWMDjy8LV0eM9RSHeQyfvVH6iT7DmcZqLj/ha
         +N4pHwiIZYwkabUjsRslz0jr7H62D2gteo0RhNylDVwCxGIzghnv6E2d5PhKrQBTaAVa
         FvY4vjyH0gEMoDxnzMw7Tv2jsRimFjI01A7xxuFp+NlBAofmtlvOz1nC6dC79rZvskiU
         AvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747780933; x=1748385733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+0KGjJEeMGYRbcevFKEOSgGE0ujrUpdmrmtWjYGodk=;
        b=hHe9iMnVeQR/08Az8PrY+9XysI5RBUAgQhzyHPyoGCaU+QWoNHLj+W3PH9sYfE512U
         IClDMYSgLM06Q45wK9rDFn6h90bzDNjrA00yu5Eyexpml6EfxiKvyO/rnv+YZcPXri5X
         N96MXFyL71yieEv/5idqVUrdS/jA7wgh+7Ca7Hgbn5aQh/16E7Slc/Ag6sMAyKR4Enk4
         VQAjvVE5qTaM7B9OBxfKO7XGZ+A5MOOmiScBR4PxneJ/fktqd3OOiLQISk67XNkXxuCM
         1rulUCEjdrOWlG6NzBN303Zp3YHdxyORy/jha1BKSMxPVWDeLRxNqgazE8kJMPoBQrYd
         kHJw==
X-Forwarded-Encrypted: i=1; AJvYcCWWbE5VByuUrQFP2ZxBy8hbUq4n75CawHz51Pes7aT9kUkSOtogEDV3zSy7ZrstW8+xmduPxPw0KBWN1NA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBxJ4HU6AfHWtVjo0qI8NRQBcYxsSQJ5sQb8BDYq5bD7Umfq9
	X0s5D40aGSy/dWSuEeSzG00seEivpTwlfdXFuUhCYIdE2J6mvzwRJeLkstcXTzsyyBI/Yz81JAW
	Ya4DZhIKcXBecpM+ue9RVaxalZvQghIeKMTGx+QwOGw==
X-Gm-Gg: ASbGncuYARAa2zBjhbvwKlPLjRB2ckuTK7LTW7JF2f4Nawg/35yyRRhML0VCb6vqnfi
	hilaz9UGqRhnpUxiIOmRrgP/hsii9Q3UKSkZYIDCHahujNGFPGNrlVqLdWP3L4xqtCEvjbmtzsb
	3FIEw+f+/qTB0LBmcQjE7/BPpXj9dC0Crb
X-Google-Smtp-Source: AGHT+IHsUCF87aJBJgdi8mRkNqubc6I4D9fZMCMetg4kSiJqDTe01fpVuT5acGVm0IsXULfYXw603PwqUKvGmPST+r8=
X-Received: by 2002:a05:651c:20d5:b0:328:d50:d7cc with SMTP id
 38308e7fff4ca-3280d50d846mr35144561fa.20.1747780933368; Tue, 20 May 2025
 15:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
In-Reply-To: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:42:01 +0200
X-Gm-Features: AX0GCFsxq2qbIdoCh-TtdqObwj9pvVqees80rU3HdDEUCMiHs8dNAK0ZulTRIX8
Message-ID: <CACRpkdYor2+rCZGsZLw=_Wna=0KnyXBaVtx-VahmN6Ky-zZ-Dg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: eint: Fix invalid pointer
 dereference for v1 platforms
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>, 
	kernel@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 11:16=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:

> Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
> addresses") introduced an access to the 'soc' field of struct
> mtk_pinctrl in mtk_eint_do_init() and for that an include of
> pinctrl-mtk-common-v2.h.
>
> However, pinctrl drivers relying on the v1 common driver include
> pinctrl-mtk-common.h instead, which provides another definition of
> struct mtk_pinctrl that does not contain an 'soc' field.
>
> Since mtk_eint_do_init() can be called both by v1 and v2 drivers, it
> will now try to dereference an invalid pointer when called on v1
> platforms. This has been observed on Genio 350 EVK (MT8365), which
> crashes very early in boot (the kernel trace can only be seen with
> earlycon).
>
> In order to fix this, since 'struct mtk_pinctrl' was only needed to get
> a 'struct mtk_eint_pin', make 'struct mtk_eint_pin' a parameter
> of mtk_eint_do_init() so that callers need to supply it, removing
> mtk_eint_do_init()'s dependency on any particular 'struct mtk_pinctrl'.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@colla=
bora.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Patch applied for v6.16.

If it is needed for v6.15- then I think at this point it will need to
be backported to stable. It also does not apply cleanly on Torvald's
tree, just on my devel branch.

Yours,
Linus Walleij
