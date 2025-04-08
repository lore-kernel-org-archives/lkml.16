Received: from pv50p00im-zteg10011501.me.com (pv50p00im-zteg10011501.me.com [17.58.6.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008B42B2DA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118797; cv=none; b=h9jwtXpaHJDJ2c7De7HtMWJ9j7OvpEa61RNT5i+tSvNsnBS04eNQfyYjOHMdPiSvF8f/2E7lEWcr9B3vlTTe4xtD3QTMr7pVjpQ42up5rSLe2GNO3EuYhW49eBEgcrmbt+St7NqvdfapdmuYz7hFfphCpu9VRb6t+s36/17nm/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118797; c=relaxed/simple;
	bh=9fsTAIVfOi0+OWNIf3tIMuaBLuyIGt5oDhLJusCehnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9JWaJCToz7GzL4TK8rQrBy/6PCPSB1P274jVq7juapkju1ymndBEneJ+0CqTNj/foDe9r7ZXpgYedre7RcFufdqZ2YVfZmgnWhb+82i8prFViEg8nzDLPpiQuNaaZID+5ve3cDMc7FCAv8Ag12sT+9dcjMdyIf6b60HKN8SsA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=F45wA7OG; arc=none smtp.client-ip=17.58.6.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="F45wA7OG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=2daTzEuq/qfYre6VoZilPcn/8mf1QnnXEd8ixceQqyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=F45wA7OGkXCiMEKLmgM7iu65iJjA+/k2Cko8gQch225ANWtLEhOa6gm/dADbkuKs9
	 /UilOo+O82QO1hJuejdNsA6cfg3Dd+i5/nGxhxnfh4SJyzRDTnPmD5wNDEd9gZn+Ln
	 GN0jHXZaFbh8tXYomzZnfd9DTMVkns6+YKZ3gSiQFkXo1zgQHeeSEoBoZVAxt4r3ix
	 gR1u4KdtGDjICzm0N2fDQMB409BWfSIQq4tMBy5eY+1pN8j2b6H7lkZT+YiHwbLAf4
	 34otY2/uNtOG6uBtfE7050C/9VMAqmmTRnY92vuyY/lYL5wHLi8Y/2YvaEb3noeTbz
	 jiXLtTabztJ+w==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id 769004A03A1;
	Tue,  8 Apr 2025 13:26:29 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 08 Apr 2025 21:26:07 +0800
Subject: [PATCH 1/4] configfs: Delete semicolon from macro type_print()
 definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_configfs-v1-1-5a4c88805df7@quicinc.com>
References: <20250408-fix_configfs-v1-0-5a4c88805df7@quicinc.com>
In-Reply-To: <20250408-fix_configfs-v1-0-5a4c88805df7@quicinc.com>
To: Joel Becker <jlbec@evilplan.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Jfxsi825eBVZpNvvu7u-YxPgcy1J1CUn
X-Proofpoint-ORIG-GUID: Jfxsi825eBVZpNvvu7u-YxPgcy1J1CUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2504080095
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

Macro type_print() definition ends with semicolon, so will cause
the subsequent macro invocations end with two semicolons.

Fix by deleting the semicolon from the macro definition.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 fs/configfs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
index 7d10278db30d667d0ef7e1140e54961c5a440c41..0a011bdad98c492227859ff328d61aeed2071e24 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -970,7 +970,7 @@ static void configfs_dump_one(struct configfs_dirent *sd, int level)
 {
 	pr_info("%*s\"%s\":\n", level, " ", configfs_get_name(sd));
 
-#define type_print(_type) if (sd->s_type & _type) pr_info("%*s %s\n", level, " ", #_type);
+#define type_print(_type) if (sd->s_type & _type) pr_info("%*s %s\n", level, " ", #_type)
 	type_print(CONFIGFS_ROOT);
 	type_print(CONFIGFS_DIR);
 	type_print(CONFIGFS_ITEM_ATTR);

-- 
2.34.1

