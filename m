Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C522054ED
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519853; cv=none; b=bl0/sMQ5hy0NfSce3V3316YaWY72McgfxF9fqyXB7uFtaOdvxlX4lLhjz37LO4t5u56WNtJ5+DCCmWm1BAna1t2pkcybfY8aIHR5VNr4IJ97WlPb0mxcJCE32Q9NG5gALumzpsZN7SsrzEkHvAKRmT8zmSg3ZQbdmFN1W6l14CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519853; c=relaxed/simple;
	bh=PpmBSqs2YXoDzf7TlSO4wuYlkNmDn671JlCJG43EwJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QzOSbfQpmo+Lbhl7k0WcfT+RtS3+cSw4eT8wVEgxrJgpl9FnoO15GS/Mx52Bme938iEobGtFyBbp/3CQo9xGeXLWYJKGqFNJY2quRtIrxzYf7o6iuAKKIWaW5jY26F07Dr7A3iXfwpDZpYnQXddrrKkxhDKmf0FxMKGAhsEF7aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2Ogtw5i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2Ogtw5i"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531Bt1eL002321
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 15:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pd0hCXt9UHoQu+5ORuaVFS
	87IvHZf0vjOGFwjSmYS/A=; b=o2Ogtw5ioaNHf//pqq7yHR2SZ2kpkXBYQv/obN
	bYfeQu4ie5VamADu4pa5ka5VeGRObbdMarDcCuR+IfwpdBapG5DMJ9eZL/MreHkc
	/p6UHKNrrYBD3AlJslmWdhLxE+tveVwJJLZ4MNh808Bx9KrUCKAiipXgUt1VMp9e
	BFbQUHX4/x2oI5MCZoWp3WU8GKo8v4kmDOg3LlrcxR7dAvAdlhP1joSuXkhmwxL1
	0rCTxZo7OoqT+AxD9whDUio5Vu7Hm7K7OmFN5maSY0NEpAKuwrfjqKBf2ky2ubR+
	fdqbWSGeWVre/vj8V6Cul62E04+0FIY07Aahe7Gp9GOZGiww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa5bra4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 15:04:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so26185785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743519849; x=1744124649;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pd0hCXt9UHoQu+5ORuaVFS87IvHZf0vjOGFwjSmYS/A=;
        b=Ob8sj9HgdarjuShtDDyKAuKSwyf5OvRqsKryWXYXOLcCJvG5qItR0Pl7ZV5WV0r/Kt
         lvkOPlLlM/A4wdY5e6rVnxvdLdRfzdA1cxgD5JqiyqhCJ+1ng66Gn6vUFYDXvPKq5DTX
         NkG2Gc/3oHNBhPmZU7W9bD6K8mYMdx2Xo7YctewPjvY08E0ZMbbamuTtrrmHawQpB3Ta
         TxpWfXZTaQEXbUPQSW9OY8xl7k+oVLg+2Erc705euz3LwvB5o3oinlP7MFCs44Mzt2cv
         HjXDWXTckXmhCVdeYf44YoipjTA5/o9Yl1je/oB2EvxwLbbcY7xbiyof2hMn6CIJkUAg
         WRTg==
X-Forwarded-Encrypted: i=1; AJvYcCW/zGO9ebkkuEs6UzZ5YzNr7KI019TKd7FrucG338j+VFHC/XGlT8pWo/vhKrVEk7zlg088wBNPEyO425c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiSlTs5M4mwHVoZXvy97wL/GSLA5B179pgPCIFV0Vo5LnzGlLH
	oFDTYTa6a5O0R3PxKiE/IKDXLS8CsDntkUponjFGetvJb7W8yl3oa7lBhk52jJf/o9YQ4A9NfOw
	StvkH/VUadoJ3cg341K2tBGcBdkVFCuGxRfjWmfcqLi+8vHp6TrbvBtGUkOWSwMg=
X-Gm-Gg: ASbGncutuaIF6btiIpmLqtkPTuJqgoMEWYD5+yR1utwjrjvtkdrWSBC2mMp+w/x2uDV
	tOuh8q30W3iz41jixnj3hkIf6G/aUCT6bn+Iq18K1eAM/YYOotFYlljsnmW0B391vGqqc/jFg6s
	NCAA6eLfmYluAfDj1YddXSQS98ZgmBLLfJNukGkbtycuW6SgbKDG/Bt5vZ6eoP7qpzkskZFrgWE
	m6q8Hkp1Yc+y0WUKapklXyz3qBex65wEHOGiEVWC8gnUtiH5jT8/cR+j6Qxc0Qe1EkQ9FWelRoc
	UHjHI7hQKj0EXsDV/tB1GlAgqQwjoxu6Bu7VFpBk4RpSjwC4hUuKCF1ywk8tmcA576idEnqd7nK
	JoSCaTwNJhhMSQKrNZY/p35oc0ok+
