Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B3113D28F;
	Sat,  8 Feb 2025 06:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.251.27.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738997666; cv=none; b=eP1qpV921/3fGfl4TTJpnQ9kdxIHxdFgLbr6+DbY+PbE6k8zzfq58MjgDnnU3yuFZ+xKftgwSZr+YieobV41rigdeZywNPDvbw2Ar+DHviEKM/ZcyGF6+0oUnq7lSOfEXkbnNMAgWBX3vXULZHW0L1K5vNRcU5KZ/ixDAkCvMNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738997666; c=relaxed/simple;
	bh=GkZZHT8EMogNxApeGrVHLUWon4pzNEkxxb39WL+cT14=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=ETgFwn5R2GD/1xr757t5ndPsK3u3VXG55bRUvIoOqxTQNBk3ATmRdAV3yvegaAdaW8/YwhJi88WR1fgBn0fbu1shqmknx8HD0ius6//G2GAnnTWxjD8cCU53CK/hotmxwCCEwVTSnF1DaSIiKk8OeTrIOkGSA3ZHH5XvIyIm7+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=58.251.27.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4YqhCK2n8TzkNx;
	Sat,  8 Feb 2025 14:44:29 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4YqhCB6fjCz5TCG6;
	Sat,  8 Feb 2025 14:44:22 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4YqhC20Njxz5B1Kq;
	Sat,  8 Feb 2025 14:44:14 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4YqhBq049Dz4xVcS;
	Sat,  8 Feb 2025 14:44:03 +0800 (CST)
Received: from njy2app01.zte.com.cn ([10.40.12.136])
	by mse-fl1.zte.com.cn with SMTP id 5186hwHP094495;
	Sat, 8 Feb 2025 14:43:58 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid204;
	Sat, 8 Feb 2025 14:44:00 +0800 (CST)
Date: Sat, 8 Feb 2025 14:44:00 +0800 (CST)
X-Zmail-TransId: 2aff67a6fd30ffffffff805-3f613
X-Mailer: Zmail v1.0
Message-ID: <20250208144400544RduNRhwIpT3m2JyRBqskZ@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4IG5leHRdIGdldGRlbGF5czogZml4IGVycm9yIGZvcm1hdCBjaGFyYWN0ZXJz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 5186hwHP094495
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67A6FD4B.000/4YqhCK2n8TzkNx

From: Wang Yaxin <wang.yaxin@zte.com.cn>

The getdelays had a compilation issue because the format string
was not updated when the "delay min" was added. For example,
after adding the "delay min" in printf, there were 7 strings
but only 6 "%s" format specifiers. Similarly, after adding
the 't->cpu_delay_total', there were 7 variables but only 
6 format characters specifiers, causing compilation issues
as follows. This commit fixes these issues to ensure that
getdelays compiles correctly.

root@xx:~/linux-next/tools/accounting$ make
getdelays.c:199:9: warning: format ‘%llu’ expects argument of type
‘long long unsigned int’, but argument 8 has type ‘char *’ [-Wformat=]
  199 |  printf("\n\nCPU   %15s%15s%15s%15s%15s%15s\n"
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.....
  216 |         "delay total", "delay average", "delay max", "delay min",
      |                                                      ~~~~~~~~~~~
      |                                                      |
      |                                                      char *
getdelays.c:200:21: note: format string is defined here
  200 |         "      %15llu%15llu%15llu%15llu%15.3fms%13.6fms\n"
      |                ~~~~~^
      |                     |
      |                     long long unsigned int
      |                %15s
getdelays.c:199:9: warning: format ‘%f’ expects argument of type
‘double’, but argument 12 has type ‘long long unsigned int’ [-Wformat=]
  199 |  printf("\n\nCPU   %15s%15s%15s%15s%15s%15s\n"
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.....
  220 |         (unsigned long long)t->cpu_delay_total,
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         |
      |         long long unsigned int
.....

Fixes: 0c3576943441 ("delayacct: add delay min to record delay peak")
Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
Signed-off-by: Kun Jiang <jiang.kun2@zte.com.cn>
Reviewed-by: xu xin <xu.xin16@zte.com.cn>
---
 tools/accounting/getdelays.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/accounting/getdelays.c b/tools/accounting/getdelays.c
index 100ad3dc091a..3feac0482fe9 100644
--- a/tools/accounting/getdelays.c
+++ b/tools/accounting/getdelays.c
@@ -196,22 +196,22 @@ static int get_family_id(int sd)

 static void print_delayacct(struct taskstats *t)
 {
-	printf("\n\nCPU   %15s%15s%15s%15s%15s%15s\n"
-	       "      %15llu%15llu%15llu%15llu%15.3fms%13.6fms\n"
-	       "IO    %15s%15s%15s%15s\n"
-	       "      %15llu%15llu%15.3fms%13.6fms\n"
-	       "SWAP  %15s%15s%15s%15s\n"
-	       "      %15llu%15llu%15.3fms%13.6fms\n"
-	       "RECLAIM  %12s%15s%15s%15s\n"
-	       "      %15llu%15llu%15.3fms%13.6fms\n"
-	       "THRASHING%12s%15s%15s%15s\n"
-	       "      %15llu%15llu%15.3fms%13.6fms\n"
-	       "COMPACT  %12s%15s%15s%15s\n"
-	       "      %15llu%15llu%15.3fms%13.6fms\n"
-	       "WPCOPY   %12s%15s%15s%15s\n"
-	       "      %15llu%15llu%15.3fms%13.6fms\n"
-	       "IRQ   %15s%15s%15s%15s\n"
-	       "      %15llu%15llu%15.3fms%13.6fms\n",
+	printf("\n\nCPU   %15s%15s%15s%15s%15s%15s%15s\n"
+	       "      %15llu%15llu%15llu%15llu%15.3fms%13.6fms%13.6fms\n"
+	       "IO    %15s%15s%15s%15s%15s\n"
+	       "      %15llu%15llu%15.3fms%13.6fms%13.6fms\n"
+	       "SWAP  %15s%15s%15s%15s%15s\n"
+	       "      %15llu%15llu%15.3fms%13.6fms%13.6fms\n"
+	       "RECLAIM  %12s%15s%15s%15s%15s\n"
+	       "      %15llu%15llu%15.3fms%13.6fms%13.6fms\n"
+	       "THRASHING%12s%15s%15s%15s%15s\n"
+	       "      %15llu%15llu%15.3fms%13.6fms%13.6fms\n"
+	       "COMPACT  %12s%15s%15s%15s%15s\n"
+	       "      %15llu%15llu%15.3fms%13.6fms%13.6fms\n"
+	       "WPCOPY   %12s%15s%15s%15s%15s\n"
+	       "      %15llu%15llu%15.3fms%13.6fms%13.6fms\n"
+	       "IRQ   %15s%15s%15s%15s%15s\n"
+	       "      %15llu%15llu%15.3fms%13.6fms%13.6fms\n",
 	       "count", "real total", "virtual total",
 	       "delay total", "delay average", "delay max", "delay min",
 	       (unsigned long long)t->cpu_count,
-- 
2.25.1
