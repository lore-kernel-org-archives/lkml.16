Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E56D537F8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767932; cv=none; b=SCsuh2wWpLVYCteZjmtRddyQCVo/0NDRoB8HnT1RI4H2nrrNOkU9DpkpJ4OpLeBbfYWJ41eefhV5108r62dnbol8I0XNpak73MQM2PxzhsDSsYIFMv47iR6Te9nZJo9mhSAg+zNVl6Eoo5fPdf4ZDq6kbbp9C1bztH0WTmZv5AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767932; c=relaxed/simple;
	bh=qeiCeGRpO0jQPrPrE/YnP8cb+uMMbCIjMfsirNjXYuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpKUkwcI9PG6w/CdlR7HCg5lJccjRDo4VSTJeVbzcO89qWDckoEHSRFdcquVF/epainwa4bLqm8vPeHlHgXlor70SnW+BVBb/06QIKTCChrjadxGkRqJArjMmyziHL6GZfnkhrCYdsEL8tDajSSqCDWcPMc9IGrkt/y+iWEzqiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PVlpP1fg; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PVlpP1fg"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748764d8540so1422316b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749767930; x=1750372730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6Fvf8WT5Rb3cjKjtjxn6WWzjAeKWIIgK6WQmx+5Ghs=;
        b=PVlpP1fgyQErrsu/+7UPVAuUS/65SYgvCI3cgtkXFjgrwDscIlED83Y1lrT9Q6X0zq
         xk3uHx3Q0/7jtYPv+3dffpZs6lo/YFBuxuHpcI704B+e4GruNzlvPy88Ks/haxus2RxP
         OfwNnLm+dzWwN8HjYuvS+ey9hO1Y8xRuNItKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749767930; x=1750372730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6Fvf8WT5Rb3cjKjtjxn6WWzjAeKWIIgK6WQmx+5Ghs=;
        b=E88EMrPa2LWgroZf6Tyt8EVGXHoYKKGLAwF+UDKPIZBgDLTWXYkEvb1GZ9gmwrLHri
         g04SVrUJUU9LoQd2yf7NwMuoR+Bo/dV0NQUgCxKR1HNK6M16DEZUhKJ60utY/TGk9sAG
         lbXWnqRnz/wQklymQFyrOIOUx5xlIIU+GYsUw1rYwS4C4e1CUkNkY/QgCPcJMfSJiukk
         qzKvGlxxtUUIZ+puRBqdxVocUgKbniAbQZk7T+jIHusAZR1hFOWQfZvNVkfjM075FXoU
         1vnjdq6ZezZn+PcQyKnhO2DsYtoYzVlEK4GeK2n2L9EPVqDqavhfI7UAKP5yfZeeA8aK
         Tsng==
X-Forwarded-Encrypted: i=1; AJvYcCX8iAJ3q1mTyP0tEtiDAhcQRQqqcOIxMa3r+2Bw/iU6Hd8iCl2pyd5uT08tRp8+XRodVXtjm/l1Avg9B5c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6heoS2EzUGuuisMuZaY/T+ivUIORjReAIScF3LyXez1CxSMFy
	FNj6WoSEL+g3TSzBXV43oW37IfNv+D8jBgudTyPYZOpZPghIatZ4SIe0IfTxE2KTahXXGv3UAAa
	+vTY=
X-Gm-Gg: ASbGncugKKwtidh+GzY2587YfKthzHux+JK8ZxArrW/5oGX1qtMojZ2Nz1u1+83UKfm
	pI9C3HUVGOToXDa1UidYJ9zKCptzEfwhS90c+F68iEdE8CiniGHbIyGAxhGaUYeZzMFJI2eKqvE
	wV8CXj0lQMRS8YeShOjCv8VHcoiU6rOITOP2yFCJlB9QXORBQb81SFIvPJzkjQemay0kMSPL6rU
	loco5qBKiflTWYjEWM6K4uVslr6QQKfGcjnxKswOxERf/DY0w8sJLaUrpEdHTgXHk7numsxCYp8
	Ch8b/Pg+7OAGqOIFW5wK+ZqxO6VwKAl2B5pjdlrbJSdMYwhNdP0MsiUNmtPKifoQGCWjA5UWFop
	KLVp/xSZGu1i94j1fb43eYqMT
X-Google-Smtp-Source: AGHT+IHqiaEQ6mdHLqUXXWFR0M3wpvpZgv0dGpw+onPhdrgwOTLTvDPCn76ggFnz9nH3sFK3EQNJbQ==
X-Received: by 2002:a05:6a00:124f:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-7488f71e8d7mr1300715b3a.20.1749767930186;
        Thu, 12 Jun 2025 15:38:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:9a04:ac66:831d:e4a6])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74890082b10sm275617b3a.105.2025.06.12.15.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 15:38:49 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:38:47 -0700
From: Brian Norris <briannorris@chromium.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] firmware: coreboot: Linux-owned SMI handler to be
 loaded by coreboot
Message-ID: <aEtW98A2-AHYjySO@google.com>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <410d4d62b031d0e751e1933cf746540d5cb1682c.1749734094.git.michal.gorlas@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <410d4d62b031d0e751e1933cf746540d5cb1682c.1749734094.git.michal.gorlas@9elements.com>

On Thu, Jun 12, 2025 at 04:05:50PM +0200, Michal Gorlas wrote:
> Compiled in similar fashion to the realmode trampolines for x86. Currently
> supported are two SMIs: ACPI enable and disable. After being placed in SMRAM,
> this handler takes over handling of the supported SMIs from coreboot.
> 
> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
> ---
>  drivers/firmware/google/mm_handler/Makefile   |  51 ++
>  .../firmware/google/mm_handler/handler.lds.S  |  46 ++
>  .../firmware/google/mm_handler/mm_handler.S   | 510 ++++++++++++++++++
>  .../firmware/google/mm_handler/mm_handler.h   |  21 +
>  .../firmware/google/mm_handler/mm_header.S    |  19 +
>  5 files changed, 647 insertions(+)
>  create mode 100644 drivers/firmware/google/mm_handler/Makefile
>  create mode 100644 drivers/firmware/google/mm_handler/handler.lds.S
>  create mode 100644 drivers/firmware/google/mm_handler/mm_handler.S
>  create mode 100644 drivers/firmware/google/mm_handler/mm_handler.h
>  create mode 100644 drivers/firmware/google/mm_handler/mm_header.S

I'm not reviewing most of this patch right now (for one, I don't speak
x86), but for starters, I think you need to add a .gitignore file in
here somewhere. After building your code, I see these untracked files:

	drivers/firmware/google/mm_handler/handler.lds
	drivers/firmware/google/mm_handler/handler.relocs
	drivers/firmware/google/mm_handler/pasyms.h

Brian
