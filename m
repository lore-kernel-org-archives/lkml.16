Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE16D1E4B2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215511; cv=none; b=HiOM8L16ab4FCezz7lVF1QpVqQCXvWsRmB2fOtE/AlqnWy0hx7XwCBpgKoD35BhXDy5JxpX+tPZFxFxOCEVXkSapgN5iAuljaCoAs9EhddM12PKG4WCvnOfFpuX5f+wxf/4Pkruv8zGaxO1Nfvhytto7D+2WWQ/CVUFjgENlB+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215511; c=relaxed/simple;
	bh=0GVuQojpk9Mb3dzd1WX8x8g8rwjrX/NeL70/4vMlg64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qyStjt1Em+4reCo01m925Tqpv0h1Vl3Ffmb+M4tfc+dTLbjnmCQs3JUryj9721FGl0u5V21yTaoBxhSwa2NWaFK2G8h94A8m7RHaTYrwW1TRdYDlpwTZYqOB/JiH+c3b+V2Kpdj8tP30qzdkGK7ngxs9qi4zwVhr+js3BrrYw0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icz4gBox; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icz4gBox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37144C4CEF1
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749215511;
	bh=0GVuQojpk9Mb3dzd1WX8x8g8rwjrX/NeL70/4vMlg64=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=icz4gBoxMsfNuz9Xc4Rut4lRvznU2kQuuPD5pvQYBOskeuPuG6LVLIvfql1bKvUUl
	 YKXSUB9vTyBbRNmARiri8sDFUEk4EmvLaJAqnHeA2VxSrkemD0PZfeN0LMVD7L3dJn
	 JG7g25RYaFPXDkcI4LAVMJYvZIfl3lHngZVXqKMK7AWE8UNA2RV0Ea2Upq2R9d6s6S
	 L3icPIHSV2mims1BQU6kGxlcpFKpnTCfgL0rdjCyQ+LTk0/C5QYCvoKdtR/4vFbgV/
	 ZcuEHrJJK5OjgfxJBZR+zPEZMf7N0M3aCXdrpXdnga8RDoV6U/ORR4/W0Oq9gWja2J
	 Sobfj5vzHsxFA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so1779214a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 06:11:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnAFBTHqXzi8N+5e/lF4Y1mRlvSZXKdVVDDjBK+kfZg0+b0Y8/soP5kBTH9LFUptREx2a4UMEqwQu0kOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXELMcxMyirHlDZ/lFtw9fq3H/fFkQtt7durVV7ElypM+5ixZb
	Pl1BGqUQwAMkWyPddS6PNDq1iFF9yUuKocXbJqsK08OEnx1LE1rZwHq68l4LOFUvo8TM06DaHCz
	lEHEFf+eFSHM7WbeNGue5rSIqJ63cY9c=
X-Google-Smtp-Source: AGHT+IGkonwhwsMSN2QFCrW9x7bFLMapaDsabxXJgcN7/UazSOBNAAEU4ymwq4ziVNQTZCJ09V22Zkxx/KY4GB20gRc=
X-Received: by 2002:a05:6402:2807:b0:602:2e21:631f with SMTP id
 4fb4d7f45d1cf-6077479a7b0mr2927047a12.24.1749215509801; Fri, 06 Jun 2025
 06:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605054828.15093-1-ziyao@disroot.org>
In-Reply-To: <20250605054828.15093-1-ziyao@disroot.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 6 Jun 2025 21:11:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H58JGB0QoVBC_LE4Mo5gGdZ=-NcH8FtZupK9hxGFdfvMQ@mail.gmail.com>
X-Gm-Features: AX0GCFs_Wi3GPn_-VTaU2yt159R1v2DT0MEdn5mw4mPvCP_UNtgOrgvMGLkiBBo
Message-ID: <CAAhV-H58JGB0QoVBC_LE4Mo5gGdZ=-NcH8FtZupK9hxGFdfvMQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Backlight control improvements for loongson_laptop
To: Yao Zi <ziyao@disroot.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Jun 5, 2025 at 1:48=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> I've observed strange screen brightness changes on TongFang L860-T2
> 3A5000 laptop after resumption. It's found that a brightness value that
> doesn't match the hardware state before suspension is "restored" for the
> EC, causing the strange behavior.
>
> This series fixes the behavior by obtaining EC's brightness setting
> instead of using a constant as current brightness on probe.
>
> While digging through the code, I've found some unused,
> power-control-related functions in the driver. They're cleaned up and
> used to support power control of backlight in the second patch as well.
>
> Changed from v1:
> - Reword commit message of PATCH 1
> - PATCH 2
>   - Always issue a power-on command on probe to ensure the backlight has
>     been powered, matching our expectation
>   - Cache backlight state in the driver to reduce interaction with EC
> - Link to v1: https://lore.kernel.org/loongarch/20250531113851.21426-1-zi=
yao@disroot.org/
>
> Yao Zi (2):
>   platform/loongarch: laptop: Get brightness setting from EC on probe
>   platform/loongarch: laptop: Support backlight power control
>
>  drivers/platform/loongarch/loongson-laptop.c | 78 ++++++++++----------
>  1 file changed, 39 insertions(+), 39 deletions(-)
>
> --
> 2.49.0
>
