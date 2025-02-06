Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AE6226520
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834292; cv=none; b=X5mmEctlXYB5sfDzd1piwfqBzCdOUYj5g9eVwxG4Jy1vOxCD5LSClncXQV5DZgbb0RxnGt6EF/Drq7w0APdPfvcdnGlV93MPYRvsdmIiQMNQpXgPPMSpKoHQP7UXTDK4mBPt7ME9d9hQPkaMRSkJSwsafAwnb6lCqyuSJtXbvZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834292; c=relaxed/simple;
	bh=DDYhcReaqTeAJ8Ct+nQyrID5qgSTAK+HyqV4S88yu+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkibBTFEIKWLfCJYvY1F1Nq8/W3tlezjrCsEXJUS1UO+z655sgQDD43sDEnC95Tia0/0P+7xDqz+qbYP/DXJKHPKrk2p6XzBa3JOzgveoGlMmfdJhls9DEAJp7avPrcP0aMktyZX+751suvSJzahUt+84gRYmOQZVNMUaqdjzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=myoeHHPs; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="myoeHHPs"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30036310158so5997521fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834288; x=1739439088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDYhcReaqTeAJ8Ct+nQyrID5qgSTAK+HyqV4S88yu+k=;
        b=myoeHHPsMkmeeFshyk6tSKm+qtyjtMLf0z9k9jGNRWGWsvZL9TxFv17uz0SFiAwbCe
         ul5R7qWdcpVgxpGxqBypMvzmeVxGQgMptGGp/IjF5zm+cwt6+rmGh3S/yYkv3f4E8mxg
         +oQSZGbcOZfVcNCJXiYqfWKc3JUeV8cG22Q3eqsfRDulg/XdlWBpbnv1R/WhpgrowAZJ
         DVt7sTbcStNBPV5JtrQ5yZRWHw/3PmydUKw4RsckQb/QB0fSPNbdLXNDERjG6ZGkSZ5k
         WTdfaaIWA6yByLUWTfFOJkDns0iWjBMYSHMODgXDfmmTYucgzSb2weLlU/2ufHjMmjd7
         WxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834288; x=1739439088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDYhcReaqTeAJ8Ct+nQyrID5qgSTAK+HyqV4S88yu+k=;
        b=lq77EYBnjfQkUnD5hmtDPCwkOpEYeOG+ZPGcHPBPtM+Tv7yxXMOlSwjYdBNOAQiilg
         XXFRq2GdOZBTzzK2V/yElfpE0rSlroXi02r4tApQoAzNExeAvyBCtt+V73aPLtLKL8KF
         58fCzyB3n/4jxuzg1bg9igQQwIGxUey9Ijp83nODYRzSRwt257kKcEAlkQbJvk1u/jbY
         uny6yI+TslP4dvVaib+dR32qeaOkGkA8HJOtkxmxxa1BBc2M+frLRhBred8YijKMkzSW
         Q6LS1QP4b1wGzxwVdU0QZS8BSqzLRjb6ASXdbE6H1dLA1OP8+VoVyXLl/KpfADlr8oOj
         zp/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMsU3NdabSdtqSdL9yg5jtQjlEOpSCUMNZDg3+J+kvikC25vnbT0vcXgvvWJaHajt8STSqXnAhDzG0WWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT2yMD0h2v2xoyU21p5qP3vaNjEqeBYWAcScEHgxfBPPnXG8AJ
	i0N9Fy5i+NChxoKVyxH932FmGNsPwEpKHpK2d5HJD4z9axgYphPaNOH12jfpwu1vA7ym/pBIAn/
	yzOKmoAJV4323ahV6SHH6DfLvWT9f9/kdNHyKyg==
X-Gm-Gg: ASbGncsOSrjVaOISmjJ3j1fc6IQrZIOTDgqtQKaFMMyZlZTvMjGmxgwmLNQy8oWXhVS
	P3YEV+u7cprmal70QYDkhfyogL6LB36M6R1a88FJZNaiofoH7G5DO5RI8Sro5oNCLeJLcBXc=
X-Google-Smtp-Source: AGHT+IHcFWo3xte3K/LEtEaJiM+DRe2msO38SbMIwC0bXZ5PX+6iklANjvHzTB6e1CWVgPfne7+PROlXtmg2N2jgE2w=
X-Received: by 2002:a05:651c:222b:b0:302:3003:97e with SMTP id
 38308e7fff4ca-307cf38c85fmr22106041fa.30.1738834288265; Thu, 06 Feb 2025
 01:31:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129145155.1746876-1-andriy.shevchenko@linux.intel.com> <20250129145155.1746876-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250129145155.1746876-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:31:17 +0100
X-Gm-Features: AWEUYZmwoTYF2TuiKQlWq3AmlQqyzT0xz3waUTJAiHp5kUR0_yl7mdskuk2sj9E
Message-ID: <CACRpkdZs9Y+GTHLeWBmpkaZrqiJGWj6s_q+6g=kkr7AmmeGMig@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: baytrail: Use dedicated helpers for
 chained IRQ handlers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 3:52=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Instead of relying on the fact that the parent IRQ chip supports
> fasteoi mode and calling the respective callback at the end of
> the interrupt handler, surround it with enter and exit helpers
> for chained IRQ handlers which will consider all possible cases.
>
> This in particular unifies how GPIO drivers handle IRQ.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks fine to me, also 2/2.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Expect to get this from you as pull request!

Yours,
Linus Walleij
