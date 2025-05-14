Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3EE27C149
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236940; cv=none; b=JrUeJssJCDv3B4xaOEfY2yVeREjqPrEJQHmqPSIPq3cUmYznZrIurCi4RzcFRlpSzdQOYMiW92LMY4FiI4+D04RzLdsHI/QtmkeUzntvlBG2rdfrNfABxt27P8X/00EWjldJpZIzVdCouGuwaBbmKjXCdgWdBHc/eqBv5HrgnWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236940; c=relaxed/simple;
	bh=Qpk1Rjt6pLRs6ir4eWklzWDq4deQYGOodPfAPBjPzVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQUMtr2zZZEHmXgGvv1EH8DR7uItBtPJv5/boYEVrxsKHmqZ2z1EpGqXAi/NVdak0LOE5q6rV0KvAHof+51IgsOjRsoVSd9/mahw7Gx3anwiEzlgfC4AdRoLoMzsHkZnzAxGfVslHHjd6qv1idjyXtkZ1D6lWTDn+aDv/irJt94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v+2XBkFt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v+2XBkFt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442ea95f738so19094965e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747236937; x=1747841737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idqGRAR7bH2KEp3wZfnzOTNqKgABlKC7q7qILSds2X0=;
        b=v+2XBkFtMX0f/4CzCSm7WXVa+Fk6UOa3ohlQotpXQ5npd8yM4021ZwcVEPgUdy0qIQ
         0aMNHWD9aD99RldfmqVysC9tdcznyf2Qe/eQYI0ehdTd7yuEfzfLEqzlyffHbrN+5k+3
         ES4O5rDBg5ehAPylmsLPJpO6AcmWWB7kyvDa82KLCdoSKOschL8XrOclNTSKIDg+C4Bh
         pght4EPaUc9fJYRZ2qrv7U0Bs3OYpru7nq7nEQDe93kPVZA7pFWcuov7KdcDGjs/MKuF
         4/c+iJnMyY+Ip+h83tNfLCNM6lyK2LYBvwoEbEHEMgHCSDyu1EXC8lWLji2dUvoIxSud
         ymFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236937; x=1747841737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idqGRAR7bH2KEp3wZfnzOTNqKgABlKC7q7qILSds2X0=;
        b=qfhz65D4LIadz6QCdmRm/HB4WVxNddXLWgMlb0K2KhtxeMlhiTpLk72ZIn6L/DE1zu
         zbI/GSUmoE6D/ZCnM9OHzLtzdJ3P6oyTVN2NsuI1T7XDoDLJySVKdRWQCs6i/ZNNjSiE
         hfpiOwBPZ9KEj6rN9OBPoAU2nWkapimAUxsrlskvCrVNoiuw3FmPN2iGJVInp/8s2its
         BcbagyXTF/47Ax77nnIa8IJ09og4cUyo7ErZAoi4rAI/I8GujCcad1uiSpcti6Jan26j
         GSOpqHGhLL7JqUF2ZB40wIbb4ePFKbKfRgIbpd3aRrsHWtRPBo00Zo71X3Hz4scNwrnp
         3c6w==
X-Forwarded-Encrypted: i=1; AJvYcCVQe/4fqLCcgyBYuwkX+vWApy904ZwLtONR+PlAPXFUiKsBa09vU20o5C7BF0+tMapLT8IbRnJN88Fm16Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCT2iCVKt262KtqLyjpYqD0ESECpHuEgWI9UPWRHkvNg8YSA9r
	e0o4KNMA2FqI46zJbLG9ESiF8xtdHPZxkPUjUvwbdhxXsyw1z6TrHG0iilPD1n0=
X-Gm-Gg: ASbGncv6quaZGqTDmKV4cZF4jkbHLNK46sYQOBo5mCwyezEybQGX4TDv8QAl5mgl/bw
	EvSMkivAWbwALeSTPfoKOT+bmNAdkFUL7m/dBDTmrr2WhkOMEC2zosZXTDC6vdTV0nu7+m926K6
	zT6W3vWx5t1Mzhfm13i+9H+/Lc0T2cPu05xsTVOn2VaQWA6kVDAoMnmMohJk6srekD+N2rrj4mE
	/ZIz7zuoTO0UEq2iMr7clUL/kdRo0/EFhsnLl5qAQxongAFir09MdH20BsC4VHwSoNbroGJX4H0
	set5gGTq/BZ0bWpT9/faTwD7M9wO+v+TQSaex3FpkN90iu4l5kEkiVsHgcSVVZCXPLumsnIK6ml
	jaMTXE4Sf15ADhfwt5NduRhfj
X-Google-Smtp-Source: AGHT+IFCmh05El55ohgoZq5R2Nfn3DDzJB0oWIDYBJsZTkCWw75PyCCcGtGuioFQpwJTvr+52yNhgA==
X-Received: by 2002:a05:600c:4e45:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-442f20b9349mr36040815e9.2.1747236937221;
        Wed, 14 May 2025 08:35:37 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951adcsm35415105e9.19.2025.05.14.08.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:35:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-arm-kernel@lists.infradead.org,
	Adam Ford <aford173@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	aford@beaconembedded.com,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: davinci: da850-evm: Increase fifo threshold
Date: Wed, 14 May 2025 17:35:35 +0200
Message-ID: <174723693271.14834.18146148075528464052.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250504102959.81830-1-aford173@gmail.com>
References: <20250504102959.81830-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 04 May 2025 05:29:59 -0500, Adam Ford wrote:
> When operating at low speeds, the display may throw an underflow
> error and the display itself goes blank.  Increasing the fifo-th
> value appears to correct this problem and the display can now
> operate when the system is operating at speeds as low as 100MHz.
> 
> 

Applied, thanks!

[1/1] ARM: dts: davinci: da850-evm: Increase fifo threshold
      https://git.kernel.org/brgl/linux/c/17f25c977e9eace1b066417b11d16424772a2fcc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
