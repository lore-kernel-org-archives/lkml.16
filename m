Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262BF2E9EBA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254160; cv=none; b=ViN8bck2Qp/AxH/6tjuGdrAejq/7aCnl80BMM14oPE2Mtditg2c4hMcRSSIQAnlk3aR2XT/klY26RGtnKUf/H7ayShxEMCt60qLsgj6ldMjTR6XKFQBiX2dVNWKIJwNtB8PNE8AqN4wiYJMinbwb0UqTIDKPzokktIWds9S2qQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254160; c=relaxed/simple;
	bh=eEO+Aw2g4Ye3zeBEqfCg7cLkZgwkmnjuAHAb/18yzBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7SFhGBV0LSgdMdaFJ3a7YsspokpI2yQ2/bScrWE0gcz+JXdaJexIxnwzLRzICZe6Xng/xpMic2DcPS+8joXvWyz8dP6FKHLjHcg6AM8F/crJZvYKtkG/DtdPUBaoLwOMhba41FMY/RF7qn9mwXJzdtwqa3Zy+lar5IT08IxTJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gvqj5sC1; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gvqj5sC1"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235a3dd4f0dso44781895ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254158; x=1750858958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEO+Aw2g4Ye3zeBEqfCg7cLkZgwkmnjuAHAb/18yzBw=;
        b=Gvqj5sC1Fy0ke6h07ca6fdZDgXIrjDt+D0nDoWyhlXssNHKYtvdcuoeTxXh26WW/uV
         cq4ibyei8wFpWd9/AJRSDOl2VsQV5evLANN5JjCdhbH5NNo5L8MuvRfAxGQqMG2fNixW
         GcmSHwUr5oaVgvWQ0dlml+SW8mWAkn8wY6GNnNnzV7WNuvQHBSTwFQeRvGuqmjl5fyG8
         LjT0hINFaFOSv8Gj7ha4o3sNQf2M2OA3d/b/AA5jd1wn/FLOdhtyYPh6oVXIgQiES33L
         0C/zNe7ZsV2Nq/VJVudFJKykHsi8MIvbmEFXiuu5R7YFyCXAmAHmod8Onpf4Su8TGzB5
         Z0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254158; x=1750858958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEO+Aw2g4Ye3zeBEqfCg7cLkZgwkmnjuAHAb/18yzBw=;
        b=Aq+DhNhwzCTejjoU31mqQiVd3QxEZE7smZCjCrlz5kXCS2B2fgYVo+mIuKnDx6sdoK
         wlhlgk93qy7J1+iIHEubUlmKnNE94+LgggC2lo69ri+y3lnmgfgEJLQ/nHPIWgj+EOrS
         9mLRcvtuAEul5oOThh7ScHdxSywjpD3sWAj5cKzqXv6XIWa0a4xNEixftib8vHf+zPs2
         5qj2tG5iGAe4O7l6DLFTX3t82bav4q14QAFdyHvp6AiDzkxWg2hv7E0KCGXDu4eQSiZw
         bohlIVFTsza/UXdIAZHYo/JYbzGQgX8s3zcfZ/dXHStcPBdjYiifBMXokwN8vawisWUq
         IJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKxLT7Q0oQHEeaEuwcKH+sGIa1ikabPliKl0+xeka1jbJzNXtLuQDtEb0hDDfuvJkKjdwdbGh9tysARBg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0oUbLoqAy22YxnVtWcbWkDtV/21w/8QkbkBy7SrQSIYWfYDr5
	NjLlNgpxHyicxVz9qvAB2WMkyDme+aiXPjC+xBtpN/bpXlhmMi8O8C6J2+NwU+iBWZA6QiEGyfu
	XWG4vFDs+P+EywAqEzIQvsG35vOwbYwCcYPPCGeqjXw==
X-Gm-Gg: ASbGncuU5ATPNNspy9RSL4Q8pLVSK9Umt4+Z9AkK97GMxNd9mHBK14ZRJEB4ium6j7H
	R/0J0kLGWJ6UHycMoZvD5wvY7q/V0g8UvYvk17indb1uauf0hx/4OnrKqfVA0wlFZIEgUZI38bc
	c+f6HlrPtwLakEB9zA9Y6D+1Yv95FTJCXRYL0mWCoOtIFkWJhpji6npcWv+UgyjpPveA0L3nBjm
	A==
X-Google-Smtp-Source: AGHT+IE9RRF0iBcbNFXcUb8SkJRKabvVWjmiE253LTqxfYGXwndQn6/QT3ohHBsxRY1SrMjuBvVMrN/uQK3qBsQXw3o=
X-Received: by 2002:a17:902:cf0e:b0:234:d7b2:2aa9 with SMTP id
 d9443c01a7336-2366b1221femr273087145ad.29.1750254158312; Wed, 18 Jun 2025
 06:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250618102229eucas1p2a5d38013ee52a8a4a10d43449073e79e@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-4-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-4-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:42:23 +0200
X-Gm-Features: AX0GCFtH0tHQpQVePKw4GRZe0_n4DXj2kfns9aQPVtqgBIhjJI4B39bCzPcceGU
Message-ID: <CAMRc=Mcv6KJOCypOHF-KtFk6N-Z=eoMCqH0KuuUND=8J1YvrEw@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] drm/imagination: Use pwrseq for TH1520 GPU power management
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 12:22=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Update the Imagination PVR DRM driver to leverage the pwrseq framework
> for managing the power sequence of the GPU on the T-HEAD TH1520 SoC.
>
> To cleanly handle the TH1520's specific power requirements in the
> generic driver, this patch implements the "driver match data" pattern.
> The pvr_soc_data struct, associated with a compatible string in the
> of_device_id table, now holds pointers to platform-specific power_on and
> power_off functions.
>
> At probe time, the driver inspects the assigned power_on function
> pointer. If it points to the pwrseq variant, the driver calls
> devm_pwrseq_get("gpu-power"), requiring a valid sequencer and deferring
> probe on failure. Otherwise, it falls back to its standard manual reset
> initialization.
>
> The runtime PM callbacks, pvr_power_device_resume() and
> pvr_power_device_suspend(), call the power_on and power_off function
> pointers. Helper functions for both manual and pwrseq-based sequences
> are introduced to support this.
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

IMO it's much better this way, thanks.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
