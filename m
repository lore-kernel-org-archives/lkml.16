Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00A7F4E2
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751810457; cv=none; b=iUHhSgu62Zw1GhRg+0ucyP/HfZMMDbcX3P0sTci0NDK+0MVVgerVVg9eBg3u2eXeDVVbBJjBTxt0W5g9JJ1Go4ymvICK6GhCmApGC4OcsByWMVkP5Ph98URu5aacL+NlCuJO8D4ppdm2Q6VdRr40twbzH8FK/yuwuWUJ9vKPA1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751810457; c=relaxed/simple;
	bh=oqwimgWLnScWATCA29eOQ//MuKV5i1lpW+AHath4UoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ox4eCkI//SRtI6YlFkBRKIjDry9S6a1Ieuq3quILF7J0Yy8wQFtd8rOghxW8V/9yPg7omVc8fDvQZ3Io4fNs00LCa3PWjIMqCp3Opf/QmPVMGlnU6uTZ8R0JR0yNwx+VvBt9erLEgCOdMe7DEwsYIrESjm2Ry8qBYW79vSrczfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAPZt4oy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAPZt4oy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566DvTKe008917
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 14:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W6Z4pPsIJFqCRzzz0glOc6
	nFhWzx26VPjC/to9J8M2w=; b=fAPZt4oyKGim7oDcpE/4LuRRK2VOyFQQSBvr1f
	zXqWUd5/X8SBGwADi/Rf+3mrtsp85BZOjjdyuJog7PIWUppzO/jcqBLK//IUAhpV
	vDkCJ9pfbayeCaKe4xVeM9Z84UJwVRfOT19hn5JPM6mG2K/fUJofH8H2n7fCBMfV
	NwyKt7JITl9gSD87AIodRCa97P3+alwA2IHUO+3FrC3RDczx9mo6NO6VFNfu5fbt
	KoHZ/zv31VCwFQyZ0u8mmQ4Oc8QpM708Ajc4VfWjlhTfuONLnd0bT5Qr8Hvhi8JI
	3mQSeJGTIY9ogjXV8ZHedee9ic3MWWWJCFhK1L2TBX20kY9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2amq9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 14:00:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09ed509aaso279525885a.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 07:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751810453; x=1752415253;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6Z4pPsIJFqCRzzz0glOc6nFhWzx26VPjC/to9J8M2w=;
        b=Zi10ghk9KpVh3qiVyOlKiK5GD6ywhfpw0S/0uegzNsyj2AdMc0CHGb0FdRhzdrH8Rp
         d9rNgkMzp6TkT983MkJXZRzrZ/FnSSU5uHjmj8MH8Z6L7IvIZ24hzBkF652Oyn6t1mc8
         uYiLj/gd4XmVVHWZv/39arQlgN1qCQqxQz/Koau6buOAz3DLrkLBrKs8j28MxiOswfuf
         ezViYMfWt6cyOqCyrh82Ac1J90Ki9XtVRW1vpt/N4WZ9bdlt8nqwtBvYxY161JT5sdo2
         MUn0QSZoDIHxt79pg8g7huTQQSwz3ktyIVSpOhO2yFrlOrtwXHdi0It8R49y57xA8UWO
         aXQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdTjo/vvETpDTkexVkqz9ur/QnVEGEf08r1POol50B7KxA1RDqxYC1X6mJCuylJ5jpttvX6oOjv8a0Zhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTfupkwvPiThwKHqHHdMssWAcaEoosSEfybaDX4/tQR2bKKxE6
	lbUY25GYTwW1Yat2qS+O0rVAenUeRL3eyIignMfEpTzabvYsZI5ZEqrPUUGI8ITr2435HvYtv+c
	Ihv7G08HXHS/ARHn65ug7VCzmH2pv9b8ZybnmoXMkB3arUlGx0Wj6o3IYNMBAO+OJcbg=
X-Gm-Gg: ASbGncs1rikkSTK0HX97kxFcAbIg6ZOfOJXQXopS2N5DyvCfkk1txoFs3UX8CuNeIVe
	eObVp7AfgrjfPDYoHJmC0BohPH5//2EIxdctlXbnLy3vttBzihydd8DaHMnQsa2F5bFv4Fp2MHH
	MPOKx3yAKqo9kvb24IHLXck2aJroG5v6IdM/8+lx+6jv6UCDEfHoSZm8mIeo/yOa+LbFf40zZX0
	WXdW2frIz1tn1Wi81SwowN7oC6uUtokpSs8KU3jp/OTSDNIYF3VDWisOUUuzYyJWgA+GnPoz42/
	XtR4prhstIOAqFvvMU4WaSuZP8CzZnx0/pAKFvUrHJkQTp4BP4T+YropSpA3rAIt7UfAuMgOYVT
	+sRwppEeVuY/GH9HAdslAGYTJOKWy147oArI=
X-Received: by 2002:a05:620a:4150:b0:7d3:f3e1:b8db with SMTP id af79cd13be357-7d5f10fa23amr618787085a.31.1751810453160;
        Sun, 06 Jul 2025 07:00:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc3upOBwOzreeA4TX5loHnVuqrq9dSSRCBMGhyMTDSkgjtx3ZahhNjPfBFGO7filOlyl0/Lw==
X-Received: by 2002:a05:620a:4150:b0:7d3:f3e1:b8db with SMTP id af79cd13be357-7d5f10fa23amr618780385a.31.1751810452489;
        Sun, 06 Jul 2025 07:00:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c4785sm972499e87.231.2025.07.06.07.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 07:00:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 17:00:50 +0300
