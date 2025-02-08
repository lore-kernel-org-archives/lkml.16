Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B497313D28F;
	Sat,  8 Feb 2025 06:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738997349; cv=none; b=kLdzRFSahXOx3LkxaSwnRIk8kUDt1oHH4AEuFx6Eox+jlRuwYWBGag/rHOIjObMY7+eB9A+IuA3av4turaYowpTVNLAlctqXT+eUH9VeXZYF7xOgui9iF7tLf3Og+JT7eqqgCkhS1VIg9dcakRabFfrqcg/JBIXfW+d2zVUkJ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738997349; c=relaxed/simple;
	bh=xwYPglYfWZQX9I96IJ2FCnH+PLuxow1CW5yBxYQe27A=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=tPPyG1b2Ba5ND+I5z5tMyVGrEEwEKIzYZ+ifHwDp/47XZ8A86YqgHFsSQrGletTIQrpQH6/4X85uHioz8wp048tmcReb7uw6IpH36o5WWmQ0qbjyFnL2kjhlpvLl8NyY5rqhmLEwvwufeUabFpBXTUDI6L87mN6/sgXAOATzzyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4YqhJd5LrJz5B1KR;
	Sat,  8 Feb 2025 14:49:05 +0800 (CST)
Received: from njb2app06.zte.com.cn ([10.55.23.119])
	by mse-fl1.zte.com.cn with SMTP id 5186mwED099905;
	Sat, 8 Feb 2025 14:48:58 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njb2app05[null])
	by mapi (Zmail) with MAPI id mid204;
	Sat, 8 Feb 2025 14:49:01 +0800 (CST)
Date: Sat, 8 Feb 2025 14:49:01 +0800 (CST)
X-Zmail-TransId: 2afd67a6fe5dffffffff823-4a626
X-Mailer: Zmail v1.0
Message-ID: <20250208144901218Q5ptVpqsQkb2MOEmW4Ujn@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <bsingharora@gmail.com>, <akpm@linux-foundation.org>, <david@redhat.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <wang.yong12@zte.com.cn>,
        <wang.yaxin@zte.com.cn>, <fan.yu9@zte.com.cn>, <he.peilin@zte.com.cn>,
        <tu.qiang35@zte.com.cn>, <qiu.yutan@zte.com.cn>,
        <zhang.yunkai@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4IG5leHRdIHRhc2tzdGF0czogbW9kaWZ5IHRhc2tzdGF0cyB2ZXJzaW9u?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 5186mwED099905
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67A6FE61.000/4YqhJd5LrJz5B1KR

From: Wang Yaxin <wang.yaxin@zte.com.cn>

add the "delay max" and the "delay min" to the taskstats structure,
and the taskstats version needs to be updated accordingly.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
Signed-off-by: Kun Jiang <jiang.kun2@zte.com.cn>
Reviewed-by: xu xin <xu.xin16@zte.com.cn>
---
 include/uapi/linux/taskstats.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/taskstats.h b/include/uapi/linux/taskstats.h
index 934e20ef7f79..95762232e018 100644
--- a/include/uapi/linux/taskstats.h
+++ b/include/uapi/linux/taskstats.h
@@ -34,7 +34,7 @@
  */


-#define TASKSTATS_VERSION	14
+#define TASKSTATS_VERSION	15
 #define TS_COMM_LEN		32	/* should be >= TASK_COMM_LEN
 					 * in linux/sched.h */

-- 
2.25.1
