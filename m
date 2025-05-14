Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF04274FD9
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229780; cv=none; b=jxZSJV1TBXkGYnr+i5h59baBaAGsXR1Rs6IavPtr8u+W5Bz+QgMUc3+q+XQ7LEcsOJeEYUM3oMdm8XtihyGcJvd0jNuUY4UrayzwfDoi05ctpPHr3/qPDnc6DG2I9hRh/uIWyt0vRODaAblKSJ8WX/WV6XeJGUA4MF1Z5ag+mCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229780; c=relaxed/simple;
	bh=yMgoMTH3h37N0QI1Jl75rwUN+zTne9g/7CDb67cjf10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g4c7VwpiDTB1GCz3VRvYGfKiF9C7LE+W2824CnWeHnOrfai0PNRSwv9HfEnZNsB1LKqjw3ODc/nMILgk9NUE9tdkv2TW37WXrNaL+orIJeCBaCgHq6dpml/xJqc0xfZ/p3eSZLExUxTvP1x0EC1klotKQt4rowfyYsyfquvlfrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Gt1E/nRb; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Gt1E/nRb"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E6GS7A017030;
	Wed, 14 May 2025 13:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=YfTUAH1ofCS4VsMDlN4kr7Gt1uhktSk0r2YXiiHdo
	oo=; b=Gt1E/nRbl4+C/uE+mm9nztkmJGNAVpuVaB9/J8pJDIQTCZVZeJc/oF4in
	3FYpHiuAkW1AVJDvaOAAyuo75fDOGU+s+ew2swVRFZnfhPc0iCdsYzboQ6Ah2Kw6
	hL9UfA8dTwwu8RdaNar7x7rGQ5EtiAFIokszFUstNIVtvxOHV3FMHWSGACL5CuNI
	b11UjlRsn8M8kJENGgqhdLCMsgAVQJQExno7IzjBIgDhh8v+kkkACfY0mrKLfNhN
	PcLpazQBrFalfbcu9HjLTH+CXxPU3PuyQMV1fjfOOFSFAiRk3Cn4gRxt1JPCyxvY
	NikWYVHQNIUdJi/jz1ZpNKq54Fq8Q==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbq8mhxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:35:27 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54EDXYj3015498;
	Wed, 14 May 2025 13:35:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfpvdhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:35:26 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54EDZOJW32703132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 13:35:24 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BD5120128;
	Wed, 14 May 2025 13:35:24 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8960B20127;
	Wed, 14 May 2025 13:35:24 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 14 May 2025 13:35:24 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55390)
	id 3768EE08A7; Wed, 14 May 2025 15:35:24 +0200 (CEST)
From: Sven Schnelle <svens@linux.ibm.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [PATCH] objtool: Add missing endianess conversion when checking annations
Date: Wed, 14 May 2025 15:35:15 +0200
Message-ID: <20250514133515.1829691-1-svens@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xJ0WNLTo4dcc3szMpA0ITfuQBycRBGGS
X-Authority-Analysis: v=2.4 cv=GrRC+l1C c=1 sm=1 tr=0 ts=68249c1f cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=OlQpHzDty6Yk0YrQ6AQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDExNSBTYWx0ZWRfX8klJCSs/EcDw ZgFd+BUMqYcmVkdv0WaSsv39vMSfB7EGvn62OvCrxH+IkS1yzuX1Trth3nitLxPn691tbUX/4GR 2XMk34Oa+44MX0fngEZFk9+PaZczzr5StCOBfVrQryYYEZ+306OS+ssbNeRGeKjScgHvUElq8FW
 l1j2L+48o46gmwHHY5XcP8u2XPkldBIlU7WyWcEPtG3QGmfs2bwi1nlXhpyUMLLyu4JUb726ojy Kl2fmyunqBCCbE2dWGhz6RmM7ScP37Vs3YWzYRyRPsQsKrzToMPPusqlW47SasuO00n8fFKIBLL DtZXLGihXx94vcC0JLg9+GfZjr70eycqWTU7e02u+GGnFGusMzG1gi+MeWRrPbWGffY7ZeQKqXR
 8XZxEZOEE+u4viHhAqQzOxm6vTHjkQAgGIc9JPK//3DGgnKBaRX+gDWEr8YJPrZwOCmbwtOk
X-Proofpoint-GUID: xJ0WNLTo4dcc3szMpA0ITfuQBycRBGGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 clxscore=1011
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140115

cross-compiling a kernel for x86 on s390 produces the following warning:

drivers/mfd/mc13xxx-core.o: warning: objtool: mc13xxx_reg_rmw+0xc: Unknown annotation type: 50331648

Fix this by adding the required endianess conversion.

Fixes: 2116b349e29a ("objtool: Generic annotation infrastructure")
Reported-by: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
---
 tools/objtool/check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index b21b12ec88d9..35fb871b2c62 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2316,7 +2316,7 @@ static int read_annotate(struct objtool_file *file,
 	}
 
 	for_each_reloc(sec->rsec, reloc) {
-		type = *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4);
+		type = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4));
 
 		offset = reloc->sym->offset + reloc_addend(reloc);
 		insn = find_insn(file, reloc->sym->sec, offset);
-- 
2.45.2

