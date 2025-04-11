Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CE81EB5F4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744341431; cv=none; b=oe8YnPbe0pguIq97r+1SRKKJOoFXdmW+9S0OEL/Aq7B0Z2khMKhjSinboYG4QTG3CCDnFkDduu2yPZTUzelEsCpGyGrJY1cYTDrraDma2KWS+6Ejde0pG294que2onrlx+y9TTeOPePC5r7fUQqmoQvAwGaFvf+VRqX8y6J1W7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744341431; c=relaxed/simple;
	bh=3Gw/GQGHVIoCiJC/+TqiG1/GCTD92cTxCZ7LdR13c9c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z1s9GT7Dmqvti5YT3jF0OVgx706HFRxtjFhx5dRgV1/N6T0zav2vi4kLWjCKhMXdw0VJgmhTuKdoxGJQhfwcADgsm0U/GQiLVt25M1L2hYpQk0w0R10kTpu163V1WgB0DgDTwQblizjj+yvoPoAcTB9bQq+nzXdElFJ1hUlwu94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmo5rb2Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmo5rb2Q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGFkp5031989
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mboBzHvL8vMUQ8EmJb+LNY
	DAPWvdwe5urX2ZvSDTBmI=; b=dmo5rb2QpGODtRuzATbuJY82hOmaJHZHWtqlRe
	JkeTrk9HsXKcB8M3UHGSsY7cphUrEnjr2KJ95M5oNr5gNmjsZH343PxULDFFas47
	+YlYMTCH4pkqdxhWoiCGMXtberqilSODZ2YPRGmJi0/0gwIwQEEMHjb1E2sxevNg
	97o1iUCuG6z0PxoNkeW3dC+d257HM6ZzpS44FC/bNu3teaCOPkJZl2YPmnizITT2
	K7rrkeIGRYPfu4WJq2EO+fg7KnGid3iJZ0jLfTFuhCoz6r+huhr0znqciD3Wiww4
	cWBXzugEh261d+38g++3puDcp8McsqXIZowe5THaJOPI3VnQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmgwt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:17:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736abba8c5cso1952409b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744341428; x=1744946228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mboBzHvL8vMUQ8EmJb+LNYDAPWvdwe5urX2ZvSDTBmI=;
        b=PjCOBymWBOCggrjs6TVOT1IcyLDwp55XWQ1llRlHxuygZs2m8e3kh9pGZMq+0MqmSj
         I7Guksdlk1WLC8gD1B+ds+L05cgpmpXW8tTTXR4lpo7Gi6W7mkgLWvYF13ywqeXhimnS
         k4j9iDgaz6Z7m31WPSKStHggcVe111mWsdNY2T691Z0GW2DYH3yQAqexfx7Ziyz0agtp
         JlSzhbldht0/2IIBUq6lqajkmzcnviulUsKoEl9NAKmZQN1dpfXAeAC1xzw2em0yUx4T
         oVAYBilboGBONidzQfOld+qLUx6xdtzvODO7ml7JmL/pXNvRl2adg2peVGe6VXfAlubE
         6hmw==
X-Forwarded-Encrypted: i=1; AJvYcCXL6uZkdIgTzh/OhbwuwCJ02IGPgA9+cdSw8zBTeaW9h1gQ9laCYZinaPXGX0ouPCBDp8yQ1yRodFSvJuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmASQI+R4mDv5ouhN3Ao9CsD65I9rIJ5JW99Ps5Dj3Vg/q22mD
	CdmcCN1T+aagwj7ULI9+UrWuZrHps7mntvFX5zx0/ay2MWlHFewAvn8GYV6bMTwOtEgJhISefg/
	u4O+h47RAkai5F3lJL9cDRqcaNu26VYMd4SMOSEP2F9T6n6AcmFKYH7Bb74pJgLlwKDeNXKg=
X-Gm-Gg: ASbGncuWvE09k+OzWbhLJgQGXlNheRqe/F9r6bkTfk44K9Dyo+zMnGdSHtsuUbsGOMC
	4sYxfrdc9iFY/Hz3Wpdnb0UB9Fwp2QNY9oVwcgKxhPVV6OcimFDa7LCppVuDJGRxOA4mTMCkPaE
	asdfgBuo0cu1YulH1CMBc9wcW5R7eq8xeSWndQCL8ag0Ygd9zl+L/NUMlhEEwFgOPvPBmJwJizZ
	5TOVVto7p4oAtsbEr4fQPD1L9Kr8+xEGFX/oNYB5xqrBoHNq/os1u4UBuR8XqycjXUD0t6O802Y
	aBTkHqPbOf4QqKDpYFe4y+qCbmoofPUJ5bsqZrqWVMBnzAP8fWfsWUGNHA5pwOwOb1qq3YxUINN
	F57YMlmqb/lnXvc3R+OIvuOa58dG70OJSR/Br
X-Received: by 2002:a05:6a00:1484:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73bd11fa27dmr1522187b3a.10.1744341428058;
        Thu, 10 Apr 2025 20:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv+fKPnPgGK4Y7/uTWH4WTtAT5p4xK2gJKswdv0c71qBJjupR3Qap0nn0HR+oDeB4mvxZpyQ==
X-Received: by 2002:a05:6a00:1484:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73bd11fa27dmr1522158b3a.10.1744341427613;
        Thu, 10 Apr 2025 20:17:07 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230da35sm375964b3a.131.2025.04.10.20.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:17:07 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: handle scan vdev
 consistently
Date: Fri, 11 Apr 2025 08:46:50 +0530
Message-Id: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKKJ+GcC/3XNwQrCMAwG4FeRnq20XUo3T76HyMjW6Ara6TrLR
 PbuhuHBg7sEfvLny1skGgIlsd+8xUA5pNBHDma7EW2H8UIyeM7CKGMVKCPPYapTi7HOnnLNFX8
 N8SLpbBsCa5oKKsHH94G4ucBHgWMnI02jOPGmC2nsh9fyMRfL/osXa3gupJKOSocOlC/RHvqUd
 o8nXtv+dtvxWOQMv5pb1YC1AhAJWvJW6RVN/2har2qaNeV82QBaryv/R5vn+QMUVkpIaQEAAA=
 =
X-Change-ID: 20250402-fix_scan_vdev_handling-ef5be452b949
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 6-NkYmpErFKBPf_uKdQDtso4446luaoh
X-Proofpoint-ORIG-GUID: 6-NkYmpErFKBPf_uKdQDtso4446luaoh
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f889b5 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=HtmLlQNqzqJkp9_W5pEA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=873 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110023

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
Changes in v2:
- CCed linux-wireless list as well.
- No other changes.

---
Aditya Kumar Singh (2):
      wifi: ath12k: handle scan link during vdev create
      wifi: ath12k: Use scan link ID 15 for all scan operations

 drivers/net/wireless/ath/ath12k/mac.c | 55 ++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 30 deletions(-)
---
base-commit: 1a7000fb8348e04ab486513d6ebd4b6074a94be2
change-id: 20250402-fix_scan_vdev_handling-ef5be452b949

