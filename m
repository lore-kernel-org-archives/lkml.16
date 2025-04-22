Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361361E9B32
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317965; cv=none; b=Mz1wrzqBiuLcCIJNZryljbigeL211hxkcnbEwRBwILsqS5/PRH9cgfhWu+WH852lG2L+WwhVuGHiQYx8TjDAjTO7JDG9f8ugiJJvHGJGSUTMQL1I6+AG5AWLFs0YT8LExIu4+3eEDEuDIIVKMtk4tnIR8h9/eLecTJPaIF56Sf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317965; c=relaxed/simple;
	bh=CKNZ75iDINw6MC6IL4iuJlsbLi60jIt9XSgEtpjGV8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WS40ukLOekj1G1NoFp83PbocRc99A48RJtLekbB3K+9I5GTdKXVQ45wYQaR84inesxZNrMQ9dWAHxEbCFHfAkwZQ/KttvSy6cP8BJMlgorFRr25ZaSJB+uGRf64Ds5HAkK2Hk6naJb5HGzxUW/KS4bDLU5z7Gyw7BNNmZmAcYpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4xO91+i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4xO91+i"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4OlTu006174
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mOjHDkSlrc5
	FA5+7P3anTxnDru4TLkY0T08z6RqNU0s=; b=N4xO91+i3Uw0OFlVCMB3+Cynv89
	r9MhX5W+loNbyPRHUUCXNZAmCUbR+IZUC7UqKFCqs/8w/oz9VeU9G/9drmDYqbVH
	/2HDAEdS5U5TM0O4352JAf9TSQ78dcjAs0FWIE5zAiGRk2cNrR7sDzst8xUFB21n
	nyln4wQrHtOKvLN+eG/vzHVOZn9lhY0KL0R3jzaHRq1tQcJ1LP52X14x/G5TOxpS
	GxJSkZhb/Gj1hccYiPOoJ3QN2EgTHTDadu7eAGaubDckcIt52cnl8qtJYUhO4brG
	URofaA3Eo0xavouDtwspIVMHWFhHSICiow6RAQ76h9MhdkC8ICowSRATEPw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jf4rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:32:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225429696a9so66959895ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317961; x=1745922761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOjHDkSlrc5FA5+7P3anTxnDru4TLkY0T08z6RqNU0s=;
        b=HEqIkK1FNiMPhOEFLQQJqC2OBndg+4FZDa1ZNFqT8xH247yn8SbUGBNqSzrQE9uMw+
         XpcYAA/EmDPQU9wFtc+eEczzwwN96hv9bPDXfd1BhJQTZ3361LZ6A0Aa8w9dHgIk/Spd
         z9oDh8j/BaJYAhvQ02kBceKA6Hs4BB9LBH6bBNbkDO0i86gFb7tFDkuYzubOUaZlklQH
         Zgd92lV/lTkSGWAEHYqYQMxQSFe1MR60+cKD8Mm1Y8tJFo7JjJlHfEx/p2kVrYklSfH/
         RroAdpx8BvNmIL6meWkc1pw2JF/pqzGJkPZNZWbUl4ig2LGik30yx+VXG5i0Q455a6MG
         q+ew==
X-Forwarded-Encrypted: i=1; AJvYcCVWRJ32DQFQfhb8iXNVattCp2KHBViPURb1sW+dC6O8zs7cxZKbT7D2ofzISi60tLh+tKAihtwMZz2dC88=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiw8moH7lPbN1tffsP9yeO9NzP/1is1hn36xAbttoSLuVwKyzx
	H/fCY0qhRq0PP6zJFlCWZ3b4uN6SV6F2y0qU02JFS/qqzla0JTfn+bjR5/G1C6zzPDNB+OAOptM
	6+xR2Cs3f/k0KrC5fx91lcfnZa/vHa/OH2IRVgCz2NyzU5ZNsOqD/Ij2BL7LYFqI=
X-Gm-Gg: ASbGncsJg4ScPR584PlmmnPg+rD49Rwuv7j3ZXslOGfiH8qGkYeJp4sZ4KTgn/RL7f8
	xah8l2paAy8GOLTp52diOA8NZB4yQKLr+ld58Alty8ibI+DVg4cT7r/aYFktrsUwwB7E/sdnRwO
	n1u+Twsvjs/7dCbcNgv5khk0g5QzuJx5rAk2LAALaK4grpM4I1Q6xwuXogILuiB9nV/IB2uU0SB
	CBvxmS4cFwcjohKY+VaycvxanaHlolyXBJZ2aohY51N6kkZPN7Vbfk+iUsfuZOylM+TXeiRcsyv
	tWQHrei/2LLaRL/QUs4zIRgNcnJg9GNo92VKbGj5
X-Received: by 2002:a17:902:ce01:b0:21f:7082:1137 with SMTP id d9443c01a7336-22c5357d158mr263473665ad.22.1745317961262;
        Tue, 22 Apr 2025 03:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExRjxqGdz+q+89OcoW1KYSdRsZxDTYasf2vP3F6wNHhozJN1gbVwbklTo21bG14e5XCerELQ==
X-Received: by 2002:a17:902:ce01:b0:21f:7082:1137 with SMTP id d9443c01a7336-22c5357d158mr263473345ad.22.1745317960918;
        Tue, 22 Apr 2025 03:32:40 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90dc88sm8228059b3a.83.2025.04.22.03.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:32:40 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@kernel.org
Subject: [PATCH v2 1/3] usb: gadget: f_ecm: Add get_status callback
Date: Tue, 22 Apr 2025 16:02:29 +0530
Message-Id: <20250422103231.1954387-2-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
References: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=6807704a cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wSQy6ELrUcAAhET18-sA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: IZ5TF2NtHgydRbksO3p7BbPCh6S8Yax3
X-Proofpoint-ORIG-GUID: IZ5TF2NtHgydRbksO3p7BbPCh6S8Yax3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220079

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

