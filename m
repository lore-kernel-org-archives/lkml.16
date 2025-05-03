Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034C2EEC3
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 00:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746232911; cv=none; b=aotafMRrhNmfjBV9Nb80FQyFxi3FOYawIHblkvWfFR+Aw1SSL4j1GlgDirLqzRZXsYhPlQynCPz46TAgvVSqgXC5xRSdpuKSO44KxsTIj61GgOEunA0IhcCuTZmFALr9c0e5VtbFJQjaVseHHzaZs/qzegwMJuoRDF6PDQYLrXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746232911; c=relaxed/simple;
	bh=cZKzoyqoY7N34pp0epge8nAGtWJ5Lp3SZJtzdzdjcvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iiR3CD/FFl9aK5LVNPX6XZ/8EIBQ4usH9z/klRbPfnIFkQCUN68leMK4JTrGZ56pEIEQCjQRFzxrST0Ei/nv+rqkntQlXWMUsYNPfHuDv2/pNJIRo1USxzYoFacsFmTqtmdGL8KmGP/iO0C/3b0dbX6MJ0H7VFsdpJhJJuW6+0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fys8bcl8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fys8bcl8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5430GcvW009473
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 00:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zexFTSyGgt2dJ/AMnsrfN4
	8UoyxFFEE4fgdHUg7YobU=; b=fys8bcl8fIp7KA+O32PyHq2JtGU14cxmMYZ4xN
	YKioSBrgdxbkQS9OH7EhMFKqUbnAuVtTJb1g/bGEz2H2BAuZZrOtzEMWgWWBPvnU
	u390xYhDuDoSSehlA2vMU99ug+BkepMxnm6uJ4jAA/O3IdE4sOqSAgaBUIa1ITKU
	FJL6o3G9yhaiip9Jd/si+Fombe2uFeIveAttv0/UEdVzyDLVFWh0rtpQ1aCnGqfv
	TdyUhogRaT1piuZLoFcARg04EjuJZdphOl29pb55E8KEm6iuf8NskGGg6Lnqjtaj
	u1imG9EGGSGEF6x9/zYXm0lPhIhHYoZWv8jx1a1o6A56anbg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2hrfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 00:41:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4767bab171dso29326231cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 17:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746232907; x=1746837707;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zexFTSyGgt2dJ/AMnsrfN48UoyxFFEE4fgdHUg7YobU=;
        b=mKxnjfsFNhuRE8POb2z77mGNUODPuKTr/1b15m1FviBY48EUFc0xQDSBD7JPCqtzMt
         tWfOqRwlJn+YpWW7xsRbyIsHpXCtsILX2LkwgHeo34NxcNFxkkfCk5ioQKSZBRjAmeah
         W6dj/yahkMdCv3X1OCQ3K0FFeVoOEB5TcMib+8STvZGDmtGjMJP0zKKklWt9ofXDIEtp
         hdhQIq6c4zacIrKitog8DdfIg1//KwVUa3JhO3EzBshmm0ilL+bkwcq2t2tiR61Q85J4
         +KBtNv+8OvcPIBCmeLXsHxHlGOi2mr6zQknhe30ctPsAG/hkgzgjJhG0Imlu8DAtRih7
         dWmg==
X-Forwarded-Encrypted: i=1; AJvYcCXiLsw3FKMp66HGvVjaypOByBX9wvWK43oWQTdHCAHuImXFo/aoZuC1oweAE1z2xSdAfNBTdaOzphiN98U=@vger.kernel.org
X-Gm-Message-State: AOJu0YweEvgqC0FQEhPzvFGxRgj8ASl529U+FDceRUEGui0FO6MzqGaE
	x6CxvZYkKTwbmA7XSnJZV5T7sC08OKB8CFncWZaR74z6cszdXvYQjoHl2fpOpHkvE2D4J1VdPoq
	ZiWFgXLJHnaebg30EyW6/6VQFlv403Nqssj4YGtrbu2sKqctufal6YDN7X2zp1PE=
X-Gm-Gg: ASbGncsctOiIqGgrKETbOGWeKfZHlNo299KhYMiYpCDeauZpE8GIOZPu/NwMFxIX7CN
	G32SUoyhh3mGWpflyD3htoDq+p2ru8WGTbjAjYWmbtImtpuT9d5yEMeVSYuurwG6hrEaxIpodXd
	4B9CkLyUlDu6nLryZFUDRGghuBT19iWptXXU83aLE8tYiZKXUkyHvybzHHZhzLjtB8nqagA48Of
	v7qv5+YAD3z28l6kTmQFb5BFciZykQu0Yylmzi/NCbSykoR+RK09w3VQ8qcnmePGiA/h2l8sRXX
	4ivAvYJi424jrP1Sog0WKTucBslbJWAPq+EQ0c9OS/czZNb+t2aPcWdcl/+n9EeESQ39TBjU3pK
	fXi+l/evXoLQg7tu8GXaFgBA/
X-Received: by 2002:a05:622a:4d8b:b0:476:90ea:8ee4 with SMTP id d75a77b69052e-48c32bc28f6mr90866451cf.32.1746232906736;
        Fri, 02 May 2025 17:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7ecc30BJA+9Dx4O2PmVKjj7HnCIZKZlWFDy70IW+m8VjDZnT+As04kBFqepzl7sWmZNnhPg==
