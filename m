Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A7A3234;
	Mon, 31 Mar 2025 13:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743429237; cv=none; b=KNI+N09gM1at+VBezczXYIed90FhsQSBqXX26qyqO5x0XXCxQhvjEcoFZ8GvdsvcxuoOCtZc8mVZwTmOUAsvJrtg1qHqTLZ7cVQmKZuhdHHcbhlIVspIuvxRuBN2BR0QyIpIAlNUDexhNiFlKew92QYuqe8994/k9rkECA0TcIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743429237; c=relaxed/simple;
	bh=MAGde/gLHqP46941W5IjghCAIs6wN6k2CkmOrzCyHfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uH89/2qM+J/fh/TXnRfsX4+kICHoFVmA5RR2zSz8vHbAJRc7xIo7B4n1Wmhv8U2Sm8kyY6BFh1kExZs3XmazA3ywhBAxPTCbc3h3dIykJs0FeVVd3ppIMl+FCkqd3YSk783ZQLvq7mq1ujZFRlL+h5ux+Y1SA2zAm3fsWHokTiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6oUjz2R; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6oUjz2R"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22548a28d0cso120944965ad.3;
        Mon, 31 Mar 2025 06:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743429235; x=1744034035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b94A8J4BUZIwySiWtjCkfYMGg+GgV97xGWXLM46F1Qg=;
        b=L6oUjz2R/2i8s9g2RAT8jDSZdmBDXrn/vG8BMIjMxvg5ppFRuISrmNYN2WigyM0wDR
         RxfZqi9H038RPEX9wD54nXp71yC1H1cAzbZfG6YM+TfgALmJ6q1++sA8VxvI8PHh0fK+
         utlDwH4goJMsXDuNOEL8KOn5bsLWOAkm44CKQU0PjzCVqXzf8TfeHzNpJ4Fz6B4gIenw
         rnEx+ZsHXTXEpmeAeqGPYgl8sfow3HN7P6TMVvpzbcDsjTsX76Zeg3QFBQvCPyUGbTSo
         U9d19CvOU7t+fjaixb/Nda1irTFnWfhKzBJxZkWIIUA+vTMP53dO4E59cEGoiFTK1Mzq
         hQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743429235; x=1744034035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b94A8J4BUZIwySiWtjCkfYMGg+GgV97xGWXLM46F1Qg=;
        b=AzUXdTbUt2b3P8mERa74ta0Y7NMhCBldfnHUBx52JT8dXlLuwPRalwzolkx9iF6czW
         IxG3nMeBHGf+HC9VoQgU+JA5uCY0O3SoyUPG/Ir83j8NU9dZhBO6dJtzStg2IqIOuiFS
         k0AGkIdoTnq9+3QPc1XhuqZD5bS0UMEMy1PxYMk1uPtR6vx0irqWp/NxDnyzwaStsqEH
         2NajAPhJW0+N01oGSY/f5EpX+cTAcYBiRvRs1hTNgIdkJ74Wrh8rccwUKPyC4InNwPzQ
         IvzeQcNx99I5PpIWouS1GaRUKXspynYMfzqbiphQEDrexP5lHcyBSw2MGmro8fK9sowl
         t5sg==
X-Forwarded-Encrypted: i=1; AJvYcCUja09iZ0KTJkFLLsgbY5o8Z27vUAbD7AmRuFRnWTlxik1Pz9goKtp7LQoxB0wvBpn7010eUYTFnkyUNw==@vger.kernel.org, AJvYcCW3A0IY/jQJciEKpssQG5FyXx3ywJoch6MxKIBZB1bGQnMNkC7iuyomIPj4J6efGnAys/fvI3eYtf/DDfOo@vger.kernel.org
X-Gm-Message-State: AOJu0YwNKfdd8zCq8ns1QRAjHrncRynsZdYtvykXWxwntQNrxBltadTI
	hglvQnM1jXZaPCU3zqn2tjpGcGhj5LLUrC7e0gh/LxR/h0B7MBXc1H9A+g==
X-Gm-Gg: ASbGnctInK7kmdj4aVYKmqgHABuPvUn0l+DRkN0rzhMptTuRMDK814WbodH+N6yTbgL
	oN54rjwsH7Gi0Vdj9h/p1D0doZ5UdqlXF0Eq36dKLT3Tkhh+zVOeL3FM07m9pwblMc/9yrbNCMd
	E7d7L6c8DYyPbuk3z8T8If+g7dqlQtsWF/daBXmCeMCHLlsBZ3LYK72H13b1cI7nrXTD3+uFUVE
	Wz3li5NeO7Sn0vCjtKghYcSB7uDPfEpHywbVo/gEz+jS8mhpTtPxa6azhSCGj1Dh57mwX+2Loko
	/+h0eSGi3NwevuH3pF/pnQR/516vOx6LPtfmRV7Jdx03ShXi+M3KSg+r/GzWY17buSp0
X-Google-Smtp-Source: AGHT+IEuWBiH+tG90Xz0uBCbm9y+YDhdCNCLfau/b6BDOrjX0QJGTCcSPBvd98sUgG5nqi6Ng92Ovg==
X-Received: by 2002:a17:902:f709:b0:215:6e01:ad07 with SMTP id d9443c01a7336-2292f94a1aamr119231375ad.6.1743429235098;
        Mon, 31 Mar 2025 06:53:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eeca20esm69178445ad.51.2025.03.31.06.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 06:53:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 31 Mar 2025 06:53:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 1/1] hwmon: (qnap-mcu) Remove (explicitly) unused
 header
Message-ID: <c4b467ec-471f-4cf8-9666-17db6284d26b@roeck-us.net>
References: <20250331070600.3985850-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331070600.3985850-1-andriy.shevchenko@linux.intel.com>

On Mon, Mar 31, 2025 at 10:06:00AM +0300, Andy Shevchenko wrote:
> The fwnode.h is not supposed to be used by the drivers as it
> has the definitions for the core parts for different device
> property provider implementations. Drop it.
> 
> Note, that fwnode API for drivers is provided in property.h
> which is included here.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/qnap-mcu-hwmon.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwmon/qnap-mcu-hwmon.c b/drivers/hwmon/qnap-mcu-hwmon.c
> index 29057514739c..e86e64c4d391 100644
> --- a/drivers/hwmon/qnap-mcu-hwmon.c
> +++ b/drivers/hwmon/qnap-mcu-hwmon.c
> @@ -6,7 +6,6 @@
>   * Copyright (C) 2024 Heiko Stuebner <heiko@sntech.de>
>   */
>  
> -#include <linux/fwnode.h>
>  #include <linux/hwmon.h>
>  #include <linux/mfd/qnap-mcu.h>
>  #include <linux/module.h>
