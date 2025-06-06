Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECD328B41E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224120; cv=none; b=VeP5ue8FR8xBYwYEUzaeUbQT6S9Ul6MJSrzUGu6cM+jA3HyzqMW1cwQN41sTkQCdZtxtZ0Qbk7f9+/oki8WAa2PFQcFZzxlZeyRPvyan9deOvjlb78AbT1v1oSprYihBWgw353RiBSeU/sXGMhHyyb1fqor1B325puwcovuGxMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224120; c=relaxed/simple;
	bh=eapQH9Pu3xNVR8smEr7tNLOEPObMvHtSxQXhpF37H8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBAcfxPQApqLgsoh+KgIYyWZnqgbZRYgO59ooKNkcEaXZiilRjcBXWKkABG2okFyklOEvoTKXj8s/+Ur8Z71dmFDq62AiMUOuErS+FF7ySMX/vc4gd9RyUIVU3XT0HY9JF8nxwSSz4AUAkYKOZ6lK1lNqgNIZ9tDthcvH0tu2kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dp8+meFx; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dp8+meFx"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565MWvU002076;
	Fri, 6 Jun 2025 15:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=qKWmo
	QacCgmw1/3xvcsQO6P0KgtNTrg1orkARsvgoVg=; b=dp8+meFxWEZ3QGs3c/AQg
	iMz48JYRCBSIlB5Qve0VG0QKceQWd8o8dUg9IxdteqJI8CUw7gzqBwj0VIcJabaR
	DiAq86tFeLGvfFvv8nbMyvxenK8a6sVNWvuAU6PYMr8qSr8uftw1ef/3iyORGdtF
	EkFW4uMnlVlMFdMuxtjMDuNMgEsTHbsw/UF9npJz4MGScE6RQ2J0mVmaohNBbcsb
	1RQDaLthOq1UjOIscf2ejA8uWJweeL7mJ2uuvdvmtTLp8qWt1ogwCIVG3H45zrbn
	NvJ5cB2r7XgBagU6r3QVjY3Nn15mpP0V/1iN9LrNnXEuv2KROHWSc+QThc55ObrG
	A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahgags-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556ERKe8039260;
	Fri, 6 Jun 2025 15:35:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7despk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:12 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh45015517;
	Fri, 6 Jun 2025 15:35:11 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-14;
	Fri, 06 Jun 2025 15:35:11 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 13/13] objtool: Do not validate IBT for .return_sites and .call_sites
Date: Fri,  6 Jun 2025 17:34:40 +0200
Message-ID: <20250606153440.865808-14-alexandre.chartre@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250606153440.865808-1-alexandre.chartre@oracle.com>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060136
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=68430ab1 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=yvIqsss6GtJD96b7xZoA:9
X-Proofpoint-GUID: uYYyFBdp_eo6C9GSYKr6E653Ii9VcV2i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfXx7WY+3vCKjOe 7+uRcx2V5CuxraB4EJ+1pcW0QBlWxUpxvmritY76Evjyo25bzo2FRilV8f0rP5TN/4SUkUTtlyK VLHwk+X4HceSVbryN/Edlc0b4rsteG4cr4TtdnUbcBA8NOEopKczGk705kXFSKNXnnckfaRoLdn
 rGGvkydmvesHsRFSyUj+/pmRzIf48OUotwsbLTs2XKcrIf3eq2KHyVSNJsrJos0Z42KyfmhSYgH PAPIff3ipOvPk++fNsND6+J/axx6o2hsFVOhtb8n93v51MCJAAUnu4fXKoPEi7rvrDS5dYJqsSK DSBToVSZowFW3S+uF+SU9Y8WqSgjU+9frgIo1zOn5G04eG5p9SJCgLMw7cSQJF8Jb+0NMmB7s8V
 R9WvqMjvTj4AcpmrzrB2f6TIRib3IHJTcQIDUojjK0gfcoCTdwMYHqP8PUwYKDz/M23RIQLO
X-Proofpoint-ORIG-GUID: uYYyFBdp_eo6C9GSYKr6E653Ii9VcV2i

The .return_sites and .call_sites sections reference text addresses,
but not with the intent to indirect branch to them, so they don't
need to be validated for IBT.

This is useful when running objtool on object files which already
have .return_sites or .call_sites sections, for example to re-run
objtool after it has reported an error or a warning.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index afcb6c67daa9..6d81dabef64e 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4844,6 +4844,8 @@ static int validate_ibt(struct objtool_file *file)
 		    !strcmp(sec->name, ".llvm.call-graph-profile")	||
 		    !strcmp(sec->name, ".llvm_bb_addr_map")		||
 		    !strcmp(sec->name, "__tracepoints")			||
+		    !strcmp(sec->name, ".return_sites")			||
+		    !strcmp(sec->name, ".call_sites")			||
 		    strstr(sec->name, "__patchable_function_entries"))
 			continue;
 
-- 
2.43.5

