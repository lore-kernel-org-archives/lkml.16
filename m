Received: from outbound.pv.icloud.com (p-west1-cluster2-host3-snip4-1.eps.apple.com [57.103.64.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C9325A2A3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618674; cv=none; b=ochTPCYWE8ODYGvy22oPFEne2WjhwEvYCo8ZLAtzdZAk6KamRJzdDFvG3eAi9szinX8nkvpH7jZaPXvGE7yBf41uIfwGWAUy+8w0EB1DAQhatzoxkxq9UdsRHK6CUIBRVl4Lrp+C6fbXEeLIaxt45+bXLLguGIYbBOoGYKtmGEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618674; c=relaxed/simple;
	bh=G0EmvLuXMxOVKcjOmby5xyWrkEo1vv5BVYKcqaSnmK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=htpUw0TPWe30S+tWWwz0qvPgNFibl6MXZsTvaMQwdaaObgkuJSR3m/UPFKK0kztXnmmJR8EvXKc5g3GF+hSwxji/qloQQvE4ETxiZhR8pX3IcESWjVWe6RM3Ywj2JbybJ2xQ8LbNIONHTuWcDpeHW6O3h9xGXUVNu5v0M6dJjsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=JwDdh1hA; arc=none smtp.client-ip=57.103.64.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="JwDdh1hA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=GLlyUi+/XtLimd8mmDcek7Y+01pRn6rPBk6nTb5pM6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=JwDdh1hABHrn5bCycPrwnctrapInqYA7sgQBXmXaLpfiWlknoNolj6lalayxua3an
	 3BOJlVWFR8hHxA2s0siZHuM58J2hTSUL0snd/DgaUkl46J5qH4uwF9lvGXlOrM97BA
	 LxEMec1IdzPp16wuJfjAH6g+1ESWe70NvmZLiZ1K+HYbCjI7PZFuEnOkAD3AQ36PQ4
	 GaleT3NGzgrKBUAEen5XJPZdicIGFO8R10CaO+Y+kNi1MQWUppiAtq2cfgr8Kqb4VN
	 uoTOasGJbCs242+k/7MipArkHtiLpsrA4yo4swtAay3zrZOIdAmM76l4MsEDP6nkRx
	 jLJ1Ry//BArJg==
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 7285218001CC;
	Wed,  7 May 2025 11:51:07 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Wed, 07 May 2025 19:50:27 +0800
Subject: [PATCH v3 3/3] configfs: Correct error value returned by API
 config_item_set_name()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fix_configfs-v3-3-fe2d96de8dc4@quicinc.com>
References: <20250507-fix_configfs-v3-0-fe2d96de8dc4@quicinc.com>
In-Reply-To: <20250507-fix_configfs-v3-0-fe2d96de8dc4@quicinc.com>
To: Joel Becker <jlbec@evilplan.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 Al Viro <viro@zeniv.linux.org.uk>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Breno Leitao <leitao@debian.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: oy3ZyznyjWXS5436yBhCc0M6Yutuuz6K
X-Proofpoint-GUID: oy3ZyznyjWXS5436yBhCc0M6Yutuuz6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2505070111

From: Zijun Hu <quic_zijuhu@quicinc.com>

kvasprintf() failure is often caused by memory allocation which has error
code -ENOMEM, but config_item_set_name() returns -EFAULT for the failure.

Fix by returning -ENOMEM instead of -EFAULT for the failure.

Reviewed-by: Joel Becker <jlbec@evilplan.org>
Reviewed-by: Breno Leitao <leitao@debian.org>
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

