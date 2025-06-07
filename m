Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986CE1A4E9E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749305760; cv=none; b=aY/6nmOcnNyAjVXW+6xfd/KXXKCD/sIcDiJJjjBz3khjUV3cNcEaFjKKYiCxcq7GkomrZm5nxm+YDylJE5n7oYsd9U0xlSn+ej9P1G4C4oN9qrDlxV2Q64Fk3BYEju0EhTmajQBICXr7cU6OoPUxylbeCX04mVh9mCYfmPvSjtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749305760; c=relaxed/simple;
	bh=oPf1vrGDHAcwS0lnY7K2yLQPMKwWkbyxLNEz+EtlmqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UKaZ9YLUONZHCUlFIe73lrAwyVGuKJmEbnRBvZJkuMfTH+lUjsAABhdfhWoDgqfv14A2tZJUU2q0g3xjmtMF/fT7dillyZXJTyIOJP71K04HTDNIIBbkJTHrUJ314qk+5SYi55N2RHh6/KcTdlLKtit6Sm9ZTuSFvc1O43aQf5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/bvI6Xi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/bvI6Xi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557DSaJp003089
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 14:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RoPAj24rANcl5QX1l3xvSVHABOET41gWukC6+LZv+Rk=; b=B/bvI6XiIRUGJm8E
	1KEoSC5e66CpGY+6d174bfC1hO/7oWyqxPk/cxVwAwwABoC/vIa9ZqPFvHUXSylU
	kp7W4Crwn8eC5JuMvMo5nzZsz/bwE/cqy9Ql/lBk1STFjLpSnVeneg91RfUigKEU
	qFfFfNSmTNkDFlj3pYMSSdByz4ciL3dDDj0aM3p0zL0fobgcAhW33E75NqPhz+Nj
	7vBZdl3cEkUTdW9YzvnJOUq8Xni08WDXJdOXaDzgbNy7S4wnu0alPB5wmo4yxVFf
	udTXlcHGeAxfTzQv/1IiLiF9hBDiYIUkTnj+QZoG0K9SHnCU8EtaFfaiPQh1K+HR
	el/T0A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6j8m5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 14:15:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311d670ad35so2828166a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305756; x=1749910556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoPAj24rANcl5QX1l3xvSVHABOET41gWukC6+LZv+Rk=;
        b=QpBWZk6ogbhRwhEZTMRL3VNUR8/jcHG1kiLPDFFfDAfJADyvMr2mPrP44nV4sg+Dxa
         SUR/fLjQUB4xTkqmdgNCvX5jQ8T4NouHwXuJcP593h+ESI49qAR/YWEeM3R2T9zKkr+P
         UP9pm4eY52hqqlB0FEGH20eTmtTNfNbgE13GmjzJ+HPMhLoJ3P2xf9Sy5ZzPqhuu8WBL
         tLr9n8U72lgD2H3uGhmyie1W/gqnbTGDZvVhdFzVe2tOmAJc/qJ+DD24OvzBMbmHJNHo
         FFkUsGqJLXlcjZGHifBT+GeZFvZ9xj20kgT0TBtd/CtaB8mMRn6gWgXabtozG5Oe+3TB
         6Mog==
X-Forwarded-Encrypted: i=1; AJvYcCWw0iBMab3mx3er1Tym6Aw5BWCBadhyKWaGutsW+CDGacbaSE/dZjqcZBa6rCdPkPujFIbtN+Ns3lFM8E0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDui6MDZwhHe0DvG21UlAAFhIBJAzt2WqeKcqocJaJWfs7a1u
	JRcIy1ija73dFWcSaS7z94zQWARPbncf1WAxU6wA7u49ZIHNtNw8ehu0ZQQGP7I9r/3yDfoDw5i
	H5uETwmmCpGOzPKMS/JyPjXJGQaCr1dN1FtkwkHUV+MU7hJ1DU8jWWQixj5ED5HXMajQ=
