Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6E4219311
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747567316; cv=none; b=Hn3rZ/sNZe29uGMKtwe47wv/wFcUAZhAbCOqTOZ2HL1f7Wj+C0ymOj/BmcCBufMewSYhah5ql2nDyzbANoTvjOqVlxQqD2dKzZj65IeygdjQDgizB6sQ7grjhYo4iCDm5gjIUzvC//OxvYE4MrwlFByNV+1EhMP0rIPKvBV5bvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747567316; c=relaxed/simple;
	bh=diAWqzSWmMSXds935BOIRl6/ii7qJu7TaUAIqOvMiJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PQpJFU0wawORfmrFnaR0E8m5KJts7iEf5mnb6OrXBb4rKnaGZ+PlZR56E5WzZKmKeEUkmS5pGkfJf7LbuvsktvRwPrOlVh8PPTRZnGhfcQ64+NDz2SgXbnAgpztRZ7wwk9kD3t+gq+obbtEjyVkOCgWP+a9ZXqZbkO/OKiMk+4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGFQjyMi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGFQjyMi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IACfEJ020049
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vOM6YCDRD4lKtphkXnkoS9iJ5/c1je1RA10V5X8owo=; b=HGFQjyMi7rBK/nzM
	jB/gcL1RTBLwYTR9eWLKO/Gws0qpqJVsIgwN881xhXwfYtBBPNB7V8dVVqA7L3Vs
	qqUg6MzNwYzLL039bwOyFWcX9bj/NtJmG/WsX88PhAzxHlp0+NnuHXmWN08nyyRN
	LTBdYSBaENuxXKV+yotZO/x29XgkZBSvQejkX08DDvJiReSGIagGJ5ybjxXO6Gm2
	WWxsEJnhr/FB88c15G5cIMUxPJG+S9PqE98NeQ3IcW2gwDlB1ix1FOdG8yQcn+qH
	dlxsLBqwcmE8dXAxSVUWDI9P8fTLe/72mJbqkgbj1gOt7BxhnWjvySN3PHyaYrz0
	5Sjm1w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhwmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8cb4b1861so16399016d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 04:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567312; x=1748172112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vOM6YCDRD4lKtphkXnkoS9iJ5/c1je1RA10V5X8owo=;
        b=Zxa0d/Txxj9hS1qw08D4aJYyck9ECLKRuuhQix+eCkrwf9guNxAO+xZBD1cb7GNVBE
         x/ODIMP7S6GoyGsV4kPHXEyDCU5wpq73aOlBbdupXWx57YdOy9EhR2RqSXFybQXb7/pf
         3HYAq55nc5LrSiXOSSt9VIYZfurzZlDmQgu2CzE7Pvje5O34/UajtgOXb3/HJ6PIyDeR
         7k545NZsXRsnaSvlUvUfRhA0TTnfvoui36hrqp0qUFn0l6gVuNUsnZ5IF6cI4CFcIe9G
         rhScXo3mUFlQ+858JutWllyO7LMu24DYKbhJvj3Aci2v2RoqbI47XAfpnnR+Cmrm977r
         wybg==
X-Forwarded-Encrypted: i=1; AJvYcCVjrpj46VusQl+x9JFeIJoOpaTYGqzhVAtedXfsh7xKAhRjYwdnFQ4NlbeHeAtyHJttD6GzDz2v1OPfkRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKLYmNuK2/a8LMWOe90FQ2AnDmshqzyjfj4ssF3Tkb/0MGjeX6
	Q5r5G3HHLLwTgaGiT4mi7u3sa/B8jZLl1Tc33kI1s5PUwSkKkv7psT9bHC4HbsxpetHjoUBPVk0
	+lryyjU7LZXprmTQU0ZR83oUQ951QPl4ovs8krbq84Uq8r+4Hfm2bHm5LCM+uMuvKq08=