X-Received: by 2002:a05:622a:4d8b:b0:476:90ea:8ee4 with SMTP id d75a77b69052e-48c32bc28f6mr90866191cf.32.1746232906399;
        Fri, 02 May 2025 17:41:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6b0asm551924e87.249.2025.05.02.17.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 17:41:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 03:41:43 +0300
Subject: [PATCH] dmaengine: qcom: bam_dma: keep remotely controlled units
 on during boot
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-bam-dma-reset-v1-1-266b6cecb844@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEZmFWgC/x3MQQqAIBBA0avIrBtQQ4OuEi1Mp5qFFhoRSHdPW
 r7F/xUKZaYCo6iQ6ebCR2pQnQC/u7QRcmgGLbWRRva4uIghOsxU6EI1WBt0UNqTh9acmVZ+/t8
 0v+8HG4v6oF8AAAA=
X-Change-ID: 20250503-bam-dma-reset-1766d2d12cec
To: Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2188;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cZKzoyqoY7N34pp0epge8nAGtWJ5Lp3SZJtzdzdjcvU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFWZHNxF/NqZ/oMAwyOsaLbJ64y6qBo00AnWJe
 ngMwguH6VuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBVmRwAKCRCLPIo+Aiko
 1ba5CACYaPErHkCfSuXCLhGYyXn2t3IdJzsUI05QV2QihSTAiEucd3//V/nGS1yyrJXRKXFdiAk
 Hh5ACwYoqHvwCceszI3Q/n4xM9YGlX7MLYHQ07rHJwD68Yr5t9MA75A5m2V4Y98PCqIq/E8Op4J
 fOn27jHuCvbqd2btAgcqGbHNhxCoSNdAG6r2ufdrNGGgdH0F3iRWDjB5DTByhKtOXcS3v3lAOZl
 7nWgSBSaZfA3nwJf8kSnfRPATOGP0HKV+Zy8pT8oMYUmwHzJbBL7H/35cSZR0j/bNjMgTb7wDdL
 bNnfZ7ZF9kmiTmWBr0HHZEL8Z3Wd3AmSuYehz6EbKl4E3rN0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: jNjBbdT9d-_JUrtffoSji2KJHZt2ATy5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAwMSBTYWx0ZWRfX05M3NSP12Men 24CSvDt850sUo4c95jSdqdtIART16YwXK+nGYtcG6pPMPcaTfnyWVAyZaLHrBSsIrUGfMSAyA11 Or1Xiv+0SKMNZqmvOud97yXlftp5BhjK7wTc7S+Dv4UPeNUEUFSc7Q42nio3OWT9J/1KVW1JXsU
 j3MtYdwNfeLs6QhN8qk74gEkDs1Ank9fu1lwcmGSvoGcgf8OqdCwTV6GgpahE20/8e9W+7COLcj +KN28Ku84dW7NJlbjfu4zRJzq+EG8zAkwzWhI/jy54f6zp+2Ufp+f3Ws5EFFoGAqblvlYisU+t8 PtYUSX8gzWJY8KOTz3g3YH6k3A/Z48d54/HyLkocg7COQabpkKpK8vgJRR5q/2fuN3QrdRyuH0c
 35LM3smVbEQSQUbRGF35t3rxik5PDoy3FLId/qcmGdBiviVrqIa2E6kW2ztxUqWmiRcpnNQQ
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6815664b cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KvPR1SqjJM-xazvS2iAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: jNjBbdT9d-_JUrtffoSji2KJHZt2ATy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030001

The commit 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM
underflow") made sure the BAM DMA device gets suspended, disabling the
bam_clk. However for remotely controlled BAM DMA devices the clock might
be disabled prematurely (e.g. in case of the earlycon this frequently
happens before UART driver is able to probe), which causes device reset.

Use sync_state callback to ensure that bam_clk stays on until all users
are probed (and are able to vote upon corresponding clocks).

Fixes: 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM underflow")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index bbc3276992bb012a1b79937bdbd069fc01f75331..09ef450a9fb8e3efe6e664eb17caffb0bd337f84 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1367,6 +1367,9 @@ static int bam_dma_probe(struct platform_device *pdev)
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
+	if (bdev->controlled_remotely || bdev->powered_remotely)
+		pm_runtime_get_sync(&pdev->dev);
+
 	return 0;
 
 err_unregister_dma:
@@ -1414,6 +1417,16 @@ static void bam_dma_remove(struct platform_device *pdev)
 	clk_disable_unprepare(bdev->bamclk);
 }
 
+static void bam_dma_sync_state(struct device *dev)
+{
+	struct bam_device *bdev = dev_get_drvdata(dev);
+
+	if (bdev->controlled_remotely || bdev->powered_remotely) {
+		pm_runtime_mark_last_busy(bdev->dev);
+		pm_runtime_put_autosuspend(bdev->dev);
+	}
+}
+
 static int __maybe_unused bam_dma_runtime_suspend(struct device *dev)
 {
 	struct bam_device *bdev = dev_get_drvdata(dev);
@@ -1474,6 +1487,7 @@ static struct platform_driver bam_dma_driver = {
 		.name = "bam-dma-engine",
 		.pm = &bam_dma_pm_ops,
 		.of_match_table = bam_of_match,
+		.sync_state = bam_dma_sync_state,
 	},
 };
 

---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250503-bam-dma-reset-1766d2d12cec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

