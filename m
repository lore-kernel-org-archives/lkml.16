Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0628722D79A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635317; cv=none; b=EU2wqH48AQTo4boHaU5HmH/83bsYEp4UTl9j+9titnlLZj0LxSexyJmkLanJ7tUBVnrZdtSSS59oNLFscSRoXproFR2zpntB3Sa68iACi8mDTvOZnUe+LiiyrEBRZV0+WigX2dvEYO6BvzmX3Hc6JxLBepFO+fJzQc7VyWcHYU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635317; c=relaxed/simple;
	bh=e4mwkhaSG13KH4Tu5SY1Pl6xBlf9FXkb/l5SV71/QL0=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=qqTUHJRnUbI6fM/eQLb32DmJtc8t+ZK2+167svao8WMG8Rqtb8KWUB1wIF02Zs3m8hjwc/4f0/uTIKkElebpEi4GMcOELVspkVzw3818maC1e/f+2d3QD3qn5o9UfbSo6Qnc3i21c3V8m8J55KFGtbleJWUCq91py3o1kbWPDLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b16qB4jgzz51SZC;
	Mon, 19 May 2025 14:15:02 +0800 (CST)
Received: from njy2app08.zte.com.cn ([10.40.13.206])
	by mse-fl2.zte.com.cn with SMTP id 54J6EiEQ088657;
	Mon, 19 May 2025 14:14:44 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njy2app08[null])
	by mapi (Zmail) with MAPI id mid204;
	Mon, 19 May 2025 14:14:46 +0800 (CST)
Date: Mon, 19 May 2025 14:14:46 +0800 (CST)
X-Zmail-TransId: 2b00682acc56065-088af
X-Mailer: Zmail v1.0
Message-ID: <20250519141446635ihK4D1-JvptKANb816_Kz@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <yang.yang29@zte.com.cn>
Cc: <bbonev@devuan.org>, <linux-kernel@vger.kernel.org>,
        <bsingharora@gmail.com>, <jiang.kun2@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <akpm@linux-foundation.org>,
        <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4IG5leHRdIHRhc2tzdGF0OiBhZGQgZXhwbGFpbiBhYm91dCB4eHhfZGVsYXlfbWluL21heCBhbmQgYWRqdXN0CiBpbmRlbnRhdGlvbg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 54J6EiEQ088657
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 682ACC66.001/4b16qB4jgzz51SZC

From: Wang Yaxin <wang.yaxin@zte.com.cn>

add explain about xxx_delay_min/max and adjust indentation.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
---
 include/uapi/linux/taskstats.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/taskstats.h b/include/uapi/linux/taskstats.h
index d71aa022b2ef..62e2d7f65298 100644
--- a/include/uapi/linux/taskstats.h
+++ b/include/uapi/linux/taskstats.h
@@ -207,6 +207,12 @@ struct taskstats {
 	/* v15: add Delay max and Delay min */

 	/* v16: move Delay max and Delay min to the end of taskstat */
+	/*
+	 *
+	 * xxx_delay_max is the max number of delay values recorded
+	 * xxx_delay_min is the min number of delay values recorded
+	 *
+	 */
 	__u64	cpu_delay_max;
 	__u64	cpu_delay_min;

@@ -225,11 +231,11 @@ struct taskstats {
 	__u64	compact_delay_max;
 	__u64	compact_delay_min;

-	__u64    wpcopy_delay_max;
-	__u64    wpcopy_delay_min;
+	__u64	wpcopy_delay_max;
+	__u64	wpcopy_delay_min;

-	__u64    irq_delay_max;
-	__u64    irq_delay_min;
+	__u64	irq_delay_max;
+	__u64	irq_delay_min;
 };


-- 
2.25.1
