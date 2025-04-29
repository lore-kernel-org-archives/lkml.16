Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF6C253B5F;
	Tue, 29 Apr 2025 20:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959685; cv=none; b=mITSBkKLZ/nVLZ/Xc0BiQAHQDxIdb/CnXVy4sVf6+oEJVfdMbNKU6jajOlIco/M12r6NaU0eKaCM1YEZl3KHBbP+QjZvgxuLvU4sW/DkI86v7PFUsMO54YK3R6II7SRK3wgrmv9QLxqXc66EjsRnh0yiXTIxaAuYoXrmd47cLK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959685; c=relaxed/simple;
	bh=3QG6bD1fHB8Qpdf5IMGGkVLMPiekodAvyL68jjwpSkQ=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=nRsEBPQPhV/9LpN2cFAVGFjc2eNQ0otABugvrvgXtFB/zaiz3Bl2pucarzlF8fqyAUYpALB6REh7gX70UoahB69yvzmvj6vjxFI/3Wp/Jd7N7Nu6TFQq9UP5F2KT9dd/N2OmAkpLR1cJczd+XSowrEjQGMoRDDk1qEBoMEDOKsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.130.43) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 29 Apr
 2025 23:32:37 +0300
Message-ID: <0e61b364-8f26-4f98-9f10-9b9800b1cd41@omp.ru>
Date: Tue, 29 Apr 2025 23:32:36 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<linux-usb@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Fedor
 Pchelkin <pchelkin@ispras.ru>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: gadget: composite: fix possible kernel oops in
 composite_setup()
Organization: Open Mobile Platform
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 04/29/2025 20:17:26
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 193027 [Apr 29 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 56 0.3.56
 52db7f275cc9b6820389ba9ab2ac225370e1c244
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.130.43
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/29/2025 20:19:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 4/29/2025 5:44:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

list_first_entry() should never return NULL -- which makes Svace complain
about the next *if* statement's condition being always false. What's worse,
list_first_entry() won't work correctly when the list is empty -- in that
case, passing config->descriptors[0] to memcpy() further below will cause
dereferencing of a garbage pointer read from cdev->qw_sign[] and so (most
probably) a kernel oops. Use list_first_entry_or_null() that returns NULL
if the list is empty; fix the strange indentation below, while at it...

TTBOMK, this situation shouldn't happen with the current gadget drivers --
however there's no guarantee that usb_add_config[_only]() is called by any
gadget driver; and anyway, Svace's complaints would be silenced...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: 53e6242db8d6 ("usb: gadget: composite: add USB_DT_OTG request handling")
Suggested-by: Fedor Pchelkin <pchelkin@ispras.ru>
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the usb-linus branch of Greg KH's usb.git repo.

 drivers/usb/gadget/composite.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: usb/drivers/usb/gadget/composite.c
===================================================================
--- usb.orig/drivers/usb/gadget/composite.c
+++ usb/drivers/usb/gadget/composite.c
@@ -1887,8 +1887,8 @@ composite_setup(struct usb_gadget *gadge
 				if (cdev->config)
 					config = cdev->config;
 				else
-					config = list_first_entry(
-							&cdev->configs,
+					config = list_first_entry_or_null(
+						&cdev->configs,
 						struct usb_configuration, list);
 				if (!config)
 					goto done;
