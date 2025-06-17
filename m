Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB4F293C6E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151239; cv=none; b=jr3Y9ikO0yvUkwvZ08zAcxqOP1VPa42M9Pxg1zh3F79TQEmWGk+X5NlLLz1vYkU+MwSR4Qjapa5GkGlBKa5t/QW3+KbsVdi0pRm2zeHguTo2PokcJIcQfwBtAu2b/KXmfI6Ny4ZjxLetELzxCY25wMDj56L87KrdaNuEcXdPh2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151239; c=relaxed/simple;
	bh=I+wt0YP4rxgHnKOC40/aM4YftA0E1MwAjBk+q7eSAFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D32a9PxNVlxih/mtwneoug912WHsr7WoBNiMHpBUBZIquSas0gIzcoqy81QOV7L6ffzivj7jEzIjo+/XxFKCPy23XtQs59vNTvlRVkKCZVNx4ujGSuR40kOhHMhBiM2FoAY757hg9qqUgAWlWNEZbQyURCeZZvI/1FgjvQ/wdwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFsRawMu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFsRawMu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6OasV014810
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pC+/Jc/xnvj
	uhS/vhXW0LK87Vtyf3CLSWvcyQpqNldk=; b=IFsRawMu58dMwT/uAZjGcZnfzqg
	hq3bfIUs6UWgVcW4biNKvPCtTskkifaV+0iJ8zK9JzDZ24v2JL2fkUrT3d+qt2+4
	u1GrsWbn7InCpjsrH0iWiorIAspSJkyYZK0aTPPBGa9cdzTI/M9Qvsvo1lF14LOZ
	iwxkNozNhTC8LqTh3Mo6Zv3QdfN3lFsP4y1TImIYK47oaViVCjznvMw+Z7cYeMDG
	IxShuK7wvCNaq3elMPDKeDwWiYiE7BGBRC8YUZThQKct5agzkgkYX7Y4TD6DV5nC
	LT8e6Sg18OKTrWduYCEspVeELNenTdhn6qur0l+p5I3GUHGu0EMgSNWhjwQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enfm0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311ef4fb5eeso4446704a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151236; x=1750756036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pC+/Jc/xnvjuhS/vhXW0LK87Vtyf3CLSWvcyQpqNldk=;
        b=UddZvJA+ogrfs81WXmdrKPeLxE7OQ7A0RLhxHo3GmADYZ8YULzRgGR776UrAdbChsd
         X7ZFnVv/Lxiu5timzKb12NsnSHhOwf+k76BhdCX0MFbTv9rQZ5asclbOmh8SY/yVj+Lz
         7H8t+YYGS79BIBDNadzIwAlbeMCozTtMrZngtT6x7BtQ6COILOzSTim+izng1fydA3xj
         8KIzTZo+NDKnJqhSaWq0BiVmuDTJ6aiBBt6mplUCdu4iUy7SHzIj56NLlT8nOsyA+asR
         bzhlpNix61OzJkq+8KH5Pdjs2/HYSLNMcVCJJWJZPQ7hHByMXe7asnTRA+3/Ti1VzjJS
         cWdw==
X-Forwarded-Encrypted: i=1; AJvYcCUBD03FoBkk4fekbRfbSf4OLQnjUBdU6a4smEGsdvhCiG8C0Z61/zmvvORKm0YDP3jfgIsZRS1oIDnl3R4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzypYd65vcpa4o8wO/6RxxnEEXDgLrfSsEao3mOfQgZGOXTyXTQ
	SvN/IO/+uUDvB908uGYiJcfiG3XNOHUsVQO+teyS5hekFk4kpnzMDinamjJvG2iwphWUlhk4m5C
	drD9vEqpZRMvpP5e5U8/J+gj7QWHwhLiIpMU/BJ885cXgVQEVULnwrWfeaDntZnNohEg=
