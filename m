Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0621A316E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040219; cv=none; b=gWWdOV+oJjnGbyoD3wINkdabJ7e4s70o1QXTz/DwuiKsZFfmbgZiRjVYPVx7GG43EyT5KakXcbNWB+Dp9Qu0eqsPtfrcM0BqXiBSyhZ6xbF6/5BCOxMRa0Cd+cDHV9JUmfB9/bGcrMnNBHfoLDaxkJzerb20BPJdbxnNBkvoYV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040219; c=relaxed/simple;
	bh=4wEMYSv4N2rZnceVjUCPrSSzWsR/641Cal7MXSo20jU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DX34tTEdXm6Q01W7X7Yh/eh7WV1In1wSI2OcKTwWD7gE4zFXPtEqBo1r2SKDzhi2pS0pvaGqaK2dG5GE832Ij0pBWJzMoL6+K6IsWI3CWMgeSO4zZsihMx0N8FXzsHiQ88+YJBpHNz/MQZLOaLz3ACQoPwp6e6nWCL8LiczOXQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNOefOJW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNOefOJW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCGOqu017699
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JZtSXqN+9X1xMkysZFQM8Di5K9z4Tuo9pQ8
	FYb34fF0=; b=RNOefOJWBzLt9TAmc6uk55qI4zaVGaH+rOe7bWeBI9ph6oiTiol
	w+PI9dFFQuOxD5uKItic2x85+b3Wic7L47ZdR3mlDbQibEWtXwG64JTewhUr3kJk
	OgRgF5piq4lWaK/PwF8HU2vQvzI9JSx5HuR0L82GkTUqRnxQYVuPtZQ5RykuU6N3
	jUIJ39dHGGCaut4xIm3hYkmx+iVW1GWz1KPDrnMmPNpxsgl3TgyY4RoKvXxtmr+m
	AYn0AowArulJljXLctT4oKwJLXglWhZnyB1+cSY680nlrgaa8Oc3gDRY3Ei8QUR/
	Iat10htQy1U81KIiU1cxpaNDHxx6lokcsTQ==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx5q58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:03:36 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86cfea700daso192517939f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040215; x=1751645015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZtSXqN+9X1xMkysZFQM8Di5K9z4Tuo9pQ8FYb34fF0=;
        b=ezFXE/w3KJGQS+8niLoR9m+Ayf599KA/9kA/ZmI1s9O8jBO9/RfCrwH0Pjf6Anmf9d
         Mh+OLsGAGK8r7h8ZF2N3zwzPtuUz9l81U8YLCbxjRhXWyHKReWzAee/yn+j135g81Sll
         nl8pQhjhbWxJDtRgPgIxtpKDY3yLbSYfxr2EjG6J1CPYVV/Myh2Rllx3t+xkDMYOL7Ra
         62gVdYLZebPIZGgposu2tBj033KuZS0IMdskh0gPi9WbfU+iWl9f5ZZgmkYmAecrOIiF
         4My7QShZUeO8aGk9BR7VogrNDX54frvCuDfomDE3EyHwKUBP2EOiKX97oC/lf1Si8rkW
         SU+A==
X-Gm-Message-State: AOJu0Yxe1nFiHYZzXw+0g/noqMvlpH1/+diXoRvOsSwYLYxRpuDMWy0C
	kXNm0F6EGFkeQ6AJg95KuH7msFzX81c4WmZIB2s/NX96Nf38Piy+Bchh7AzwC+viP8LZ4xKVO/j
	DEgXlvit2RXBSGVg/bEpnYxgy/6goPHyZlhPjohKdeOJqBezZukaYhXpISrqZ40hJYqA=
X-Gm-Gg: ASbGncsMXmT4odCMCX5kvIekZID5iiEgqurUDbhyf46db1fEsc9JoukW+MRwkbYv5dJ
	ZyR80FbUo4HG0PJpW2skmh1Herpo7pBhQKsJj84wTKNIC66g+992fWBlCRQCdciidrRtKOFsaBI
	yFXXPy65JkzqUPYF61ZI/7twysP666T+C7eHAMv6+Q9e1VCkjoAdgX3X887uzpGzTIn4Kr9qjTj
	GRtXP3MIm/Kf28ANonDv70wDaHrDjypydUS11UhZHaOfMJigsmgXfYAJtuhauTzXeXaUwU3+xSI
	zYt8URsqODu9Wjt6PwGpgoIPpj5JPmuJQ+k75oA6DV8JGRqaLW5M+9w=
