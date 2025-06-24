Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870A52D2388
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773491; cv=none; b=dJQTg8hAX3C0CC6Hsr4iPt5V+pOY+Pg7TodZbj5WOiGLrk3kf6VI+1AAm0b/b/CDR4GGOGBWrZVTW7/0veaPBTSePA/kBBcYcdBTLn6jR9wZWloqd4bBx3WtZVSa+J3dJx5Ua+Z6N+vSyoI4U38UME0ga15P1FfJix6q5gFl7IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773491; c=relaxed/simple;
	bh=SRjdE7mQm9t+sBYLoVgmd8fzr5KQH8TyP1VOA9ZnGvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+66hTFm+hh/7Jpm6i2vFAG+5GQRQW8GI0VJ77SlBxgJhqrH4iAHwnTXWa3mIL8AC5Ji1NZsG4c9gkm1A641R6gdN3pRshBma5WYJy3SP0QYNHiLonv2kIesqgItLnebsRJOgp+pxXSp1ULgfNIcEluJDNTu4L3EiDPqQAOzL48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zkLyr3M4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zkLyr3M4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so748117f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750773488; x=1751378288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfdwBnmwXKVxo4fI9YpCbPX/DuxoUKCmsus+7StatJk=;
        b=zkLyr3M4dif6AUhJ/unJG1Dxli+hAi3LwxS/pQ9gwc6jo0Wqb/L20TS/fWcUZSVojO
         M7/XpPdfqDyVVMPCGhr4P2rlLo/hsqxy5lz6HmUicJ1YLQGp+3QS+GF9t3fbGpGRS4gh
         xmxgVA886av4phe83Nvv/aYWyqbWWTsnHSA1nq/NgztXD+tsJkMdmv5BlbVQ48yQRPD7
         fCHyYilmjNvLVRFsBXuzn9eVWGFFF0FsgIqwOQyIjYv4UT4SNChp03BXOtnTEvvbQAzp
         +xIRVF7vmvqwL0tkfJtl0NbKlr5Y2EOgn+Z9yse5DkctMGQBDpy6ErxdZ+VEeEd1TpuI
         EjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773488; x=1751378288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfdwBnmwXKVxo4fI9YpCbPX/DuxoUKCmsus+7StatJk=;
        b=YR0NaktnGanaHFpEgtsimAEQWlhUNnzowWSjMr/Hhb+jSnt1g5eASzf7SRMpH6QBlS
         VUh7eKHaxbl2o4Y1atldIDcB5eZBB97HoHyH0aZdOctUfSdKJINHxGJNTAbU575IAYLB
         ZP+i1/xk2b0HZIH3xctoYyGvopLV6fQc56S//obgmGkusaZ2pCPBMpMpreFNJTtDnBpP
         H01bgliBANWhfKBNgHzUicBDpIruMUb/FEY3cqvZh2pfzDqC7qn5gsBSaZ7/EesCTKyV
         WKzymrCXvA1m9mnCKUkDpuIR68SGEV39DzKZX9xJBxOda38kpR6bAeJqzODLzzL1ei+f
         DBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkMlFKFqHbNW6g1p1zd5wr283OngfKRN2f7hF1QR5iIS0FdeZ3viawwKo2Z+n2kVzwIYp58JwDl6acsYg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxls/ptK3YKT/z0PEGbJf6uxd0mT0v40iM5IQEpD3ahPsT721Vg
	/2jFs78NsKY2UwcuSGPIuLpowXggr894kxiBgUbtCZXezTSFQBBq5OoB8Ct0nFu9Ma0=
X-Gm-Gg: ASbGncsUUgJXsstyAM1Gg0sVirDa6GrAY5dCoivZGk7etGcXmTUvfPVgoMPkNQfHUaa
	jodOLCFw3jGeKaZsfAti3IA9oBVMUbTtkTMot97Ie+r5SdK0RM1ZW78/rK44w+HTNL8BdGK4G7q
	/mIdW8d+yz2dvtlLgg/XjbzWRBtkKpCkHZrI31M6ghfJwQisQAOeSvNys720SN+Cu609aE2UZQl
	I0cYlvvbAOFBtB0751ZoDLgXJ8BppM2kwtnM3fNqWxX/Ga1qyN/vKSwopYjz4JoCxKGZxFCU+C2
	LsVLHkNEor/8GXjyWl8mF+amvPvQZrKzoio5UgBuULEYcNnZVR/KTTIfkTts7g==
X-Google-Smtp-Source: AGHT+IE2FNywqz+cFb7euMKYbolnteHJlkDlULxTNl06mbXFoTDBF9qk9BsatavRg5P2dnisXCo5bg==
X-Received: by 2002:a05:6000:4109:b0:3a4:f892:de7f with SMTP id ffacd0b85a97d-3a6d13071e8mr12590091f8f.36.1750773487721;
        Tue, 24 Jun 2025 06:58:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e811724bsm1966761f8f.100.2025.06.24.06.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:58:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v6 0/8] Add TH1520 GPU support with power sequencing
Date: Tue, 24 Jun 2025 15:58:03 +0200
Message-ID: <175077347940.80530.12388970181360361507.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
References: <CGME20250623114429eucas1p1e74e09e74c5873b2f7f01228073be72a@eucas1p1.samsung.com> <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 23 Jun 2025 13:42:38 +0200, Michal Wilczynski wrote:
> This patch series introduces support for the Imagination IMG BXM-4-64
> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
> managing the GPU's complex power-up and power-down sequence, which
> involves multiple clocks and resets.
> 
> The TH1520 GPU requires a specific sequence to be followed for its
> clocks and resets to ensure correct operation. Initial discussions and
> an earlier version of this series explored managing this via the generic
> power domain (genpd) framework. However, following further discussions
> with kernel maintainers [1], the approach has been reworked to utilize
> the dedicated power sequencing (pwrseq) framework.
> 
> [...]

Applied, thanks!

[1/8] power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver
      https://git.kernel.org/brgl/linux/c/d4c2d9b5b7ceed14a3a835fd969bb0699b9608d3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