X-Gm-Gg: ASbGnctH1hdGoGK5M7WQX8nSyxO/vjMPRz07jpJo8ex73DP6jvzYLNZ5Jd+JJuvlcoX
	NzU+XHoWCOaYNvCcIzmXT5JUlScma2SaW3U+VqYTMlGYkdlOqloIPX74uuxUGf761GjhzIUkESF
	yOQLn74FFYmoIexKXseSpLhGB8K1BxwmneuLDjpM+SnQeqskzggiIpCi4RCO0GYx+Qvf+uyzuIJ
	f11MVfpd7pgrW9K624bAhxHgt0Ltv0H+wOnPST9eW1V5lAo2BpgDDTmfSXLcTFzFR2Wu1xQIOlU
	Ys2aQJuSCyTYOsjAL85fnrS+Rr5FpVEF7AZCZFDu+M7IDKHABqufquHz2JsdnQ==
X-Received: by 2002:a17:90a:e7c6:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-313f1be18c8mr19885655a91.1.1750151235683;
        Tue, 17 Jun 2025 02:07:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYtJl9iERnvAsYVcp7IsNfFfm03vWEkJgaCuPvHhgljsPO4XBA+fuCm40CFdv2tSyTdm0tsw==
X-Received: by 2002:a17:90a:e7c6:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-313f1be18c8mr19885615a91.1.1750151235176;
        Tue, 17 Jun 2025 02:07:15 -0700 (PDT)
Received: from cb9a88ed5d41.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bdb39bsm10017370a91.20.2025.06.17.02.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:07:14 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Mike Tiption <mdtipton@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] interconnect: qcom: Add EPSS L3 support on QCS8300 SoC
Date: Tue, 17 Jun 2025 09:06:50 +0000
Message-ID: <20250617090651.55-3-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
References: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P4mIMSgOKKTzZzXkeMpcxWrgQL7Wozwk
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=68513045 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=jqyGqifOumdqABPgMEcA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: P4mIMSgOKKTzZzXkeMpcxWrgQL7Wozwk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MyBTYWx0ZWRfX9wd7VBkp4Q9W
 h0uL50NCLxSGCQvpzIJG5JKi9KSj/KOSZ44vr2hvbT7yh4mjdE0EJEnA776iIWREMckGy7ZbWa0
 TzXhZRmt1KnvHUZlJvmMk4/0b6dewr5IZFAg3mX4TGdJb544LNMhuO6MU28zqZPumnOblCjPbdO
 cqU7FqMi+29BXQh5w19J72+62v6IvycIRw62kRpQ7NLvydDfQwfC/Y2ILBPkiBBXs2EUp1vcmvW
 mPpp80V2gE15L2Ew533me12kw6aXPKb0Isu8QlSASdlUZsyGSTXdInVHcllfkIQaywxdDwX51VH
 xcIqjePs3CMn8ZxVBtRVXSvh15vdbuZlyeCBGjcrkiWfiHb3WZ8kBG7e+1qXRyTLUI8bQWirgdj
 Gi105GyFYcP+1vLRKLggu4IAbfdNO8B4NcjByDpsoTCF0HTfPZPcGS/wIxo9uaG3s8fR4Oj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170073

Add Epoch Subsystem (EPSS) L3 interconnect provider support on
QCS8300 SoC.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 drivers/interconnect/qcom/osm-l3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
index baecbf2533f7..d8f1e0a4617b 100644
--- a/drivers/interconnect/qcom/osm-l3.c
+++ b/drivers/interconnect/qcom/osm-l3.c
@@ -270,6 +270,7 @@ static const struct of_device_id osm_l3_of_match[] = {
 	{ .compatible = "qcom,sm8150-osm-l3", .data = &osm_l3 },
 	{ .compatible = "qcom,sc8180x-osm-l3", .data = &osm_l3 },
 	{ .compatible = "qcom,sm8250-epss-l3", .data = &epss_l3_perf_state },
+	{ .compatible = "qcom,qcs8300-epss-l3", .data = &epss_l3_perf_state },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, osm_l3_of_match);
-- 
2.43.0

