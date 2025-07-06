Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347E81C5485
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751813245; cv=none; b=rcQqha+z2mQbTuJaHtqNj/a3vhpkiETQkh31l7pGeYiJ2DTpbqEBJA1btH1YAHTVydbEsGTTwh5r7VrTeg6PjqblyV6qNSqr5pwxy72x9IiS9YEplOZX2dOxYhtEy25ACpenQUJ3i7e/71fDmk4eGM7v60raOir2Rms2hbnRu+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751813245; c=relaxed/simple;
	bh=skypqUzSwtXJGsliG5Y8ja/11l2hi+RC9szZh61cAag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PJJp9Z2hEdV9n6lxg/54W+BGv3M0rwkdLhcA6cTLJ2mB+TFCtWR/ZnQ+ZsBaYEoGqe9Iq2y0nSKiNIVZVIjzjzeinZ8Gl0Cx9UoCm49XRQ+yBsG9XKhPQjGkkXy6rIbWz+sYdI2FJlPA4TlF+DxXmeHvdS23qGAfdKPGo9M7zhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgMj7QwP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgMj7QwP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566DNnYA012786
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 14:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vsdY6eVGhQLNX0O0RCx/rJ
	VWqOZjeYxZJRJqRPOPjKQ=; b=hgMj7QwPc8SXaciGyvmg09TXAqh9drASBZjOaO
	pY52TQ0TMLUf2h0gQrdwcewrvzj90XMM3Q+FLAFgQwnuj2byl1FyVsORnmGbVcZW
	mWwwLomd14L8h2EkPv+OoHFK9MHFRVeXF9whUfChmAqmF8HC/c0mdzm9Xzrpm8ef
	usvBqYE77LFb6cUJPMra14DEwQdGeVgzgO3CHqUbvbKcrAc4xL718DYcTQnUVBhh
	f2dG6S5l+1COJlzyN9aaStfUid5GTY+YjEi3NMT9rLRvTm8chCOwLzcJ/ahl6UW+
	S5R0Xkni7t7HwJX4Hyc118oNuJ6GXkzDiwRhareBMv3bq/zQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2amvf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 14:47:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a6fb9bbbc9so72524761cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 07:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751813241; x=1752418041;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsdY6eVGhQLNX0O0RCx/rJVWqOZjeYxZJRJqRPOPjKQ=;
        b=oL1QKu0B/YjS9Derhl+SnuoHgivt3flpu+0q/BO0kj5u2T2m3DfwN/g/NuSeTQqYp1
         14WKvu456Xz3HIjqV7ilC9+x7XGJWi16zXNCsAz9T5jo0KAFc1Wx/6oMkkb/MmjYiqA7
         HLRZu9ONUUxmv4HjiRR48hvM2ievERO2SBsLa9KlaZ4imO4lLLbL02eHEdXhIehuA7Vx
         RnqHjF7ErEwxT5KqKWiCcGOgsIiGCZBmWvYbV11bAiI1/7WS6byTrpfwR7xjkhde34vr
         cSB/Tqw9taDzSX17OuzQWgaWeKrSuLCf/bel7tpYE01a1z9eWak0BLYaTDGxcNdSzDB7
         rLtA==
X-Forwarded-Encrypted: i=1; AJvYcCWtvieE8XTcsInDAGlSJdgDnz2USQlNtbmh9k80NVdLSPhmBkfoURrKq/NEB6r7ksSWJWxoWpm+21OexHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4GaVcvV8nDZvCaGMNoU0y1xQTB0zN8jJd39vHzBEGFydeeFkz
	19oEaxLCz+bCzAgufuBFua8qCTrEq2/Eaaa+hyjnTxfMYrQbYFx4poBpV8eizxqi1Ty8rzqVvc/
	M7keq6/M6l7paHdW2nT4lZ1PSuDkCA86u7FXHAEGBFy9VH3gnKPXZqpibXDnH/wpCWQePCR6IW+
	pdqg==
X-Gm-Gg: ASbGncudOMEBEx2azeKgq5BClpRzxA/IasCTwSTZA5GV1C/FtDzOqohIUZ8taC8ai3x
	YPzEhv5fzQgUWhC13CVZj7omLLpljjtTqe5oBWj3GCiEBlFq8TyZWQGocp6HcXH3xf0a6lpmaeA
	bbhsXBUkBQb3jEekSDhkNtwhLzZJ8awHWT/vLR4Kl6p8Vdi5qDSg6SPybcE/uhiWKAcYeHaOPuk
	jldF4N7gkbt8xjpgd/kmlB3dqQWfiLy9HOmaG2VGHJ02hoLZ9d2YQyUyWzeggzaj8Zq3AiSvtUl
	HkxiEU6k0mtIgMT8K6xn10MdfG1qilHSrw7jgDhU9LAthEFFgBl+kcYQPjX+bDKvv1nY0jzZqu7
	1yMf77tT3faRcDLSMU7jLzrFhHrnhzmS+Ksw=
