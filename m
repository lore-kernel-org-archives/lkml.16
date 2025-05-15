Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A1721B910
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324710; cv=none; b=eDEneR5khmD/av1eKY1g4H3ylAc2uWD8yHLQReDhGoU35emIrFIFoP+QvEMFzW13CE63MFNaEroKQny89rNOESQH9qkQXquwQKVvnAUBowD0bL2AhM0Fp8K4sVJezZp6PQagMpO5fzLdndWb1YyDKpqtpcrb3uFsn2/D2x4Se/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324710; c=relaxed/simple;
	bh=kSKMm/FXtlzTRSCHJVngzV2OL0Pc+dDJL7txRsufWog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=reeoDgg2TF/24xjXp9JHA5Mi7tXbVagNfssiavt/ZGFds/aAnNjd5VsDeJCghXzH6NU5eJ1bzk6xph+QfFQE6Ox8MNNYIoE5XrUFl+Yp4tONceIVEZyEtO2O2PkQD3NE9m485zLZoanZZSzUO/+rOAAwYFtD+O6wp97WNJzA0/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oSm1j8ED; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oSm1j8ED"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FDnB0g032364;
	Thu, 15 May 2025 15:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=5pmcKHTdpYl4PuFpd
	P3fj1feUngFXB25e/AW53SWL6I=; b=oSm1j8EDhZEHtGzNqYbjttKqnrqEqJM1x
	Vmd923fvECedo4cpviWDBHa0BRCqBgX5n0XocwvgH6SqykcDG1GEQoQ6GSjy62Mz
	p0wYOGWfoLF4q44vZPG9yCU/Hx9nQR/xkCmKPe6uXxGGb+3viEDwKEYygjMtfgwW
	+5FHq/6e0MaovdZGAw1pkuzGNOVueZZiI9CVmaTcyrarEM3TPCMNgxgp8yCppxFc
	MIscPa1DpCrqnrGUVGZFuT1JF4EUjOPN80GQPLkiwj+Volu2QjaqbSdw6fCdkcrm
	yxXM97A0efdmYHJHZ21VTIeEKzOD7hfGtcMxTLxj8HcegSDN2HI6g==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nhg30qdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:58:23 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEKaE0015498;
	Thu, 15 May 2025 15:58:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfq326u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:58:22 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54FFwIP941222638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 15:58:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D203120073;
	Thu, 15 May 2025 15:58:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 574742006A;
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
Subject: [PATCH 2/3] scripts/gdb/symbols: factor out pagination_off()
Date: Thu, 15 May 2025 17:52:12 +0200
Message-ID: <20250515155811.114392-3-iii@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Cf0I5Krl c=1 sm=1 tr=0 ts=68260f1f cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=CQlH1tSRAcpKiUbNx1MA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfX6KrQnU9flpzT Yc0voG6r8Oo0/Pxg9ULk/jIOucJ8QnpF+aPWQ6Mx55/NzwoBm0F2XJtl0o9rirl8WxNPAqX4m5s NW9PWyYK8A1oTwTtalWe/7/3gSRt4cPR8nM4GF6Hf17ZqQgu/YwhK3M5w5YjJU+7bd7mlAm/Jw/
 /m8SrCrmYJuf64020gyi9seI5uc5e9rtjIzI8/45IVoswHkemNs9QuFCvR6OS2IZPsSkAN5nY8l AUEHUiCUSgU02qlSClvAzgCyOVcezbkMigoMfBes4+5RXBhrWl1U4sOWXMalk50LRhb0Ied2f9K zmERXeooOS9dx40tFCNJXdTlipVhm6njCWDS4O/dJn66rMpnINqQXKnfYvsqmG7KB5ml666BQDw
 bVLI8O1aikgCshEuSEpjcaVOV1OAt0jzp8701/odvjbTur9DzoN0lK5Sy01MqrLnRrDJcQ+3
X-Proofpoint-GUID: rhyJD-s3I1hpssDGwGvB5-lpWUxTpv0J
X-Proofpoint-ORIG-GUID: rhyJD-s3I1hpssDGwGvB5-lpWUxTpv0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=758
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150155

Move the code that turns off pagination into a separate function. It
will be useful later in order to prevent hangs when loading symbols for
kernel image in physical memory during s390 early boot.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 scripts/gdb/linux/symbols.py | 20 +++++++-------------
 scripts/gdb/linux/utils.py   | 11 +++++++++++
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
index 25c4627c60e5..0c7af712c44c 100644
--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -38,19 +38,13 @@ if hasattr(gdb, 'Breakpoint'):
             # Disable pagination while reporting symbol (re-)loading.
             # The console input is blocked in this context so that we would
             # get stuck waiting for the user to acknowledge paged output.
-            show_pagination = gdb.execute("show pagination", to_string=True)
-            pagination = show_pagination.endswith("on.\n")
-            gdb.execute("set pagination off")
-
-            if module_name in cmd.loaded_modules:
-                gdb.write("refreshing all symbols to reload module "
-                          "'{0}'\n".format(module_name))
-                cmd.load_all_symbols()
-            else:
-                cmd.load_module_symbols(module)
-
-            # restore pagination state
-            gdb.execute("set pagination %s" % ("on" if pagination else "off"))
+            with utils.pagination_off():
+                if module_name in cmd.loaded_modules:
+                    gdb.write("refreshing all symbols to reload module "
+                              "'{0}'\n".format(module_name))
+                    cmd.load_all_symbols()
+                else:
+                    cmd.load_module_symbols(module)
 
             return False
 
diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.py
index fc94ff6a6d72..dc379ab11af0 100644
--- a/scripts/gdb/linux/utils.py
+++ b/scripts/gdb/linux/utils.py
@@ -260,3 +260,14 @@ def get_vmlinux():
             obj.filename.endswith('vmlinux.debug')):
             vmlinux = obj.filename
     return vmlinux
+
+
+@contextlib.contextmanager
+def pagination_off():
+    show_pagination = gdb.execute("show pagination", to_string=True)
+    pagination = show_pagination.endswith("on.\n")
+    gdb.execute("set pagination off")
+    try:
+        yield
+    finally:
+        gdb.execute("set pagination %s" % ("on" if pagination else "off"))
-- 
2.49.0

