Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2494921883E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938717; cv=none; b=kZTc8Eun0E+lv/F/deSKfHV1V72WfZPB9u0lrVHa25nD8L/B1O5Ks8ggG7TC84LWUFbZM6QAM9WJUBXpcBx1mrqM+/go8Lcc9nU+C57F5iMLAyeg4MMhQuYAgbEwg6SdrTFztY4yJvNgTbewjz1m4/U54enXZVSHM/JvYM2kvF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938717; c=relaxed/simple;
	bh=2PdqbEbagwoDuKzEj0IRmpbhZpPVeui/bIiI8irZQ4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9Bn9e0CRsIrvnwBxsrY6DejpoNiutG6v3C6vFl6wWqZZpO0/pcOHWQxVqA0I9olNQxMPfh+W23xWJyvQQ//BoqpeMmcrh6P3Vl6EkXsnFvSTM2AxVJ2poMviz9JB0LG/sjisK3VPJug1+PZLpuY+MC/0yxT9e9REaW4fKG4VDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=YRBmW7Jo; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="YRBmW7Jo"
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 099243F54D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745938202;
	bh=52MijEJOA2wvCQcL6Go5NIekwbrP8EYQEpSc/TVugz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=YRBmW7JoKiSIAha/Nr78pmeKdcbBSOQ1Bu7jq+vxh8np5ZS7NENj1RYYlORijaVXl
	 9JXzD3FT0XJQCoqt1DapTbv7qgusyHWqhEorw+klAwxcBpLu1Oa9adxK7W9+3JXTxe
	 Hn2oG1WaeyOFB4Lr9J2QQCkKHBzanhotR3DV9Q14AQf4s8sC/TX/a18Wii5R1ErZvJ
	 h7xYfxJC++WUO2QPoOub6jrj4W03bafnPdG5LYTc11JklFwcwirRePiczL7SRJl0Ns
	 eunPYf07SP2Gbc2ipGaWXW8KlG2VijSAcnChaBmpy/6NAZtAkCsyiRGsurlbIwcn0r
	 03hDFI0m6ZIog==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39135d31ca4so2340882f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938201; x=1746543001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52MijEJOA2wvCQcL6Go5NIekwbrP8EYQEpSc/TVugz0=;
        b=Aj/YhY6Ubeg/5GYdUhbH8v10kEXCcqsxr43o+ZRGmAyAw/IfOGhNPJzMH7+dFiWQu8
         XA8vHOyQtCkpJC0XehJabSnf3kbwb7lnEqNCC6OupUodDZ+UNU4hMNn9NDMJmjk1TPt0
         ZjbI3V/iE9hjI8BGIrWKv6Zq9JnhBe235CXmH8ufCBJiPXRpiiKXjPtbuuVmogosUsBD
         z0Ej57zCs3WsLRGs+J0O9XwMwHCcneDutNgtEGLacOB6kPELHsDtTnxnpokkfx9XBjvC
         FCZDoeUmu1e4y2yfa8FYXccuftb7cu5FaW2GqMf1/7zdtkNc7RSZ7Ul4CbsjkuzV1nA0
         o/1g==
X-Forwarded-Encrypted: i=1; AJvYcCU6jstI7Upx9KdUW5mJRNHKp9aJgREVNUiJcEHn7LAx0gfS768spn7nzDdaQXA4wGqL9Geuiwpxfcua2/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrl62oRgkUDTgjPnzfYRQ3QCa1xlPOh8Yeli6wxiN/ER/FM5Rh
	qr0X24k5G/ci0rs9Bn9H+oemkamMeLg2TjYdC0iV1xBXf6nIj5bBNJEwbMU27NIRlsyPGo2bdzh
	A8S47DxxECH6RtJUk159et/wVKf1ttvdbFviSBx3oYVoYh1iZhMF2tvwUYMTGVFUeA4YZXdJEh8
	anzw==
X-Gm-Gg: ASbGncsyAewdjyOkM7SMOH31Wh8C3mlvcbb5gAC84VC9mm/3j0pnpjQjYNKWm20O34B
	SPhpZrW6rpcMFSlILwVyY89XrDYBs4JAUD5BA5UqQXjggqPLGtdJUvPphcOnLfNIIjq5iI4d0ti
	4cuxO5oegK+qC8nF1AMVR3D3oVmPmTMriCRFFjnA3osa1ZzIUUyFE4JXM2fE/6RG6v+rW2T1bmU
	oNsBHl9yZv9M1Wh0LfQynpg7w741l+9T+wYcKsJb7ue47W4gGQA05TwYb6PImv9MWmBVhyux7xK
	FyYLRgagllYsp/sgJS5fmFQ5552b9Q0wvD7r2qGMUEI1zPNLPQ5q7JFR
X-Received: by 2002:a05:6000:18a5:b0:3a0:8c01:d463 with SMTP id ffacd0b85a97d-3a08c01d90bmr2630921f8f.9.1745938200825;
        Tue, 29 Apr 2025 07:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnKBHWKNLptuYZLJZBRUoe7eBhk55Kl8aqDH7g/w/SK5bZ6Awe0yTGofYm3mWix+gf5bziAw==
X-Received: by 2002:a05:6000:18a5:b0:3a0:8c01:d463 with SMTP id ffacd0b85a97d-3a08c01d90bmr2630899f8f.9.1745938200468;
        Tue, 29 Apr 2025 07:50:00 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8d1a5sm14498765f8f.13.2025.04.29.07.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:49:59 -0700 (PDT)
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
Subject: [PATCH v4 0/4] HP EliteBook Ultra G1q support
Date: Tue, 29 Apr 2025 16:49:53 +0200
Message-ID: <20250429144957.2088284-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416094236.312079-1-juerg.haefliger@canonical.com>
References: <20250416094236.312079-1-juerg.haefliger@canonical.com>
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

v3->v4:
  - Bring the sound model back to the node
  - Split the driver change into a separate commit
v2->v3:
  - Drop status properties from nodes in patch 3/3
  - Add acked-by-krzk to patch 2/3
v1->v2:
  - Don't rename the X14 dts to dtsi and directly include the dts
  - Add a label to the sound node and use that to override the model
  - Reorder the dt doc patch before the dt usage


Juerg Haefliger (4):
  arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label
  dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
  arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook
    Ultra G1q
  firmware: qcom: scm: Allow QSEECOM for HP EliteBook Ultra G1q

 .../devicetree/bindings/arm/qcom.yaml         |  1 +
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 30 +++++++++++++++++++
 .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  2 +-
 drivers/firmware/qcom/qcom_scm.c              |  1 +
 5 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts

-- 
2.43.0

