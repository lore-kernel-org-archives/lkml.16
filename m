Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0BC2627F7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 06:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092423; cv=none; b=tZn7LFtQxKUkLWgPujFXSfk4Vqo3YBbdSPc2NrrFiGfzyAJmhkRRChv4t0SdJ1rQiooebc2xVN6v/q6oEKt5UlGZ8a/faEvA1kX6REyq3nbY0mwH095dHPX4+VGgFTqYprwrYtwGEj9Grs68g1Dva3wXcbSpdLpv440THQY93oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092423; c=relaxed/simple;
	bh=zmz0c4mSLGFxJuRbfWzls38k0cxjuskWRE0Eq554GoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9HWL0SHLTrOoxGCZy9gYryZ562X9Ms9Xqot54Fz5f30rf4nE5/huRtoLjuHjoHy2g1WzwI/Rxtf/oecjabkdMpJ8sULN8h5bVcHSUqTYYI7E86m/i5kpZye75yFjBHg4ZT/7hQh3p1LIYj7ycmrPr1B6Nh9gD0zjspIdLziMCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUo57VaS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUo57VaS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GZcv020241
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 06:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XilFwlxG3QLgFkotXu2wdZpmkObNvAbLqmHueg9pqb4=; b=dUo57VaSdG2Vu405
	ibWQyYjVwgAmv0QCTKKLtwtisPg2OdvfgFzBvY9Ph8ao5lYhc/FZZ9mMloXDtAmr
	cUMV/EqGWg+/qSEIutKiuWDoQuijoj2WUYiUFwk8p+VtFq8725SbgD9LHE5ZxwxR
	sG4XWa/xGBwNJRF+twzv+BXksxTz5X64Ozh89JixDAU2R7NhH+XYXmEf0CAMxe/p
	xO6NORG3LqIZzxSb0QVv40mDEWeUAq4mVhzZYYrSycMjHx+OR67XwRF4C1u2PQM+
	pn07XrG2W+9pRvpgpTM7+jTl3ZLm3V/MzugwdidZMA/ayAGWeOaBLqKfj3LxR62s
	Sk6cag==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2ppa0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:07:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73917303082so3600377b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 23:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092421; x=1744697221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XilFwlxG3QLgFkotXu2wdZpmkObNvAbLqmHueg9pqb4=;
        b=QTaI0bu8H+CnRn6g9XqzCBxqlFKwUfDZOWu7W5YXmpqWGxNh92Wo4oe5wOaUAxrdLj
         bXuY/BFeAV+HpoAAZR7ZteS27lpATdw4jEl9c1PoJ5WHWuWkY7Ji471qIAlRMXdCA4Ge
         d6yneCM2nLopDPbtq52SZrpZSLiRqm/ApfKBB5HDDKHy7R+qWd0E+M8HOWa/+U1AsI46
         mfKfRoAwBr50NuNCWYyZZUvNn+NCgF60KVEhjZp3bl8qLtuZQcOkT5iRn5LvYHOwuiIL
         Fyth720cbhngPwuH0xUiyDI8WikWS3fUkgMVl9OiOqYbtuw3pNKBBp60kuCnNkCTYeI9
         E+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXe0ryPvb9I/6CHGqL9CgrQ7ffTwtfSJldBiUcYfDN93fnSVRObd6xzhC5wmKrZ7xA3zelxBwJHPHs5oK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAIsyGlQxvG+Jrn7CTNW/yrrcZDII7HWvBIQXR6rssWSq4T1Fc
	gaBJKLM17dRMmPE2b75kCKC2wRGZJKyxt/+Gt+KmuVhIyEusucbAMEo+C/XBKtKCUim1sbIXlLA
	VxNaVy1znXM39XkkB/CMVb8EUyRyqyDDhIsYWSEOJ7eEz2pM+8c9zeQchOnppqkU=
X-Gm-Gg: ASbGncuKq0wy1OcKe4grGwc9LoHPg5dEY4f1bcAlLjJLJZMbm0kfFStyILoqirDw5K5
	+FZ2dF4gS+41pvVsjSXC0Dui/jjLaH6iKVvsy1GjVyPCFm/29q2JhwtZXT8sQ4+nufjn0CnQ16h
	/D1S1F8nYSi1qNNS8np6Z/NxLT67uvALgdyG9cMzbnm84QpSnyCJOpCzPL2W5kjg1UZRbAuGfgw
	fUatSl0aEl5g8xUjtOkpFXE9atwIpiqAy2KGkGlLmUI3tCN3FdxXouIa9yerUceOaHTIJZGSrJX
	okzXXLmH5h9wQ0/6cVW6AfTKzOxi282mCfOeVWWcxUAX4gvOkx8i6mm9MAD84gESEcqAddMgnBO
	5BZlxWtWodAhSMASmDEC8mftl9muF4UJse0ly91MU
X-Received: by 2002:a05:6a00:2186:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-739e4be8c14mr19887000b3a.15.1744092420836;
        Mon, 07 Apr 2025 23:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6V1K+A72p6ax1SQOI5iH5ofN/dK0np0CGIaKKMDNjVDYs3xGeXEuliC86DR471I1M0d0xYQ==
X-Received: by 2002:a05:6a00:2186:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-739e4be8c14mr19886980b3a.15.1744092420424;
        Mon, 07 Apr 2025 23:07:00 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:07:00 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:34 +0530
Subject: [PATCH ath-next v4 6/9] wifi: ath12k: fix
 ath12k_core_pre_reconfigure_recovery() with grouping
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-6-95e7bf048595@oss.qualcomm.com>
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: qDYijtNt0xAQDoZpQgpj1pExuo0-jFi_
X-Proofpoint-GUID: qDYijtNt0xAQDoZpQgpj1pExuo0-jFi_
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f4bd05 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=d-GbLxaNKwXvygB75HgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042

Currently, ath12k_core_pre_reconfigure_recovery() reconfigures all radios
within the same group. During grouping and driver going for a recovery,
this function is called as many times as there are devices in the group.
Consequently, it performs the same reconfiguration multiple times, which
is unnecessary.

To prevent this, add a check to continue if the action has already been
taken.

To simplify the management of various flags, the reason for hardware queues
being stopped is used as a check instead of introducing a new flag.

While at it, also add missing wiphy locks. Wiphy lock is required since
ath12k_mac_drain_tx() which is called by
ath12k_core_pre_reconfigure_recovery() needs this lock to be held by the
caller.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index cb2a99d110d5c9ec2c092fe1a2b776b6265c4126..0fb3e57cd254ede767528e47e1d9d183257e5b71 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1411,6 +1411,18 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		    ah->state == ATH12K_HW_STATE_TM)
 			continue;
 
+		wiphy_lock(ah->hw->wiphy);
+
+		/* If queue 0 is stopped, it is safe to assume that all
+		 * other queues are stopped by driver via
+		 * ieee80211_stop_queues() below. This means, there is
+		 * no need to stop it again and hence continue
+		 */
+		if (ieee80211_queue_stopped(ah->hw, 0)) {
+			wiphy_unlock(ah->hw->wiphy);
+			continue;
+		}
+
 		ieee80211_stop_queues(ah->hw);
 
 		for (j = 0; j < ah->num_radio; j++) {
@@ -1439,6 +1451,8 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 			ar->monitor_vdev_created = false;
 			ar->monitor_started = false;
 		}
+
+		wiphy_unlock(ah->hw->wiphy);
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);

-- 
2.34.1

