Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA8E256C87
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748560531; cv=none; b=Ca5ydXqNrK7PbZebCgz1ZBkO4GY8VotKoD57ueGQrXhawHCPAz5c2KijD2QqdtslIafrtMTWEXDKK+8xmF6il6uieVWIXHxzawAgm11zQPXDa1Mne7GCutNihBUP6i+HdfNDK+zgFes9BydhgqapQidltxIcgb0JmVXXNX31IO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748560531; c=relaxed/simple;
	bh=ZAGZk4Y8vogmDbZftZ++ijHWg2vj1zOvE7SDTgM361I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qs+USZPzYs/kD2rtPzcD5O1zrY/WETvRHN7ZwF7CLP+fLb8WrHM6OKXiQOJ+IAxmlHY4GfoSem/FNnDIYhozCw7lLEv7IPg/v7nPEfOsjT0THs+qrcPlHmSM20UJmbm2QdgXQHswzD2C7kqRwFvd7p9xyCzNdGMdHkiE8ZFte3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSXkEdKV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSXkEdKV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1UL4011736
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kX7efsc+IS2/784jVqW415KcZ7V01+TYXKPRgFgJmG8=; b=eSXkEdKVaeU3v7Pp
	x5jGtq5KlfskOfsXmQ7UPlUErWjQ01zFJI7mP8oORmLZy96DYDA82kap14XFkI/L
	aQu4KaGOxcTdrv+pXUUhu//ti77g2G+ycy7kuf4vYY+39FtQJYjfAgWiA6dqEzgn
	Sw1k0vcUYUmUqC5ibN8c7LUdjlaO1SbX9k5ezZZgHLGnmN7RPSG4K9FYyVXzQn/P
	59qICEAD6zD0y+Z1zu3U6XG1iwBNkErExbcjdVYup85kqGYN/YAsHE7wsYW5syRV
	h7in1HuTZqol5BkLTKANsLL3EL4UKQV5B/QNU3N7to7Vw/ie3LvFjco7HnqY0VKo
	X7bk1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g9785v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:15:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3119ba092aeso2143892a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748560526; x=1749165326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX7efsc+IS2/784jVqW415KcZ7V01+TYXKPRgFgJmG8=;
        b=O6a/XJe+5arJORn7P4HTOkt7swngJZdcDhXL+W4xF/7PI5j/lU5QSADFkhRnbE0qRZ
         0MnqW5Qvody6oDMjaJFfjgC7hpplEZNtkb6HEiyY5L55frlDKlalIZChXuthE7rBPnwi
         R0Ptk2IRrLmiUjr31V1OFMdVjENR74QOf1fdaLSHsO932LC2suZ0wItbPLR7HPZAPavw
         3VGFW7yWdgm+K+06162df3rALgs+SyizSGER3DoBggD9oh6hATaIoP5zI7sOrITe1PJf
         1m+QUetDMQkU047LcnU2ICtLMXBDPNyx7jWlVd/t74S4beQONEVyZeBqzWQ1kHD5ZN74
         jMKg==
X-Forwarded-Encrypted: i=1; AJvYcCXUaTgCXIsk/3cA+PLluTBwAbtglDlyqzqeLhLe5zUoS0G6EB6isXzz5rDlNitkuehX5ve2BNFzrSq+Sy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTJiAcnAhF0e3DB5khGXZAWQjHxcIYyHzOjd/5MhQy+csKT+U4
	BUcv95/PImUC2SRTTKlX9LxJjAHJ/v/vxjEk9JtQU+gE3Q3d2x38DdY4LRoVmV7fBa1sCcNwBtt
	T3dJjQ3FGlHyeV/zYN5Foh4h3y3/iAzLf1QWmB09Ltm9bsEgmJVseecZPI0wuQfDioDY=
