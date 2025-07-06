Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CB81D5CD7
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799670; cv=none; b=lr1DVKer3i6guImcpWvl5xAOP5BQMiVE6ZVgjNh8kzpabaZBNyHU8JjMzxn8Od7H90r8oeRGWL6IRUK1tnQbC6urgdbIHAR3fR88zVkej8rryFXIrv9JY5M1K3uUvuTsWxuR9aH3ZePJMOjyuLSLmHnTJux3rD7m7LAxnNfi468=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799670; c=relaxed/simple;
	bh=Oyxx5vC4JJMIeKLgfiqO0VgbZzJrI+W4ASpsNXhvHDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YfTZN55QuNPaAHRtBSzVYIW2060NawzDMWgXr7N6gwjEVurKJH0Tx0Ts+0EdywiAUtUHCYZeJziJa3AeCPpfkYTwN5r+pXeHrwv735m7U65t0eAB9kVbLMRvYmLzsFbLzRpEITL5G172fUeW53WtuVNX9Ylqk9OOIu9sorMQ560=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcHFTlJ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcHFTlJ2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5666QSq7010964
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 11:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iBkeT8jgV8DDHWz2j7uQm7
	EkBsDsU0+qy3wFBTJJlVw=; b=CcHFTlJ2hVn1ZdHJrE633A5X6LJbJI4amfya/c
	d1En8TNq0DyqNAp/PoED0viNHBbKVCvUiXyF5R2TL0FkhdkgS3Wwpc3KxTiZWubg
	qFIyZb2TwXUgduwRQ/fDWrxkwlC5GjfSNgSRCyLtJStSbFyq0XqvTgKJPHfUx00x
	efHUxpInjFyCbN+1qefNzY+2Z201fKLJv0hU+Zdl7SjRdt1LpYqfNWkEFkW2cmkY
	NLUvNklYaAwRnspLT0rCJR0urroe0UOIrfOUuMpc01cDNEaT3bnyxLhAEgMRlOEp
	BmexJKfqgZJsDQBb2/SRDSHxEKX0mll0whMSou271AtBE5Nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqbwpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 11:01:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40185a630so401885885a.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 04:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751799666; x=1752404466;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBkeT8jgV8DDHWz2j7uQm7EkBsDsU0+qy3wFBTJJlVw=;
        b=rtmoqI3mje7kuzg0rk/dbH0pnJWQ0NwEDCqlmfnDI76TLK1d3ZBZfwrk+If+pSeN9o
         i12+zRXXwl9tsVU7OFDB8npj/pCv5K5LdpGqoSI/9xFk0kOxatTbe+1v7N/MatmFoo2/
         1TWU9EBS9i9OxZzqSR7fVbkbU668CIx9lEOFhTVje6e4yl4At4axeNYVXG2+yDRfyXcZ
         LeGbKEytOG4U7lBpx1z5c90xa6NnnecvahKiRKtpUCYD7GHLaz+WvrwAfhYiK97Oq3s4
         8ESfHEytpVS9XoR4DbjTel+jAVvXUp8t50UHsCMrZu9iVA5WNzXODlzDjQ7SoXP7bK6A
         on5A==
X-Forwarded-Encrypted: i=1; AJvYcCW6whhmHkqRMhbe5SKz2xh6Xw7igO62MyreVYNNiT1YM5RnmaNN/klC2iywzJ1qj2qjDdc7mfZAFywyAP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfOFzHawjIS3K7xWhAQw6YzALeaDHB29bbZf1BC5FoQwmwng20
	dGq8HOD7Bm1ZX1rxfu4Se+E9cG55FsBtbtS543pPu2QCu4tO8COQHXD6omkinBtk3B7NohOknvm
	8eiPr7NBtEDE4uGd2FtaxKFZc9I2uFms0fXfJU5AdCpex2+G+0evii0RblX+nYnoBxzU=
X-Gm-Gg: ASbGncuxoFENlywdQ6hppvHtrJ0QxEd0uS6OwrSwUItLXhwtxnNFW6wQrrxF8ipQtQD
	o/eXyoDSxoI8OHzgEG3vjiy2Ie3Z479a6afc8Hztiw8hcJMS+GJXOmrrjJsUj8RK6ICaciyqumh
	UH7ag+OTgXlZlg2bfA+0VTUt6X4kOKkOO3tZ6e2qFjcIb81AzKisMp0NjKS4rv4SzQ1rR1HlPwr
	dbjD9LOyswJop6RLciiiw/zp+VU6fz+7D31lIRJzvgX091l+NoMKUHndvUMYeFAZdh6xMq6bl+Y
	XgA+tDEWH6+dRePOg+JDeXGWWriGIckoMw6YASPLc2du+8+/QwQllAd0fDa6RaaUsPXLYJ65gv3
	/yIR2T5BkRK6UBjmZZX4eXYsSLZkrLJ4luEg=
