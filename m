Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6389256C90
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311394; cv=none; b=E3NXkLUxUKeMJqYEZk7lr7jLzfgVaLWTDUzQ/Rl4kfvRxK0h6HhYYYDSmnuUl0VXmLFStPmtSTG8UrlLnL4Aidv2cHAZ96y0UFkSHqbTEY6Sk0FTGR7ue6/3lTFUmy1d17xtpHhdqO4E1RuKX0TWn+RwbiiTpGjaU192xmhe/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311394; c=relaxed/simple;
	bh=j2Ob66Rtr/OcL8WMKwjl8rSD9FSvM7IzHTjX9aLSPyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ar9KxTV4w1tlhsc3cjhl060bpUI+sPykdmWya7J8fyOEt4NrWuGGYWMaMb0rSszOSLNnTRxj1D0JMYZ1NXTUToh7pgh1Jj3LJB6W9S2MfpQrQoEx2L5sX3MJDRIkoBiEy48hvMsu8yTi3WvMwnGFNJ4qqCN3rwJoxCgswAJFOXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NrZP9FM/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NrZP9FM/"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c30d9085aso3548096f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745311390; x=1745916190; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F6YQEjY5Q5v2Ad+avGWub9mCa2Qmpdp68n5WQvzZWuc=;
        b=NrZP9FM/xwpD/KLG8bUo/LM53UbpLTrOxlctmCkm/zLK2mVjCzeWrBqio9NOOJ8Lo/
         8YBGkDDSiv77CSHGhggmFAZ5CQ2DUpbhe7RUshn23DeO5WGWuw5jAW5Bk8ZwRl7ZCwei
         U47o+8AwYWZsChfPNB6Y+ng1YfgyYLvt9xevQ2AmRHtNxVxXh4+x2McUWZnoAT2lT3UG
         dnr83AjDmMHikHYw8/3A9FvhZQCSvbkD5ta5Ttgy930GKdadaoEJJBUEYK2LnQikMvF7
         LjvvRXC1vS1YaN8RS+pqY3RP/KGrJgNuzrAi/RTdtbZHLjiDdxOmvd0McsAaLDJlnafB
         rNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311390; x=1745916190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6YQEjY5Q5v2Ad+avGWub9mCa2Qmpdp68n5WQvzZWuc=;
        b=j6Xtv0+D0wX9HRFYWtUlo+tqSCw9Z9V1AWQr515M38jI3ClcU1r7ap9nV3iQ6YeexO
         L0GEFfQnaVbCxFmWY8KxaIdg5pN8PtYqkVec8Az4ENnpMxKu1yqC1e8M9OYEADjiY/fn
         6T2hMD9JbMf33PoBBw20QCCymBBYs4WXvbvZYL2DG+CgLaHgDcxuoCfjz8hHqaMu9aAV
         3d6ivYltPBp/DEdRKeOa29BaUq0x9Gj33Sg6WyVWmGwGXtBRG/00BLXv6p95AopAjLfO
         fTRxGe9MybDAZKRA4srHCPkxgH1W9RMajcOhBAlTycjoVr3B6yo1+GVV5rWeRTK1yzyl
         xThg==
X-Forwarded-Encrypted: i=1; AJvYcCX6w+aCgii3C/6zLqMgFySlFNEE6hAezWZwImuweTUgW3sKxCw1d08FMmO6n+0rT8ObXZYW9EGSEueaFRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNRVkcfBtZv1nHV65Cq9L6WcNoGvYFhVpc9OQNimiknCoD18V6
	yEyXAedSb7CoD0c7yN04wMnlTZUfyq/L8R4fRlV3C0SXOUaFgT8d7Yfq0kusE10=
X-Gm-Gg: ASbGncs0b7HTnFS/K5nd2Yg94pZK0MCXx/wGhElnIMffU8JMguc03rhAcwZTLK9o/2C
	7x03gTG7gxCaBxVqCGYAK7UW8QSXzld3rYQMfYjMmkJzg9oHE+4EJG41fM+fzbFMlzty6V1Oih2
	M6MfooMDYFPdwZhx/YSpb4RllN8EtY80BplCI7LcSIUSVpJG+GxNhPH2opKr7vpekuSb3JCfqNk
	Po8fWITLEfGLpmXoQZp7ZogYAbRFg68RGvxTHE0uPx0PhlNU11Jo7JaNhpQSio3dLIUEA1OG/U0
	DM5TnzDbo4Vb/GUXIoDhwIolT+1KCoeWS2DN7I1rbTlMczjY+v5gzMruCZrFoZhuCHrcbUfoNDw
	hiTZ4S3r/oraP
X-Google-Smtp-Source: AGHT+IHb0CZnzbJFbwD2JDDCuDOEX2AJjnDsr1vXrnpvtn07VBcb9b9mksDrCjTha5B29ZmjsCxaSQ==
X-Received: by 2002:a5d:6da5:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-39efbb09d5bmr11628403f8f.52.1745311390112;
        Tue, 22 Apr 2025 01:43:10 -0700 (PDT)
Received: from archlinux (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4c0fsm14359582f8f.88.2025.04.22.01.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:43:09 -0700 (PDT)
Date: Tue, 22 Apr 2025 10:41:52 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Nuno Sa <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 0/2] iio: dac: adi-axi-dac: fix for wrong bus read
Message-ID: <pudzvw4sbgw7ixbke4glovai5vxahmwrjpqlwrwazpeulyowug@534aodgws5db>
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

Hi all,

please let me know if you want me to use defines for this patchset,
i don't see the need honestly, but eventually it can be done in another
separate patch, for the whole adi-axi-dac file.

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

Regards,
angelo
