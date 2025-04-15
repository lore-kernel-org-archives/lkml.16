Received: from outbound.pv.icloud.com (p-west1-cluster2-host3-snip4-8.eps.apple.com [57.103.64.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB831F3FE3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720503; cv=none; b=JYi5FNSec/iHh0KqeZXkUCpkH7pfHXnPh2S2CoxygoxpsNRyLHt+FxQ1YDbMPV4ykZPznAiVnAMH38ANjB0fTuC9QtSkGbcABEYJfd9OipODLiUTz0+bkWB0NuBRr8D16XkxabF3gutQYBtaRPtuWgaoHiASCE+WOcSr79QPalA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720503; c=relaxed/simple;
	bh=55telB29pwujf1LwMv4On5EW/95s9rStxrqjwR1k0oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CgsRGnT4/1rcPce0TvYyXP5/4vyceNn73L5lN68z+NTTsn9fmNx5oWslb5E+vLzmKvKl2fjPAPCODfw8vnq/IaO1IZb0X43iRiDOekcdzcu03G3cww/2z4+wyjq5QzU3kVLq63F2nHdGtbbpUg7AhTnnBPPyKe9d1K+A8Vd3n1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=H3ivcqqU; arc=none smtp.client-ip=57.103.64.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="H3ivcqqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=QxSHgt6aXuLJk8a5NsbjHD+ZecG8WJ+FsLv+31TleOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=H3ivcqqUHXBLH1MBdqXJ4/Y1vxsSVx/nFBLtdgablHQjFfQWS8bLJDNPWGq/Iytci
	 g+x3UumyNtT9lNHu9BLm3Tw+cLHft9hRfQw4cgXlL/yYHE3kUCaqQuioS8nm5+0Bnr
	 +m7D1XF0dh1kKTVnB36ciu3gcKPcUYQN+V/sAyFq0Mwkp1quuR217B8InY77Bko3Nu
	 awYCppr4+ScfGAxbaj6KR/CNFxogx4kDl+/IQJOvJhRUjnNzUZdsZ/Dtkdo4zvZZ9a
	 1dHSCTjaa+qCvfFTt206SOB5nJYOq9IKi7lFvTSc9uUKXSzOzRd9QTRbLHNFonk9JY
	 psVQb9J4rZchg==
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 7548A1801959;
	Tue, 15 Apr 2025 12:34:57 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 15 Apr 2025 20:34:26 +0800
Subject: [PATCH v2 2/3] configfs: Do not override creating attribute file
 failure in populate_attrs()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-fix_configfs-v2-2-fcd527dd1824@quicinc.com>
References: <20250415-fix_configfs-v2-0-fcd527dd1824@quicinc.com>
In-Reply-To: <20250415-fix_configfs-v2-0-fcd527dd1824@quicinc.com>
To: Joel Becker <jlbec@evilplan.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: PfTiURAdio8dfn9ydI5NecXYE0RTaeA6
X-Proofpoint-GUID: PfTiURAdio8dfn9ydI5NecXYE0RTaeA6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504150089

From: Zijun Hu <quic_zijuhu@quicinc.com>

populate_attrs() may override failure for creating attribute files
by success for creating subsequent bin attribute files, and have
wrong return value.

Fix by creating bin attribute files under successfully creating
attribute files.

Fixes: 03607ace807b ("configfs: implement binary attributes")
Cc: stable@vger.kernel.org
Reviewed-by: Joel Becker <jlbec@evilplan.org>
Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 fs/configfs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
index 0a011bdad98c492227859ff328d61aeed2071e24..64272d3946cc40757dca063190829958517eceb3 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -619,7 +619,7 @@ static int populate_attrs(struct config_item *item)
 				break;
 		}
 	}
-	if (t->ct_bin_attrs) {
+	if (!error && t->ct_bin_attrs) {
 		for (i = 0; (bin_attr = t->ct_bin_attrs[i]) != NULL; i++) {
 			if (ops && ops->is_bin_visible && !ops->is_bin_visible(item, bin_attr, i))
 				continue;

-- 
2.34.1

