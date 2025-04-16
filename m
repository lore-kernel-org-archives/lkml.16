Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD9918787A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787944; cv=none; b=kRrOehKyXa+c0dpCePufDuTN2+LyjCTbOA6c/zU9TsBA6nfZpys2FeYaOQ+RYBdfG1agB4UiZW2pzrrPk1XlButyXnhAU6vJdaO0Ey+SGj3Q5i08K+pq91E0qBc0S2EsXYExQ5XMABpkA/yDcUVC4avJRCOVjnkDLA72LGfV4pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787944; c=relaxed/simple;
	bh=BkS4uPdvDvbJ2DALywXghgt7BHAXTRGcUTYN61PrStQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjOjjfRjPsfYQEimIh+dFf8qGLSpXP+32aD2Z//Ys0eOITrgpRzQ388dv4bONOZKTETSWR/1Ixvu+CMIoHP7IJuJGEbSJa3xlm6tTUV2ACicR4Z0p9cw5y8FcT3m0Tq/23TfLli1Hz8aXJXirgtyr4ueqbRbjZ4VYzKXshEwGTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QmMuePer; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QmMuePer"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso61119611fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744787941; x=1745392741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFJXzkHk3Kj2IxuOJ/Ep1Of/eMdCvzxnv7r1gWoCH1U=;
        b=QmMuePerU5PTXo6HR3Aucz8SUf1KcCN2TT/OeBAiY9HiWr+bPpONikh8N57kgWYfLj
         9WQjJpi9y7tEypx8b59qUamD39j9gy2tl2PNvodN3Y1lYwhmIzG090L/z+CTsH8N5xhu
         bEx8h/GbWfcy75gMxf6jBGQ1KZFJkY9of0+26wFP0W7WnbILGUsXXDmPngwsLtFWL5cJ
         IJcMmKV8GPkBEN+scLMXesR2Oi+0cKHl69+KNLeVdTtIBhLGi8lvxjlhBX9VisyMiFBu
         OFKBW2GMMlPKlwR0RAvUr04Yftl9iJb3LwKDQ2F2EFDU6PSdPO8/On4QdCt7fv3IsKpV
         zTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744787941; x=1745392741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFJXzkHk3Kj2IxuOJ/Ep1Of/eMdCvzxnv7r1gWoCH1U=;
        b=xNqAWs3Wq/T4/OLOR/sIC+iYxQGSU6uoJ5kDAZzaJl+Aism/jJSC8z00jbXfRP8oLq
         ASvlXiK2jltxORNBnpVCl3vyFVS+7WSUVIn+xomTXDVCuIjV8LsU9AKRtklIgvGA4Wl/
         M9roNXYPGZriTEnmfjNQ05tOC1gj6q7xrmWtrdGSQEbfDOCm76Om/GB18PlnKJiOIM1a
         jmVzCe1JUpixyIVuf2pIskUqWv+WaPhqi6jWsGXXyp0zeW8De1WU7YCCLtZRPf8q0ftj
         ZmdxMZd5FXAsK2mTgnFtHHfqxIfaZ1KDF3n7kFgDfZivqGss18ZJp8eHiUK8CUwx3i1z
         fl8w==
X-Forwarded-Encrypted: i=1; AJvYcCU5Zi73yAXxQ1bQIs7IC6CRxNsxKzpArPhf6V0srOEog9qyPgRYq0+EVW1lvOuy+yasoh5zjKZZjukrsUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbIcHokS8lkvvP6X6xhRrXgQj3sIzV/Hwy4xSa07HaDBLYImvK
	WG0mjDYIJ2QQCGoJzuO2KJMDyMfLdrDfBj/EcDHo9eo2snNDFqUAklF+Z+zeySmlWI6hGdrcgwe
	cNrbuPG47tdXfNikzwQx/PhFN3fxTu/f45WeqWw==
X-Gm-Gg: ASbGnctv6h/Eq9KJ78ogFN4CrV8xIl3DLxCYEp6FCn0zTeV4PxAceE2WWuqANoenMGA
	FcWOt62Wl8Qdgx1VPcjmXLcWVILSLkFhtHaqG7dUurF1sBvAG5UTmmoOGUjOz2GUI2s0/OVu8pS
	G//ERN0wdPZdA45TjGHfXmL1Vqc72SGVRi
X-Google-Smtp-Source: AGHT+IEwGuf6I9l4WitaTnVvA0VbevlCNH9pw1Uf1YwESFwjIdIWV04UPwa2Rl6g3j8USJoLTzOTQddgM+ExezMBQpQ=
X-Received: by 2002:a05:651c:12c1:b0:30b:ed5a:6f3c with SMTP id
 38308e7fff4ca-3107f6bcf91mr2027921fa.10.1744787940653; Wed, 16 Apr 2025
 00:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:18:49 +0200
X-Gm-Features: ATxdqUHFBx4p6s8-l7d5L0o8ZWLKTNSVqhv1VO0pGzs9J7s5wacyrKjxAz3vpys
Message-ID: <CACRpkdbKXfQVNGm=QoCHE8xeMKDi5Z1jCmk18XAaTzCcWCDjuA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Pin Controller support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, sean.wang@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the pin controller
> of the MediaTek Dimensity 1200 (MT6893) SoC.
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: pinctrl: mediatek: Add support for MT6893
>   pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200

Patches 1 & 2 are clean and simple to understand, so
I applied them to the pinctrl tree!

>   arm64: dts: mediatek: Add MT6893 pinmux macro header file

Please apply this through the SoC tree.

Yours,
Linus Walleij
