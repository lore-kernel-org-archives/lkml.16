Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A29844C94
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748560526; cv=none; b=RWxPkCnOkt/YsexdnM3ZSzhnDkt/bnHu4rKwW8a/EKzHz/ut12WrEsEQs4QjedF2nGw4joq6S8wxyjHbC6yAqD2/3nep1V3gYlPIjIx9K0cGJpFE/jH7GXj4nTKlsyCrYKPyBDUiw8Jlu/YWtbCC9HkjQOaSsu48S726ZTmbKvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748560526; c=relaxed/simple;
	bh=p+J6Yc4e0I4h3V1k9TjlmQ+K0LikpunWgUiF/f0yJis=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uoFZ3eYAAZShPFrS5bAHE9+QGtXxKPMXJyNQUEsSleu8VZt6cz/cxOLGToaMxxib1VIpipCh0iPbfmGK2/378muHnI8RHy76bRgIQ27Rdhj/kyJomlMDqZ7j4pb6bie3/FhfmkLqaysJm6oIigbVx1TqJDoZBZwOfNlz57om+bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JlfPzSHT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlfPzSHT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1IWc024424
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dM46x4cxeQsukQLX6q9Z31
	jsJ1XmgFK8Wlrcgm47nVo=; b=JlfPzSHTayY0hlkGVvikC1zRJMznzhrhGgQbiL
	V/JhhLFDoV6QvC0BhTSJuiuYk/XkA4t+a5papFCHEzJhnfpxgkrCjXNJGciS7Jos
	zeSLXstDmpLX0WZPQT61ckWisfonJ9RQDNFIAfmfLIAzNGpsZh1sNGkyBzuMnZeu
	BpDr8Vw6RFpab0R3ZWReSamMz68NIVIibEFN4GGqCT2Qzl3vEtGenq+b8V/IXVrP
	BgQluCgRpxP5RzMrDn16ed9q2ZnEuP4qcvV2vHbOGoLBiE6xJvbGl+iAJB/DPa+L
	aQ+q43PtyVO6VakuiQeKpRQ9wfZlbeXx9c19fXxENpgm2B0g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03mwg0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:15:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3121cffd7e8so1112550a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748560522; x=1749165322;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dM46x4cxeQsukQLX6q9Z31jsJ1XmgFK8Wlrcgm47nVo=;
        b=r4cxoFlmzVesg48zDoAsnqlyNyiXmaYK0BQ/veutaxIUZLslmsUloXGZ/fDHeIxmui
         J/kddBD71wUSlkpus2to7hmHR5X0kKTv0OPTHTYVeoK7PAIiOLOYj52LwY7+kNflRA2C
         foNUYh+72qK6Ta5HhOksGrv6s1H3Og4x0y2KzlVVtEDgy8F5LWhClE3JOoJpvVwM27t/
         SVGwGTkuiR0Hkwazvicwq/a2gl/SejYkZajvz0wJQIjfznXS+hmPDjiP3AVTzXERwAMw
         V5EcLa/2p37r7OoqZkbijPP6TqV43uM0WegfvMN6dPOH5VVCHIcEcc0aQqrJlbiblSKu
         V54A==
X-Forwarded-Encrypted: i=1; AJvYcCUshVwqHQF3qGWcjqkIrOnndkVPM9e+YP2u0hMx5sNU9IdvIiHD4WQZfqjHgPl5ukKPMmBYcSHMrKVP8cY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEztVdMCPi25XAfQodG+8MT5+nm7f22wJ+6RCWc/BvHtjoq4CT
	Kv8Rq8t1bFzD9yaPGBgu23sZ6Js7xNXj0BMy3L+Y2q1aKYcwhHHiTlO8Zr+MFuK5YBnglex1FCi
	H9Z07TY/RCAE+rqZMG1bPTCzACSfSFyL6BSoTc3V+SUvhngZ8t2JlGK11KTCjBXx+VYQ=
X-Gm-Gg: ASbGnctGp5zmYwpa+yNJqcE5NaAPrY0Y/aDEmlpYj0qBIbrhNKj/X4uQ90sluHo94x8
	5LhhgTStvpTMIL+M7pKm7jRqBQRTpjjNNmNqpiJq3QQilQsFGqVI45rgcw2FCCUfnppTsvZ6rss
	RPgtQv9nBAdINLKDY3yiZCb5an3aJkYGtdPfCA2o29MS6X25IHlEjGUjr3ecCAjXIablLTpSZR0
	KGaaSRDvCR37G+nRfDOq0VhS1WNT3x3HxKqmyGDIHnSegNiNtK5J1+OJuyZFPhMhpX8XTwRPYYG
	Q9sPAmgDrp5osQuKoS4KBs+GBqdZ3ykwXx6wvlI2yfXTHcqbnq4B9n5pvelAVxFcg96DZpzz
