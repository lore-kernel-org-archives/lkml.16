Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1891FFC56
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743712765; cv=none; b=qJ0xCMQ8g9ipRrGdSH3NV/q5EWE0D+Fj6bpTgxb4ZaooDWJfvQfM/1P2iO9kmyFME+Zaba3Y60YrVxDjGUPCMeIvKuluNB9CSckb2zquGIJeemGsXI6AMkExjw4uoc0Hm1lYi/NMwi8aEZSxaSZnQrRz0zZOOC44wLVGugXIGUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743712765; c=relaxed/simple;
	bh=ZKFPJnkH5cmy2Hcw7v2o0zv/8xKsrpwsfbr6qB8cQMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xop6i8z9qWAWopWma5i9g76LPXvNHCG/kZhcr+bb4p90uYj3RHpMhVbZ4/NfbarCM2LHJIusAHGrQozvaHG47q5JIMnMmX9qp16yQBKCt5uRFdBKvhki3X5YoL0syYC8JGCqbazbRVjI/rlibFKTrU7MRBpP7s4J2foE8cvn3p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMX1CcR7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMX1CcR7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533JhXqM011993
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 20:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ERTqFw99lQe4ymdVVi0XfW
	QaFdEOwt0186MaC7JTYqw=; b=DMX1CcR784DWe0oVKnUl80n8WeDwZlMIcvHE8x
	7PYrnShOnkkj5xfOQfhi2BTV1AUtLDRIYj3RJrVPIcDMubEOiV6d1/zbQrGmsMPG
	MVtU7GYwksWnrdGfHho2YyAbQbNmCQ9IVyqAJj9BRvSsZwhMlG0sngGnJWS+/NWX
	ZuBXbjwrkxwUZ/f8VlgsOFKHqwiZrdxC5Br+1J92FKddqXkAmHLUKw14iE1yGbkN
	8iUK7caBzayOqYZkNg0MYYZ1jR0RbOeCDtr0GQ6WxFqdSzGVnjgejdNrBwctyeST
	bpYVNlXzvPqhp8BXVNGK/zNxGl0cpho8YO69SKIm4y9j3kAg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadx6mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 20:39:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736b5f9279cso1253549b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712760; x=1744317560;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERTqFw99lQe4ymdVVi0XfWQaFdEOwt0186MaC7JTYqw=;
        b=H+CLi9oXBJxdkQWSziTmZ75ndNF4g6+uybqU+ixBJJwhUH8yjMmjEBu+coyhPaznsN
         6GFDN2lIBMXyraahoe2QpfijjwQfAroAa6Wzwx2Uk66JRRvcVzIej7NcXGMguDDiNmgI
         jA99ubtl7aphZ050GYNQKVqOsDSxKnrS+ioJYgeh+pDVjH5QIxotSaUCIouMx9uA6cLP
         1iKiVK3XWKeDHkbzH3LrZxnRgCE5A1YtvV87Oo07wZ9kEHGKh6ZFY8XluQJ/I20oF9do
         vBK6xtzK+5uzAWn0HfUo9IHPZlHyL9uDJ0dusZK/Vu79XciicB8iae9jNU0Z+f49EJaX
         qutQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyWFPt71vK7bqPhD3iPnjapclxigA7Z3Nlh+s3LUxIUhFGI9GUz36dEVeqCGkgHXadpR506cSiE32Bjv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxttodfAgKus9/GW5U1YEjKcIlCqgzDP4zeMPMAxcALIKl0Q5X9
	pRWZpaqvArQdsIN+DTakJI1AVq7fO3Nr1bpaJQwynQffXTm/9kLWx5D7fx4ggeptHNhpud0BttW
	yQZd365wkQPHRhA4J1kPQsJjBqaEKLT5ABcLD5c23AwAu7oFg+N/dSkpYkYKi1tU=
