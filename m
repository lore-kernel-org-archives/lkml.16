Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2385257448
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748560531; cv=none; b=aGRk9RVY9ZF2JjBG7w7uu/W7Xw+6tpRtUPQHY7XG3ZMvifbKB/21bTflm7ZkzcGPtPvIOxulwqxRQ1nA2FjzPWg+47E37KcXgY1tt4Xni6Ddc4GOFCmraruVBp3XhfWlCNzPgKOLfkoAzuU4mKygDfWUSVZANE6J7CmH+iHf8m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748560531; c=relaxed/simple;
	bh=Qu9dpHlIRB4zOegYzAEmciE3+UoqCif4T5fM30oyon8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFFnJlM0t31gScOOVJmoPYWLcpTLVCSYhgS0l2Z5Nw7acWE4+0Rym7eY8U5Md4X5HM4fEEi1ywUSlxvk9BX401huNSXDCHnx2Sc6RYh1HmUDnY2sZku3AQsRVVNiz0bs1QenPKIZn/hsvJB3injL56C8TFWbadYd8GK30VahBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlWWlbeb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlWWlbeb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1Pgb008084
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vbVMjvU68KSE4FGI+lKVINOGIspYhFfmjickrGZhQg=; b=WlWWlbebHQXU7IaB
	t02zhGKFXbemRqNf/kw0uIQ2ao2KMbVnBK4Vp0zi47WsA4reWndY8e7xqQ1hojRB
	J+qGJNVIKrXM6i05AmGI5qhB2FhX27TRfxaoDjqrfZEwOg4LXY/NPfyVxIgfRMYF
	HqW7vcJgbKLWqj4jhP87dYB+Ztkmk4edDm/NOqrWZJqlzS0/ZGj0wzJF9O/5Nz37
	hMYt2VK5NyXch9g8NMglhWP9YjGQdW/KatJnJ6fZPXkz1UZO2Jr5/dx9I8+PxxKE
	zL6nFpON9riyWpNQMTmq1NwpwQEVQ+8v/or1p7451QCXHI6xxJ5GvbEthnxk46ZC
	YJ8sUw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf7jmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:15:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b0f807421c9so953981a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748560528; x=1749165328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vbVMjvU68KSE4FGI+lKVINOGIspYhFfmjickrGZhQg=;
        b=waVaTJuvOMiFxwHWlyhNbNK4n6j/ds/hJym9jmv7Zt2vyPkEw0ZxNvphfiXphenjYI
         QdsiuoX1m/4aFkvA2KifALcmmpku5lU95dlJW0y/EIMtUx3S31W196IzCHMtcmAHIBAP
         UHMuo3TRlpfKv2dvvw+yl8nqU1vD0T2eOD0nW66C98E8qL+6X6wbuU2yQUPNzbUx45ob
         fdDF0uj84k5VI6adZYQzvH+ZyJsUtWq92KTwhUhqo2vxGeIZ8BKHT0rrgc+gIRLsJjrh
         3MForKCdhBhyzM1X3BFucKyiCGb2lHqSlkHFQf7P7Mt/hasdVEq82nbKZYjYH7hVfRqU
         3BrA==
X-Forwarded-Encrypted: i=1; AJvYcCWPtBFrH85gdOALaFUTjJok/eAoOilSgBItVsJyzNbrXFhzVUZ1V8NjuKbVNvh9DjRStffgDztClCMStws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0az97iTo8aWX6StVX075rNp7CVEQF50BFFbOTzFgdueRXNBI8
	L4l5B41C/L8zPu6t7vRIipe0YjcXhwvCXH3umLwsbqzvSiy6Qht90up3b/WMSsqQX/MOUm5X7Ls
	lNjr5Scomy2wNkUvA0V4FXivh30cgkq1glkAc7dJ/OisBGB97pYvPnwE5hr7U43tXARw=
