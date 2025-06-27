Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743142D9788
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028701; cv=none; b=PQ3XFv/7JcPkplD8/33ePgFG6tf88S8eKWTjJLwneFboCT5wnD6OqyLWPnLbZjW++E53EWC+eWW/5o+PiMFyT1RftZQrNnvO462mDMRCmQ+/AMnN25fU6Y79BUaRQDkVPAOwGWv9YfOr/52qhkdv9LL2gAjQAilF89J/Ut3uw5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028701; c=relaxed/simple;
	bh=si5pkg3D7M7AemArS/xiRGGpBgK97TaRSQ8mXnLW03I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ncmy1BDt4SzPFMz5MeqPvOGUEdTYLUyK8qgKlVBDq9qz8ZudzzUSwPlhHx6lUp+Omk0D2bNvJ1sD2Y+8IsWyU13KwCEXdZ6Stz1uSZeBt4/TbUgEBP8OC/wCXZ3gplasa89adyJYxkodeksPbmrOHhm99vjYLlY4FlsVs1SSgFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IbMBNwYC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IbMBNwYC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBg0K5028796
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZrQ8AHkAD30tuUld9m43KAGRDqt8gThRB6o
	xUrxVwDo=; b=IbMBNwYCkXD5hjWt97lAhSiAVOC6h7oxNUV2kyldYK+XeLJ11DI
	hwqWLN13j41143FRF0SO817fOdVUt9pSIe7UkdkN9ldbhFw5JWJMXDJiItHDqgZx
	0kBBkcv4PNCVGBin7uvk5lk1NlXw+TxkqTuC2jUEDbXxuasvtH/wY6bUfTZEXTXp
	WxfmqAw6qIcQ+rY2+XG0cXbA925UEr4ROCJiJRFvsRrhZVCO86mfLz1MwvMwdPHJ
	CX+gwA3lY1yLPphga2ENcgDKTJsJ+B7KE6DhXO0nKR08nrrZp2/XrHehbtAKMVDE
	L/ToiV/xiULMEFu4QhcmYogoP2QYh76eHiA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbhhke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:51:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74890390d17so1846978b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028696; x=1751633496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrQ8AHkAD30tuUld9m43KAGRDqt8gThRB6oxUrxVwDo=;
        b=M9kJNyUQWpC7Hdk8IqbhWF2r09l1pYQ9ajpoIL4ZXpqH60Aamx65+S53TRIx1nKKuD
         5JXKER9A2Ho4bNiMIA3yuanuSviww5hhyyYCxxcfgXV3QXdQ1hWIHmjBjJN6829EP2Bj
         5BFlHw/vCMQQrRYs/EV2ZOWJ/RX/Zv8GCtGD7K+O2/UiT1AArWUx+BtV9StGdWq4Olg5
         +IzCZt9F7Pvx1qL4/ENeDxUqc7jH1u0HlS9MbTYFC7J3zRUehr1bgPHjQO+1XKnyemtX
         WGzhJqIqrLYUhe6kLNNpWCNWT4zYqrGpFGqJsPA95gLrXubnsaV740uoWe71TDRoPyuU
         cRmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNQzjvde1Abcum2B0QKyvKzP3r0+sYTmZ2jeeTGYeRNrcBT0AoW2c4hjI0ebsvejmZUTo1c2ZSNqjXsgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLqZZiUUDog6WsEJAODBRzx4x/cxYYn/oxQHLRR6cNkPpir6O1
	tUCBVpQamQHGVHR2+lJ21fraltxRoDxlt3HSqmfMVjP2+FFIsCPynuNzYbED6q3xa1o8Q6yP+cc
	7tlk4RzVc5Myt1JaJO9H15zhUXcD4X3RzxlNBFcOwP9BkYlgBUrvo7TuFuKOy4zG3akA=
X-Gm-Gg: ASbGncvQzQK6IQZ9DmICCDK4xfw/0emBq6i/nlT+XV6NeeW+7oAm4EZbdr5o5Zntedw
	krBYlQo5OxclFBOWk/zvls7a5shjHgrYvQG0P0AkeFKYwWWIHnkDpx0Zji77oPp+LkLky9tOJHe
	dsQ19fsfDoXrO0g0uLpyBktdXz8IUK14z4moHETwQxqEx3kum+SUzDYk2XzY4aX1G4Q8jS1b4vD
	Pc89XaMw9zmIwoIVi7oeJc2663Q6fxH+1WFXvxH9GRXOel/HIuQDWH+yi8ErjV8U2g/56roqYXL
	q923w5fltpZcBvYhfCvBOiVbHH9HbhT/LCf0pVxS4yrik9fbAYo=