X-Received: by 2002:a17:90b:53c3:b0:312:1143:cf8c with SMTP id 98e67ed59e1d1-312417344b1mr1957980a91.16.1748560521984;
        Thu, 29 May 2025 16:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExYZ+leMnKPo4Ci9CLPMqPb0xaWB2oGIYcmSOSoT4uHU76LrLJmAqIKUON0iPvzODR1Vaujw==
X-Received: by 2002:a17:90b:53c3:b0:312:1143:cf8c with SMTP id 98e67ed59e1d1-312417344b1mr1957948a91.16.1748560521574;
        Thu, 29 May 2025 16:15:21 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 16:15:21 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
Date: Thu, 29 May 2025 16:13:42 -0700
Message-Id: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfqOGgC/x2MQQqAIBAAvyJ7TlDLDn0lQiTXXAgVhSikvyddB
 uYw06BiIaywsAYFL6qUYhc5MNiDjQdyct1BCTXJDh6yM45qPu1jkvd8Flpaq6XwaoRe5YKe7v+
 4bu/7AT/3Ta9hAAAA
X-Change-ID: 20241202-hpd_display_off-6051aa510f23
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=2255;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=p+J6Yc4e0I4h3V1k9TjlmQ+K0LikpunWgUiF/f0yJis=;
 b=BQctw8V9YspdOLDHmfw7iXSaWQZ1w9E4/q0xe1yRnX23EYhwTtLhe6DxjYXOftuqvNwA+PAvW
 MxRu6oV+V4jCscPknjbJbJ36h3zcyKIpYY0Dam4hI7cPCbMZ9U3ZrEa
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: otvW6aqEMTtPU0wbzPTzQdcFHzcTCxM4
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=6838ea8b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BGtpjrQ8lv99lgvwEK8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: otvW6aqEMTtPU0wbzPTzQdcFHzcTCxM4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfX9MSEkuEXJ0Q5
 QtiK0jBcFbBcYiF2/giktSOPMMIM0mp7LRqoeFr5daL0ArMW9VHVbeqoj+tX7m+/Ularkamn75H
 5dwCP5rdZ8ufATLUdsU7rk75Xvzx8LQc1J7vEdUU6DbwK5D2wrzJ82xFqxsnT5T+c3P9igSbTce
 8pt6qAVU2QWlSVdSmV9O2sFkhnZ/PuqciciMbqt2NB7jBKcjXlr947nppk6/CCr6tj23rO8hxJ8
 zTEXivlxUq178BY2Rsyh7mOzflKjhhsAg+Zbn/KewVzHzMnjfjnWjWYoLyvXYMstUii7AOApozt
 9bC/H/wqekBIuUhZ+GqvNUuxxYb1WT1qLZtPhYTyAi2FdXeyK6btowa9OZHbFoiMsM8+H3dnx+f
 adm/WhWh53mrSZmXQgrwAUE7RhMwnelcR+wQPcDFyOhpt4tzESJDCMYqmV/b/EYbgiqOHMs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290227

HPD state machine in msm dp display driver manages the state transitions
between various HPD events and the expected state of driver to make sure
both match up.

Although originally done with the intent of managing userspace interactions
and interactions with compliance equipment, over period of time,
changes to this piece of code has become quite difficult to manage.

Although, unwinding this logic will take some time and will be spread over
various changes, to start things, this series tries to get rid of the
ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
of the display overall. Coupled with this, there are quite a few checks
in the current code, the origins of which need to be re-visited OR are unclear
which seem unlikely or redundant. With DP controller on newer chipsets supporting
multiple streams, this has become increasingly difficult to work with.

This series removes the redundant state checks and simplifies the logic as an
attempt to get rid of this ST_DISPLAY_OFF state.

Note: This series has been tested with sa8775p and sc7180 devices with multiple
monitors and also multiple dongles with no noticeable regressions.
Both of these devices use native DP PHY though. Hence, if this series can
be verified on some devices with USBC-DP combo PHY with the help of the other
developers, that will be great.

---
Changes in v2:
- Rebased on top of next-20250523
- Change atomic_enable() to return early if ST_DISCONENCT_PENDING
  instead of completely dropping the
  if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) check (Dmitry)

---
Abhinav Kumar (4):
      drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
      drm/msm/dp: Return early from atomic_enable() if ST_DISCONNECT_PENDING
      drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
      drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state

 drivers/gpu/drm/msm/dp/dp_display.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)
---
base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
change-id: 20241202-hpd_display_off-6051aa510f23

Best regards,
-- 
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

