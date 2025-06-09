Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B2E280334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749452618; cv=none; b=XLEkSdi8JAj7aOSizQXNQqVaDCb+JEO1I7Ic2paG/hNveMh1cNF1DSAY2ghwVBbVJEeWbe/tv/9rDmdAEyWvhqIm88woOr7jz/cvq/VcaXMqRccuQPoqcqAfCt6QWiXnQRps8wW+slbtj6GkTDykEgQDGoVnSvd5PVe70VF/FNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749452618; c=relaxed/simple;
	bh=XcnfmvlhIF30BE7p6htpDEP/XNEkMJK0HdmXgaozwwg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=knG8qNzWy/06kSHN/gh44Byy1F+vLFrqTwsR3w430hN4jIQgrm9S8qzn+LcLbyBYRB3QuxEvpHT7/dB8EdsAA3TcaKXwLxiQicAuyoDD0uCD9yAvPo8qAS60w6kW1z/yW5KRkrm5mKt0/sLdUcmRcqR9y1UQX9BwNc6qBcs8gmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=mWXhB2gN; arc=none smtp.client-ip=52.119.213.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="mWXhB2gN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1749452616; x=1780988616;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=XcnfmvlhIF30BE7p6htpDEP/XNEkMJK0HdmXgaozwwg=;
  b=mWXhB2gNMowazGfxomp3FnhaJ0tdGwcvMd1ou6it13d6MUnmHBmEBPYG
   H4Z/Ho73J2KzvHsPP1jn4Rr2SsT+escTaJWauimd3A4mkNOi8QD6fRB/x
   VmXRjmnWQtiXksZ7i7SoH+Fi6JIHLDy0STIcxDA43I+s2Z4Yp7DFX5D1Z
   xJz/5cC1MykJe2e1ENEYAoJA9/R7ysd8OVUAN7QqJCZB8xDq+tcSx6K9s
   677fvl3p3DJjMwBVQgNpZi43QZZp/DzffyCcWsVqISRSY7uAEQZ+F6FIV
   SMzX7+tiUMNfbemvBgEaF9PRtKu1PqIozPY0tcipVJ2CtcrMNo+wJNAv+
   A==;
X-IronPort-AV: E=Sophos;i="6.16,221,1744070400"; 
   d="scan'208";a="753312924"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 07:03:16 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:37955]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.188:2525] with esmtp (Farcaster)
 id da5e9136-63b9-4140-819b-9bc25cba9392; Mon, 9 Jun 2025 07:03:14 +0000 (UTC)
X-Farcaster-Flow-ID: da5e9136-63b9-4140-819b-9bc25cba9392
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 9 Jun 2025 07:03:14 +0000
Received: from [0.0.0.0] (172.19.99.218) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Mon, 9 Jun 2025
 07:03:12 +0000
Message-ID: <f609d5a0-99d5-4328-8a18-00f6a9e1a48c@amazon.com>
Date: Mon, 9 Jun 2025 09:03:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] kexec: Enable CMA based contiguous allocation
From: Alexander Graf <graf@amazon.com>
To: <kexec@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, <nh-open-source@amazon.com>, Baoquan He
	<bhe@redhat.com>, Zhongkun He <hezhongkun.hzk@bytedance.com>, Andrew Morton
	<akpm@linux-foundation.org>
