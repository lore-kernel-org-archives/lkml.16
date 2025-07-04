Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407532D0C8C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631160; cv=none; b=Zlin5Y62ZCbjM1b5iRaHfSCEdthT8bOCNB4p9s8L8GnXeKln336eX15VLGYF9ny6ViOQrEBO96WopthZPuJ+QreTwJN65saadiGO5BRHjjUlKM2v+RZCDEbhukVA0m7h9jZIIgpGhjeq6gxMHJm4HEdW0wkGS4E9KY+ER11NKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631160; c=relaxed/simple;
	bh=eY/8mPA3OuIFqBWX1Dtb3n86syoF0oEJrMuduR3BVvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BvQcJCgYOSD+qxBkiBlP4j+R1F8zlnTwkGYpeLds21XhBM5UkzcoZmpLxXJFz9XThuAvsDGtwp39BqYreyCEt7CSGN4IjLKk8zEqZUnGEFiXcSAG/rXRo7r2auYIJGbVdmJoHdPMXceMBevemHDHN8WnvnhJwHXIG4QoJW5JUUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/zRL8B7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/zRL8B7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648fqCj025936
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 12:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P0ScYG836X0AMGgN04TcZ7toMg9xkq9JLx6
	2TK+uUEw=; b=H/zRL8B7njti7/MZ0kNxAs30Vfm1CqTQdADUdyq1nhk/yT8e3n1
	wYLlC/wPR6hhYgEAqEhW2Kc4dHYwo/piOhkZh01aXoFrymyllApGtO8XVi/nJEp7
	hKn/cQCoO5xRRa+gacLRnx+QIdDrDvTnAZO+BPy0cZwb+/ZQ18/JbWHQ9ynsjQrA
	rVSCUx5pK72tvpHe4FKFvr1Tn8Cmzm2kiG9KlJFw0dSVkrSkgnfKCv/aUWI+0dfJ
	fm9PtR3uq2wznLnDnjBuIznnK/lEKJpobV3UFzFOxXFZJ+yCJuul07z8JBdox+Tr
	3F8LV9Dh/oAnptEZlsiLGhjcO+OUTbEVkeA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd650y07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 12:12:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceb5b5140eso123228285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631157; x=1752235957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0ScYG836X0AMGgN04TcZ7toMg9xkq9JLx62TK+uUEw=;
        b=jSlBJGeoQ0tV2Quy9cE6uUAQ9DK/Co+NLl87FooUObAvpwZq/xFRucYEoff+ILBK1l
         vVg84aEKCjzrwNhoxgZQ7VAh8J+X7LkwKBIk6km3P4vLF877w91oPYSjDFchV6J1ZuMH
         oz2rHMRvhzERJWyNcDZZJQby+Ws7p0LlXs6Ozc7oJEkWwaziEhJqeEoHTn12ahPPOtD1
         8T6jkRQvv07TeJrkHCSL2rx8wjbUKTjLEpZ9j4gOKMZewN7zvcp7n1FmVrD/ywQqbrco
         djqC+R0GjuOsibGOoFy2ENeUOKbsjElodnDCAuZEblJQJsHh7e5TyO4OvuiQK/YWvTFe
         i+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9oael7H2OwsSihUzmgH1QrKhVbmlyGP0dmmTIzuQTCtnwXXKxcBqNOw1yLFVhfUJ43zjwwv+8iI7flvc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+igZD+1R511Q5OwPOWz3tTC8BorgR7MIhKkRwiZG7dEQTID9l
	NJhJqfesE8uG9L/9itYJqQzhI8vM5Kzc7v7DYEte4CO9E0b+6l8aVKRvOr4CHUK3nAsnAoxqYlI
	tPNfodY7t2UJP8S5t31Yak9ccfsDfrLRGpurS9yl+x3ov57ewX8lelqe7SLLRu/QSrTk=
