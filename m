Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F16136A
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747567302; cv=none; b=FmQ8DBAUaymz9mJkd117X2x419HsmV2WursKyyYRRXEqV4B8RkBQjThWOW37IyVFJLsBkTMeIdkwL38t7aLQD3CrB7WptO4Ebj+/xvw2bQys2LN4QJdNyUhMGpNR7Yg9+R4j3GlYk6auIzGyR9QSy/X1xU6n2gmsqInRovRwEw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747567302; c=relaxed/simple;
	bh=9J4rqW2pXqEVwcZ4RKNBv+n/cNEsrz1nBVyzy6c5Bhg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NmMQ0Dp8BuJAD2lCB5Hv2EROQHJo6mnYAt1R57Afvn7KifgTm839xW30NJm4zIBA1B0SRwxrqOq/93d7XzPR4QFsPg8hohZXNcg7rtXyWWsYJlTc6+czUQ5jOVVHTRD6RK2EOofU/vRfS/OvW3iyOBVmVPed56QZbqwBKEu9HWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCrG3qaC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCrG3qaC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5mqme030629
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DtMbpHsYyq8IxkCCqitMrf
	IcdqaVbs7kiHyoXi5G2h0=; b=iCrG3qaCWp5lTftu1QYwcQuzyKhSWdPWLS9Glr
	Zy2XGM8kjCHxuog23ACDH7WItUs2N4cRNZcn+t/Nl0dL+KReYXce22iBJ5JdBtxh
	uEtbGzO2PpRKbyVwQO7RuudhaItxk6oHtt8D977A6m7R96xUgdGSPHEjE2fYmcI/
	0tJJ60CY61jfBhlj+PbjRoNKFRyd3KZCOjhjed1Np2GM/vJX8rNk+2263PGK0Gjo
	TA/7bbOsp4BSs9jFDh194HME8PMjWw912AU0KhzL7dWtLAx9jnFVIE5+B9DQdjjF
	w4SUUTk1TwQH7K27zuiyZhYNe/pOqK8K2Db/MDPUNqm0cVuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcswsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so1170608785a.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 04:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567298; x=1748172098;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtMbpHsYyq8IxkCCqitMrfIcdqaVbs7kiHyoXi5G2h0=;
        b=ESrQLP9MvweP5BiCRlvj9L7/vk41GRC6U5l5x6Q9hSjSXTImKRiaQBMUVNRFFTLYSc
         RMaVqPSqDd0WIV/79qe9ZWZvdDa9DOg0gT4tTX9s6yhU0IfW+MftirHvR2FMGjuhJ1gm
         iytDehcZax3eXKGaf2rtEbO6kq05Y9ZlRIFf0iU77MJ7tr+Fa8p6E2xW6VRwHPRfTBrj
         US2a3xmwc1AoajLb1HOm2iiso4eUh8pjmpApBOV7OScHjKoiaHJIckIrayIqrfzieUU1
         A92lBod3eQlWwNRp8UWRqqzya0ixfpSuY+3GTIs9akiqE+HEaIcVqZE0JU1SntZoDWAO
         5vnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGvbcfD0+1Zm88WUx+4VVgTAcTwzbSbfFUN7HsUHGlH/xAGLu4jaTeOq7ioOnZyGp0Snu1iOKL/PsnDzA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2yPL7Nx879YKfLDzjwWTxFh2JzGitQQHzACGfW241gcFWKqaw
	lh3LaXFxpdjiKzMd6eWLFAhm8VbiJbE3A57maiNn95zNQVA4Y057x31mYgdzy6asNdDXeLsUfic
	D5D3AYmx/A9fRqfPcjfIdUqKVgtdG9ok4T0jQUK1XsmYqD8O4+6X6NBrqn2Yaw23Y0ak=
X-Gm-Gg: ASbGncsKdgfQJTNkxLzw4s7IOv9FYPkDVNHtQSKb+tUWo1WgVL2XGHZL/TIC6XogXgB
	P9wTEe9ua4fBUPIeijkBolSP+9OLAerZe0XeH+60mj9y8XXoEoZKoWnPfnkoguMFpM0W2Ygjkvb
	wzcwPkriucfX3nktzfM3XoQqnzBPmTO7PeUNQMjFYV66SslCa0rjjx5v66/sFNPHPXTWr/S0rWt
	o5FmImS8gmp01eWlNCMxhXEWJ+Mfd1tZRNWfd0fK8V3156ntAOwxKxIF8jSoXRSQ7rydxJkdIY7
	pNWK7d1IadCmy/y7COsX0ggLjRBvuC/3U1yvFT043W6mI9K6c8Ykq4XMIgKirmRzkPY1FqP1TL6
	yX4T53Zrxe/Zi43vU3N7PuhIj
X-Received: by 2002:a05:6214:5096:b0:6f4:f123:a97a with SMTP id 6a1803df08f44-6f8b2c65bd5mr150316166d6.15.1747567298527;
        Sun, 18 May 2025 04:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqLiWIyECuX8rlBPulhzi6aemt00MCcnN0evfEEcuiCXQFgv8XdaQqt/ZFHIXho5+QSjC9UQ==
X-Received: by 2002:a05:6214:5096:b0:6f4:f123:a97a with SMTP id 6a1803df08f44-6f8b2c65bd5mr150315886d6.15.1747567298220;
        Sun, 18 May 2025 04:21:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:21:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 00/11] drm/msm/dp: perform misc cleanups
