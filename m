Received: from outbound.pv.icloud.com (p-west1-cluster6-host8-snip4-10.eps.apple.com [57.103.67.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB3928DF1F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430469; cv=none; b=bmHHIVtUyZXx3lEjx48vQp035s3pUbUG7l71TLiOAWStTDebZXvoqzwsWRy8sptZr/gnL7JgpDRWYcD4aZYBLpp+Nv7TaG9GOtpHlZ+bPFpNd2ZEh7r6JzyK5cuI8mHZxopRlRnBlDVnPmfsSfdUot6eoXxd2ovxRVtHzeTm7Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430469; c=relaxed/simple;
	bh=X03KB+RH5mwo070dIJFHE6kF45MlVsqH8EHPa6qxoQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p55sqw6Ex5ZGKphOrfl8BEzgCiSXzYC/YBteZZnwLMSG1aveTNBCvHZlOI3qTJK+tXwnT41Ofc0GsicHgiSkOSEV5WQe0CaYH1fPiSc4QB5tiqLvzPbg/ASIfDgX8VpVuHEx9An3pQdE5O6cVfBUHI20qkC9m6ajy6A0OXpx7Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=JQHsND3m; arc=none smtp.client-ip=57.103.67.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="JQHsND3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=dNEEdxNrBt65g5PqF4MlzGBFoBQ175abVJZVvz5pNUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=JQHsND3maG3g3pfWnRAh471jeIbGQQP/0cKIOtMDfF5A3rP1j0CK9udTMYmwQfLEL
	 Il8cSASlr2yB+qlB1cnPCN5GLrzj5VijaGdcwmYDEZLZ3m6MxMd1HI+ayYxA52+fnh
	 vt5uar7JelUQwfbkj64nb0zzkL49hhza8IZrInR4FUMwnTMDCvhmQ4VxAbqX0EQU4F
	 tWKBCDTYtniqg9ou/XwGW3y6fVrfvJO5aTYJVl6/4tBKCT2GSlFpIt4NXVFgmLHXmu
	 RbdqIyNcXirQjC/GaGJWX/Q+neYc8R+1W/zsEnKMGHux9K8/UGvtYt04j1UumezkzI
	 OyahzExOh4ugw==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 7F25D1804DF3;
	Fri, 20 Jun 2025 14:41:05 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 0FF96180BD4B;
	Fri, 20 Jun 2025 14:35:45 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Fri, 20 Jun 2025 22:35:19 +0800
Subject: [PATCH 2/3] char: misc: Rename a local variable in misc_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-fix_mischar-v1-2-6c2716bbf1fa@oss.qualcomm.com>
References: <20250620-fix_mischar-v1-0-6c2716bbf1fa@oss.qualcomm.com>
In-Reply-To: <20250620-fix_mischar-v1-0-6c2716bbf1fa@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfXzrvUNaQRgKoz
 hc85ONLL6JNxAK9fr99oW5QS/yKUjryFQ5wXT/GlTBWQXg2A/XjZ73htXTwu8F5zDbu9ZSL9rdt
 CvC/Nc3AkIO67J3dMKJ3uGzwPiDogDZQUNxEY0Vxznbza2cbuHn0zVuhg8j/fwy8mSQ8tCJ29Fh
 aSjlMQUpoBdqlsJTFdPK+A5skzyB0xEfojcxmZ/3zLcmt+2LXZILRYZfRDRqVuvTWG65TnUTD71
 tvyAFoXfMgo2TIgWm5RZccq1k7lqekks9atf1LZyswWV54tHBX13bO2wimGlWGVUlprGLv4lI=
X-Proofpoint-ORIG-GUID: vo3e49z3c53qg19k-gV6eIW6WVASQ1th
X-Proofpoint-GUID: vo3e49z3c53qg19k-gV6eIW6WVASQ1th
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 phishscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2506200104

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

Local variable @ret is not used for return value in misc_init().

Give it a different name @pde.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/char/misc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index d5accc10a110098f7090dd0f900bc5fae5f75f74..f5ef8c175adb559e67dfe905d43d1404b249cc9e 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -289,9 +289,9 @@ EXPORT_SYMBOL(misc_deregister);
 static int __init misc_init(void)
 {
 	int err;
-	struct proc_dir_entry *ret;
+	struct proc_dir_entry *pde;
 
-	ret = proc_create_seq("misc", 0, NULL, &misc_seq_ops);
+	pde = proc_create_seq("misc", 0, NULL, &misc_seq_ops);
 	err = class_register(&misc_class);
 	if (err)
 		goto fail_remove;
@@ -305,7 +305,7 @@ static int __init misc_init(void)
 	pr_err("unable to get major %d for misc devices\n", MISC_MAJOR);
 	class_unregister(&misc_class);
 fail_remove:
-	if (ret)
+	if (pde)
 		remove_proc_entry("misc", NULL);
 	return err;
 }

-- 
2.34.1

