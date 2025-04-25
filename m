Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE8C297A5B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624894; cv=none; b=ATCmoqjmCq5hUfAMQo1gdduG06DtWUXAelW59VaXkgmtjqam8eEnv0bc/wObu0He+3phcXUsZBxpK8Y9ep/GMsnRrHBN7vhjrBR2XWJRaXLkcW32N9tIy2SiFfBKqc2EmKnk646AWu5W/VjSqImmTWp8IaTOoEjGMiVCTpiRPbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624894; c=relaxed/simple;
	bh=gwwTPMyq05pjTkKOQrslTYp8aVG/FQQzoFZPwY0uOew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lRVGSlS8rSIaHzUJFqoBasH3mQKz8KDPwsx/G3gigKgTtc+fBsZtj4zepPeCe8LkJ7/aPUiqq9zPQPjcNW0CR66yUSq927TuXOCkO0v4Sy9lMfbWDLliCOUT9yuiSCIiT54iteBJpkwP/BLR35B5MYMP0HbG/IvpO5g1TnRYxf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmJTjqsn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmJTjqsn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJr1O011041
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ql/GedPHsogfCaw+Of5MFjkN2fS6Wzdt5YLHuFucyK8=; b=UmJTjqsn91dMrfym
	30yGQBWukHXKlcxOU9BiHipRfva700WZk/Hvl6CPEx4GdQ4eYLwMbMRDb1jHumH3
	zUxcHrgeGfPjaqV58BkwqxTOaMbw+9Z/C30Hktl1zK+9c7ro79bzCT+L5k6oHMD/
	XNeAh0GfL8olQw3XRFFtYWy04m+hTs2n8WzcC+JPpUzCw1xlrfc9jeIwLpEJyG6a
	5PqoPFeBFDrTeK9oZFhFgFApWygPWt8phjD16nLsDbmSbVVlIerKLPSKqEnrpO1u
	q7ITnReEhspvGa0YZnCckLU5qQoATxmXbKJ26BvSlXNxRmyaMOrAj+GnbWox60Ow
	0yA8rg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0jpy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7395095a505so2100201b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745624891; x=1746229691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ql/GedPHsogfCaw+Of5MFjkN2fS6Wzdt5YLHuFucyK8=;
        b=pd0r6PViN6Npbqt1c699rBvr9CaQsk/i1Q8WC8mEBSzJyqjU1brQX0iepAEhSTy4dQ
         zlWcC/baKk8MCGoNIU+4k2n6Esn1e2mesz0mN5ZFN0XlhA4H9NXO6klvXCopgIOGIczy
         rPeUoZShN0hGVp8vbDinoBVIFRaQXbTN3mvv5DWSotxoRL2xJIGuxxOzDdvyYW8nadmi
         zywUAypHf4wlVV7+r4r5P7vvOZ2X/Dv6UJkSX5h4oKSMYMk9Iebla4fkPNJDJ/yVVNrB
         fd2YnSFRnasWRulD2padYFLT6Wai765qq/elpaRlERvLf1hSQSpyK9RptUZ1QmtDSN3X
         lhNA==
X-Forwarded-Encrypted: i=1; AJvYcCXKA70XbneqPYeugtcX2amcFSW7s4AME1M+nRGLT4qcMFYxY42k6MJ15ZGU3SyKZFI05k2EuBBTRqgyss8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8i8zUUTh2UhtvqR+nDrobu0suyb2fkB1e2X6UxX0JortpNiNj
	5Nh/enSePnewXLYJi2h2YK2ZJaQggF67VxlfXT9Y1HA0UX5LyUIbQlAuDTLy1X/PbltiChFy88a
	cXrNyi6tue27jr4R494EEuA3vFdUcefATSRqgrt75MvvQ6jFp9xczqZMNoPT4cupjU4PJn4Y=