Date: Sun, 18 May 2025 14:21:33 +0300
Message-Id: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3CKWgC/23Oy27DIBAF0F+JWJdqhpchq/5H1QXmkSBVJsKN1
 Sryv3fiTV2ZDeLOiMN9sDm1kmZ2Pj1YS0uZS50omJcTC1c/XRIvkTITIBQY1DxHHm/c32OpPJf
 vO92dsFYm75ICRu9uLdFiM98/KF/L/FXbz/bFgs/ppiGC7WgLcuAKgk1pNBCyfvssk2/1tbYLe
 3KL+CPo6BGCiOjQDlTKRB8PhNwR2CUkETBiMDoNcfTyQKg9YXqEIiLbiM5gyELkA6F3hOi20ET
 IATI45UTI5h+xrusvACBS3b8BAAA=
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3213;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9J4rqW2pXqEVwcZ4RKNBv+n/cNEsrz1nBVyzy6c5Bhg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcK/oSgN7yXgFO4+3bkCl2DkBasInwY4hcrZO
 CnT1iV4MDmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCvwAKCRCLPIo+Aiko
 1SB3B/wKXaCQqwfxs9wTPNniKTi3kHMBEEVeEZgZ38YEdK/Zx9TOyfHago/j5ok1ahPZG6zNFX9
 d44wHDAUXXquUgNagCXa9mqrIZkgOMss4XMHI/b2QpKIHtVZJ7/omvpk9DTkZrCjBQtx4MjEeoc
 9F19SfDKKcnySqvY2hi1PNnFrdMmnR07QexY7YCwCs96kIGdu2vET/4bgolwb4I8f3gE3DiTOac
 s0+P4yU4OFqEdi8Du9PvY5XzdwP/lDP6OeJSJeUryV/zXjCbUzP9UFMkgjqZkuqYwbkChkJVUhl
 ii5ynWcFLdWaIw3H+zBGNWY3Y914LbQhMc1uWtkKxvXUJAvX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GQDGVSa5zB5x7NpMvXhcQkb42XSMZJ_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfX0SE2UmCUtry4
 4b/Wnh/VvvxdpQTciV5tYUCN9FsLWinkp6OWMczOpcTVc6Ue9PHAwpPlEhqKjk7ck37phKiXIWU
 7PhLRkA51LHeYW0vCESLCMeaZeOc7c2AUCPLYl1XWGlw5aASl1vRGJB+yAJC1f+tBcycnpuKoxG
 onwV943w9JC/Q1y67mW0NL+WW7/UTU6/LANK4sMW2Qs+n8I1HJjOssWT/WI1uhmdRI0j+oZ3N61
 lAVkcALcupS9qtL7lcxZJPDgroaoHHWOtzjJFpvPT42sai0clLesEjNWBzqbergdKbOFAN5oU4+
 HDnUj0XMAxOtIINvimIdoH3E33BXQpG21NKolU5M9mg9a167KmTEZCHQmAE4Kru/KhyXsBD1Qxf
 Gy98VWFjiqi3AkrpHQXB6wUg60lWu9z0mbfZrgngf5rOGA1wEfhwvuZLeYrrWazZFYLOCgYn
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6829c2c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=625LCR9qH_oaHj1pw7oA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GQDGVSa5zB5x7NpMvXhcQkb42XSMZJ_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=680 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180108

Rework most of the register programming functions to be local to the
calling module rather than accessing everything through huge dp_catalog
monster.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v6:
- Rebased on top of the linux-next
- Link to v5: https://lore.kernel.org/r/20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org

Changes in v5:
- Dropped applied patches.
- Removed MMSS_DP_DSC_DTO programming from msm_dp_catalog_ctrl_config_msa() (Abhinav)
- Pulled the hw_revision patch closer to the top of the series (Abhinav)
- Link to v4: https://lore.kernel.org/r/20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org

Changes in v4:
- Rebased on top of linux-next + msm-fixes, dropping picked up patches
  (Abhinav)
- Reordered patches to move dp_audio patches earlier (Abhinav).
- Added several more patches, dropping dp_catalog.c completely.
- Link to v3: https://lore.kernel.org/r/20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org

Changes in v3:
- Fixed falce -> false typo (Abhinav)
- Dropped wrong c&p comment from msm_dp_read_p0() (Stephen)
- Changed msm_dp_aux_clear_hw_interrupts() to return void (Stephen)
- Fixed most of line length warnings
- Link to v2: https://lore.kernel.org/r/20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org

Changes in v2:
- Set safe_to_exit_level before printing it (LKP)
- Keep TPG-related functions (Abhinav)
- Link to v1: https://lore.kernel.org/r/20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org

---
Dmitry Baryshkov (11):
      drm/msm/dp: split MMSS_DP_DSC_DTO register write to a separate function
      drm/msm/dp: read hw revision only once
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: move interrupt handling to dp_ctrl
      drm/msm/dp: drop the msm_dp_catalog module

 drivers/gpu/drm/msm/Makefile        |    1 -
 drivers/gpu/drm/msm/dp/dp_audio.c   |  130 +++-
 drivers/gpu/drm/msm/dp/dp_audio.h   |    7 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     |  216 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |   15 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1298 -----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  113 ---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  607 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   19 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |    1 -
 drivers/gpu/drm/msm/dp/dp_display.c |  150 +++-
 drivers/gpu/drm/msm/dp/dp_link.c    |    1 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |  256 ++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   13 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   19 +
 15 files changed, 1244 insertions(+), 1602 deletions(-)
---
base-commit: 087b2daf4fffc7cf4eb754e1f0b07464ee376851
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

