Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C92229B783
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027279; cv=none; b=GXOGH26BE6OH1Lp4+0CWl/F8ByUBFXuTkQQjYiu+dbCYpQvceUwY4YuCB1+ZZvWdyyQgay/hEoxlm52O27646q8TbjwSJqkjWQWsr38ehOgR5JKswI9QQcdNzFlOesjFShsmozXt79pAO5zGyZ9Q05rNmEzZXrsed8NODG7Rqvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027279; c=relaxed/simple;
	bh=D0xORoC11ef1b8XnmpFCtI0ADFqZVD+IG8XxNMK2QjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cC1yWAuKXrUSYlB6UA2ifSCpfXeNvORBDisBLmvcMWuOiOV5xnJKrL5LQSZQWx8DpCD+56bPsLt/VSD6x0XV+9qe8cPPZHb9oofbrPqdH5vHlmDzD7RZ52QG19kOUt2QGmXulpaUzx8/0Q82zB534J42Pe8eryPQK0i8KZEtLjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e60nxV3W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e60nxV3W"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFe1Br014592
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8EV5IZ/cv+QD0prKkLqN1dGzXsThgsP17A63Jaenuh0=; b=e60nxV3WqIfbHkSz
	gipZ1mw1a+xmAqnpCw8h17wynkLygzlHgJi/vpGkJ1RG7b13XK7sV5CXsG7yjen/
	nlvOjrurBR1FCUMzE88B94r9fftQba8sO2h9HpGaDth7dq1eiahOsIqCT+ebUVpw
	aBZ73skugPKFK7WwPp3CEy62iJQkgdzfyVXZoOZEkdlFaOvMaYPIjMZguZoO4Fqm
	NzDF0Rsen0vWhi45LOUolFgsWCIR7j0yfl9Fj0Ns+/CxY1RQTkGktIgUDC70p3/r
	pGo9fbgAezzXErTRrdk252FQRaD7eseQsOPZ8kKAnRtQX8yDmbzNcc/Q1ZD0dy8j
	SGuU2g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4b3c7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:07:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e3b03cd64so1563895ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027276; x=1748632076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EV5IZ/cv+QD0prKkLqN1dGzXsThgsP17A63Jaenuh0=;
        b=I8s2kx9ie2+EM6uixE0NsbjgmPMtek7+Eiq86vi8kRpsihIbK8fh5q5EzDzwuEcsQJ
         NxwfsU6VHYojqTtzFAdAyqd5Br7cgLnTv5N5IxGHC4fvdZhllIUKsSkeYjPmFXJieV4C
         Mv54HpP+F2zA8HcY/L2w3jxpkm3z+Lpr8xJC/ShNqHbrsRcWMbzi74ur4I0FNfTVB19b
         xsgMDALnZzhfbBtiMGBHEDDx3YFYhIw7SYYpCYZUPheuZ6/f8B6pfGAlT3PKcfi/7gfW
         wZz03t8KDlL1AyKwkIx38cZfd0z1C7Q6iubtsG9p04SiFb+OYeaPYGemJ8eOZjyjU8/h
         OeBw==
X-Forwarded-Encrypted: i=1; AJvYcCU33iCHci6SsiL2RB44XiYVr1R95OisGnVMpN4EL/UnCknao8x+ELPwpUkT11rAS74rEcrcgwHKw4pLsls=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkBqOaHI9ZaD2hCVdLyU5DUbTFyaaiq04MNLilEaIlnJl82gk8
	88sn2Y3XOb6srONXZxOrm2x9vW07S30psqBBBpR/HbdhTYIvhN12PpJYhaUbxB4mNnv6njZ/DsA
	b2zE2X8M6JozaR7k+jk+8aA8d2SHXpSg7nQiECxLD9w7FVwG6Aadprr3dWXVcV+VyD1c=