X-Gm-Gg: ASbGnctA9RK+9jQAkZ6SscV4BueQI+UGI8+Hl4T9/CveDc8AVQGB4v0DJVExvrghRCk
	JrzKF90EwNzZTgUDA0SttQ4x55VXOaN41XdJyjOTd+5Qw9CSE8bfV/5PCDZaYIWmQYGQ4tw7A/i
	8ADITlQ217pwvzUb8L7zgk9CX28Hoc55mAUAbBjy9zWOPwFG5lAOGqWO0EWMJNaUJITkZHynHzr
	fkzzaUwhr3VN16LDLip+eVweQpJIU42yI3KWiILlS0KS/uZqBKE0NPgW5mV7bW+6GOaLe2Edgge
	QuKWVaaLiMye1o3fz6XGLM+rlODEMbUlHiGNrr2Bs2n6hdxs0GNLAWA5EB4s12j/pexsYlYG
X-Received: by 2002:a17:90b:47:b0:30e:6a9d:d787 with SMTP id 98e67ed59e1d1-31241532ec2mr2226129a91.11.1748560527842;
        Thu, 29 May 2025 16:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKS8hP5QDpmvy9MOsu098RPR9jWdEHOkxDAW+2Xf6gU153iGKt6qoNGu8DVdUnTocC11rWTQ==
X-Received: by 2002:a17:90b:47:b0:30e:6a9d:d787 with SMTP id 98e67ed59e1d1-31241532ec2mr2226080a91.11.1748560527405;
        Thu, 29 May 2025 16:15:27 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 16:15:27 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:46 -0700
Subject: [PATCH 4/4] drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-4-ce33bac2987c@oss.qualcomm.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=1865;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=LQos15gYFKCo04VJZ/As3557mLEuaumxqfi0RxOfo5Y=;
 b=ZyMmKPBhU5YA6EHWCvynOwpmKVsv3ib05zmarBy/e1MwPCLCy3gRO0/VTzFbpLW+pORd1zhqW
 Qr5/lo9J/i2Ci3LD8bTC68qtF6PkoPKgqziVkownWvT+mt52PpUs1pg
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6838ea90 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=zUghIR52pHC5fQqyx9gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UTcJ6bcm0JfPOQJUL770zK-YeLfHctTb
X-Proofpoint-GUID: UTcJ6bcm0JfPOQJUL770zK-YeLfHctTb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfX8wxzYTKHFA9Q
 yZQf7dotnQpwWpsYqebd3vCP40+lHZEj3Ocesf4VUvkQU59wdNYBCQS/scyAP+TzLturmWOJXkd
 pf6C2NpocesVdUH7Wr8nK64BGDKeC8278ZIkgeesom5hWr/zcIru3zQPXZ5qTCWxyjRiCtEOvNj
 yOu9VM7He2UOr5+o2xUQpENa/bDe+EFQq1YTWwYJquQd4jrnovu+16otcDaEcL+TYz4jP8b5R3W
 jRs3q73gaCML+dj85vJGpGB34ipGkWvxc3+GmPBnbYHmBKnO64u4rIpms1wvJrRjQvfu9iB8MPr
 BqsDuKAqDJpNYd2WzpzAmmmVq4f0FEuq7c0fFrnhkRnD85BWNrW2bFj/rzf0Yj44m9Bm2ZHR6TA
 esnWRfcBm7VjvTOeJjYKjTIGH800EDAZ5jQsyWvRC2ErxIz7nHI7lNjeQUPbb2hCaOI9TRoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290227

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

ST_DISPLAY_OFF check in msm_dp_bridge_atomic_enable() is used to check
that if the display was disabled while still hotplugged, phy needs
to be re-initialized. This can be replaced with a different check as
it just means the hpd_state was still ST_CONNECTED but without display
being powered on. Replace the ST_DISPLAY_OFF check with a combination
of connected and power_on checks.

Since all consumers of ST_DISPLAY_OFF have now been removed,
drop ST_DISPLAY_OFF from the list of hpd_states as technically
this was never a 'hpd' state anyway.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 785c813d2b31..6f05a939ce9e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -50,7 +50,6 @@ enum {
 	ST_MAINLINK_READY,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
-	ST_DISPLAY_OFF,
 };
 
 enum {
@@ -1526,7 +1525,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	hpd_state =  msm_dp_display->hpd_state;
 
-	if (hpd_state == ST_DISPLAY_OFF) {
+	if (hpd_state == ST_CONNECTED && !dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}
@@ -1584,8 +1583,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (hpd_state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
 		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	} else {
-		msm_dp_display->hpd_state = ST_DISPLAY_OFF;
 	}
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);

-- 
2.49.0