X-Gm-Gg: ASbGncsRUIdQ2idrzxJTse04Ah4RFHgnoNt4ejEefwkfrT6RAFAYc5JcnpEf00N/xDr
	ELf8zpTo2tBEls7Ov0YJ7/s4wRFzAj5kazSJumHvmlK0VzgyQhoCtUI3G84N5Nm5sFM9XFCQRfV
	FUhSR7ceoKNiK0SFY9QbA4OmdqyHP/Od7oVqCK+rUNIKF9v7sZZkMnvPpMomgzBWsGSavk+6uTi
	6QNFJtZNmbWoeEA0dxVqGfNGzLeZc3266oWEuliAQ/BnyRxY07IcvomZphEDhO3NsRjBQ+egKum
	a05Gth9HutXG7dAvJ6FqKn0UWVFP5fDgb7c+eqPME31CrLdID501rBcc1gLvVibPZtR0ffWWIl/
	JHtM=
X-Received: by 2002:a05:6a00:2e08:b0:73e:1e24:5a4e with SMTP id d2e1a72fcca58-73ff73a63bamr1864848b3a.24.1745624890998;
        Fri, 25 Apr 2025 16:48:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHezxpYHXCCMetb617T7Rci53xT0wLk2loNMf3snuVi5zRli+LkvdJ3GxYxD64Vb1hRLfTu4w==
X-Received: by 2002:a05:6a00:2e08:b0:73e:1e24:5a4e with SMTP id d2e1a72fcca58-73ff73a63bamr1864820b3a.24.1745624890666;
        Fri, 25 Apr 2025 16:48:10 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a308sm3868948b3a.136.2025.04.25.16.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 16:48:10 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 16:48:03 -0700
Subject: [PATCH v6 3/3] firmware: qcom_scm: Check for waitq state in
 wait_for_wq_completion()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-multi_waitq_scm-v6-3-cba8ca5a6d03@oss.qualcomm.com>
References: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
In-Reply-To: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745624885; l=956;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=gwwTPMyq05pjTkKOQrslTYp8aVG/FQQzoFZPwY0uOew=;
 b=0CAPlycTtrHQjH6dpC9Sdnb9RW1CnD6mYUNayot61XtWt57KYcFiLU7eYQ6KnMoHBBYP18axg
 e2GNFHyEQhwDP6GZwlGtLFvVF7BGPj7iGY9+Jq776+O1DnCXYXdrONp
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-GUID: onuzu49xmoNK5dnroFAc15Nn0MALp-Cs
X-Proofpoint-ORIG-GUID: onuzu49xmoNK5dnroFAc15Nn0MALp-Cs
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680c1f3c cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=X2av7gLQQKfhQ01XcpoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE3MiBTYWx0ZWRfX7N7kzGJrW0y6 d8FeygITWCydtGl9+uzvSXaEvdaRbuHOPOY1Co8FB2a/fqAAs7Jo2gYBB+HxnRfy/z3GRAhWe5N +wVifLr6RabNV19oUDVH//dITv+i66QauJEQpfRIeAKvvPV0UZZhaKX3rhbXpOlDrMYfs2FnlJV
 s1Kc3wULGYJ5OkQljJ1gaaCyDuQDa0zU9PI7DXwT5MtlZR8zoDnb6MliJZlXhcF1JehI1ZgZQdn GFVdWaTABCtPEXkrreCsx5ykWuhw/oVZ+L8IoNGTR2tLyL2ZrYp8TEGljq52+iCkaD/6EVs52jd A7AxzGhdBIZiGaotMW3mWyK8suqWr72uw2OOq3dlylwRr0ecJRGO9B6gbajwmG9LqPx49cusvFK
 PMr9P7B2aLTc94DL2H04JP2bqdj1Xv0lEVZPpfsaIMQRHt/puVCzsWvv4k+r4vZtP/et+MCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=892 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250172

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
index 9f8db13ef1ce14cc324fa9f0abf5c6a97ceb7b8b..a03c18fadd9c6ca6ab5fcd5e386834dcc3663eb8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2192,7 +2192,7 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
-	wait_for_completion(wq);
+	wait_for_completion_state(wq, TASK_IDLE);
 
 	return 0;
 }

-- 
2.34.1

