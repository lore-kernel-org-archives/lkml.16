Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B8921D58C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751133177; cv=none; b=Yppf5xy4MtoOJQ76ksYfKBG7aOVvA2B4YtvvpwKkfa8Ms6N4cYzh4vbvq1GVuV2vjCbCNr0QEXOvJbW2kkuVxZWC+dCO56i3skljBj0oNi4NvjVUjPuPe97MGytZOiNphELPFL1GL9+TodoaZ3pYhoyrVS7K2P20F7xyIYV8MKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751133177; c=relaxed/simple;
	bh=G3Y9nAnQtjyRjf4a+ZR/oAdEauIKbjZi5rgSnqD+vio=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uusS/vm5D+BoKvuASOl1iII29MRCKC+BpQmVoxgZhPudOIoBfoIpQEZlIkq+4WuwBjQKl5yCEzf5oAkSNz6j7P2Lk/b+3ze9djViPCaADFHvDvy4+3sJPNEhbpLZlpOKklLzgpxE3QlCmrgKVHx8DaXwiXmLBT+bjU95EkeYXRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xIlt82+p; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xIlt82+p"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2ea35edc691so769985fac.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751133174; x=1751737974; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mHo0BNmd9O73IqwLXI7ZVxz5ifNWJwu6M7am5hfDqAw=;
        b=xIlt82+peS1Mb878nRcvAlyyY1s2yh6ltxcnJoGtx/tEoEMJZzqLV9j++YNwxuIHHt
         T2AL6k9V9PJ/qC3CAaSdqzp4JQgvmcVD5KRFu9HfbTOeW+NGQF376qwQwydFAcKPLWdl
         fFsYpwsWGtuH9lRQD5HWe/RroMysMH4DhQB1w+qbmDk0r2cJes0hOXMTKQIUzVSuvtL6
         9hKjKGONsC4eb/SGsAIwbLop30vvjUSxY6e5g+ZzY0W6fi2a3llK7P8PS948F3AfZ8zG
         s2V39jz4i30vXDFKNziezYwU3cPzKsY7iCpRLS/KCUci77UVo9B6yIDEazW8QHYhIVoG
         KnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751133174; x=1751737974;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHo0BNmd9O73IqwLXI7ZVxz5ifNWJwu6M7am5hfDqAw=;
        b=O+sHvUaeADLeNuhugVRr1LklLNmEEbCMjoMJV+s1jf+BRclJ0sBIghvM1e7rg+GpD+
         t4Q3LO+/bXvgb8qFwUq0mRbiEtAOzvMJo2LzSI35bfzRMTe2M9S7RFg62CaT+MKUnN5+
         FNcoyYTP+gtP7BIZcbDllrK3Lc2/RSA7yzpLW9OtGIPEHMgzjAiXvC5gdkA3zI0eJlTC
         hBfZiviU2WMBJ/zmMj8fHX7VebxtjKb4y0uVBV6p4Q6TX48yGVmjGOqLWWhjzy0sk6Y8
         i8ykhkDmpWd83unECR6QB9J3ueZBsfIQMQQNNXEWUb015lw4aUcDe2e0s9Tm7Vv4L+4S
         SgmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWek9BEQSbg1tGc3hG3XoZS0Qp8U8avW/iv9NRjNPVsJGzxEJ1qg7Wd9eyLBaeaJa/I6lhUM/DTwMGKJcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbHzsZmK4rvva5Anzo/DD/WeH77v4hXofsS6cEu9OCXiKVbvWW
	OvvyBE5qiFP/7LcoJMTrjMX9kkEGmmB2dUYZKcIBE1sgiFvJ4F7gOobwI2V1va/e0pSPZRZQryS
	mY2VRWvc=
X-Gm-Gg: ASbGncv2vlTj60+hZipsUSv4RCseKuf9FO6m/UHC+3EGMR/uugU9AGKBY0cQlwO8TQX
	GlEV635KITk0Ddxo+M2vof1jPhB3ldSeSncuvKgHbQcdwXyb32o5oQmW6RtZd1jDN00utE5edet
	RhZ11z/Ty1I+DMoWRAJ9VsXCFFlV3BWeNWM+tZlUnAJJVZumhCFImmIVjn1lYlUdcr/o/Ts9u65
	qEas16Brbr/wVY4EMHdKYdG1BaHFKbdbGdrWfg6UlqlIFFVshvQ5kQ1WO96vqmQuzr43ZfdcDIr
	GdAmaE+JcRNx9UL1IPn5u7wj8ySPGymLus+QvceSHyYXFhGO/4adqa9lJQm1PCBMd6vu
X-Google-Smtp-Source: AGHT+IHMCLIlkhwpjoKd+5r66hiD/rFrgVweC2g79T/XPrWeUJax1Aqm7JCZjalBherHHtL746KLwA==
X-Received: by 2002:a05:6870:3118:b0:2d5:2955:aa6c with SMTP id 586e51a60fabf-2efed72bbd1mr4915513fac.31.1751133173890;
        Sat, 28 Jun 2025 10:52:53 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50b4d84sm1593530fac.23.2025.06.28.10.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:52:53 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/2] iio: light: cm3232: make struct cm3232_als_info const
Date: Sat, 28 Jun 2025 12:52:29 -0500
Message-Id: <20250628-iio-const-data-20-v1-0-2bf90b03f9f1@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN0rYGgC/x3MQQqAIBBA0avIrBsYhcK6SrQQnWo2GioRhHdPW
 r7F/y8UzsIFFvVC5luKpNihBwX+dPFglNANhsxIk7EoktCnWCoGVx0aQr1rRyORtjNB767Muzz
 /c91a+wCmklZhYwAAAA==
X-Change-ID: 20250628-iio-const-data-20-1f1a05001890
To: Kevin Tsai <ktsai@capellamicro.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=661; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=G3Y9nAnQtjyRjf4a+ZR/oAdEauIKbjZi5rgSnqD+vio=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYCvf3RF47torKYrwTGqNjvM+BGYAJPPL8EbV6
 q4LmPmZWC2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAr3wAKCRDCzCAB/wGP
 wE7DB/9JPrm2lZQYqP/P3zkr/AnK1WpXvylRxymdwEdGo6bqo7k+/m+9Fo9qs5VhXFJbvD9TtDa
 oldzzLxE5PomObtrGv1fQ1X9HgjKNLeA0Hp0WcwLReAktt0MBs5oYGE85NO4YyeHVDMpwfwPh/H
 pSA7DDZ++T2lliJZTYpSl64CYX24SFYglJoZ9ceBUmZnLv+wxdpyWOzZYyXCLlllHl+eusVUdiv
 9d4HDFgshkr1xSuHryEbefMpkNpQujXyN4oXJFb/iAgE2bBwpqx/wasig2QXMMTCnA1H4WiTKIN
 9tIqGiRcGPQdgdRrF/GhGi55P+iluwv6o04wzYo9j/nlf9uC
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Typically, chip info structs are const. Before we can make that change,
we need to move the calibscale field to the driver data struct. This
also allows individual instances of the driver to have different
calibscale values.

---
David Lechner (2):
      iio: light: cm3232: move calibscale to struct cm3232_chip
      iio: light: cm3232: make struct cm3232_als_info const

 drivers/iio/light/cm3232.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)
---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-20-1f1a05001890

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

