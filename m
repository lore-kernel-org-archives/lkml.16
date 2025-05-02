Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD0E220696
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171352; cv=none; b=Z7IUtfsfBtDHFRsQ/fok8Vc9kHevl0opIFN8XFw2CpSREaxQyc4iNaMK0anUNthcJ0ReR8wsfGM34aNy/oyuGb0TQDxhVfOw4tpkPzO1gaEfb+wFE/BFrrioS4nYZkQHULjx/qEQoWAZoayRsNuPJJRNoYsx93G4RHObTJ6rZoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171352; c=relaxed/simple;
	bh=hOhh3gEilCO3bcXc9+T6C/ljAGT1BE1jLApD9olwcxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kxmbVF/CDRu28pMahTuJsXuvDI1OwDOScJB4nLnxoGKD+hKwBpJdNc+9J7lHOYBgrvTUcSGk+zc+cx+8UBSQXCFMSzWJsRgc5/k9VtGNvq8ocZeDuN7WhqJwqaQCuYTwKHkUUXxwTVbYGcBlN+znXSs9glVoYO1GVkpekICPEDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFQ7np5A; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFQ7np5A"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acae7e7587dso251065566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 00:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746171349; x=1746776149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOhh3gEilCO3bcXc9+T6C/ljAGT1BE1jLApD9olwcxE=;
        b=MFQ7np5AbpumU0qnSawzY4y3hNJhSOXwVKK5ZpdzOqmih5RvCa90AV9Rnqn7lJHpDz
         TxLWxNsl6nyuw8Z7OhGhueOe+C9NkinSpntSti7eBYLx0qS4fX6Oy+c4z62Bu7T4ezLz
         YPKfD+o7h6eVVtrVx0MRfj8CjfVq+5WDmL1wWN5BWfc3t87sbr1/s8AwFyjcbAAbXRdf
         zKdx7vv7UI0H5urEUS3tXALxkqyOjEqoCqsZEtf2tZgXjiVmBBGa+4ZEiEBcyTYusl+v
         xNRibualjzaWUVIaCBZj6Wdr67uyhA69qDy2NzlO6vomzAaBA+0+4GDjGZlAqQ/PXNfV
         jylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746171349; x=1746776149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOhh3gEilCO3bcXc9+T6C/ljAGT1BE1jLApD9olwcxE=;
        b=St36VgNtGDJBT7zCqI0gehYKVITm8EPBN3tbfTiaa27EhKLFqSO2Ftjg0RNBaXABfk
         o4xqpCUdK5dYvSczavgNXNB8g6zNaY4vvDzsHMriJs0U87+6UNODK+vYn9NsxPFsDBKm
         qCFMe0ExU9kkDrydwLsQL0qF49u3yhN0Beuc8SzahrwmKH8j9l2NUAf8LHTGvbY/eFJK
         rGCP9Ao7nyUirkrldw22vom4h/vWaf+AMNaF9/0lRVgy6c6XW7ufCnjST2Avzc9el/DZ
         md7tfmd4Djs5EkL/PtEm4GbTXNOGNq7UpTjSQV3bJSrYB7pzp9JooAP/ZH1MRwBDqF5M
         hL8w==
X-Forwarded-Encrypted: i=1; AJvYcCWvHTfmQKuYP1id8QT524vkQ+rwo0uLwkcWLPLYr/hSjQDjtCl9pcNOE3D5BTLUmqgVD0Yo4Yn1Q6+b35M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5fNlbZ335gMJ0gNhJV/NzZGYBqw67EJWxy5ls/dDvVy+uNIWL
	Mnh/JD+LrOhnyZl251rpD01bDyCdjCRjT8cBIkjIHe48hjuL0ABz/fCgnhssTDp5HSBn
X-Gm-Gg: ASbGncsdQywbF1g7uan+cCmLIEXFHAd0Xy/q+ktn2yEc6O3rCeyWOE/h4ovH6io5Wkb
	0Z/+ob8ItOFgqnQtUjhLRQHdx7bJLTXKZTRjQByJSlgqWOhQpK1mqT0znNvS/krbcjv004HAbcP
	BrjBdHJAuaEmq6u7lrYioOoemcwawtksSiUeokN5y/LGfDiYjsJfvmmcc3qv4ikhwRl90nXX311
	wtJ+5LjX8l8Oj9vf8h7UAcR34GwZtMH4A5z7TFmYeGLILD4uZ94+9zjSPHVI1whLaWxlsPPit2L
	ToCnMsj+SZ9dfBqXDQ9IipXbYEMULx7Lt2nIkzN9uQpiUWG86QxNWqY31iaQDvVTLKiPUx43
X-Google-Smtp-Source: AGHT+IFmMkOv/J65q6St3Eqyd/NtN3HZGXk6Qgc025AViPhYRjkJUNoBSU15Qo5gJTx9+pgeUU3iwQ==
X-Received: by 2002:a17:907:7d93:b0:ac2:a5c7:7fc9 with SMTP id a640c23a62f3a-ad17af4e24bmr180816966b.51.1746171348852;
        Fri, 02 May 2025 00:35:48 -0700 (PDT)
Received: from chimera.vu.local ([145.108.89.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3c1esm7807066b.52.2025.05.02.00.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:35:48 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dan.carpenter@linaro.org
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	thomas.andreatta2000@gmail.com,
	thomasandreatta2000@gmail.com
Subject: Re: [PATCH 1/8] Staging: gpib: agilent_82357a: changing return type void in int
Date: Fri,  2 May 2025 09:35:48 +0200
Message-Id: <20250502073548.32948-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aBRxQhLxs13zuFZy@stanley.mountain>
References: <aBRxQhLxs13zuFZy@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My bad.
Thanks for the nudge!

Best,
Thomas