X-Gm-Gg: ASbGnctaRU7cM4Cp8fym5PvRt9m3L/uEvHn2EBbm7/DO0gN5AISDaeKi/b8wBuGwphc
	cOgVrOnTXViDqTpvXmY8sqJn2umJmkXY019tX7KoXXmsqdQx8kq3snBC+m0gRNbhwP+c4g7nF2C
	BEgwBdtrD/3FJQBmgmfiLN8UlG+rKCT0PZDG+RVElvGPvUrVZzqqUO+XB+IfkIb4Ii70xLot7/O
	q2llmk6h4ZcNLjyfWG3vUvBC2qG37B53s0xoyZ883ykiDQ8WCavUmhPtEkjMVkVQUxG9JAleWgn
	IqNL4OtfO/aVwjUSyxvZBVf2CJzBHkZjffH4S0DfZcijHEg/CQkQKkvWvB7rZjjpmfscyZJUk4i
	d4PiM0NQ=
X-Received: by 2002:a05:6a21:7794:b0:1f5:7710:fd18 with SMTP id adf61e73a8af0-2010461cd6emr989747637.17.1743712760217;
        Thu, 03 Apr 2025 13:39:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH30wcg6IUYNPzq+c1OsjGFHZabqoyu1Jtq+nS+/9NjU1pr36JgCCvFMewrTVBT1qWRO67YfQ==
X-Received: by 2002:a05:6a21:7794:b0:1f5:7710:fd18 with SMTP id adf61e73a8af0-2010461cd6emr989725637.17.1743712759884;
        Thu, 03 Apr 2025 13:39:19 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc323839sm1657530a12.30.2025.04.03.13.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:39:19 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Thu, 03 Apr 2025 13:38:24 -0700
Subject: [PATCH] docs: firmware: qcom_scm: Fix kernel-doc warning
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-fix_scm_doc_warn-v1-1-9cd36345db77@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMDx7mcC/x2MQQqAIBAAvyJ7TlCpyL4SIbVutYc0FCqI/p50H
 JiZBzIlpgy9eCDRyZljKKArAbhNYSXJvjAYZRpVKy0Xvl3G3fmI7ppSkJ3ypm1xQTtbKNmRqDj
 /chjf9wMUNOvyYgAAAA==
X-Change-ID: 20250401-fix_scm_doc_warn-80d266cfc9b9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_satyap@quicinc.com, kernel@oss.qualcomm.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743712758; l=1394;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=ZKFPJnkH5cmy2Hcw7v2o0zv/8xKsrpwsfbr6qB8cQMs=;
 b=oHny9g1HrYSo20lV2kB7j8fbRV+XAVRCUM8Yth2gGD0hhpBvA6jEvRkbgMLm+FEh9rXjsO5oC
 /JUlfIso4+FCzIDaQ9E/jYdH/1eCuR4PngmJNDszL4MBZWNjaR9DdDQ
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67eef1f9 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=k3TILi5Bbk-7JZiMJ-QA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: GY7lukYHl8Va6HQ3gDJH_T9SaGDALJJd
X-Proofpoint-GUID: GY7lukYHl8Va6HQ3gDJH_T9SaGDALJJd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030109

Add description for members of qcom_scm_desc struct to avoid:

drivers/firmware/qcom/qcom_scm.h:56: warning: Function parameter or struct
member 'svc' not described in 'qcom_scm_desc'

drivers/firmware/qcom/qcom_scm.h:56: warning: Function parameter or struct
member 'cmd' not described in 'qcom_scm_desc'

drivers/firmware/qcom/qcom_scm.h:56: warning: Function parameter or struct
member 'owner' not described in 'qcom_scm_desc'

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 097369d38b84efbce5d672c4f36cc87373aac24b..3133d826f5fae8d135a8f03758173903a87e718b 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -44,8 +44,11 @@ enum qcom_scm_arg_types {
 
 /**
  * struct qcom_scm_desc
+ * @svc: Service identifier
+ * @cmd: Command identifier
  * @arginfo:	Metadata describing the arguments in args[]
  * @args:	The array of arguments for the secure syscall
+ * @owner: Owner identifier
  */
 struct qcom_scm_desc {
 	u32 svc;

---
base-commit: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
change-id: 20250401-fix_scm_doc_warn-80d266cfc9b9

Best regards,
-- 
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

