Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2373E28B4FC
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444874; cv=none; b=pW+xvUjIEGWDHnseTSqQEXpcV7w45PDMPBW7BXn9HWxrr01dtH9R9pzIq4RzygnYsYyYqzQCmNS4QOxP83hcH6WwARiSMaO4I6SVrPe4IG091a4PYimdgMW/ZGCM180iwMc4J49EkxLxOZREwQfgjD8ML4p6wdTknlQJ73tMigo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444874; c=relaxed/simple;
	bh=rwxIBSU4wpJK4Rss2lAtcFVb6oUwF93lFV0DEUIIzEo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jPlHtPd63i1wcn96gDRBxvIv6kEycS6Qf978d5pI3Vt00l1ljNfA7dxrMaM1Fj4lOH4lTBg26hhy98updDnZD0BJqqaEDVOmcSvymU6pq1btsrOKdB11je6sWLlgcD9B7wbvc2yc+o+sxrR9vXaxG6TEGD//5MXeZy+bur7DPgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdoO4htN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdoO4htN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SBU1fK024736
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TqvCyLn/KtAm6zKua0D07MhryvAsfRaF1xH
	groEq9u4=; b=EdoO4htNLpdp60f+0yDBQajbK9FnSRPeZxZpRBG+GZXCzu3ThcN
	3IFgCE6S1UZl4PNfIh2o/tGnEKlNBhmJt2s/nMWhXLCi5xXLPpuvnicrTpda5wRD
	f2DXh/IFA0YFhuJyOC/mqzBeuMGv3yEAahEFXi8Bwfw9MOW49bmMywQo3BZMG0/V
	3iE+s/9UD6Pqk5SaetiBoIbItDyE4rPqLL33ob+uSMHseEN1TJ2Lt5W4Q3i9Wh7U
	6gmpP/DO3Kv0+VVceA2iqV+SK2g7MeD5CuA+7P7qCdK3EZ/L5/Yxs8724P+TBk+U
	udLKEmrLTEK6jUhhLsdzrQe/CkFMxx5/hpQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjtp49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:07:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7377139d8b1so3776511b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748444871; x=1749049671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqvCyLn/KtAm6zKua0D07MhryvAsfRaF1xHgroEq9u4=;
        b=gzOSqxjjHWxDtLqm38j7Fm43Ocs9KuVZIA9EXS/cK8Pk/VqJ7X/5McJVvzWpDlytGK
         0XWNN6Wa+guZk2ehKg67g8gqWGHxTIUbQ+X9M+9Sk5WVZKiTw+xpMuJa0j0z4EXJYbTQ
         FlFycnCsOI3zAGBvBnQSDOKPOtudSCPLC28WTkZxesD5y7Y/6xGpU/YBwZwP9YFNGtm2
         NZm52F9yajwc+JAVg1DY/bUVjRbaMpnwlNnQVOsRJQry29XGYP+fXp5naFrA9U8s76Py
         84iI72xl+mOTPIp29oru2dfY1F7xMTi7O/2WGw/p+APv8XIXKt31jDnksQkQPj5xCzeb
         ZKEw==
X-Forwarded-Encrypted: i=1; AJvYcCWbV3rdJEgKEjYnUxVn1snhbCp6AeD5NFwiQsOU84x7GCLbrgpPdpaD5HMCrdIp2Z1sIqddZrXxo+KjuA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbvsHzkqpxCdnTw2E07AT5IOcMqx+kWsEwt/aFjzj6U6voZ52G
	6D9N985qpvlaTlhFpcPCCVncnEJu+1wWfo2B2AfytVxW6w4yPlJ90UPV2JV6gzWR7F4J19vAY9C
	Nctf+elUOc2cG41sc1jUtMSE1c6ubkfUF2q6kb7PNJEsxcOnOCJARbLYzq+CN/Hrc00s=
X-Gm-Gg: ASbGncvYkSL7xZY4GpgbKIUYGXuLp4xoH0RjFvSZJTcN4hw24O4Q+fslZYMM5rZeVKn
	KZqy2xI/RUztn62T24ICiTjot7bqwFc2OdmeBf7MAZKw4pnhucmqFIytfgaswAXAraa90GQNW3g
	z+xVoAMznBBkJPS3zQHhF6V+lojkgIawQJ8EyfOuBPiwgRNwdgYJbgFZHVWHGNnzBxFPttnqxCj
	MJu0EK+HwZVmgF/qPx4gHI9c/lJfoyxFZx+TNbVX+tCvO2fNl8NK5PUrrE6vqG5kRdOh4npUcBt
	srFIBJffo4oa3TnakiraFUQ+eoljq6YQ9eY/wjHgRc6JgazG
X-Received: by 2002:a05:6a00:3d15:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-745fe083538mr29011112b3a.18.1748444871083;
        Wed, 28 May 2025 08:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd3GjaWRf2ZUrRS+emGlm7BSCdg5uZ2Cw2RIKxyTINEtl0qgcmEHjC5BF9Immjzf3MZcpg4w==
X-Received: by 2002:a05:6a00:3d15:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-745fe083538mr29011057b3a.18.1748444870643;
        Wed, 28 May 2025 08:07:50 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e340fbb8sm1373211b3a.106.2025.05.28.08.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:07:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v1 0/1] ASoC: qcom: sc8280xp: Assign backend ops for multi codec dai links 
Date: Wed, 28 May 2025 20:37:15 +0530
Message-Id: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=683726c8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=TweMsTatiWGVkviqWuEA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: pRnFtVSHQ0zpW74or2JOL4FZp4ng0iWe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEzMCBTYWx0ZWRfX4BQ/IyuKNNjN
 OEOPcQNXgND+LFBVsC41qe0mYA1VA14FkvWNuRRHgL/O7aEQtZ62K4N6S1rZkBhDArtqy/lIJWL
 9vpnhHnRTZ8RmeeNzHh/der5lqlRNPpg5/1O5JsBFd2zciSODlu1XKvncIBsg3odOUSVdpai3Xt
 kxQouaQSoRZiN0diLsIidWPzrINvY+KZPGxeCrwThF16m2KKGNtM+Cxi9cdtiSZej2vwjlhbeas
 Ww1cXqlBFQGR3chPs3ETotNHssEc0495Zg9TU2QaqA4ZGtv3P+D4pU+GbXf0HtYG7VSzYrNp27K
 OTnG3h7v9aymg3/FBKRML8+09xJNL+Zi5d4g7CLyXmn10aOE5A/SMAAoh40qUadXGkcOMukd9VM
 EN5LkBIslH16e1NmaeEhe3Doqek/HUmbMU58GrLbd9YLfQBcMqBytmyMyR09C7aN1NRshqU2
X-Proofpoint-GUID: pRnFtVSHQ0zpW74or2JOL4FZp4ng0iWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=735 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280130

In the existing implementation, the link->ops assignment is
conditioned on link->no_pcm being set, which generally happens
when a platform entry is present. However, in scenarios where
there is no platform but multiple codecs in the DAI link,
backend operations (link->ops) must still be assigned to ensure
correct codec settings.

Mohammad Rafi Shaik (1):
  ASoC: qcom: sc8280xp: Assign backend ops for multi codec dai links

 sound/soc/qcom/sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
-- 
2.34.1

