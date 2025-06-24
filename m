Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA402D1F55
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776057; cv=none; b=ng6j03pwWtWxny4Wyw99o3uzRVOB/vQxfVkm+bQYgLvj+rHecyKp7BXUNxEb8Zp7gEJDlwkDDQ+c5u8eeaVMb2z9u9yVouoBKEFA/3OZrp+oDGxtc9Q6VFuQatdr9WTT9sIKU1HKH6Ff2WVjW5pG4c4nvscQfKO7dWZ54ICXdwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776057; c=relaxed/simple;
	bh=EzNCs9Ria+/nsHScn6KKXudzA13G16dAU3b2TbhXQXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bClw2Lz4LV6v6u3XTzseVAG4VZ6O7iLc5IjOHvoQ8S+SxRWraIGU+DcNM4E6vmFOfNs6XxhNGU2Q22QJaGx1ZdjbMlptXBuljuxSisWImMzps76xjjOxEGon5syG6OsZbRTM7SLDccfXt8e8GN0Jubjgti8JxoilVb7J/JK6HPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dvng8qUo; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dvng8qUo"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b60de463so5879106e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750776054; x=1751380854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzNCs9Ria+/nsHScn6KKXudzA13G16dAU3b2TbhXQXY=;
        b=dvng8qUodpYwB9Rkao4BI7wCKrDuFIdghJQY4ZB/h0bA7MYDdExo9ZRw4bWycAbixC
         UcJG0Zgg7gGQJTTRz58PGLzshfysFnnpoDoO/U0Z48TQxCeKNtp2x1eaxltD5Zo0nary
         FyEhfNXkmjAjKQQ041WytH0ukSBdoS20QqlXlkzDxhoYNuZQvE88yXUZk/NIVp10BDvp
         qHGorhVQjttrFD3ddQMpgmymL6UX7S70XhI52g+mGw3ellr3f7n/43ZnwJPWiqxywJex
         DmYjVpoK86fZYuwRfs83wLa/RfnTeBLqQR37X6RQIoNg/CnZ037lZAk9JQUehLi8KIl2
         dFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776054; x=1751380854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzNCs9Ria+/nsHScn6KKXudzA13G16dAU3b2TbhXQXY=;
        b=XtD07t9zoY7Xv4WHMHa5gZp/ezB7Z7QFM/dUl4GPsQTfImRHaGRKHgHc1V4WZm/TJ2
         dOO0fryFQxtlcNgqQZV12avX54bUpZxtPcQcqJLSxHuXZEiKqWJjX0upPx7Z68304yfi
         QiNw3j6W2nCa7yMQQfMnp4h2gc1p+ZdabGD7XKsqwOlVodoDYkCjmgxeVfZJFUR5pRi2
         fB+x79JQR5FddiJnYX34GTNx50xd0ZeB3V+G9+xna8xIOgPDfG3pmtAadlpTc/YNUGUo
         IMTz9kfLtgq4Ya1TaVPNbqzfFBoqkUzLIDqk1OX+keCcZZReI0yBC0ryKdBlvUnNtncY
         5Kkg==
X-Forwarded-Encrypted: i=1; AJvYcCXRlaDpQameQ6T3mdATcy97x+8lw/W6QHiI2OgNE6Y5x02zxQkN3Bwo3qYGsodDJJ2AOTxWeD6bqQ2LWAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWfgJMJQNKhjPco8sHReDo1n/wM7WYA3HRPz7rwRowYX5W4gmE
	4KyD+Tn4du1F+cdR3lbYGjbP2cTOUDUHqQSEgM5bc1LLDWjuLJKCW7SAXhoJiNEyWLxZNSikyAW
	xRBGgFOgtlnSFviXxEs0YBOIDEPS4GtUW1rpI6pGeTA==
X-Gm-Gg: ASbGncvPV9XwBTGMEHrTCDUe4shk9DNQN0FL1bliuNibkojTo2tQnSH6UhT1yXZEDxd
	7iygmVjTM6HXzWPx1J/qM4vS8Vz6MuLb5oszzC/uSQQvTKMZ2ANTfi1IHRNwJtytNkYNb0J94Rw
	bf6DPsifCSojaencpEg+ew7aGEDs4JgMWNwbC+K6A6xQVBRLz4d1aOULyVqeFzxSn9TFu+Wi7Tg
	Gk=
X-Google-Smtp-Source: AGHT+IHoYTMP7f+GMTw3uTP6k4I0Bn231yrpp+uoyy9GCq8Fgqpn1kY4nGbARRHfnOknqCIYL6cW4GTWqP9E24930M8=
X-Received: by 2002:a05:6512:6ca:b0:553:3621:efee with SMTP id
 2adb3069b0e04-553e3d07037mr4828362e87.50.1750776053838; Tue, 24 Jun 2025
 07:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624141013.81358-1-brgl@bgdev.pl>
In-Reply-To: <20250624141013.81358-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:40:43 +0200
X-Gm-Features: AX0GCFtRDOKAyexKw3msruWQ3iVjYn3wJRU2OMc42QM_NdUIN3Q2ZlDVDbMilcc
Message-ID: <CAMRc=MeKfWsf8T1tJLdj=+7aq0zGpQ07pHd2Mz-Y=Bwae0sAbw@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable tag between the pwrseq, drm and pmdomain
 trees for v6.17-rc1
To: Ulf Hansson <ulf.hansson@linaro.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 4:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Here's an immutable tag containing the thead 1520 power sequencing driver
> for the drm and pmdomain trees to pull from.
>
> Best Regards,
> Bartosz Golaszewski

Just an FYI - there don't seem to be any actual build-time
dependencies between this driver and the rest of the code that uses it
(thanks to the aux bus usage etc.) so Michal, Ulf et al: you can
probably skip the pull if you can rely on this being available in
linux-next for run-time testing.

Bartosz
