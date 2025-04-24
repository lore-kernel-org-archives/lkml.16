Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E80F236A88
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487070; cv=none; b=utZVPx7dQBEQXPd6FhLlZ2FHI4XtkN84ppvsuzTaQBLCsoHvkGpDrMwTze8kjNe7MkIBVsm9h4+RUoTUzFpcCN3CW5AQfcnZHDcgTNuW4TwOg1dwf0gjq3WeQesQwdx1JW/9cUQA0incYJ3FnN8/dp0ztgtpt9vU/HgTPqnrIU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487070; c=relaxed/simple;
	bh=/OFUtc6E14wdV65P9yIfONJCg9qWhxxWMsqL7KKETGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyQiZIY98JItarx+zgVryWBEP615WwTGGk4T0P2rAKEWF05ibkLZzvmtKghStQvJJpF2X8yWo9lQuGMZ/NRNIDA6861nFc1uFumfQ8CmJ8lkdKCQwJs6lolgABJo9+EsqQ0gVevR0Od89AvBi1oXLdZd24ycNdV+FgnMUU+5aIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hhQ79utJ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hhQ79utJ"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d98aa5981so976705e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745487066; x=1746091866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OFUtc6E14wdV65P9yIfONJCg9qWhxxWMsqL7KKETGU=;
        b=hhQ79utJ6AyqNM94SbvQa3jNwOeZIZQKoqPqEc9fAHh170tSKY8T7jb5rk9hag9dVc
         m1Wm1mHGviWpjAdZThvM2F5Wn2wpVlov71sXRQiqN94pn9aGPaCDNy0zurOSvgExBHwp
         /s3KlWdVTWU5bY4/RIzD2yTnn6Yoy6NBCy/HvPjAlZerBOung7sGqAAk2gMwN1/l5a8C
         ptOJT4fILOUa6ULFhnuXkzdyWxzYaPMpL/obFpmye7aPqB6Eq0Nl7neLS6cYaZz7RaxC
         9QYwK7URPiXnA6Dk+EQEaj8xzVMwY2DblWmGhfH5IJQ8hhP7J5gAo5bDqHLRdY01s6GR
         86Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487066; x=1746091866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OFUtc6E14wdV65P9yIfONJCg9qWhxxWMsqL7KKETGU=;
        b=ZnsybFxwhmUpxp+wGSibK4ce0a1toPvoTO0t4XDq21WM0wtOF27d5T8PMRY6GgsmmX
         BzmtAVJzFr3+C6QM3lYZeleBYwQsA3HjXnMVvta0+6M5cGPhwnvkzJ/6503bGKOfkDub
         tGnb+D+caa3R3ZlmSM/Q1yP0tMjt+RCTy0K9I/s+1eV1wQJ2vQnz8iF+SdSh0csdY5FM
         oEgkTvagyX+qrmbGmXqOzy0vZhWlpbAUjmTMNhTw5JP5Rjdg/DSQKm5eFeehDL9Gsyrw
         UDNbPOvm8dxm30nuFd7wtcQHPU2+2rgZLJcTLjagzI0UBhTl/L6cMWTRyICEeRaUAmEA
         3zog==
X-Forwarded-Encrypted: i=1; AJvYcCVWqp4jiD6ytm67dZnkZ8nXwemxRvHhmerzopcS0wqxr/LjcgYc0oqXpGWDkHDPrgT+Ne/ooXeaD6ZMWYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDY3usmUp23E3GCERKMGCaSrQAakuVg/Bzy1tdGhIM3/dVMhyC
	ALDX25dqjXBMEADTSeUdN3C2cnor3JYtDIirVJcQwg7spcp3/FBqW1nOzpSbxMWswX17hiIBtqs
	j7efIpuUN87FAO4GxXoBHjOQ3oFH5X04VvEp5uA==
X-Gm-Gg: ASbGncuu+Y+OTFWvaJhNJ6q/PCxmZbl17NUdVpG7B6fAvN5VEbie/17Nap36MU8H9m6
	trsyXINHj8IznpzmATfuCGKfasIPXF4Vz3skom4MTEaSj4QiOWrZ4Jc4aFei3/hU72scvQ+pBVi
	SbFkbY1g9RsUcpdSWCr+TqmZ8qmPXabAUNXXtSwQMxbrXs6HBdsia0aw==
X-Google-Smtp-Source: AGHT+IHsrcwDupy17KAeauM93eCNYxhglhW02BiNTpc5bBXPbxtFIaFqSommlAPszsE+qNtEV18lQUWNZqxLQ8RBYlo=
X-Received: by 2002:a05:6512:2249:b0:545:2953:1667 with SMTP id
 2adb3069b0e04-54e7c3f2750mr606356e87.13.1745487066171; Thu, 24 Apr 2025
 02:31:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
 <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-1-f3fde2e529d8@collabora.com>
In-Reply-To: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-1-f3fde2e529d8@collabora.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 11:30:54 +0200
X-Gm-Features: ATxdqUEmwhcixS5po8qzLJ1UaZ3b5-0QLF1L8tULREqHXKqmqmDdo2m_9ncmEOo
Message-ID: <CAMRc=MfgfZnQ4SarQGqNXF_f+rOQgiS49AHFKAKCtHTmStxZrw@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net: ethernet: mtk-star-emac: fix spinlock
 recursion issues on rx/tx poll
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
> Use spin_lock_irqsave and spin_unlock_irqrestore instead of spin_lock
> and spin_unlock in mtk_star_emac driver to avoid spinlock recursion
> occurrence that can happen when enabling the DMA interrupts again in
> rx/tx poll.
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
