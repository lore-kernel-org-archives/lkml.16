Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FEE1F460B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845872; cv=none; b=kgoaT1cFCVlRkHjHQB6E+iosmH9psuoXrysHvuyzjQiZUB2N/5pPZX2WYje46I45wA1RVOU1yQXe6YqsZtDKMmhEiTrEJHarDcPFK0ls6z/Qgs3EhlybZsKmaoFpE9+zKPvkYinDM42Vm6LPB/pp1hxv3KuGRII3liKMJ5gJL5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845872; c=relaxed/simple;
	bh=EQuPWVkGF1nshAKLaU4W+d2hSy30i6DDLNsWfTtXoGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k60UQm+SBzVgFURxZvBxHGQj3l9KOaTyr6jWXCpsVAqrJk1/OtmMpzYukTouetq7muWpjyK5vExj3e2slVxn9ttqi+hvJy8lOHsUCjQ9IIke2LTmLUmNADme96OTgIU4t17pXPSV0RQapXNax/kSfTi1BaynztyI6MkFU0hoqRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xyV7PgI/; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xyV7PgI/"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8273504c67so5663564276.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750845870; x=1751450670; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2FoYZ4Nr01R53huec/tf1xznQvupBhVO4tbylq2xKes=;
        b=xyV7PgI/+uKLHWg1XqvU//E0ZL9rWBVCCQl+WJuiImbX24rOSLJu8dVZBQumszGCtJ
         cJJ22cAoXQqVAL1rpiIxh6Wm80cRyjDuIGzAJeQP1RBsf0Qw/R2QW3b49EB5+NQpqAij
         0HwqPqEf6J/gtUWJGmR6xD3KWDa7SJDqmA8JcRX6BYTTXiyOODiuR8QK+31P+doEaKPD
         qmARKXfqeoL6Rwvh+WsOlQoh6VIgceSsBjmoYnJm/fu8XMKGuumwvwHCdKVrkb9Nb56I
         IFV3RmsTBDvCOVe349vj05fQ7Du8QRTvQcs8GbXNUavwoqtdN8M6ZgvTFyE+3LhhIAmH
         w5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845870; x=1751450670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FoYZ4Nr01R53huec/tf1xznQvupBhVO4tbylq2xKes=;
        b=wT8rbjrbs31pytPfZDbtvUQUxukykKsTNX+7VPdadcFF1g68LgUPIBSYA1FgmS3hd3
         78VL/EptvI13ivO8rKibT/7RuoyBtTmpFBxIjZmFrVThgTFjNyR3IHsdCWs7DJVu8CXg
         Vm5ig6ZdaYDGfia6d1IM3IqF6gkKJdReVW3s9JJXchTBKya6VHRKiSlla5ugwlD6rccH
         MzLnZ/hqVN0VhZfG8Mua75HitlyifyGXXt/7vhlYfMDVNslRkKZNtgVp/DicJyDIP8oU
         iAOY3M866SMJjjWbgZ39q7cx+7fhIT09ZFOg8KwZCkAvN9XeiKaVHvQ9lkpWqWL8Owij
         9vkw==
X-Forwarded-Encrypted: i=1; AJvYcCUtKdVqNVWDQGoO1TNcbN9nGbVrgKG2JXaq8ak6qqnZtJIus2bR1jJYzOCnL7N8BS/wgF6FMAASc7mQE5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOZ6BLXuT3BUu3dRTqHIvo2fXtPFVXXM+Wwi40Gx5UTz13uytj
	VFSCkn6My9WVf0+pgHuf6hnduA8d3ez48mhaLcKNOM1tuGjeuKNukeRO9OCXbGyXSSKoLWEL4V9
	UuyYcR8l+6hroUBxWyemOrSATcpCwsal8pkIYQNlSoQ==
X-Gm-Gg: ASbGncv4fe1vRLlRep2qRv7YdEtCz76K+o5HEyhkskFOX9+5553vxhz09YO+W3uI7UJ
	+R4GP70LedpY+NDDBJVqivywFxp+LNz8Gub5hExQi5Yu5ph2D6h3G6JOIkAxZG2BpKSgsexP/h1
	fmCrs7tMzxJpv5box6cTU1t9Bwo1PzcXSLvPWbIVAvD4c=
X-Google-Smtp-Source: AGHT+IGEwF//unOd8KqnIb3kUSk3TkEl6eAh1VfDQazORQUWho3pyKqqzApD4UjhgThjUzADzPYQsRLphHC9Om0O8cU=
X-Received: by 2002:a05:6902:100e:b0:e81:4a97:b8dc with SMTP id
 3f1490d57ef6-e86019b93abmr2658200276.48.1750845870308; Wed, 25 Jun 2025
 03:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Jun 2025 12:03:54 +0200
X-Gm-Features: Ac12FXxb7NJQLDFAGAZjqxBIaCwRE2IAI0_rkmMKymSaefvVyWHj4pimfXs-K_g
Message-ID: <CAPDyKFqUZ4pVPgrWfCjH2dDBPRs37L9nc_tAqOtUR=0hzweKVA@mail.gmail.com>
Subject: Re: [PATCH 0/5] pwrseq: replace magic numbers with defines for
 match() return values
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 16:32, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> We currently use 0 or 1 as magic numbers returned from the match()
> callback. It's more readable to replace them with proper defines whose
> names indicate the meaning. While at it: fix a build issue with the
> thead-gpu driver I noticed and extend build coverage for the drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (5):
>       pwrseq: thead-gpu: add missing header
>       pwrseq: extend build coverage for pwrseq drivers with COMPILE_TEST=y
>       pwrseq: add defines for return values of the match() callback
>       pwrseq: qcom-wcn: use new defines for match() return values
>       pwrseq: thead-gpu: use new defines for match() return values
>
>  drivers/power/sequencing/Kconfig            |  4 ++--
>  drivers/power/sequencing/core.c             |  6 +++---
>  drivers/power/sequencing/pwrseq-qcom-wcn.c  |  8 ++++----
>  drivers/power/sequencing/pwrseq-thead-gpu.c | 12 +++++++-----
>  include/linux/pwrseq/provider.h             |  3 +++
>  5 files changed, 19 insertions(+), 14 deletions(-)
> ---
> base-commit: d4c2d9b5b7ceed14a3a835fd969bb0699b9608d3
> change-id: 20250624-pwrseq-match-defines-aec46817e69e
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

For the series, feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
