Received: from outbound.pv.icloud.com (p-west1-cluster1-host1-snip4-5.eps.apple.com [57.103.64.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86391F3FE3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720508; cv=none; b=UwBqrPh+oDuGNiMcFBk5B6D97nd6l+z+DSLbLCNZtON9MsWKbh6d6qpRHHregKuk3UWIn117QBI9i0CYcWEhFeyMWppF7M/IPxpNPyGIEcy8YcBeixKMMAdGjjNcLA8UseULiJnx8wZ4DIqjnlWLaJdTlGlRPa6hmqBOXGjzdeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720508; c=relaxed/simple;
	bh=G/M1tHMiyflA1BIJylR3XZVvTrp1OCa6G+q+3ZYF/KE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqBSyTjbTWK5CRgn+fMD6CSfiA6Zd+8wD9baFatIXiHlK5f2taM15pqS6fX/GBnPAm8Vr3FLqNj0+c5pmXjUbsTe/ieJtF4tSyvGTgrpKILc+mBW1WmfKN93+lsttL8AbgC9iS/4za7VkBH+pdQDJNhNiaWxf/paIr+dHvmomXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=gPGaRBlg; arc=none smtp.client-ip=57.103.64.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="gPGaRBlg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=As/+adlLHJw9d2MVZPc0TJBJ1JrIgfvJpyt5YhiILdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=gPGaRBlgIGtmpNBrvNT04nlqnZf1ioTVCqG2P/ZAHF1rgjrkenlxt2GizRM0mxp8I
	 8ylFmllh/44V+fTJgEnQ74bvjSq4An2Ou+MflRUmF1HiM1YlPbC+/lxqzxYF0Joe5F
	 KZgNg+DiPh0NknoJZxFxC24sN6P3ULlBCVNT7AQ43eWMdOBofPUlpvEtEwuK65lBPu
	 Jx3bGmd37N2AZAkkvPDLqEcfdpoCvatwBAbtl9JOG/TcIVBl8HJWsRhNlSCs9AOj9i
	 k0Vn9GWpRHesQbXEXVNLcBjILjiwLbQYR0r2iBw2Nj8orrYhfzotoAZgVZnE6McqZP
	 kyC+W3jEIa2uA==
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id C05561800413;
	Tue, 15 Apr 2025 12:35:01 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 15 Apr 2025 20:34:27 +0800
Subject: [PATCH v2 3/3] configfs: Correct error value returned by API
 config_item_set_name()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-fix_configfs-v2-3-fcd527dd1824@quicinc.com>
References: <20250415-fix_configfs-v2-0-fcd527dd1824@quicinc.com>
In-Reply-To: <20250415-fix_configfs-v2-0-fcd527dd1824@quicinc.com>
To: Joel Becker <jlbec@evilplan.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 7Lc8Zxtxo7UzqSnos6E459TYESyTzkUd
X-Proofpoint-GUID: 7Lc8Zxtxo7UzqSnos6E459TYESyTzkUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504150089

From: Zijun Hu <quic_zijuhu@quicinc.com>

kvasprintf() failure is often caused by memory allocation which has error
code -ENOMEM, but config_item_set_name() returns -EFAULT for the failure.

Fix by returning -ENOMEM instead of -EFAULT for the failure.

Reviewed-by: Joel Becker <jlbec@evilplan.org>
Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 fs/configfs/item.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/configfs/item.c b/fs/configfs/item.c
index 254170a82aa337d95cbfbdf1a2db1023db3a2907..c378b5cbf87d28387a509c3cabb93eccfb520c9c 100644
--- a/fs/configfs/item.c
+++ b/fs/configfs/item.c
@@ -66,7 +66,7 @@ int config_item_set_name(struct config_item *item, const char *fmt, ...)
 		name = kvasprintf(GFP_KERNEL, fmt, args);
 		va_end(args);
 		if (!name)
-			return -EFAULT;
+			return -ENOMEM;
 	}
 
 	/* Free the old name, if necessary. */

-- 
2.34.1

