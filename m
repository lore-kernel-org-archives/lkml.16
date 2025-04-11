Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FCFB661
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744331424; cv=none; b=L/xNPAwaZT3t64q53gxKZe/vYOyw6+iH7yOL5ZWIFhBleARrVOROTOEEpGF8pIPedyrpOfWJ6jUsfe3M6HsdxX0lVT0o2MFon4pTCqvUBgPaDS6ZFX7mkJfjnb52/7QHyzu4iCxSDupTVkCvsjRYrYFENxCR9USRqEVmTOtSxb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744331424; c=relaxed/simple;
	bh=iCBIHlgYqBmRae+sv1JEgK6hpnqzk+F+c41u/4PRRSk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k7NGuVzSUZh8HAyZOc6UPJyYMUfJqVLoRx779xl2puqQJrGWbXl+MYPGRERipeOoXoqWseIc333JVrSwYzf/Lgce6EX97RP/qcAin6n7jQiW/MxzOZcOOAmLY2XgmntmbYmKDMA5cUR/Jl9HwNp+G8We6OFWa4ubhnCZPbpxEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Vz0rCi3K; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Vz0rCi3K"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-303a66af07eso1159046a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744331421; x=1744936221; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEj/TlILN37TPKrS4vVDvJow8Rh350Q5eqqNTt+HqJQ=;
        b=Vz0rCi3KjFp/uGhfKUxc3lTYusrqq9XTdoQLvG9waZT1/aiqpct5HdhhY+llKZLynx
         bTKPC6+l4u71ZNTO2Vn9dZsvXaBQt4kBKlcCY4L4DcoVUwLVw8R9tawuDSxzzWIjmKeK
         /+rRPJZs/P+LasovyIU+TXIYxJvWVBGO546hkDWf27CFYpfczqxPLmTrDTNjwX62nSDB
         UxaydnJULZQ8N4XJ8JOHzC6otQftEMjQ5NL8oTMLDWGBD9sMR7/5/Eeor96xrcd13jg5
         zQjbCqpWUKU5lTyHUJZvf3J5/n1FVr4/lXcPdAG5/ykzKC0vUIyQ9priBo3yhgh5I1AC
         289g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331421; x=1744936221;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LEj/TlILN37TPKrS4vVDvJow8Rh350Q5eqqNTt+HqJQ=;
        b=U+6i/AZ0lo6HvrtPdQhZ+/hDOJjNJb0HB+vjsW4vbvxRo8Q5yALU0LjYrr+V2IZHl2
         PWQFgbEV7tQn/GYoXj2xJxGNZF5t4PZTz0EiquDvLXVcPQWR7SNQ36qrhwill65Il8Ks
         TeBg/yqncv5S6MS0ILIVjarjuj00sIJ0lg6KG1GFHbuN3OquHHa2tGtnSGHI2uopkEda
         +GDecD+3X4EG4/uxtHaFIZhKi5/WLMWmniSYkDspmG2clNClZ6puvynCpIX4qRf4syA/
         5RduiBmWQ2GHcLu2O7ru3Odl/O4m5//suMOe+lgPBQ71uEdKw3bGV5/DLw5lPeKWp7KI
         V2cg==
X-Forwarded-Encrypted: i=1; AJvYcCXRBEsHu/Whb3jkz31l4osKuipD0YG8UGZHahy25LR5nYzvwFTuMt37tIvx1Ay7/RSwNVmRaNN6mANPeBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQkXQm5QIH6vX+7sAvdwWlaxniPKqcyHRyvoZSaGAachY/YWpN
	iwO+9SoluydHok7Htv9cxesHirOhef19D1CoXygcfVedYkDcKsKtOY6VXrImxnY=
X-Gm-Gg: ASbGncvNZ5R/y4kUdATGQ/2HB1cCvtL/8x/IwPvElHk8daL+Km6wfUULgD9DhUvTB6T
	xLHn6kSEq1lY7pu9xXpxJPNzRQS+N+X8inNo0TV14YeVj+VIkgxtkkmQ8GPXIFZmEO7O74waZL4
	heAjDULd8BV07FZEqAH9xPDN2RVJUiEHQZWZJFRNgR/pYHGt7xxF31WdI+hUtetORaYuk8s2ffn
	kgT7m3DQumXtV/uT6GXRHaux4fUWD/39f1F82LPpE/hiDZwdj2pqdULE1E+V/ayrcL3XLU7OuAj
	qpP4uF/MILcBc8l1B0wklNgo1ghhK/CIVOld1VA=
X-Google-Smtp-Source: AGHT+IHK+hZPSxDXu+yULAA+P8ggs/de/t3JfqukjQr3W1pHmgkXMe4iexgqgEe5uUDhbixl0eakvA==
X-Received: by 2002:a17:90b:388c:b0:2ff:5a9d:937f with SMTP id 98e67ed59e1d1-308237e1b7emr1466823a91.24.1744331421495;
        Thu, 10 Apr 2025 17:30:21 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e666sm4395562a91.15.2025.04.10.17.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:30:20 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Sukrut Bellary <sbellary@baylibre.com>, Russell King
 <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>,
 Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/4] PM: TI: AM335x: PM STANDBY fixes
In-Reply-To: <20250318230042.3138542-1-sbellary@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
Date: Thu, 10 Apr 2025 17:30:20 -0700
Message-ID: <7h34efy1yb.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sukrut Bellary <sbellary@baylibre.com> writes:

> This patch series fixes the Power management issues on TI's am335x soc.
>
> on AM335x, the wakeup doesn't work in the case of STANDBY.

This series is specifically targetted at the AM335x EVM (which I don't
have to test), so I'd appreciate getting any test reports for this
before I queue it up.

For AM335x, I currently only have the ICEv2 and Beaglebone Black,
neithor of which support suspend resume with RTC wake AFAICT.  If they
do, please enlighten me. :)

I was able to do a basic boot test on the 2 boards I have with this
series applied on top of v6.15-rc1 and basic boot still works, but I was
not able to test the PM path that's being changed here, so any tests on
AM3 platforms that actually use this path are appreciated.

Kevin
