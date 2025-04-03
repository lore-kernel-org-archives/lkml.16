Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67FF24C082
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678499; cv=none; b=HVm4o90En2ks5ygElqw0WgLpzFHI8di+uHlmUKJ3C1qhkJcuh0SVJ/ywBn60UhMgo9r/vdGYBtIApztrPQAlEhP1wVOaKXKj0Upm23GJciwQvZxFlZDp6e60aiSrMJXbUEE2yhFuMNKtwpylb0PU2GKtqJHghrtwXYNRCWMp4cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678499; c=relaxed/simple;
	bh=CKNZ75iDINw6MC6IL4iuJlsbLi60jIt9XSgEtpjGV8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V4pjiL7k9JQmoTq7HB5hUe1mQQ9DbKk/zGJ9B4KWlXGUKpxYcXigP3MtzKMBjvxOrVlWDQvSipCOzRrCDXs/t5PJVVCx4MbJhgmcNHrv3wxRMeRrmk0B//LB6zEh/CA1AOO54IvldkGUyk4OQdetgV5+CZWWejvzK7LJW6rqInw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H11qWvkP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H11qWvkP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533A4MAW016513
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 11:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mOjHDkSlrc5
	FA5+7P3anTxnDru4TLkY0T08z6RqNU0s=; b=H11qWvkPdqr1UeKyjB97NXNslSb
	cQsMK0YhwzY50PgFnTkwsz6FaJ+DWpZAAe5K2T3V1qFQQXQe2kVEZyMz8kel0chi
	HMx2IkxYjTITmC8ezBlQGGX5DYO0kEooDDBk2KY6VFhWrGQjK3CjjYDYhkw80emf
	/GfDIL3US75LWBleMPAVI81R/Ma808Mt7cXi6neEzljAd0k5K97PKwODbxP3zKbl
	HKjinxJ7IRlFBA244904pSVL9j1RV7u0CI0gy4meYL3uIFTLBbShIlgHziTNxgrW
	zcgliOEJ9q8/dND9uv6rbIHiU9Nf7oms/OFuQDMc/vN1II+WZMd1qOMNRvQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sr8q0652-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:08:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so1324029a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743678495; x=1744283295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOjHDkSlrc5FA5+7P3anTxnDru4TLkY0T08z6RqNU0s=;
        b=vBaCNTli9FskD5jOqzBFO62Dj5bIVqKwv0GGo25TNMpPJ2tPGWVtRXrVHYo6TMEzqu
         t4Xrf81cdw68v1Q1lYA4t9LVWXZ6upSc8PZ3KqUoeAqdtyi6XClL0vluta8ilDRJku36
         1bssr4IyoSxc6fhKEeyL8OnLDA7UVCbNm+16jnbkGuZTq8HHMw44VfwKkJRfBhQU0d6N
         eoYb/PeG7wEubbWrd9lpHhIVl73GzCMfTNpRlIFOWp+frcySA2a+3BZnNO/CXZcOSLvB
         QgJlrVkl0ctFIXDr5AJFQTvFyXRKwXxJOKcGydiXhf1J50lEtdKVZAme1/Tky+5f/yau
         9VYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYUuWsWvmQZEhHekb6trSk3TJb5K0piH1i82B76kFzNVtpDH2jRNqM22Ny4BZpzeTYeHMjEWR0MA2YGjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYnOqxUcxDNNcgimP5RdszJPRfzE4j/KRlnJro2Xxhzr6G8gCH
	LUcm5dnKWNkv9aa6m/MWmmzjHAF1umLdG+s0KSkaDsv2hXxVJaDuB/sTnqDUbtK6/nrewCgpaMb
	W92RNP0XUWsrvJHpZr3Caalf0OjpNLkPCdNrEfGFJTC8YF7XbMSv0vELDNxlnhm4=
X-Gm-Gg: ASbGnctMXDXWN9hn+pq66o/8Qkqb1hZPUiTiCo7Bm6SVpaKcWCYiIdOLdWlUvmBoPIi
	rkYbdjbac2m9ydRz/V5elfj5qwptkgFZa7lC8jB6Hm/+xq2lq6grTwJUJuD3YX44Fh6ULmCkWUJ
	SvAxm4FtbS/oaI3ag4TgWKKhfI4XsM9HGII36y1hso7hMXeTpUa6q47gmfspjPd0MoxIBBh9gvn
	uIaErN4cSSJYDpNJ/R+Jy0JDD+ql2E4yILEHNHNsymAyjp5EE3RJ6k4efwxjuuDKtIkasi++jhF
	eKqnRMlOMTT0QUn9YsYsiG3s2PckhIjbqQDuYRsIlTE8
X-Received: by 2002:a17:90b:37cd:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-3057caef387mr2934390a91.3.1743678495119;
        Thu, 03 Apr 2025 04:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8E/a1HuHsWYlyy2BuINk+4cWAPJuv7nvd6fNKuMTc43NmiB3NEnFpb/KfTZyr05CXxmsrIA==
X-Received: by 2002:a17:90b:37cd:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-3057caef387mr2934358a91.3.1743678494736;
        Thu, 03 Apr 2025 04:08:14 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3c3a8sm1185414a91.28.2025.04.03.04.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:08:14 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@kernel.org
Subject: [PATCH v1 1/3] usb: gadget: f_ecm: Add get_status callback
Date: Thu,  3 Apr 2025 16:38:03 +0530
Message-Id: <20250403110805.865311-2-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AJxmQ2K3wfWTW8_k6046SWnXWzJ4bs4r
X-Authority-Analysis: v=2.4 cv=Iu4ecK/g c=1 sm=1 tr=0 ts=67ee6c20 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wSQy6ELrUcAAhET18-sA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: AJxmQ2K3wfWTW8_k6046SWnXWzJ4bs4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_04,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030043

When host sends GET_STATUS to ECM interface, handle the request
from the function driver. Since the interface is wakeup capable,
set the corresponding bit, and set RW bit if the function is
already armed for wakeup by the host.

Cc: stable@kernel.org
Fixes: 481c225c4802 ("usb: gadget: Handle function suspend feature selector")
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/gadget/function/f_ecm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 80841de845b0..027226325039 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -892,6 +892,12 @@ static void ecm_resume(struct usb_function *f)
 	gether_resume(&ecm->port);
 }
 
+static int ecm_get_status(struct usb_function *f)
+{
+	return (f->func_wakeup_armed ? USB_INTRF_STAT_FUNC_RW : 0) |
+		USB_INTRF_STAT_FUNC_RW_CAP;
+}
+
 static void ecm_free(struct usb_function *f)
 {
 	struct f_ecm *ecm;
@@ -960,6 +966,7 @@ static struct usb_function *ecm_alloc(struct usb_function_instance *fi)
 	ecm->port.func.disable = ecm_disable;
 	ecm->port.func.free_func = ecm_free;
 	ecm->port.func.suspend = ecm_suspend;
+	ecm->port.func.get_status = ecm_get_status;
 	ecm->port.func.resume = ecm_resume;
 
 	return &ecm->port.func;
-- 
2.25.1

