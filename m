Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7884325178F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979726; cv=none; b=poE2trq0ny55mzai4pLCUlGr/LgsDj2fZW36PyVqzn8gX+29B3bumx5Gc5b0MtNqfvJudtRN2O3/+ybe8sWC2DBRGC+4/O73C+Xq43z+a1F2HkhR+I09LK6ONQkRFQqtmBPgK3cHg7TFj4Giigp7EKs77MaQ4mZetlZtsfR71+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979726; c=relaxed/simple;
	bh=G+7wF9yd6vovIyrnA2PHzfa82ugGuBWenVpkTDcIQy0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mxrIV9OBucg5AvdGdYYawb+5G6CTPhJ12Xj8mmCs2EfTohwcUphzcShXWDuQZ8w8enkopuupHFSbcHB01nKdE+8N1YfUEf6O0g+P3WVrzLtcHm4J4X/EO2ErhRXZ1ROTvEDZLPZajGUeDk7NLdU3XkJIwPrUG3UcIcx2+wITHUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYmdYbH0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYmdYbH0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QIb7dk031185
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m0YwMxO+jUeFCXEvL4KpijnvGsNmfzPaS3I2nEc0Qic=; b=pYmdYbH0YFfXTLk8
	Rr9gC0YnAwbd0ABqw452uMM9fvyiE5nHtWW381MHIYdL8ZRgTlvCMr/ASLT3k5cG
	zd6dys+dPH5VB83sjh8w3hduoEqGlQP0g53GktULcVS9ohrmlX3GWxBfWmcztRCS
	i4acamPjPT3Ga9m6z6vHXuKOvOdrBo8h9fO7eO1TQZqXxLGPu8fsssOeFyKvVl0H
	GtRctpuy2+lBlPgYXpZ8rdDQ0dhCo5MlRequCmqwPTGzrKcxYkT8xRAwfv5rsHk3
	1RpgydHe8wNBlf2V+COjV3CKx9oONwzZd3SzJ/mgjvjboHj2e8iVCk5juqVLtA/V
	WYvHdg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b44r1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-236725af87fso19093795ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979711; x=1751584511;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0YwMxO+jUeFCXEvL4KpijnvGsNmfzPaS3I2nEc0Qic=;
        b=iDcolnoEPUVv7DxCrCCl80b0OZ1paYwh8h2PGYWL6Qi7KRGB71FggoKCOIw86auMgW
         UPpFJY+uJxJmXUPwuC0pEQBg+kdaGETZy5w1vkaHOPYjfofzDkhvuy2PrTLljNUEhL3E
         3x72cAkNIGtThkcMnw/SvLQlHZwfHYjszkt0ZOWBx84rwbLwYV8ooHP3uKjMkWyTyMME
         fQg+BRInzSlaa94nMQEn0WYvBcOmOjLlTyiVnXE6HRTmeu1IdbPpZyGSV4jFCfh4CJ+H
         bGh4e3B875hdIaQgHjeiMebbduj9xaHJ4BKULasG5k5zkjzGT8ipD+NKzKL5G1zNjilt
         Lq0w==
X-Forwarded-Encrypted: i=1; AJvYcCW87TKyFslfxKlOQjo0G9Vr3hx492pumM5PnraQiKwXvWrJjBsh5/Nn3ZOluGy1LMV8g9AD4VxpGGbpKeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHdlscvmWJYiZw+qTUMf5VprpCB+sGy4gkNTi8md0WT/zg2zzs
	Ph+ejVvi0naOum6ZIyomu0txH9reluQ2bLQsb7PzLTpvZKaFLJ0NgwfUX5RPPQfsmG4KoD4YsUA
	/lJUVVJ0JOZNF732JhfYoX6gIUXEiJJCMbgad4+ECX2ZlVRXCZPnV/sMPFTzZPB0I4yc=
