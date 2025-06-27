Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E142E9751
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039499; cv=none; b=f735rxOpxQ99H1wMo74A5Vk8eL9Z9zGHJ3X/dwOUulnEkCzJwnf1EpLMBMBbM/RolUYYoJg1nSaKe3dQUQjOeMzOP9RvIj6tO+I2U6Jg4fc6I3Wav2YGBxpilgsnpZ94ZrWuhA5tnPNLFVOehw7kbA9yGTqO5AENitzMxg5glHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039499; c=relaxed/simple;
	bh=5hD/cXUbagplk3UVhcm2A2EqQSEIHADTEb57WitDj/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cBdqkj8o/+Hp6ctRu/kG3wTGcwoogUJpIhLg3AHDROnrxqXEAhXiHLIcsvU8l1fH1ZHH+7uDewr31Qc8KUJ1+17ckKrpNo71THVIRGeznsip4Xnf/uSxrB1zmDbp9KX2SKVpHaOTyWvNh4CQDywrLXfIu6UtU3hmixQEWsmoLks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joCX8u5O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joCX8u5O"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBu3vQ009871
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OVY990Jukt4echo3RExNnA9BOKm7fyhFlYx
	ouIGS2vU=; b=joCX8u5Ox4s3iYKTy220awF9UlwYq7mZJAzoEjecIBvrTODCDZa
	Y0brMQybHXtJmLbSY5zjnzKSsd7Ty0Wrx+uQGkWdr0l/df53ZIEA0Q1d8zMdLQ1m
	iTevFgEhKCOCMkuQcLmmAUZEBaNy6zj+c8/eEE1WLDjDdGiYFaHngRp0lMnrz5vz
	TEDuQcuY+5Z8YpPXXykfWcFYLCDssKxOnAuvyaCcUd1/HZD/AqCsijKIXQN3zVi5
	XxeNkql/yp688IZ1Zr2dzY9FKk674sAwtyKFZjDGpNu7MEdm+LWeP2Olwx8vTYNi
	ngoeAW/dqlWRCVgn2KdkPLh6iEQTrw+NrDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fh2mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:51:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09ed509aaso325152085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039496; x=1751644296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVY990Jukt4echo3RExNnA9BOKm7fyhFlYxouIGS2vU=;
        b=tUH6XH/k+4SIKb0h/n4cu39LpkQurEJStEvKTyPI68xme2yOurBJhX8HeqZQUuufLP
         biK1NAEAUB5yw9rEehzHufX0V3dEeeNctonE31TvaV3iUUmFLXD9/W39R0B/stcybuC+
         30OfmXTn5Pc0XB+MQlfmwX7V62SAai1Ijx9Ipj0OV+Zfnj1Ik429nCGFnzIpIIiSyxfV
         feV6OjmcOnSD8kimvWEHWGN8SXdjJx8S7K/flglKoDat8yV5IipRdniWzf29zA1EcOsp
         MrxKVIWQCbXGf7MjgukoYiBOSOtxGblWUh7lEFIxXeOu7+zE1V7X/zHEUeOOMIfAA3gg
         u6Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXTrWRY55/SKjNb2DxbXBDE0wxgbjyeZdjAXk6QltLtksvCH2lvzy/F0wszvXWdQ9RJwtLbA5A7sONfAqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxft+71HTZiRW4Q/L9I+SHLfCAJVDGQJGBEoWRBu45rbjDJnJbe
	3nR8Cmbb79kUrcECbSMhnzoEgDxETgv34EcG0ztQGzi7mgPmd8dMt+mccvwcn6CYMg7Sg1UvjYc
	mCzbd+vC7W9UlEbldrruiR5SiQeM+hWqb41bNLrUBfps1vA9XrWB7zl3xrmyppZBidzU=
