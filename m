Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD61280CE7
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431469; cv=none; b=cDJl+OTvKTFAqgWm5d0WbmwTxIPMrM6mcbeDRmEZuOWaSzcEFS7UepwRhbv1KlkQgndcl8MMdD/Rmg2LbTu5+K/BZb88N9iqJAVvByOl/kDr9SnRB0lheMX4Xt/QGXmg5Y2/1lpfAGc79pu83f+jlPaO8UBA4ONEBzGVFI4Xl0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431469; c=relaxed/simple;
	bh=vrEY9Tt8fYsWzGDFdSSai835U/fsc0iQ9IABFncLMos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OxZPZDh2gVGtjzd9SHix3x2/jcaq6K5ar36cAaMOa7aBxQ0x6ydxeXVPpqVJQF1bn8Fw8kI+KOlTyqNrAWinAO9GzEmlW2UBHXixg14qwI6pdApXnFjWLbZxfeTEGLM1+5XA5Nbiie7O63rq46TIjQW486oWIDpoz3NIIju8uAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMewpPd2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMewpPd2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S8knHo019648
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c6aM7WJ6bbAAgKf+qbF5aXJsLwsNSN7sBgN05z3YZ6E=; b=XMewpPd22mtVCp8G
	dzG2e9Z0C8mgTNg+B/T3/6x2g64S00h27M2kEJ+ltooJlW2fj2IyP9QCo1WIKA0l
	Q/i5AJbAfsgouRYpp4aXkMNwDnSubkzkz4n5klSwQCWUHgCQWkFiLLch84zPflIJ
	B5UpMZ2X6BOirW5gD0t3Vaa+fnxqvlDCMlsRI1VvOwxN8PXvVWKxhmJNmwdYU58Z
	+tNnGvf1wO/QXVqAyftHUgdXi8Zqx/uqNZV9CnrlxIxdRz1/xP57JnPpYWRSeMCp
	ctUlh6wM88J1ifUpQUHWpKOuXA7Cx0OrE32ELdF9AdGDDyAKkBxtEzzLDsad1fGt
	crzetw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqa7dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:24:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-311b6d25278so1650645a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748431465; x=1749036265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6aM7WJ6bbAAgKf+qbF5aXJsLwsNSN7sBgN05z3YZ6E=;
        b=pnSFcF7bfJeoh2UCojX0XehhNO4dGxgNO0k5wks2v9EWHO5ZK+jRidOR5DupkzusVX
         Fx1v4T4dUdymjn2rLbPsKzbwk0GVQrcdhSJZuKJldJBVa21LfgeTUIkdjDkR6vfzDbx3
         ErOGspUcORtnSaOEtONWWsFWDTWp5A28Xrg04GMPTx1t7NPss4Sxc5k6rSymmZFx3xdM
         MMuHdqINC3xrYC0mE3nw+5308ngXzDFHHWVed4Aj6/isX6KFPHoSnqKu8u2H9t5YRkSV
         rU0ep5qwK+tC+IV2mt5GA/txvN2kWvqNYglyi+qsXNqPqT5ovxpL3r35yV6YdWRylXL2
         EQzA==
X-Forwarded-Encrypted: i=1; AJvYcCVcQXGraSDtxTbhaaOrI53XEBlhlJT/iJ97C8xHWMmV7EOSLyNRKPFXdvUqIjwuGZNtp9Wh0m6G24dP2zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWbFkjOBU/rK9wZUO+mEekkVuGVDd8djJN6lz4l/r48l2L9tSX
	/4RPdIDN55QiRXLAk1nb9mnzPMDVU3rLfkGeBtuKuyF9RUaL2LwpbcqcFFVE5shm2Upbjx7VQuo
	CgWyezR2XEhXetYlroTvq6tB8QHAB1THIGU6iPkhLvdxcrgjyXk5UzNreT/c0zIA5pws=
X-Gm-Gg: ASbGncsZPJ08S01DiYjevQT9Mwy/Ox0V9afkZGJKPQ666xbUEIjJvYSEb3VMwv/fvP5
	qCJGlYbBSMQukUaPyEgKnjSSS/zEf3jYH5cjjpCMFXkqeJ8fmGJjahqj+yFOo+8FtoPlWfaChH8
	k0UxaFeUv3hTKFz65foV5vGNtbrTMchkUsLCUJNwqlY7MNRfw/ftWkxAkCTeHbz9OMxl+hCdGFk
	W2KBkvl+TppW2cL//JDJ+uQEUfs4IJr4/rTSqYzUv10SxmzlZ87bC9MgdosQVR6+RwHipni4Uen
	Bv/c79rivSDEYuVDRU8jUut0Qo8DeMyq9jyH3JwvRYATt8wzZVXxWxGq90AUrHQl8CCHh2E5uHa
	+4HXBFuLmxN2mPY9EZ99VMOah0l6+A0zfVf6g
