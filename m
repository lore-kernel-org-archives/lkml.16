Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E072E62D2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743716072; cv=none; b=S+wnhxqpGc0TCOd+goVEy7iguqZVTk5HmADMB+f+dQkDkHfOype+oYUM6K4N0EujHs69fLo48UeGapJlPf+hJKpqdXNwkWiNDhidV3q6Ds7M1s9MmXoRT6Gokp+RU6lJaB4VvBcuWDRN3HLKXk1p4dMc/dDhOviBjkpxG0tHVHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743716072; c=relaxed/simple;
	bh=S4xOHUvTrdN4UAFtU13IabwlJJ0FDWHbVE3UClOHRSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BiM56TkEYhlKGx5tM+TBA2Hlm37gLlSw2gLMf73FMFNsB1d9kB12WLaR63WpUmod11t+vOcRpqIA1TSI6GiiGtX/q6ydq90uWW7KBZK1PjgkBjq5wgk9BqVstW1cei3Fhl5a+sCcF7rvqlls8K9OuhaVqd8J9+592ZrmbVa0sec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cpkP1ptk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cpkP1ptk"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b1095625dso1564781e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 14:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743716069; x=1744320869; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S4xOHUvTrdN4UAFtU13IabwlJJ0FDWHbVE3UClOHRSA=;
        b=cpkP1ptkvl3je+hkSL3EFUMiGjdaV8MMXWsWKZ8f1XrRy4eqDAaOGC92l+XPIxXAV5
         Zg6A+aHMBoEBWkfafXaSDzMu7Cdf+tSBC9Tzqm0ZsG6aPJzH5rDvPLaX9Cowezfj/GVE
         +QWxfufQHvNyFRcfr518kzpQdVck+swG/h49Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743716069; x=1744320869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4xOHUvTrdN4UAFtU13IabwlJJ0FDWHbVE3UClOHRSA=;
        b=IpdzQyULmvsi0Aelo1WmUYx6qNdG0FudOYF957USBAP8ajprVa7znG3/2ux0adr8ST
         zaI6j37AlYoedp50lRLkjO9Z8Nfzq8JDRcw07ZjvgKVt/OQaOC854z5mP4oE0Jmx5auV
         RW/M/aI+xudHreO9W7Dd0LippPfZa5mnf2fDPTLab9LDMqhDILz+RnfsRbLVdLyedc8g
         v7b+4K61UokIzZCpR43u67mU2DuwuTGOnnpTavE27pTSzk3D0Ul4ZeMfBlkiDkDDuHqE
         kXzQteOkVDRY33LHLD/DToTuhTPTu7VktGLjIVgTaZquI7dnr9bWM4NzJNPdHcZy274k
         5Zaw==
X-Forwarded-Encrypted: i=1; AJvYcCUT2IucIqM6kRiq0zsz1rMSQ30PkM9IyCOaiB0n22EH3Dec6EPzk0JOSWeODasYK/qPEL8JaDjZ8PXbmVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3eE63Fa8qaKFHz4B0n3Im5J4MbQVo477SjBrJNJMFaJWLPTAp
	yeiIZjHj3JiEA6udnl7Z+1aheNQCg33kgp3L2iFrN6J7+s4Q7A6Qy7r5GgSTr9VpkNi7ZwMfPMQ
	=
X-Gm-Gg: ASbGncuw158lz7SYaQfflrg8KLVjHyOynMQKMqdypdArKobyotYNGWUMHXVXHaA6mPO
	tjkgKmae1QhdJ9VR8H7R7ipuR/ifj4fweuCx9LQvmAJ99pDDEzvkN3aMrz37rKkGN+XpUAf/U63
	hJ/5B1Tw7T5xfvoH4fDNcMA6CH6OUbo7eRLHd40QyS3CrvErUFfgxpif5dDJtTpGQBlbp446pwK
	FY7EdmhdWpWC0M9tq1cDVx7wV7bHBruSGP14Y7ARkk96wXiiji5MRr3ErbCLIY4WtO1RyftB8hl
	1Qx2LCAjjtI6Vza9xK68qvkcShQc7isnYCGvP3GywprlcriRZppwD+1nmsuFqqg6/Tj+OiE3Lhu
	oB59AsSG2yKY=
X-Google-Smtp-Source: AGHT+IFU0k3IzISVUo06oOOKSHsM86n2EDnVqeSH6W5Yr63Qv+gL2+9yWUClgZAuM+Ie9UNA1vcWBw==
X-Received: by 2002:a05:6512:250e:b0:549:8f10:ec25 with SMTP id 2adb3069b0e04-54c227936a6mr255856e87.31.1743716068752;
        Thu, 03 Apr 2025 14:34:28 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5c1a7csm259812e87.70.2025.04.03.14.34.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 14:34:28 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30db2c2c609so13344881fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 14:34:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwCClu1Pdlt4jlYNFeC9Ot2jAfLPlpOTYI837rCU7jzCWMZs/GF8UUUhasm/2K6R2Z3LaQa7bVfsxChe8=@vger.kernel.org
X-Received: by 2002:a05:651c:1462:b0:30b:ecfc:78bf with SMTP id
 38308e7fff4ca-30f0a0ee873mr3537031fa.5.1743716067767; Thu, 03 Apr 2025
 14:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
In-Reply-To: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 3 Apr 2025 23:34:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCtfcMBMj3=_gWrMd3P1Bt19uZaWs1TYQ+ZPHo5amPi+TA@mail.gmail.com>
X-Gm-Features: AQ5f1Jp44cpho2HZoqYs98yU34zsj91j3YamQrEDzu0jI4mmrlYDU1XofOCGpq4
Message-ID: <CANiDSCtfcMBMj3=_gWrMd3P1Bt19uZaWs1TYQ+ZPHo5amPi+TA@mail.gmail.com>
Subject: Re: [PATCH] scripts/spdxcheck: Limit the scope of git.Repo
To: Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-spdx@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Friendly ping
