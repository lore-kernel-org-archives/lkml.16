Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03E42E628
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 06:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748671967; cv=none; b=iMkGokIqLHLO/YXgM9KnGHoPClo2QjfWRuEVx+FzkV8kAcCwfwGF9UOaJigih2xm2TBmxup28ZpWSr2Jy0y74DUQdH+rVu/CGd3oGjmYjYGIoRuhXTuATfoLbhQrYeLNYlGHfo+GIXKX9VFR0Z9fe9leep1f+K1T7orqLQkN77s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748671967; c=relaxed/simple;
	bh=MEGvhQbfx24jqEUxzb4zffirI9T8WQoQbGUFkkAFR7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQuVVEpBsSnW3NT4OcRQdUx1JkR0SV72dZOhKvfKmMnHwB/FCuy6liyJXmWQtQPP8eus32Dn0VbQ++845r7eu6gDJzmGgLSfkzWllxEaMcEfo48XM6rUHYfT1OnNIxA+HFVbZFLBzxUJcB1/hNkh3iJl/MDLnnC9HZolD9PU6HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rde4H29J; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rde4H29J"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7399838db7fso2545529b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 23:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748671965; x=1749276765; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0xC9CFEE+YUx312k0/EiyveI/Q/YMtl8Jwd16dQuFXI=;
        b=rde4H29JXUZYkCwRkFh5YqmlKNfFikJlrTG0pImauIaN28Q/wO4BpvfqecpxTl7dsV
         gVtq+WsB4PLRbyk/5hVxBl7h00LnGZjJN+3RW9+Jb3HG8fbFF5PNi0fKP/FNjEqWHA4R
         0TxU5oNqF/m+IKkZJlH4v/TUpTKuEwlGnkG/WtAAbEedt3bChxh9TKKnnO3f4HSUs3Fw
         wCV/9RlkoIX0sj3kNzLaT52zGDxCGnDWXiDBGmSC4ehl2HO+jJ/oovYALztMWRyOvafz
         ZZEYCphEZDMwcSlIQnpbKV3SRP8nnYvnqzmg8Q/1qj8/lih8W1WI9evIPBTW9f8WryNf
         R6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748671965; x=1749276765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0xC9CFEE+YUx312k0/EiyveI/Q/YMtl8Jwd16dQuFXI=;
        b=pUatgwGWCh36VAh8f5CesUas0wlvvYHAHjxVSBB6UsYMjmKV4GIgo+GyXHiodkXbiJ
         iCnxJf+XyIJRLs49yRPWaXin/aOybTwoHZsFUYgke0LpyRSeok31YIdllrvqOX6kM2Py
         /Q19QgoajYI3AOzHQ1jHr+PHTeeacJORgrGQZyJIyEADdKQLt+j78AsQ/F5dgQFZ5733
         2O3zw0Q8FMq9QSzT61Z2dNh6n5NrmkyN+8rZIvTZ29rRuSeZiX6PeDca7JkLsDL4wBVX
         nBkiCerGBgHb5F4+zKCbZOLNdUjV7FoRv6F0rhdFlYL8erE4sixiIf7BN5VE52FOHp6B
         th3w==
X-Forwarded-Encrypted: i=1; AJvYcCVTo5XU/B5fwR7GuLEvwxDfQFDdBXpd05Ft8A7cdKrGdwF+8d90+MbfFfRef1Q+8fEBZliuUwBIjdqENGI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+SVpnV7Ba8Uq1vfZp3BYx/ryetA1ZlrRmYv/Em/Tqpn4duWHY
	6DNvHb5OeX3YdsswNyj76CiJz4Pd4EfeOpmwFGCAwx/J4d0wk9ENRm9o8tT7zzRHZH63MYamvJH
	nKo4=
X-Gm-Gg: ASbGncsYfeQ5p0La2qBHJToBbFLIPYy9tgAgCnbzWqk+BH90S8yYSkrMFgM+qbCDS/e
	YUwQxlvlj5y0PGtABrKHrn/BcorIUr4RW3Vm+uWZpZRtzaNdiN/n5mpKTK7knDO1XKT4Mxc93hi
	qJT4NLh93PNfISP4xD1y7SlIxfQO0tljKPD6pq0rSBZ3MjCiobvijtifVLDXLmq4nrGEc7nmLYI
	Z6vie1nmBw/JBgWWVD5Wly7S83j//C+G/hL6jZC8jw6l3FID0NWyCoUcOL6v+QkBoZQNsS8TqZI
	04iote4o1E2dsE7Cj7YvFg3vSOegDXVrqCFrGNJssH/xx5eQFLnRUPThriW/cT9droXxliB9
X-Google-Smtp-Source: AGHT+IE96H8U8bWE8z0seGlz+ce1VhCU9n8V1B9SIIp0uy/rKpHh593gOPlHdV8KFu0tdA5IB8EsVg==
X-Received: by 2002:a05:6a00:8b09:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-747ad757dc4mr9023047b3a.9.1748671965098;
        Fri, 30 May 2025 23:12:45 -0700 (PDT)
Received: from thinkpad ([120.56.204.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf4c5sm3950187b3a.124.2025.05.30.23.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:12:44 -0700 (PDT)
Date: Sat, 31 May 2025 11:42:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: shawn.lin@rock-chips.com, lpieralisi@kernel.org, kw@linux.com, 
	bhelgaas@google.com, heiko@sntech.de, robh@kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Fix interrupt log message
Message-ID: <hjckb2qsdz5atx5occqv7m6syg4fnilxhmn4zeq4y5yoqkmdjf@66gudl2chlgk>
References: <20250516145544.110516-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516145544.110516-1-18255117159@163.com>

On Fri, May 16, 2025 at 10:55:41PM +0800, Hans Zhang wrote:
> Dear Maintainers,
> 
> Detailed descriptions of interrupts can be seen from RK3399 TRM doc.
> I found two errors and cleaned up the driver by the way.
> 
> This patch series improves the logging accuracy and code cleanliness of
> the Rockchip PCIe host controller driver:
> 
> Log Message Clarifications
> 
> Patch 1 fixes a misleading debug message for the PCIE_CORE_INT_UCR
> interrupt, replacing a duplicated "malformed TLP" message with "Unexpected
> Completion" to reflect the actual error condition.
> 
> Patch 2 corrects the terminology for non-fatal errors, renaming "no fatal
> error" to "non fatal error interrupt received" to align with PCIe interrupt
> semantics.
> 
> Code Cleanup
> 
> Patch 3 removes redundant header includes (e.g., unused clock/reset
> headers) to streamline the driver and reduce build dependencies.
> 
> These changes enhance debug log reliability, eliminate ambiguity for
> developers.
> 

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes for v2:
> - Drop patch [v1 3/4].
> - The other patches have not been modified.
> ---
> 
> Hans Zhang (3):
>   PCI: rockchip-host: Fix "Unexpected Completion" log message
>   PCI: rockchip-host: Correct non-fatal error log message
>   PCI: rockchip-host: Remove unused header includes
> 
>  drivers/pci/controller/pcie-rockchip-host.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> 
> base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