X-Received: by 2002:a05:620a:a109:b0:7d7:22:25b4 with SMTP id af79cd13be357-7d7002225f3mr464496685a.13.1751813240922;
        Sun, 06 Jul 2025 07:47:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoVxk9kRFZG7elfkrbqpXenfZ/5F9xPYBP2fV+rFJZtlWG00EY45h9sZgiedVAQmSfK58O2Q==
X-Received: by 2002:a05:620a:a109:b0:7d7:22:25b4 with SMTP id af79cd13be357-7d7002225f3mr464493385a.13.1751813240450;
        Sun, 06 Jul 2025 07:47:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c3e9fsm978369e87.227.2025.07.06.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 07:47:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 17:47:08 +0300
Subject: [PATCH v4] remoteproc: qcom_q6v5_mss: support loading MBN file on
 msm8974
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-msm8974-fix-mss-v4-1-630907dbd898@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGuMamgC/42Pz2rDMAyHX6X4PBv/jZ2d+h6lBydVG7M6Xq3OL
 JS8+5TCYIcdehH6SXyf0IMh1ATI3ncPVqElTGWmYN92bJzifAGeTpSZltpJLzueMYfeW35O39Q
 jBzUEUMoOHiQj6rMCrZ7Gw5HylPBe6vI80NQ23VxGkk15La0S2tDA91zxU073uogh1gWnj9L21
 zTHWkSpF7a5mv7LB+WM05Z4MvXuFd788v//0gxJwuAidGoMXez3BVHcvuJ1LDkLKuy4rusPpBt
 ZRjUBAAA=
X-Change-ID: 20250706-msm8974-fix-mss-e1b8e114b7e0
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2505;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ffQraQlDo4VxV7QYtI1NeKFMPYu+1edQjOFU6FplvMY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaox3o2bW7vVz/PPkRnEnJVlq/p6g6jf7f0nhc
 K1chBRPMs6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGqMdwAKCRCLPIo+Aiko
 1Xq+B/4ihMTdqR+F9qPwLmrNWCgeovUbEo7x1DUQi+3xt/RM05Wlkacyd/lpVWLOLFNiqw3li9a
 QeafP2dGHD0YZPQ6XC38oUkqyumuO9Rp9fKabLEtRirX7WhtQ2+GzYcZU7uzdSiSuBBToA59AGR
 m1s/CnkR31rSRxYYky10ZuIEltebJoaPlR9kURNUcPzdB+yZtWriX5hdUBL1GGAu3vearQNcW46
 pNDBRjyst2Zc9BKs/E21r6eGqOa3ATn9SRCR0WdRgCjntNisE81vKVa0GWlTpGfQKOTOQsFhreB
 sgujG+mVSFZEoaTiV6VtsGcb5rXKHAr62clL4IGm+gfNdHRS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5NCBTYWx0ZWRfX99FXs2yU8tx4
 FbCkxeY7iC5dzkODEQ9jFWC2PZWy011EwrzG/wW19uSvwca9Dwvs6jyZ7/j+De7RomJcxyrg/sQ
 JCVxfEp9yUnynHBA0Ud7FX+EinbeEYegUa/yYopP6oLdWOL7WjLaR4dsmIF+g7VJx+YAULQVd5u
 ecVC6qQROPCZZwll2ECPH8+d7aDovMw0aHdkb6DFFhy5+Ro8RpURoTKUY1KQj7IDABgeUqKnJfb
 T4yWJNIjIxh4N5/wmWroB13DAWu8bvtwF++sAqSFQ5bjqKSnGVSZ63cP1J6G6p5gsVJfzvG8Zdw
 r5QL/DncYtibNHERNmUcaDYyEoQpKO4xhD7l1qU/I7BbE46qI6Xmqfl6j5FuU08JrIH+pQOwM9M
 2QqXFfnHydJzLRL7COqUS+A++H2MdG3wdRAkCZeCsbNI/gJ89nFevs+T0Hv4zleyCkvfvut5
X-Proofpoint-ORIG-GUID: PSs-To_WL20lF2aaqIvWOEahTR-1p0E2
X-Proofpoint-GUID: PSs-To_WL20lF2aaqIvWOEahTR-1p0E2
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686a8c79 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=pdK8BzC1Fe2ipjuFi3cA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060094

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On MSM8974 / APQ8074, MSM8226 and MSM8926 the MSS requires loading raw
MBA image instead of the ELF file. Skip the ELF headers if mba.mbn was
specified as the firmware image.

Fixes: a5a4e02d083d ("remoteproc: qcom: Add support for parsing fw dt bindings")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Expanded to cover MSM8226 and MSM8926.
- Link to v3: https://lore.kernel.org/r/20250706-msm8974-fix-mss-v3-1-8b5ae61c86a9@oss.qualcomm.com

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
 drivers/remoteproc/qcom_q6v5_mss.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 0c0199fb0e68d6286f1e238d110539554d1d5f14..636f00d481ea80508fc9db28d8e2e225ea52372c 100644
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
@@ -516,7 +518,16 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 		return -EBUSY;
 	}
 
-	memcpy(mba_region, fw->data, fw->size);
+	if ((qproc->version == MSS_MSM8974 ||
+	     qproc->version == MSS_MSM8226 ||
+	     qproc->version == MSS_MSM8926) &&
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

