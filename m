Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC69F1A3177
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661521; cv=none; b=HOd4OSD0AwvB/iB9ZoRftIeRwSZwyAIPcrmLpdyr6+lZYGtfBzOpdqJ2VixfrR81Tc5qlDaXIzMos5s7mMY6CwK99V4pZ/wXSkgLFg+T4yEKkm29srX0IVAdXy4lpASysw5BGaxHjd5r2+o8SzKVNm3ewnUcaUYQ8CBl2YIzfsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661521; c=relaxed/simple;
	bh=cDjUvusapPOq5Afz42LjR1NOhus2bxitbpCJG1fft88=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=sUvLdAnagMBqDnYTkkJUh+zx+Wia2D4/53COy2lv4rHwfD9Z8w4xswcPQaCuz3uJgZmBpFlxIsN7aaEchdi2iFds2IMaftS51GIW+YHUsJtNrVxHezwP5B+35WtBxaBUUsN6KWjhZx3KhAuyMWSAGftAmtFlZC0tIM1zWfkannE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b1JW85rNRz51SbG;
	Mon, 19 May 2025 21:31:48 +0800 (CST)
Received: from njy2app04.zte.com.cn ([10.40.12.64])
	by mse-fl2.zte.com.cn with SMTP id 54JDVjYB066571;
	Mon, 19 May 2025 21:31:45 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njy2app01[null])
	by mapi (Zmail) with MAPI id mid204;
	Mon, 19 May 2025 21:31:48 +0800 (CST)
Date: Mon, 19 May 2025 21:31:48 +0800 (CST)
X-Zmail-TransId: 2af9682b32c4ffffffffbb9-100ff
X-Mailer: Zmail v1.0
Message-ID: <202505192131489882NSciXV4EGd8zzjLuwoOK@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <yang.yang29@zte.com.cn>, <akpm@linux-foundation.org>,
        <xu.xin16@zte.com.cn>
Cc: <bbonev@devuan.org>, <linux-kernel@vger.kernel.org>,
        <bsingharora@gmail.com>, <jiang.kun2@zte.com.cn>,
        <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4IG5leHQgdjJdIHRhc2tzdGF0czogYWRqdXN0IGluZGVudGF0aW9uIG9mCiB4eHhfZGVsYXlfbWF4L21pbg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 54JDVjYB066571
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 682B32C4.000/4b1JW85rNRz51SbG

From: Wang Yaxin <wang.yaxin@zte.com.cn>

adjust indentation of xxx_delay_max/min in struct taskstats.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
---
v1->v2:
Some fixes according to:
https://lore.kernel.org/all/202505191436188855ReOYCghNWSoD1i2A4r9h@zte.com.cn/
1. remove the explain about xxx_delay_min/max

 include/uapi/linux/taskstats.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/taskstats.h b/include/uapi/linux/taskstats.h
index d71aa022b2ef..5929030d4e8b 100644
--- a/include/uapi/linux/taskstats.h
+++ b/include/uapi/linux/taskstats.h
@@ -225,11 +225,11 @@ struct taskstats {
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
