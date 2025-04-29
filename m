Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3C421ABA5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938718; cv=none; b=OOw/LPyDrDJZuUD1Tr42fCN+JaKTWJ6cej40M+bHQeF1wQz5bXgE/2nV0mqYTpAOlh9F4pN8BIwuu6qcDWz5bUo7iLAPn+NzF1MPCKqvQftNpRheDwVPDkEd1jpPPLPyPnCmITp08vABOdn9H3q63dhNbOc+DrcQbB01JgMfXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938718; c=relaxed/simple;
	bh=mLJ4Tf1nLPctiytSz/i6Dp2hGBk3jLHIc3ugqrFs2rU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRKECNUl1hUDIs7N/UXS6V/JkhuzC8hqnKa+cJ8rdWSTLd4zASMP2+md0PirP0pPDoTiR4PgNCKsTc2GsNrppKvH1qxXEFIUWOBefFZ3fN5W15ToYNr0OvleV0yuv4OPXTzdOx2v0Hm2JWbUQPIPEe5/4E4ABVuvMtJjANVJRtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=otZ8nR0Y; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="otZ8nR0Y"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0D74C3FB67
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745938205;
	bh=plG9gaqHpdJn3czPW5GlQNQARcLIZhVLphsTOud7Vpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=otZ8nR0YElZwiMZIc6kCOEWEYUUn+idDIyXrmRU73gSXA9x0gXUHy0yac6MYiJL8N
	 D8U5j1/Zowq9J7apJtOkyb5nWx9qEsyxohOdrxOOx4QAD8woodIu5qu8blazl3LTpW
	 Sf0xYd72nF1k4692V9BWwEOE83YWgWZS+pcb8uN9qvjj+SNlW0H9CwllXm1QUjzs0l
	 WP+9Yog7r30lfa1V3pHhMnzrcetojG0MCaHbnrwPV8M8VScBX4TtU4wYWPEJJtgWPG
	 4beVAraHjaMDk+LoATNnJasQ8vkHeZWBMmMCt9/2A6w7/Xa57iBAEqo/FBLrImyRg1
	 T7rUfns477Oww==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d08915f61so31990305e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938203; x=1746543003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plG9gaqHpdJn3czPW5GlQNQARcLIZhVLphsTOud7Vpg=;
        b=Qb0oOZ+xcu5AzddWX36E8J2PFmZHdtE0Y29RlFOGW8NKBAnh5jjSnyBgQQpPn0ElLx
         VEogv0iB63aD+cbVztx6WH/pSzpF3ZCwA0zevc2ej5u5egjlY8vHQEAoWZtTOaRGagRe
         CpBRLy6Q/jVVgBJu2OFZnLc5nkqSD6WvDUUOXltVQvIgu9yuyOB/uS748NKfQYdc8Wyi
         CZy0jIcuV3u1rOJeX3659d373eVmPLF6BTjAgkZt4tPoxZSMpJ9vW6xiyY7DOk3FESyq
         D6ty7izEhei/Pc33uryInPEKF03bGYj5jNx4D7n9LLM9Ngh5lX5sDJ9ow8B1DCeLXgmY
         WGiA==
X-Forwarded-Encrypted: i=1; AJvYcCWV96PrLLtan+FJTB7xIGkfjKvnfcU3HGTtf/yV9hSbFnLOtUrV60sB6RthN2loN8e68aA1ZGqpP35dSXE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr8MmgJ/4pvI4ElJLpOpQITfumi5FvGzngYgVp/tEE7mNW4ZLa
	tuqfzRgCeQyoG2zofJSIOFrLVVDmfsnKU/19qfBHuNVQtTPHOBinhyJmU3BH/+BC79h6sg+371y
	fvCUaZc45lQYxk3HudQT/R2YhjUCpiVzsrKbtBejJMO8ZVOzwz71HKx3fgemVoPRVT4ugRLcrj1
	0tUg==
X-Gm-Gg: ASbGnctjjaHIjDk8vSek+R8VJFxojO1v82+CQRW6RFVAnwBNT94kppLJyaEIQYxN9cq
	z/hJzs5oZXP6d1zK6JIJ0f/m8kNQIb3ptTmvxBoD/LcdOrxcOLh7CnU1LaOGV69nhIR2we8Hz0x
	UbAoR8E/CsO2cXVircr9i/E0afUjvkkJ+acQTfkMxIS5EkHRIC2IRgKOINLH0ywuPq5kN0jF5vP
	iKiUAIKgUUCEYuIEfrLikd5UdvzjcgLuX5o1rD5+opjdMbzvtF4EduZ+aL1UH6fzncrJlaWCAER
	9BuImWoW8WJvdsjY6uspTJXnmWQ8BjKQnJxXSfGUYzlQ+vG2uXdXs7n8
X-Received: by 2002:a05:6000:144b:b0:39c:1257:dba8 with SMTP id ffacd0b85a97d-3a0894a3d6fmr4260254f8f.56.1745938203187;
        Tue, 29 Apr 2025 07:50:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIgTZQXJNjcX76o91WQ3FEfXYAM88484X0I0w8saIfw95UbvI+Ec9HtfLO9iHMOealrvPvnQ==
X-Received: by 2002:a05:6000:144b:b0:39c:1257:dba8 with SMTP id ffacd0b85a97d-3a0894a3d6fmr4260235f8f.56.1745938202873;
        Tue, 29 Apr 2025 07:50:02 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c7d1sm14026852f8f.83.2025.04.29.07.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:50:02 -0700 (PDT)
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
Subject: [PATCH v4 2/4] dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
Date: Tue, 29 Apr 2025 16:49:55 +0200
Message-ID: <20250429144957.2088284-3-juerg.haefliger@canonical.com>
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

Add a compatible for the HP EliteBook Ultra G1q 14 inch Notebook AI PC.
The laptop is based on the Snapdragon X Elite (x1e80100) SoC.

PDF link: http://www8.hp.com/h20195/v2/GetDocument.aspx?docname=c08996392

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693ac1..67900d455ea7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1131,6 +1131,7 @@ properties:
           - enum:
               - asus,vivobook-s15
               - dell,xps13-9345
+              - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
               - lenovo,yoga-slim7x
               - microsoft,romulus13
-- 
2.43.0

