Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FD626FA65
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744340705; cv=none; b=ZwuxadqbJ5k8imxIH0PWHeOJBjh7l+5vVF3Z/uy3c3bBX5Hpe0u8lPpBVtG9vocVlo/+g7ie9Njix9uuMlBiQQgv5TrEagy34cpcHi1rpTsofw0n3KvOOUq7BOcojwnBTsFNqfnPf2hPt0fqoJSONtVNoejye8+DWFC6vp/SORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744340705; c=relaxed/simple;
	bh=Uv2wQTOEE8Ev8Q2A3b/U7Va/T0GHU5TLqGmdd0q8Jjc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AkA8X658Yk5+EDCPX2iYUfKrWoX+sbsFxvprHpDpAcpYdO0o6eEN2/66mcdv0QWhnaVE2KHxCNJF7bes6xtStjij88v4ADY19N519u2QVIJ7SVJrrVuRzRN97aQRcpU9IQlZoVoaS0HWFMFxYBN5MLDc8IcUkXosZJd6UVrcD+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CV+QpCiJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CV+QpCiJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFtoYm030658
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nHx5YfSqtlHj20/N6ZfiHX
	5TvhGAs23D4EkjGG0LWaY=; b=CV+QpCiJ/uMr7DhrRqAFF0TIKSw7Bii+L/UwWm
	3TOohqFm/C39BpENUPVIe+V2Gd+0rBZS9YHcUy0opqEqavhLRZ72+0Qd6aUeQcQ6
	J6mmDtZx97l6IH7QwC3nY+sFmRwS8pZBiMzsuufuFq/40vLkv7fLafbljZ3x3TWk
	j641wCkmUiMJANZqYbXK/47t94YtAditU+dTkzFAW7WdOTDP0O8OjFw277OvMw1q
	YAlcDmV8gr1G2un9kZPCeBF0YTjT54nf0e8ktxgIiVEkYyVPJD/+M30sQAz5UxgH
	j7oUPEgedwPS9FjzxOPvFxGztxoWOQueLpnLfX5Z7A798msw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftrrq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:05:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2242f3fd213so13048615ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744340701; x=1744945501;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHx5YfSqtlHj20/N6ZfiHX5TvhGAs23D4EkjGG0LWaY=;
        b=aPXjYmsdFSrvEmpaH+ADfuo4oU3KyfCOEqRl7LbtBaeD7UCEpMhRBzgHXVBGZ5u19g
         obj33QNuSM5AIJ1ZCx38pQUSLVhCX9QaZBJbD4CwOOJI/y4SjLFErZxx3SuarsS1JhMi
         5PhRJ51FxkujnPvsNKqMA6Zj7SHNqWmHi8FyF2HeyLDbcZkiXV8APrv0bdzX7RRpiKZG
         sadi6jxP+6AM48TdzJSUOuB+wz/U2JhcdIyKJxI9ok9JVMKXvVxNjqyP5mCD6UZp0OrN
         e7x00YN35cOzJlSqfTJhX11Zy8XExCNXQjNQHjHYlf10+bCo66LpxBfSpSQDxjKnLX08
         Fw4A==
X-Forwarded-Encrypted: i=1; AJvYcCWpKa8sGfW4v3Sj/7dtgPaN0Tp3GjnJF6EGLxwKkCbtpNJDHrci8mymgxKWMNjooUMWMkGYLUt2SG6NVVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzIW69RIbhhCBJwr68ZzJuA6vggA1Gy1OI5I9cstzQi5daqObe
	Bbvo+hljJvpvI1Z0c0+gBoS8LDvenzftUt5fyVhLUI4uI4LZ7KFB/xSlRUmCEvKY3euKJmUK4X7
	oOskmpb9IR/cxyJDGlVa41tb/BQLqDmMbqIsP23zEKKDosKJP8XoL49ymSrF9Y1Q=
X-Gm-Gg: ASbGncvqT0OuAvoGipLNutD5BDUNfQjOD7uydT1GBmK9cQEOLXZ8MZguZKMykMTMgGM
	8jpal/IsPEqtbyclLl0MTHgQTWjVjWINysbp8SyaDErckqH7XP0E8T9gEZx97DeqUH7QKq4vB1o
	tqvvUrccvZ2ceExXxaB82NJ2deXoOStpzUYXCJ/PKZMDCZqAzd6/i0JHI7DBxjMHt84fQeVxaJu
	nAEjz8Q7rGtq7s05oPVAK5dXhO+KBHzCMh3wzekIIlUI9HihWtcZhtP2siRieU1tI9a+044WfML
	9mjCkHyiS7oeM0dQO1NXfHoKFHMvLruBFdU2+weqXw81i0tfEP3h6EFVVwx/uZrj0170QsTPygd
	GyXXmVo/Nqna8mT5cnH4Xl56eLpKhHrhPy179
X-Received: by 2002:a17:903:3c67:b0:215:8809:b3b7 with SMTP id d9443c01a7336-22bea49d2f0mr16013015ad.7.1744340700888;
        Thu, 10 Apr 2025 20:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDFCDKl4DwyCQfNv7W6tRbhC5Kqxgu6akEze7BUhaRkI04YuDAONMnHWdUH05sUp5X8zL69Q==
X-Received: by 2002:a17:903:3c67:b0:215:8809:b3b7 with SMTP id d9443c01a7336-22bea49d2f0mr16012725ad.7.1744340700468;
        Thu, 10 Apr 2025 20:05:00 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca88sm38425205ad.256.2025.04.10.20.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:05:00 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: handle scan vdev consistently
Date: Fri, 11 Apr 2025 08:34:49 +0530
Message-Id: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANKG+GcC/3XNTQqDMBAF4KuUrBuJ+UHtqvcoRWIyakCTNrHBI
 t69IXTRRd0MPObNNxsK4A0EdDltyEM0wTibQnk+ITVKOwA2OmVECRWEE4p7s7ZBSdtGDbFNFT0
 ZO2DoRQdc0K7hDUrHDw+pmeEbksuILawLuqfNaMLi/Dt/jCzvvzg7wiPDBFdQV7LiRNdSXF0Ix
 fMlJ+XmuUgjy5H/atWhxpPGuJTAFWhByj/avu8fo7inihsBAAA=
X-Change-ID: 20250402-fix_scan_vdev_handling-ef5be452b949
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f886de cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ZlTS7ONVMdPG7i3X-G0A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 3ZpgaWO9sm9rJMuYmG7ERHezngof83hv
X-Proofpoint-ORIG-GUID: 3ZpgaWO9sm9rJMuYmG7ERHezngof83hv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=864
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110021

This series of patches addresses the handling of scan links in the ath12k
driver to improve consistency and functionality. The changes ensure that
link ID 15 is correctly used for scan operations across both ML and non-ML
interfaces. Additionally, the patches prevent scan failures by fetching
link_conf only when the link ID is valid and setting appropriate default
values for scan vdevs.

Currently, no issues have been observed; these changes are intended as a
cleanup and to ensure proper handling. For split-mac these changes are
pre-req change.

---
Aditya Kumar Singh (2):
      wifi: ath12k: handle scan link during vdev create
      wifi: ath12k: Use scan link ID 15 for all scan operations

 drivers/net/wireless/ath/ath12k/mac.c | 55 ++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 30 deletions(-)
---
base-commit: 1a7000fb8348e04ab486513d6ebd4b6074a94be2
change-id: 20250402-fix_scan_vdev_handling-ef5be452b949

