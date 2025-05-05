Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095F22BAF8
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746444871; cv=none; b=YcFd6YCQWUv/ww8t9VS99QN2cYBJbseegUqcbVLdieYqAotPPhmiy/ymOAB8nu9pgJgCgBVIF3g/ccP5pgafBsmiDKLLh2W9eIPdwoGEkMivCcOHc3+Ai1DSF3VVyT56IpFCZl6cYvktbrnBr3+7zf5+3X5EXwYQDFbC5WYu8cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746444871; c=relaxed/simple;
	bh=DtywXT7nOiCZeCGbKRlPTp0nGZw0T4I46KUEBcRogn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePk5E3qtDVekOA+CFawgkRHtWfBgTntl2xdwRBq1RvcI6qxebzSfuEMFnsoirXYzcibOsvSMpCAL5ZGaHML5pQTAmihZzeJRCUXRigHnFdLJNBTVOSY5qPkajq+0RQN5Xq3w6PHtOCOjQWpN4KbSmvDDjoACDCbjEDxj8YbUuH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CKk5SApZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CKk5SApZ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso24715725e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746444867; x=1747049667; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6XhugQLAUiTjEXSojV62+wHll132AeV85P7tE0uK3wI=;
        b=CKk5SApZvok0ejDMt0CbGzY78NFD16lMuoShbB3eLtoJM/nYTrX9xKsqb24+CdZd5d
         UH9QoDLcH+usTJejPaxYVx3S8EgITk3Oq3Lo7FB1ilVMr3osM+OVIaja57c5LKRN6ce6
         lAB74e+m9OTBAI0At5FWMbBVR+YEvnA4WjnlkN1ny1lRVoSgSPazCmYlZeXNjU03IAq4
         tiq5HHNuFueIS7a86ZIF5xQ9vXYbCRdWLvqTgT56qdCXz0gd30/Yqk3X2dMva4DUwBfD
         URKCmXlvd6QEzTv9x2r3RMgcTSstlr7amSj0biFjeuv9qwk+qvdSyBNakJ93HZsbBuYF
         AhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746444867; x=1747049667;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6XhugQLAUiTjEXSojV62+wHll132AeV85P7tE0uK3wI=;
        b=O4wtwWzxjoc4n4jV5zFpTgZ79yaS0SZFudty784TS4mq3Hu5Do71TZVpQLX9lkYsbs
         93IdwGKYqA9jXIJpaEAf/eCY7hJb2UJAGC9nPZZzKxPetlN0DEAokuiheehMWaGWawSj
         iCdbQ2D4LSliZ2cDH3nR4nH0ILapNlTafeiHuIYMT7OhcWy48LHbUMo0gx1+riDPT22R
         ohhSU2HuLPVbBfc4ff1UdXBVpiiTbnZHzgwkzgfrxLZ6g6KlxtbTRumKm3H2Qu4F2/fR
         kOPihGTUw548zZYfz7AK+wNmxIa1tvEYQxZSiiWl3bZKoJ/8wZlwfWUJjhbXZ1QIxjqP
         hy6w==
X-Forwarded-Encrypted: i=1; AJvYcCVL9KHsryK77eRmgafYhfFs18Ud4pdVnZqwEEdRyLiNauHuFRp+BSDySTKZ5NnIR7mUM3xSuCHy10sMZpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwheiWdinonjhPAOdLpiSvpmMBAIHt7mQly8cgYwBrfz50VnDa8
	taq/JizEETdL2FibHbI/WYW3oqAlKP7vXezBuXHN6NinIkJNpVpmyicHEqHrN/o=
X-Gm-Gg: ASbGncuzIPG4cqDgkMllavIC+UfxS83iQsR/YMXjN3ju8KtdflxUVKd6S1nkWu/s8Qo
	VSFD9EewVx1pg7ibWi6XbS8g66hgdChYyA0tfmEI+5KdzkAAvTs3oglCMloMIZv28G/0NAi0yVK
	ySt9WS8I7aXmUDIMTiBcm1mqDgIPgf7xIbD4V+v2nc8S6pafN19nq7z5iCQLvtOGsHAdOJdHW/7
	hI8XGuMR6eW664Ero6RzHjVmUhyltOAjdmE9tv3FlA0HvGwDw0YRU/qu1AxxHHwO9DL9Mr/jKXw
	UDUqJ4HxySjp4hXraZ7uOU+l0SSgnSxEDRzU7HZkL6PwhZOVMm/Nvh4jZkEWMwZJtW0n1bS9yBq
	ZAbnHlr8=
X-Google-Smtp-Source: AGHT+IFc3WNbIuzpSHvf5EhEDFFev353yEFZ4/59iWu0heuGbRxVu2xM2FS8TA0uICZNl3YBTu9s5Q==
X-Received: by 2002:a05:600c:1d8f:b0:43d:7de:16e3 with SMTP id 5b1f17b1804b1-441c49237f4mr56899705e9.24.1746444867296;
        Mon, 05 May 2025 04:34:27 -0700 (PDT)
Received: from archlinux (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae35fcsm10318859f8f.32.2025.05.05.04.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:34:26 -0700 (PDT)
Date: Mon, 5 May 2025 13:33:16 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Nuno Sa <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] iio: dac: adi-axi-dac: fix for wrong bus read
Message-ID: <zca24hgtpycx3l2knyqdt3eu7mfyulzxjphsypae2jzxjgvbsu@2kslj4tcihv4>
References: <20250409-ad3552r-fix-bus-read-v2-0-34d3b21e8ca0@baylibre.com>
 <ac50109f06d7191549a91779028aca6d639998cc.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac50109f06d7191549a91779028aca6d639998cc.camel@gmail.com>

Hi Jonathan,

asking info about this patch.

As explained, would not do anything else here, please let me know if it can
be accepted or how to proceed.

Thanks a lot,
angelo

On 09.04.2025 14:57, Nuno Sá wrote:
> On Wed, 2025-04-09 at 11:16 +0200, Angelo Dureghello wrote:
> > This patchset is intended to fix a random wrong chip ID read, or a
> > scratchpad test mismatch, tests done in the ad3552r-hs driver probe. The 
> > bus "read" operation must always check for busy flag before reading.
> > 
> > First patch reorganizes a bit the busy-wait polling code, second patch
> > fixes the wrong bus read occurence. 
> > 
> > NOTE: due to ongoing changes in adi-axi-dac.c, this patch is intended to be
> > applied after the linked "ramp generator" patch.
> > 
> > Link:
> > https://lore.kernel.org/linux-iio/20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> 
> LGTM,
> 
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>
> 
> > Changes in v2:
> > - invert patch order, fix first.
> > - Link to v1:
> > https://lore.kernel.org/r/20250408-ad3552r-fix-bus-read-v1-0-37add66aeb08@baylibre.com
> > 
> > ---
> > Angelo Dureghello (2):
> >       iio: dac: adi-axi-dac: fix bus read
> >       iio: dac: adi-axi-dac: use unique bus free check
> > 
> >  drivers/iio/dac/adi-axi-dac.c | 40 +++++++++++++++++++++++++---------------
> >  1 file changed, 25 insertions(+), 15 deletions(-)
> > ---
> > base-commit: 6fb85f14853ddde06d57030c753168402bf69cd9
> > change-id: 20250408-ad3552r-fix-bus-read-1522622fbd2b
> > 
> > Best regards,
