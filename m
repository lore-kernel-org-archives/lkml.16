Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D82236E5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749620662; cv=none; b=pijuUNiYpNACmoBwCbAAnPp+JPcA/Pd/WodPPbd+UevxVRM6XrPRhit9FMNVIYW7nkRTxG7EWPzwT43PALBiqu6B1P4fLkkqV8U5IFcRxoQRwXxKXmuxY4DBiiJXYvhg/dXRytto9Rc/ZNZP59hMNjTK85lfJdktXzckWKmN280=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749620662; c=relaxed/simple;
	bh=4bPODOzNV1J1Wag20WqHQpC7iwILRqUaFidO5fo7Wj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SikpMv2pHDYD+BRMjii/eFy0etJVquflvw3MbJUvKmwSBJzJjwU9PvEaJ/yCma0KYQVmnxzv8wZFgs9A/lI3140snLyBjd15NjiEOy4R+DxphkeJIPVU/g8nbQRo6+gvNuvNnbzDBOmKl4jh6yi1Z4ujMg51HmKM/88PPr1nRnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXRSRZdE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXRSRZdE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPuMK027438
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z2paThcjo4kV5rlHhG4CJt
	0FpfCXVKHmPjNjUTqWvJw=; b=SXRSRZdEgdV0prrcKjzTTowChbnivKHrZeLDPb
	WL7MhNdZGWFmcDVzAA4ABDh/Va9NzJdysQn/Dm4TvUjFni2GWj7nsOh9iWxMKVGU
	o9NK3ZFP5knGhGE9DHyAR2W5QbGLZ8GyMBRoPzMcf6YEOpFLQawHrqrT+UsL4bR4
	/bKZA2ZYXjy3IhdbRLl7tbI17s/J26UCcV7soTCGIA06akVZayXyZzJhGSWxccsT
	AdAqQ+tIAdM29u/KlQvEgvrQWXXrrBfCEx4QRRROanC8TNBBnJFep6eeq3wny2UK
	IW08dnWVRIxkk1BwlhW2wML3k5FRSSK68ffmS3dHdR5Q680Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcmg8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:44:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e4fe0c08so4014772a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749620658; x=1750225458;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2paThcjo4kV5rlHhG4CJt0FpfCXVKHmPjNjUTqWvJw=;
        b=kA4bXMRGcPQ4nKTfiY5iESqFBTqHeQss7h9sUOwwMg+EAZf7Azhf3X5qoiqKX9RBl6
         XS8m2IqDwDl3kKxPUP3O+mMgdoNwwNiiv6NFeQe86HOcd3lIzjOjgN+gVGaU1DcUb4Np
         6D8KQbA8LGxA4O8qA6ckFj3PavxRYPbRKE3DBwaMXFx0C35ew+wLA/cs71Cmqmusy8Uq
         DEbGiHUiwOOg/C2lR5+4X7mVZxIacmGflM3vvViynY/eOVR8NPbLgUk5Ymp2D4HcYog+
         MPLHqfUTo2xtmD5utakakLL3IWJy76qYPIzlx+yAJYg1wQqOJOcwmMXXE7welhMTFq5p
         49fw==
X-Forwarded-Encrypted: i=1; AJvYcCUxoadj4UfR1HSScSyCLKBsea8ANGQO6kJvxid5ECE4gEiYvmA0c4Sa2EWqm9gT/vjRUaB7Y0svGA5Wc68=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjfTs7h9FXGCwvD+ribRJYw9NpEgOlgLqvO8qLqDChqhbKCt7H
	EufqEaH9be2/Rioe5OFUfLYhVeVhxIHTU7rTwHdSeEDp6Ttb9IE7vcYzlJOyGq3pRpp3Ro/+PRQ
	C6CP65r0gj4FEUqF7UJ1Vz/xoYDcrIFjnp7gnz1oP9yXtn9WsNFbdtNEnLWyb1tL4dZM=
X-Gm-Gg: ASbGnct0KZNiCtBI+/WOY/H5ln1XlG0O5VFyHtaoU4jQuRPVckMakgOOf9vs3b9OQAT
	azZmp/SSOdbUBFovhD6gh/9ULZmeHwwStE46FCzj3vy0dyyTjV56X1JL3VRZ5rlseiNN7wES3nl
	OxLtr4Lr9PiModjed6XK6rt9eUQE+xthMUVi1mL53z8Bjx6UxBv4gA/FitPz1MwrQ5OFjjyxdV+
	8iVnVwKeOyTGBQb4SawnHFtOYJvjn6m/pPyo+PDSc6ix3t3d91brVuwne68GKgJfThGBRZm99gP
	oIR55HK7dq+9rxKheQ7D3gMf8qLDwJJR
