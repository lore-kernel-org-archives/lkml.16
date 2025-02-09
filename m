Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A2B155CBA;
	Sun,  9 Feb 2025 11:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739098953; cv=none; b=mYMtgslABEh9Y7EG5PnXAfwOxZ0JVavn+JO/zO4vKFsZMQ6SOaEWRA9kFNOmejsWjeHWCX8xfWGNMhZoVf3vQ4RoQruG21+CHAEhhvrEM4L288ApP1LnJllNdIjT+Pa+MwY5HQilTD/HExTj5VlgnnJN0p7SYc8+YMPW4NLwoP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739098953; c=relaxed/simple;
	bh=g6Z5E/J7Lu/e4cN4IuJx4avEmz/Rrp3PpRqkyElWLnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jp9GUyTSszMWBTYoqjKFtLg87G6yBMnwmqdaiMXn7beZFbqz9rVqivEE/ooEPPIHXhhxgCdZQWjyjto8jNcuXDIu8VhdeuH9St0vbKcRTC+3Wb1uJ9mpKwIYJlUFCVbrSdaypDVVATrNbo1nu949kVo66Y9yniJyDk+uOQUPpAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5de64873d18so1306543a12.2;
        Sun, 09 Feb 2025 03:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739098950; x=1739703750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZtSlMlkn5zHaXo0WZfyndZctK7R7et8V22vFKv8IdM=;
        b=pFQjBzgz4E+K1Q+VI4xd0uDGQbtwMxfrSI7Ep6mnyrfL9PsLMZpZh05e2ywyoBGyVD
         N072Ulv7MOdkjmtGZ4a6f0M2cFim4qTZKDoQLcm2BWUjLVCogCrG1R5MuKBIC0x4LoL9
         kSURBHi6zh7djUe2yscvyZFEbyA8hp6sAtsyPuyF9kVFRRTSNPUlo3bBudif2uXwZbMQ
         7KEl/NbVPBgXMDMMgTomPzR8DwMn73A6vrQPSllcF8AKggyEi0nPx1na+1QMLI0dTvHl
         sOoDBE1IFUzLUmPUmRguk1UV85IuSd/xyEK7JyVxhPr0DWizROzvrfnEC3L479tLJONA
         4mZg==
X-Forwarded-Encrypted: i=1; AJvYcCUrboYmrkiHZSRtMxY8ziLGOMVrTHG4oyiLRoo9j5ApqZf28gWRM//Wp0HKAxtfM78XLC/8aKyoqCkG@vger.kernel.org, AJvYcCX3AxPgAev+Ay5u17HuaTyPY7W7ecJp0fasZByY6AZvwe2F9TM/6iasaGZ4I/cG3ItxiIuHksPOK5QK4vJE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7tjwCQ48d8A5JOAZTSFx8eT2HqHUY3S7AT2Sl4DOxY73tV1OJ
	QfWmHkSSzepb5gjB0pRBOtJDleLPNyR9EIL/Rn1vfP0rT9XSmL5CggzO2b07SU0=
X-Gm-Gg: ASbGncuJi71NIqtCPD81OKzbFJ/PKiSncQRtrhWqG42KsDMlcMuyBN47EGSq4LDblqk
	4X+6Sdjr35Nf3d9aGvQ64W8scsEKMgGVOd7JNMFoYgPeG5FujYGpxVpnipg/+z7BE+OoU1VVj4G
	Q82eLPKyWKvJNaaTtdBmLKzB0vfiZRET2pJOjj7zWQOCWU6Od544nWqBN6XG28nHZ0wLmD3dbUB
	dlJ8X1bGFXIqJvHrmjftF5eMLRP+t83R2vXEZxHtQQv/KzwOpFlDPJGbeozQpstKcpbPVse8sKn
	wgFF39XWSx1L9e6wemuyhXcUaEv+XCkx4geGQKUVmUvlKQ==
