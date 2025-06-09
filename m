Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62E21CC71
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749489427; cv=none; b=fwBrRK8nlw4d3iyhsV1RHmqLh9rUQi9noOCcptzordD3wytHZIOKcuvAjyZsVFzmraXaPy/r6M3MISdF/Yp0IzH9LCKWmxGDbkvOawdmEiG2yVWv3FETUC4VR9miaBP5D2lwaywxWY5uYh0PLLB9MWsd9uOJ1rC560+liTn4+bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749489427; c=relaxed/simple;
	bh=5oGTiqZZ307BYUtl7pSWk3mn+buTV5YFy2oIxQ/JqhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLIG2nfjix12byZcPWJxOU/gxHoVhlLh/7DFJ0YOQreK2uT51wCw+GAx9xSoFwj9lTwclXBW5G4IbRQNPbEH+BH8xO19fxXw60KiHx3c/dlRr8UlY+9fRXaZ4bkzCCcOOrx3z05xJqrz/bTiUzcNAA3fo7t+lh/Tdbjj+DRP9Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D4EKxbVB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D4EKxbVB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2345c60507bso32154655ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749489425; x=1750094225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/2NxgbZkE/fQYT/wKRne1lqFrqdcfx1xvEW+2vsryw=;
        b=D4EKxbVB+kv4BEjwt7W8dMhCB7rqpYpGWoyzL/SlSIp+K010+QhYMeHWh45s8ARPjY
         cxxMtidtcRyoAPKTDJIlScF9+/Xk2wUQbkPNK3d7vLSFdnA2jpv3GPC6T6CwlliUKezb
         59WKMHO2pQN24hVnFgSs/VMH9krDsGvGMdOcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749489425; x=1750094225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/2NxgbZkE/fQYT/wKRne1lqFrqdcfx1xvEW+2vsryw=;
        b=Gl+wiNIWMin1Up62SgzsiTXOBcuFXXSet8hfCY+auWhzcpY24KEsSAsVVX5C0QZ4qZ
         +0geQvnOxp+9YRPKTP/85t4TtaiHQMPFtf7eWPk2NdJh18JOgZHRr1aMWOJ+KWbb0UAF
         A2I4eY1I7tR9sGLwkynTq7oG9NC/1apTBVgPOHGbvtpabK4Bz+MKYxv6VBqsCF5JeQFv
         YP0ye3xIeWsZrFK2WGaJEon7wsIYAgGxmqV619wDzJwoWEcUHKXhRlXMICH3D9/S1nI3
         l2aEb5NTf77q7qmkA8lXR0840wdaMdhLZpiw03p+1m7E7hLr0qdbD32jWb4uIAG08F0e
         kaAA==
X-Gm-Message-State: AOJu0YxpdsWKzGHILqkhSEYNCsebgvhHHXlT5gxInGcOV5FwfTmLqdZh
	iYZ9iwxv7Hn3YnV+2Qa9aYG7N3VYIt4VjEsceVNWNKDzd3yiZfoqURU++m864hu0p3gCBs1xQ42
	FZWc=
X-Gm-Gg: ASbGncugoH9zZbDQ3ebl+61/aqOaJ/sGejAeLuJQXoDzs7I118Fv49c3k0JCGoTMbAD
	9kYORRncBzxwxPorgdvon84mX229CMzeKiUnXbRyl48qInLGTLrbQROP88qozfkJMzfpud9z2iM
	c4cnrNPj15rysHDNAWEQUVbSfWpF52CTGTuxn1vg1Bkb2QGtyQWdMAX0ZeDBRz+ZP2WxFhb50Ea
	a7oSlZNllLVS1GGTcio8VbGz7VR+R6eRjhCGHJNRjsTG5PgdLVGl1cwoNT7aeKm3h/afOINgt14
	fDHTvo3Bok+vmklWGZQrEN6TCIG8B4GxJb7+/9fnETlgVNpC5EfgYx0BIIAQID4ty6AuweR0k3K
	HqEF7Pn+YOSQYSWnvwdI5Y9DsbUJBWg==
X-Google-Smtp-Source: AGHT+IHEnqJo2dUDRhKiuFBkqhLnx3tbrZzXNU3LDPR106ISirZuxtHvjib/RX4GZEMQs3K9/qrfcA==
X-Received: by 2002:a17:903:230e:b0:235:eb71:a386 with SMTP id d9443c01a7336-23601dd7c06mr175103965ad.50.1749489425086;
        Mon, 09 Jun 2025 10:17:05 -0700 (PDT)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030780bcsm57272615ad.15.2025.06.09.10.17.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 10:17:04 -0700 (PDT)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b2c384b2945so3440823a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:17:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4e:b0:30c:540b:9ba with SMTP id
 98e67ed59e1d1-313472e6282mr19857290a91.10.1749489423504; Mon, 09 Jun 2025
 10:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605001253.46084-1-yury.norov@gmail.com>
In-Reply-To: <20250605001253.46084-1-yury.norov@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 10:16:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VzTK517-JMRNBQ6_YtOQKqQEfO_7-pt5H+w1jsUtpqGg@mail.gmail.com>
X-Gm-Features: AX0GCFtnGtBi1pan1Rdck-YO4C7qI04Np6hcULyTpq9k9UKcZzyHeJeS_jIpHyw
Message-ID: <CAD=FV=VzTK517-JMRNBQ6_YtOQKqQEfO_7-pt5H+w1jsUtpqGg@mail.gmail.com>
Subject: Re: [PATCH] watchdog: fix opencoded cpumask_next_wrap() in watchdog_next_cpu()
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 4, 2025 at 5:12=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
>
> The dedicated helper is more verbose and efficient comparing to
> cpumask_next() followed by cpumask_first().
>
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> ---
>  kernel/watchdog_buddy.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
