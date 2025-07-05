Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AB42E3719
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 02:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683652; cv=none; b=G+LzdV/roK1N7l9bbVcJ0tHqwrgggBoDcJHjafuEx6lEpuR+Hi6HK99BYSgsLJ9Y8Ug1L0qT7hD1rZVtKeTmfhmyLz6N3K2A0+Ex3mMtWqzCkuGf6BC4VoaI5+moONXn10oVQjU2JAteLF9XTGj2CqJwxPsrRgbEoTnNFzOIbYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683652; c=relaxed/simple;
	bh=a02lPmZKv/naTYZA9OmQPxvGdxGzUfJ3jTjVREOZLAI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nXfhRdgFRma6AVqb3qJt2+KBnnOHh99ps2QRn15uccUKg7BCj+z0Wqjpw3Uv0zKR+PHsraAe+qCV4BKKtZ9xqrDu1+rzhRwJ14HwRcfkklZnPuK+wbRj/giwKpwql2bja3hzmS+vpz0sWEjnsAtdRG+sxRGTsSWZZXC264xMcgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEvRdK7v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEvRdK7v"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652ZSsZ009155
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 02:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gjy4TsFninVe5bPVihlWoJ
	GRkiWlNHpU3ZfSz9r0mGI=; b=KEvRdK7vKZsc64O1isantDYYOvYOQKNHrxauG6
	ConzIya7qW1oBjk7wAHtrNccPxFztnk4H9CaGfHaMZHSK3becWugA/dpW40gGkWl
	JKWmmqnOi2OnDE8vm/UiV8JH2S6Z9EcvK95gSuWGsQdWqXMYaXUh8iUBpbLCJ6+X
	QDd3rx9ItRWDcsZJfMaHE7wCaMGPDBKZ/vGQpZcBRL3ASLNqFcJnvEf5CxM0GIt9
	Vfvlm6iEUdlqxV1hMV1dgne54Ydnw/T3CpLGokTs76qg0AM3Po8/Cen/bPMCDY1f
	8CPjQ88IxILEqRttzb+WUD07LmTTxxpq91LDksLPVtCSh40A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucm80dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:47:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d4576e83cdso390477285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 19:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683648; x=1752288448;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjy4TsFninVe5bPVihlWoJGRkiWlNHpU3ZfSz9r0mGI=;
        b=hHneQbpYfZa3z7uthMdTRXCzhRmavcnb4QHwKLkHiXRdVl7oBM0xHeY2XLDHTaW+OK
         vZfb1aqhEN2SsaSuWV3tDy/m8DhPUnxbFo7Wow/ZhXbA0IPVXjGU9gjotw+mnpRzwG2j
         jbu6HfentDvh455Shl03ztCC7G89XDr/7N7wZ/G7KHjbYYmzgfACIL9bIeyUtVJOkMAv
         huTlhCbsTTlhLtybDb88uisDquYYNA+aJkQqaPyJ99MHJ6Uz+HWAGKXNnEdQsqHRMwzp
         07WQgv95gqMkp/JnI8lNXmI9oQoFVZqWwddUcYxqTDHPpWTkBjnuayJn0XSggkT9dkZx
         rFLw==
X-Forwarded-Encrypted: i=1; AJvYcCVii0o4MAsfNOfe8is6yohAnzliU+6uZ2pa2w38SQo0up0mbDNxFArmztNmpRmvcy8vmVuMi2agXvRMgjU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygc6r6x9iMCKiPEPSV1be4SNdCiKdJknzXGZ+jW6fN3cwuO1Ta
	1v4e68jhMWUMjt6RWFPAU6rtxcAa88UZs4CcDHI0iUMYEmEH2tU7IcKI4R27ePsDwF1BmDJTumR
	5ChTZ3H/5aoRr9UF/h3EKp1rnem4xjBb0gttrfw+RT4jz5cXQe9Z/gL5l1UOnLiOpc5A=
X-Gm-Gg: ASbGnctvbSDlQCxjW+0tK07lnlOshCiDtH3RxPteagHRJ7m5pTWyf5pjUlU+DcFQU03
	Mp2kl/aB9T7GaXTIb/BQFkPhXsdS8FtuYPH0o+UVsCA5Hk4b/l6gsk7q2PAgEvNvZnNGQtttwcf
	bQOysebwvha8Rr4ztXt0ZKjpmndE8Nbiiqpv1k6b6Mu6ou3+QCrYMkaOOcMCQP/PvY2cfHD7W74
	zC1tpgQy5BZde3JSZN7WPjQv1j9XFTpoQTbaMX5GMgcDbhET+yvLB8r9d7BNmhKjFyOm0+Q0DW3
	eab1ccsP3q4kOCxE4KQpbXsXFc5osVzkwdnjkqPfWeCrXQ/YTUVZ3nSxxnVe7jM4wnG72xhmrWP
	QzX4pCoMUKV1CFAGc/6MNurTyuLw0Qs1OU0s=
