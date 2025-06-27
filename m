Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844FA21ADC7
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007358; cv=none; b=B1ozMjkaQIpYF4OfsEz1+NHcmZXxBvD43+XffoHkUhbu27Nv/0hvcyl5sODZ7RgeKfEjFDOi1B23FX5Gxi/Jqp964+rRkM+sbC5yIOOB1McchJ1F62FA06CG9pfh2Ya5mtMwjW0Ke/UujfPrsQg4NZ28tAuKhV//lB6bpDq9te8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007358; c=relaxed/simple;
	bh=oOIuTJMRb0YMubjUsJfR9YcWEnX+5aqOzDJkj3ZCXE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oGzRRdvcBXW0V/0WUEL/X/DMuTwrSaFhGlozCL2/ecJkuWdTGh1Xkdpd7C4JtVPFigPm4XVw6urazo6gYdEeYxA9uJvWbAoyaHd/O/D/LOqa6Z9I0d/ya5uLcN8L74Lz06oflbFq4QzZjJd/IdL4m45OfN6VHPflUX/QJR+pZO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=09SPKUks; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="09SPKUks"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so3744656a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751007355; x=1751612155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBOviIonU2lITgy652KdEgd8lTXgMBH5rkot3Hkt9aI=;
        b=09SPKUkspNXBT0/Qu78+/i1LGpGbBNPS56FiSeig9+6M/ONyN/CiBgkQmKG5aq1JkH
         soms0RA9LCPMmFqYUzB8XGv/dEjn24VQqBXZYpWsssNKst2zTWVndWH4zKQo4TzXxzic
         2idm58kNqXZwq6vA2SQE7C28lghJ1lnx3im0zXXwrmX0OaKgmkhJVrOUXQdB7amzvlf0
         Z9WbgyQIhLDPbGKPJW5+gJ0kkCQT0qDvkk0jpkTu7x940MmlmndWtuyYx2B/9e0ReAMT
         rs+b+RE7ib1fyjY7fjXWCg6tcIC12I7h6pNXzJ57wQWLDvvQkrrwu9sgrKqQhvz3w5tw
         x0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007355; x=1751612155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBOviIonU2lITgy652KdEgd8lTXgMBH5rkot3Hkt9aI=;
        b=i0mkEVOp3mJeUFbGqYHdq2ANEo0LD8hwFJATQ8L6BMXY88cViilGn/p85b4fs2EShV
         zbNWBlBkkMrl6SCK5tPvE9tGlPc2utEFUON+bszs9LsCUnicUi4WqRGWFNLBYZqgYbQZ
         0wr89Svpb4/iwWWDylGIFuFoRWaJ3vWIcHuWygn8vyLEioCIBb5FMSaK5YrpuWeyhiUe
         +yb4g26+TrDArP+eWwr4aZjOm7FW15OxyZnwfmhBFwNpbtqQVeakWpqAWK0HPm17G+HJ
         q5OtvwFbNCf07nww6Liq4FMH+/ImAVsTtKGM46ZAW+phVeNbrlE0+XJYYWC3Kdeoi/gN
         U6nA==
X-Forwarded-Encrypted: i=1; AJvYcCUuCxcMoq3IIuHdiQiu1FTpT7udFN7lqV2FHRjL8jXefz1RnJTuXm7o48cQfis2pBcklh4OSa2o2keTc3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyYbJZJsD8jA8YqbnN3zoouGmQnBzPMew3krXD3Lijh94EFMx6
	lkFlyiTUnlqvIdxJeGHM1SQ40CL9WtjhQOzGaLH6xKPzIoCHXUtBdsfmfEtm8ugffDY=
X-Gm-Gg: ASbGnctCHv2R2vXdOfi8U8ie2FOJI5Jn1uqND0yce1iiFxerR6BiQbY97ytOMge+/Nz
	dH88wjdxvdaiLODLn7vybkXnl5Kfvl+suaNboG/zUM2vO/Nw0UwV11yrYgGzPaQQK7eiSNAOgIZ
	4NXp76ok2yBn2phadWS8gvH74tBIGptj5LVojrhrPelWAkMOw567UjdJwpzcn+BsGuorqxDfRuu
	P5NgqlRrzCcXVxRoPDl7nVQLcyl+bABJeBRQF8WKjipn3A7J//J45KRwxSx5es5DKb83EWOt0lo
	/j0PgtcPf1Xceiq3mDcRBYKVYLtlhtOCAZmpOvHWbxRY0xeZBD7InQPI9HGwG7ibFDr7YnWu6rW
	Jza5E1qpWefmIhqQkidDNLXcRKZffG4YW
X-Google-Smtp-Source: AGHT+IFGnLfo22ELjjcAK4w8b4ljk/CZho6pqmclzKrpjk42T/BhElY+hSsc+HlDNzqqsdjpUL7YVA==
X-Received: by 2002:a05:6402:1d51:b0:609:a4af:ae8 with SMTP id 4fb4d7f45d1cf-60c88f51293mr1316071a12.11.1751007354710;
        Thu, 26 Jun 2025 23:55:54 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290ffb4sm1019451a12.36.2025.06.26.23.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:55:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Jun 2025 08:55:44 +0200
Subject: [PATCH v2 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm7635-remoteprocs-v2-3-0fa518f8bf6d@fairphone.com>
References: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
In-Reply-To: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751007352; l=2007;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=oOIuTJMRb0YMubjUsJfR9YcWEnX+5aqOzDJkj3ZCXE8=;
 b=xVwwM8B9U8VVer6PUxh2O/3ppUY+AaXZX9FL/sF1FNF+infDsSrbmSgOSRVkLm/xf1p5As2i4
 edAa83UViWmALTxdeijebXhWBaSVYKdmdXpqvBu0cHkDH427lgk1qcX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
WPSS.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b306f223127c452f8f2d85aa0fc98db2d684feae..908a9c3d3a115dd1b561a899a36a15cc79616450 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1261,6 +1261,26 @@ static const struct adsp_data sdx55_mpss_resource = {
 	.ssctl_id = 0x22,
 };
 
+static const struct adsp_data sm7635_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
 static const struct adsp_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1478,6 +1498,10 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
+	{ .compatible = "qcom,sm7635-adsp-pas", .data = &sm8550_adsp_resource},
+	{ .compatible = "qcom,sm7635-cdsp-pas", .data = &sm7635_cdsp_resource},
+	{ .compatible = "qcom,sm7635-mpss-pas", .data = &sm8450_mpss_resource},
+	{ .compatible = "qcom,sm7635-wpss-pas", .data = &sc7280_wpss_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},

-- 
2.50.0