X-Received: by 2002:a92:c26a:0:b0:3dd:bb7e:f1af with SMTP id e9e14a558f8ab-3df4acb6db6mr46155415ab.20.1751040215467;
        Fri, 27 Jun 2025 09:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvOitA3weiHvrHbYayYKUB7m2CvxSY++FtU/jT95HoUazgWL2L5IU4TEwOtFyreuzvrnPFeg==
X-Received: by 2002:a92:c26a:0:b0:3dd:bb7e:f1af with SMTP id e9e14a558f8ab-3df4acb6db6mr46154975ab.20.1751040214951;
        Fri, 27 Jun 2025 09:03:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a5asm3088200f8f.54.2025.06.27.09.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:03:34 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: update Qualcomm audio codec drivers list
Date: Fri, 27 Jun 2025 17:03:29 +0100
Message-ID: <20250627160329.442795-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KAueyUrvxc078vRIu24uZCyIOyO7WIOU
X-Proofpoint-ORIG-GUID: KAueyUrvxc078vRIu24uZCyIOyO7WIOU
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685ec0d8 cx=c_pps
 a=7F85Ct0dzgNClt63SJIU8Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=jMfy5rlRwNJn2DxzEoUA:9
 a=LKR0efx6xuerLj5D82wC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMCBTYWx0ZWRfX4MO4SrTW9U/P
 8jTKL7KBV+Iq2mXWCc/soFL2NQRhjpHU+Cs9SvlBc7mNAlg2M6mbHpMsYQbTz8BU2GUk3UTrsQr
 VTPaD8lbjlfAoB1u2Hlq03PoYL+qj5uZrySUU71ujHpBKyX873AGmDDKgL3yZpzdzIfGHU7Qt/Z
 n3e7YriONHKEXnRnqR1HgXMYogRdPgiTe+GyZGxZQOJ5uIbGwNHniwNipRNsRSgi+v6RaTW1Cby
 zQ9vnSEJgGYAZa13rh9WzDXj0rpqsk/k99WoAiTLubsO5bP8PPaIzN2/N4i98tMjBX2XLxRTXcX
 Vt00ATybRGqjo0nSzseDEgqOk55cfg0GoiJLwJCQT11Vdc9whNwbzXD0HiMdZA4EhcvZtiAEv83
 HKys7F+iZO2D1LIH8wu30Ojo/foEK1EfBs1vftguUSG3it34SPlOhBxg4GM+2gAtviQQ36Ge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270130

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Some of the codec drivers like wcd939x are missing in the MAINTAINERS
which is resulting in incorrect list from get_maintainers script.
Fix this by using wildcard matching on both wcd93* and wsa88* codec and
bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 MAINTAINERS | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d635369a4f6c..0e0d7ee47816 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20216,21 +20216,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr*
 F:	Documentation/devicetree/bindings/sound/qcom,*
 F:	drivers/soc/qcom/apr.c
-F:	include/dt-bindings/sound/qcom,wcd9335.h
-F:	include/dt-bindings/sound/qcom,wcd934x.h
-F:	sound/soc/codecs/lpass-rx-macro.*
-F:	sound/soc/codecs/lpass-tx-macro.*
-F:	sound/soc/codecs/lpass-va-macro.c
-F:	sound/soc/codecs/lpass-wsa-macro.*
+F:	drivers/soundwire/qcom.c
+F:	include/dt-bindings/sound/qcom,wcd93*
+F:	sound/soc/codecs/lpass-*.*
 F:	sound/soc/codecs/msm8916-wcd-analog.c
 F:	sound/soc/codecs/msm8916-wcd-digital.c
 F:	sound/soc/codecs/wcd-clsh-v2.*
 F:	sound/soc/codecs/wcd-mbhc-v2.*
-F:	sound/soc/codecs/wcd9335.*
-F:	sound/soc/codecs/wcd934x.c
-F:	sound/soc/codecs/wsa881x.c
-F:	sound/soc/codecs/wsa883x.c
-F:	sound/soc/codecs/wsa884x.c
+F:	sound/soc/codecs/wcd93*.*
+F:	sound/soc/codecs/wsa88*.*
 F:	sound/soc/qcom/
 
 QCOM EMBEDDED USB DEBUGGER (EUD)
-- 
2.49.0

