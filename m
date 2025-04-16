Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E191920F077
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818997; cv=none; b=ce7B6aFLA/PX5uhClyXBK1cWrQVKt1386NckOmAp9XvdMawAVW6faWCc450X5DPpLP52sp2/Lb1AiXEU0rnFnFFZbIKZSl7OnF3kMHVX1J9WXvVy/KwEi+KKZzlyctn90wBUoIQVo5RSRnLSf006KU2NEC7MchF13aTJqSrzJvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818997; c=relaxed/simple;
	bh=D2U3pMjx1HkB0gYSri34kJrZX7WrXhn6TRocmrlyD7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdAcXi3ucobNPj26fqQOwhWkUZqlKb9jGh2cCNMAluaKKYhGWkSD/bsIR8CpOTqlB1SI6ByCDAVKOT7wOPN+UluB1uNEyXgbssNEXdsYgOtZZ7i+jHdEQLK6vMYb+zHZow3uWask2F+2ur/G4SqABtafJM+K1DZUj09Ss8AOR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=O2KWPbQE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O2KWPbQE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso35412655e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744818994; x=1745423794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/pQ4LEvtXREXkFPD7yKVlDcfVBD2jRYp4fpUeLGjxw=;
        b=O2KWPbQEOczyJgMpJ/wd0/mkecDqVNde7paqKn9fRJdvZ2QqK86w6lTxtwVtTLgbd/
         RXt+O/9RI62LGH+LLQcd90nlFtOYNMdOel01bzXAanrArpyah7Yo7wRdMma2YECz3T1X
         sJL1wiq/bV+5KE+CC+V7Z05ih9F3vI/yJ5YecKMPFCZ2OwyJRv+EqVS4IPKIkJDBExqk
         UufwndHipLB4oomGDTwqynpxHTqGPH4RoxHkmFKKccb0QalNitpnnf3JVNaF+5q228t4
         SWc/V9dzpl1tx7Hax4mNw0tgzh5TVF/XZAaoimyU3UfipyoXn8UwQmOa7ugEtxb64TqH
         QUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818994; x=1745423794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/pQ4LEvtXREXkFPD7yKVlDcfVBD2jRYp4fpUeLGjxw=;
        b=kHCe3YgKwH8U6qzifOh/el/fIKfKh4dMjq6MQGB1D/G956zo2KDf6kBnEZEcUmjqs7
         qMZXSU4+PIiaJY3YvgC3DgB8LuQnC+q13N9TtA3Bmi79ZkjSxQvCOrNIhKqAdVN5lIsR
         V5Jz18cB++EFiLZltblEP1r2qMtf+y/3Htap/MZEaO8zm0mqU4k0osMzN3lvE/fQBCZ3
         UKn0RGdLbEAFYBTTED5/0/0w9ia8vEAZfjnSQDhHspT9MdFKHyWew7aBRunLwYR1MleY
         6ILj3Y5MwMUKgq5iS/pumLGtct7rirrOpSuU+efoHcW4AKwf2gMKf358CzQXlChFI/x1
         Y+dw==
X-Forwarded-Encrypted: i=1; AJvYcCX//+MkyAGH9kv50ntUzTpmPeTWWqZpb3BooxpJrHt2j3EdqIyeqWUziwnrVjVCSrrG2emcAsZZXOIi318=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpC67tC2hsD7o6YR8suedw977juyEmZ4tXUSKH6Lq8X4coCVfz
	hOLYf0Dj7kOOYNj67LpQRWiY/5iejboxO/I9DERRePNqlpBcTi/CdnEwlqZBQdw=
X-Gm-Gg: ASbGncuq1D1oqFrNoe/2wRF2RI7+9DrJ0BEvgGlQumyBClfl/eYE/8PyKlTW5a37GZq
	bZoXQhijbRyvreRwhRv41uOzBGORre72Sjgp5HLcnxTK6ChPF3z4KaJNW7DCctZYLv5mqKisT61
	NyUfhZ+96fu1oKNOG1VAHH9fs/Drp1V3vGTMAnuwZtJq4QuyxiL0qV7pSezvw55e/jhBwWHeU9z
	F4+KX8aKEH2kre89SvLXCDByVssioVgwm9kM0CEjW7VWBjN8OOYr8mlsigat9Tc3FFKDZPGZb3v
	95JgaTw1CcrKc6T2WbopcqekvU0q4iBh8zoJ1mfY
X-Google-Smtp-Source: AGHT+IFFm2/bZph2mGuhhUb5TvCItnj23ALODz/FJLvzCZaA83ACY0hoj3RAJPrANj0Eu1kZob714w==
X-Received: by 2002:a5d:64e2:0:b0:391:319c:1950 with SMTP id ffacd0b85a97d-39ee5b13b19mr2067015f8f.8.1744818994136;
        Wed, 16 Apr 2025 08:56:34 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9621:2787:c462:7dd5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm37224015e9.1.2025.04.16.08.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:56:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: blzp1600: drop dependency on OF headers
Date: Wed, 16 Apr 2025 17:56:26 +0200
Message-ID: <174481898217.8191.17051961705037896290.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250408143629.125576-1-brgl@bgdev.pl>
References: <20250408143629.125576-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Apr 2025 16:36:29 +0200, Bartosz Golaszewski wrote:
> Use the generic boolean device property getter instead of the
> OF-specific variant. This allows us to stop pulling in linux/of.h. While
> at it: drop the of_irq.h inclusion as none of its symbols are used in
> this driver.
> 
> 

Applied, thanks!

[1/1] gpio: blzp1600: drop dependency on OF headers
      https://git.kernel.org/brgl/linux/c/01aecc78d9eaae7c8a7c3183edf47a0aac52ab5c

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>
