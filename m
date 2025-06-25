Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB32628689C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842719; cv=none; b=qqUo0uOvK1C6TAMSs90k9M+6iqwmR1WwNqPaHVMV0lBhEMBLzG/+MPnqFyuf4MnIRqudtXBZecB5XPkBNuCramKc5BX5kMyw7xrmJVBqJ9tn5hw0OeqLqtC7Lo/KYG4HILYOtSuuJ84L5ONyC4UsPvmPYYCNn6syT2Xt2ndq7LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842719; c=relaxed/simple;
	bh=SWoJLZ+dAwecor+TOe4oNtuJVNwOUsyqw0DV73+mFEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VH2z1+pGhOhor4+hw34tqFO77sYIr98EqXJFmssF7qYldSMY5xbBw73u8RYH64gco4n0f8kMpXIi7Afzvg1okjSKJiuJDdilI/r4vAWPk4G83/uBKMYs4sRMoOC/EwSaoHlF26lpex2zPAyZ3NPQSsJxDKRmKmDt2D0nc8nBicw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mSN83dh/; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mSN83dh/"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-addda47ebeaso280452066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842715; x=1751447515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iBfI+QaV8mcmTB/8Ck8ODfSXbqU1EYKGiuZpV5V0BI=;
        b=mSN83dh/ZB8opVl7VpPNbuCR5W+/1WplFus3g+Vd7snJb+hkkV5qS3QIIqC8Yf2RaM
         8zjPdS8+fB2dJOByOqBGJyAkYHA1z9mWDbjTquF8mgyFx8DzkDKFd85/LggsJ/6H4qGe
         8efqetQemeg/rxrdOUGNFChowA0eFMoFcXF3FZRWdFRdEniM3gAn9mKqpJzaaYO2qrfU
         Z22Ab7eRINTC18jl4wSWwEL6rWIdIG6eXmH4IN4aAwLdg9b8H5UdxB6BxRwwxPr/1yzi
         VA5NG14crqDeBBYlL0206EnXahw8zhQhi901Yctimy0n4GhE9pdH6wakAUtu4YP3nomr
         itXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842716; x=1751447516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iBfI+QaV8mcmTB/8Ck8ODfSXbqU1EYKGiuZpV5V0BI=;
        b=wrlAxOExnTkQSZiaEe7z0S88Akowa1chq8cSbEfQFAAmisf4k+TAVoR1J0+J8G9vJd
         FNTfSx/mcmDF0A6VSIE0Lievm7oy+hszSijqn0zG0cbyjw+QB4GbSsT/mhZpYkQ6q/DJ
         XJBlfbZG2OWeMWxzjUg7096AV/eCvR0y8UAVDLSJvUhOp8IU5HoyOI17mOeoix6f5GHZ
         oXXYafsSEsF2CsJK1edZ6e5vbWkZjl3mv3hpgqhPoDfVRzvY0LxRQjsSJVaJNwBbZVIM
         nFis3cXJMta1q7WZkkA4+qWHc9b3wevXNXUhQwBmEOwDkZS0S7twnIXTETYzgrE0i9mf
         lMJA==
X-Forwarded-Encrypted: i=1; AJvYcCUScbfVPqb4m6bi5uj0XOyk+PKmfJ/H2uXb5CUWO/zh779MnsDA/1yCv+7Brigv++OTknCRtJ5WYpoPXY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE6IfCpdZ9/d8xFi3G2lCDHMqHqheJqrngoS5VH6C0cxcIejL5
	Y2K5BAXMwJNKIpti2NQE0CLG44kLtIzT/GKpTF/5azGF6Mv4jLN77GQZLA0UGDKnRIyaRUYMAX/
	Z9opR
X-Gm-Gg: ASbGncs4db1tVqOkL63y7J3EVJrGj9Hq80jyfkEkigPLJJdyHK9qBxjQUsuWiElIYcp
	31RU0q2xnqpn1GwLhlzJ7DMWSAnlorne9e+QNP6ZacuMwG6M54DAP5w2HYpcIW/6uFgU4cyc9g3
	kMw3xio++zr7jcXjazjiB6FKhF4lDF9nDSsyBgOoZDY52fC/wTCmovh3iS3VpbCy5YzL7ysYZfl
	7cyxuDoaSc7HkcmdA1Ty9Op4/ttaRgY1q1lPgcJLLpbfb0Qjz7lrBzW3918qKJh3vMBqChLp+Zk
	CswJUzEvhYuMYAcQ/WjL4lD8sQEE787gw+ZiTRVpx8y2ODHuX1gQo6gSfhQAyGxpgx6bxfpYW/A
	mqSfCZF0G7fzxo+vwa3B9alUjp1YGonkQ
X-Google-Smtp-Source: AGHT+IEFCyamn8Gh1klBPLOdRYVvpND5wYQyMw6FuiMzvHciZFa+7Sb1ZsqIsd/lwHhws9e7uzTwQg==
X-Received: by 2002:a17:907:9808:b0:ae0:bf55:5c48 with SMTP id a640c23a62f3a-ae0bf55634bmr214177866b.7.1750842715569;
        Wed, 25 Jun 2025 02:11:55 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b39e0sm1007242866b.110.2025.06.25.02.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:11:55 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:11:46 +0200
Subject: [PATCH 3/3] soc: qcom: socinfo: Add PM7550 & PMIV0108 PMICs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-socinfo-v1-3-be09d5c697b8@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842713; l=683;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=SWoJLZ+dAwecor+TOe4oNtuJVNwOUsyqw0DV73+mFEA=;
 b=I5TbBGEVucxOuhvzyfNPjWUWZgL5WTKu3QEEsQZCI+ImKP+Ag1EMBeJ38SpPt23/7lQKYB99g
 Uf9LPEj34osDuaUNgdry8B4SIsRF5jDRfVKhU8qzqO5QUtNi4p6Ar6s
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PM7550 and PMIV0108 to the pmic_models array.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 57fc2760548aaf904cd1aefc7fd7e0f7bc269632..a094566f70d00dce3ab0f21638c36ec28b973543 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -126,8 +126,10 @@ static const char *const pmic_models[] = {
 	[72] = "PMR735D",
 	[73] = "PM8550",
 	[74] = "PMK8550",
+	[80] = "PM7550",
 	[82] = "PMC8380",
 	[83] = "SMB2360",
+	[91] = "PMIV0108",
 };
 
 struct socinfo_params {

-- 
2.50.0

