Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5376128850D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842719; cv=none; b=qDtkJBNjnQo91L1kMSPVdnEawarYUeF/Api6DkCt2sZfaEg75NhNFR0kS2tps3mDNnIOUs1NFPU8rFvmWH2j3rgt8YzJRtLwRE/sydhyIhCn1NOi8aL2znATHpIJNlGsEpYNfAN1SxDtbrq8cuqh3Hh3RoJOowFGyYVXicl1SYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842719; c=relaxed/simple;
	bh=Iigpdc/tCJuVohRUA8ySz3mfZZWe7dIVNCG3Tt1opYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVb+ZF0NyzApuJNNOo1v0/nj4uoZC6p4MVNP+p26AWnvugQgxu5OdG6LF4CRB1sbSYYo761eHCCssNlYg9C26mrHASitDExgmmpaYLBUmlChbVcBUK0FmDOYeBsEeSgweOMkGB4VvR95Wh2Daqs+zql00wQfik5gF/D2/3aTN2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=u9DTNEB0; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="u9DTNEB0"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad1b94382b8so267740066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842715; x=1751447515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8lEqlXoh/YqXxCM9IWOmHLzm91gjjKkY+bCj70R93c=;
        b=u9DTNEB01XQeiMd3bnAOgfyXr5G1j3vmrHD1pa424kwXWHtpq94WY22eUK+zo1XOCi
         y6fwa3hWVUZHaMhhGd1NjYjLcYC4MRJXmtWTGYGz4eGwvkY9nzeOAZqFjijY3RpDV7T9
         7mRSG8SK7+pCjk1LE3vwVzAHxHKYIrCCE+GBlVzRSMq9izJ8FeAw5UCCIAKReOkOGD5m
         g5NoQNA7v3IoONTh+WY7fsZolukLDHAzoGPEdk4hRPUHx+i2XxdDZoq/3dA4gN2oPtgg
         DkO70KhnbF8YBu+mPkr2TOQw7BrxuJh7S4Lv3B7sOMmz1w/PBjQtItvnTZVJ7RxI5Aeb
         CLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842715; x=1751447515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8lEqlXoh/YqXxCM9IWOmHLzm91gjjKkY+bCj70R93c=;
        b=EdciuTM3Cwb8UZ9HJUs+Kg+5t7tRd9InzstSGGCuN18kok0zYhywmOoBEkUpV7KoEm
         Lh+U2F7JT3BTPwh3LkJcUirA4iJ8yzT0uAGFp2qMBS49IBk10m+1+w+SO/6/CWfw0AYZ
         KtpUvX4A8oy7Z7em7yotDu5iFB2IF1M03wEArkN/pYR46gTgq5sLwpMXNOY4LE+gTWYK
         chgu4LNfSArIH4DoK/EEBzhOyv1GUAOKozfeHBqQR3WL+AAjToXC0IhE3nPFaBCRBMWq
         jazUchkeLp7hnRTZtdTIwO8uVQ4nRFhTdpB48neJ7hGRMySXQrhoCgPd4/XCxcqozQO4
         OErg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ//8Tnz5IMKC1CtAyGFncN83AlyOtG5iWexgv8lv+MEgHCMgp2SUAys+qNen1kge4ToB+KcBX/x/laoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YybA0E2BdYY0pkmd8SkVpcTTAjZ0S5P/OVE+YdU+rj7iO5kwz91
	0sahCMvRUOVyGh6035xa6aGQGEX/KZaRMJTVFKVY/Vo9zJQ4a7Yb7RdqaCNnZ99Rf2hpT2B2gPs
	iAhsk
X-Gm-Gg: ASbGncsBt6KZAyeUi6X37XIg6fhWuCc25fAnFXaIgrVDYWMeTHFHzYN/QQCfmjjAw0e
	O4reA7kYe2S6SDGwf1eKNrDWuOuRR5SQFmHs4131m8jhIvBTTK+gSsuMy7Mc9kqAAmO2vl0EfkP
	ClwNYFPSuoilm1gXk7yidFPVuI/mtygHT2+V437HOEZyQra38sjyll/VKzpAvXu9SnrdzmeIzPB
	FKt05+hV8YiPOcjx431Sma1H7srpeQ4ke5OQICDF6effLXmN/GZqA1R1CqQse5qSSEQFs1U/twQ
	cL2mrOVtsIHfM+rhYc+cFZAZEZ4zc64NkQN9QFYoa6Pc3bQldQiM2HzWuMv2NXfy3q8/i3nSIhK
	ljCsOkZm3Q1sq+BUzc9sqRe3c+IOV+hwv
X-Google-Smtp-Source: AGHT+IEtAez6hslClI3t3PJMywyhPPwPf4hwAiXNbFuMbeEiyxoop4oMEzKcsOf/OlLn1pFY+NVpBw==
X-Received: by 2002:a17:906:7308:b0:ade:9fb:b07d with SMTP id a640c23a62f3a-ae0be7fe523mr236784566b.4.1750842714978;
        Wed, 25 Jun 2025 02:11:54 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b39e0sm1007242866b.110.2025.06.25.02.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:11:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:11:45 +0200
Subject: [PATCH 2/3] soc: qcom: socinfo: Add SoC IDs for SM7635 family
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-socinfo-v1-2-be09d5c697b8@fairphone.com>
References: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
In-Reply-To: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842713; l=946;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Iigpdc/tCJuVohRUA8ySz3mfZZWe7dIVNCG3Tt1opYs=;
 b=L6LzoH7ksRyDyDYz/QR9t1Ln9NVgD5OQLZSsNo0p1zxqCw3P13BcJbgiyHJq9fNYUey2oVvTr
 wKc7R3IbVmnDevggW+FOaU5g6B+Vvnvzbmlw/+cOY4Uf5xw9qw0MxxW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the entries for the 'volcano' family, namely SM7635, SM6650,
SM6650P, QCM6690 and QCS6690.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/socinfo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8c4147737c35e3878db2def47f34c03ffc1fea52..57fc2760548aaf904cd1aefc7fd7e0f7bc269632 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -446,8 +446,13 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCM8550) },
 	{ qcom_board_id(SM8750)  },
 	{ qcom_board_id(IPQ5300) },
+	{ qcom_board_id(SM7635) },
+	{ qcom_board_id(SM6650) },
+	{ qcom_board_id(SM6650P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
+	{ qcom_board_id(QCM6690) },
+	{ qcom_board_id(QCS6690) },
 	{ qcom_board_id(IPQ5404) },
 	{ qcom_board_id(QCS9100) },
 	{ qcom_board_id(QCS8300) },

-- 
2.50.0

