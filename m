Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371F42376FD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796573; cv=none; b=QoQAXIXPcPgZUpATuLzextqT2Zl9bP/X+0bFXvJvlgfu+9yJg2JRxDpI9RJ9/WEpVj2SCQNynZw8k5TcIkYXQ13L1cL+fmz9em7nHkB9sd4qiM8ti2MVSw/QGxGgAz3CaB4dchsycHXJoAFMkxH9fxRl5H7xGhXoG9j0i7tK2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796573; c=relaxed/simple;
	bh=mLJ4Tf1nLPctiytSz/i6Dp2hGBk3jLHIc3ugqrFs2rU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfAfgyHPSAVTjsDPlKNG28zFJh2Yxj84y9vdgyMLzRYuGyYQJeLbbxxWU1PErlLWwB79p+AVqsZpgqQ+0P59yhzLb9DLiL38MMYSiIR7JXNha3drS9/OsVDHb1HFR3AOPqkiceY47QMAoKcQvP4nAuoYYVeTYutL+vzvXQQCSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=X2QZPGuq; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="X2QZPGuq"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A33853FE24
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744796564;
	bh=plG9gaqHpdJn3czPW5GlQNQARcLIZhVLphsTOud7Vpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=X2QZPGuqhnOXjKNgsHq47K3NBQi2RjpL9GqPVidDMmxxgyuzJ6+knIk9ZU5X8BSOC
	 eWTfP8ZH1tGQBM2XcRm/wX2GaRMTIRqMCYOiU2vvmL67S7OEA2qTXeijvkB354m2tQ
	 ysLVpxvuQHIx9eLOIWN0a4ojOBruJ3gh1/1gWN5rrp/eFHNK/Nty2NN+XB6+bkiFUt
	 pfOqdNspexzqIiVGWaTOo+nUs7gdw2vM13dnB8wuXzwziMTyhtgLlAUKfu2EF15YOB
	 Jd3b4XEDW33P9H4oyX8rhEI3a3xotFN3k9wwljwZIFgpnXatDWPi3e6Xs3kf61aB47
	 UPhCj37+C7DhA==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac2a113c5d8so489555266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796561; x=1745401361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plG9gaqHpdJn3czPW5GlQNQARcLIZhVLphsTOud7Vpg=;
        b=qc2w+LoE0cxzW/UN2HXlvWEj+pJ6cNG2CDiRFoqqb88W6LrNoaej2QzJrjoiRifL6b
         A1JVytT0kJDvgkPWk4FtmdMLePJY8tPMYdvZYDkuqCzRhO1sIEXH5cMi4HYtVnmVSKsf
         x9Ffy8NSTsj69homOPcOhum0sMGsOtAez6P9OBAZi7CBNGs3G1YoDZTyM3pXWEzb51wn
         /8MRTUWhrXlmBcPXsPmi+yGDKScxdgekIh8TOlhfWb1bbfkvOjeBgF7CFVLSy23SCX9H
         LSmtGksjALAv8b0l5nPX9BCYunqypC88tYaGlh4amYI6mZUHNHkbBx+ta4NogRdwk9e3
         GrEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmMSiAIh8r99r1oXKhmnTuZAu6lNHQO8ob91Xhql9vxsHXmodLOZiyhmPEb7L36dwzuyxGWtd2GUJHVTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD02rqBEQgvDtwRWulLw4pvpSwO6m5YXultMDZK2s3DJAWOmDi
	H8XleixfMGV97ALrx8LwD7tTp00ifZzSfBJlY6IPiCTLLqLnCOMvvwPe4olIivRwHe3ueL4HJzm
	F8AIVIg7tZ80eodr93FF3uQvxUJCfi85w0UhPCtvX1s8LPFKYEg/T5ltYAlaxAeXuBvQCDDb/DH
	6iNw==
X-Gm-Gg: ASbGncsG9ijmn2kqrtgInMbMSRtiH8jrHu5v7nmejCmmhmegPcFrykm6wRtuSGJ0w1b
	r0BhSmhbSVWouz7HKnHejEdqtAqppiW73qAuCoSoktu7YXqOFf5srSBQXQTy6J4M12+3yKBZlfz
	uHfXBaD70AkbTAtipSzyC/bp0pLOFGA61NtoESzJMnjbtHL3vJBfAEiggr42nNajKdLXiy9/uuG
	FUYDWF1hoovV9qIMTsrUCx9EIoL0x3mnfk8oV4eBzhtd0zocKh3rf1uz1iOl5fLEyVusP6MTl+B
	nOaN5EG9m6AgltLg7/awUSsM+o58cboxLUlQycQJegtoUGNiR9IcxbI5
X-Received: by 2002:a17:907:3d0b:b0:ac7:16eb:8499 with SMTP id a640c23a62f3a-acb428748c4mr105923066b.5.1744796561542;
        Wed, 16 Apr 2025 02:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9eIbYj6AhANLL1nV9484szDS+uCNlV5sHee5tSc3JZlwU/uZvqyMAHl3VAItGwPHQOkHUEA==
X-Received: by 2002:a17:907:3d0b:b0:ac7:16eb:8499 with SMTP id a640c23a62f3a-acb428748c4mr105920466b.5.1744796561124;
        Wed, 16 Apr 2025 02:42:41 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd62256sm96378666b.11.2025.04.16.02.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:42:40 -0700 (PDT)
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
Subject: [PATCH v3 2/3] dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
Date: Wed, 16 Apr 2025 11:42:35 +0200
Message-ID: <20250416094236.312079-3-juerg.haefliger@canonical.com>
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