References: <20250521152934.48841-1-graf@amazon.com>
Content-Language: en-US
In-Reply-To: <20250521152934.48841-1-graf@amazon.com>
X-ClientProxiedBy: EX19D040UWB004.ant.amazon.com (10.13.138.91) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDIxLjA1LjI1IDE3OjI5LCBBbGV4YW5kZXIgR3JhZiB3cm90ZToKPiBXaGVuIGJvb3Rpbmcg
YSBuZXcga2VybmVsIHdpdGgga2V4ZWNfZmlsZSwgdGhlIGtlcm5lbCBwaWNrcyBhIHRhcmdldAo+
IGxvY2F0aW9uIHRoYXQgdGhlIGtlcm5lbCBzaG91bGQgbGl2ZSBhdCwgdGhlbiBhbGxvY2F0ZXMg
cmFuZG9tIHBhZ2VzLAo+IGNoZWNrcyB3aGV0aGVyIGFueSBvZiB0aG9zZSBwYXRjaGVzIG1hZ2lj
YWxseSBoYXBwZW5zIHRvIGNvaW5jaWRlIHdpdGgKPiBhIHRhcmdldCBhZGRyZXNzIHJhbmdlIGFu
ZCBpZiBzbywgdXNlcyB0aGVtIGZvciB0aGF0IHJhbmdlLgo+Cj4gRm9yIGV2ZXJ5IHBhZ2UgYWxs
b2NhdGVkIHRoaXMgd2F5LCBpdCB0aGVuIGNyZWF0ZXMgYSBwYWdlIGxpc3QgdGhhdCB0aGUKPiBy
ZWxvY2F0aW9uIGNvZGUgLSBjb2RlIHRoYXQgZXhlY3V0ZXMgd2hpbGUgYWxsIENQVXMgYXJlIG9m
ZiBhbmQgd2UgYXJlCj4ganVzdCBhYm91dCB0byBqdW1wIGludG8gdGhlIG5ldyBrZXJuZWwgLSBj
b3BpZXMgdG8gdGhlaXIgZmluYWwgbWVtb3J5Cj4gbG9jYXRpb24uIFdlIGNhbiBub3QgcHV0IHRo
ZW0gdGhlcmUgYmVmb3JlLCBiZWNhdXNlIGNoYW5jZXMgYXJlIHByZXR0eQo+IGdvb2QgdGhhdCBh
dCBsZWFzdCBzb21lIHBhZ2UgaW4gdGhlIHRhcmdldCByYW5nZSBpcyBhbHJlYWR5IGluIHVzZSBi
eQo+IHRoZSBjdXJyZW50bHkgcnVubmluZyBMaW51eCBlbnZpcm9ubWVudC4gQ29weWluZyBpcyBo
YXBwZW5pbmcgZnJvbSBhCj4gc2luZ2xlIENQVSBhdCBSQU0gcmF0ZSwgd2hpY2ggdGFrZXMgYXJv
dW5kIDQtNTAgbXMgcGVyIDEwMCBNaUIuCj4KPiBBbGwgb2YgdGhpcyBpcyBpbmVmZmljaWVudCBh
bmQgZXJyb3IgcHJvbmUuCj4KPiBUbyBzdWNjZXNzZnVsbHkga2V4ZWMsIHdlIG5lZWQgdG8gcXVp
ZXNjZSBhbGwgZGV2aWNlcyBvZiB0aGUgb3V0Z29pbmcKPiBrZXJuZWwgc28gdGhleSBkb24ndCBz
Y3JpYmJsZSBvdmVyIHRoZSBuZXcga2VybmVsJ3MgbWVtb3J5LiBXZSBoYXZlIHNlZW4KPiBjYXNl
cyB3aGVyZSB0aGF0IGRvZXMgbm90IGhhcHBlbiBwcm9wZXJseSAoKmNvdWdoKiBHSUMgKmNvdWdo
KikgYW5kIGhlbmNlCj4gdGhlIG5ldyBrZXJuZWwgd2FzIGNvcnJ1cHRlZC4gVGhpcyBzdGFydGVk
IGEgbW9udGggbG9uZyBqb3VybmV5IHRvIHJvb3QKPiBjYXVzZSBmYWlsaW5nIGtleGVjcyB0byBl
dmVudHVhbGx5IHNlZSBtZW1vcnkgY29ycnVwdGlvbiwgYmVjYXVzZSB0aGUgbmV3Cj4ga2VybmVs
IHdhcyBjb3JydXB0ZWQgc2V2ZXJlbHkgZW5vdWdoIHRoYXQgaXQgY291bGQgbm90IGVtaXQgb3V0
cHV0IHRvCj4gdGVsbCB1cyBhYm91dCB0aGUgZmFjdCB0aGF0IGl0IHdhcyBjb3JydXB0ZWQuIEJ5
IGFsbG9jYXRpbmcgbWVtb3J5IGZvciB0aGUKPiBuZXh0IGtlcm5lbCBmcm9tIGEgbWVtb3J5IHJh
bmdlIHRoYXQgaXMgZ3VhcmFudGVlZCBzY3JpYmJsaW5nIGZyZWUsIHdlIGNhbgo+IGJvb3QgdGhl
IG5leHQga2VybmVsIHVwIHRvIGEgcG9pbnQgd2hlcmUgaXQgaXMgYXQgbGVhc3QgYWJsZSB0byBk
ZXRlY3QKPiBjb3JydXB0aW9uIGFuZCBtYXliZSBldmVuIHN0b3AgaXQgYmVmb3JlIGl0IGJlY29t
ZXMgc2V2ZXJlLiBUaGlzIGluY3JlYXNlcwo+IHRoZSBjaGFuY2UgZm9yIHN1Y2Nlc3NmdWwga2V4
ZWNzLgo+Cj4gU2luY2Uga2V4ZWMgZ290IGludHJvZHVjZWQsIExpbnV4IGhhcyBnYWluZWQgdGhl
IENNQSBmcmFtZXdvcmsgd2hpY2gKPiBjYW4gcGVyZm9ybSBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMg
bWVtb3J5IG1hcHBpbmdzLCB3aGlsZSBrZWVwaW5nIHRoYXQKPiBtZW1vcnkgYXZhaWxhYmxlIGZv
ciBtb3ZhYmxlIG1lbW9yeSB3aGVuIGl0IGlzIG5vdCBuZWVkZWQgZm9yIGNvbnRpZ3VvdXMKPiBh
bGxvY2F0aW9ucy4gVGhlIGRlZmF1bHQgQ01BIGFsbG9jYXRvciBpcyBmb3IgRE1BIGFsbG9jYXRp
b25zLgo+Cj4gVGhpcyBwYXRjaCBhZGRzIGxvZ2ljIHRvIHRoZSBrZXhlYyBmaWxlIGxvYWRlciB0
byBhdHRlbXB0IHRvIHBsYWNlIHRoZQo+IHRhcmdldCBwYXlsb2FkIGF0IGEgbG9jYXRpb24gYWxs
b2NhdGVkIGZyb20gQ01BLiBJZiBzdWNjZXNzZnVsLCBpdCB1c2VzCj4gdGhhdCBtZW1vcnkgcmFu
Z2UgZGlyZWN0bHkgaW5zdGVhZCBvZiBjcmVhdGluZyBjb3B5IGluc3RydWN0aW9ucyBkdXJpbmcK
PiB0aGUgaG90IHBoYXNlLiBUbyBlbnN1cmUgdGhhdCB0aGVyZSBpcyBhIHNhZmV0eSBuZXQgaW4g
Y2FzZSBhbnl0aGluZyBnb2VzCj4gd3Jvbmcgd2l0aCB0aGUgQ01BIGFsbG9jYXRpb24sIGl0IGFs
c28gYWRkcyBhIGZsYWcgZm9yIHVzZXIgc3BhY2UgdG8gZm9yY2UKPiBkaXNhYmxlIENNQSBhbGxv
Y2F0aW9ucy4KPgo+IFVzaW5nIENNQSBhbGxvY2F0aW9ucyBoYXMgdHdvIGFkdmFudGFnZXM6Cj4K
PiAgICAxKSBGYXN0ZXIgYnkgNC01MCBtcyBwZXIgMTAwIE1pQi4gVGhlcmUgaXMgbm8gbW9yZSBu
ZWVkIHRvIGNvcHkgaW4gdGhlCj4gICAgICAgaG90IHBoYXNlLgo+ICAgIDIpIE1vcmUgcm9idXN0
LiBFdmVuIGlmIGJ5IGFjY2lkZW50IHNvbWUgcGFnZSBpcyBzdGlsbCBpbiB1c2UgZm9yIERNQSwK
PiAgICAgICB0aGUgbmV3IGtlcm5lbCBpbWFnZSB3aWxsIGJlIHNhZmUgZnJvbSB0aGF0IGFjY2Vz
cyBiZWNhdXNlIGl0IHJlc2lkZXMKPiAgICAgICBpbiBhIG1lbW9yeSByZWdpb24gdGhhdCBpcyBj
b25zaWRlcmVkIGFsbG9jYXRlZCBpbiB0aGUgb2xkIGtlcm5lbCBhbmQKPiAgICAgICBoYXMgYSBj
aGFuY2UgdG8gcmVpbml0aWFsaXplIHRoYXQgY29tcG9uZW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIEdyYWYgPGdyYWZAYW1hem9uLmNvbT4KCgpQaW5nPyBOb3Qgc2VlaW5nIHRoaXMg
cGF0Y2ggaW4gTGludXMnIG1hc3RlciB0cmVlIDopCgpBbGV4CgoKCgoKQW1hem9uIFdlYiBTZXJ2
aWNlcyBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJIClRhbWFyYS1EYW56LVN0ci4gMTMK
MTAyNDMgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9u
YXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50
ZXIgSFJCIDI1Nzc2NCBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDM2NSA1MzggNTk3Cg==