X-Gm-Gg: ASbGncv8KwX39E+gPBL/i15XEf0pcMbkuwvkNoiZdDRImi0tiuMEuxWLgMeh4dIL/0s
	WbwdBSJEYA7y3SSpdTtlYZm8l71MDSVaFpiLpdXq1oLQjgbR94ilIQcdAj8ZNvk+7oF4uqCFJlb
	M8VWlNNn07ARuux5rflFZu/+YBH2xXmrO53Kwy1Cjf+BVcjS9SjAqloKYpZ8AlJIFqj8a2Z9wuT
	oyl9mdsaLZ7WeFf42OX/45gruQAe7Tp9gLIP/elRVojdoPdFepY7qeKjH0yf+NEuei+9uWSDjLi
	tM+7aH5NZz86D0M5q53//t4Hpnv0ZfutdmqJGT3B9OKhXPvIH2zb8JVjCsUr2/hnyVAnUgD8roa
	DHmI=
X-Received: by 2002:a17:903:2988:b0:224:c46:d167 with SMTP id d9443c01a7336-23414f6e2bemr8194665ad.16.1748027276355;
        Fri, 23 May 2025 12:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt70NeKTNYAk3drZ2nNdndV1zNORhUf309UeydAVRG81OvnP1i/EMYHqZv7xctkGrD4Rbsiw==
X-Received: by 2002:a17:903:2988:b0:224:c46:d167 with SMTP id d9443c01a7336-23414f6e2bemr8194335ad.16.1748027275995;
        Fri, 23 May 2025 12:07:55 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97886sm126652165ad.146.2025.05.23.12.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:07:55 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 23 May 2025 12:07:42 -0700
Subject: [PATCH v7 3/3] firmware: qcom_scm: Check for waitq state in
 wait_for_wq_completion()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-multi_waitq_scm-v7-3-5b51b60ed396@oss.qualcomm.com>
References: <20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com>
In-Reply-To: <20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748027270; l=956;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=D0xORoC11ef1b8XnmpFCtI0ADFqZVD+IG8XxNMK2QjE=;
 b=yd/3KdrfWRyyINpbCMDlshSQ8pxWotIQv8EtjntZ329GjkV1bES6yLijTcQ8uMNFkBuWjm50O
 O6XQ+tjD5fbDSbtR7nC9bfkJfNbhhNM6rLBYxPOUeuAKrtkpLvTj1dr
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE3NCBTYWx0ZWRfXzq+8SSXtE1Gw
 7XNwWFKu6z4LhRWeg9ZTzO9wYOZXpe6nLtw8D0d8h6MmkBng5fyWi9zHM8C3wQ35Ujuab7ZxryL
 7KOGjL5nlD6ANQEMqAQ3GX899Vj6I1DhY+5qSAuQDFQEnkAZaos7cIo7rC/tr7npTOTa6gscyN2
 iIRi4Tdi1u9UCH3r67BwGomNDqXgbnENCrA8gvDDQc7gAm8DNgyclrIM3I/kCvxxnJtZfzJl/6X
 /3cK3msg2DNenUSxznpBcavBQAXRFaXNxfUfrRkZ7+px+on7zt+/0F2ya/EnHbS4y2Zz8s5wjEc
 7zFSKxIqb9yvKltfU9ocOsB9KN1RA/a/T60SIFx2ciQ7NfDD/EZPM0xOPUZogvzqWf7DfSQP9oI
 CyZsSiJ7zzA1j2oWpAGZqSyiQx2rU4e3vebUZy6LfjjhyntLPoToumEuxGWtEdX1v0QI67ca
X-Proofpoint-GUID: oo596yjFaDmff8vOBNDE0-jIS6e2ILey
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=6830c78d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=X2av7gLQQKfhQ01XcpoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: oo596yjFaDmff8vOBNDE0-jIS6e2ILey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=896 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230174

Modify wait_for_wq_completion() to check if task is in idle state using
wait_for_completion_state().

This allows for detecting when waitq contexts are in idle state and
propagates it to __scm_smc_do(), which is beneficial when task is idle
and waiting for a kick to accept new requests.

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index c2682e9bde58b6f132af0c1bc2e194db0e401e3b..b8ce02099584c4a87095cdc2dd688cd28bd2dae3 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2189,7 +2189,7 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
-	wait_for_completion(wq);
+	wait_for_completion_state(wq, TASK_IDLE);
 
 	return 0;
 }

-- 
2.34.1

