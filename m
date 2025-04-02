Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA32979FE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 01:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743556557; cv=none; b=Vkc3gPNFDbCBhJFqDUpUf7wX5ENYkeBWGd9Yzy1cHfMOswYgfBaORdEYGhsWRn3H5TdwRf/zOTpHzFVGUcZgkxAcocZfor7RyuiGon4176CMNMWI7K4Ko9u2N4Dgz7FtckMtyMdIIIgK/21dUq5vQuhGuLafKRhCb8yNUovJN3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743556557; c=relaxed/simple;
	bh=BOXyZqlk4kbaa/kSlJXXkoqx6VcN/fL2P5qJlKiHVNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V18/YncNDOzExmGoUa3J05xt4pM80LsGBPxXkuBSS6DgAoQU/OSOxqxsJgJ0TLdCNO4uq/zn/MCt2y8famck7jR7ufTInD6rRgrYbyX0Ru7hjRQdTnEdfSAcydQ5QYYmZwuyx/guhUmTyzeIPaAaqXyOajyy1V/EMpg+R0EoXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oqtQcisy; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oqtQcisy"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531NDvxE010807;
	Wed, 2 Apr 2025 01:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	pp1; bh=PRLfOEG5kswbyI3Ul3lxpqCOGZQCN/7f0kNQ9f9Pv9I=; b=oqtQcisy
	GdloA2400/7pcK8OpSW06cipFAr/Uwee2bucL4Bl/sDTvJfqy4bujJjyvpUGNXew
	UBs5GoQbX0jT81VlvodGMHUi+HRH/+FxtKcaMzW9hWLu9mjRMsz+SiuA22TtJEqi
	LOCL2pUOdaOypD4eRhmZ0F8dqcwBvOore1CUgIe6b/QfL8fG5jtBXoAD7X/aU4Fz
	c0sSM9B+zHWuXr+VWqPRsXHAU58sUDIOfkOdxJy515S/HqwNr5Yxn4GQ237m4FLT
	FJdKWKnbJN7OQ1dLeCxegyuJPx/sVetoRy5vAF+7ws/UhDDuyuJCtDoDCdRexu4A
	sGfZRC9IMlWtrw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45rqaqh2q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 01:15:42 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5320TXMI001753;
	Wed, 2 Apr 2025 01:15:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45rddkuq8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 01:15:41 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5321FbEx30474930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 01:15:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FA8C20040;
	Wed,  2 Apr 2025 01:15:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFDB520043;
	Wed,  2 Apr 2025 01:15:36 +0000 (GMT)
Received: from localhost (unknown [9.171.28.150])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  2 Apr 2025 01:15:36 +0000 (GMT)
Date: Wed, 2 Apr 2025 03:15:35 +0200
From: Vasily Gorbik <gor@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Ihor Solodrai <ihor.solodrai@linux.dev>,
        Heiko Carstens <hca@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/sorttable: Fix endianness handling in build-time
 mcount sort
Message-ID: <patch.git-dca31444b0f1.your-ad-here.call-01743554658-ext-8692@work.hours>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yDHtaMOd4GAVKiNSss-uGZJYgBXaMZRM
X-Proofpoint-ORIG-GUID: yDHtaMOd4GAVKiNSss-uGZJYgBXaMZRM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_10,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=580
 clxscore=1011 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504020005

Kernel cross-compilation with BUILDTIME_MCOUNT_SORT produces zeroed
mcount values if the build-host endianness does not match the ELF
file endianness.

The mcount values array is converted from ELF file
endianness to build-host endianness during initialization in
fill_relocs()/fill_addrs(). Avoid extra conversion of these values during
weak-function zeroing; otherwise, they do not match nm-parsed addresses
and all mcount values are zeroed out.

Fixes: ef378c3b8233 ("scripts/sorttable: Zero out weak functions in mcount_loc table")
Reported-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reported-by: Ihor Solodrai <ihor.solodrai@linux.dev>
Closes: https://lore.kernel.org/all/your-ad-here.call-01743522822-ext-4975@work.hours/
Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 scripts/sorttable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 7b4b3714b1af..deed676bfe38 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -857,7 +857,7 @@ static void *sort_mcount_loc(void *arg)
 		for (void *ptr = vals; ptr < vals + size; ptr += long_size) {
 			uint64_t key;
 
-			key = long_size == 4 ? r((uint32_t *)ptr) : r8((uint64_t *)ptr);
+			key = long_size == 4 ? *(uint32_t *)ptr : *(uint64_t *)ptr;
 			if (!find_func(key)) {
 				if (long_size == 4)
 					*(uint32_t *)ptr = 0;
-- 
2.48.1