X-Received: by 2002:a05:6a20:4327:b0:220:7b2e:5b3f with SMTP id adf61e73a8af0-220a16b18d4mr4802824637.19.1751028695836;
        Fri, 27 Jun 2025 05:51:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF26C8dtDNtXckzHuaNi47xMdSgfo4gkIZBa3WflpXjgfUX5aXrSLsxvdSTRWWbJGV3ZuUfmQ==
X-Received: by 2002:a05:6a20:4327:b0:220:7b2e:5b3f with SMTP id adf61e73a8af0-220a16b18d4mr4802762637.19.1751028695329;
        Fri, 27 Jun 2025 05:51:35 -0700 (PDT)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3200874sm1570337a12.69.2025.06.27.05.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:51:35 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
Date: Fri, 27 Jun 2025 18:21:31 +0530
Message-ID: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNiBTYWx0ZWRfXwSEBjfzKuqU9
 FV6f0JdAWVr6/6wUp1RlMpoosbuoPKpC/ncMYJt1Bj3wM2/URY2n/MwGS8mPK0onssOSshVoeE4
 2x/SEoF6/KOGyELM9S7qf2h52oJ7m3TmwDfpwYLDytDfZ8LRAEYlOpKJE28nBOT7zr77Vkhlrp+
 efiM0mw/LAU+Xg8xHhVs6WwMzPSyQ/RsgboK7uoi8LZWeXGO31mry6IUdVLmzGthNAcebuF7oJb
 K67rirRc7b0NhXxI+Gg0A4+0ugmxFMpmf1sjvRVNEWjR8SkuJ+xME0Ho7RCysRmg7Yam4D/k3hm
 a7Rl7BFJkH9ED6wocG4PwDs1bRRmiWvoCzSPLeq00wCBydYFChaO0ms3R+YbKJEqDcwF0ki8M/8
 v+JbYI2tbOPDzhhKz+NFzwHv/mvvX5cX2BNErdBWyvRPbReg9xYb8nszhdm0T7msYIBMQrZI
X-Proofpoint-GUID: 7XFxlnS4vuSalCoaRX3wF9kwikbj65rP
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685e93d9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=RCjrDKQIKzBwdYVaOqUA:9 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7XFxlnS4vuSalCoaRX3wF9kwikbj65rP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1011 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270106

EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
as read-only for HLOS, enforcing access restrictions that prohibit
direct memory-mapped writes via writel().

Attempts to write to this region from HLOS can result in silent failures
or memory access violations, particularly when toggling EUD (Embedded
USB Debugger) state. To ensure secure register access, modify the driver
to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
Secure Channel Monitor (SCM). SCM has the necessary permissions to access
protected memory regions, enabling reliable control over EUD state.

SC7280, the only user of EUD is also affected, indicating that this could
never have worked on a properly fused device.

Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
* Drop separate compatible to be added for secure eud
* Use secure call to access EUD mode manager register
* Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/

 drivers/usb/misc/qcom_eud.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 83079c414b4f..30c999c49eb0 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -16,6 +16,8 @@
 #include <linux/sysfs.h>
 #include <linux/usb/role.h>
 
+#include <linux/firmware/qcom/qcom_scm.h>
+
 #define EUD_REG_INT1_EN_MASK	0x0024
 #define EUD_REG_INT_STATUS_1	0x0044
 #define EUD_REG_CTL_OUT_1	0x0074
@@ -34,7 +36,7 @@ struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
-	void __iomem			*mode_mgr;
+	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
@@ -43,10 +45,14 @@ struct eud_chip {
 
 static int enable_eud(struct eud_chip *priv)
 {
+	int ret;
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
-	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret)
+		return ret;
 
 	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
 }
@@ -54,7 +60,7 @@ static int enable_eud(struct eud_chip *priv)
 static void disable_eud(struct eud_chip *priv)
 {
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
-	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
+	qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -178,6 +184,7 @@ static void eud_role_switch_release(void *data)
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
+	struct resource *res;
 	int ret;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
@@ -200,9 +207,10 @@ static int eud_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-	chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(chip->mode_mgr))
-		return PTR_ERR(chip->mode_mgr);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res)
+		return -ENODEV;
+	chip->mode_mgr = res->start;
 
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
-- 
2.48.1

