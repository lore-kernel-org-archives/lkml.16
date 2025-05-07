Received: from outbound.pv.icloud.com (p-west1-cluster4-host9-snip4-10.eps.apple.com [57.103.65.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1442580D3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618662; cv=none; b=uQmJ8KWj2X9yw1HLnbGhZytXXhMW/LwJyNv78PmlKH7bDcxrzIC/+gV/TgEhr1ytrv3ESu63qu+VikGHkjbaJSKCJB2zECObfk7YwnDWCLo1WKHm7BnoAPLYZfVxHEQtdEJ80W3DOy7J8in1gk8DoIyaD0KAKK/1fWL1dScGCO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618662; c=relaxed/simple;
	bh=t7RBdpAB6/Rvg0ouhT00GEbC2yqCs/4F4PCd/6M4UJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zls6vrFcpZ2LQE8k3L48RXii5fw2HMXhZWPLB9NsF6vyg+fy58d9WGVigHhixTDds2caPvhKMI2ykKd6NDLoTMezoz2v486ndB6IWwn0MgD+LxmchUVbWZWQoAeWj1BVCs3ME/lKW9ia3OdrFVUjnUZJQiScB92peto69Vl5hX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=C7n/fbGn; arc=none smtp.client-ip=57.103.65.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="C7n/fbGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=NoyyqDYIyR/SRfx69JoOxA75oEf2SatCOktYowKGFjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=C7n/fbGnsSOEJyl/VKPwmZH756CdjanCwcrEBeWMRbbL/LMufmt4Jv/tRbnWi5uJD
	 O4E4UGm0lj5s+tMDDF4Xmg4GICDT3QlZJlfpgQy5n2k4buUcg+pCJOIesZ0aEi673x
	 MpRuexdwsAXSS7DkVEOBn4gfF5ota3AXjDK53EGH9iF/r2j47rxDsB2uooh1TWRI6Q
	 3U5p7sQPizEoYl1oo3Yyhr5ka/BIwsiPpcYgExUWukNv65ZnwwD3y2Ed4cRJ1EgbgL
	 CO7vVgnSWcvF6YuVGeVpNW6WzsbsidZIo8VQxBm3KRwGg77biMDQmjPPJgKsyibYgK
	 WJ5qE5xVXGsqw==
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 13C9618003B4;
	Wed,  7 May 2025 11:50:55 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Wed, 07 May 2025 19:50:25 +0800
Subject: [PATCH v3 1/3] configfs: Delete semicolon from macro type_print()
 definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fix_configfs-v3-1-fe2d96de8dc4@quicinc.com>
References: <20250507-fix_configfs-v3-0-fe2d96de8dc4@quicinc.com>
In-Reply-To: <20250507-fix_configfs-v3-0-fe2d96de8dc4@quicinc.com>
To: Joel Becker <jlbec@evilplan.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 Al Viro <viro@zeniv.linux.org.uk>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Breno Leitao <leitao@debian.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: C0A6qtARvdRpMkOuGpmmDECQSRHtKH1r
X-Proofpoint-GUID: C0A6qtARvdRpMkOuGpmmDECQSRHtKH1r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2505070111

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
index 5568cb74b32243ef30eac9c5957c17da3ca5afe9..6d4a1190f694fe5260577dbedeb755d6fcdf6703 100644
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

