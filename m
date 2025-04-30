Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A221EB5B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746019905; cv=none; b=agK0W3BJBcSP3W/cTWKuaPgGg6UsmZQrSmHP8xLk4JhZQK21i9tcZQuJFM1UT65asJzSKKmmgqbL1DB42qCRLDam82/b0UW/yyUSnG2kDp3dJB58+zTkbFWhZUiNfHWznimGQLoPwGgihJaNfXF9B8EzNgU7gRBh2GytEHCEOq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746019905; c=relaxed/simple;
	bh=p98MxICZ2hRwZcgshomPAWNE3MrQP1Pftu+P1/2Tcfc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tYVDIMnJyXGwLnyPAFAWf0eTRPoBsg0bblUCtjwqMCwf2+2YyNRRmeoyrG6UEnMKoRwyTXpD446gmkRM3tmoWqilRPqtK3cSj4Lx8h7Tdx7j3nPq0fQyQUYy2/TNWQmsE72HHL6rpAsFKduAoLby7UNUQo2zRwT5LKKDjD1fbXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GiEbLLJ4; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GiEbLLJ4"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4775ce8a4b0so143565051cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746019902; x=1746624702; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J27zH1j+2DGLSZuiVQYcAZeTzSnyKb84uUwM/rDsIQM=;
        b=GiEbLLJ4SwvqnZ+rWGD9lr4E8UOYbZ75S/gGWPb9DlwI427Pcstq246UpNKnV/H3tO
         KFcIuBLq9gpekY9hnyahirBZycknhkoyCVSLwUWC9lSR+t9ztzbff+0JrZvo35aClXfq
         FdKjfOS7yUEQuZX0Gx2TBxMPMG9mFoZQcMNAYP3dOt5njkfdmpC9Kp50+ODVXcTJpsQE
         GovqPlYGe/RiJ5e+p0Guhfibn2aNaHMALn80zzUv6x6YtHpArXGy0FTAgEyrEcRDvATl
         ATEih+/adwQRbEl69X9l+mIPq+t1+HDl1pj/Vyp8w5EETqxi/LYkK3Zd7/gvNIBTcfjx
         MYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746019902; x=1746624702;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J27zH1j+2DGLSZuiVQYcAZeTzSnyKb84uUwM/rDsIQM=;
        b=Nq9bWl9LP8c0Fts4oiWWhMyzOUH1bur1AtyIIEkvfvCqo/CFUdtSzrrfaW0MG0PxFg
         2PXifryAFWab0u3CSyJmP5GknVTxGuEFio289qUs082MHdwzPzUVYrrO0Aa4v0QDfomV
         fjXH8y4h2rDSwWgmPnhAg+ZryC6pC05RuD1jhp1yy6/SWEMt8Uf5yKmMsPsYL1P1V+Ih
         dFVb4dKX1DfWQtLqIwmYXlxpaYyhOxcPhQeMmbo9KOxwUDFda/+MmPWFVsTufbTiCSht
         jkF7MeqQ+x2u3/mA5ankLU79/g3nVdvIlz1SKSjGtnOB6z7o8Iq25dRehh1lLRGHe2qQ
         KS7g==
X-Forwarded-Encrypted: i=1; AJvYcCVhS26Ya/ZFGVq6K2tTUY/JQZQJ5YeBZAN+xTlbFI1KLlgswT6Yxe3+f1QMC9vKBIGdzd9xobxkizx9R9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhm2PYsCnCzRIPxYoONewIn9i4BtTBCK3SXOr4b8kKEvuWAFDU
	mVHVJT8nkZ/4i78O1hLgsl4nXaeb/TJqtdpIAn78ML0mtByUkcO/v0tdnlwAjbg=
X-Gm-Gg: ASbGncuMobJFFrYAFa6Bl0vIdbJIYxQGQfLuKZ26FqYmJx1Wi1N/ZyaS7ycY+NA07Cd
	lryZyPXUj5bxI56YoY/H2jIsmLgpWY4JjHm+i3/hCTpdgtcX0X2kcIq+6b/zf9OScYK1tv1eWHa
	HXKmWrYFqk3IBlGuwSwVxOgKYwdbmeuxBUC+sarEQA1ykPRB/zXnnfRKbNejw+AJmepQ+h+2e0e
	2ZvOenIh7u621NCSmRe0J9GAlnhai7NTUtOZ+o1TWQLRXHe2+jfsaA7uvyJbaegxb6Usx1leCoC
	kroa42FPEbAhumkocWa4ajJm8b2jqeVwk0TMez2QX+m8gJOHUXje7VWi/vAAeoAAp+gENrmaPWv
	MWNY=
X-Google-Smtp-Source: AGHT+IFHOhrysBR+6DovsVdXIpuhTVp8HJr3/OBh9t/W0q0+yunbstdhdagS7/7fV+TcxTFn88rdTw==
X-Received: by 2002:a05:622a:2514:b0:476:add4:d2c0 with SMTP id d75a77b69052e-489e63d73bcmr43950311cf.35.1746019901714;
        Wed, 30 Apr 2025 06:31:41 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ea1ba29c2sm92032681cf.76.2025.04.30.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:31:41 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:31:40 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, 
    Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
    linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH] vt: add new dynamically generated files to .gitignore
In-Reply-To: <20250430122917.72105-1-brgl@bgdev.pl>
Message-ID: <sq7527p1-9218-r845-605n-2p419s2650s5@onlyvoer.pbz>
References: <20250430122917.72105-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Apr 2025, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add new dynamically generated headers to the local .gitignore.
> 
> Fixes: b11a041179e7 ("vt: introduce gen_ucs_width_table.py to create ucs_width_table.h")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>


> ---
>  drivers/tty/vt/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/tty/vt/.gitignore b/drivers/tty/vt/.gitignore
> index 0221709b177d..49ce44edad65 100644
> --- a/drivers/tty/vt/.gitignore
> +++ b/drivers/tty/vt/.gitignore
> @@ -2,3 +2,5 @@
>  /conmakehash
>  /consolemap_deftbl.c
>  /defkeymap.c
> +/ucs_recompose_table.h
> +/ucs_width_table.h
> -- 
> 2.45.2
> 
> 
