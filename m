Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AE126A1CF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969414; cv=none; b=nMKDIsjOa8fRwkguNEoRfcu8SNv1IC/wwqAfqUunROQWZCdW7kvu8+wPT1zvSVHVe5nOTqwe3oM43FyuZIGqlB5wvOqfyyuBkBV7BtQ5PuTmsrdNdAPIwKZfrpfc0V+wHFPdI9Dw5lZ+L/50lrRltNu+myjE1/+7QUMo7fdn1QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969414; c=relaxed/simple;
	bh=31c6mk3Qppusl0KxmurGZOtNxpuNOByMJpInrgjLOxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dvE4X2b7l4L5VQcyz+pz+zyBUPj8x0p32Tf7Tbhtezzo0v0vISGtsghsTTOtieyBE7SjfcAElvEiZXfe9lWB95NZhLSOyo9sFAmKmuVwFAJgzA3sd38TdyEGrr2FVt9GvI5o2SulRzBo/98MQ0q6HPzzNWdcbrwoZDARLRU+C/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=I47fiTUm; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="I47fiTUm"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47677b77725so18378201cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 02:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1744969410; x=1745574210; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kFpo5oEBW5stbppkFOY++LlhDbuxsd6jJIOfBbyrv08=;
        b=I47fiTUmdn1TqlyZDbr1OgzBROzaOvXLkmOu/Lj8PINtOHe/0vpBpvQAP6EpVj5yz5
         eAUJlfwOhgebTyXWqqxasHwQhrpLHapjpYe4jWGPF9tA+MJ9Fdl+5h7+5bu2RR85aj7X
         5RLQiC/PjlWW8xsLxy1zimSyY/HJ+prZNM27QqP6UOcIbehjnxVHjKtqn/ajiHxEQzKq
         FpYbnNPC9tqX474PjxKng6nhpKEXlfah8sp0d9yRZV2EsU28yq5DPZCC267SzwzHadkG
         RVXJekK+0VJQlcUktFqwqLKlNkijxDOPaAabEmg/pN8A6umKMRTCBjx++6AhOLa/uXPo
         TknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969410; x=1745574210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFpo5oEBW5stbppkFOY++LlhDbuxsd6jJIOfBbyrv08=;
        b=AtG2jZ+CbiJ78v+znp7HNycvB0ToNyWUMPBuih/unwrPmQH9U3ExywZwDrmnuov7gz
         tycaGZoKaEw90CJTvPAzOlqyxSCkaPmDtAqbr9ySjv/+eMWTUqzuSyKsoy1j694TT3m8
         CITb5FEvdxy4h4uhQbELTc4S+Y6fWMEwqOoThJKuU2/ZFwRynaKPuNVSjr683wyKWWGz
         aNiurwsJ62znb2vcKPFTVj27Xsf15oCVixVIK4xiCjOaih4xdGz/LJdCDX4gWW4eZjRL
         qtD+KIG/2jli64C7P1ckCFxdoDCylBff+4NxpjCL/YAl2PEhUghXAMG1IjHd7hfILosC
         vD+g==
X-Forwarded-Encrypted: i=1; AJvYcCU140wwKlNwCXKrn/qpx6eCpvVnYKjLmJjTxxVVwneT8HwN0NscmsHbkSYTAcmFHz4wxSGxtpjmBRKp9sM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmkFYgP0TuuLSd+7BaC8x+HT1jHbBTf1M63CKrTiyUpm68Sil
	khprqdYSWs1d/OBKm2xwh35YfFGFqoIDUiNMNFTQ4oD9ShBPvtX9JcL3KSHEBNH33/w0ipmJB5z
	fo2+ZbAx2jSnRsdo56xDPZpWDkZb2M9YVOMGouQ==
X-Gm-Gg: ASbGncvflu416G63MR3zIS0GByQOEOmk5cDSGOU3Cx8SdvD7sZ5aBXTvuao2aeUsklT
	Bg56m/knXbpfdk7DVmnahYh8Hhhh/1xozkexi/g2llM5XliHPEZw0MuYsBQaKxl8m/dIzP854xf
	JqtUYvm1OfzjxyOjvsrqJ+hE2oBVjgbg==
X-Google-Smtp-Source: AGHT+IELNPez3z5hE7XPdAn+/JmuPm4/LRceRqb1tqN8GldH7aTJ6b0D5paprWRXm4NnYwwtrill8wPC4uiDxVjoiEM=
X-Received: by 2002:a05:622a:1a95:b0:47a:e53a:5762 with SMTP id
 d75a77b69052e-47aec394ccdmr27568231cf.22.1744969410714; Fri, 18 Apr 2025
 02:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414095332.9674-1-mail@etehtsea.me> <20250417065759.5948-1-mail@etehtsea.me>
 <17402f2e.360.1964640c3d3.Coremail.andyshrk@163.com>
In-Reply-To: <17402f2e.360.1964640c3d3.Coremail.andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 18 Apr 2025 10:43:19 +0100
X-Gm-Features: ATxdqUGMyPtODmDTih2v_sR4LqFZ8n_GN4IoaxZBEb6HaOtqp6Dx3gQ7MviTVqg
Message-ID: <CAPj87rNDsyBfy=P=0SzTm7u6Na6BpeZSpEt1mRPhLCd6rHXzTA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/rockchip: Disable AFBC for res >2560 on rk3399
To: Andy Yan <andyshrk@163.com>
Cc: Konstantin Shabanov <mail@etehtsea.me>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dan Callaghan <djc@djc.id.au>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Fri, 18 Apr 2025 at 01:16, Andy Yan <andyshrk@163.com> wrote:
> I prefer the V1 version PATCH[0]. This is because we do not deal with hardware-related
> differences at this level.  It involves a VOP-related restriction and we always  handle
> limitiation like this  within the VOP driver .

As said in the review for v1, this is not enough for generic userspace.

If drmModeAddFB2WithModifiers() fails, userspace knows that the buffer
can never work in that configuration, and it should fall back. If
drmModeAtomicCommit(DRM_MODE_ATOMIC_TEST_ONLY) fails, userspace does
not know that the buffer can _never_ work, because the failure may be
transient or due to a combination of things.

Returning the more localised error saves userspace a lot of work and
enables a more optimal system.

Cheers,
Daniel
