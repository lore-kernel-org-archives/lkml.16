Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7035D1C84DD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397964; cv=none; b=pewxi8y8EyN0UlM4PrxA0ZmD0LPhTL8/31hgAvbInsPE1JD8WZqPpIlAvGMjmfkTkQ3S51yGqa2fsOHyCPOyHgA+oZHmyuBB3u+dgY+rkbShwDV/AuSOu1V5FOHfJMjEuFepFmTqtOhlF9zbg50aTmjpjszo5X9eHdgeq0qsu+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397964; c=relaxed/simple;
	bh=1AT3w9qrvqNQ7asAkLzicRanFyPBT5NT85+7uOTViCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3e767I9YnFwVJ8jyAJ7fxZ0gqva0MF2Aseq8FbI8fZFvmHMP07VLgaVBzfxHHkCjwNFIV/mz4klKxB3O9aPEX/wFTS5Ns9lSE1BvpnLRvZMs48bvuAxGcyPk0Ng1VTxL/vJDu6LTbv8cIkP/lJ/8uE5jF77IitGRVl+eiFNp1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWQj9eP7; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWQj9eP7"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so6225333e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397960; x=1746002760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AT3w9qrvqNQ7asAkLzicRanFyPBT5NT85+7uOTViCI=;
        b=mWQj9eP7AZBmWCcZqLc+zzoUNQwUSn9guGlNJjnOz12miCvGw14qyBYV/HOpR1FRee
         x1uJuPbXdQC6jIKyNO/SPnNw+mmSxusr0/iTXrc+DItt3xofWouOscWXKbcVlA8sovUh
         EfBbA65y7vuJwXbsdGYrOxj2imf87/w7Bhk+nU24XwRFm3ITtmtL9Dq/Nz2o0X4mgQyg
         5MqN3XMH46x6+KDdpCZAngNNZm2m6v0y18Br+PvMkLRe1pbOXuUG0CdcyIB3PsWgPyhv
         DAgSHv/YHbgGIsoXGYlr9uD7OluHpGnZ1psARMqIGQUiWRWn68C42dUiaAnvTn+f1RaY
         JQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397960; x=1746002760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AT3w9qrvqNQ7asAkLzicRanFyPBT5NT85+7uOTViCI=;
        b=LLaOBqJXBmQOj4n0DNqBmKYnTOchC/Qmuyc7AcJ0zoZDiz+ySkcFbS31gx7LBD3nek
         kYRGHmLgPRipIxO0RyJyqVapZfItvdykW+O+lSbcKOUT8mukLYImJ1k3catdoK0EzQU7
         lLARPAbbl/6nylpNDLhuMBbcaeCnqfCJtRXyfOe4LKNewp79luWWVG+K4X3D6e4+8YGV
         5SiVZ89tRltfOhnFhq2xrwqJwrlyINOfmBgxBOcIasfbM+gEZ3H+yyjJxec/I/BZzhnY
         Mv1igQo8veEI2ltLSZITU3IaOZMeJPZyDSqIDSknXPIYIITLRKDcEBuxY/+VvanIcaGo
         z/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUkosBYVu6BVUP3t1hRZlwLk8nFUT2d0VkIuZU7xNFaM/8RA1FQ8zKKikX7llnM8BWQi8X4lSiY7EH98AE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcnn+2vYf76aWQiNmV/dg+fDEQHl5i/aoJdfo87TFCGAik9Hs8
	ABRcqXCiMfxIBfVrFSl8TazLhZfkJj2OI+NbcegpFupI3epMOn53OYPGcrM/Sv3BlHAVRj/3q33
	jxRfTh+pMzM9mdXLVSppfKrerujbxiGq/qN/FpQ==
X-Gm-Gg: ASbGnctvARxmkYsduZyyPCAHgd+z8XJox7hoHuE4q55AUAJptsbRRaXY55dPiHA1boJ
	RDX00Ob65ANx05yaE0KqzNalrbgGQ/h5caUjdcPtuA9bDTTThCkM6zgcLpL8852sL7emX5ZK/w1
	ghUwalbSCqEj9KDfv8lOtXjw==
X-Google-Smtp-Source: AGHT+IEM2sVrDJg1K3kkQKCG4hk7fklAp9PkKiypjTL5amBPKHe2ZUe0WuA6o3v/r3NttNzUZAhfuvsRPZ08Q44dSBc=
X-Received: by 2002:a05:6512:3b93:b0:545:154:52b0 with SMTP id
 2adb3069b0e04-54d6e62bd7cmr4837714e87.22.1745397960493; Wed, 23 Apr 2025
 01:46:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422075216.14073-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250422075216.14073-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:45:49 +0200
X-Gm-Features: ATxdqUE2HM1GEgTnOYS1QVQsQ7fnZaFaPHwIcG2bQqgtWcyPZI7J9UPs7LEWcpg
Message-ID: <CACRpkdb2shemvCLHuvKvSo0s62-=Qjmpxb-aTKjc_CEoFecywg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix new design debounce issue
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 9:52=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> Calculate the true offset of eint according to index.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

Looks like a serious issue, patch applied to fixes.

Yours,
Linus Walleij
