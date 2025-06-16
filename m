Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAFF1E89C;
	Mon, 16 Jun 2025 20:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750106794; cv=none; b=OQRJDs5nRb0jGoltB+IJdXpIDozzqMrnzr9+Pg6vob7S5LgXwLDf0nXYCshd03EjdZWZsKfVrrOr1luS1UyDY83/Ed8QEZQBe7zVjJ3XQXzBTZSEPCfmjHXDB7Nb4XkrN+oqgWPO8K270q158Ar7azLRrhgCM2RMXC+ECLPtv1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750106794; c=relaxed/simple;
	bh=eAyF1yEkPz/7b1iwDBdEM7HpOPPG+s3E1OAnGVTGLq4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=FTux6G4zA3CPz6SHPcv/yi0CtivEH2AfSHWndO1kuA/aALp+hgs4CxDF7NNAZlt7pKXjBYn8o6DbdJkevIIPbsL3AFBw7VCPZExTG4H+JEXoBx2uz9XVUrOalI9dWh7K02kuBdIA+3mNPf6f9rxE4YH479xA1V5vBxn7Bv0V9qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.150.136) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 16 Jun
 2025 23:30:59 +0300
Message-ID: <8809cfc6-6e49-4c9c-bc0e-8eb581478d11@omp.ru>
Date: Mon, 16 Jun 2025 23:30:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] usb: gadget: composite: fix possible kernel oops in
 composite_setup()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<linux-usb@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Fedor
 Pchelkin <pchelkin@ispras.ru>
References: <0e61b364-8f26-4f98-9f10-9b9800b1cd41@omp.ru>
Content-Language: en-US
Organization: Open Mobile Platform
In-Reply-To: <0e61b364-8f26-4f98-9f10-9b9800b1cd41@omp.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 06/16/2025 20:19:32
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 194079 [Jun 16 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 62 0.3.62
 e2af3448995f5f8a7fe71abf21bb23519d0f38c3
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.150.136 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.150.136 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.150.136
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/16/2025 20:20:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/16/2025 2:43:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 4/29/25 11:32 PM, Sergey Shtylyov wrote:

   Hm, 1.5 months passed and no reaction whatsoever... :-/

> list_first_entry() should never return NULL -- which makes Svace complain
> about the next *if* statement's condition being always false. What's worse,
> list_first_entry() won't work correctly when the list is empty -- in that
> case, passing config->descriptors[0] to memcpy() further below will cause
> dereferencing of a garbage pointer read from cdev->qw_sign[] and so (most
> probably) a kernel oops. Use list_first_entry_or_null() that returns NULL
> if the list is empty; fix the strange indentation below, while at it...
> 
> TTBOMK, this situation shouldn't happen with the current gadget drivers --
> however there's no guarantee that usb_add_config[_only]() is called by any
> gadget driver; and anyway, Svace's complaints would be silenced...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Fixes: 53e6242db8d6 ("usb: gadget: composite: add USB_DT_OTG request handling")
> Suggested-by: Fedor Pchelkin <pchelkin@ispras.ru>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> This patch is against the usb-linus branch of Greg KH's usb.git repo.
> 
>  drivers/usb/gadget/composite.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Index: usb/drivers/usb/gadget/composite.c
> ===================================================================
> --- usb.orig/drivers/usb/gadget/composite.c
> +++ usb/drivers/usb/gadget/composite.c
> @@ -1887,8 +1887,8 @@ composite_setup(struct usb_gadget *gadge
>  				if (cdev->config)
>  					config = cdev->config;
>  				else
> -					config = list_first_entry(
> -							&cdev->configs,
> +					config = list_first_entry_or_null(

   So we either need to do this...

> +						&cdev->configs,
>  						struct usb_configuration, list);
>  				if (!config)

   ... or this check needs to be removed.

>  					goto done;

   OK, I've tried (unsuccessfully!) reaching Greg on IRC, both privately and
on the OFTC's IRC channel #kernelnewbies -- and now I can't even connect to
irc.oftc.net:6697 for some reason. Thought I should try following up on the
linux-usb ML, just in case...
   So Greg, I'd still like to know: do you ignore all patches from .ru, all
patches from omp.ru or just all patches from me? :-)

MBR, Sergey