X-Gm-Gg: ASbGncv/HhOARFaDzA0e0YJeS9r2u3fSJ1yrtjOY8cEe/P4yho1RLxUGGgHM6wSc1Ij
	tApEkWVPqLLDW9UxuELeEr94ngl4PUG+hGbgILV6cDHTr8JOaye5PTzFm1pog37njXLf6HqCb50
	L1wwwdusuuN1FUzUoy6vcM3BioudkLsYe3hLhYDkdr27gdfSDZy/r3yOa/BiX0OmvrIq8W4dLxc
	UmRWVRXH44KZdrtl3G5o7wjSzqF51jISGz2kUuShzjCFQ1hWlyAPef3MT3cWh6lV5xrXEh3KW/h
	4RpvyxrLxjIFHvwL9kaN/Blri4/TmMVxI930tUWR1Xvs2pVx1pWihbJ418mqSCA1VUuruOxbVdG
	Ppish/xChu8Ho4nZVDyFgqDWR
X-Received: by 2002:a05:6214:1c8e:b0:6f5:3cae:9205 with SMTP id 6a1803df08f44-6f8b08eb1c6mr152835876d6.39.1747567312285;
        Sun, 18 May 2025 04:21:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjYSBrs458ROaxnfkXEF4C72JKyNjmd0kQrBcVKPv9amzgG0yHf2D6ja0MMkM6LCFts/QwrA==
X-Received: by 2002:a05:6214:1c8e:b0:6f5:3cae:9205 with SMTP id 6a1803df08f44-6f8b08eb1c6mr152835676d6.39.1747567311898;
        Sun, 18 May 2025 04:21:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:21:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:40 +0300
Subject: [PATCH v6 07/11] drm/msm/dp: move/inline audio related functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-7-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14087;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kLGf2rvseO7fyrCkb9NtTY8FKSX04ZsFdMVGPSUJYks=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBoKcLAartUQaMolGCvW8s1zk8HzuVjsocw504YK
 0IWdpjfcTeJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCwAAKCRCLPIo+Aiko
 1WBzB/dEG0R/qIV4hrlHYM1Vr8aWhMy+kr1Zev0V1/I4/jr4qyvcKHPjr9zWhzyfYvhphI6NVzY
 Yg/8nZmDKMC/qh9NYG3UEOSaqiLE5NKwxFq+8i0yon9/lYoH34x7VqeH6Kk6kkHhs4eAn8hdRdg
 udWavHc38OykXNkaiNdVRsCNNdqB5JqK0Bt/hk/8GpU5I6XNvuIFSXCcTjZJoQY+ZmU2yLWwwZa
 styo+L3Z7I9mMBzKcTHcDi809Wy+H/4gje2oEftEOJAZ7i2h/mx+BnOTNr7hG+IoyO/Mgd95CXF
 kIxJ9HxmSbwpVl0nFX+GohiOM3cvYcXdhf68vrW+BMb4qa4=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3_NsOapEL2Kgs3QcKYDNsdlNBha2ROJb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfX8P/fvYiOOv/j
 /ekKd+rlEZboQbgngweot3VhtFZ/2ERQZvHtj+asGw4IxLJy/578K75uplN7az1YNEqngHBsEfP
 czXZYVjvr5YjJerWx5GWt66T0smEpxNr9JXUdjdn4I+i7u3r0CY2NiAqrIQtR3ZylM0YNw995UV
 t7Kk6qPfwNJUZa7TiXLxmt40rO2G42e7YQhDPrr2WtA0B69NV/D/zBQm4peN+DmJqFXj/fKkF2I
 j/FjmZYTSux2xMP3Y+D+ZgJ7cJIqFpTQwZjoRU15BwCmQQeb1xIzejSfx4gnqneeFZpYMyXxN7u
 UsiG0olfVwAvWn2WXDrnqkYadzsTHv9aBDC2N8BgEmcfxh+TJxmTNaMqcW61gJeZ2GiUUZ+Rtla
 dkdtXwINDwS93VTS2H1Ompq6pcELoTIZWIswi+S5djhq8K4k1i26ocDrW99oBJ8Ykdco4Zy/
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6829c2d1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=XtWaRhBim2cuszpigVAA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3_NsOapEL2Kgs3QcKYDNsdlNBha2ROJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180108

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Move audio-related functions to dp_audio.c, following up the cleanup
done by the rest of the submodules. Inline functions with simple
register access patterns.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 112 +++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 166 ------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  16 ----
 3 files changed, 98 insertions(+), 196 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index f8bfb908f9b4bf93ad5480f0785e3aed23dde160..09f871a001073ae698708b31fa8030ec7cf20242 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -31,67 +31,129 @@ struct msm_dp_audio_private {
 
 static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x02,
 		.HB2 = 0x00,
 		.HB3 = audio->channels - 1,
 	};
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_catalog_write_audio_stream(audio->catalog, &sdp_hdr);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
 }
 
 static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x01,
 		.HB2 = 0x17,
 		.HB3 = 0x0 | (0x11 << 2),
 	};
