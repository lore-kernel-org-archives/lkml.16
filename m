Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175097603F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744469123; cv=none; b=HUEOy3Yaau9seWdyvj8hTTR3gjMxNgNFhGst8kZcsHH93rsa2+b7a6KixVStjYS3yaPf6v36nzSPwQQXvLKCzElufoIXEiUub5KnmkJHw8hxnk7bemhi/9MeShI0OQkxW4kBxGHsFqOTFufJSHnX2bYKSgQHlXsRy/pEAdHSm7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744469123; c=relaxed/simple;
	bh=RN/j9DFZ+CO45Wo3mYYbAVag+7CjqaLHD8x49oYQI/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMIN2OuqIjSiJarXjSN1wdNhqGmwVJGehun7Smma8/Cr9K6FUs8WdNbU8LM4JdC/vz1FilBebRLP8+maRiMdh+5BDuH1oOI4LhE5gY5fXz4QWlyBzKREthhTqdgYGHTDxoV/q93KDdN8T8+6tNeRCvNlYVWitHCuDbRRyVyPrYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=kLJ3zGUa; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="kLJ3zGUa"
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 76312403E7
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 14:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744469113;
	bh=dMnte3bUYKtheIFCBih/uasbJjspqVJC5iPHCAuYEFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=kLJ3zGUav6Xz0PqrKaUWjBgVsbTgHFLFk4DMc8F5F5pnKLabnBfX5SPk4co+jPLLU
	 b84LoM3Jg4y/yoshn/DktMZ/OP364jv+D5a3O1BBLV2ZKaLMUtmSqGjYAbwJavyXCN
	 1dZrPVKBpmWBuG+EKt2r3X3iqlUYIuiqyUKm6eOv75JIUGsib4+1EL5nxz2p6ow7Kg
	 ZJVuhTXhIyyfIkja7+cs5WPJeolo+w2nKQALMg0VU7G5f6z9zIiu/+w0eNJ8RYJ09I
	 rnYQlKeLlEKlUicYw1QKl5huuNvjImYK1M28RyNto4v5+X+v+4pvS3MZJLGtweuMId
	 KlFqEzesTouhw==
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7375e2642b4so2140286b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744469111; x=1745073911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMnte3bUYKtheIFCBih/uasbJjspqVJC5iPHCAuYEFo=;
        b=V6yt6xG+kujG8TFsVS+STjCh0DdLym6cu4NcJ9IBx64Sop7gAczqXxZolowrbkualR
         rAdyrJziK2fOVUH5Uhh7wgg4AnEsd41G4a1XCh9MMMJxoHw9jxFk/aBTNsIMXmfnKTsA
         YQUFJfWrl+MfEbOfUNzuCTx54GHBF+qKilK5xaPK9aqw3l6Okd8Z/CYxckavftN4iS3H
         dvAUxzQ2cwzuA9U7qLzer1zUgHamvIX1YSByvEUNzDXMAxywL+87iqDwc1xINImf0bSp
         IwQUT9/VlhR+zzGj6YjXwRF0FjJqSy+U6Xrh09z8JXKZflsNt9tBEPVagnL8Mw1fGQUh
         oIHA==
X-Forwarded-Encrypted: i=1; AJvYcCVDp7j7lZyq+sRnX2Ef68rAwJcywGkryHdn08GnhR+Xxut0ACR9EJqZk+aRnC345J3cz3oiEbHHseugGoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo5zQxHfAHfMT/dNAkF+15k7T/uuA0EXalVqtPaDtsiuAdACvM
	vCcrOF3BA7sdh1fLUQ847Z7SNmGM/JSJBZx8fyo8lRNj7k0kYAf30p2/6kb4evDkXeXVQpUZpEA
	HxtqgsJCDWZTG4WGg6NyZ+txfRzmoXeGDsJhJAgWb/daEbOlVHOmYVeTpWOVQpMl+t1oh6C0gbt
	Wczg==
X-Gm-Gg: ASbGncuo8ey0BySTugdVpbqCzNYmbL50LpMpdCbZScI0YBt8auHU/LjfL71KHnztzRs
	24ZT2Rh7hPshM/u3CFNfomCCsQPyQB61Q+eIXq4p2SmRvhxIdkDFso3e66XdtNrqrEVv6D3zguK
	uNE2VrDIDWj3C95Ip2//sgabzJ03mg2fmEByrqWgOnkcz7+90tWvMEwpnqzm9RZtPcWiFLniaTa
	FLfGnrEMEO/3HveVYFzYBq2cv2FtBfof2EgI4n8kT/5zSzgRN+CwajmzJJVKEgnSdMuFCxoZ5Wt
	oU+QIDnMVEWt
X-Received: by 2002:a05:6a00:240d:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-73bd0ea5de9mr8269684b3a.0.1744469110624;
        Sat, 12 Apr 2025 07:45:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgs/5961Tp4ODI1uCtwmazIOwGScEXQjNWVM6D4BLHjUvb+kl0xxTjoourf6aP5pGbA4cGOA==
X-Received: by 2002:a05:6a00:240d:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-73bd0ea5de9mr8269656b3a.0.1744469110103;
        Sat, 12 Apr 2025 07:45:10 -0700 (PDT)
Received: from localhost ([240f:74:7be:1:3a1:1528:8601:c20c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3870sm3432688b3a.48.2025.04.12.07.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 07:45:09 -0700 (PDT)
Date: Sat, 12 Apr 2025 23:45:08 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] gpio: aggregator: Fix Smatch warnings
Message-ID: <52ap2hc6ii7hlk2zixxf455nens3rxtwvrrwhlv4ii5avpgmcq@lbrdov3ygay3>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744452787.git.dan.carpenter@linaro.org>

On Sat, Apr 12, 2025 at 01:14:53PM GMT, Dan Carpenter wrote:
> Fix some static checker warnings from Smatch:
> https://github.com/error27/smatch
> 
> Dan Carpenter (5):
>   gpio: aggregator: fix "_sysfs" prefix check in
>     gpio_aggregator_make_group()
>   gpio: aggregator: Fix gpio_aggregator_line_alloc() checking
>   gpio: aggregator: Return an error if there are no GPIOs in
>     gpio_aggregator_parse()
>   gpio: aggregator: Fix error code in gpio_aggregator_activate()
>   gpio: aggregator: Fix leak in gpio_aggregator_parse()
> 
>  drivers/gpio/gpio-aggregator.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)

Thank you very much for spotting these issues. I doubt myself for having
overlooked these.. And I had actually forgotten to run Smatch (it's really
amazing tool). I also tested the patched module by running kselftest
(gpio-aggregator.sh), with the addition of a new test case for the issue
that your first patch uncovered. I'll submit a patch to add it to selftest
later.

Acked-by: Koichiro Den <koichiro.den@canonical.com>

Thanks,
Koichiro Den

> 
> -- 
> 2.47.2
> 
