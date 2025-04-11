Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D8A36D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744331942; cv=none; b=W0Fiar7rZ6W+MzfprdfCrAQdrTPQBcB0eLNnEL3xJMrS6Y+PtPi1Cyr7vpnly3ZN51EQjGyHSEwF23RT/Um9v7wX/vOdXGWe/WLBxHoUIp6vryvwXHiC+dW9XhdaiVaZAo3wb3Gz7RGMT8pLFMHy7M/XDxN2hNY4QaRFYlDnajg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744331942; c=relaxed/simple;
	bh=+5YsoHQ8CSMxUeDudniraau5fmGGTFuPzw0XxUxa5Sw=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=slFUy3ylHpN2MPdqt/YbmEbjfbYvMnlhDEPgqKUQMWhwCwbQ4cKa5USD2QJbfaWn3Kv9DXOXTN+89aY6zwn5Rm+t2nVLxIcyjQyPpaTHI01AXwmDU/XIjaL7PaYCTT3Cs/jS+emhI0o8oDG97FG6c6YtRDPTZ9ccDMBLPTV2tY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zbcrWb36; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zbcrWb36"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7369ce5d323so1272751b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744331940; x=1744936740; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5YsoHQ8CSMxUeDudniraau5fmGGTFuPzw0XxUxa5Sw=;
        b=zbcrWb36cOskvr/Uzp6OZmRd1No8pPYrsWD5NUFet671YZrG5nbONkJvmcupPK4VYA
         hxBQFstZuFiMNnq1JQUF1FWSiS+8V7rnBPwH3JrTed2A2/9xOoxN9xJqm1HqV3tV3LyQ
         pYv2yboDCJw76Wxa7BJDyvsPE1ty5zuJNgBHAdhsEwxK9VqHiGEFvRafzZLjTkHjYB/b
         Q+OFHOXv3C+Q7V/UPtr2XZJzzsad9OiHbPdsjba9FCdYqgbWQAZTC/tTkHSbZ115Gm2C
         AzPY7uYaW5T/+Fs7J5zQuACzpJYz//oqYOTERDnybBRN/ErhkP0bt5mZ0qHDTi1BOSRf
         mITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331940; x=1744936740;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5YsoHQ8CSMxUeDudniraau5fmGGTFuPzw0XxUxa5Sw=;
        b=C5fi09REtMiVVN3voZmeRw5iJIZ7OCR++FrcAglxfPMbTQJ3Kr1I0gup6G430rgnB0
         sT9sS4P7SX2CVmnAdFSpl6+SDouHxkXrAy4nuunx0T2wueV0csSyG4rBB7T7CbO2Nqo8
         8syKELCxyYsGD6D5WUcrEHPttUQJit0Asc9QoWLZ7A5KruxCGk1zEz8ls2/ijZn8BX8W
         Ct2Vo9mhyaC4PdzTh/HeNbh7z5MIwi7GJcoqRr6STnUiTC8MvX5CUYZ1wHbt2KADi7qk
         i39vYrOlTB8W6qaa0WqSvimy/rFnVy65GLkRtqSB5fZBdkTzCOgT3LqcftzoncK8IkwL
         bZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXUZ+YlcJWfxyNl5KMITZMlL/kR7aQKZHgLsF49elBHn4ra3/D9u+fhZ9HA7mNDNJhzCdQ4DcAaZlOXnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbpiKQMWjCA9XQCoRy+YoDpwAkFy390IrMfTFRfazq5o0tfRYo
	Df9DWi1Li2yGaUzoz9apoFJ5IghLaZObXjUI6f5aYOcGYAmT8YlF/ym77skEG7g=
X-Gm-Gg: ASbGncsRyNzqWdCtjfHxu4KzbapVaxtCDT0Wtf87Zk5VtclTl4Iy51s0zGdwXsWgjwe
	zaM8/mFLtmoScdSWUS19QaUNS0OVTYN4WpRl0Yw/1sEMH7GbLdfmbLNNZVRjtDEvASgNAxdWRR7
	Eazn8KomJFFdUP9qcd6b6WBrruKHQHyoB9IlT/OOLpjMsyLTWlof5yK1aTIeqaL66GAYydVtNrG
	zFCLIeVsBTeaqNZTP1zvm5MPCRtN4NVndlNJPya8JFHXeRnBZjzm2dL9wuMQh5cLIkqbGD7m94b
	sLqdDbAfjwxe5sHmWwQAT1LVLrVDity9FagWh5aSUU3C4pppeQ==
X-Google-Smtp-Source: AGHT+IH81RSmoGv2vG9iqqRjG+DYtBzAdJMaGkRjl+5vBHC3a1xD7FDcQMu2Rp5DtnM0NFxvXyDmyA==
X-Received: by 2002:a05:6a20:2d13:b0:1f3:33c2:29c5 with SMTP id adf61e73a8af0-20179787583mr1577432637.7.1744331940263;
        Thu, 10 Apr 2025 17:39:00 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2335294sm212602b3a.176.2025.04.10.17.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:38:59 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, rogerq@kernel.org, tony@atomide.com,
 linux@armlinux.org.uk, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2plus_defconfig: enable I2C devices of GTA04
In-Reply-To: <20250228112750.367251-1-andreas@kemnade.info>
References: <20250228112750.367251-1-andreas@kemnade.info>
Date: Thu, 10 Apr 2025 17:38:59 -0700
Message-ID: <7hwmbrwmzg.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> Enable I2C devices of GTA04 to get better test coverage when using
> the defconfig. Until the I2C host driver is fixed, BMG160 module should be
> blacklisted when booting on the GTA04A5.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Queued for v6.16,

Thanks,

Kevin
