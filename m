Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5140C263F41;
	Tue, 10 Jun 2025 19:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749585243; cv=none; b=SAB0ozHM4AbmVWPerRO+2AcjPDVN4EpI3hvkL9kDcpq3jPq21R6G4LwxMFkeP6ZpTgTogm6PzBbgBL6y+grzVJAubFgUeILSlaouxBGdVT/WvlKt6llp5paB0p7K5mgFyKI0mPWR8/ztyJXo4WDGgOqtV1AwsJL5etUK4vfybOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749585243; c=relaxed/simple;
	bh=sdtn7eEp4kgiDaMdD8X4PypLMgbrjuEec927AuCq+J0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CgJnvVvmk2k9HR6VoL0E9llKZ9gJb1h7f3M77lAnEIa0EubsD8x7VImFsOBDs+3/csW+GoPTzF/P+2VVK+CXiMyvbSaGb5v20s15jjugc+ir67OsXr9v9O8bUVQWP46lT5exNRVKBChRnyDnIGj9p8C7iVO+Y23lPc05myMmLKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBqQYsMU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBqQYsMU"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1967962f8f.1;
        Tue, 10 Jun 2025 12:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749585240; x=1750190040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph1K9nhA2Vt5tUTE9IBkwCPvhYlBWrTrf42zGu8uhLY=;
        b=CBqQYsMUzZ2mD7anzMU8yJphfx3ZcQ8/dm5uZPcYZO+Xc8Yd2WHU4W9fVSCkqvo1om
         oSyNDwYErsIdDR7XRgBAxxsAt5NGac06XLWq9TLYzYDO2fMLGnjL+WvZoTWKr04iYX9C
         bi9b96iHo9ZDyjaA23v0yUOVQsHysAkafIm009x5wysmGs6dQgW441DOHO0GsjiCdc63
         3oi+FfSEbCHT/4S79yIK12K8YhVicCqKTU9B0xTZfNJ9wKl8ftk4TJQ02rGfBoJPkCxN
         LWTH4l71dayABDBDldD5Z4uw7JZCDl5Xs/G9GRf1eEJNScl7pvURXhpA8gr8cH4bmLZn
         5RPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749585240; x=1750190040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph1K9nhA2Vt5tUTE9IBkwCPvhYlBWrTrf42zGu8uhLY=;
        b=PW4/LTb7bq1drQtpzS2uLVLGUwR4EqRxKx4StSj3JiwvVAuR/f8pOL2yRkD7XD1Mb3
         cFfcUyqiL8al+w76aNAGrAQ2u1r1rIk1ouaQhvh7mJ9TtCPpSAMx4hefKBd5gkwu9+ou
         uHM4n0AfEuaZxQDp5mb18yYplnUlkoIaNRDF1TBZcZnGT0T1y1kFmJRBT6nx9VL2nWd+
         siInM73Me5EKZxUCqlyEGOOgUCjCDFgy/05ep2faR94jX9+9u7oZJjAUkmpnwZHQifWu
         Tl/BK7+pbX/2pVzEG3Sp3QFwR4Wsb3hyaS230lCBV/vBLust70+MQgOgFl6TapVMHwNg
         eNRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHBO4ZDYpD0mIcLXkWRQ/egL7QFz3hqjHqjNS9uDbEUXaGzummKAooaQ1/sPxsv/IIMNnZVxDJlyIO2Yc=@vger.kernel.org, AJvYcCXIv6XRbW3zednIQjOnVe/uFE5J7sYRFtzTMD+YcRqLGwaSJ/+ajyfANw8lBNICkJJtAP5AGVKfCZ5wFes=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJOj6juDwlZgPCkIROf3QiTEUBYmLoN567FsJ9aqCy2eoTHmRt
	j/rxSpr/vDwBupWx/hlhmxs4FafTxTijht+uWdUdBBTy1CyMxpWFw6+hldgrdQ==
X-Gm-Gg: ASbGncube/om5HO4yAQEPBP6k1wT/Es1FJvfr+7snN1vRhuleSei9/pvSETIgiWiJ+I
	GbiScCWAzPwOAhMRuJPYZRW54PsGlV0CZPhfgHyVbX3K/uzbwPGAJaN5Ma9QggBXXYVsER2Mq7U
	87fWM6gk64sfjrhABVC2cF5/nXn7yQiAaBmbkML0JKut4GDMHZ/EcCloxc6EUWEtr5QjMXA0z2j
	aY76LMWQfw+aX+mkRrrgQLEVAY4h94uRT+bTn+hPUKRvfxv/lTF/YrXdOcCRDzDTU+60ScRTvaB
	d2y14u1PuUBblsu+vOHe8zohmBY9Ynd+B0mRgxuBSp8MdPoHjb+RRUnkLcXMudMD4PRDQwkBOD0
	U3jJngGSJZH8aN+QPbZoW3864pS7dizr8J3c=
X-Google-Smtp-Source: AGHT+IEHk/baWTOcAxkY5Kvy7mQ8aJbUM3aIlVEB2Tx5t++pwNgXhWtp4KEGX6pa2mjBcJRZidlhzg==
X-Received: by 2002:a05:6000:250e:b0:3a4:f6b7:8b07 with SMTP id ffacd0b85a97d-3a558aff7a7mr175941f8f.48.1749585240370;
        Tue, 10 Jun 2025 12:54:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e014sm13068138f8f.3.2025.06.10.12.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:54:00 -0700 (PDT)
Date: Tue, 10 Jun 2025 20:53:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Mark
 Brown <broonie@kernel.org>
Subject: Re: [PATCH] ALSA: pcm: Convert multiple {get/put}_user to
 user_access_begin/user_access_end()
Message-ID: <20250610205358.07b1cc05@pumpkin>
In-Reply-To: <bf9288392b1d4b9e92fe29212d9cb933c5b3fbae.1749296015.git.christophe.leroy@csgroup.eu>
References: <bf9288392b1d4b9e92fe29212d9cb933c5b3fbae.1749296015.git.christophe.leroy@csgroup.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  7 Jun 2025 13:37:42 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> With user access protection (Called SMAP on x86 or KUAP on powerpc)
> each and every call to get_user() or put_user() performs heavy
> operations to unlock and lock kernel access to userspace.
> 
> To avoid that, perform user accesses by blocks using
> user_access_begin/user_access_end() and unsafe_get_user()/
> unsafe_put_user() and alike.

Did you consider using masked_user_access_begin() ?
It removes a conditional branch and lfence as well.

	David
