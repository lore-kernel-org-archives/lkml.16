Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFC928688A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650929; cv=none; b=NeVWBEjAqEGZTjJhZP+e9eEo7y8g31qxE2uI3nDY0nzC85XPeE2O8NosTbUFpS8qW9t3R/0xuEkcmjhg7QOTZ0P4S5VHnOwGwoUOYQFE4l0EH8XL4fhPvqDu77OPjJes8vBXmh+D1xgpr/9Diay5X4DOvnLKyMc/LH9a/3x/W+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650929; c=relaxed/simple;
	bh=BiUBiEP4mtMU0sgm8Ro7YfKxN/VojxVwmdYi69ZqhB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ct17xuINHCIpftsNgYM1k/pjs7EwK+C5UiW5Yhc7fByuz1ejkRHkyA3EICp9AxeIoDqAp1Cct0iBUJ9hJ9cAooi9XZ66KHcsrvq8CVP6vFqglCJYBM1G6ZFl10tPgBymBdXN4TMe4pcLNzwQBRyA0y1GiYIJkMyRBMyyBdYVg7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=t2GrVpYr; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="t2GrVpYr"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d0976776dcso616925785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749650927; x=1750255727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2mkrF7hMJ7XIqcp+rcg2pb5auO8TVNGaEQdRmstp3lk=;
        b=t2GrVpYrL+oG/AaxHYWVqZpUoYpSODEy3FSRfj/C8/nWn2UNlA28M1vafv3hocpPpu
         seDv1piMkGh6MQ5KDtPmdKPrjCbP1qsiGB+PpbT27uiG8LSeBgmFYErT88g3up6ruDvW
         QB3wgxg7ZzeVh+ZxK/YtXkFHOn5fsDmLc1oB3nijB4n2w64aF9Gr2QZb0A3PxUiAGOOs
         r41LkQgD1hekQk2gWqQzRcTH87ZJZBM1i+r/zkZATU9VENy6QC8hf0SKU3HGMy3qxeX8
         xU6oiksUZXU8lkMmUneNPnzgMfF4/QS1/V7HA5hBZ8s8FO8y/wQKv8cyuwTTN11Dz0D6
         qcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650927; x=1750255727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mkrF7hMJ7XIqcp+rcg2pb5auO8TVNGaEQdRmstp3lk=;
        b=lEzwmmtKl7YDVOU8N5GCoLwDkQVLCZO3BZoJ1HJmmVGS5Vyn7EZ4TdSUdXfptas5Va
         YiGr9eRPwcZBwlNRKX5iS6gjWf6o3orWH6+D0voPXyExk0LnJWVOXCXUW0qaVZd4Zp5d
         mnwd8HmDhFzjGZIr2XrjHAVbjXUSAjki6RVnow9mTDQJL1pi+onVI/XBAJkvedO+n79a
         T31X75/6/hJuOtlLz7kHtSAHiDLxvAIp0yRklYVZvYMbWxlec1rj5xFzP0MnVTKGJNUM
         RCm50+ZGOxEhnWEbzHyhd83Z7DeZ4qAlBn2wuoiDx/1Xb1FjJzbb9bZDC8cIDzXnfcZc
         Pqhg==
X-Forwarded-Encrypted: i=1; AJvYcCV+LfG0d9hAZN3U4esRze3hINaSfP++qu5ZM7kN+vUy0vYQixHxA2n51cNxTFkeFkejmy4fRuZswV1GzcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYuUUvQbP1LsHeEO22dUSdwyrV0Y3sFHajMCEsw3UsXQ6VLTIS
	BToUyHEuVeIR5z8GeUC2Beks0AdLGPSS7phK488DHx9BvYYN6M4zQcQ8+oEsDa9r5A==
X-Gm-Gg: ASbGncvM3M2pKr9jeZGDKnPmUVP3aREfsYsqVKhmjpBisRRF3v9HH7zLXYT0u8uHWV+
	U4OgNVg7Gap8YbNShjddj//N+e+EaCzS5fXUT7RDXrnBWBONCIfgHS9w6UmsGiNtDVUt733jLo1
	v8IKvRbOv4gYoxbpESds995kumn96nIuQOvspehl5rdp6rauA3dbo7yd//Z0s0XPFSfMgmuPjOK
	CjEm7X/0eXM3DycuYjKx9YX9PBTcwNpAHbdC4e5U1FvvDeS4tZrJpTFNiz3XvzVqO25rS/kkhdy
	Vw+jCKZuen1ggIhSAMNzhU5n38vuE80nk3uMiQF1FQehO2SjCDEw3UkXqE7BFIUD1m6K3HKxOVW
	sHDGC
X-Google-Smtp-Source: AGHT+IFSaTTLDfYx+UWWlDovaDt70hJSIR1Xh3wlmjJQPRnGgcY8c3QuDCpwsHT6wqBwpIU2/viMsA==
X-Received: by 2002:a05:620a:f05:b0:7ca:f447:c676 with SMTP id af79cd13be357-7d3a887d47cmr524768785a.43.1749650924532;
        Wed, 11 Jun 2025 07:08:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25170613csm865441585a.6.2025.06.11.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:08:43 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:08:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-at91: Use dynamic device name for OHCI HCD
 creation
Message-ID: <afaf4c79-ccec-46ad-889c-e8347454c065@rowland.harvard.edu>
References: <20250611075414.4239-2-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611075414.4239-2-mihai.sain@microchip.com>

On Wed, Jun 11, 2025 at 10:54:15AM +0300, Mihai Sain wrote:
> Use the dynamic device name instead of the hardcoded string "at91"
> when creating the OHCI host controller driver.
> This ensures that the device name is more flexible
> and correctly reflects the actual device in the system.
> This will be in sync with ehci at91 driver.
> 
> [root@sam9x75eb ~]$ dmesg | grep usb
> [    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc1 ehci_hcd
> [    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
> [    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc1 ohci_hcd
> [    1.601406] usb usb2: SerialNumber: 600000.usb-ohci
> 
> [root@sam9x75eb ~]$ cat /proc/iomem | grep usb
> 00600000-006fffff : 600000.usb-ohci usb-ohci@600000
> 00700000-007fffff : 700000.usb-ehci usb-ehci@700000

Are these two outputs supposed to make some sort of point?  It would be 
better to have a before-and-after comparison, so we can see what the 
effect of the patch is.

Alan Stern
