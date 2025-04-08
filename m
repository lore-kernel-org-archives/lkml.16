Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576B11FE44E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123988; cv=none; b=s3Z1asfzL2Vy+Z2odCSZ5dnCmjq7ju+MmpU6Xcm3RENm/5n+4ype80zlIyO4zJwDCKyEZf7O42v4ucXw/RUYAsTIxIwob2Z7RmyamQFdwsVIFrVyQzJJa/in93flfOa+nJlbZ5h0KuT62oM2hj2dzE6k7NdUVtFP9XG8qLzETlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123988; c=relaxed/simple;
	bh=pPnDdail9gKbOc/Op+cSFoSfK2Fc132QoTPmF4gQ5Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPmHOKVlzBglKb7Tr8mSX0sd0MGkvZlwQWkvHwXVjt7KmF3rp5CunBPDfElyJ/RV/tV6Z1YHu0lIzb+f84HDLP0/8rzkx8mZulqMvYiC4k+wRCNJjXHTg5EXSFCDJAcB7/pBdeZjG2d5R7WXq9PyX3mdK/epZJ7jeA+mMzXfU54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ZGa1zY8Q; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ZGa1zY8Q"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 837CB3F27E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744123977;
	bh=k8izCOaPm/xJHDdDFD/9TXU6YUDqWpAyfFlsgoxwDO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=ZGa1zY8QQC7vd38D+7WivUsxKYm42qRtcReI303IXbmZcK8hjRwSYd0vGUerI5DjV
	 4q8KEre1zLU7DU0/1V3gpGU5H89jBNsNc9dHjbnsMbKrOi835Ly8eFbfZbzRUdfGZ8
	 luhot/PYLSJzVVCWK/H6bOF/a2pLifCY/V2Ve9GVMiSoSGEnJM0qnBVaT6kknDmBe/
	 UD5Kkr/LjHWgVX1UrBTweRb0zjfjHd7NaHLM9eU9yu97ggdCHN2KzfLzFRywj+WCD+
	 nIr3Gz3Ttc9EkPoBFgUIUZjBYr/BI6e0m3JTHpBLHlbYSf+kMsU0I8vIDHGsoqsw2s
	 STJ+cTQuBtfGA==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e6caac1488so6107705a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123974; x=1744728774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8izCOaPm/xJHDdDFD/9TXU6YUDqWpAyfFlsgoxwDO0=;
        b=Q8Wy6GZv2OlHRyVBZHoVodNu5/rPy1Nxw5pVjnpCj/J6pT2pCGjMPtwZUJqvn6o9+/
         yPijNEosuvCDiR5wmMVctCJUTlRBYGCB13MYipjqrjvSCPXxvws813U3xgL1OssyCo4H
         mqUSGh+pT4rgF+TnhrF1lOKjmonrJHpRz/3MkHVo3fJjDH8yg3m4Q9lIjzZu9Ur5eLsQ
         jS4rfVfRu1NIVm7bdBOeJCZ4fgWIP5V/3M8qLq6NvJ1p4Sgg/mMRMrmn+6Possoondhg
         XDpqK8Y+GpyuLQbH2zodYPDbM4n80n9dou1eBk5pPoWF5ZPfYojoI8D3bpI8UNtP593o
         22Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXxgHvyiOkBHGQfTC2C/hYuCwfeiut7HqpzrqGXxMJL7S1l6O0oORKBzmkcTBsztx0p31WPY8mvOXaOVeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLjm0A74bMutvWCjvMqONOZTz6HJzHEIqfTFB144y2HF/hOwYl
	IwDSyNKUZRyyYQ/izPJDe9B/H5EmpO4gKbT9P/EwgtkDCW0nno2SM09amJUmb+8EImub83t4rtC
	fxy9eN4JpOtdlZAkdxcwR0pjeGKx81vq5dSUzFRxrmHsP/KNTtnTPLDOt9DwEzv6wkoVK5Iya17
	D7ew==
X-Gm-Gg: ASbGnctXNO+Kl1J2Ry+3LVVKg91RIEc387dp3S+PQFfrH6U144+T+oG+kl4AVsHAhlL
	0UbWX0OBVQwVliNhm81Kx9oOYac1hqIpIV4RvIJWa8fpwF11un8Ec8XYOuuQ2keE31ArrEJ62An
	L8Ud+BOzXboTntx64TyZy1+63tmPJEaOgcEcJ7cvJgvADrATLdsR2nZCuRBwQVKTbJxVhdnfEo7
	V+dfWWi91YeQpBbPpN7rHD6PTJXWKQGmhPpkaZwJU4nd6vUadMC4vrShaXmMzTafy/40ZOk9RjN
	srmrQTR+dsB9n1uT5NLAEzo6Z+RMY5D/WmRThwGg9jUdmPwkddkSZNtVEOxq
X-Received: by 2002:a05:6402:518b:b0:5e7:87cd:2479 with SMTP id 4fb4d7f45d1cf-5f1e4188c3fmr3261205a12.8.1744123974526;
        Tue, 08 Apr 2025 07:52:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcX+5iiaGTvTWHOKgU4/jBtFcVQEiD0/I+kzf4/E5t3Sw5vLrdV7azNvN13KBi0nf8BogTvw==
X-Received: by 2002:a05:6402:518b:b0:5e7:87cd:2479 with SMTP id 4fb4d7f45d1cf-5f1e4188c3fmr3261185a12.8.1744123974115;
        Tue, 08 Apr 2025 07:52:54 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087714e11sm7999064a12.6.2025.04.08.07.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:52:53 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v2 0/3] HP EliteBook Ultra G1q support
Date: Tue,  8 Apr 2025 16:52:48 +0200
Message-ID: <20250408145252.581060-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the HP EliteBook Ultra G1q 14" AI laptop.

Based on HWINFO64 and APCI tables, it seems to be the same HW as the
HP OmniBook X 14.

v1->v2:
  - Don't rename the X14 dts to dtsi and directly include the dts
  - Add a label to the sound node and use that to override the model
  - Reorder the dt doc patch before the dt usage

Juerg Haefliger (3):
  arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label and pull
    out the model
  dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
  arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook
    Ultra G1q

 .../devicetree/bindings/arm/qcom.yaml         |  1 +
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 36 +++++++++++++++++++
 .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  7 ++--
 drivers/firmware/qcom/qcom_scm.c              |  1 +
 5 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts

-- 
2.43.0

