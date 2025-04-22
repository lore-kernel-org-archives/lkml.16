Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F701134AC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317962; cv=none; b=F6S8ShPvEF6+f2FJVkoShARC2kLlgujgfRFlNd/i6iGfWfkSv0PXj1SCLguIG8SWr3F7FoF/PlIcpvcKNoFBXvb4e+Zfvc7ckpfEzbQAPYXenRPRqp3YYzsYqUiOPYVkKgrSO7l99vuBjRj0khxRnwS6jzB+Ex9r09BBxnL/Czk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317962; c=relaxed/simple;
	bh=ct3r27WKExA3RragoMwVxde+BgN7SmAf+JreZCMhMw8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ULOOJ90U4MJkWAeDTp1NV5QPhKLDdqI7ukuVEQ2fdjlHGyHb5QrFVLsc1ZxDI/mw/84Xx2W+EHdCTjmnDOZMVswfWeVd89jJQSTQr9kWS1njgpH107u6klw1wZigtmqfD/kaOAFzJGOf5Fx1tqYmo3SaOPApXdctSheJobqSa9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xpz0ZxSC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xpz0ZxSC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4OdRS018070
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CxFps4LffuSVCO4/4iCry8/kFGmgd++JRFd
	KtRTHMQM=; b=Xpz0ZxSCq5f7/Y9MzX0XYqh8UTuK+Eap6jRafGJhd+MX7kzAhlc
	okdZ9q4xfFEkC0S0AZoN7VzmEgfSn0Po0dtY2LdFcvg8e3lEMtwZPV1IhKtLiVyz
	4wHrpjkxq39Vd7TcNCZm0GTs3wBdUayYorphckdfwD/0j2a1BnBY0WFE5hXEqlFB
	C+ofWT+fTbrLty7vpRYuLeKttLlAp9qb+K5XpDoa0TtHhSsflIjkYHFSpF+cVdqC
	gh+c33Zgx4Mmh67NjNWZEtPKCfN2XPYq1RpR8F21Em4XBWd24dAJ5mnnky5mP77w
	KgNlzLRPtb2m/i1bykA5A+k0YdsfSWn4B9Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416qycd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:32:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736cd36189bso6686194b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317958; x=1745922758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxFps4LffuSVCO4/4iCry8/kFGmgd++JRFdKtRTHMQM=;
        b=H6MuiAQ0OotxhxwrBGzUgb+BGogQJ+eL3VBB7xI9Hlt/l6Ctm0oQ/1QXgVk2yCvifT
         IZCfSbTSxu0V4Vzd1Cf75zjwNGD3Ia7jQENlybEpJkRuImFjXEGs8RWoTVnUnXtXJo1M
         90e+2hx0es6BmFOIfOURF4X+MxZ1Gq/tsn0Mn2asEK0PqJdDE4HR1FiMKUyV9W5L3mgW
         8yittp2u91VxeeXMdt4wQ1td4Rl28CvGuFAdDxVanaqmB99/xJqdjaS4QntVo4q4aNp/
         lOy5BRr1UYjd7Gcd+vshzzvRO65UKNwakCegjX5h00CL5U+jGKF0jPuXaKbki85HYYT7
         y+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCU0WKTB8MvZkRbjdVlAAyoD7cjOyK/EJ1jVOg9eL/F+A+ljv3BU97vpvxkddUdNegf4ayPb7ad/lzHI1IQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCldEAIsXX6ZTVPCzWqDilgqOPuaAq5133U6W2sUIwD91m+Z+a
	n0Vfs6bWQVHWwoNO2d/UC5XA6Ub0471vuMOadU3kbRaaP+GdF4XL6lr+Enve+z1BRvT78KlQ2r9
	Kw//xyD5zVxo69EGPISPz6ARAwslS6PRASj2wH69JPj8v+KEb4DPF0tqU6JEjZfk=
X-Gm-Gg: ASbGnctVfvCg/cIZJeFdNoW6XOCPa8NlemIX/5IcMi5NkWEVfNwLEO2eZ4x7cgTg5KU
	xwJg/X8enPyHVFErL4s6L/HYnreUUTTGCP54dEgNmgNrpaDypsXzoK9L5cTAC414oqp2ZgOVhAX
	eYFp1I2AXBfaUhJZ/ye+2ZUQTBsURNOo5wZiw1l9VkuSe2wsupAvSz5mWmo8RTmpfHP1tlIpV//
	A693BPoM1maz0MaF1e6cuP51fTQPqpZGVHyGQBm7Vh06meqXYm+B5ahA5ldsT7xKiGjly6QanfW
	r/BsxCFzOx/ZmX3PQNs58hhFnXFoVo0Txe22cUFR
X-Received: by 2002:a05:6a00:1305:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-73dc14ccd73mr19548110b3a.11.1745317958322;
        Tue, 22 Apr 2025 03:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp4x+JclG632dPPp/WKYRumL039CP5QAamazM9ilK0XseYnOwC9rcYsIDles3T+LGZtSUk/Q==
X-Received: by 2002:a05:6a00:1305:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-73dc14ccd73mr19548078b3a.11.1745317957860;
        Tue, 22 Apr 2025 03:32:37 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90dc88sm8228059b3a.83.2025.04.22.03.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:32:37 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Fixes for USB3 CV Chapter 9.15 tests
Date: Tue, 22 Apr 2025 16:02:28 +0530
Message-Id: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=68077047 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=tNeQOB5SuVKVR0OQkLMA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: JWoTvgo1x7XZpDbMmwvH57qWijTsNkg8
X-Proofpoint-ORIG-GUID: JWoTvgo1x7XZpDbMmwvH57qWijTsNkg8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=948 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220079

While performing USB3 Command Verifier Chapter 9 tests, failures
were observed during 9.15 ("Function Remote Wakeup Enabled Test").
This is due to the following reasons,

1. Interfaces were incorrectly reporting as remote wakeup capable
   when host requested GET_STATUS.
2. Remote wakeup failures from DWC3 driver due to timeouts.

Address them through this series.

Changes in v2:
- Don't advertise func wakeup capability if USB_CONFIG_ATT_WAKEUP
  is not set in bmAttributes.
- Refactored func wakeup logic in linksts_change_interrupt().

Prashanth K (3):
  usb: gadget: f_ecm: Add get_status callback
  usb: gadget: Use get_status callback to set remote wakeup capability
  usb: dwc3: gadget: Make gadget_wakeup asynchronous

 drivers/usb/dwc3/core.h             |  4 ++
 drivers/usb/dwc3/gadget.c           | 60 +++++++++++------------------
 drivers/usb/gadget/composite.c      | 12 +++---
 drivers/usb/gadget/function/f_ecm.c |  7 ++++
 4 files changed, 39 insertions(+), 44 deletions(-)

-- 
2.25.1

