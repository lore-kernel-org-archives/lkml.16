Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97089286436
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865183; cv=none; b=HXWkA3sBXTKpwnlAeH1aCySXADeu5QdLp0xDX5eb3o5WhBl+m7fCTfF4JLlwM7VSpdyJ+cNYHtBcc/0djaLP+gJIdSm+Ya/bG93cJkiCXM9IGci/IUZPtdzzAs7Tqu2dBk8H6wPMU0KjxJL5nhfBRzkFcehZyZRusskWESUcVSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865183; c=relaxed/simple;
	bh=xce5qy/Ve8LCVnoIE2XeM4ZxdOOd3uUzCKUqXaf1QiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PN/twbluUGrD5zBVJqzlSDJr8Gcuxqz4YbKXZ1il4guafGptp7PJX4ywfGqff6vIC4oROiISj08IW1/pUhxgwZ/6EGFFfS2sYCO/bL95I6mR5CeusiufCLE6RJgNuOLizShA3WH0dOSLx8x4HhkYEtAghV79JlN9gRkSCMj4p80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=Nnjj5GIf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="Nnjj5GIf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c33677183so65315ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750865181; x=1751469981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gE8jHxo+PQ6FPeXXY1t5SkeB5q8vcyLGyWcRWobT2vU=;
        b=Nnjj5GIfdnTXgCXBEJYzMMDdKUvsG0YVm1doP/cb2HYdH5bzlf5CRIPqPzosv8qF7/
         C03vCiHEwwX5MfSATrSjcKPr4kLBJCV26fbgrPNHwPq7kzjybk+MR5+Lr3hNByuiZl6r
         Umd7WyGhPf+kzn1ZkjiKgZxxVQdIyXTWkvmVwEvKtuVPGva8guWQ4zo0+Rw0eiEQWvGk
         tD9kDdS1mIznYbCGBBfjoqZT5Ey4FbT6zR6iaEeUtUlLpF85xGWqv5f2MBv6oqW9Cfbw
         L41F7/h7H026U8Z6I+duoKQMnJRgsCiy+2Mfg5264HtRBq7a97vssgAGWJPw02qX8VXA
         X4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865181; x=1751469981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE8jHxo+PQ6FPeXXY1t5SkeB5q8vcyLGyWcRWobT2vU=;
        b=gmKZpWHsr7z1srq0es2w8SVppxeenaDZkm0TN85vygiUahjrEKerGx2bwGVzuqFbhE
         oiJ8T3yTT9k6KJrjuFdJgzjH7qqPQZH5ZvX/Z0uxB/bIghmr0EGANAPnIOGtRCBP6akU
         wlGP4gUKny4IviKtA4I6eIwGA15jnuwqZnYMN1+C45vHk3GPLhMICXvZ0MM4xhYRuplk
         aeCjPmxtBBbwaSLxPMDxls6sw0lhW/J9Ka0PmYUNkbP6Azfz35EtNOZoHvJhiX7Ris/a
         jHOvWVJm+NUbEf47j9gkxf4FguWzWH/VI2SLFaIDIzAqSnGIc2ujPxWpR/bRUtfLQpky
         3wyw==
X-Forwarded-Encrypted: i=1; AJvYcCVL/Y+VDfDsIO1KOMytNUIuG8bs3Yrq68X+fRYNV0VTNr0giFAPg//+tHw0B8beujP8kltlmdhhv37JTdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4XA7sxrPyV2ipOkWqEEKdHqYypm3fSKSnn0U+tAxWBZpDoyjP
	odlaAOddbgbAsdBwGGX3+SYp0B/uT/15WdOdDyMGx3OtCk2diXZNUertGUpIfteJ95Y=
X-Gm-Gg: ASbGncuidjMIdFWD0OuO1Ou5SAFx7NfDy9K1EnOe8U9+aXQZvTErsA1v1MwzdkWkft0
	fB0JHZsbL4x/5cF2+wZITswfCsmn4UmdeaunvFAFXEStSFg1N1IC/0Rg32L2gds19ebqI2/McW1
	tL6ORZ+GlV45QXmI2bJOuKOamczHbwhkx7IILeJBT1W8Rp0xAaCluhN6Bj8ISeZXhaEaJ1GzFOL
	lyWL+6I4Cg2BENbPtIwjCENCw8ByvSUmwCleOz7eWGdKryI+tiH9E8Y+unp0IBtdw8bQVeAmhui
	3SLktoBHH8KaxE7c5Qq9jAzr91a7UssG3tmr/2D1B6/JiPdNzXtwnq5lmQYdNxagAbyW3xWiy9/
	jEDdSZd8L
X-Google-Smtp-Source: AGHT+IHrt+1gjc7s6rRerhB4Z7Hf4zvb7Zi6obxep/7tJ3hlo/78JEJ8gL2cW7XB4z6XD8DMAOJnew==
X-Received: by 2002:a17:902:f552:b0:235:655:11aa with SMTP id d9443c01a7336-238243620b9mr62700495ad.39.1750865180734;
        Wed, 25 Jun 2025 08:26:20 -0700 (PDT)
Received: from x1 (97-120-252-192.ptld.qwest.net. [97.120.252.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d839354esm137239885ad.16.2025.06.25.08.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:26:20 -0700 (PDT)
Date: Wed, 25 Jun 2025 08:26:18 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
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
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/8] Add TH1520 GPU support with power sequencing
Message-ID: <aFwVGkAbRUm0j1hv@x1>
References: <CGME20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <aFNrRtbWzeRa7GmQ@x1>
 <12eed587-a8f3-4a67-8808-5e32617ded93@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12eed587-a8f3-4a67-8808-5e32617ded93@samsung.com>

On Mon, Jun 23, 2025 at 10:17:36AM +0200, Michal Wilczynski wrote:
> Hi,
> 
> Apologies for the late reply, it was a long weekend in Poland and I was
> away without access to e-mail.
> 
> This is the Imagination repository that hosts the firmware [1].
> Admittedly I'm not using the newest firmware blobs available, as per
> discussion here [2] I downloaded mine last year so haven't tested the
> new ones yet.
> 
> For my own testing, I  embed the firmware directly into the kernel to
> avoid issues with the initramfs. If you're compiling your own kernel,
> you can do this with the following configuration options:
> 
> CONFIG_EXTRA_FIRMWARE="powervr/rogue_36.52.104.182_v1.fw"
> CONFIG_EXTRA_FIRMWARE_DIR="/home/local_user"

Thank you, that worked.

[    1.041146] powervr ffef400000.gpu: [drm] loaded firmware powervr/rogue_36.52.104.182_v1.fw
[    1.049654] powervr ffef400000.gpu: [drm] FW version v1.0 (build 6734358 OS)
[    1.062024] [drm] Initialized powervr 1.0.0 for ffef400000.gpu on minor 0

-Drew
