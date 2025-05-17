Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0802B9B4
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747466688; cv=none; b=MaDPIFj/s6ToOszCVZt1oJTEX1NIqdVFPpNMubCcFSda3MQLXFa6O5tXp0BWoe9GVc2ipxBH+6+ezr7ermoSEuU0Q46VAt11TdLXJQkQiOCNBS4MCXDr8vwNaHdD7Ol/BOXUGtPVfpLz7+nReyob4rmfOsxeos95y1km4qydES4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747466688; c=relaxed/simple;
	bh=64MV42yPMyasE/soZx9Lj9q2sYVO0kQCsnB+OejFYGw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q44yCQEb04JXqhMTThIfWhh9tQ7gV598bW2GosAb3GpV8mSDIYLHvJ6fDO7xh1fMC1qTSd9qvRzgS2kSeBfkKa4b4Q6uvwdvXOPx3lH5XhJGSISfQHWIl3hYze07pG3qEyoVxTWQ+8GI5ffF1BBmEg/0PuuFeYwvrKzf1RJIPSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvd3fKQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvd3fKQ9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H3S1on005043
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 07:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ateaK2dLn3di3X67T4QDk0Hqoj/IdrKl+Gc
	MTCRfwOY=; b=lvd3fKQ93z/fkFzkqpGK/ORUXu0qLAukvTWKxYt73VBMWBwPnUT
	LaSOBVwrLYwPS0U8gvitONf6RkwAWUCTkqhoOiG10SqJtd/YOtXFUT6CL0ycuXdt
	DZHwkTZnKhc1v5BCta81gKgkutUjo0QEl7hgDZUZRVV8XgGRoyrH7+8+mu9Q+VwC
	Btsm/35cj8EHEf2f9bgVvzvsIhJpC6fVE77xl4wuwC0k2CvuO0NowetqAhmeGfYH
	yJCVvTHw7MZgEpMjUZhKfEm5eE+lDtlgAN58ZNX+snzCbSf9fFANY26ECzuJxUxK
	izt/lbtQq0BLFXYSuiKXz5SjpEkpw4X6DsQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsr852-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 07:24:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-231e3cfc144so11103845ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 00:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747466678; x=1748071478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ateaK2dLn3di3X67T4QDk0Hqoj/IdrKl+GcMTCRfwOY=;
        b=BLMCmH2XkGG3NjwON2jtoeIgHSstihKRY6fakSq1reFfJftcP6Et587c2yxhiLDOTn
         PrpzmZWurqdaaU0aabe/15hytb7OxXQvY4d7Jf7T+Hcu5n5N/LFXFEnkIAu/GFMIAWks
         R0XmO776PmTEoBjRe4YUuRVWJIsGSav0JmfjPdVaZdrhzSHewnyw1KQz8IeTdlw2cSd+
         3sHEZhQOEmDpSk5XPhkglI6WmA+wMrCZEzJX5I8yiSSfmwKAQU0YBUiKP7wmuDSesio/
         OatvoiHXlNc5GDcODFRERVKZycym8S6ClDaNcnO6Ow4AvjplaKIQo/01JJHaEnKH51nr
         1mhA==
X-Forwarded-Encrypted: i=1; AJvYcCWdMtoQbkeGG90N0dNYR2jvsWcTTxwEIJ74yEMn5BLVMVOI3MCKl2W5ubgVWTeRjg4BSgyUwGRDkTXMmqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZiIHifpFAS1Y50IINAU7tRaS1IjqHXP3nI5iWwfHrKwwV9isE
	/pOkkvS2UsAkOaw4bCovwdiJyS3VcwCVO4oTXTViFGQ4l0MCfpxQVSMgysVl4lfTybbtp/PBGQC
	hWt1fld5XT7COCpxUm3av1LdBJ7Q3qYvvPhVPZINCvUYU7MkCuDBynvKBq9gwbcaEBGk=