X-Received: by 2002:a17:90b:33cc:b0:2fe:8282:cb9d with SMTP id 98e67ed59e1d1-311100da6acmr24059550a91.28.1748431464800;
        Wed, 28 May 2025 04:24:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYQkdCLHGDGzXmFuRyTueS+eLR+h+ITlJR4vzTTCJx1bCvNNmc74AQv9AprFZgGuC+FEkPJw==
X-Received: by 2002:a17:90b:33cc:b0:2fe:8282:cb9d with SMTP id 98e67ed59e1d1-311100da6acmr24059513a91.28.1748431464289;
        Wed, 28 May 2025 04:24:24 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-311e9b668ffsm954665a91.20.2025.05.28.04.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:24:23 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Wed, 28 May 2025 16:54:00 +0530
Subject: [PATCH ath-next 1/2] wifi: ath12k: handle WMI event for real noise
 floor calculation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-support_real_noise_floor-v1-1-04507bd3bc76@oss.qualcomm.com>
References: <20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com>
In-Reply-To: <20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 4ccdjZ59DWFexQVutlpCo63kYjXG24Dj
X-Proofpoint-ORIG-GUID: 4ccdjZ59DWFexQVutlpCo63kYjXG24Dj
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6836f26a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Ep9LWTjdhutGVinXlyQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwMCBTYWx0ZWRfX5lVLJhtrrKMC
 iNHF5u2gilaOArOi6ZB8l3qxnKToPNvW0rNh1mvXqi4wOtakcS4dy4yk+EYhfD0k2cS0PjKNdvq
 K5wwZxWb7HNrG2+lTGhShFjWoKwZPNNzqil6apylpX/biqMMrYnyXkxUxtQD0fvoZyr0qaJQ1aO
 EVLuuZY4rubfKNuv0eYjOJ7epDVWZfj2TBbtC7Wkc1VNmLFh7tMZL7fD2nL1XXthCKUQ8p42o9K
 S5CWJXeHIbJVA5NxeZ+g2Kfe2R8FZlrHVhUgELo+XIYbYtkIV/Lxs6FfoIutgNPjbhiviX+dXdt
 B08H3YC9NNfxulv51E3DxMXXDT5hD11YHZrJhjfYN16NTF12pBR6nU9l4iOg2+ggk8EB4H6HMyD
 tUERBvx4M1oHB3HvsXe5eb9YQawaXtNw/ccG0sedDGnzvPQO8uPcOPVOFNIXaCH60ikU08c0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280100

From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
value, providing an estimated noise floor value. Consequently, the RSSI
value is also approximate. This works but however, using actual noise floor
value will enable the reporting of the true RSSI value.

The firmware possesses the necessary data to determine the actual noise
floor. This data is provided to the host via the WMI event
WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
runtime parameters needed for calculating the real noise floor in dBm. This
event is triggered by the firmware during channel changes, temperature
offset adjustments, and hardware chainmask modifications. The individual
TLVs may not always be present in each event. For instance, temperature
information might only appear if there is a change in offset due to
temperature variation.

Add support to handle and parse this WMI event. Use the received values to
calculate and store the noise floor value.

A subsequent change will use this noise floor value in the actual RSSI
calculation.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Co-developed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  17 +++
 drivers/net/wireless/ath/ath12k/mac.c  |   4 +
 drivers/net/wireless/ath/ath12k/wmi.c  | 226 +++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h  |  42 ++++++
 4 files changed, 289 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 941db6e49d6eaeb03783f7714d433259d887820b..c98193413d2283f0fa7c5cf6a5e4fbe82c928c31 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -665,6 +665,15 @@ struct ath12k_per_peer_tx_stats {
 	bool is_ampdu;
 };
 
+struct ath12k_pdev_rssi_offsets {
+	s32 temp_offset;
+	s8 min_nf_dbm;
+	/* Cache the sum here to avoid calculating it every time in hot path
+	 * noise_floor = min_nf_dbm + temp_offset
+	 */
+	s32 noise_floor;
+};
+
 #define ATH12K_FLUSH_TIMEOUT (5 * HZ)
 #define ATH12K_VDEV_DELETE_TIMEOUT_HZ (5 * HZ)
 
