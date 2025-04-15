Received: from outbound.pv.icloud.com (p-west1-cluster4-host11-snip4-9.eps.apple.com [57.103.65.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D33294A01
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720498; cv=none; b=kMdOWcTK3I7RChPMRH1h2S0dGn2ruURfxl/TXiLLAved7jkFltO/O4sejD9azo5Tfy4ciwAKMdHsDcZH8sBxQ6qS4MDgAx6M7CfkijAat9+vsx2KwX5kLM2m1AmiE9S3M1S+dkUgk0OYRJ1AuWwPKJbj7eAnitufgg/e4GWkd4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720498; c=relaxed/simple;
	bh=XdLXjUpy2m8ByEWtaWtiNabdg6hygFifDVArr8nh2pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQVRh+7GX124AiwFll0ATC5GBeIyLrpDRZckVitWFrW11d2cPUD0XzIGBQeO64gYSlbMIitf4phZXB7CTvcxaPm2TtG2MSl8AszYtvZHFJzbBsuY4NH7jOEGpB/kFmErSsV9cS8hRi3jy0KN/Emt61neySPhtnF/CGaijM07ULo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=B45R08Is; arc=none smtp.client-ip=57.103.65.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="B45R08Is"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=M0kOlRjIFA0XuH1Wq2lDYX/r1k5rk0w9a3TwvzRsiOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=B45R08Isyvdm8iiO22uhPdQtMIObC2qLs8nHhM2xN4ga9qstJDfo+GrRzygii5jgj
	 QoomZ1SXO5PM9imBqF+uy4LdNvSx4pN5DiEzceoSj9jdTYJlOt4BPu+vBYTFAhE0Fi
	 CQUUlvZUMxS66OaP278FuWp9tPjJNmb3SbXMJ4oR9bhymfSF+Bc7+cP/nwG300Dekl
	 KjaucUYaLofMG5XJYhU/L8oGpO3l2VzYe8LI8BsiR++mHNRTnq/pGc+0EIY9aDwtKP
	 hC5h4IzBUigWoKaHh475DKfhwaYa6cKmv3KL58FkX2NUYydsniiLJTp5m/J/V0GuJZ
	 zO41KkX9RUe1Q==
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 9FCD5180194B;
	Tue, 15 Apr 2025 12:34:53 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 15 Apr 2025 20:34:25 +0800
Subject: [PATCH v2 1/3] configfs: Delete semicolon from macro type_print()
 definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-fix_configfs-v2-1-fcd527dd1824@quicinc.com>
References: <20250415-fix_configfs-v2-0-fcd527dd1824@quicinc.com>
In-Reply-To: <20250415-fix_configfs-v2-0-fcd527dd1824@quicinc.com>
To: Joel Becker <jlbec@evilplan.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: p8Bdpp3dflOvXKSWYsSj1EoDZKacrunE
X-Proofpoint-GUID: p8Bdpp3dflOvXKSWYsSj1EoDZKacrunE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504150089

From: Zijun Hu <quic_zijuhu@quicinc.com>

Macro type_print() definition ends with semicolon, so will cause
the subsequent macro invocations end with two semicolons.

Fix by deleting the semicolon from the macro definition.

Reviewed-by: Joel Becker <jlbec@evilplan.org>
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

