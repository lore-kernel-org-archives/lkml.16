Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B892512DE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 21:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750799377; cv=none; b=YZWcQ15xDccDuGMB6i0tWA4AXGGfmHIiN1C+EMCpa//mobtfkCC6nyI7T9S7hu65o4BkZTPgG7cFgjo9/kc/o7tz3Z8TU0M+Vfy0tZX91kMTiVCkEI51UOfNG/dfviZvN/5535RaFfF90Nf/9qm+BpXJkko7UVQjpO89cLj1NoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750799377; c=relaxed/simple;
	bh=2MF4EJfF3oGBbVNrPMSxxD/94fMu8AcVw/MFpO1v96s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQcsOdPbTc8aylrDlKIIYRf7EGfiPvZZJu4t7XlH6qfk7idZXC1QamstX428capppXL2Hz8I646hpx1JNwTtP01Wg9jBm0smrq+ZSMIevfbdUQ1WFAo13Eq9/bsim9SdAQmGUmetC2hiLhqA60Gstpz+jCUyAeXQJ4hg6pCTlgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ghZYD+DE; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ghZYD+DE"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32ac42bb4e4so51375091fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750799373; x=1751404173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MF4EJfF3oGBbVNrPMSxxD/94fMu8AcVw/MFpO1v96s=;
        b=ghZYD+DEGwKL4TOu4Azgugxxc2q5llv1avyytvg5zrIbhf3Es0w/2gjpDx85ARMQRI
         xTgdRtVM7NEG5zDj4kEXd7gjpVR75MWWwP7YVqwWY8vQz+30j7AeVyiqeMu9tlMdnazG
         RmWpXRYOQOP67wG++rxsx9mngLKKFWzCRC+uuAeCPsgKsYoNZTEHyVn0hylPjy0ziG4G
         fKyOdl8sGAVXQb61/5TlJC/Ue+9uuIQjFkxkyZblsWrztI9BKQSlHykFCMNXheoiP9dB
         I5OvkspaBRFYgxIZQvji1B9fqZkRxfHr/DSM6EcCIvMnGxF94PptoS/CNuuIYIq5VvdO
         sY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750799373; x=1751404173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MF4EJfF3oGBbVNrPMSxxD/94fMu8AcVw/MFpO1v96s=;
        b=GiPr1zgv/lFIZfFffN7IkIne2cf9hkuKHczsHIz2MEE3bbJrTf5Dp+Ae38Ylrx0Rdw
         Os/8I634nKd01YLNqeVPru5sbUCEwmBPRdMYSzXXkYi648+8I/m1OSJhCpfhgYNI19Ry
         /UXceGD7CP+F2Fv2LzBPKJk5EnE/Tis/rab8tiG3whLWCexet6qv2v2ckvARPfBJPN3l
         zTsbyhVkcZNKBL36NuLm7EkyE84zJz9g1oAPcZfnIXT0QCLP3idNCs7nnF9rxlpvP5fB
         zYq4eWRzq7SJyI0kC4axHgVRKgSftKK/XQY2xt2C2pm2GXP5RIHZ9po4Lm2dbmUlI9nd
         75nw==
X-Forwarded-Encrypted: i=1; AJvYcCXL2MZJC+7mVamW0JHgbh2ggAe9IEnxbLzwLFFeK8ujeLFFPDgKDEDMmITya50GHv41UUX2Fo3KOBN148Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT9TgpblRpq0+2JANvfUGlVriVxaA8cyaddcVNNG/DjOfgFfPw
	nGKY8c8UEtHjrDe94Eptnz9dMu5eA8iQkWuk5kkUMDKYhd1pKhcuadducQ9dtbmrzBDnV6A+Tjf
	qkr4yj4T0n1v2dn8k3S9IWyKW4slaFwNIU5oHwrEEUQ==
X-Gm-Gg: ASbGnctzYJzTXItHY35pkSLPpeSz0KGIuaoAewnywNW/m18fG4XrHcjiHirNvGtH9OK
	8rjnOU1Yu9GwWcjk3DpWOhOkWZrXECp7H+oui/K9YhOiM63HZt85/V4JXgkYOxSPwQMoBcCopgD
	sEoGo2mGvvS4myYhBlwJPXU5jDZLyf8z0fNethfY0zb+8E
X-Google-Smtp-Source: AGHT+IEYzudCBxLtnCVsGpuow7FpUkuw3nptQHQQRtw4oP1UaDU1p87rIunsZtDyNefrBc2V1Z/fJNG42iXx2/2pMso=
X-Received: by 2002:a2e:909a:0:b0:32b:3cf5:2ff3 with SMTP id
 38308e7fff4ca-32cc64e822cmr504241fa.22.1750799373290; Tue, 24 Jun 2025
 14:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-iio-adc-ad7380-fix-adi-gain-milli-parsing-v1-1-4c27fb426860@baylibre.com>
 <20250622152506.238c1322@jic23-huawei>
In-Reply-To: <20250622152506.238c1322@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 24 Jun 2025 15:09:22 -0600
X-Gm-Features: Ac12FXxJ_KHu95Iz336-RQCdSp_KlXcDSn-GDiEWvLzfGuq68UC3oa_NRpx2lIA
Message-ID: <CAMknhBG0p_ODgKmu2EpWR=0VemZ5yWYVLxdST84YYfruTirK-Q@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: ad7380: fix adi,gain-milli property parsing
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Julien Stephan <jstephan@baylibre.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 8:25=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Thu, 19 Jun 2025 10:24:22 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > Change the data type of the "adi,gain-milli" property from u32 to u16.
> > The devicetree binding specifies it as uint16, so we need to read it as
> > such to avoid an -EOVERFLOW error when parsing the property.
> >
> > Fixes: c904e6dcf402 ("iio: adc: ad7380: add support for adaq4370-4 and =
adaq4380-4")
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
> Applied to the fixes-togreg branch of iio.git and marked for stable.
>

Hmm... looks like this branch hasn't been pushed to kernel.org for a while.
