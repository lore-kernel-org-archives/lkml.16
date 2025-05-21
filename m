Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83984156F28
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841442; cv=none; b=G6WM5pPQmVLjBPZHMeq2d7qUkCkun0S0/kBB1hZtxG5THJxcZSsDTTnCsGc3Pvn1JTcRSziHXLxBEWGIxt9wf/Qem54nCR76nWRPiun5+RSJBXmO6cJJE0H7pYqjfWrVubOtCKZjqAMxHJ1ca71AJFmEVJ9z3lCHviJx1fevLY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841442; c=relaxed/simple;
	bh=nk8z5Gs5eLoZgW+Hc5Wq/7fT0NKPPcI5LGcc9H4Q4dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XAO+AHZ+outOr1YrJY0v2XGnTQbIX95cj1T85VGZxpShvFabPB8NsqA3Po4/ts3hRz311aNeXoQG7a8XUxlryT7z1o5SRb25APy5KY1H9cTJRxaDr79/95mWMmlmflT4AQ1br6usxIawDHBufxqKhp7wFltbbMarAglULRLuQQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=T6XWa/Bw; arc=none smtp.client-ip=99.78.197.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="T6XWa/Bw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1747841440; x=1779377440;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nk8z5Gs5eLoZgW+Hc5Wq/7fT0NKPPcI5LGcc9H4Q4dE=;
  b=T6XWa/BwlgtlvRvclMZ2qauGh/LUXoP4Q/fswOwUCIdID6bQ1crWBm84
   GoNomQqWR89aJgSsZVEAuVAKozU3nPGY4fVlhrRSJ4vdM8CFQBqYu4Nxj
   f7wEJJfkhrwtQjcFApvKIpZf8ZDsN9vhaW0aZIlzb4Dz4OeX4Br49nEHH
   3ppp3t9FEcKAMx9aRXFRcugh/QVCENPbsLBYh4kwkPY60s5XMxTGxBdwN
   +9yB0Q1JR37pgRarT1N8mT/Op/L6JFsoLXhAJuAxa02pnOzu0Gl6vlN1A
   1JbMCyPSJ7cdlEMOArOx3gVNXG3ZAdosIRbwRk6f6KWJ7etoCZM7rR6EF
   g==;
X-IronPort-AV: E=Sophos;i="6.15,303,1739836800"; 
   d="scan'208";a="199384302"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:30:38 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:50565]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.96:2525] with esmtp (Farcaster)
 id 20b6510f-c251-4956-8061-047d8f31a265; Wed, 21 May 2025 15:30:38 +0000 (UTC)
X-Farcaster-Flow-ID: 20b6510f-c251-4956-8061-047d8f31a265
Received: from EX19D020UWC003.ant.amazon.com (10.13.138.187) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 21 May 2025 15:30:36 +0000
Received: from [0.0.0.0] (172.19.99.218) by EX19D020UWC003.ant.amazon.com
 (10.13.138.187) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Wed, 21 May 2025
 15:30:34 +0000
Message-ID: <3e1ffd2e-b002-48b5-b41c-24787aa652e3@amazon.com>
Date: Wed, 21 May 2025 17:30:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kexec: Enable CMA based contiguous allocation
To: Baoquan He <bhe@redhat.com>, Zhongkun He <hezhongkun.hzk@bytedance.com>
CC: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Pasha Tatashin <pasha.tatashin@soleen.com>,
	<nh-open-source@amazon.com>
References: <20250513180229.7494-1-graf@amazon.com>
 <CACSyD1OU1zjvc2YdQpi-F_qZ0EWyb6jLNODJkRDPQa6m1eObJg@mail.gmail.com>
 <aC2rNv49pzy1Wh3D@MiWiFi-R3L-srv>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <aC2rNv49pzy1Wh3D@MiWiFi-R3L-srv>
