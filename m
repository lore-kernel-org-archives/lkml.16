Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325B52356DF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796570; cv=none; b=tj8mqtIPbi1RpgHL9w7Erzu8ycUdxZnHV973ctv21jEjarJEuzHpCf2KhG8TpOqYuK8LB+VOcV/AlHaxkaK9uIbDQZTW0/PV4DU6bHSj5XXdij2wSwOBNtkjkyxr4CmNI8sXVu/pyTv2GlqKrexj2G97qtVk52PxwlJ3x82R1ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796570; c=relaxed/simple;
	bh=joXhwY6sYcNm/tHWtZiox99xSvecyLlxL3fyWaP6GCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BuMEEB+1N1Y6qq+7BWnURZOF1x8Py1SI7q0l/NmPrp47bNAH3ED/G/pDMXjpgFa0JE4TP9fal9etaKwoX95atw92XehNsamQWiGu6VwuWcHDIbJ6XksF3weCJakGYsD2ecfueEz6k+oc9uYlfARAGIw/2aH6jqrFG8Ev1PYj2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=LmqeIDl8; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="LmqeIDl8"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0D3443F82B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744796562;
	bh=luxCLj+tQK4OIUVASojgpuBNRUz4uNC+3lDnRXiwNtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=LmqeIDl8YyFsf5iwBdUXXQGoiDeMK9ttDTVDE7S2Wup33Mb1B2AdRQYG5LSegn9da
	 iq69tqFz7PS6RvJuhJOekBfLjHEJ0cDEZcBXWBea3KI5stKx/SVaQAqufLcfih2BTL
	 5LA8r5+aTrPgKktFl0HA4+AiwlXrpKtErnK90AIJJhGNCfPwk/8sG3j0vVr3ypL+T9
	 AoGydQZ8WF5T5EqmYWUzlqZqrpNrY8vsM9M30pjH/XRwJh0jsZYwKYxAZiuh9TpRUu
	 XIkVLp/UQqFMpASfWo8J8dEUMsG/Fvr+92c1ZT1Foa9vAYFda32UyaDLSZEYXhiOdj
	 FLrhuPa5Marzw==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac2db121f95so514853266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796560; x=1745401360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luxCLj+tQK4OIUVASojgpuBNRUz4uNC+3lDnRXiwNtk=;
        b=qtN5FPeBENM7saWw1u1HYDtlSZwg37tE2LGcNAdrD1BQGIeS35sPCMnJlWvwmlUhDq
         +kPz+F47uHCnaxwkSusVhG9rRbeIaw9K546gTUMnnTyPTnkf7dDr8hQonzrTL50Q77l9
         awcNgufKnKdWFyNz3thQ4kVMt0xn/jg4fLwdltBSH8mnfQsTxTA3jbYloL9N3l5FSzfp
         E3OhM2lGUDtdwCzDiclnjSMqIWjcWTDy3L9xUA4BiTKxqUcyGaP/78J7zMtEL4j3y67D
         vG42IdBwP/9p2fTpCE4AuX4+8tV9dGgemZVasGD6FLB6gddcFteYM31NeajOUwniQrlS
         6PZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/eJSMkWm2obH8uQ3qU45pgbhNC4CRFjiZbXucqL75iVkb6XUdatCOJR//NFeFydwgv46C2/xTPHgRzrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtD/QOdm5ajHeUddAHYYmHK+1hkmFt8MTeiXtG0HvW40RBr+iU
	jzsWDejVQRnBcpej9IAlHfJO2JSlJKQLXOnZqtYeckQFsVCOc/HMWX0V+ezDDp1yqhYoX4/dHH0
	ntQSulGaMWUp8YKTijURho7IH2+drguF6vAtgHSMAbWVU6WsSN+O7QMF1eu62+0D9vb8SXqpIrR
	Bqcw==
X-Gm-Gg: ASbGnctvFVQUeOxbVaF9UCxuQB8oNvbKavFeIb7Rd8/U1BlII6t+3czvSGNURux3QDl
	6D1YR66u4A5UGu0EBms7pgbn9KfFziHWbFMXprv1rNOkPjpAuOtJFYyOgujlyAaMpqyoZSCpTPC
	oZ2iqVbxy6A5pNhMCB9OHSNN8mcbeGMXY/7lznlumi7iI2DguLWWYWCPK3b81TOdUmUPpu8RcMb
	YyfL5ETrW57XUF0u54Xt7W9B3g91Gcskucos2kwb/biTCxHrwnIhO3gn4d2Qv6X19eWe36W9vzS
	ERe/fZKsJwJdDGGb42pQo3lB0wssFcYHwREv4klEvr05Tl4ReGuFjAdj
X-Received: by 2002:a17:907:3cd5:b0:ac2:c06:ad9d with SMTP id a640c23a62f3a-acb428f9f8bmr84151966b.14.1744796560254;
        Wed, 16 Apr 2025 02:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGloZCVTcizStQEncptXd4CPcpgv6Q7I71rXkznCplkatmt7MFtPBthKWOn58dpevVzm4CyJQ==
X-Received: by 2002:a17:907:3cd5:b0:ac2:c06:ad9d with SMTP id a640c23a62f3a-acb428f9f8bmr84149266b.14.1744796559891;
        Wed, 16 Apr 2025 02:42:39 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd629absm93643366b.3.2025.04.16.02.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:42:39 -0700 (PDT)
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
Subject: [PATCH v3 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label and pull out the model
Date: Wed, 16 Apr 2025 11:42:34 +0200
Message-ID: <20250416094236.312079-2-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416094236.312079-1-juerg.haefliger@canonical.com>
References: <20250408145252.581060-1-juerg.haefliger@canonical.com>
 <20250416094236.312079-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a label to the sound node and pull out the model name to make it
explicit and easier to override it from other nodes.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index cd860a246c45..9595ced8b2cc 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -174,9 +174,8 @@ linux,cma {
 		};
 	};
 
-	sound {
+	sound: sound {
 		compatible = "qcom,x1e80100-sndcard";
-		model = "X1E80100-HP-OMNIBOOK-X14";
 		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA WSA_SPK2 OUT",
 				"IN1_HPHL", "HPHL_OUT",
@@ -1691,3 +1690,7 @@ &usb_mp_qmpphy0 {
 
 	status = "okay";
 };
+
+&sound {
+	model = "X1E80100-HP-OMNIBOOK-X14";
+};
-- 
2.43.0

