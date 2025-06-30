Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402071E5B7E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289161; cv=none; b=etGRLveK2i3ZHu1l55LEVpvjrcFd31lgD/QnZhWt3SN/CV2QscNTRKjOBsp/ROCc+aOkl6X/b5qDDK4mQqOuyGP2BpFL+n337ecvkq0VB0j3x9tXnlXQMaCPNOResSGGxLasysxW+mkfI3cm+BznPOcPltx56nw11L45hNkfmv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289161; c=relaxed/simple;
	bh=Meg9l3ayF5IvOv4pDuSbD3RBC3/cwLs++Z+iuXJ5Boo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mdx3yIukq1Si424cnsPLzAzMN5jUyiQr/85IQCEpo3hejqqlEas/WWD2naQ4WGzlRD0Oh1AC4/+Q+6DZYXfFqXnBg0GWWtZ2IhBYNQ+8zZ1dzYrj68Lm49kbdZVHWWKoVeLZ7KgqxQsd9REp+SJJ9/GpiCb8XKP68W58sRq7AsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=drTedeE8; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="drTedeE8"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UCgd8j029725;
	Mon, 30 Jun 2025 13:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=cpN50fbiZkztKbrct/ZR+xxj0zr8FKIfX/kjYvOgH
	78=; b=drTedeE8kJDHZZR5lspSXyUVG0RFgrNCp31RPKh/5QNXGCEhoozyOR86u
	45cIHNRinvmyaTzrO7TAVnj5ECb5CBxhrT5/BR11wDutCPBkQDjsHg3TyXvOLVGv
	hdW+dvIekdql59HHwPyIIIWR7kfG0NUsilzWT+Nn9pHfBspk2jDXdoi7ovHegH73
	+0NjeKFv/hOgPiabnc+vOP9y1T7XcI6kWutECQnPK5/eY+KiRWhxbsTWhJhBwc9+
	6EqVzsy2Wb1KWbI1g/WDxBOzEoM+Kn6zjD0b0om46gnXkX/Thv4K8GLGtBmJ72uJ
	cvR9W75Sgqnpd9FPHoB4d8R2LOMbw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7wr9h7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 13:12:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAZRF9006830;
	Mon, 30 Jun 2025 13:12:32 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jvxm5sb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 13:12:32 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55UDCVd132572016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 13:12:31 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 097B62004D;
	Mon, 30 Jun 2025 13:12:31 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCFAF20040;
	Mon, 30 Jun 2025 13:12:30 +0000 (GMT)
Received: from tuxmaker.lnxne.boe (unknown [9.152.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Jun 2025 13:12:30 +0000 (GMT)
From: Heiko Carstens <hca@linux.ibm.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] objtool: Add missing endian conversion to read_annotate()
Date: Mon, 30 Jun 2025 15:12:30 +0200
Message-ID: <20250630131230.4130185-1-hca@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=E/PNpbdl c=1 sm=1 tr=0 ts=68628d41 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=iPpOYdr31iFlP0GwivAA:9
X-Proofpoint-GUID: mgw67tHKMUzaH_38VrjxED0dqjBSNiVg
X-Proofpoint-ORIG-GUID: mgw67tHKMUzaH_38VrjxED0dqjBSNiVg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEwNSBTYWx0ZWRfXxI7m4gB/d2vu LtJxrQWP+U6E/0gP1Vae1NQSNKJtob0fSwykpuo7mfWJDpkIK/aDxinFEgy/RGFAD7cgrKJbu6P C8vWlSj68jmUg6RcVRbWTeIb43b8xY8baJBMVC2/6D4SgDr30Rsd59O5bN6X/S6m281OtAphX8e
 NeA0wJmQVbV27L9D7d+BoHgmwImwksyMFiGe4opBnuhBpUAIzZ5Xr90Ri+o1pEAWd7uBxlTEvyW eNT2PXnlGGAO5OPWheQ5OpU49BWLqH9vsxUfNypC2dyI6hVNsuMPlFgx7Odzmy0oSq6p0QM6w2b B4V098Q8bV2Bii3kAkxNt2GA9EVstoplJIbTIqllyhvoRSv+CbFSu2xZwG5L40h6I6dcFfLp3f6
 qzFunlFQAgfpAtT8Hh3+AGlHw1kRAPrV9W0NhZMfPyxwfS+Fi2+t3cWpvW0pQrKu/3oy9q9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300105

Trying to compile an x86 kernel on big endian results in this error:

net/ipv4/netfilter/iptable_nat.o: warning: objtool: iptable_nat_table_init+0x150: Unknown annotation type: 50331648
make[5]: *** [scripts/Makefile.build:287: net/ipv4/netfilter/iptable_nat.o] Error 255

Reason is a missing endian conversion in read_annotate().
Add the missing conversion to fix this.

Fixes: 2116b349e29a ("objtool: Generic annotation infrastructure")
Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index f23bdda737aa..d967ac001498 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2318,6 +2318,7 @@ static int read_annotate(struct objtool_file *file,
 
 	for_each_reloc(sec->rsec, reloc) {
 		type = *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4);
+		type = bswap_if_needed(file->elf, type);
 
 		offset = reloc->sym->offset + reloc_addend(reloc);
 		insn = find_insn(file, reloc->sym->sec, offset);
-- 
2.48.1

