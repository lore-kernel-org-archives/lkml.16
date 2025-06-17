Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381D22DBF77
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160373; cv=none; b=DlZ9uqsg1xhNv2aNEsPMnad7s+EQzY7408+1Y/wHypiuC1kX6PoegNkmUDWyP20wmuGmkWYebrlinWhA/NIyigDg5qyGKjyfDDDCIPuJel62HxcBXgdIel79Houcspk7PqtUdQmC6yM9zs72XiNYgealeo7UMZpMPy6908mE248=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160373; c=relaxed/simple;
	bh=aHr7ZCdGKdUx/X7yilpI5xZxQAjoyhpSsv3WDHso6bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YA9h6gES3pQMCFhLi8mpSGP99ZxyHuDIgGi3/jySgIl/3NcyIl3lUZThA4MUD+tW6BRj6U0Z6+A4/GITHs/Um7ncEJIkXPA8g6r+CZsjv0eBUoxxPa4zgiXIMBEnPPKfxULJ8Vr2E0tZ4js5tTB8a6XFsV+5R4bcONrhD3MxyuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=EMzwUgfQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="EMzwUgfQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4533a53a6efso3022925e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750160369; x=1750765169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qW4YqwwFCuMF0+LE9SQ/jZp97dNuLzD63AryOXprXzU=;
        b=EMzwUgfQX4QMWHQaKAuDD5V8bV5GKVqpIELS5P0Z03FYqoIIrpx8mjkHYdjMEWtF1H
         3GYgI8isV6Dzm5ew36UxUXO9KsXd0ZJP9Eo6B+Y2ptWnyCnS22n/l4hH2Kz/WkzTa3KW
         xTT3vrqsDN+5LhiAqZ0LcKW8HFfr3M73fCSc7UucM0H1cEC+vqhdpodlmiMeL2KZtScV
         U2+ejePl/o9dFt1+OZWxFNShsqltdJqiFcJPKEFOC44Gx1vYBFnhrrd1QsaNFldRKaug
         RqEwMGqmtE4b3UL/BuPMjbc/pEi6Spi6WVJ12dd3LvFJLu40KD2L9DLkeL8JTdEgdF5V
         4cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750160369; x=1750765169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qW4YqwwFCuMF0+LE9SQ/jZp97dNuLzD63AryOXprXzU=;
        b=ebzcm5mexg0hVtBUKqkISMQKItLHxXvh1VzoHlgui69pwAXL6IRSyGVkL3F/JsTWmb
         QBDNfSTZEEa23/wevBiKyCGz8cdZ773/qbmzJ17wN0OyvE3T8v62KGGlFa3tE9PVXafw
         IaOr7C7HShX1ksCD8Q1OMpPCtx5HVqhKkAMvn85Zd/H2Eu3+0D+OrPVI92nLDJVWfmgd
         F7S6b8O0XwVuHcJ0Zm1cBF4lfVdQGtO8pi3HBlc/H/IsBA8NUWVb10msiC/i/yWibGYF
         h37sZvHZL+RyWrfVVmPTTtQZFcdOUiT6MS9FPwgSUcx9WE+AI6CFWDpuE2jsOhvhrco0
         /Gdw==
X-Forwarded-Encrypted: i=1; AJvYcCXGASpj+7tPdWD2c7Rnp9BqBYrPCjlGVEWdnEyAE5tYFSlfchTc4BF6wI1bPyMn6EFLyPrAyBEnDI0gHJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+7nzwEvWNldXizQod2YEiBNnfnN8sa3y4DXhqeGAhBS7HcPPq
	xsinX/4KdSkHPHCxo+KRNjXGLUlZEHKb7asNENRBz7l5vDiuhDaNOGMZUzy3RH/sYw==
X-Gm-Gg: ASbGncuNbWGdmDcmkM6iwRDxrUcpwa/7c4iu1xAVdOCC4g5vB9RbrWsLLrcNj742c3N
	B162qdZ59PmaACkEx0Yn+tRW3jEiJGfvJB6DcGeZVzGCTpSu9WL10kqdWr6ENd5LrosxaEqYKUY
	p60yKhMFnPrmR/5lJvvTm8X+I2z3Th3Qv2729wSE4t5C1Y8qCGduViUzm2WBHgVL94Pm7Ynzo1L
	YH2mWweiXCnhX2T1biHlw7z+wzPhWzpuiwLkwNvCeKc/pxe018fxH3H66VFgncZJMdEV/R6o3zA
	cwwFShuLN0G2TDvrakw4JJIAo/6fm7Id/2+PppHz7RGFc8WvM+HVjnek4yIfYMxKGQVhiNI9fFm
	vF2ExOGkUIv+BSYqZdWuePyabUFRhhX9tHteQVCI5UQ==
X-Google-Smtp-Source: AGHT+IEUvDRURTMB/hVyl5/+Dq/7PwoqgbYAYF8XZZB0DJfGgwJu+ruqrz8OL2hC2gyw87LK8X5+3Q==
X-Received: by 2002:a05:600c:1549:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-4533c97c5eamr119451035e9.16.1750160369154;
        Tue, 17 Jun 2025 04:39:29 -0700 (PDT)
Received: from cyber-t14sg4 (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25302dsm167878505e9.26.2025.06.17.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 04:39:28 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:39:26 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aFFT7g8w4kTJZ-1w@cyber-t14sg4>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>
 <aEtW3e7mwjTTvfO9@google.com>
 <aE1yNZ484DcWjR4h@cyber-t14sg4>
 <aFBdfckccRv7Pbc6@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFBdfckccRv7Pbc6@google.com>

On Mon, Jun 16, 2025 at 11:07:57AM -0700, Brian Norris wrote:
> I must have either misread or misremembered checkpatch's behavior.
> Possibly both. It has various other delay-realted warnings that point
> you at the kerneldoc comments for mdelay() and msleep() though, and the
> mdelay() comments say:
> 
>  * Please double check, whether mdelay() is the right way to go or whether a
>  * refactoring of the code is the better variant to be able to use msleep()
>  * instead.

Okay, will check if msleep() has the same effects in case SMI takes too
long.

Best,
Michal