X-Gm-Gg: ASbGncuuZ69Xgf/Vrff2EwFtIc/g1LBE9AbNw/sljxNgSF8KWRdudjzA8+6HjQO3/Pz
	znjL83lQtlIkww0o2MiFRSY5TV+SdEL6vZnEQsXZsTzS1CGP0BZkkvIdiXNTGNWUSclPjWr8Fmu
	j7sQM7BzmQHftRcOx7+VG/8EHxFaSt9NPLIrBHY5/3Gw2wSZKP1C6ZYtb4cAQPXqdsDzYLTp+H+
	5smcGWC8FYaqtVCOPqZt/gHsq2DsfM8sqlVDebtAa2o8BP6F5zFl+sa/x0z6Jujy9p3rkt+KQ5J
	BOp/7JUGf09lC8rdPcM3j88rHUf6nXSES6FE+IRbUIWY
X-Received: by 2002:a17:903:1acf:b0:22d:e5ab:5525 with SMTP id d9443c01a7336-231d4596902mr100791565ad.38.1747466677684;
        Sat, 17 May 2025 00:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFokspCYygX8RNukSar0XI/2+pvDnDJIQBo2sU96XiQL1vom3EPheBI15+XDMJWNISAqmBkhA==
X-Received: by 2002:a17:903:1acf:b0:22d:e5ab:5525 with SMTP id d9443c01a7336-231d4596902mr100791305ad.38.1747466677279;
        Sat, 17 May 2025 00:24:37 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac959esm25185225ad.33.2025.05.17.00.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 00:24:36 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1] misc: fastrpc: Fix channel resource access in device_open
Date: Sat, 17 May 2025 12:54:32 +0530
Message-Id: <20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Udu-AULlawkvqTR0mOZED0nDeVVG-LYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDA2OSBTYWx0ZWRfXx7pu1A/pcH63
 FoY5/4oI0NHTlKvR+QGkq4AJRkbjcY3RbVHZCeHBvhKjWzrrMQP0KVYkjIBOAzjRPbqjXcnLWaW
 kcbiXQs6z7FMGlPGo6uPyb0DaUglxuzwOdKmkuSpKmB6SWExtyAXpWz13Vifeyu5UZ17T+rfzPh
 18BYZkYvyfqEuRuCIrEk/TkZyhbEtko5DPA1hpe+W39iOa5jm9tsK31YezlG3QFyr0MjeEuQLy9
 McudDzwN6ozgp9T1BPkwPQM7/bbuG+Ph6eiDjrw2KGLOpyM02sMv6HGwEk8T1RisPOVMZAj1acK
 P2BFc/gNE6rZl7T79I1lBwvlBYdEdxn+4GqcczW9LFAKPX1xg+/7ZYdpoBeG0080hPHzvQA9QdQ
 fPW0YHmk7d/9Z9lwCsLBYMXg6G+VVUdUFZenAEHbms5ACsaQSmcvblVto/vwCI2bAXi62toT
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682839b7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9DS800j8OOefGsPzyAsA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Udu-AULlawkvqTR0mOZED0nDeVVG-LYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170069

During rpmsg_probe, fastrpc device nodes are created first, then
channel specific resources are initialized, followed by
of_platform_populate, which triggers context bank probing. This
sequence can cause issues as applications might open the device
node before channel resources are initialized or the session is
available, leading to problems. For example, spin_lock is initialized
after the device node creation, but it is used in device_open,
potentially before initialization. Add a check in device_open for
rpdev and update rpdev at the end of rpmsg_probe to resources are
available before applications allocate sessions.

Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7b7a22c91fe4..40c7fa048ba7 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1568,6 +1568,9 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	fdevice = miscdev_to_fdevice(filp->private_data);
 	cctx = fdevice->cctx;
 
+	if (!cctx->rpdev)
+		return -ENODEV;
+
 	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
 	if (!fl)
 		return -ENOMEM;
@@ -2363,12 +2366,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	spin_lock_init(&data->lock);
 	idr_init(&data->ctx_idr);
 	data->domain_id = domain_id;
-	data->rpdev = rpdev;
 
 	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
 	if (err)
 		goto populate_error;
 
+	data->rpdev = rpdev;
+
 	return 0;
 
 populate_error:
-- 
2.34.1

