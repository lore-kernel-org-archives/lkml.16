Received: from smtp-fw-9105.amazon.com (smtp-fw-9105.amazon.com [207.171.188.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5830424DCEE
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748337118; cv=none; b=L68BWjRN4rJNh46m2JD/FKyMzTLvZnQV81fN1BeacV8x8+m1hw0QGdmQ0uUxcZd5DjPfwaUrNpe+aSfwEOROyJt3MVh4J1kfHAqn3DbO9l6zLSTWz9y0KKr0u8flJmwD5DrEoEGzxa5ns+L8Yg3NIBxR6Cn6sFepisbqljf+mls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748337118; c=relaxed/simple;
	bh=Sbu2G5AagvgkHOH8QFHgDzpNrLvi/aeIVBS5N10oeUI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DfqscA7f94djuEOW9n4IBMzR115ZcW0J3auk2bPkNCQjmraSXQ8CffYmvQ9CxHljroVtTHheKMZDsIgBds43N56BkkO8qxjrbI4A4GWnvhb4LdgqmsemCAhgfxeJfQAU6JuKhfUeksJzAYFr/GTLHyQFdXLZOf+bpDNqpG3YMys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=t0ubonT7; arc=none smtp.client-ip=207.171.188.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="t0ubonT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1748337117; x=1779873117;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Sbu2G5AagvgkHOH8QFHgDzpNrLvi/aeIVBS5N10oeUI=;
  b=t0ubonT7gXmFAOl0z2f+yowelQmB8bgIOZT6TJ8lCfpxjRaRCkbB6KAm
   vp6h5ELRP/NjKEmlNnJsq727k/yUd57IuhTmq12R2RunS+h5pHRsc3zGk
   lxvaLbACTLLQpjSrPBTJ3HtgYQmjgyixDw6vvYqzpT2vaUaIJXarvhxON
   4yeM+bMGwhkRtcBt3hRucdwPXZJnkOzThfAoiDAEym6rOkMXaFzWPnm9r
   6xcoOa/YyKQDKq0mmCyNoWqQxgP4lYR0lGodclTkihJBydpn7oNQeA3xX
   jb0R54l5rHzWcuNzvBs+6BB4TKa7ghshjeNtZX0tbyRIcgGYjVspGL5Di
   g==;
X-IronPort-AV: E=Sophos;i="6.15,318,1739836800"; 
   d="scan'208";a="24023245"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9105.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:11:51 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:65357]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.194:2525] with esmtp (Farcaster)
 id b4f30fd8-23cc-4368-b344-f8ae71d7c325; Tue, 27 May 2025 09:11:51 +0000 (UTC)
X-Farcaster-Flow-ID: b4f30fd8-23cc-4368-b344-f8ae71d7c325
Received: from EX19D013UWB004.ant.amazon.com (10.13.138.62) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 27 May 2025 09:11:50 +0000
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19D013UWB004.ant.amazon.com (10.13.138.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 27 May 2025 09:11:50 +0000
Received: from EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d]) by
 EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d%3]) with mapi id
 15.02.1544.014; Tue, 27 May 2025 09:11:49 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>
CC: "Chocron, Jonathan" <jonnyc@amazon.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "mschmidt@redhat.com" <mschmidt@redhat.com>,
	"calvin@wbinvd.org" <calvin@wbinvd.org>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] pps: clients: gpio: fix interrupt handling order in
 remove path
Thread-Topic: [PATCH] pps: clients: gpio: fix interrupt handling order in
 remove path
Thread-Index: AdvO5qbf+gNlZMXWSO6O7YP4l+2Gqg==
Date: Tue, 27 May 2025 09:11:48 +0000
Message-ID: <d6358648c5b9420d8202bb9c23ac1824@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Pj4gQEAgLTIyOCw2ICsyMjgsNyBAQCBzdGF0aWMgdm9pZCBwcHNfZ3Bpb19yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAgew0KPj4gICAgICAgc3RydWN0IHBwc19ncGlv
X2RldmljZV9kYXRhICpkYXRhID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+Pg0KPj4g
KyAgICAgZnJlZV9pcnEoZGF0YS0+aXJxLCBkYXRhKTsNCj4NCj4gV2h5IG5vdCBqdXN0IHVzZSBk
ZXZtX2ZyZWVfaXJxKCk/DQoNCkFzIGZhciBhcyBJIHVuZGVyc3RhbmQsIHRoZSBtYWluIHB1cnBv
c2Ugb2YgZGV2bV8qKCkgaXMgdG8gcHJvdmlkZQ0KaGFuZHMtb2ZmIHJlc291cmNlIG1hbmFnZW1l
bnQuIGRldm1fcmVxdWVzdF9pcnEoKSBpcyBpbnRlbmRlZCB0bw0KZWxpbWluYXRlIHRoZSBuZWVk
IGZvciBleHBsaWNpdCBjbGVhbnVwIGluIHRoZSByZW1vdmUoKSBmdW5jdGlvbiBieQ0KYXV0b21h
dGljYWxseSBmcmVlaW5nIHRoZSBJUlEgYWZ0ZXIgcmVtb3ZlKCkgcmV0dXJucy4NCg0KSW4gbXkg
b3BpbmlvbiwgY2FsbGluZyBkZXZtX2ZyZWVfaXJxKCkgdW5kZXJtaW5lcyB0aGUgYmVuZWZpdCBv
ZiB1c2luZw0KZGV2bV9yZXF1ZXN0X2lycSgpIGluIHRoZSBmaXJzdCBwbGFjZS4gSWYgSSBuZWVk
IHRvIGV4cGxpY2l0bHkgZnJlZSB0aGUNCklSUSBkdXJpbmcgcmVtb3ZlKCksIHRoZW4gSeKAmW0g
bm8gbG9uZ2VyIHJlbHlpbmcgb24gZGV2beKAmXMgYXV0b21hdGljDQpjbGVhbnVwIC0gSeKAmW0g
ZWZmZWN0aXZlbHkgcmV2ZXJ0aW5nIHRvIG1hbnVhbCByZXNvdXJjZSBtYW5hZ2VtZW50IHdoaWxl
DQpzdGlsbCB1c2luZyBkZXZtLXN0eWxlIHJlZ2lzdHJhdGlvbiwgd2hpY2ggSSBmaW5kIHVubmVj
ZXNzYXJ5Lg0KDQpUaGF0IHNhaWQsIGlmIHlvdSBzdGlsbCBmYXZvciBkZXZtX2ZyZWVfaXJxKCks
IEnigJlsbCByZXZpc2UgdGhlIHBhdGNoDQphY2NvcmRpbmdseS4NCg0KUmVnYXJkcywgRWxpYXYN
Cg0KDQo=