@@ -814,6 +823,7 @@ struct ath12k {
 	unsigned long last_tx_power_update;
 
 	s8 max_allowed_tx_power;
+	struct ath12k_pdev_rssi_offsets rssi_info;
 };
 
 struct ath12k_hw {
@@ -1454,4 +1464,11 @@ static inline struct ath12k_base *ath12k_ag_to_ab(struct ath12k_hw_group *ag,
 	return ag->ab[device_id];
 }
 
+static inline s32 ath12k_pdev_get_noise_floor(struct ath12k *ar)
+{
+	lockdep_assert_held(&ar->data_lock);
+
+	return ar->rssi_info.noise_floor;
+}
+
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88b59f3ff87af8b48cb3fafcd364fd9ced4ff197..8ff470749f14545d1c726cc1dc26880e129277fa 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11898,6 +11898,10 @@ static int ath12k_mac_setup_register(struct ath12k *ar,
 	ar->max_num_stations = ath12k_core_get_max_station_per_radio(ar->ab);
 	ar->max_num_peers = ath12k_core_get_max_peers_per_radio(ar->ab);
 
+	ar->rssi_info.min_nf_dbm = ATH12K_DEFAULT_NOISE_FLOOR;
+	ar->rssi_info.temp_offset = 0;
+	ar->rssi_info.noise_floor = ar->rssi_info.min_nf_dbm + ar->rssi_info.temp_offset;
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 60e2444fe08cefa39ae218d07eb9736d2a0c982b..e07f1e46ba418a0583a0feaa711ada7b6cd193e2 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -8711,6 +8711,229 @@ static void ath12k_wmi_process_tpc_stats(struct ath12k_base *ab,
 }
 #endif
 
+static int
+ath12k_wmi_rssi_dbm_conv_info_evt_subtlv_parser(struct ath12k_base *ab,
+						u16 tag, u16 len,
+						const void *ptr, void *data)
+{
+	const struct ath12k_wmi_rssi_dbm_conv_temp_info_params *temp_info;
+	const struct ath12k_wmi_rssi_dbm_conv_info_params *param_info;
+	struct ath12k_wmi_rssi_dbm_conv_info_arg *rssi_info = data;
+	struct ath12k_wmi_rssi_dbm_conv_param_arg param_arg;
+	s32 nf_hw_dbm[ATH12K_MAX_NUM_NF_HW_DBM];
+	u8 num_20mhz_segments;
+	s8 min_nf, *nf_ptr;
+	int i, j;
+
+	switch (tag) {
+	case WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO:
+		if (len < sizeof(*param_info)) {
+			ath12k_warn(ab,
+				    "RSSI dbm conv subtlv 0x%x invalid len %d rcvd",
+				    tag, len);
+			return -EINVAL;
+		}
+
+		param_info = ptr;
+
+		param_arg.curr_bw = le32_to_cpu(param_info->curr_bw);
+		param_arg.curr_rx_chainmask = le32_to_cpu(param_info->curr_rx_chainmask);
+
+		/* The received array is actually a 2D byte-array for per chain,
+		 * per 20MHz subband. Convert to 2D byte-array
+		 */
+		nf_ptr = &param_arg.nf_hw_dbm[0][0];
+
+		for (i = 0; i < ATH12K_MAX_NUM_NF_HW_DBM; i++) {
+			nf_hw_dbm[i] = a_sle32_to_cpu(param_info->nf_hw_dbm[i]);
+
+			for (j = 0; j < 4; j++) {
+				*nf_ptr = (nf_hw_dbm[i] >> (j * 8)) & 0xFF;
+				nf_ptr++;
+			}
+		}
+
+		switch (param_arg.curr_bw) {
+		case WMI_CHAN_WIDTH_20:
+			num_20mhz_segments = 1;
+			break;
+		case WMI_CHAN_WIDTH_40:
+			num_20mhz_segments = 2;
+			break;
+		case WMI_CHAN_WIDTH_80:
+			num_20mhz_segments = 4;
+			break;
+		case WMI_CHAN_WIDTH_160:
+			num_20mhz_segments = 8;
+			break;
+		case WMI_CHAN_WIDTH_320:
+			num_20mhz_segments = 16;
+			break;
+		default:
+			ath12k_warn(ab, "Invalid current bandwidth %d in RSSI dbm event",
+				    param_arg.curr_bw);
+			/* In error case, still consider the primary 20 MHz segment since
+			 * that would be much better than instead of dropping the whole
+			 * event
+			 */
+			num_20mhz_segments = 1;
+		}
+
+		min_nf = ATH12K_DEFAULT_NOISE_FLOOR;
+
+		for (i = 0; i < ATH12K_MAX_NUM_ANTENNA; i++) {
+			if (!(param_arg.curr_rx_chainmask & BIT(i)))
+				continue;
+
+			for (j = 0; j < num_20mhz_segments; j++) {
+				if (param_arg.nf_hw_dbm[i][j] < min_nf)
+					min_nf = param_arg.nf_hw_dbm[i][j];
+			}
+		}
+
+		rssi_info->min_nf_dbm = min_nf;
+		rssi_info->nf_dbm_present = true;
+		break;
+	case WMI_TAG_RSSI_DBM_CONVERSION_TEMP_OFFSET_INFO:
+		if (len < sizeof(*temp_info)) {
+			ath12k_warn(ab,
+				    "RSSI dbm conv subtlv 0x%x invalid len %d rcvd",
+				    tag, len);
+			return -EINVAL;
+		}
+
+		temp_info = ptr;
+		rssi_info->temp_offset = a_sle32_to_cpu(temp_info->offset);
+		rssi_info->temp_offset_present = true;
+		break;
+	default:
+		ath12k_dbg(ab, ATH12K_DBG_WMI,
+			   "Unknown subtlv 0x%x in RSSI dbm conversion event\n", tag);
+	}
+
+	return 0;
+}
+
+static int
+ath12k_wmi_rssi_dbm_conv_info_event_parser(struct ath12k_base *ab,
+					   u16 tag, u16 len,
+					   const void *ptr, void *data)
+{
+	int ret = 0;
+
+	switch (tag) {
+	case WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM:
+		/* Fixed param is already processed*/
+		break;
+	case WMI_TAG_ARRAY_STRUCT:
+		/* len 0 is expected for array of struct when there
+		 * is no content of that type inside that tlv
+		 */
+		if (len == 0)
+			return 0;
+
+		ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+					  ath12k_wmi_rssi_dbm_conv_info_evt_subtlv_parser,
+					  data);
+		break;
+	default:
+		ath12k_dbg(ab, ATH12K_DBG_WMI,
+			   "Received invalid tag 0x%x for RSSI dbm conv info event\n",
+			   tag);
+		break;
+	}
+
+	return ret;
+}
+
+static int
+ath12k_wmi_rssi_dbm_conv_info_process_fixed_param(struct ath12k_base *ab, u8 *ptr,
+						  size_t len, int *pdev_id)
+{
+	struct ath12k_wmi_rssi_dbm_conv_info_fixed_params *fixed_param;
+	const struct wmi_tlv *tlv;
+	u16 tlv_tag;
+
+	if (len < (sizeof(*fixed_param) + TLV_HDR_SIZE)) {
+		ath12k_warn(ab, "invalid RSSI dbm conv event size %zu\n", len);
+		return -EINVAL;
+	}
+
+	tlv = (struct wmi_tlv *)ptr;
+	tlv_tag = le32_get_bits(tlv->header, WMI_TLV_TAG);
+	ptr += sizeof(*tlv);
+
+	if (tlv_tag != WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM) {
+		ath12k_warn(ab, "RSSI dbm conv event received without fixed param tlv\n");
+		return -EINVAL;
+	}
+
+	fixed_param = (struct ath12k_wmi_rssi_dbm_conv_info_fixed_params *)ptr;
+	*pdev_id = le32_to_cpu(fixed_param->pdev_id);
+
+	return 0;
+}
+
+static void
+ath12k_wmi_update_rssi_offsets(struct ath12k *ar,
+			       struct ath12k_wmi_rssi_dbm_conv_info_arg *rssi_info)
+{
+	struct ath12k_pdev_rssi_offsets *info = &ar->rssi_info;
+
+	lockdep_assert_held(&ar->data_lock);
+
+	if (rssi_info->temp_offset_present)
+		info->temp_offset = rssi_info->temp_offset;
+
+	if (rssi_info->nf_dbm_present)
+		info->min_nf_dbm = rssi_info->min_nf_dbm;
+
+	info->noise_floor = info->min_nf_dbm + info->temp_offset;
+}
+
+static void
+ath12k_wmi_rssi_dbm_conversion_params_info_event(struct ath12k_base *ab,
+						 struct sk_buff *skb)
+{
+	struct ath12k_wmi_rssi_dbm_conv_info_arg rssi_info;
+	struct ath12k *ar;
+	s32 noise_floor;
+	u32 pdev_id;
+	int ret;
+
+	ret = ath12k_wmi_rssi_dbm_conv_info_process_fixed_param(ab, skb->data, skb->len,
+								&pdev_id);
+	if (ret) {
+		ath12k_warn(ab, "failed to parse fixed param in RSSI dbm conv event: %d\n",
+			    ret);
+		return;
+	}
+
+	rcu_read_lock();
+	ar = ath12k_mac_get_ar_by_pdev_id(ab, pdev_id);
+	/* If pdev is not active, ignore the event */
+	if (!ar)
+		goto out_unlock;
+
+	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
+				  ath12k_wmi_rssi_dbm_conv_info_event_parser,
+				  &rssi_info);
+	if (ret) {
+		ath12k_warn(ab, "unable to parse RSSI dbm conversion event\n");
+		goto out_unlock;
+	}
+
+	spin_lock_bh(&ar->data_lock);
+	ath12k_wmi_update_rssi_offsets(ar, &rssi_info);
+	noise_floor = ath12k_pdev_get_noise_floor(ar);
+	spin_unlock_bh(&ar->data_lock);
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI,
+		   "RSSI noise floor updated, new value is %d dbm\n", noise_floor);
+out_unlock:
+	rcu_read_unlock();
+}
+
 static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