X-Received: by 2002:a05:620a:3192:b0:7c5:562d:ccf4 with SMTP id af79cd13be357-7c6862ebf96mr1638748985a.4.1743519849523;
        Tue, 01 Apr 2025 08:04:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqPojuWGziwvouxIKltW39fmyd+Pf1GhjseY09Vi4Jd5C46MgFgZcl9p6mTyFwdlVkrcMswQ==
X-Received: by 2002:a05:620a:3192:b0:7c5:562d:ccf4 with SMTP id af79cd13be357-7c6862ebf96mr1638745185a.4.1743519849157;
        Tue, 01 Apr 2025 08:04:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09580035sm1391228e87.121.2025.04.01.08.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:04:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 18:04:03 +0300
Subject: [PATCH] Bluetooth: qca: fix NV variant for one of WCN3950 SoCs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-fix-rb1-bt-v1-1-0d140c583a06@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGIA7GcC/x2MQQqAIBAAvyJ7bsEVw+gr0SFzrb1YaEQQ/j3pO
 AwzLxTOwgVG9ULmW4ocqQF1CtZ9SRujhMZgtOm11YRRHsye0F84eBNtCM47ImjBmbnZfzbNtX7
 8LPibXAAAAA==
X-Change-ID: 20250401-fix-rb1-bt-8b2f4dd7b711
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wojciech Slenska <wsl@trackunit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PpmBSqs2YXoDzf7TlSO4wuYlkNmDn671JlCJG43EwJg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn7ABlqbCgQvhEX+BhUkAzMtbzmyCAGlnJ0tNtt
 Idq1AL5HUmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+wAZQAKCRCLPIo+Aiko
 1bv/CACV2lQ6yu5av3Bgo8HAMaeDm4gkCXuaCCNyc+j/UM2HMhXt/j4RTecsdATllIrwis2q5mc
 WJQYF2ZfoHCMNaOV4Lj3QLl6T+amqQ5QwXhp50Ai8B0iyZiKKZLE84bs/WWFO89uiixO9FQ/59O
 QZ7apXw2vgnkoTgp3a64JhnwQYdrM2Sptg7jSIJjFk1ON/S0kO4GQr8a9ADnPuISj7sBJROIJad
 FvJ+JVeDcFyugsf6Dh9+k9jjwlrS2LyRUcfqQhQdRkDTOD1u5MrAQSLwYE8a9zSmwQRMDdC/uZM
 66SaubRPlF7fZ/rohtRfsHJKlcZdFcE1cD6vKJyytL/TvK/o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: cLvqBeHykbyKyghVzs4K1tVQk7dlbtat
X-Authority-Analysis: v=2.4 cv=YqcPR5YX c=1 sm=1 tr=0 ts=67ec006b cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=9FvU3PIiAAAA:8 a=EUspDBNiAAAA:8 a=DcZuiDOs_TEgLcimDdwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=upxJETeFKQfi_Qju5aYB:22
X-Proofpoint-ORIG-GUID: cLvqBeHykbyKyghVzs4K1tVQk7dlbtat
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010093

The QCA_WCN3950_SOC_ID_S should be using qca/cmnv13s.bin, rather than
qca/cmnv13u.bin file. Correct the variant suffix to be used for this SoC
ID.

Fixes: 3b0e0839d9f2 ("Bluetooth: qca: add WCN3950 support")
Reported-by: Wojciech Slenska <wsl@trackunit.com>
Closes: https://github.com/qualcomm-linux/meta-qcom/pull/817#discussion_r2022866431
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 3d6778b95e0058beda3f0500b21caaef8e797d32..edefb9dc76aa1a019dc1e0ae06f4545b4ad3f96a 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -889,7 +889,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			if (le32_to_cpu(ver.soc_id) == QCA_WCN3950_SOC_ID_T)
 				variant = "t";
 			else if (le32_to_cpu(ver.soc_id) == QCA_WCN3950_SOC_ID_S)
-				variant = "u";
+				variant = "s";
 
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/cmnv%02x%s.bin", rom_ver, variant);

---
base-commit: eb4bc4b07f66f01618d9cb1aa4eaef59b1188415
change-id: 20250401-fix-rb1-bt-8b2f4dd7b711

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

