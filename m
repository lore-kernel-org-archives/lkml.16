Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA729222561
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716993; cv=none; b=H6iFQhR064khHP4BF+gFWtDFTZzjfI+5I+v+enEpbJgOcvabqAqqkX5mfmRwlt5teGmn5iO+LCx1TmSS7gtSMS7nPgHLZNQ2JI2nyhl3XGzUP/EV+DB2GnzYx3gNKyfbnWgpV0wO6YnvVsQBd7L5BT+QKLX79RYP2kNYjsU0Kic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716993; c=relaxed/simple;
	bh=O7x0B7PsXPJevh+BL6rfGJApjiXJdDSLqfDhsZCX96o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DUSkneZkc8LlB0kiSgqWM1avzfNSgCjlwRIMct6oTjdPHEpR7k/EiBh+FtOHO25LFHpYO0v6sCDcuf0Rk0q7rJAoiXIXV1DPaWWPpKgp3CMilrsEScOolMTv2j4XGYfqij6i5+0LjTxhb9ag2+DLafpFX7JoQfoqgHxrM0xIAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjobSVab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjobSVab"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7KVS5026015
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4/kKfIR6xBOxkE9lm0H0LtbeIPTX/AL/TrO
	0VUBg0Bk=; b=JjobSVabtX4EGJwcKNn5miyV2FrBDJ1rgXzHxzM1yAVc85MHn1I
	hN+FXVNJ52Hvw8sKt8kfWR7fauElBp9gKez7pAlikmc4S3vbxbv/E315hC6qg8Sj
	2dJlJqVcWecWkSYyS/O5tNyUp9jznL47S3cg3VAep7rpGlN2+SN8aTc9CflxVxcN
	YasbW7pl7S0VWAjhwviAa9TTn8J05SdmklMA4eZB+gI4UfKlHJ4lZDkFO07v92Ck
	v03/mKXgjAVFLhJxFfiHLvXZEVZanfJI0JV2ZaoRsZxsT3ipU/NNpnkxq+U4lGY+
	/ODvR/72wyI4xdfs9P5kNJR1AaWRysyKm4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2yam78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:29:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee988153so121217885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749716989; x=1750321789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/kKfIR6xBOxkE9lm0H0LtbeIPTX/AL/TrO0VUBg0Bk=;
        b=i1/2MqlL5ElhqOqVz989JQAvNSsEnIN4NbgxhpbWf7o14IpMHx2aMngr44eT74r24j
         Tdy++4YRYVTL/B7afdhCZSFNI+38Q+qgJWNXKuYLxXOMjJF7XYusif7KB1iSGaW02jeK
         LevKUdbuUrAyQ2ahPtYhUS7AZ25Xxax4BmBXaAm6FHXtvFW0A6WUPfXP8z0Kj9qQ6L25
         i9gb80p8+9BAr7L1muehlZig0280CpHRdWioJxB5H5xs8O0VdBPBzyRraPeCZVIfpQk9
         sxEhrinpgdrQbG/3qFx3pznQ6gzxPWpWGoqt2nNunwZnfpirN1ucSkdLvE628BBi/VQy
         TH3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQFHXcitsIlSBZ85/yi3/QjcDNJNgu4gkmBj+1S9RiHkCCdx/m7J+R4oUL9oGgIZ6m+CRC/f7NgYbfl5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxecwatUMbHVXk7QaPfZipmFKGPcW6jKC5WsPD4jkudH6Zb62GR
	Z8MkiiyygEmzFWbdgZACIpww3lAFl1kUuFE7K9XTavy6K1ZCdqBk4Kjx+pi4Zy0Z1/2HMXbKyUx
	e94dtlpDA41EIWWnc/6OZFSvKQECU69Mw/N2YVrj4RAXrlEWzzKgZB3vyaYqRRZEy4Q4=
X-Gm-Gg: ASbGncurim42Bk3D54+7wFWXyT5j7/T6aWmaiU61AQIZNBtKKA46uN+SUKPYzUAe7DD
	KSX9kRfbzQtzilTvRqMk755+nLPDF+d9GyMBb6i1EREJUhiI8+UNSy/UC08/aCE/241fiCV9t+q
	LCzbeFCU8Mvdw4MXgBkK59l2UJmqLB2lKe1MjrElZGkGCAb0f+r5t9GzXHZrFPe1MNJDCSvpbUM
	+Ye3NomBUQXpkPvrj4Oo546v8zJpcSY5c3M/G9onDZkew6JlrGrKSr1mdR6u2q9DQ0Ohe82c2MX
	pSuC7bLMUn4REs1HYmzYHIppB+Z+l5nkBrWKJex37jgVYv2TjtI/SLwAizibe/CUNSwrPTiwtko
	s
X-Received: by 2002:a05:620a:254f:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7d3a8833b2fmr961433785a.21.1749716989483;
        Thu, 12 Jun 2025 01:29:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0YIQPL7yWdIZPDe+4/PhpHgaQ3NUQnaAcVDSL7xrmvOjCe78h8IeCoSoHcBLcGRhjCtwMgg==
X-Received: by 2002:a05:620a:254f:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7d3a8833b2fmr961431785a.21.1749716989132;
        Thu, 12 Jun 2025 01:29:49 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b4b5afsm1263883f8f.75.2025.06.12.01.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:29:48 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Date: Thu, 12 Jun 2025 10:29:43 +0200
Message-Id: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA2NSBTYWx0ZWRfX0SBZ+57pEc3h
 kPJP3yR5SkK4HmveJbF2CpOiT93CIqZbZtaC8EtHEl09NBR1CF1rDrW7RWZoEh8Rc+rwNMYnjlC
 7WDHc+ldsfL/3Jg3BzOEMwjWTZbaC1FmbbmJk7AeT30zTb329K/jmKEBV4+nIE3kVKaFVdzoWk+
 ZVq/RTQpZMOwtK3REHNTgxgpHUixdDiQHsDI9gxATVlmmN8Rkz+WYcVddFEy9G+Mz2ZP6L29bRc
 gR8YB+nlF8e5TDfWVMBHzLSRFBUpORdDgEpPCcuqGuaui9cW662u9G57qCKGaAS+lLWxudmfYCE
 2odA7culvMidRN3c1MuzANAUtO4S2KHX5xl1JGrNsEhwZDAyzeWE9F7lJKgcbsnGJ4sWSvBNCr5
 gBgMQOYvUI/OQYb4nmgS1tZvxGr78/n72yWLd55AKhG2T5y37soq+10lDgGOd/pbMUqivkez
X-Proofpoint-GUID: _ZXcLzX8PLZPJrQ1ksa2QeTYl8hY77M_
X-Proofpoint-ORIG-GUID: _ZXcLzX8PLZPJrQ1ksa2QeTYl8hY77M_
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684a8ffe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dqxo6Gcs7TcCqA_HyOEA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_06,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=716 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120065

Ensure the IRQ is released before dismantling the ISR handler and
clearing related pointers.

This prevents any possibility of the interrupt triggering after the
handler context has been invalidated.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index b5f2ea879950..d9d62d965bcf 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
+	devm_free_irq(core->dev, core->irq, core);
 	core->ops = NULL;
 }
 
-- 
2.34.1