Subject: [PATCH v3] remoteproc: qcom_q6v5_mss: support loading MBN file on
 msm8974
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-msm8974-fix-mss-v3-1-8b5ae61c86a9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJGBamgC/4WNyw6CMBBFf8V0bUmnDwuu/A/jAmSEiUJNSxoJ4
 d8dWLlzN/fenDOLSBgJkzgfFhExU6IwcjDHg7j39dihpJaz0Eo75dVJDmkoK2/lgz58J4nQlAh
 gG49KMPWOyNNuvN4495SmEOf9QYat3VxGsQ28VhYKbbjwlQTZDjTFuWjqOKf+GfLlRWMdQxFiJ
 zZX1r98Cc44bZlnU+X+8eu6fgG0IC3Q7gAAAA==
X-Change-ID: 20250706-msm8974-fix-mss-e1b8e114b7e0
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2239;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9kC6//TSGE4mGfyjwxDSTzJm9CuKb/MQm2Lwjhyl6rs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaoGT/Fn5GxGYwNVr6ikuRBjBAZ9gQiGjQcX4T
 K6Wk3sgreSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGqBkwAKCRCLPIo+Aiko
 1d5kCACEa5X7vOj8g3uJTKYq3thPgy1OgBwDopVy5vHg0sKDQbDYmtYkJ8Lf/cb/43V6om1l8Fj
 aKy8b/BkNbOFuc9xvtBpai+FigeVryI2uPVcVxCBV4dGwMhDXBM0RhAuHsy3e8P73Fi/GGDtYz+
 n8zBEeQRe5yHOxs3lmxTM7AA2hYE1x4tAIIOngu4DBwy2vEFNdpvtV+R+Sy4a27FY+ZaMf0qprE
 jMZNiejrukxJdZQa+aOQbrbu8xJjv0a0UYkrb5vU0MDrFXLo19ajcR5HrC0P9XHCUCj+pYQH8xq
 fe6NdVMUPLyOgZvcxVqNQ32E5BD7je3TsAjbThuc4ceSf+z9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA4OSBTYWx0ZWRfX55kvDeenIljF
 Ers8aJWhLNqdhF+8cnCnhTCTe69w0FPGHNQooihHPajczFOW3UrT8xxyZthjA0lrH5ZUigrh4Dm
 bluw8TO2MnKJH1Jp0hr1XqMS4m02NzqwxWpt5TqwkKagWBUbXfsGE7eAbxnrFc0TTjMrXq4qQ8m
 L3jHQZN0NKxUdHLbZwqO86BBncmkFpMiDme6l55PykLwGUrxKcZi/rjQj0DzizBBr0+PjIc/iMY
 d5gcJHRBCLchgpHgEQj6oAOzgXDTJcJfk9OddOPHQcHCdYWJqA4rKFsWkXzmeRWpNr5bLwm19NW
 vofTzpvZjEmsFnw+8VfQ5yJlHloweJ3+UFTmUNx+ytAMZrLRBKKA38vmxLZrViRNNq6vYy+p1M0
 3q61iTHT3TWHBro875fKxqeQ6SmgatBY+Tgas5KgYEb0IG+QtRGRdJc56g0OkCpPptCaHT71
X-Proofpoint-ORIG-GUID: oZBcVxQTtDd0piesOicMtieIFTIoqzf_
X-Proofpoint-GUID: oZBcVxQTtDd0piesOicMtieIFTIoqzf_
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686a8196 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=pdK8BzC1Fe2ipjuFi3cA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060089

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On MSM8974 and APQ8074 the MSS requires loading raw MBA image instead of
the ELF file. Skip the ELF headers if mba.mbn was specified as the
firmware image.

Fixes: a5a4e02d083d ("remoteproc: qcom: Add support for parsing fw dt bindings")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Reverted back to the simple patch from v1
- Added define for 0x1000 (Konrad)
- Added MBA firmware size check
- Corrected the Fixes tag to point to the commit adding firmware-name
  support
- Link to v2: https://lore.kernel.org/r/20230508153524.2371795-1-dmitry.baryshkov@linaro.org

Changes in v2:
- Replace fixed offset 0x1000 with the value obtained from ELF headers
- Implement ELF validity checks
- Link to v1: https://lore.kernel.org/r/20230507172041.2320279-1-dmitry.baryshkov@linaro.org
---
 drivers/remoteproc/qcom_q6v5_mss.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 0c0199fb0e68d6286f1e238d110539554d1d5f14..999644c2a15b46e89ef1c04af294bf02ee0b3638 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -498,6 +498,8 @@ static void q6v5_debug_policy_load(struct q6v5 *qproc, void *mba_region)
 	release_firmware(dp_fw);
 }
 
+#define MSM8974_B00_OFFSET 0x1000
+
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
@@ -516,7 +518,14 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 		return -EBUSY;
 	}
 
-	memcpy(mba_region, fw->data, fw->size);
+	if (qproc->version == MSS_MSM8974 &&
+	    fw->size > MSM8974_B00_OFFSET &&
+	    !memcmp(fw->data, ELFMAG, SELFMAG))
+		memcpy(mba_region,
+		       fw->data + MSM8974_B00_OFFSET,
+		       fw->size - MSM8974_B00_OFFSET);
+	else
+		memcpy(mba_region, fw->data, fw->size);
 	q6v5_debug_policy_load(qproc, mba_region);
 	memunmap(mba_region);
 

---
base-commit: b12a9fa1c88a441daa33f15edfa3ded8cd6d3556
change-id: 20250706-msm8974-fix-mss-e1b8e114b7e0

Best regards,
-- 
With best wishes
Dmitry

