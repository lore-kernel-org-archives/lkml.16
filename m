Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4B3D76
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938717; cv=none; b=YX5RY7ZVryyAofFjmxhRuXzxnrdxM2ss0f3INcPmJRJnBxYuNkLxiGz5p3ttgkbwiqUgwB2i25UkoZ2KJje+l3cNbK5Mk8kLKZVLEmcPrL9VFmElECuNRf18BF6W98t8kDpNaqx4sbHoj+mOEHEns3EwNpSOfDTPcUhWL+tXCBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938717; c=relaxed/simple;
	bh=xqNci0ATiYuFCzjmmZLIos4bZ0/Wt6xx1B04/LG3Q74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldcZ/yTCb768fDYQgWuo6330bX0VB949qoffOOsbMbPlUFviX8nVTCh1RV10SBc9NERWkBpKj7VkuTKpZ5I+vPeiQgAsfon4rtAKtThSiSD62l8rSC5oo+3hOtRn5ppKXcGqeXHY2L32ziCUE+zOwADyMzr1ufy/A7iqxYqb0ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=uzI+tfjG; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="uzI+tfjG"
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E74D83F5AE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745938202;
	bh=SJsgYFbh52ssmxEFFARHq6BN5vsciQrSfXFEEc8qgYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=uzI+tfjGl8wsobYh4Gq5CiB1fYhuV0gvzFkSnkOQwIOAkEnJqe1arc2T4rEgq7ccN
	 GcfTpby1EkKRmUxbEFmHP9zejTaoXWEU21rbxiEWdr9F327LCGY98fBZ7gkEPzMGQE
	 qCm9Ykf5kYiQEy9J2G+zOsDzcfUKmwCKs/0L1TcnWMZDLtPrzfLIH36AuS0dYJORbN
	 k0rwgCG16y4EhbF3nl94YB2SZpjIjClTKK3jeBBl+UDGaC/36+KDLJcj9ejHIrGe/M
	 yIcgYp4xtSr31ovJkRWetD7BbYgDeHNuuynl/4gfKUarz/OUMWjGg+cbTppSb771wM
	 FMesvF4pFsdfQ==
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3978ef9a284so2018274f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938202; x=1746543002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJsgYFbh52ssmxEFFARHq6BN5vsciQrSfXFEEc8qgYE=;
        b=bU0+WQUzcphGJxU4mnhqDM8ndx3LRbzz8vhWE7SGlIXVyO75GD1fWv1vAwTs5XtoMW
         cVhKnosACDfxNQ5GfG1FqFZIVSrAYQA1hlE+8Hl+C5WY4KBs8QCHzCwfiFrCYpuL7XBX
         NWuYZecmghflHpM5pASLse0Zbsg6iBRq5fu8Syux/g7rtPt1wlVhBo3Y527duy/LDoHY
         HGvKVNYIlccVL20hK6GZeJ5YHtWXisvcbUuFPMhKjYiSTEUOyawJo7xlANysDNa1oeak
         AQrc49cdo7NIgQDVfn8NM44zlPaAXm/Rf5nQycq0XVY/YjraqVdbc3/c5/VqGN4ixNaa
         1BLw==
X-Forwarded-Encrypted: i=1; AJvYcCUkqwQxjir0pIJA+TOVwujOpVfb+9CwF7pTkkib4XyLOxLnFeeatTNwjTgs4nI9lwLTA+s3VZ8G6E74QsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS0EyL/rFZv8eCoG7OIOlTbzUzxj/Uwm5xdpKlWj2qYyP2i+s5
	evPB1+tpAjTzXDaWL/wb37vfP1OgO5u2w42AzBXzWZHwbsznbdD2Dhl9iNj9UC8wsq4XNmNScO6
	A1AK640Z8h4DmG1hvUbJczGQmxToFxyHsRvaYpFXeYIR5Xh6LWDpZDyiMMN3uogCPVx5IRp/NzP
	Lwat+Jz9U84T4Z
X-Gm-Gg: ASbGncsHL+CnfhHfkRZF4+FPxpek7EyszxbyAPs58T8bZdOlcEWA9wwE1v8VaUWELs9
	s1FYnawbr12s4vNdR19heT+bLvaubXGwX288ZpfaYuWksgyQ2f+MnuvE4EFncqO0bkEJWkW+MPv
	jBcavB+RtcSuqWHlluXR2trDsOqGXjat9kf394YEo8beg+c8LLSUhQaNauI6sqEEijbesMC93RJ
	tVucVvSrTzPLww3YMHbtdAqYS5fqbyXJvIYcasyv2G4C8X6nac4rD2sg13iEzWZrzhOndnNax7Y
	Cf4glCwG5Q7uP9aia1K0oi8zFyK7s/S2bFIPcZY5dlic7avb5V/7WIx5
X-Received: by 2002:a05:6000:18a2:b0:390:fbcf:56be with SMTP id ffacd0b85a97d-3a07a9bc256mr10352687f8f.0.1745938201994;
        Tue, 29 Apr 2025 07:50:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8bJ+W20QclbOqGXSh+aK6+noOl/oBWTrNXJb/+Wtj28GOcmxhHhpsJ6WYbQMsyfEw67MtkQ==
X-Received: by 2002:a05:6000:18a2:b0:390:fbcf:56be with SMTP id ffacd0b85a97d-3a07a9bc256mr10352669f8f.0.1745938201687;
        Tue, 29 Apr 2025 07:50:01 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbf04dsm14386612f8f.52.2025.04.29.07.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:50:01 -0700 (PDT)
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
Subject: [PATCH v4 1/4] arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label
Date: Tue, 29 Apr 2025 16:49:54 +0200
Message-ID: <20250429144957.2088284-2-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429144957.2088284-1-juerg.haefliger@canonical.com>
References: <20250416094236.312079-1-juerg.haefliger@canonical.com>
 <20250429144957.2088284-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a label to the sound node to make it easier to override from other
nodes.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index cd860a246c45..628e28299c3d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -174,7 +174,7 @@ linux,cma {
 		};
 	};
 
-	sound {
+	sound: sound {
 		compatible = "qcom,x1e80100-sndcard";
 		model = "X1E80100-HP-OMNIBOOK-X14";
 		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
-- 
2.43.0

