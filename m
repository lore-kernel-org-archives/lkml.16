Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B8B224B15
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746103126; cv=none; b=IRlcFQfvHsdiL1H4pxOMIsFZ0NU712R46J4sehlnEmFjvdnDCgKVO8rhoKvjimLim5skGA27yZg1Ecv8ko8A1s+JsABvvd/V9qRmNk5UJ9I048lx+d3vkos6Vq3uipp0K60v+SDrWNhfP57+2I2edsRsI8yZ8eVnFbUG8nRuVWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746103126; c=relaxed/simple;
	bh=4sxWwKfM9MM7i7HEgmm3EuU9czAYD4Fqqroj1jSsAKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P33Swxqd+qE7U7Q2aSx84rm3dyR6ohCuXz3uiwVG8Xk5l5TefIA9I5JrvFOCMaHpFXe4kypbeHTn/C7bZzMaTrSlvmq1B4BAU2u4l7mr/IF4LPKWVDckUxEk8Is6Q+lGur/1R4DBWyFE+5RvBxxzdCRwgw99Csz0mszEmuSim4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=O50tyarb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="O50tyarb"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so5250975e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746103123; x=1746707923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sm7fH/v8m0Z+i39l/2fi4Am/T5LmhFAbr6DYK3zAgKE=;
        b=O50tyarbKm4Fll1hfAb+tLrCDMjkqWTQcVRKgk7+TSsC4HMRyt4ZgGVGhWExYEjYvR
         EKYVfZuUJ6SQxoqLiy+3tzLaIJ5/fYBL8MbNwzUTd6E/eBGyvZQQ/MzXhB27dmdxZBUx
         gu7mQm5vQ7ECFFOA4p8VY8XK20IdHMYCLXF6ZtD3kb+rHmhJsaGkBr2Z+49ERKaBWHly
         zWTDZTrGDFwvpcTxRxEYVUQYsHherSqvj/u8eTg+D7ASJ5/FmYzaJepZPxjDT4Wq7TLn
         OJJ/14CyoRgLKtVLb0YO5GGer2NNbDM39ylzoe1AK3l49YYvCEbW7DmuM5ii8jCHpTfP
         AOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746103123; x=1746707923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sm7fH/v8m0Z+i39l/2fi4Am/T5LmhFAbr6DYK3zAgKE=;
        b=I/D2KPVBWz5f1N4YZ+9PHQuo4+Q2oCL1O5pGOqEbNdfRfajlKMI/BiM5yyedmqqqWq
         MgQMTjV3mK2OVyd90jVZI1X4ZFY5+8LrRpW2zZH3wsW00PshdlEYrTpS4ifXjN17Lpvr
         IpN0rukn9uaSMLhMXXZGo+cGDHktAaYq+h6Pi9CXvDyHWRIh0OaM124cuLNf1IuPa2Y+
         HrL1hJzdxPIfAJ4glqnQxnz26AlIBLuMlc4GkQxUEVnD5plctYRlNEfckKL/5rKw094S
         bMxfNtZqlrU8a/E0GBxUjUy1zInammU/7VvdQLeXQjG4jNxilCt20EM172QIHxRPKkZk
         P+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUn7h8NqOvRSiOE4fNIyFjSYnofefT+tY2vEt8bbKVBAP9gi86uY5+GgaTmyNYG9wwmfkyuGb7UGkntrYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/tgO5RRo47bc7BzdmE4VdL0MEXHLcq0JTC+LAt6r+qunGcgg
	vkZ1b6H8mzth9AK+awk5r4N1Pfg6NuOqgk6/7OqrkoKuUGims1Zxxhvr1/DaWfo=
X-Gm-Gg: ASbGncug54MUcb1HgBCOirHTjOEDFRtcKfZoPPrMeg37IJJA3A1kpGQtPH2BOkM3g9L
	SyBANk+gTr/bj4f6iLNEtkzeNziH/JQlhV8+aXgHg70bFocGcCo27vRcROR84kGaRqY0ZK6rHik
	y3XpI7GV6xiDVpI7pNRFCfGGl48zKmH3NbHcBsGs85chvh4e8PV0gzCWHgOU/VCqdzNeJVS5hmr
	QmoQyiGA/mCoB0ig0+fn+gmXXw+TeeSjfZRNCbeCjaiSZuIJJW0HYDpWsc1kZ/OXWMgjP3JoUjh
	VQUqQoYdZlHkvVDyF5OHtPkmLjWkuZ2WoiF+uzGdBZo2EtkFU5cf7Qxq5BF+70mFA1SX2tapXdg
	q/Km4znU=
X-Google-Smtp-Source: AGHT+IH/kEW2qU0NPr09x71pmesuZI0svNhYFSmpO2QEjZI5N9EoSoHJzC02SedbPOuY7Q2caEVC+g==
X-Received: by 2002:a05:600c:1c1c:b0:43d:54a:221c with SMTP id 5b1f17b1804b1-441b7009073mr21364735e9.18.1746103123359;
        Thu, 01 May 2025 05:38:43 -0700 (PDT)
Received: from archlinux (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286b9sm10834395e9.28.2025.05.01.05.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:38:41 -0700 (PDT)
Date: Thu, 1 May 2025 14:37:31 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] iio: adc: ad7606: add offset and phase calibration
 support
Message-ID: <hrpkszwhww7zftp45ipbadwqmx36rrrnvdbfphj7xkbtnfegth@arou2htn22ec>
References: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
 <20250429-wip-bl-ad7606-calibration-v1-3-eb4d4821b172@baylibre.com>
 <aBIcgxcUHXRpd882@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBIcgxcUHXRpd882@smile.fi.intel.com>

On 30.04.2025 15:50, Andy Shevchenko wrote:
> On Tue, Apr 29, 2025 at 03:06:47PM +0200, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > Add support for offset and phase calibration, only for
> > devices that support software mode, that are:
> > 
> > ad7606b
> > ad7606c-16
> > ad7606c-18
> 
> ...
> 
> > +	if (val2 < start_ns || val2 > stop_ns)
> > +			return -EINVAL;
> 
> Wrong indentation.
>

code is correct, i checked it since also checkpatch claims for bad
indentation, but i just have 1 tab after the "if".

Quite strange, where could be the issue here ?
 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
