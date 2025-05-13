Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1D7347C7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142886; cv=none; b=IfdMiuVktpBi4Bcw0jjAOfxnieiGdSgKYCXT4Fe1pgrmIqnjS1JjM3q+bP7D0lIFmAQy2ArR73pz5/aK9/L8HNgiJAAs2qJuy6VK08Yj8dSECf1JX05AzekaKXhS8Q9DP/T4m5mtgGL8tEBQtF0iyT8eKE7mEntun52oqCfZgr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142886; c=relaxed/simple;
	bh=Lmyj3hP5CkRfmv8NZKBXt2FvgPVL/V2jgy3imsWNkMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ofRNc7ClBiAZvtt6OrdtGduwQUZsar7eIUdGzH895aS85IYBL8vAy9yEMee+8UQx/uiyBhK50oXhQMRHFZO2hs1Ga+vKV8EOeIkm/TS1xorRhgYoidAZ03oolnTnkszudInU3u2gS7tAs5hcYuCzoWUZrHRCon3H4JsFp3xXz9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f5l6CBH7; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f5l6CBH7"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7b3178473eso527756276.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142883; x=1747747683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lmyj3hP5CkRfmv8NZKBXt2FvgPVL/V2jgy3imsWNkMA=;
        b=f5l6CBH7VO5T6SUFiRN1N7dgor6Hr14LOSpvh2EkLMkAzCYSS+8atxDCG9KGHwRUyl
         4z7GW4ctxSPrAUv/Kfl4bVVZoNXmZMc7ueuyUC5gZ+32OKWnA28i0F+EWaUDnXiZsvXP
         4wfY0rsmJsvgHQQp0J5UiBrspjXVF7NwD+Gbv6QqsV7sJ3KXTACeNfbIYfmBGOubumhe
         QiGk0mZvUoGG/Anov3ZqKH9eSQn35jxz8dQi4KcbVtg0f697nUHsUewc6gQTJO9seONr
         spQAzY9m3LcVtafjL6KZHfKK4gTfh0+KGx0zeCk2agoLGxSh+5PebNnfuPuLbsLQv56L
         THgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142883; x=1747747683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lmyj3hP5CkRfmv8NZKBXt2FvgPVL/V2jgy3imsWNkMA=;
        b=SNIGyo3/zuZO3K/Oo/liq/7VgaLOsui6I1OWF6DRKxnsoYvkUKkzsEyCwP0N34f29u
         nIEpxipan0QLofgINW+ctFDFhAYafnGmJ3YXDl8krTx/cVvgUuxAC/WPs4KGM7CeNPzA
         HtcHFrG1kntu9bHbHuwck7a2Po5pO403bldf2S00StT+xJ5xlzoqiJRYwYEQvcIffDm2
         qmzEUufCDRcMIWh9QMz8SD4e5Lo9Y/e8OW1A0J/exsocHv6UfegO4qopFW4yNZZ6FKit
         3hJC5ig1qjsgjF6I8k9GcEZbqqEDt72MWFwW27Z5mMLC/h/X6ZxaiEqw2oFbHwh3RZ7R
         iiiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsnBxESf4cKvgJP3VCt96uA72mzL85IQ1xawud4EXEX3Krn8oukHzZgUqx2WPvc+8DmVsFew79DHVzEDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDhhAtQKfsADkvlccD5w0b++Rpp177Zwlq0yilPRy9WICo7+ia
	/PbfruO08hK+hHyPq4RPAH8lfFQ/1NNxB35d9hZ6Y+snoaLF3/N4Lnq5qHBwF91E6XJ1M45bK9x
	1BAk4hRggx/gKk2i//1DE7gNnFL6UzVOfq/fLfQ==
X-Gm-Gg: ASbGncs1KUgwOif9qz42nWvIjy2HiGy2rInmBbh+GJgLULamVUtuzrkO3Gv16IHTQAL
	PzddED1c+e731+Nhcr7B2UNj4Lfju2gVwe30/kebyct5ggPUfeLV1B+zS/ERbItt+BBi2ffiwlV
	frdeAhGPF98aToZBhk7YqHfr9QG3l5qyEz
X-Google-Smtp-Source: AGHT+IGwA9BFxyqwYNEBt7U5MGtywFT6puWcYgnlhrrQ514BRD+zuSEIuyxmPn0OaxGK/ficXJk/LrcOoaZiYWm0Zsg=
X-Received: by 2002:a05:6902:1893:b0:e78:f395:7d01 with SMTP id
 3f1490d57ef6-e78fdcd1532mr23000451276.28.1747142883341; Tue, 13 May 2025
 06:28:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508200807.1384558-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250508200807.1384558-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:27:47 +0200
X-Gm-Features: AX0GCFtjRegm5A3xop934setnF5I9P9pPbOKoUABWT9UO5DUuWgk9ya_2vMnsdg
Message-ID: <CACRpkda+ouxrpUSbhk0OD5CRjorbQqg_1aGx0WgYw0X78eUutg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: at91: Fix possible out-of-boundary access
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 10:08=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> at91_gpio_probe() doesn't check that given OF alias is not available or
> something went wrong when trying to get it. This might have consequences
> when accessing gpio_chips array with that value as an index. Note, that
> BUG() can be compiled out and hence won't actually perform the required
> checks.
>
> Fixes: 6732ae5cb47c ("ARM: at91: add pinctrl support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied and hey, b4 just picked up all the extra tags for me!
Love this tool.

Yours,
Linus Walleij