X-Gm-Gg: ASbGncsI9rIw8yecEFn4pZONEAil03TUOuusrC+sZw0x0Qkk3EMXcwfn9gwSO+PqKCi
	v8Dx2vlKYhIiipDIcdjtdCo0I53Ibn4nrGv38VGqX0hdH3haMD5gCrUDZzWlq/OCYv0GWuwaw3f
	kdOk/QSCENNBF+e/ErlXoraFcNgvkFWji8MQG6mep7SQ83ztML12JqgC9gqeXvl198fBMD0cTB5
	jFLni4ymtYGXDmCsNHWcS+tPMPWUCeQgePXxbmNnRXfm2WFZrNHL4caI8F98Ar9Ofl86wZyAOXG
	Yo+8AwvXq2qEnqcp90f7bs8dkUW+BZeq
X-Received: by 2002:a17:90b:3506:b0:311:f2bd:dc23 with SMTP id 98e67ed59e1d1-3134740ab57mr10429753a91.15.1749305755809;
        Sat, 07 Jun 2025 07:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkvgNxf4i7eaFV8gciSY1TEWEqZHtGfJkioV1I3JEgDycgT9Fb002tmr5zfEQLdgdl6qQZiQ==
X-Received: by 2002:a17:90b:3506:b0:311:f2bd:dc23 with SMTP id 98e67ed59e1d1-3134740ab57mr10429661a91.15.1749305755008;
        Sat, 07 Jun 2025 07:15:55 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:15:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 19:45:00 +0530
Subject: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=1894;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=oPf1vrGDHAcwS0lnY7K2yLQPMKwWkbyxLNEz+EtlmqQ=;
 b=Rtb+J/Uc9KqX4zEqOybb0NgOAX9BBtfxOnJaOBVeaq7UwfCOezjPAEZDGKLncFvUa2/eVR+KO
 IxqmpR9hO/1CczmdmW9aD4svEJuZXtzcb7Jc/JC3rqY8bAM0iYniba4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=6844499c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=25T8ekUwwafyqMypFLMA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: _2DLfIVvA0mZ4Q4T7VUaCX-12tGgILqD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMiBTYWx0ZWRfXyl467ZVDI3ax
 9933DKsvFmHt8u7mZw8Csma+msow2Hg1ht82FemX91Fl093Gf+Ieu4cl226oR8yPS/p7LfeTgaT
 DESzT+K+tZc82MKCrvfk6/yNCofAYRon7JPnnFy7GJ9hjAxmGc2N8RW8b6dcVi3jKxsH4uHK+q8
 J30PNHoB22cJ38pbKC50PKUOeHVs3QYBlttfwnHGMBOq1SYjZDJIIF3XZ26UeMDwzo661B0401p
 OOS/6OzAC4N3wrDH/UMN8D4u3aCme4i43Vl2YYT/XZ7QBMhheD0O9JCOOa7faiGhknN0laKZOYb
 R2VjkOioU59fVcyQ+q61Rnq5lkhx/bVx6Sl7cF1yIftUz8mRqM0puG4XfcpAy+c0orLyA+Aw5mM
 my/OFDySPgZhz75YIJhAJs6McbQXiZXKZb0fqtDwffBor4MVPOfDRXD4ooGZEQe+DF7Z9eW6
X-Proofpoint-GUID: _2DLfIVvA0mZ4Q4T7VUaCX-12tGgILqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=925
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070102

Add support for Adreno X1-45 GPU present Snapdragon X1P42100
series of compute chipsets. This GPU is a smaller version of
X1-85 GPU with lower core count and smaller internal memories.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 3572 * SZ_1K,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
+		.family = ADRENO_7XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
+			[ADRENO_FW_GMU] = "gen71500_gmu.bin",
+		},
+		.gmem = SZ_1M + SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
+		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a740_hwcg,
+			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gmu_chipid = 0x70f0000,
+			.gmu_cgc_mode = 0x00020222,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 4192 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 294, 1 },
+			{ 263, 2 },
+			{ 141, 3 },
+		),
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);

-- 
2.48.1

