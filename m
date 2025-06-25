Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0B62877F5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866176; cv=none; b=nnIlw8QAOSGcTMtpF1d338oYU24ZteFO/nrBgtTlrs6Wfl+P2KM2We7iy1uqrCQrux/CfPb96YMux5vydp2rbDvwLqukNu3teBQqCCrkSTvO1Yt39xWihxXnbjeWO3/JrK5SbT2K2bwbN9XHebnQg22Y1pQCQ73M48sGNwX/ikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866176; c=relaxed/simple;
	bh=Wn9xVclOO6c9XrNys31e6vPNP3zOlEHbzpKAygisWZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/t9bFypVCf6BgktOzG4mT+RIZ9IXdQWDKRWXnsy1kxR5mgJLCvHqbBgU7fIVTx3SSUbqW6SPPv1nRIwdULEyxb8qjm3LwHZ7+XvRWD2ZvdxIta8cC6L2M+BeV0hs8gghXxm/9Oi7VYiJ4lt/891PCRw2gZsx7ye5IAo3F0t3CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rYBYKX7n; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rYBYKX7n"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9MgFp006910;
	Wed, 25 Jun 2025 15:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=SPaHW3Wr6lTghYYNQ
	8GXHafq6cSyf1hkO4/UHD44/us=; b=rYBYKX7nrTAbZppTV3EZV0/6JKK8Rceky
	BnkXGKVMhbnl26Z0rqOtPM7XdRzsiC7b0Zb+7WJjJvpzyMjjV5oOzcSVTW8IEFoJ
	pp9y4e7rd+PkvmW/8nFnBysw+MwCWXjkKhetp0SRJvFu8ApZsRKE4YfIZUhL16Tw
	cQ5W8dUC82GNxa0peVjgpKdeZrrRKbaXfNqdz+2VFM5tfcK+f4DutLHA0+8UL0wt
	YjmeHTuYCBwL0xqnXk96BP3aLN5LUneGQaf3hTf/GzLC1Q42H3y4tpPCEfRb3/02
	L/gcdTiTgIP6+01IREn+hW3trdmhMnvWS3ETpYdGAOKu0jYuMbEWg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmf382tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 15:42:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PEPkIa002467;
	Wed, 25 Jun 2025 15:42:45 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e8jm9ycn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 15:42:45 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PFgfkg23527990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 15:42:41 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F0BC20043;
	Wed, 25 Jun 2025 15:42:41 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8BF420040;
	Wed, 25 Jun 2025 15:42:40 +0000 (GMT)
Received: from heavy.ibm.com (unknown [9.87.147.188])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 15:42:40 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>
Cc: linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/2] scripts/gdb/symbols: make lx-symbols skip the s390 decompressor
Date: Wed, 25 Jun 2025 17:36:52 +0200
Message-ID: <20250625154220.75300-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625154220.75300-1-iii@linux.ibm.com>
References: <20250625154220.75300-1-iii@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=M5FNKzws c=1 sm=1 tr=0 ts=685c18f9 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=pW92laOuXE_AZismrzkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDExMiBTYWx0ZWRfX/eD6vtc+hBVn lDzoXy0+cU/X6aGm+d6JvVK0wL6MJcVfJ62aLV+zX9aDZ5kxcZUBu7tnO7UVym970oJDwy+91IR C5ybP5ywr9Zgtqac1iJcWuSeu0Zc3xQL7qUiv6yAaVHt9bh8U2Rc3sKKXLC9u1eLJBBz0Zh/mbp
 BVzbmA/YCMsUpI6j4GjC1JOUFiqHzj0lYXVEONGUQL4Ag8kUtwXt6Ti9uBb7rV75XENFY0k9PSE LG3f1L8fw7geYtYfBw5gRU/QvG9LRZZkQ3YfAQrreH5hlVxR+Eou5RWro057xI2aWpDuCH2IW3z WWwkgqAzB4iHbm2YHWEIbJPr0O38/Y0B3LFqg4VOaqaLUT9sRXAo2YmtCbkq4AtGOt06WCQBhWW
 5e3/pUMEvnlCIBym4Ildjnyg9T6pFFsKR9V1XyMs8VcDr/lKUNVkUuKdDMeuDuqag4DnQ0x+
X-Proofpoint-GUID: sqVWwh7JFh5hcdI87WTfH_OKgvBtMmJa
X-Proofpoint-ORIG-GUID: sqVWwh7JFh5hcdI87WTfH_OKgvBtMmJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 mlxscore=0 mlxlogscore=957 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250112

When one starts QEMU with the -S flag and attaches GDB, the kernel is
not yet loaded, and the current instruction is an entry point to the
decompressor. In case the intention is to debug the early kernel boot,
and not the decompressor, e.g., put a breakpoint on some kernel
function and see all the invocations, one has to skip the decompressor.

There are many ways to do this, and so far people wrote private scripts
or memorized certain command sequences.

Make it work out of the box like this:

    $ gdb -ex 'target remote :6812' -ex 'source vmlinux-gdb.py' vmlinux
    Remote debugging using :6812
    0x0000000000010000 in ?? ()
    (gdb) lx-symbols
    loading vmlinux
    (gdb) x/i $pc
    => 0x3ffe0100000 <startup_continue>:    lghi    %r2,0

Implement this by reading the address of the jump_to_kernel() function
from the lowcore, and step until DAT is turned on.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 scripts/gdb/linux/symbols.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
index 2332bd8eddf1..6edb99221675 100644
--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -84,6 +84,30 @@ def get_kerneloffset():
     return None
 
 
+def is_in_s390_decompressor():
+    # DAT is always off in decompressor. Use this as an indicator.
+    # Note that in the kernel, DAT can be off during kexec() or restart.
+    # Accept this imprecision in order to avoid complicating things.
+    # It is unlikely that someone will run lx-symbols at these points.
+    pswm = int(gdb.parse_and_eval("$pswm"))
+    return (pswm & 0x0400000000000000) == 0
+
+
+def skip_decompressor():
+    if utils.is_target_arch("s390"):
+        if is_in_s390_decompressor():
+            # The address of the jump_to_kernel function is statically placed
+            # into svc_old_psw.addr (see ipl_data.c); read it from there. DAT
+            # is off, so we do not need to care about lowcore relocation.
+            svc_old_pswa = 0x148
+            jump_to_kernel = int(gdb.parse_and_eval("*(unsigned long long *)" +
+                                                    hex(svc_old_pswa)))
+            gdb.execute("tbreak *" + hex(jump_to_kernel))
+            gdb.execute("continue")
+            while is_in_s390_decompressor():
+                gdb.execute("stepi")
+
+
 class LxSymbols(gdb.Command):
     """(Re-)load symbols of Linux kernel and currently loaded modules.
 
@@ -204,6 +228,8 @@ lx-symbols command."""
             saved_state['breakpoint'].enabled = saved_state['enabled']
 
     def invoke(self, arg, from_tty):
+        skip_decompressor()
+
         self.module_paths = [os.path.abspath(os.path.expanduser(p))
                              for p in arg.split()]
         self.module_paths.append(os.getcwd())
-- 
2.49.0

