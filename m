Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F323413212A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 06:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738651223; cv=none; b=FUKpPfrHgXCtYczcc9KbjnCSkcic1HGcD3iUvUtNo/NUm0S2NAPgK85ShlCHbhmVR/NXkxxVDzCiC1Fu3FCY6Boz9hox/TZK0W5PpAFHhiGr+H12UrcukCiSzZLKvGV61IH5ool5fch495IXi/q9CdqwS3+0m9BvpXx16rzNTVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738651223; c=relaxed/simple;
	bh=6JmVod4KEM9IOGsNSGuuU6VPZ2DYE1bNS/GyGUawSc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V8FWd0Z6qa2AIB5RZuNXIXUSYZ1NUu80oNCf0KUoUBHHClFZVFHfWlON1+MlzsB6YG1L2mEjnYPeJhXLtGZQFs4znK1yu/J4fj1DtCx7zmr2/089ZWndToTWX7Y37VvVDRkatpiiESed82PHziXFwlTNjbwoq3aST5pdZvkAoz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=XcATzx6v; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="XcATzx6v"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5145mB0r018213;
	Tue, 4 Feb 2025 06:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ndHd7fqKZ836SjKywQTYbp5/lAneBePLzgwDlcjZu
	XE=; b=XcATzx6vKRBFBGERYFBSuoZIFQm3KKqI+YukK1u3DNj8UUzqy5nkbrhBr
	cClif0BJr1+axakLlWgP2R8J1LpgM6d2X5SldP2wYd7/qJmI5dA4quC5MzhhfApn
	5Qd5NeeFBT4Jt5d6czCcYzB5H+JeIXx2UCT8g+IkGK5NgOn5Br8i67rVOgG/EsHQ
	kscK70zcp6BNWoX4WU1ezeECxl+ji5A3v9NJXkaCjvOlxpsjMcGV6BURZrvd1SUk
	vk+uA1frjPZtHiUnp4QvNR2KSZlUdPD5ixuUEW/itrJ3qwGt6uKL5FBIEDKOZ6qG
	aAsUDYbfb/AS47SBRol28MEvD8P/Q==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44k0mtbaj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 06:40:10 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5144NcI2006508;
	Tue, 4 Feb 2025 06:40:09 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hyeka2ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 06:40:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5146e3GV23003620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 06:40:03 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADFB420082;
	Tue,  4 Feb 2025 06:40:03 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2BE420043;
	Tue,  4 Feb 2025 06:40:01 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.13.87])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 06:40:01 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: maddy@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, disgoel@linux.ibm.com,
        hbathini@linux.ibm.com, adubey@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        aboorvad@linux.ibm.com
Subject: [PATCH v2 1/3] powerpc/time: Export boot_tb and log initial timebase at boot
Date: Tue,  4 Feb 2025 12:09:46 +0530
Message-ID: <20250204063948.643852-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rCFzP46PU-pD3XSiYJrfoXNuHNKzWaZZ
X-Proofpoint-GUID: rCFzP46PU-pD3XSiYJrfoXNuHNKzWaZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040051

From: Aboorva Devarajan <aboorvad@linux.ibm.com>

- Export `boot_tb` for external use, this is useful in perf vpa-dtl
  interface, where `boot_tb` can be used to convert raw timebase
  values to it's relative boot timestamp.

- Log the initial timebase at `time_init` as it is a useful
  information which can be referred to as needed.

Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/include/asm/time.h | 1 +
 arch/powerpc/kernel/time.c      | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 9bdd8080299b..b6fc5df01d53 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -23,6 +23,7 @@ extern u64 decrementer_max;
 extern unsigned long tb_ticks_per_jiffy;
 extern unsigned long tb_ticks_per_usec;
 extern unsigned long tb_ticks_per_sec;
+extern u64 boot_tb;
 extern struct clock_event_device decrementer_clockevent;
 extern u64 decrementer_max;
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 0727332ad86f..6e8548f0e48f 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -137,7 +137,8 @@ EXPORT_SYMBOL_GPL(rtc_lock);
 
 static u64 tb_to_ns_scale __read_mostly;
 static unsigned tb_to_ns_shift __read_mostly;
-static u64 boot_tb __read_mostly;
+u64 boot_tb __read_mostly;
+EXPORT_SYMBOL_GPL(boot_tb);
 
 extern struct timezone sys_tz;
 static long timezone_offset;
@@ -943,6 +944,7 @@ void __init time_init(void)
 	tb_to_ns_shift = shift;
 	/* Save the current timebase to pretty up CONFIG_PRINTK_TIME */
 	boot_tb = get_tb();
+	pr_debug("%s: timebase at boot: %llu\n", __func__, (unsigned long long)boot_tb);
 
 	/* If platform provided a timezone (pmac), we correct the time */
 	if (timezone_offset) {
-- 
2.43.0

