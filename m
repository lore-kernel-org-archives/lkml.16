Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E4722B8A9
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748953544; cv=none; b=FJcW6ZSW99c7a/tt+TCWb+NvixVZVAl4WAVMIlDdQcZtizVd0biFknScMHxJOuQ7PxcfYs7z9B5FdVRLL0s5bBjmgi7pkt3AtzdfH5SPxLZbGaizRQiUYDjPWMibCwNCF64onYjsWPMziqlbtAjN8dMDzZd6tMO80SiQAv+6WLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748953544; c=relaxed/simple;
	bh=Q0chqfdrdIvg4hy8yKc8WRhiOM1bdd348viYZ4BbWjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9p8TxVtO7ZrLGBJTknaT6KylEQJ5HILNNLsziARsT1AohXwdczq0AeEnCu4m+mMsrFC7P+bpZ6IxUDAA/gou9OnpuPXJKQ29j9gFApo0S5zbCuVU9nIc9n4q4nlGDqTeewWoYox/B4U/LIdyO6WgSLMnUBbUNBnlfAoKxPkvy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bNAiKOYp; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bNAiKOYp"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e8153867f47so1589359276.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 05:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748953541; x=1749558341; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0chqfdrdIvg4hy8yKc8WRhiOM1bdd348viYZ4BbWjw=;
        b=bNAiKOYpScLNbeiajK64Ns4iY1wIlZPnRo1YBJ97CHC1aN14+kznealKfJSKYGTtGJ
         vclQFuGdYXd5IUYljAFNe5j4n/eEQhZut9lnF8ZWBouceJoVfeVWuHKE4w9ddKP+C84F
         BauikRN8tNArIKlPzq1coSW2INBu96ryPCK8ky2nX6kJFxTMsf8aoHZw9d9F7NdApT0/
         A8bQsrqxYm6rZs1/u4z+lnjBV0rjeM94qSveEyFEBbb+PnhY3Fz3z3EnZ6+/h2MhH08K
         mulFBf6dHI9knFpCIZw+PAsRoe2NrxUVNBW9V1Qop4A9Jmq2iNvPJslw4IaqQmzNkLki
         grpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748953541; x=1749558341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0chqfdrdIvg4hy8yKc8WRhiOM1bdd348viYZ4BbWjw=;
        b=QsR0ToYNyTKEVRVgR4fW6s4rXRjwbqHwoBz0CuHTtFSuo+zmlOcUa61ZZHd9JocqjH
         HtP6sdMTYOMM/TDb/HsctLVsPuWUgen7WlhloNzG6GMRtNhQPEzYmJAGKMHM0Vk0Soe0
         wfK6nit8+VkIvKSokcjHh2EPduS/awpkOdYz45lLZFnvJDPUAzQVog1+h6xLd75XNXz7
         58m7xNwK0PdjjjP+UFh0yW2VO+zYdxB/JD2TTPNbzw4ONiiuVunY0bg7lSCklNpvXsmX
         4Azx2rRTBjdSgMEMrOYimCtFKEFX5PatcgAgsQTM5MG9DI/wot22+hP+i0WVTyWlgwNl
         3PpA==
X-Forwarded-Encrypted: i=1; AJvYcCWUzQ5wUTda/Uq0/e4dKuVFjV+O188NcEZ/CY0ujM/v8z3vDhdmHls2mayR92T4z51LxZsmbiiYkFqsCOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsMbWRtXGTv1q/zSrygPvWlav7ZPyMa9zcq+qU1d9VTmh97HDg
	slY6fP+Irr0U2boVDdc2eEvtN9aUkcDZAoS4Bzt70Y9D9qZEii0Wl5CdiftyDGvd0W3Z4ESWRXg
	o7pqzhZqE0qUQh8ZwODpsgwUZ2sPFSVLEEU7aZ6Agxw==
X-Gm-Gg: ASbGncsWHuVgD6lzctSVM8HMxeDDwjOT/3IRUTGGuTmls8cI7i4UWFtVRUJQ+9KksgX
	LaRxmlpfS0VemtIREvFmT17mEJq9S5Dpk2Irs+K8uqJ9SQY8x1WAQU9UruPneXHi/VOLcpelyIN
	WBAYHwsxjj9IO/PqX1DlS2NJ/nAvuWfRKk
X-Google-Smtp-Source: AGHT+IEJrWfxa9Bh6hqeqnweQzaVkjYvLD0ahWEYQ41oZGruPcsUvZuu97cItSkDZzbw9aGHdeGYbXtGb/PCj/51Oeg=
X-Received: by 2002:a05:6902:2b04:b0:e7d:988e:e7be with SMTP id
 3f1490d57ef6-e7f821a3acbmr24109793276.43.1748953541373; Tue, 03 Jun 2025
 05:25:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250529222402eucas1p1c9e0ddd3efd62e078e5de2cf71655f58@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
In-Reply-To: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Jun 2025 14:25:04 +0200
X-Gm-Features: AX0GCFtQed31aP5hPCNMM0HA628iK-r2BM1mtBEnivi2Jm8ggPrVV8N_s24C_LE
Message-ID: <CAPDyKFqL9Xpau1BDnaa828s066zj=aVOAQOy1tCS=ztKN0ZsfA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add TH1520 GPU support with power sequencing
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 May 2025 at 00:24, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
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
> This revised series now employs a new pwrseq provider driver
> (pwrseq-thead-gpu.c) specifically for the TH1520 GPU. This driver
> encapsulates the SoC specific power sequence details. The Imagination
> GPU driver (pvr_device.c) is updated to act as a consumer of this power
> sequencer, requesting the "gpu-power" target. The sequencer driver,
> during its match phase with the GPU device, acquires the necessary clock
> and reset handles from the GPU device node to perform the full sequence.
>
> This approach aligns with the goal of abstracting SoC specific power
> management details away from generic device drivers and leverages the
> pwrseq framework as recommended.

Just wanted to share my view. I have looked through the series and to
me this seems like the correct approach, nice work!

Feel free to add my Reviewed-by tag for the series, even if I think
there may be some comments to address from Bartosz etc.

[...]

Kind regards
Uffe