X-Received: by 2002:a05:620a:2485:b0:7d3:9218:6d1b with SMTP id af79cd13be357-7d5effa5066mr170819385a.25.1751683648231;
        Fri, 04 Jul 2025 19:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMjGKSOCRv6Aeyw2vw6oMPWzpEEhkYFVFUNj5HTXRFl2we4vDYiTxbSAstbuCsTQWU2PJ0sA==
X-Received: by 2002:a05:620a:2485:b0:7d3:9218:6d1b with SMTP id af79cd13be357-7d5effa5066mr170817285a.25.1751683647785;
        Fri, 04 Jul 2025 19:47:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/12] drm/msm/dpu: rework format handling code
Date: Sat, 05 Jul 2025 05:47:21 +0300
Message-Id: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADmSaGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNT3ZSCUt20/KLcxJJiXYMU08RUkxTDRMMkSyWgjoKi1LTMCrBp0bG
 1tQC+/D1DXQAAAA==
X-Change-ID: 20250705-dpu-formats-0d5ae4d1a1b9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=a02lPmZKv/naTYZA9OmQPxvGdxGzUfJ3jTjVREOZLAI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI82lipzpyCC4LKN7ThdLaL0Fuf/bVrrEFXL
 N5kmFgLvi6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPAAKCRCLPIo+Aiko
 1avgB/9tgZuAoAH5++lDQAjlCepbdpElh8X9Ms6JNzVhuMPPabCS0iVhoseTNfDSNRIsDHuNqlr
 r0LPD/AvQDvHxoW1x364Z/uayPIkC0wFq0jw0BCdzhMadMGEukEVv2hmgG5GWBZAFN40egpPmGV
 MUP3TOrXlRv4CFBcCBnob3qm+c/EWMGb7pDlFOyGyNi6vVqZx9CfgSVCu6sZSkC7VdUe4a3lr9Y
 mnI/ugKxuBeamrAb/WW/Jsdvl5d7AcXSqObpe7RmcDUap+F/5NukqJNcagojo32b0RyBPcBiTa/
 FlnUHvKFxm+YbJvh66rI/3t2d6WXnpP5NTq0SJ8d6oWAio+m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=68689241 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ilABv6Z8GYNuw7svrMYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: xGUBbarriTnEDv7flXJ4m5OluntXDrK_
X-Proofpoint-ORIG-GUID: xGUBbarriTnEDv7flXJ4m5OluntXDrK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfXxdxAX5txlyiG
 EsRopIkU6UxQM5hE78fBedFqTAX5W+b/ZrSAmm1F+l5ma2M9xzwbAIthIaKMXh+B/v8Mfq9PLb+
 6zwdGiRFb2KSCR7v9bZCb4Jkc/Aj6qa2AGuarmDV7wfakqutjwqea2kmB3pqJ9YTtjz9bph8AAq
 toWifkkzZNem/c7On/maqoEi2qxjur3AKNOTG+VLjoUXnycJHZC018w79oUrzlqYK5lleHSvUly
 2lA4fimdI7SO/HXaTkkiNST41h8eLVFaInkFlg5K0dlxmkhPj0Pbh+NxpqqG2n6UaegWLOzK/JG
 +fjrdEhzNHTI/RAqD+cuUfusKo2YmUhegaDvTaMRgz480RP/t90+11KQe51k83H4hP1p2rkmb74
 vvlToaRtroSXnc0Ee1THmF+sdkOjlvxx8EkbhuZXmnFR48xgBdCoUiHrXa2QOcHKK2cb3E3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=926 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050017

- Rework mdp_format.c in order to make format table manageable
- Rework layout population for UBWC formats in DPU driver

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (12):
      drm/msm/disp: set num_planes to 1 for interleaved YUV formats
      drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
      drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLEAVED_RGB_FMT_TILED
      drm/msm/disp: simplify RGB{,A,X} formats definitions
      drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
      drm/msm/disp: pull in common YUV format parameters
      drm/msm/disp: pull in common tiled YUV format parameters
      drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
      drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
      drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_populate_plane_sizes*()
      drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  178 ++--
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------------
 drivers/gpu/drm/msm/disp/mdp_format.c          |  614 +++++++------
 3 files changed, 394 insertions(+), 1553 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250705-dpu-formats-0d5ae4d1a1b9

Best regards,
-- 
With best wishes
Dmitry

