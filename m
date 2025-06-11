Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7832367D5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682016; cv=none; b=RKpltLjNX6Iz9sqLO/+TcifoMs2HIEm635hwMZuO+Y3Fj1Oa850tX4xka7gciCLm2Kd8Bx5RqLvEXzkfXNaUyct8C/viVl97lbuqHERl5n9SVnddEUyK3hBDG6cPIozPqQYoB5vW0Ndl41lxiTBEh3l27O2YAtZdZ8csT2EYCbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682016; c=relaxed/simple;
	bh=LsYYgtbs5whnT9mSXJp1Eq53eFhWhrY5iX4DQHLYkd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLmG5Mm1d0QX54KT9ZEDNr0EwKNgrUVzlo2JshN8+j5rVP79Aoi9llaw78TuJQAKfUEDQJ9h6bKZYHVI4O9EmkjlRMUMmDB22RyRN3hObzRvBdWnuxJTZyIYGxwLXZzu5c0O4sx+p45fqpocaBvj/b2UiS6DlJmSHhGg6NgvNWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c/5vkNUn; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c/5vkNUn"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23633a6ac50so4256095ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749682013; x=1750286813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dFx7aQNRgw8lJFWTh3MAUKZTG+gQu0E2L2N97DFRfu0=;
        b=c/5vkNUnuyT1VAEl+ibRIrWtyOQK98TiGgvJm98P2tpwdEDxj+IPbhaIfPb1WdmFI0
         xfGtrNi0mjN93WTSIvesM4xupcICDyu1GJF+QHTnO8g5BcB/AHNx9SpnQ/mjwJGQHWFI
         vTohj/BMHjmLxv+W2ctFlMeHuPTvBTUlP3VN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682013; x=1750286813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFx7aQNRgw8lJFWTh3MAUKZTG+gQu0E2L2N97DFRfu0=;
        b=rtTEvkwIJ6SagMt0ITQuWkLxj+joDTjISUgZKWYBg07sggsvgUD29+JBi8k8o0CLU8
         BEP6IngAHtyStUfZ1oihesjYtys3qZ+PTDSr7OaMH0KQEepHQAeyglsoncyy6/SBMhMp
         Ldha2vqZ9X1eZ6kl9Olsf0dUvAwLnjdwLl0CYmsVVuMQvLl5llj7IJXYsvVBNn/7bvmp
         rVUgjvdy/6qfhBoZwsDlG0Srt8WEoiVESvLj3yE6eiNw6SokGfNU29hRofiwxQvnQfRD
         7BRMOn8nazQw03BMcotWrKe0X72+gWz1yMqKaC5GL34mBAgkdVr/Yj3AcymRM7fVwxRO
         57yQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5N0cJztppNmKNhxdAoq1Vqnukq3SFz/4Px3tjq+54R1cfYUgIoThQR9/uCK0BVSluSdNCMnEKK3A9Ksc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk/AMuNLjxi2QSSlx1wgmw/NPHDzGrfWqqt8iG1sFDrbWze8YR
	r9x7foBDT9ZGuSJ5bywYBcEqbyuyMb2hRZ84F8PBCeeyD22w8UlkWEoKFcZvhscaYw==
X-Gm-Gg: ASbGncuIEkQRuUZO82JavGb4nluW4UTOVAngD8X0f8HFNGEuSuH1U+Z9s2ZWLwAuWaF
	K+xGP7wrTPYAm8QDjjWY3StoSKZMPZhkFC8G5ytKab5MOsV4dllGkgKEVgMMwh9dxJWvLue5YbB
	sqaGTK44Hxxxpeolt1WzYH56AVPd5WZU07gt2+//aI2aNFZ3kwLLhtFcltB9U4PHjeSnqzHVmR/
	WtQb+0uaDDDtQ5JPdOtrg4MVb1Jl9ARcUZ7UXvTEyZGrGWFuEaa/EP1wJBwwZBZUhGUNRXBsPeB
	MULtVYWfCe6g8B1hmfR0DW+4nyekhvLRzRlen7BKUc0QO4OXzFvulBIMf3VScoRCfK23FqJNobi
	QFwMKGWbWEwDX3f9yBZHEEl22
X-Google-Smtp-Source: AGHT+IHfxQumAIvTnAC11qGewLlT2l+e661MXzd9Z0cWhYEeo+EYBK5deXOhCJDGROAteHYAv7Tqyw==
X-Received: by 2002:a17:902:d550:b0:234:ed31:fc99 with SMTP id d9443c01a7336-23641abea95mr74422965ad.21.1749682013305;
        Wed, 11 Jun 2025 15:46:53 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:e790:5956:5b47:d0a7])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2364e6fe4ffsm899915ad.147.2025.06.11.15.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 15:46:52 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:46:50 -0700
From: Brian Norris <briannorris@chromium.org>
To: Rafael Beims <rafael@beims.me>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Rafael Beims <rafael.beims@toradex.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH wireless-next v2] wifi: mwifiex: enable host mlme on sdio
 W8997 chipsets
Message-ID: <aEoHWrBsMTBJ1rja@google.com>
References: <20250530094711.915574-1-rafael@beims.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530094711.915574-1-rafael@beims.me>

On Fri, May 30, 2025 at 06:47:04AM -0300, Rafael Beims wrote:
> From: Rafael Beims <rafael.beims@toradex.com>
> 
> Enable the host MLME flag to allow supported W8997 chipsets to
> use WPA3. This feature requires firmware support (V2 API key), which
> the driver validates before activation.
> 
> Tested using sdsd8997_combo_v4.bin from commit
> 211fbc287a0b ("linux-firmware: Update FW files for MRVL SD8997 chips")
> 
> [    5.956510] mwifiex_sdio mmc2:0001:1: info: FW download over, size 623352 bytes
> ...
> [    6.825456] mwifiex_sdio mmc2:0001:1: WLAN FW is active
> ...
> [   12.171950] mwifiex_sdio mmc2:0001:1: host_mlme: enable, key_api: 2
> [   12.226206] mwifiex_sdio mmc2:0001:1: info: MWIFIEX VERSION: mwifiex 1.0 (16.68.1.p197)
> 
> root@verdin-imx8mm-14700070:~# strings /lib/firmware/mrvl/sdsd8997_combo_v4.bin |grep 16
> $Id: w8997o-V4, RF878X, FP68_LINUX, 16.68.1.p197.1 $
> 
> Signed-off-by: Rafael Beims <rafael.beims@toradex.com>
> Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v2: improved commit message, add r-b francesco
> v1: https://lore.kernel.org/all/20250521101950.1220793-1-rafael@beims.me/

Thanks for the updated details.

Acked-by: Brian Norris <briannorris@chromium.org>