X-Gm-Gg: ASbGncsjwG/3KtOSOZB6LmQxbq9VpMC9DBLCCyV3bxXWUdR55DRF7cgR7jkvZBb3j1L
	7QVfamBM5j4BgMEMwmGyMXBZ0EjRTmFj21hRRgiZjj2lm5eftoo4PqhqOT1J87PVUiklhmoaIul
	kdGLFNAlYmxuD82PQB+DZxrvp/GN1xqDyIP5Etl/kXP0WmckdOKLscEro/CpWD8RJyqhWQ/03Ff
	oP9v9r4I3jHod4C/o/1POsnKVeRNTaKB019Z2SEGRQAMYg9gDfPYkAwOMPzN2/uLI8bwMfntTu+
	0pGfJcU2mCeOgxuQQexpCi+cNVYsW30z1+vfy88uvs7JH4B+jox4YcxhDMI=
X-Received: by 2002:a17:902:ce8d:b0:236:7079:fafd with SMTP id d9443c01a7336-23ac46527ccmr17456595ad.36.1750979711546;
        Thu, 26 Jun 2025 16:15:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtxZAT9RsuczoF4qvzPiB5OMo2NIectyuJIvyMQ1qsmF4ZT12KS1G8XG4t/QvX9V4JDG5Znw==
X-Received: by 2002:a17:902:ce8d:b0:236:7079:fafd with SMTP id d9443c01a7336-23ac46527ccmr17456035ad.36.1750979711051;
        Thu, 26 Jun 2025 16:15:11 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:10 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250522013444.1301330-1-miaoqing.pan@oss.qualcomm.com>
References: <20250522013444.1301330-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k: support usercase-specific
 firmware overrides
Message-Id: <175097971004.153431.2672795252438495643.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfXw0vmS8s5JR+x
 y9hVJNuc5eVmnoR+g/f2lB68pQ1BAiRAIW1EF1HBOiTKtQTBTJUsMj/SzyLL46cAMcHmaxETGhX
 trB86WejwJ992cuTt/aK8IeBgjM62Hfx0tIVhEmxFwUZkCNbMnJmb1in1bIjp1nVFfLpWnzJudG
 UV93R/pal7X8lK95lmnclZ8YMLUP9GosHfUcuiCCgWD2yyVAC5Fg0GKHMos6WOHw1of/rPvp27W
 3NmXjgYyCPboxywX/XtkZQkpvbAkUiXtfVGhwVoAncvLrdN/Ib0XjbFJBhXpR1mkOixoyX4fx68
 GiuN1/tG+W9xFvs+N2r7kosJYZlY7d7DYVn5HYqWCCy4yAU+Qh4hXT58lbLPPcwm/G200IzyOwy
 iJxaCoWiq6UqzapG6fmC99yU/sGFlCPpE4WqwxpHA9ciIdqsKvf+UMQRzzFgZfL9VmQApaXv
X-Proofpoint-ORIG-GUID: 9yRFUm4QguGro8rnh9o6ZkawOK425SiI
X-Proofpoint-GUID: 9yRFUm4QguGro8rnh9o6ZkawOK425SiI
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685dd48c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ZHLDmf7C8hvfDcYlofMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=844 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260200


On Thu, 22 May 2025 09:34:42 +0800, Miaoqing Pan wrote:
> Introduce 'firmware-name' property to allow end-users and/or integrators to
> decide which usecase-specific firmware to run on the WCN6855.
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> 
> Miaoqing Pan (2):
>   dt-bindings: net: wireless: ath11k-pci: describe firmware-name
>     property
>   wifi: ath11k: support usercase-specific firmware overrides
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: net: wireless: ath11k-pci: describe firmware-name property
      commit: 02dcb6921b8827782e51e26593d4a2866576ab63
[2/2] wifi: ath11k: support usercase-specific firmware overrides
      commit: edbbc647c4f36e8a6375d07ecb5aad8e8b90de5e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