X-Received: by 2002:a05:620a:414c:b0:7d4:56f8:76a3 with SMTP id af79cd13be357-7d5df14bb09mr1044683085a.41.1751799666286;
        Sun, 06 Jul 2025 04:01:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+gImjD2nsMnKReqqrIWQr2EGvWEGZNMfKWWv1Nw71shiwoTzApW5p2PGgEryZvEgvDr6gSQ==
X-Received: by 2002:a05:620a:414c:b0:7d4:56f8:76a3 with SMTP id af79cd13be357-7d5df14bb09mr1044677285a.41.1751799665710;
        Sun, 06 Jul 2025 04:01:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c5217sm919138e87.229.2025.07.06.04.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 04:01:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 14:01:03 +0300
Subject: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG5XamgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMz3dKk8mTdvHwIbZxsamloaWRunGpgrATUUlCUmpZZATYuOra2FgD
 cZVdAXgAAAA==
X-Change-ID: 20250706-ubwc-no-ubwc-3c5919273e03
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Oyxx5vC4JJMIeKLgfiqO0VgbZzJrI+W4ASpsNXhvHDQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaldwGJtJi/2g3gwU7E39wmCa7dctEke23ckhY
 j0jw0CQ0w2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpXcAAKCRCLPIo+Aiko
 1SdKB/0fDLUAWxjOoVOqFGJSDDaDSWQnR+ljIRvQihrg5mT+csnQcQXRooXVO5N6rwJKAj7gEZO
 W4EWv36XjveZrnkPtQE1o+MEBLZr2F50RE6wEUZ/9uK37xxft0v6ixn9pooxiKTCh+JYRfaH7+i
 6MQ/ysLTgab6KR3Qc5shfVNjgKty3UmE3jLMQpEWjgeNwO26QJvNcxCklWGH4vJ/0ln1Bms70tt
 t/2DRNfdWHFXC3tKYHsIZULrZw7L2i7B/1vQArrnW1y5OpoW0LkrTTnqn4i1p4/jcw0A7U9n/qC
 EpiHXAdBa1fvquFGbF1dKvs+tLWk9XGNL5eKgp11OsPz6aHc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686a5773 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KmBlSpI0m1EwYyTWySQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: EJu99dsHBs9fHUcWtWeqeNcXERjLJXyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2OCBTYWx0ZWRfX5MB8brdwNo9x
 0HVOn8LriAJJl0xdUDg+ziV1636Ycs1Z958+dQXph2sYefFrQgr+lq2N/N4U/S9xvLWRZtC86RR
 qHB9SsolkZkI5IWk8eBpEv9srk+N8gkLujS1SOUyT1eZN+uO4i/kRE7Q9sRiLf6bdYGd8bRuGmw
 wSJ8PADRPsqYEx1BT1yPKUZUu/yU+XIh6kL7OpCMdW758jdHYbQdc/S5IstWVnyVGuHhGedtx1w
 +5B1hPZiw308prWHiAz+ALdMXMbqgeb/qFfzka2dLDOqdY22jyhMMS6x69NMD/K8uaPvh+qM/Gk
 sHYkb3PRC4hFzi1CooIb1qH/WbhNM8a991Utj6+jpIEk+ZT9pI0rnXsE4N6dgjJX/yZIScFYV1B
 SQziFYRYNECwpgF3Py3OISwSnlB7OoKtNcHIyyjhuaQuQpeHhuidpZS3YSU8Jpy/N+AZpl0+
X-Proofpoint-GUID: EJu99dsHBs9fHUcWtWeqeNcXERjLJXyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060068

After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
database") the MDSS driver errors out if UBWC database didn't provide it
with the UBWC configuration. Make UBWC database return zero data for
MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note: the driver is a part of drivers/soc, but as it got merged through
drm/msm tree, this fix should also go through the drm/msm tree.
---
 drivers/soc/qcom/ubwc_config.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index bd0a98aad9f3b222abcf0a7af85a318caffa9841..df074520a8cae1a202a14ca094903bb1e7389066 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -12,6 +12,10 @@
 
 #include <linux/soc/qcom/ubwc.h>
 
+static const struct qcom_ubwc_cfg_data no_ubwc_data = {
+	/* no UBWC, no HBB */
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -215,11 +219,17 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
+	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
+	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
+	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },

---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250706-ubwc-no-ubwc-3c5919273e03

Best regards,
-- 
With best wishes
Dmitry