X-Received: by 2002:a05:6a20:2589:b0:21f:53a9:b72c with SMTP id adf61e73a8af0-21f86754dbemr3178021637.38.1749620658384;
        Tue, 10 Jun 2025 22:44:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5RTYJPaD19g1+QKXGXvxhjvcmz9N0P/Wo4pkBLGPiOVS4sBLpqjPb8UTr/LDjbvr/4AnFYw==
X-Received: by 2002:a05:6a20:2589:b0:21f:53a9:b72c with SMTP id adf61e73a8af0-21f86754dbemr3177998637.38.1749620657998;
        Tue, 10 Jun 2025 22:44:17 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0eb0dasm8629697b3a.170.2025.06.10.22.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 22:44:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 11:13:44 +0530
Subject: [PATCH] media: iris: Fix opp scaling of power domains
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iris-opp-fix-v1-1-424caec41158@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI8XSWgC/yWMQQ6CMBAAv9Ls2TVtSTHyFcOh1EX3AK27SEwIf
 6eR40wys4GSMCl0ZgOhlZXzXMFdDKR3nF+E/KwM3vpgg78hCyvmUnDkHzY0+nB3yTY+Qk2KUNX
 /3aM/WejzrdfllDBEJUx5mnjpzNpeXYuSHPT7fgAkGRzpiwAAAA==
X-Change-ID: 20250527-iris-opp-fix-3ef2591c032a
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749620655; l=1267;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=4bPODOzNV1J1Wag20WqHQpC7iwILRqUaFidO5fo7Wj8=;
 b=GW1VPWKI/sCUGw/lmdjcfb1/v1p4eeE2hxIHDUz6r0uc8ZG6Nh6B1h6ZjF1CXCVBjg7JskGvw
 jcYo3SVzHEYBjKshveIrasbrGRIJ9GRxGQPohIyCG7g/J+DEMY0SQcC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=684917b3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Bqk5Gw0CwUaqKlFR4NYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 2j2xA0KdJneNjNqrutgtWE3D7HVMKVQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA0OSBTYWx0ZWRfX00u+lqEKp/PB
 M9nYwih6svUkPpJjG7IBC8p5ZPFMxfcpxAOafOp9rMJT600VAYS34os/GIWJg2DmG6qfo3CZ/2+
 z9emBu74mbzsRbIkN32aWvWpNy6ml4W+78ZYU4gYGLAFL6pRy55cZrCnwhdSYfQ6IhGk6BkXtHJ
 zBpdg0ixtMrGad9pNoGL2+UNCS2UcG8Hfy2/7mL4Uh/KKxAhNKpHgsZcU0K0OezQoIeRmaA3CSw
 OjFCictZK9ls4woWrtUfYa8kq013vYKBsReSY3bjyiV+y52MVJa40ty5J5wwYwB6COGgf0wb7xm
 c2EYoQMiI8qWmkX3+M98/6A9/Xwam2E/Z0Uodn2KcgyHXhE07/b0NZ5Bj63ADcf8rb8CNpmGuPL
 u/MKcmOqY3w9MpJf4vCJSoah+lugetr4LugY7Ty83xv012e1qFUv1OENZ5DqSaY9BEGVagPw
X-Proofpoint-GUID: 2j2xA0KdJneNjNqrutgtWE3D7HVMKVQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110049

Pass PD_FLAG_REQUIRED_OPP flag to allow opp framework to scale the rpmpd
power domains.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Found this issue while reviewing the Iris source and only compile tested.
---
 drivers/media/platform/qcom/iris/iris_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9a7ce142f7007ffcda0bd422c1983f2374bb0d92..4e6e92357968d7419f114cc0ffa9b571bad19e46 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -53,7 +53,7 @@ static int iris_init_power_domains(struct iris_core *core)
 	struct dev_pm_domain_attach_data iris_opp_pd_data = {
 		.pd_names = core->iris_platform_data->opp_pd_tbl,
 		.num_pd_names = core->iris_platform_data->opp_pd_tbl_size,
-		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
 	};
 
 	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);

---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250527-iris-opp-fix-3ef2591c032a

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

