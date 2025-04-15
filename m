Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4D72750E6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702636; cv=none; b=MqF0anzd72mfnI7TQSBevrJQIeDrjO/W+8MOTO5lUFu+PznfLYzCvqqEiD4wD/FDAZFBA1dLOyNk5w2WxwqYDDTAiPScce2Uw4zaEq0D/zoFRf3zZRbGl5AJBf3ylpvptp0bm18nGwTSe0tLrNmXAgThFvfVN4WKswDL0ohR2hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702636; c=relaxed/simple;
	bh=thQvJs3pcD52ng14fdk/STuZKvWEv/xKe1W9md5vJCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQR/iIrdMzoOvMPd2kTTvQobIqo92y7BQWZ5QvCaoxa/mDNkdylJLgQtzg/Jtk9WnGi6KcnPbPms5NmQkw3hHykSG6gLs7n3R2pdXW92AWjwGvgIdmjn4QE8jDDQmcTScPYfLSnBhgJzgGTk3t1e8X3Hr9XomSlgxAPJIEg9JEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ga/oP5aG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ga/oP5aG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf257158fso36680695e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744702632; x=1745307432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fsVQGeXu3V43MLoNNqO2pG1nVJmJ/d9W3Z9XY8qBjRQ=;
        b=Ga/oP5aGX6iNf2CXDzJEtXBlAbLedTAhrRXuFcIk6O6LFKJ58m2H/O14hX29oDd/5F
         72daGv+QS1mIv/Dwkdu/8Kp9z9HicVG4PUqPRkXuN8AlN/CJuh2aE37fDKfHJX6LKXdm
         aLRvnPe7s3JFMnJNg7bySjyJSK3JRp+kwTgQEx5eaS43xHZAHRvNV4UEMG1mTufB0N92
         r0Gqo+0DAtJtlyA6lTRChjv/XGX8rYXzwmBWu3LC5LmyqjzFwI9cu85gXx+lzkKgiKMs
         vefV9PjIalDdsebtb+6jFwCIeZk7sCxbJ70lkckCmJ0S95FyJGnwXHmyaXTnWtmmV7S2
         1FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702632; x=1745307432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsVQGeXu3V43MLoNNqO2pG1nVJmJ/d9W3Z9XY8qBjRQ=;
        b=KANBlF+zEf4aqR02a1CTRPfjnXRM77H3VvWET46QgBHpsZU+I8XY5rjeP1LYbVbcMs
         VRA41mvVZWlGywJT4nEo2lyU/VtBpR+rkB3x6dq6CWdCIXSvOEmLIihRiLOmrAp/tw2+
         hy13G8LOfySFhIhkp8VZfL3tOEcR4WgBlkrArTznrkaefjAbZXuF58hHUT/cn+M67IMD
         MqqwNIPvd+X1OpdMiijJ7DFht09BntFP6dS7mzLqvP1GjdGp5odHdQzdvZ8FBn3pc5eT
         PopDggY5qnswNNcSJq7UGG1Y1QJ+0NuwIWbN0/9r2uOxrmHE0ZFyGWZ2ALzj5U5EYvwX
         dmRA==
X-Forwarded-Encrypted: i=1; AJvYcCVYvfVVRPfzdndf1wzIMDJli5O8RD4GsAqcfzD9V3bRhWdMYDhud73KkiXj+SAbyIxo5SQ5pIObRzDneJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEYpCQVX9BQJSTNd31Y+FEXc4CQTMKrFfMn9VI7aJNx6uqCzwP
	ShOwfy1qRgurVWWLc0g8XCpH5mnIguc4NrHWpYskZud5ZYTJQp7nqcdsp+cea3Q=
X-Gm-Gg: ASbGncu3WF/Aza42CAWFV3s4p2dqsETiIAltj+bsrQ0k8bToWCHuX0pOI/R0eGImaIo
	9xsI/5HxfSsGaotJEHB6kibsqLpC82DVk0w3Y0QSwW21tSvUUHsDfeSvyV3bDHHUFQDNlkQOtId
	7+grkP9NWm7h5LnbLLZ31G9H+2Wsa7nWPMe0KDu2vvgSOI7z4TNnreEeUrh/u6HC2jLvgmaBe/M
	q9OszxVaFQnPk1/MUs1nhG1+cRNe5L0sd2K/lDUwX+opCGCUbx7G5tlyOq5eK5dsu5JhVOhs+Rd
	8s/vWs94Bxo3RMXxvxtrmhE30t16hNZUuix+k/HzpFxkAWzr21u7IjTcJYDfwB+Yfoxwjh6BLeb
	7RKsYC7hovZbZ
X-Google-Smtp-Source: AGHT+IEDH5+1Xmf0reupNQ+IQwb15EhzTbOBuUQj6qx77GSEgchr+CYBO3//6JK5BRyM+UOoCkg5lg==
X-Received: by 2002:a05:600c:83c6:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43f3a7d6bf7mr153997135e9.0.1744702631853;
        Tue, 15 Apr 2025 00:37:11 -0700 (PDT)
Received: from archlinux (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm13425405f8f.17.2025.04.15.00.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:37:11 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:35:44 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the iio tree
Message-ID: <ghobrewcnnhzq7adqdsdmbvbmwkoyks3jck5hwv7dyir3m2xqs@tqnudkhd5n2b>
References: <20250415162841.5b9ddb79@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415162841.5b9ddb79@canb.auug.org.au>

Hi Stephen,

thanks, fixing that.

On 15.04.2025 16:28, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the iio tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> /home/sfr/next/next/Documentation/iio/ad3552r.rst:55: ERROR: Malformed table.
> 
> +-----------------------+------------------------------------------------------+
> | Debugfs device files  | Description                                          |
> +-----------------------+------------------------------------------------------+
> | data_source           | The used data source, as                             |
> |                       | ``normal``, ``ramp-16bit``, etc.                        |
> +-----------------------+------------------------------------------------------+
> | data_source_available | The available data sources.                          |
> +-----------------------+------------------------------------------------------+ [docutils]
> 
> Introduced by commit
> 
>   9a259b51e3ea ("docs: iio: add documentation for ad3552r driver")
> 
> -- 
> Cheers,
> Stephen Rothwell


Regards,
angelo
