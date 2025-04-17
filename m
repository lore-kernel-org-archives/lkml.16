Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B694C205E00
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744930666; cv=none; b=Z3caGnJO9+xS3jxvLxy60lcS8Adc2A8X3JiTMZXIro2hNOZJmk0Vytx+774gRvTODuIa2s+nNqou2rshF1Ru2QEd64/PevGf8YFmBEEMQPUGYYCa3SbrIzorgh8VVT1wce6cCG6YJzzSPhz3dYZEb0onMc87UcIfKWKV61/I1HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744930666; c=relaxed/simple;
	bh=Va89dEro4Kkmtw7GfOlPLj+32qukwzSrdSj5vzEHd0g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hynu92mXQ4biHe6M2IshfElsURQhB5dx9qhuhcLQT8Un/AH1SE5Q4fcpXtamLEjX8avzPKeS21tdpvjneP8nh0Wz63gcfucgBArkdvI5wlk3Oy8teU2pO9c8FAWAMiaqsfTpYFo3EWbr/kgLSZhXfe0tW5O/g/1AHoXqZH+WWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpad8Zkx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpad8Zkx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClPYa008166
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQ0AapFO2yhPVMDOZaxgS8v5NOii/sUa9QwZcbvEKKk=; b=fpad8Zkxw42D9J01
	Lp5PLjxxqf5lULuggiPbI0MfNVrmp0jEGN+0uxTh+/NkWruxd7+jHFzLnskQMcn7
	m+sQbV+yPVT8XkmYYQlHWjMnm4RUShnOqeJIPxOKNgHMDl5TuvSnMk+VJ4QZCNZT
	YGAtWhexjyt7PxjtxduWikStvu1jZzeDvhOXCtSDI+i8EMd+Pn9BJkY1bFzvtQ8S
	6kKfkF1OKr6Ziegne6qJP0dc/9MI+sNIngUyZXn7b4I2uEixBwBHONWmJ6ZhAP6i
	tPxrLsTnoSwzOUFHTZREzCRarse8F5mco/dQEW3kZgsCPQ8JrEB8vP+D6K4vP2lZ
	fypbzg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk89g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:57:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7394792f83cso993263b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930663; x=1745535463;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQ0AapFO2yhPVMDOZaxgS8v5NOii/sUa9QwZcbvEKKk=;
        b=XrXv1NdsIaTzJURxByYu6usx+BUtRKXGRZspFwwEyXi7guBXIcjpINt4YKWhuLdNZ3
         eCXZ2u62K2+aaLQHoSieg7yekuYIt7SddmSTAKxAmdmB8/AMfGuiNhWN3NlmKHFctD63
         TCXQnHgsEZkUSU2XBSUY2i151mDyI0c0qjZkXrtwCCHwd3Kv8ecyhgFh5O7XqHsA5117
         Sced6ICZs9+LQrag0EoCMW+/T5WGKEid4FAIHEsehyjN38+XVv2sOGgAgTyIVPovOrDK
         zauy/e0gxo2X0WJaZIMt6mO1Ao6A6Mj3/GSl0XdbgjdSSu2QC+0NDz67AmnHV+kByZIy
         IesA==
X-Gm-Message-State: AOJu0Yxaj2d6gl8uYgzW5bl2vqMCHOXBy8Nk/PaNO0K/e7CtPG60iDul
	iF9AhABnyv/uazmLgcGDBigCQ9/NPqEjYbxrjHckT/7ThK0QlKWGgRm55h+HOiW2kfCJFO4XrSJ
	CeKb+0qtCrrVCv6bYiviwIxhlbiHaSVu/6jBBXquK0a82jL9nDtQVokIKDaRJx0w=
X-Gm-Gg: ASbGncsLbEA1rargVrlUs8Wmg8ml1hq4OW7GAxmvQtWgXWANyWAw9kjBqDPO0RJ+WJ5
	MpojHiZOCY75j0Ao2UVpswalNHCpbSVKiPWK0qo7PuHOn1opiaXYx78DR7JL1CdEI4f+2+7RVM3
	q0TfiidhueWOcv8zZoWaNHhLTgKhMfBsvG9PuwmzxAMu5H87YzIllc80uWufExpkUY+DyfdysrW
	l+0EJlGfC7ZKSW7Mtzar8WNjEZLXJqmllT0JOKy+6/XhWTw0F+Nb82VevgRl9lm+mO2yut0SgCi
	h9ejofJq97Fmil6p9mLHa1Zysja3ehIbeviLSAEUah1w3nRy
X-Received: by 2002:a05:6a00:1495:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-73dc15d3539mr806994b3a.20.1744930662691;
        Thu, 17 Apr 2025 15:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnBlUcOaye28+dYXVT5e8hcezLBg2+PLcejjCu36v0S/nGdgKehCY5UEe/2PNm1Uh5qKd8eA==
X-Received: by 2002:a05:6a00:1495:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-73dc15d3539mr806963b3a.20.1744930662149;
        Thu, 17 Apr 2025 15:57:42 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:41 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, wcn36xx@lists.infradead.org,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        Aleksandr Loktionov <aleksandr.loktionov@intel.com>
In-Reply-To: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
References: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
Subject: Re: [PATCH ath-next 0/4] wifi: ath: Don't use %pK through printk
Message-Id: <174493066126.1347382.345644321134226340.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=68018767 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=0rtzQTkjgJck7GMvs3kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: M7imlLkjY4iIrsD_FIaciEsU5PCv5wf1
X-Proofpoint-ORIG-GUID: M7imlLkjY4iIrsD_FIaciEsU5PCv5wf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=630 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169


On Thu, 17 Apr 2025 15:19:06 +0200, Thomas Weißschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath10k: Don't use %pK through printk
      commit: 8add2b8d72722b60c749b559db2a2aef6c9def68
[2/4] wifi: ath11k: Don't use %pK through printk
      commit: 27c57c84922ef1dc72a2ea3a5427cdbaadc9be44
[3/4] wifi: ath12k: Don't use %pK through printk
      commit: 7e7f948c7d14ab5a6cfb26146a0d4734781903e3
[4/4] wifi: wcn36xx: Don't use %pK through printk
      commit: 75f90ba47b2cda7de7a7bc1d099172516f6f96fa

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