X-ClientProxiedBy: EX19D035UWA004.ant.amazon.com (10.13.139.109) To
 EX19D020UWC003.ant.amazon.com (10.13.138.187)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDIxLjA1LjI1IDEyOjMwLCBCYW9xdWFuIEhlIHdyb3RlOgo+Cj4gT24gMDUvMjEvMjUgYXQg
MDM6NDdwbSwgWmhvbmdrdW4gSGUgd3JvdGU6Cj4+IE9uIFdlZCwgTWF5IDE0LCAyMDI1IGF0IDI6
NDDigK9BTSBBbGV4YW5kZXIgR3JhZiA8Z3JhZkBhbWF6b24uY29tPiB3cm90ZToKPiAuLi4uLi4K
Pj4+ICAgLyoqCj4+PiAgICAqIGtleGVjX2xvY2F0ZV9tZW1faG9sZSAtIGZpbmQgZnJlZSBtZW1v
cnkgZm9yIHRoZSBwdXJnYXRvcnkgb3IgdGhlIG5leHQga2VybmVsCj4+PiAgICAqIEBrYnVmOiAg
ICAgIFBhcmFtZXRlcnMgZm9yIHRoZSBtZW1vcnkgc2VhcmNoLgo+Pj4gQEAgLTY0OCw2ICs2ODQs
MTMgQEAgaW50IGtleGVjX2xvY2F0ZV9tZW1faG9sZShzdHJ1Y3Qga2V4ZWNfYnVmICprYnVmKQo+
Pj4gICAgICAgICAgaWYgKGtidWYtPm1lbSAhPSBLRVhFQ19CVUZfTUVNX1VOS05PV04pCj4+PiAg
ICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Pj4KPj4+ICsgICAgICAgLyoKPj4+ICsgICAgICAg
ICogVHJ5IHRvIGZpbmQgYSBmcmVlIHBoeXNpY2FsbHkgY29udGlndW91cyBibG9jayBvZiBtZW1v
cnkgZmlyc3QuIFdpdGggdGhhdCwgd2UKPj4+ICsgICAgICAgICogY2FuIGF2b2lkIGFueSBjb3B5
aW5nIGF0IGtleGVjIHRpbWUuCj4+PiArICAgICAgICAqLwo+Pj4gKyAgICAgICBpZiAoIWtleGVj
X2FsbG9jX2NvbnRpZyhrYnVmKSkKPj4+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4gSUlV
QywgVGhlIGtleGVjX2xvY2F0ZV9tZW1faG9sZSgpIGZ1bmN0aW9uIGlzIGFsc28gdXNlZCBpbgo+
PiB0aGUgS0VYRUNfVFlQRV9DUkFTSCBraW1hZ2UsIGJ1dCBrZXhlY19hbGxvY19jb250aWcoKSBk
b2VzIG5vdCBza2lwIGl0Lgo+PiBUaGlzIGNhbiBjYXVzZSBrZHVtcCB0byBmYWlsIGFuZCBsZWFk
IHRvIENNQSBtZW1vcnkgbGVha2FnZS4KPiBUaGF0IGlzIHRydWUgYW5kIGdvb2QgY2F0Y2gsIGFu
ZCBmaXggaXMgbmVlZGVkIHRvIHNraXAgY21hIGFsbG9jIGZvcgo+IGtkdW1wLgoKClRoYW5rcyBm
b3IgY2F0Y2hpbmcgdGhpcyEgSSBhZGRlZCBhIGNoZWNrIHRvIGVuc3VyZSB3ZSBkb24ndCB1c2Ug
dGhlIENNQSAKbG9naWMgd2l0aCBjcmFzaCBrZXJuZWxzIGluIHY0IGFuZCBwb3N0ZWQgaXQuCgoK
QWxleAoKCgoKCkFtYXpvbiBXZWIgU2VydmljZXMgRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkg
R21iSApUYW1hcmEtRGFuei1TdHIuIDEzCjEwMjQzIEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6
IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNn
ZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAyNTc3NjQgQgpTaXR6OiBCZXJsaW4KVXN0
LUlEOiBERSAzNjUgNTM4IDU5Nwo=