@@ -8842,6 +9065,9 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_11D_NEW_COUNTRY_EVENTID:
 		ath12k_reg_11d_new_cc_event(ab, skb);
 		break;
+	case WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID:
+		ath12k_wmi_rssi_dbm_conversion_params_info_event(ab, skb);
+		break;
 	/* add Unsupported events (rare) here */
 	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
 	case WMI_PEER_OPER_MODE_CHANGE_EVENTID:
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index ac18f75e04492b62594acb159e3b43b81bd6c392..f0da8bc76390be85a5ba2f79bbbddf07eb465f73 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -734,6 +734,8 @@ enum wmi_tlv_event_id {
 	WMI_SERVICE_READY_EXT2_EVENTID,
 	WMI_PDEV_GET_HALPHY_CAL_STATUS_EVENTID =
 					WMI_SERVICE_READY_EXT2_EVENTID + 4,
+	WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID =
+				WMI_PDEV_GET_HALPHY_CAL_STATUS_EVENTID + 5,
 	WMI_VDEV_START_RESP_EVENTID = WMI_TLV_CMD(WMI_GRP_VDEV),
 	WMI_VDEV_STOPPED_EVENTID,
 	WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID,
@@ -1991,6 +1993,9 @@ enum wmi_tlv_tag {
 	WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD = 0x3D8,
 	WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD = 0x3D9,
 	WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD = 0x3FB,
+	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM = 0x427,
+	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO,
+	WMI_TAG_RSSI_DBM_CONVERSION_TEMP_OFFSET_INFO,
 	WMI_TAG_HALPHY_CTRL_PATH_CMD_FIXED_PARAM = 0x442,
 	WMI_TAG_HALPHY_CTRL_PATH_EVENT_FIXED_PARAM,
 	WMI_TAG_MAX
@@ -5997,6 +6002,43 @@ struct wmi_vdev_set_tpc_power_cmd {
 	 */
 } __packed;
 
+#define ATH12K_MAX_20MHZ_SEGMENTS	16
+#define ATH12K_MAX_NUM_ANTENNA		8
+#define ATH12K_MAX_NUM_NF_HW_DBM	32
+
+struct ath12k_wmi_rssi_dbm_conv_info_fixed_params {
+	__le32 pdev_id;
+} __packed;
+
+struct ath12k_wmi_rssi_dbm_conv_info_params {
+	__le32 curr_bw;
+	__le32 curr_rx_chainmask;
+	__le32 xbar_config;
+	a_sle32 xlna_bypass_offset;
+	a_sle32 xlna_bypass_threshold;
+	a_sle32 nf_hw_dbm[ATH12K_MAX_NUM_NF_HW_DBM];
+} __packed;
+
+struct ath12k_wmi_rssi_dbm_conv_temp_info_params {
+	a_sle32 offset;
+} __packed;
+
+struct ath12k_wmi_rssi_dbm_conv_param_arg {
+	u32 curr_bw;
+	u32 curr_rx_chainmask;
+	u32 xbar_config;
+	s32 xlna_bypass_offset;
+	s32 xlna_bypass_threshold;
+	s8 nf_hw_dbm[ATH12K_MAX_NUM_ANTENNA][ATH12K_MAX_20MHZ_SEGMENTS];
+};
+
+struct ath12k_wmi_rssi_dbm_conv_info_arg {
+	bool temp_offset_present;
+	s32 temp_offset;
+	bool nf_dbm_present;
+	s8 min_nf_dbm;
+};
+
 void ath12k_wmi_init_qcn9274(struct ath12k_base *ab,
 			     struct ath12k_wmi_resource_config_arg *config);
 void ath12k_wmi_init_wcn7850(struct ath12k_base *ab,

-- 
2.34.1