+	u32 header[2];
 
-	msm_dp_catalog_write_audio_timestamp(audio->catalog, &sdp_hdr);
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
 }
 
 static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x84,
 		.HB2 = 0x1b,
 		.HB3 = 0x0 | (0x11 << 2),
 	};
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_catalog_write_audio_infoframe(audio->catalog, &sdp_hdr);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
 }
 
 static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x05,
 		.HB2 = 0x0f,
 		.HB3 = 0x00,
 	};
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_catalog_write_audio_copy_mgmt(audio->catalog, &sdp_hdr);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
 }
 
 static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x06,
 		.HB2 = 0x0f,
 		.HB3 = 0x00,
 	};
+	u32 header[2];
+	u32 reg;
+
+	/* XXX: is it necessary to preserve this field? */
+	reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
+	sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
+
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
+}
 
-	msm_dp_catalog_write_audio_isrc(audio->catalog, &sdp_hdr);
+static void msm_dp_audio_config_sdp(struct msm_dp_audio_private *audio)
+{
+	struct msm_dp_catalog *msm_dp_catalog = audio->catalog;
+	u32 sdp_cfg, sdp_cfg2;
+
+	sdp_cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	/* AUDIO_TIMESTAMP_SDP_EN */
+	sdp_cfg |= BIT(1);
+	/* AUDIO_STREAM_SDP_EN */
+	sdp_cfg |= BIT(2);
+	/* AUDIO_COPY_MANAGEMENT_SDP_EN */
+	sdp_cfg |= BIT(5);
+	/* AUDIO_ISRC_SDP_EN  */
+	sdp_cfg |= BIT(6);
+	/* AUDIO_INFOFRAME_SDP_EN  */
+	sdp_cfg |= BIT(20);
+
+	drm_dbg_dp(audio->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
+
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, sdp_cfg);
+
+	sdp_cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	/* IFRM_REGSRC -> Do not use reg values */
+	sdp_cfg2 &= ~BIT(0);
+	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
+	sdp_cfg2 &= ~BIT(1);
+
+	drm_dbg_dp(audio->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
+
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
 }
 
 static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
 {
-	msm_dp_catalog_audio_config_sdp(audio->catalog);
+	msm_dp_audio_config_sdp(audio);
 
 	msm_dp_audio_stream_sdp(audio);
 	msm_dp_audio_timestamp_sdp(audio);
@@ -102,8 +164,7 @@ static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
 
 static void msm_dp_audio_setup_acr(struct msm_dp_audio_private *audio)
 {
-	u32 select = 0;
-	struct msm_dp_catalog *catalog = audio->catalog;
+	u32 select, acr_ctrl;
 
 	switch (audio->msm_dp_audio.bw_code) {
 	case DP_LINK_BW_1_62:
@@ -124,13 +185,17 @@ static void msm_dp_audio_setup_acr(struct msm_dp_audio_private *audio)
 		break;
 	}
 
-	msm_dp_catalog_audio_config_acr(catalog, select);
+	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
+
+	drm_dbg_dp(audio->drm_dev, "select: %#x, acr_ctrl: %#x\n",
+		   select, acr_ctrl);
+
+	msm_dp_write_link(audio->catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
 }
 
 static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 safe_to_exit_level = 0;
+	u32 safe_to_exit_level, mainlink_levels;
 
 	switch (audio->msm_dp_audio.lane_count) {
 	case 1:
@@ -150,14 +215,33 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 		break;
 	}
 
-	msm_dp_catalog_audio_sfe_level(catalog, safe_to_exit_level);
+	mainlink_levels = msm_dp_read_link(audio->catalog, REG_DP_MAINLINK_LEVELS);
+	mainlink_levels &= 0xFE0;
+	mainlink_levels |= safe_to_exit_level;
+
+	drm_dbg_dp(audio->drm_dev,
+		   "mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
+		   mainlink_levels, safe_to_exit_level);
+
+	msm_dp_write_link(audio->catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
 }
 
 static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
+	u32 audio_ctrl;
+
+	audio_ctrl = msm_dp_read_link(audio->catalog, MMSS_DP_AUDIO_CFG);
+
+	if (enable)
+		audio_ctrl |= BIT(0);
+	else
+		audio_ctrl &= ~BIT(0);
+
+	drm_dbg_dp(audio->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
 
-	msm_dp_catalog_audio_enable(catalog, enable);
+	msm_dp_write_link(audio->catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
+	/* make sure audio engine is disabled */
+	wmb();
 }
 
 static struct msm_dp_audio_private *msm_dp_audio_get_data(struct msm_dp *msm_dp_display)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index e9db5585c1325fe5e067526f567e39387d5a4f47..332d168811c28f5c54069db9754ecf69904d5b24 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -670,169 +670,3 @@ struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
 
 	return &catalog->msm_dp_catalog;
 }
-
-void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
-				       struct dp_sdp_header *sdp_hdr)
-{
-	u32 header[2];
-
-	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
-}
-
-void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr)
-{
-	u32 header[2];
-
-	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
-}
-
-void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr)
-{
-	u32 header[2];
-
-	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
-}
-
-void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr)
-{
-	u32 header[2];
-
-	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
-}
-
-void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
-				     struct dp_sdp_header *sdp_hdr)
-{
-	struct dp_sdp_header tmp = *sdp_hdr;
-	u32 header[2];
-	u32 reg;
-
-	/* XXX: is it necessary to preserve this field? */
-	reg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_AUDIO_ISRC_1);
-	tmp.HB3 = FIELD_GET(HEADER_3_MASK, reg);
-
-	msm_dp_utils_pack_sdp_header(&tmp, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
-}
-
-void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *msm_dp_catalog, u32 select)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 acr_ctrl;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
-
-	drm_dbg_dp(catalog->drm_dev, "select: %#x, acr_ctrl: %#x\n",
-					select, acr_ctrl);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
-}
-
-void msm_dp_catalog_audio_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 audio_ctrl;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	audio_ctrl = msm_dp_read_link(msm_dp_catalog, MMSS_DP_AUDIO_CFG);
-
-	if (enable)
-		audio_ctrl |= BIT(0);
-	else
-		audio_ctrl &= ~BIT(0);
-
-	drm_dbg_dp(catalog->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
-	/* make sure audio engine is disabled */
-	wmb();
-}
-
-void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 sdp_cfg = 0;
-	u32 sdp_cfg2 = 0;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	sdp_cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
-	/* AUDIO_TIMESTAMP_SDP_EN */
-	sdp_cfg |= BIT(1);
-	/* AUDIO_STREAM_SDP_EN */
-	sdp_cfg |= BIT(2);
-	/* AUDIO_COPY_MANAGEMENT_SDP_EN */
-	sdp_cfg |= BIT(5);
-	/* AUDIO_ISRC_SDP_EN  */
-	sdp_cfg |= BIT(6);
-	/* AUDIO_INFOFRAME_SDP_EN  */
-	sdp_cfg |= BIT(20);
-
-	drm_dbg_dp(catalog->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, sdp_cfg);
-
-	sdp_cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
-	/* IFRM_REGSRC -> Do not use reg values */
-	sdp_cfg2 &= ~BIT(0);
-	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
-	sdp_cfg2 &= ~BIT(1);
-
-	drm_dbg_dp(catalog->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
-}
-
-void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *msm_dp_catalog, u32 safe_to_exit_level)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 mainlink_levels;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	mainlink_levels = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS);
-	mainlink_levels &= 0xFE0;
-	mainlink_levels |= safe_to_exit_level;
-
-	drm_dbg_dp(catalog->drm_dev,
-			"mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
-			 mainlink_levels, safe_to_exit_level);
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 60f08fe888cb110e3fc3dfb1d763a57bd5bf47f6..9ebdc9bd865c566efb97cf0edbdcd809e5a713e7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -150,20 +150,4 @@ u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog);
 
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
-/* DP Audio APIs */
-void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
-				       struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
-				     struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *catalog, u32 select);
-void msm_dp_catalog_audio_enable(struct msm_dp_catalog *catalog, bool enable);
-void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *catalog);
-void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_exit_level);
-
 #endif /* _DP_CATALOG_H_ */

-- 
2.39.5

