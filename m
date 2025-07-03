Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEBB1C68A6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 20:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575135; cv=none; b=cncsOWDQfDd/AI8//floKlUF6jj85oFF970ESY35SFVhnKJlfPD3d1yyYjativEmi0Xev1pPsnRmdA+WIIzQW4kWjAnjibB2Vgpu3mQuXzXP9+KSkEAK8N3kESj28+o2yq/3BIpSjh4Eyb487JFIlDDU8pdSjJVQYWYsGPaf6Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575135; c=relaxed/simple;
	bh=O22jJ756uJ9h6VYYK71IcPVEyi6yLYXlYehHBUf32sw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=EIJ1H8UYpEM90Sibcbp/9Eg9VT3R++nEhlcZE1QHa+63z/4Fdb03dIwM0w0z2yguSohj+S0K7RHvN4aUmz+XaOq4V3mIe4Efo2YWlVPJEJoRc0t8wrlEehSYvLEyLolCbKMA2vE/t79yE17hWo4hhCS5xtK6/GPaHdiDz8RWoQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.131.218) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 3 Jul
 2025 23:38:34 +0300
Message-ID: <62c63afc-5d56-46fc-aac4-87081498602d@omp.ru>
Date: Thu, 3 Jul 2025 23:38:33 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] firmware_loader: prevent integer overflow in
 firmware_loading_timeout()
Organization: Open Mobile Platform
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 07/03/2025 20:22:35
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 194550 [Jul 03 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 63 0.3.63
 9cc2b4b18bf16653fda093d2c494e542ac094a39
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.131.218 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.131.218
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/03/2025 20:24:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 7/3/2025 5:16:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

In firmware_loading_timeout(), *int* result of __firmware_loading_timeout()
multiplied by HZ might overflow before being implicitly cast to *long* when
being returned. Rewrite the function using check_mul_overflow() and capping
the result at LONG_MAX on actual overflow...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: stable@vger.kernel.org

---
The patch is against the commit 78f4e737a53e1163ded2687a922fce138aee73f5 in
Linus Torvalds' linux.git repo -- that's the most recent commit I could get
(git {fetch,pull} from git.kernel stopped working for me first with git://
and then with https:// protocol)...

 drivers/base/firmware_loader/fallback.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

Index: linux/drivers/base/firmware_loader/fallback.c
===================================================================
--- linux.orig/drivers/base/firmware_loader/fallback.c
+++ linux/drivers/base/firmware_loader/fallback.c
@@ -35,8 +35,13 @@ void fw_fallback_set_default_timeout(voi
 
 static long firmware_loading_timeout(void)
 {
-	return __firmware_loading_timeout() > 0 ?
-		__firmware_loading_timeout() * HZ : MAX_JIFFY_OFFSET;
+	long timeout;
+
+	if (__firmware_loading_timeout() <= 0)
+		return MAX_JIFFY_OFFSET;
+	if (check_mul_overflow(__firmware_loading_timeout(), HZ, &timeout))
+		return LONG_MAX;
+	return timeout;
 }
 
 static inline int fw_sysfs_wait_timeout(struct fw_priv *fw_priv,  long timeout)