X-Google-Smtp-Source: AGHT+IHx7X6QffY885+fV0Pgp447iqlsoEpnTA/rhWByHh3eVmLnU0qmdL+NcamcN/voNrh43zxvnQ==
X-Received: by 2002:a05:6402:35cb:b0:5dc:7b59:445b with SMTP id 4fb4d7f45d1cf-5de4509abfbmr11679792a12.28.1739098949799;
        Sun, 09 Feb 2025 03:02:29 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de3f04ae59sm4912101a12.1.2025.02.09.03.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:02:28 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5de3c29e9b3so4600384a12.3;
        Sun, 09 Feb 2025 03:02:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAUaaMGzR1zJyPwnL76NhjDx7R0hGQkPwLH3IdSQpbqwwMW0zQ87VsP4DoWtD7mTT0qwK72xXGktYR3fML@vger.kernel.org, AJvYcCVPSROxnPMebdM2h6cp0CDZ+05TIZPqYxJbSJrCMwJh0r/1y0OJVguHUKsyq/Cgv4y1EOY315nxVq8K@vger.kernel.org
X-Received: by 2002:a05:6402:4608:b0:5de:42f5:817b with SMTP id
 4fb4d7f45d1cf-5de450b1c5dmr9937857a12.31.1739098947851; Sun, 09 Feb 2025
 03:02:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
In-Reply-To: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:01:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_1Qe_q0Vt1ReX0HG83gNP3Ph37E+d_prDiMXSWtum5vQ@mail.gmail.com>
X-Gm-Features: AWEUYZlNJz2VbuDrDkNmceAgZ0ETGFMAFQeCJbSKwBdyoI2QQNmlLF0UVoGPB5w
Message-ID: <CAEg-Je_1Qe_q0Vt1ReX0HG83gNP3Ph37E+d_prDiMXSWtum5vQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Driver for pre-DCP apple display controller.
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 9:02=E2=80=AFAM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v6:
> - Use the drm_connector_helper_get_modes_fixed helper.
> - Split out into a separate MAINTAINERS entry
> - Link to v5: https://lore.kernel.org/r/20250205-adpdrm-v5-0-4e4ec979bbf2=
@gmail.com
>
> Changes in v5:
> - Moved to using the component framework.
> - Other lifetime fixes
> - Link to v4: https://lore.kernel.org/r/20250114-adpdrm-v4-0-e9b5260a39f1=
@gmail.com
>
> Changes in v4:
> - Fixed dt bindings.
> - Link to v3: https://lore.kernel.org/r/20250112-adpdrm-v3-0-c674dc19fa7f=
@gmail.com
>
> Changes in v3:
> - Fixed building as module after splitting out mipi block
> - Addressing the review feedback.
> - Link to v2: https://lore.kernel.org/r/20241126-adpdrm-v2-0-c90485336c09=
@gmail.com
>
> Changes in v2:
> - Addressing the review feedback.
> - Split out the mipi part of the display controller into a separate devic=
e
> - Link to v1: https://lore.kernel.org/r/20241124-adpdrm-v1-0-3191d8e6e49a=
@gmail.com
>
> ---
> Sasha Finkelstein (5):
>       dt-bindings: display: Add Apple pre-DCP display controller
>       drm: adp: Add Apple Display Pipe driver
>       drm: panel: Add a panel driver for the Summit display
>       arm64: dts: apple: Add touchbar screen nodes
>       MAINTAINERS: Add entries for touchbar display driver
>
>  .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
>  .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
>  .../bindings/display/panel/apple,summit.yaml       |  58 ++
>  MAINTAINERS                                        |  16 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
>  arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
>  arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
>  drivers/gpu/drm/Kconfig                            |   2 +
>  drivers/gpu/drm/Makefile                           |   1 +
>  drivers/gpu/drm/adp/Kconfig                        |  17 +
>  drivers/gpu/drm/adp/Makefile                       |   5 +
>  drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
>  drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++=
++++++
>  drivers/gpu/drm/panel/Kconfig                      |   9 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
>  17 files changed, 1489 insertions(+)
> ---
> base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
> change-id: 20241124-adpdrm-25fce3dd8a71
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
