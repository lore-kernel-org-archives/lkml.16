Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B57215198
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324726; cv=none; b=sRzoFu3Y1yovr1ncF02fLFVr20FAs7HNzdtyYmu0CBlLr8tJ0nzCDNDAf1Lw7EhDTKiXst1Pp86mAIvx9yzcYgYWhbUkOeRuuz4PweXlFb676OaW0yk8j+Jjx9z/3QG+vcDsys7F9PIYXiArnyckKoffdva+v+/rYq0DjqHFbis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324726; c=relaxed/simple;
	bh=5CHoizMumOdskfRaR8+rWOrOUJnCoJGJXmzAc9In1v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrKbBJzc0EBeJ+DkH117IKqstkyjp6ya+j3XqRDAbHt9eKMHji2ZNvQjmAlxMUSrBdsCeFbHaSKwj66nAyb/Q6Rc4RCauK/5iUONVZeWp9MEqIaiP6K2227i6AYf1BgT/w2sVRuBkcmOzJMiC3d4Z7Ag7/36+0OE/zVGbAl7udA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=q2hewEgT; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="q2hewEgT"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FCg08s016376;
	Thu, 15 May 2025 15:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=dNygolg3EASfG78a7
	N6xl4X4pbzgFYRxyhCa8HZzzrM=; b=q2hewEgTk3NrfILYmINXSomjf34Ksn0mW
	FSet/6TJDiBw/SkjJT87NhCNQLl2FCz7ki6IDNnEl/C3gP7oe2VSW95aDso4ZQDE
	vfA3ttfn4Qzf8x9ENHZNa0Dw0j+NDuH9+GRGgrGxF4dqyMVZ1k5xBkQr6tIwIRYa
	hHKxO2vO3nIwPt7Q7JSN+cQhnSajPFHL5wIXvT5eFecxUOaVsz9qWOVd+YKgDUQ+
	g5p91N9HD6FNOUsJzlm9YPfi1vpNDYENs2X6hP1nqY4fUtZxMmZQN1WlEnUEicPR
	G5m9Ynrw1BbkHhFXeOlSHasmp5nYfogZSgK6f//SiANuIkfz6TveQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nd4gt8t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:58:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FE0POe024288;
	Thu, 15 May 2025 15:58:23 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfsb34e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:58:23 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54FFwJk057934096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 15:58:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E67720071;
	Thu, 15 May 2025 15:58:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E907E2006A;
	Thu, 15 May 2025 15:58:18 +0000 (GMT)
Received: from heavy.ibm.com (unknown [9.111.40.6])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 May 2025 15:58:18 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 3/3] scripts/gdb/symbols: determine KASLR offset on s390 during early boot
Date: Thu, 15 May 2025 17:52:13 +0200
Message-ID: <20250515155811.114392-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515155811.114392-1-iii@linux.ibm.com>
References: <20250515155811.114392-1-iii@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JxVtF6MuqiyAsiF86_jXQtSuV93jDlsl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfXxQ3J+KpYAcBU e9aymZsSwaPXTxMC01Xw5QgC41POeHPPyAPKW8cvGaSRO45B4EDIQDbf86mOiTrUoiRH4Rj5jo8 HXofRsiGmN8hk9cWHb+ui/9XIpEZyVJjteCIEWRcPHoWffZCLUca+fzy1rLQX1IbEBR3Sfl3cFU
 Gee5i8/kQ7Mj2K0z+2Vl6gSGHPCYe7p81PfCq16EFfpJM763H9HFQqX6oEztIxlgiuY3mUE51TB mbldYS4W/diXW8TGTji5lUeuIlcB2IIDLIb9vHDqckek8JrLT7zMEGzmufwYrc/Bf2TSICEJyvV 5eTwVyhOevNL1oyWbHPG06cx5Ae/0yxKg5GdaJDj5OkG3VGmQ+zmSxME6mATGJTbqg1Y7iKNrwd
 1ZRKqmLqiXbQJB3JpMVyft3ERhKNq09dtyeApBCPsGUt7gbrGtOlzzJlPJJO8YX1hRgl8sHR
X-Proofpoint-ORIG-GUID: JxVtF6MuqiyAsiF86_jXQtSuV93jDlsl
X-Authority-Analysis: v=2.4 cv=OsNPyz/t c=1 sm=1 tr=0 ts=68260f20 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=Y1BJ8SPxlSKVlgg0ul0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150155

Using lx-symbols during s390 early boot fails with:

    Error occurred in Python: 'utf-8' codec can't decode byte 0xcb in position 0: invalid continuation byte

The reason is that s390 decompressor's startup_kernel() does not create
vmcoreinfo note, and sets vmcore_info to kernel's physical base. This
confuses get_vmcore_s390().

Fix by handling this special case. Extract vm_layout.kaslr_offset from
the kernel image in physical memory, which is placed there by the
decompressor using the __bootdata_preserved mechanism, and generate
a synthetic vmcoreinfo note from it.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 scripts/gdb/linux/symbols.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
index 0c7af712c44c..2332bd8eddf1 100644
--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -54,6 +54,18 @@ def get_vmcore_s390():
         vmcore_info = 0x0e0c
         paddr_vmcoreinfo_note = gdb.parse_and_eval("*(unsigned long long *)" +
                                                    hex(vmcore_info))
+        if paddr_vmcoreinfo_note == 0 or paddr_vmcoreinfo_note & 1:
+            # In the early boot case, extract vm_layout.kaslr_offset from the
+            # vmlinux image in physical memory.
+            if paddr_vmcoreinfo_note == 0:
+                kaslr_offset_phys = 0
+            else:
+                kaslr_offset_phys = paddr_vmcoreinfo_note - 1
+            with utils.pagination_off():
+                gdb.execute("symbol-file {0} -o {1}".format(
+                    utils.get_vmlinux(), hex(kaslr_offset_phys)))
+            kaslr_offset = gdb.parse_and_eval("vm_layout.kaslr_offset")
+            return "KERNELOFFSET=" + hex(kaslr_offset)[2:]
         inferior = gdb.selected_inferior()
         elf_note = inferior.read_memory(paddr_vmcoreinfo_note, 12)
         n_namesz, n_descsz, n_type = struct.unpack(">III", elf_note)
-- 
2.49.0