X-Gm-Gg: ASbGnctb5UNfmRhISkufYtuk4bERXkfn8WNe8Aj2PWOH+JPb3KskCrL3WonTmpmScnt
	kPT+tAeClDY2fpbPTdY6ITPiiDWe2AhaP71cOqdjSw/kxpFYkC7VdMjLDo6jIwMfYllPpQc+dL5
	ptDyLvGQOjayn0iDseYe1e09eEkcpaM6AvOQn7VFEwtsfh25oJX1kXkouiZcheWRiASQLZigi+A
	gNkAeP5POOy+qs36FPz68OW5eBYbjJGg0w9C112MqTAmbzxFdmCs520g64Flw12vuMfAvULkry8
	v+4cH+UzoQbwdSRejt5Tixp6nha01Hr+nlSlYh6VRGvFQweF488RLGo=
X-Received: by 2002:a05:620a:1723:b0:7d3:8472:7f9f with SMTP id af79cd13be357-7d4439b744bmr582491885a.50.1751039496134;
        Fri, 27 Jun 2025 08:51:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ3ebcyYFds6UbAx+BvNEutdtfVQuzxIsWg5tnkn1hy8H8wtGUG+i3Ja19Fih2KXpJLlElNQ==
X-Received: by 2002:a05:620a:1723:b0:7d3:8472:7f9f with SMTP id af79cd13be357-7d4439b744bmr582486385a.50.1751039495492;
        Fri, 27 Jun 2025 08:51:35 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm3082663f8f.95.2025.06.27.08.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:51:35 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup
Date: Fri, 27 Jun 2025 16:50:59 +0100
Message-ID: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOCBTYWx0ZWRfX+S4XjMv3P9k8
 sT01XavLZel61FtP1GW/XKLe8av/i75qUNk+UAAZdPubH98ubl6MQSVPELVfz0bVXmoo+U+FylP
 GobiI2ohJox6EcUt+IALMW5KWTI6H5dzw4WoRpA7Y6tC7RBKjDxrAWV8pI2eDiAkAv2oq04rqsC
 9O2RT0hndS19I3r2I3OA3pRSP3e0lkXBjYYm3pji5zv1uX+Yhpmj8ME5Buo+XK1pQ4T9vA9KsvI
 /IivNc71vOyeKO0Kyb5bZTywdTy5t/+LG9BIGfEe3WoLdxEGBiQPGD/e2C3jSBPSICO+Phs6ZPG
 k5GUBgG/IDfznMvXF/ys4+3CggHac0mkxkLCCVUi25aNPczqbcyYDyCNYO7hebfRE7TEHUdLWJr
 RQWUJqwT8cPRtOfv+m4GUKhDZHUhrpibPZMhZzkatMm+gp+ksxJEcp5ywdFzGvylgJYKHJ0X
X-Proofpoint-ORIG-GUID: 0431FShHJuIZhHUzc_YhUVfwiB0oh3mH
X-Proofpoint-GUID: 0431FShHJuIZhHUzc_YhUVfwiB0oh3mH
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685ebe09 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Ja3qRCn7lQV6jF_xop4A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=679
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270128

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

All these 3 codecs have been duplicating two of the soundwire
functions. Noticed another new driver starting to do the same, its time
to make some helpers so that we do not duplicate these functions.

I have added two helpers of_sdw_find_device_by_node() and
sdw_slave_get_current_bank() in soundwire layer for the codecs to use them.

Srinivas Kandagatla (4):
  soundwire: bus: add of_sdw_find_device_by_node helper
  soundwire: bus: add sdw_slave_get_current_bank helper
  ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
  ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper

 drivers/soundwire/bus.c        |  7 +++++++
 drivers/soundwire/slave.c      |  6 ++++++
 include/linux/soundwire/sdw.h  | 17 +++++++++++++++++
 sound/soc/codecs/wcd937x-sdw.c |  6 ------
 sound/soc/codecs/wcd937x.c     |  4 ++--
 sound/soc/codecs/wcd937x.h     |  2 --
 sound/soc/codecs/wcd938x-sdw.c | 17 -----------------
 sound/soc/codecs/wcd938x.c     |  7 +++----
 sound/soc/codecs/wcd938x.h     | 13 -------------
 sound/soc/codecs/wcd939x-sdw.c | 13 -------------
 sound/soc/codecs/wcd939x.c     |  6 +++---
 sound/soc/codecs/wcd939x.h     | 13 -------------
 12 files changed, 38 insertions(+), 73 deletions(-)

-- 
2.49.0

