Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ACA24C67B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678502; cv=none; b=HbRycD586YJZPFrMRnTH3Z99nzeXV42RJafBEglbWfRKFmictkvIrNBY2cDnr3EyOyZ1ZzJ5lEVMPZObIsI0JN9MFJQpSVEVX51xBCdIsU1njPIf0dYKJCfBMjxa1E6HrZm9960/UkhLvydg+PGTY2JbfG31G95bR8qZ93Iydrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678502; c=relaxed/simple;
	bh=iPZJZhgAlU5iZDlQN3dGuWUiBkJLTIdPozs/hgajMKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=un0/avvN0RqBW8dBqA/j0wb5tYAU2Q0nWzZPNGYWqCXI3iq8X77gKlj7x7mYPABorO02GDBb9T7M2Gs9M+8pKtpd3j5idS2wPks6XZIYnZM1kKEsppRzSxfOVqNTo2kbs6i9DHOM16M/vucGmgv/ZqiVzVA/HoCpky9aUfysRjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDss3DI5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDss3DI5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339s1N9000651
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 11:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tjtJKHAcSE6
	96CjbJHC6LU7BN1JHFvzLRqVjN8Q8vIg=; b=lDss3DI5cllBSmQ83n0zPb9WSsQ
	C91mZvX5Dz3SBo3143FtK1VtrbCkJ8+zYkuzDLqMFnXB1NqN9/1ptOwwXIwyHfMQ
	nvwr34fMx8zUAC/w9eHxB/YH68Om3smj0zbvs9j/dQ+Xxt1YU1hZHgSvH4dtRl8t
	4LhepOXvxloR4rIW4Jw50OLD5WkmcMvvlmjaCHWQstYKVgZWEdRT21iTtjYCK2BD
	jCKMjZ/JAe6c2zBsMVAbYQ2BrptPFnYgLkN+0q5vcOAPo01derluflsaFVUCtlaL
	IqWMjsGEmMcG5jdJCfVvChz2kYXCSdZSwtfyXMYokuzZtw9ul6G0jx2/tFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a3e9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:08:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2241ae15dcbso10357935ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743678498; x=1744283298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjtJKHAcSE696CjbJHC6LU7BN1JHFvzLRqVjN8Q8vIg=;
        b=P3fZ+PiTSMmQDYR3IZPeoi6pijQQMvDAhSLL0DZBfziyYnDpVlL3oaB0YRwRg2Ij3s
         M1z80sFzdMEDATBh2YQNBIHOp4RDZDpEWjHFEf19CljbT0WOdW/dKOsDweODaRM/fdbC
         5/J7Kw+6OxrmBsUEK0VKJ6dMp3aVxfnMIp0N0O80vcHCEUHt+ikL9SJzzsXCdJscVFwF
         /YFNLr77I4iEZYgA6DcTf4w5D2Pkl8eWudzLZch2QBWnk9c2/N39/8FUOvHT+g/9Mf2n
         uUpf7vvz2p7x2pkgzPFeOEF09ZN96hGqH3bvfdDK8QFKQAS5ISAOUD31AZ++M3dO+K0I
         0znw==
X-Forwarded-Encrypted: i=1; AJvYcCUiPjkfkS/gAnc6oIz0NfYlcPOcdRoQbzlWA/oQo3rGhRRvsU7uDiYynBBACDn79t8Cjgif0jt22qyzB4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZiPALyHDfYt5NqeIkTtT/0HoRCxHssny0kYb+BZSl4UeRpaxD
	Ixor3IIXPPZb2h+w/N4V9xmxuSjXKjSzoEny3R6kibFExTgeCUmnieHCf2wB5Ff72YGvYiQUkdx
	CQyqfckYN42QPuIVqCtMITvUyDSj2Z3e8UP0RyQaAdEmMSpp+JXqmIe7LqEUzxNI=
X-Gm-Gg: ASbGncsfGsFczyc+326Wb4kvvVXXbpo4k8AHAZJvFMdtaPTFIi7PD5HVd9trW8lRyft
	+W2/eSMBI+ANaaaQJ7+j9hDwOjbXTSVWN3YW8WBScZgGcaiNHhwOG2kYeyGs4KN/iZuBcIFb2RI
	wdDGEncOlX+eXkCPdU8wS9Fh+3T51eVE1t7pDQ6i+cXM3iRNpKZvvwNpq716r6SfYIqo1HWuO5E
	FQf8zmUthXG/cqndSaArMJWwNvpUm293CuFnYQtxk35nEFGCQhrzLoVzZtLVo86lgyp/rT9jpVG
	H5HmYgNf0chO3WwPxT99B12TX5hrSog5RBBl4J31nZG4
X-Received: by 2002:a17:902:cf03:b0:224:5a8:ba29 with SMTP id d9443c01a7336-22977dfb16bmr36579085ad.43.1743678498107;
        Thu, 03 Apr 2025 04:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGILLThPDUBrOuD3kmcx/cqJobed8N0YzhkjNmdBDJFW2+3jklBbHy34QJXTm6cTH/zOrH1Jw==
X-Received: by 2002:a17:902:cf03:b0:224:5a8:ba29 with SMTP id d9443c01a7336-22977dfb16bmr36578675ad.43.1743678497746;
        Thu, 03 Apr 2025 04:08:17 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3c3a8sm1185414a91.28.2025.04.03.04.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:08:17 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@kernel.org
Subject: [PATCH v1 2/3] usb: gadget: Use get_status callback to set remote wakeup capability
Date: Thu,  3 Apr 2025 16:38:04 +0530
Message-Id: <20250403110805.865311-3-prashanth.k@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67ee6c23 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PifGtMdrkyiWus_n4FQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 9Q0MpzC6LYEMogLm3tp0kUxE2lfwc8m6
X-Proofpoint-GUID: 9Q0MpzC6LYEMogLm3tp0kUxE2lfwc8m6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_04,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030043

Currently when the host sends GET_STATUS request for an interface,
we use get_status callbacks to set/clear remote wakeup capability
of that interface. And if get_status callback isn't present for
that interface, then we assume its remote wakeup capability based
on bmAttributes.

Now consider a scenario, where we have a USB configuration with
multiple interfaces (say ECM + ADB), here ECM is remote wakeup
capable and as of now ADB isn't. And bmAttributes will indicate
the device as wakeup capable. With the current implementation,
when host sends GET_STATUS request for both interfaces, we will
set FUNC_RW_CAP for both. This results in USB3 CV Chapter 9.15
(Function Remote Wakeup Test) failures as host expects remote
wakeup from both interfaces.

The above scenario is just an example, and the failure can be
observed if we use configuration with any interface except ECM.
Hence avoid configuring remote wakeup capability from composite
driver based on bmAttributes, instead use get_status callbacks
and let the function drivers decide this.

Cc: stable@kernel.org
Fixes: 481c225c4802 ("usb: gadget: Handle function suspend feature selector")
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/gadget/composite.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 869ad99afb48..5c6da360e95b 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2010,16 +2010,12 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 			break;
 
 		if (f->get_status) {
-			status = f->get_status(f);
+			/* if D5 is not set, then device is not wakeup capable */
+			if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP)
+				status = f->get_status(f);
+
 			if (status < 0)
 				break;
-		} else {
-			/* Set D0 and D1 bits based on func wakeup capability */
-			if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP) {
-				status |= USB_INTRF_STAT_FUNC_RW_CAP;
-				if (f->func_wakeup_armed)
-					status |= USB_INTRF_STAT_FUNC_RW;
-			}
 		}
 
 		put_unaligned_le16(status & 0x0000ffff, req->buf);
-- 
2.25.1

