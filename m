Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA52E9EBC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254092; cv=none; b=g4UCeX0Zl1E1R9RFFfJ5BEZ7iNILpIRoYVI1RpaPmCKr0/9p1WkWRiy/PeyGPWrXOtxmC6wUER+Izuv04QxT0lh0RYrU3s1BCmrwO8r16I/AhOvrDYN4SfssehUimn+3ogupJCP/g3E5PghlJ2f56SxWpCjb8/xj9bveMxSjbas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254092; c=relaxed/simple;
	bh=yl0PcNOIcNCw+lBv442hGsxXVF1DxIoZVa0h3oivgnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbhZYxhjEl+gMed6s4KFjFcfVWgCjnCqVfV30lxePU9pQL2JQpvy3rHvUyLzfu8zjKgi65AJNCgiNlM3WoIX0BeGj+KkB2k7ft+lFbzd651g7hiD7QZ3eJXWUXsKc9lhIjO8WUBY3UGQIUbqlo7tFOiQNcRBb0nRVNzmGTKeQDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G+DoVYbT; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G+DoVYbT"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso4271097a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254090; x=1750858890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yl0PcNOIcNCw+lBv442hGsxXVF1DxIoZVa0h3oivgnQ=;
        b=G+DoVYbT7hri/6qvYZB3mhlqwubCuoHu2hBDto/BLkdS8upFBHv3YBXAoUxCrHiwja
         XzJJPhotBdKpK5HRt7uA+M6YHwpTH++9jy93lsHVKSW9kJe0FCLWN6Ui6hNpLlPczbPi
         S16c3nrcu7FPp5PaAHWfkBRJV7upkZiNztyOkrjKLW7vAD+AvhjaGzDfCO3mdCPQ3Kup
         RzJx1cWqtnlC2GLr4XVEbJ9JBRLl9bH137shewyaHMXQS61OwzgCPG6kJlaKM1+ElvpI
         ikgCwKb2OkexDrvaY0VrnorV8pEQPS4YDel/fqLVbiNdw65dguWJ/zzjBAWtUIAH91zb
         wnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254090; x=1750858890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl0PcNOIcNCw+lBv442hGsxXVF1DxIoZVa0h3oivgnQ=;
        b=T0gAKYsp0MuU9QW+DQs0QjPp1IszX7ec77SK8kvSsXlJommszySxJdZITQn45/5EIv
         hSENEOdhtw7Pvikuf+J/pFAJ1qZn2QLu/KXmR2tsOABud4gNjQw+dUb/hvp0y+Oiw8WH
         SvTE2fAc53lsDRtkz5cWDQpraTEqttLFKhvolbged//nEvu6bxz8fpARrxmXLxVf30yy
         6RhR30KcQ/WLkYptJ4HGG6FFzWpJnHknUZysjpLdTp008Pv5uW+kH/SR4JPngdjYSsuY
         fnWzVg+f1dugKmuhi1sYZStSdbdDKqK417Yx0bPjU5N2ToxJ66qWFw9eHD/I2b/hLf1E
         Nx1g==
X-Forwarded-Encrypted: i=1; AJvYcCXE9Zu6PNPn/BrO+FuDR6hPFkx6RneK296lJwsj/FYxawdO1nSvaDCM3FwZGSqzIczcbmMT0juakYNKBO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YysdtsmIabiYG0wuY+wb3f/28AvmUjVK5QaJvqYgnCfuk10XfCb
	39rLznH4TQAnPte1E7MQ4SHBaym2J1j2BnyE2hg6AJhmDDOApvFledx1WSDrPZtpkOxQ2d+yTYy
	uBhsZ1fHl5NwpXMHo8mIc36tawAVyXL3hUQ/ebGafrg==
X-Gm-Gg: ASbGncuaryWLkSP36lk1LU0AXIdjEK4DIzjQAHZFa2/UjnW0R9A5ToKz7p+xSQ/FTAS
	MNOKg9xkz+a2TaUXf4IhX/NskNyfkIf3VIQnby4oiPEO82ypbDOZ2GKH+tSWFf4UPfcfEHJBr5J
	GMn5soZW8z3hyu99cL+ab438wgXynd7TvDD3Vm04/4L1+4Rb+Drj+2jCNn246BM17q85y5bGuu3
	w==
X-Google-Smtp-Source: AGHT+IGM3MsC055WE6RGdmTL7+xpqbeOwcWlIGInX1z822Wu3bYLUR0ECZj1HH7bbG4yZBVpGpNdgZd2k9tfvrFyAoE=
X-Received: by 2002:a17:90b:52c6:b0:311:f05b:869b with SMTP id
 98e67ed59e1d1-313f1dcbbc1mr25929568a91.30.1750254090220; Wed, 18 Jun 2025
 06:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:41:16 +0200
X-Gm-Features: AX0GCFvz_RthrqCGUMHniOjba_9qiDf9mc2HoVSIdoi-DY1O9poo5r9j_4HtbqM
Message-ID: <CAMRc=MfarMrUrdgAwa6dR2JuWooRhaqPmJeEY9H6LhVkCxf4kA@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] pmdomain: thead: Instantiate GPU power sequencer
 via auxiliary bus
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
> In order to support the complex power sequencing required by the TH1520
> GPU, the AON power domain driver must be responsible for initiating the
> corresponding sequencer driver. This functionality is specific to
> platforms where the GPU power sequencing hardware is controlled by the
> AON block.
>
> Extend the AON power domain driver to check for the presence of the
> "gpu-clkgen" reset in its own device tree node.
>
> If the property is found, create and register a new auxiliary device.
> This device acts as a proxy that allows the dedicated `pwrseq-thead-gpu`
> auxiliary driver to bind and take control of the sequencing logic.
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
