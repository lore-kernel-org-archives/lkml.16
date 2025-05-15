Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE6B219E93
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324716; cv=none; b=HkVbAVu6Cnob1O4su1ZeDK9tYVoJnJQbYprpDc6NSJEeRIf9ZlcRV4+sg+74MKz1EAHux7f4gDswVAYsZVbqrIcbDiSZ1fn89Bq85l8zrFHZ9hiqfA/Wvw3wLf+LoQKGhU2EK/HnOOQ9kNz1gi1vpBQB5qAhdasFikd66jFRSew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324716; c=relaxed/simple;
	bh=S5g6mdPPiEjNLTg64c71ov/RAjI93cjjD5LZ25Od4KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mtlSs1yx819mS/9TvsryGiuZTqNHO3pVTN9SvwcqZlOsZjvl/WiTTOcdf/Jyk5YJ3QySRN2fZR/HiT5RCdoFYhcso2/d/Pz/1MKCs9c++AuPL7OPz4uSjSnofjTuH9YAm5RWhg/BkbOZLWc+JdSTdAnLD+vcsJNqzUKLpOtbHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tGb0Gmhg; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tGb0Gmhg"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FCg1gG016398;
	Thu, 15 May 2025 15:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=cXG8eCF5r/sXPTCsv
	liDu8dy3K68BqnjQtx1eybwJTE=; b=tGb0GmhghVxT3dTgXMhDrg03uS2OyVV4J
	svwZBpmH1nMgS5SdRkywTso7Z2RqwEHiw8fcd99zJ5gKNx7p7RFGF0njFbkGSNtY
	lwu0WAoVkXCN/dvsrPJs2mjUAMUWsDBIasaQxEN406EhZOHqhV5w6la/CsI+QfGd
	b669Nh+6/c7HGPF9mP0T+waoTUTXIJ3U5vN5k0hFSWz0D52JVH8CcqT7b2IgIZks
	Qj9AHVYttnBgVVczyGYnMU+/eugD8yhFkEloqEYPy4Xa1DMdChlSdT+U9iAO6D1n
	2/D9PPUhmcXIuJijyyhLAeEgEGIdIytMxl+37SKZlT36YNbL6tNnw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nd4gt8t1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:58:22 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FE7at0026947;
	Thu, 15 May 2025 15:58:21 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfpk2nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:58:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54FFwIdl41222636
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 15:58:18 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4006220071;
	Thu, 15 May 2025 15:58:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA7842006A;
	Thu, 15 May 2025 15:58:17 +0000 (GMT)
Received: from heavy.ibm.com (unknown [9.111.40.6])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 May 2025 15:58:17 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 1/3] scripts/gdb/symbols: factor out get_vmlinux()
Date: Thu, 15 May 2025 17:52:11 +0200
Message-ID: <20250515155811.114392-2-iii@linux.ibm.com>
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
X-Proofpoint-GUID: b0u8MmdQJrspvg4Y_OhhX0acYHw8IFn1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfX9RFs29gjx2LM e0Tyu34RdUmm/jA07VBDewphbyhHIAT9RnAeva0vns6PFTkMdYey1/7OhTrUHhJ175RSxcqYr2I ffCFEwIbHGrui2j+DAqPS8m3i/2CkQ+5zDSRpeBI0Ru3pOy5niR8whZReDouAKfw6pgXapXp+P4
 gEErFreRTXZ6BSZrSKQ/4qZ7IS5W9QRzzGzKHxRfoa7UqerlrTYTnkm1L6bMreCaw4oRApc8o0k WTim4p06H2XySOcGA0c6ulp5uKzBgcOkXeI+u2Vs9i/BJHRu0h8DH28/Jx7C/0C8EcSzS+GYqpW POPi8gS0meVclXTcKbPEVPqXeLCbvYhcNhDfr9uMCpZA/m97+ZSXvo9ZjfoZl5dknpSLVEp5Qcm
 9HEmALASkRBEOFAx+yTfgatIyhokSLnxOs5I3oSRuOg8G7UTHdi4GO9Egha32V/2EpFt9n1Q
X-Proofpoint-ORIG-GUID: b0u8MmdQJrspvg4Y_OhhX0acYHw8IFn1
X-Authority-Analysis: v=2.4 cv=OsNPyz/t c=1 sm=1 tr=0 ts=68260f1e cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=hEpxwc8ILFXnKlI9gXIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=898 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150155

Move the code that determines the current vmlinux file into a separate
function. It will be useful later in order to analyze the kernel image
in physical memory during s390 early boot.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 scripts/gdb/linux/symbols.py | 6 +-----
 scripts/gdb/linux/utils.py   | 9 +++++++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
index b255177301e9..25c4627c60e5 100644
--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -178,11 +178,7 @@ lx-symbols command."""
                 saved_states.append({'breakpoint': bp, 'enabled': bp.enabled})
 
         # drop all current symbols and reload vmlinux
-        orig_vmlinux = 'vmlinux'
-        for obj in gdb.objfiles():
-            if (obj.filename.endswith('vmlinux') or
-                obj.filename.endswith('vmlinux.debug')):
-                orig_vmlinux = obj.filename
+        orig_vmlinux = utils.get_vmlinux()
         gdb.execute("symbol-file", to_string=True)
         kerneloffset = get_kerneloffset()
         if kerneloffset is None:
diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.py
index 03ebdccf5f69..fc94ff6a6d72 100644
--- a/scripts/gdb/linux/utils.py
+++ b/scripts/gdb/linux/utils.py
@@ -251,3 +251,12 @@ def parse_vmcore(s):
     else:
         kerneloffset = int(match.group(1), 16)
     return VmCore(kerneloffset=kerneloffset)
+
+
+def get_vmlinux():
+    vmlinux = 'vmlinux'
+    for obj in gdb.objfiles():
+        if (obj.filename.endswith('vmlinux') or
+            obj.filename.endswith('vmlinux.debug')):
+            vmlinux = obj.filename
+    return vmlinux
-- 
2.49.0