X-Gm-Gg: ASbGncslWO1NOki6+scDAzJja10zP8VbqdcTysDcspmCtMbLxQ3gw7njckNGa+FWnEq
	QauZ66zx3M4tbitWCtJ3Bsnk1tVcH1HP+vce0i8ZRSqAylglROMd2l0nP9a4hpF0VrqGqayzAME
	fq9x1b3ozWRDZ7WK5IkFwW/8KrKNHClsR8DvDLa1bWd6Gjn1Vsqb0EYceAV4NbmeTwfri4IR0OG
	MN5xC4KLHTKL0KMTs02fCTzc4tskxbOKLOsR8QrNggEIjRDaHrJrwBPkWh7h2/iaDCSMYT3FT7M
	cifP7apW3fZulj+dGphL42AHYWgXqNNFr1+8bz5Rdeu00S/9/UDLR3/+yIc0+IOGIazNzZMV
X-Received: by 2002:a17:90b:3a85:b0:310:cea4:e3b9 with SMTP id 98e67ed59e1d1-31241ea0309mr1550085a91.34.1748560526427;
        Thu, 29 May 2025 16:15:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA3THCormTux9QWIgYTb/ZoeNKtEa6RR3lUUxnW6L7Kha6SEXPkeVkPdWWJIZrBpa4PAFunQ==
X-Received: by 2002:a17:90b:3a85:b0:310:cea4:e3b9 with SMTP id 98e67ed59e1d1-31241ea0309mr1550058a91.34.1748560526083;
        Thu, 29 May 2025 16:15:26 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 16:15:25 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:45 -0700
Subject: [PATCH 3/4] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-3-ce33bac2987c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=1160;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=fcV0U0JSd2Lf4fDNNX9R4rq8oAhewquvTnMKQsk4vw4=;
 b=L/EjQFUOVbqSjowt+2F3fUU1pQgDZXxeNd7PyBfGd52nFzJc3fw8rhldR4/xN61sS8wqJ+6KR
 nwQbP8lg2FaDS8cHgMf5lKPSyxMS6ZmgZItPDqtcoKXmLuD3U5u95KC
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6838ea8f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=8oAJioj0-2SxPtK92HsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZU5MK9gjjCzNmrfoA7nUiX-HY0V3g60G
X-Proofpoint-GUID: ZU5MK9gjjCzNmrfoA7nUiX-HY0V3g60G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfX193bNy3Hy+U5
 Lnt/foFL2RLHf+J0cIjRTA+7PfOf3Uhy7Jg7kZishT68yJDqBDrH6aQnACmMUB958h1llcGkYNy
 JEBOyVmirbi/dOLQSA5IeDYcPzKaEiCfEc16w7PqHECR/3Rtu5QA3itJrQX44TUSxVPPHXNJk30
 MHsUji4OYOyV0gxOEpYSAr3IBbEw/6dRgmijZ46FvxrXZuNQDGBBl7LrkHvzCEEJVq+QV7ShAm0
 btdaM4zP2ivc3dAGGWYr7HoA2os1zz2bgbk8Q1D4Sl8k0RzqnB0FObid51qANHHWcn7JXTGaRV1
 tSyUimKk9Var8Re6f/ptSxnQreBMJue1zhAxYSVS4HRfm+jn1ctGYNp69Wn96R+JK/rvwJyiqhv
 nTrC3st+nWFWo2fWfb5OeG96dmwlkHEHoR+L9hK8TwoRaSe031+EnSAbHV5iP+wOZt0UvYV+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=768
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290227

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

msm_dp_hpd_unplug_handle() checks if the display was already disabled and
if so does not transition to ST_DISCONNECT_PENDING state and goes directly
to ST_DISCONNECTED. The same result can be achieved with the !power_on
check.

Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f2820f06f5dc..785c813d2b31 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -672,7 +672,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	 */
 	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
-	if (state == ST_DISPLAY_OFF) {
+	if (!dp->msm_dp_display.power_on) {
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
 		dp->hpd_state = ST_DISCONNECT_PENDING;

-- 
2.49.0

