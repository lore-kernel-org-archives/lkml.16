Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9EF250BE5
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284863; cv=none; b=Dauxny1AfQFg5TsGOpSEdfx2CSPWv3lSWcVWRNn8VWj4kNuIQYaHW/9Hk4hC5Lg3WvyYFkbqDDudXrBfZIEfJegOIxOUAW8B2Y2maQjWEeh/mfz588U/aR7d/WIZtGgtgfwNu7KO0U/x6Xq3GNaVknX0d7yOY9dly5NubSErxPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284863; c=relaxed/simple;
	bh=w0lyzC9h5R8V3+kyWa+MnzNnFg+o9k0r+J84W+0jAl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6c4P1lPYsyNzTjFf8hWPj+H7r/DZnySR1x5EBwhaOAAVhu8jC1oROq0+9NxbO7uEgAsuMPZi+RgUWK3j7KUtaRGdC+T9RuNKyQ/wWrDSPCHCn+50Wb9gh+/LV7DekPKyBLQyx4xbbmU4adajA7xW0pQXpaqk5eW43Q4Teg67Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqFrYVIe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqFrYVIe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AA8C4CEDD
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739284862;
	bh=w0lyzC9h5R8V3+kyWa+MnzNnFg+o9k0r+J84W+0jAl4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KqFrYVIeBJY888x30TbJOJOYydl0tZAjuja88DEx6wVIKo3ewv+RlEiK87fAigrfc
	 RoKZ1jh+f7PTaOFv/TeTY71Vs1XFAEyYi3minjNz8e+AusU2c6R6nXT2KEk0LSTdVN
	 G5EwS0omEEwefDUJTr/tz3x4x+BkJihtVgauhqDB2pKXH+7LtNmgSiYTqEnb99EBj9
	 CUgT/xYdO/JLvx0faH2G2/DUEd6ez/2E0Hlf3+RzkGljKl5XWj9ujUdVj+PzlOo4k/
	 m7PKXNUzv4x5xGo80ip/6TQQ9jdeGwwrZqTCGwxUDuuOSf6Lsf39EnDe6AAQWnUCOv
	 OOz9yaM/INlfQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7e1286126so135843066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:41:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCi7CTK0ZGzNpD3pP4/LMpGPpGyji4yS9H0ffDmTetC0KuEQuUFG2/tAAzUr9HjSwqVV5shgI5CaF3GuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwXbHTQLEsv4V5eeh8mXBC3WzHwcx+7XTtLgBRar4Lt0fMav/I
	XnhWlIcaBKVdUQ2VYK16vspKQcWNYFPkNU3MhIGjuCPihiipHhay8sCbvdLhAWZ5jdnttcrhEu6
	EQF4BO9ciKiHtCMNWl5OOspa/dl4=
X-Google-Smtp-Source: AGHT+IGyJFeDacMApSGBnHU+O8pN/JIZNAMewpemCieh7bU+sklp5zcAxELy+FoKwQaiqydCwRZ8K2vcvWn0PWZ01oA=
X-Received: by 2002:a17:906:4fcf:b0:ab6:6018:df18 with SMTP id
 a640c23a62f3a-ab789aed838mr1774678966b.6.1739284861137; Tue, 11 Feb 2025
 06:41:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <10CEA19AD9D3FA2A+20250206063820.30558-1-wangyuli@uniontech.com>
In-Reply-To: <10CEA19AD9D3FA2A+20250206063820.30558-1-wangyuli@uniontech.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 11 Feb 2025 22:40:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4oqe-15jpHUe2yXchYogNyNdFHt=WfsoCF_AmX1e6v=Q@mail.gmail.com>
X-Gm-Features: AWEUYZlCFbxcf6ewsvYQYHCtt1ipUlOln3vwERFG09K9xSZ6_3FEEVM58-Xm7C4
Message-ID: <CAAhV-H4oqe-15jpHUe2yXchYogNyNdFHt=WfsoCF_AmX1e6v=Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Enable Undefined Behavior Sanitizer UBSAN
To: WangYuli <wangyuli@uniontech.com>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhanjun@uniontech.com, guanwentao@uniontech.com, chenlinxuan@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for 6.15, thanks.

Huacai

On Thu, Feb 6, 2025 at 2:39=E2=80=AFPM WangYuli <wangyuli@uniontech.com> wr=
ote:
>
> Select ARCH_HAS_UBSAN_SANITIZE_ALL in order to allow the user to
> enable CONFIG_UBSAN_SANITIZE_ALL and instrument the entire kernel for
> ubsan checks.
>
> Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> Tested-by: Yuli Wang <wangyuli@uniontech.com>
> Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
> ---
>  arch/loongarch/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 2b8bd27a852f..9d20aac7bc14 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -30,6 +30,7 @@ config LOONGARCH
>         select ARCH_HAS_SET_MEMORY
>         select ARCH_HAS_SET_DIRECT_MAP
>         select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
> +       select ARCH_HAS_UBSAN
>         select ARCH_INLINE_READ_LOCK if !PREEMPTION
>         select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
>         select ARCH_INLINE_READ_LOCK_IRQ if !PREEMPTION
> --
> 2.47.2
>
