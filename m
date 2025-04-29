Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84277219A7E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938226; cv=none; b=ZLzytEfK6Dr7nh0Z8rKXRCgNTjsMeMK/Qr1ZZ0h2re9TVzKl6X3qv+RLhU1FTkolZ55C5FmCFlSjS+dGHDOQgnwJaEW2nzo1OkuLrVq1rIGYirrgfPNIg4z0E6RgBKgCVCALogKLZQS5LrsmzUdWrldngu9x1zdA47ySTRAwKuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938226; c=relaxed/simple;
	bh=L3zpgU519v8FVSiC0s2Bs8xmKn3xEU74xngr5HHW3/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2uwiuzLav1UFhNECwpkvtEonyDfiNdgeFQKDdP086IAJrPN7rcpobPqXgvRmF9I6OcHBDHkkmD+pXr4BGLmNs9dqWjnlXpz1ErNtGiDtVgi9+S6kxfx9odyzPDURMfwMka6De2gCG5wb09yV8z6vINbl4qUPOr0uNa7tT2VvxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=J326hT9C; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="J326hT9C"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 038643F74A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745938211;
	bh=RSy77QzrzSmmFSEMn2500QmRFAOtgtgt9hqimIHbc+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=J326hT9CM2WFXr4cB7fo8gbKCqoS7SOEQnTm+rT4qBgerJIEf2WMlRxzMLlLSdAt4
	 3UAL12JZUX9CvMXTSUIxPMJEs7uBcshLWRNJMnZ4sm3bSf21KfjZrbHRJwqxPEGoqw
	 gtfRwqbYwPDob43sRPP8OvHZ5HThF6Z7qqeX+XjBAnkkfRC9/9cEcyzxGlcgmyYPQL
	 AMLkYmsKMoJemxHZmq+X4mG17Goqu0xQ25rqdKK9hWzRN7ClvGyyNVgjloIdSEIkdR
	 v+LE/4FX3rQyfW4H6MwzaFo6o/azuktXazbWZH61vIfxewAtcpvnXQlg5IlAHEQMTO
	 0Q9u2NkqMBNDg==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so26784405e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938205; x=1746543005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSy77QzrzSmmFSEMn2500QmRFAOtgtgt9hqimIHbc+k=;
        b=nJzr0dInGNojwfFGcxNi/5k+yqH99vbn5+3BQLMYJU4FFGmz3yz9vgXAWXIM1vqb+/
         iMfYfg8y5ej/hMzUElRcDEPcUU/6iZwh34GHfyhberNM+le2FHLrTxzieF36gKPFVOu+
         fXN050rv9RIF7og9JLQig1wQi7cD4QZSTRUaEDo1jM3Rln/aZXE15ZMQLR4QM+yrgwIF
         /NBmWi0JH0i4nz9s2GSH66Wkn53H6EWA/rqxrPEJtF4YVl3iU9UZhag1mgbkjr11bQvf
         JF2/Re7ikobr/GWrlwAc0lb6AHlB6lDAleUBKm2KLaoNjlmRvmIg7XnE0C3ThG9prXns
         OwUg==
X-Forwarded-Encrypted: i=1; AJvYcCUIXdgvodkl2ffAHIfcSGSzIuK2OqE5naUIBM2R59vN0uBkV9YsvlLg9KIziOFecRcSjszG33zMyJDAD0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzREL+3fDPSHDnjlSRC0G5Gv+ooG7NUHkxxkcsGmGbrzq6tzkfg
	NiCmRdhvNrxJdrt4yuuDa2kpovq0lmrXDclBSkTjZu51lzZGJOb+oVcTqifCPb6k91xZJcaspPJ
	55bwruGxyY2an8LAPEHNw5kdQTayfipMGT9UQ2J9FJ+jG936F9vM2NJEB9TG6GNmmhtitQMiCt/
	Bq6g==
X-Gm-Gg: ASbGnctyrjDpSD0LA8VF272TvpMCkAeyiW3C0IhQj9j2UwSsbwGRsRFg3nTzCPEOVtW
	a8kmgdkgnDOKMwfcHX4DGjjq8OdGMFKWi16kMvEgnckI4SNRY2qvgrPQuUA4S8t2UDqIQ27Pvmz
	Wk2UVe1KRYUAHT+uec7rcAafBRJM/eiNNMf0pWmu2ex19V/At2gDcg72oSczCo5EslANWd6HiLd
	sjK63iOeNJVkYArEQiNxXaN5f8Qv3F2Y+B17aE4p2T0X5Ki9DDhgzs+dYBDnXNoPYqUyslpiTql
	nmYHoU9DB0ujuoW84XbfLAswvPb2L5yz4eBGItAsrGMUWhB7aunsWmqy
X-Received: by 2002:a05:600c:5108:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-441ad3a0c7amr26386855e9.6.1745938205616;
        Tue, 29 Apr 2025 07:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBNLMGGQmzZ+4zNN01rof2/5j+W5PiK8ohD3ubXhioaoE87XpvqLSxiAYvqj+ZGGSHoStcVg==
X-Received: by 2002:a05:600c:5108:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-441ad3a0c7amr26386605e9.6.1745938205274;
        Tue, 29 Apr 2025 07:50:05 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8479sm197378085e9.29.2025.04.29.07.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:50:04 -0700 (PDT)
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
Subject: [PATCH v4 4/4] firmware: qcom: scm: Allow QSEECOM for HP EliteBook Ultra G1q
Date: Tue, 29 Apr 2025 16:49:57 +0200
Message-ID: <20250429144957.2088284-5-juerg.haefliger@canonical.com>
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

This is required to get access to efivars and uefi boot loader support.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..e7262ad11509 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1987,6 +1987,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "dell,xps13-9345" },
+	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
-- 
2.43.0