X-Gm-Gg: ASbGncu9LMsY/q7QKxcOkxVu3jt8BEDtu2y74xj+7mxVvBS43e5zTp7YD1QtYLBCXz2
	pJ73NzVkbWbDrOkIzWqfiakC+beTe2+62K2aEsIVDGm38XgmR3pZAcQ+WJG5n4XviiQUhZzHVbD
	1Fycy8wluudtn5gDzy0q6K9ckd9y97+9HKWt84TgHAGzZFqBBZ/gLkDTfl4suayLH2LJUE3Uao3
	87bKNrb8EtmvAh3VE+VglpgbEzmVHIGiTTFxUuVaoark5i2CHOTJfPSC1bRJLZQli8qKj7n82BX
	olXUZIxMC/W7aytAkpRWjK4eWAhU8K44s09V6JhgoF+/vjRc/BvEr/E=
X-Received: by 2002:a05:620a:1a08:b0:7c9:55b2:c3a with SMTP id af79cd13be357-7d5ddb1d7fbmr312462685a.11.1751631157112;
        Fri, 04 Jul 2025 05:12:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Eg7B1FvZwpHU9t+neYQcsyfuDsXo/Nr59/Yr3Dx+yEtIQ5oCFC0zImUbON+UT2wj7aHy0A==
X-Received: by 2002:a05:620a:1a08:b0:7c9:55b2:c3a with SMTP id af79cd13be357-7d5ddb1d7fbmr312458085a.11.1751631156676;
        Fri, 04 Jul 2025 05:12:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997de2asm53656745e9.12.2025.07.04.05.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:12:35 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup
Date: Fri,  4 Jul 2025 13:12:14 +0100
Message-ID: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6867c536 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ja3qRCn7lQV6jF_xop4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MyBTYWx0ZWRfX652Sm2733zcH
 /sl/cT2NCiQjmuyQ9pBP6PhbO+uitEMmSO3DnWA3r7fRT4JgfDr8Is6wE/KatbDkmT5W+A2z/d+
 +8K46dAWZeBdACaxMjCyPH8xX797LbF+l+0spVkslvyCiWKrPgN5sjtkBKWWK+LF+5LQws77v+T
 oRQQkEa0PZFGxqmm4YIjOi4Sa9bNJpgnybqrFdPqeAfl/mG6llbvxBWTvjyOFc9t/OEKsvE5d1K
 0TzyBttyQoTB9sVKwRry0BeTCUd9lxnIpXay3R3eURzEq7tm9A9JYVx9wA6451QHhS2/TyO9d/l
 aiffxN0vfAv0qQypM7YK5PPPc3ajYx+azBUtWdsIXksREDWR/oLW+IF7ds20r7cretVoi7rk7zt
 RKKsqtygW+xLgr5/UvmDDJh29OCFa2Na7i7AXHD51CBz8cyTcXt8SFJR+a3avxsneSZDXsSY
X-Proofpoint-GUID: 44KDDsOTfjOHsUuB_v5vKFGDvBQ9d1_x
X-Proofpoint-ORIG-GUID: 44KDDsOTfjOHsUuB_v5vKFGDvBQ9d1_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=682
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040093

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

All these 3 codecs have been duplicating two of the soundwire
functions. Noticed another new driver starting to do the same, its time
to make some helpers so that we do not duplicate these functions.

I have added two helpers of_sdw_find_device_by_node() and
sdw_slave_get_current_bank() in soundwire layer for the codecs to use them.

Changes since v1:
	- updated sdw_slave_get_current_bank do error checks on read

Srinivas Kandagatla (4):
  soundwire: bus: add of_sdw_find_device_by_node helper
  soundwire: bus: add sdw_slave_get_current_bank helper
  ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
  ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper

 drivers/soundwire/bus.c        | 12 ++++++++++++
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
 12 files changed, 43 insertions(+), 73 deletions(-)

-- 
2.49.0

