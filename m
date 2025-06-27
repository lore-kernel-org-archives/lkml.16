Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5E5202990;
	Fri, 27 Jun 2025 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030955; cv=none; b=eDfQFzdElGY+35cwiZt65n0VwAhrw0SeFXSSguOHKB49N3DYXSO8+0cHtFXRleSjCX+92eFXu7qYEb9Fhd1lyoIOBMPnIs0ByuHavMPHgRkNB3cJvIDOVN4qvNpj5hoykv0cwzEGA4rDVSQX+sYXclDZHTNeU+jsyGd5HEA/HAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030955; c=relaxed/simple;
	bh=Sf3z4Z3YSErVATpkFjcBSQwGR+7B5L6SxIjFmpyGInI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoLdP02XOXxNI6CvDBRqv3tpwyzwjxjZN3cHR21op8zpu/toqbTfOjoFt+quzlOuiZXjpfigiVl90QHnXnIdFdiEOjoL32xzpBiAW/AV5tRPEG5d3f/SgaO/1GysvyemlXpB8VqvsUkkYiSigrstm+wjfLjLqscS1R2Lv5fNzSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIcRq1qU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIcRq1qU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235a3dd4f0dso15291775ad.0;
        Fri, 27 Jun 2025 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751030953; x=1751635753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFMEuYCNEgcY34odUiO9pyd51hCxEH9myx3SJQBjnHY=;
        b=gIcRq1qUITAyUH99i/OwXY0DADuIdGFXBjvazQSBqsHZcXfTARYoqdgV8bnzbaFNzY
         GtGqi2zqGmMCqWlyzRVCzuHLdQfPiOJyTi89QBiUyNiIjF+r9n+UfT7Vi3k7W7Hl/3rH
         j8j/I1pPcf4x8RxZ/4Jk+2dfOaCam12kCtJN9wf04pD5GSyEOJRgCCoSHsmJG7Rr1tpR
         F13t7UXjX30Q90ReGlDTt0kL/Wz0tQWLjLVNUwz05cpljh5htu2AucuCsRb7Hu3X25GN
         qDcnU4PFtjFq95xYDANp44f/Tzxcft2X87skyeXOgGIl4/N38av+y8oS6lUPqEaf4PH3
         cmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030953; x=1751635753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFMEuYCNEgcY34odUiO9pyd51hCxEH9myx3SJQBjnHY=;
        b=sL45Gi67l20KEqrYqYPcQ1NJ1KDsdSoXJXVCsfgGSr/wcg7rySdLcMZtOq1jegYgrc
         c2VaxjcMaZqq8wQatGPxiJmVAR672sZsz/ToG6a9aqQ7yfBJWuEgnKyleImBqcuYnnrZ
         exK6JlKGjE5RzT04Hj64nJR3jG+ybFwv4C6xanFjwxqvilgbcBFYkJko9KWbpAuoJ6fU
         VJ96v3sOLu60JieqkVlnCyBXAP4y7i8J7mfpAJRYUT7ICVaodhV6FqpkC5ygpu8rN882
         +2bLztr0kRFhSatZyC/RtOnIwP/1sVicaCG78hfP3pj4CzGCM4Uz3FWvNmOh9Vp8jcPT
         KpOw==
X-Forwarded-Encrypted: i=1; AJvYcCVA1oLLxwlqpnYMUTSLqyKo516THiRjeu6Qp+e2LcHdraGQNEdt5t0NszJQD596oS0eJ62tDNtZ6M1hh/bh8mfKvyVE+Q==@vger.kernel.org, AJvYcCW3v92dHPGp3LYn7V1k+az6KQvdiCRKwF0YPuetIhsKDs9YG2kgKDugwGAemnlsF2Vq9hZRdFuh7sr46doB@vger.kernel.org, AJvYcCXRAfCTzl6H8OlrveuhCPEaC29zTXXgLrxStAbClRsHVc9xnhAprBuV5bE3k6FNrY5E0VQLeL3LWC2feg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLiMwy9JpUUPa4h1Jw7knf4X9ITiRQNh141VfptfOXKNmaYB+o
	1AN1CWdqQvPhLFoSFwFUcYiwJ2hmXpMuM+Xeq6caEEvZzJ8gYVVgxyii
X-Gm-Gg: ASbGncvTjnjpL3s4ybQx95srWQzKtJsttR7kUPr1Oo5w/7JwSpZ69jc5Z3ro8VYXOB5
	4LXKlOOhkZapaNhpFJLvHsFwaByYJHGnerv9OGq2fw70hwSOI1HzBAzl3Go6wTBne4xFxwl8LAd
	o3lLQwhBLOcQTWRfkj+Y/pNiElWoQsawGhbo0Y63AvPMBzxwq3EQOjoTKoIJR9tqYKDjhwjxNlr
	0+MbEidWX/xd18owrhVGjOml8iCZRD5GaEMTevD5G+S9aEtRxC4VhFuooGXlyEix+pyiFI4OrjO
	4w8KY2pU1KovR5zAC87x4jHP0bZeDm2t+2S7BzfzjOmaDCdAmjgYaoiFb6CIJZiySYWUWTwPQ+g
	=
X-Google-Smtp-Source: AGHT+IHEMPY8AecElt0T9o3PCNRn2HNCuWgtsMI4KQah9RtnOoLyMfEbIzF+Q+sRuq8j3DbBSWaYxA==
X-Received: by 2002:a17:902:e5c9:b0:234:9656:7db9 with SMTP id d9443c01a7336-23ac4633b92mr53853725ad.32.1751030952703;
        Fri, 27 Jun 2025 06:29:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f0b91sm18025605ad.53.2025.06.27.06.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:29:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 27 Jun 2025 06:28:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: jesse huang <jesse.huang@portwell.com.tw>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: portwell-ec: Add hwmon support for
 voltage and temperature
Message-ID: <a25733d7-535c-44b8-973c-0bc0c99047c3@roeck-us.net>
References: <a35d63e1-424f-48ac-bc97-cdb48929f40d@portwell.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a35d63e1-424f-48ac-bc97-cdb48929f40d@portwell.com.tw>

On Fri, Jun 27, 2025 at 05:15:01PM +0800, jesse huang wrote:
> Integrates Vcore, VDIMM, 3.3V, 5V, 12V voltage and system temperature
> monitoring into the driver via the hwmon subsystem, enabling
> standardized reporting via tools like lm-sensors.
> 
> Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
> ---
>  drivers/platform/x86/portwell-ec.c | 188 ++++++++++++++++++++++++++++-
>  1 file changed, 186 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
> index a68522aaa3fa..79597b4b5559 100644
> --- a/drivers/platform/x86/portwell-ec.c
> +++ b/drivers/platform/x86/portwell-ec.c
> @@ -33,6 +33,10 @@
>  #include <linux/sizes.h>
>  #include <linux/string.h>
>  #include <linux/watchdog.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/hwmon-vid.h>

Two unnecessary include files.

Guenter
