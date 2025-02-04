Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A109E219A8E
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 22:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738708760; cv=none; b=bA4+I7BcyZzLhmWZtDKET66Ke+gIhG1KzMr+ESnPd+QuHV3MC+6tJw01DD3nOXbdwH7q8GWeoKa+wRDqAAMlMFmj5fX8hFh349/VpOGEYSGymHKIXit/CqGRoExdSiqoZeNJyM0skCd9vh+i5kvXkKU7P6BWfcSc7e6Lcr6hCpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738708760; c=relaxed/simple;
	bh=dDVOJ2j5AtwvawZr0lHF6QYx6xkJXIS2UKMP1pWaCGQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ft3wsv8LWwOclhTs6MIUuoosoE1fpLYNxOAyMhWSzf5nU7n98PNaT3IMel9Yz0fMWLwFGmWyuBetFyf4+XXWKTL/eczXhqTv6SVFPgNNpOQcgWnhO9O211zGRmNcuEztDCCGH6+0FsOTrpiX2cDZZaN8u2ZHnO+2m5JdfhqIXqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=MYw09Q5N; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="MYw09Q5N"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A77D42C0612;
	Wed,  5 Feb 2025 11:39:10 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738708750;
	bh=dDVOJ2j5AtwvawZr0lHF6QYx6xkJXIS2UKMP1pWaCGQ=;
	h=From:To:CC:Subject:Date:From;
	b=MYw09Q5N+oGQXmlp69OsstsLt8qkxsuaisglqU0GZKWmFw5nCIbVyyBVD8/gF1SHs
	 FkN1qVh4Y1cLRDtRgl8h7jgqNfzZfhh+TCIluBJSx0MEmS8zezWE2tc9US4ChLdp78
	 OEdi/MzeOhiKSBxsyxjbpDJXGYxGbTbuloXPMVxgnQxWPiWKQPc3ydb++9BGDsO/Wf
	 LYoAuITNNuJJcWqEyRWkDwEIwm3thI24Am+dkgXrKNwrKymAPCqRmBd7nafHMJzBtf
	 HbL2gSvRkxC32OKGwbOWAzrJlvbfpcAtXN0iD2xOhcopFcsh+cKrHoVdyDt6beBhNh
	 EN9h/arj5Gbrg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a2970e0000>; Wed, 05 Feb 2025 11:39:10 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Feb 2025 11:39:10 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Wed, 5 Feb 2025 11:39:10 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzk@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, "lee@kernel.org"
	<lee@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Sorting out the RTL9300 dt-bindings
Thread-Topic: Sorting out the RTL9300 dt-bindings
Thread-Index: AQHbd1Wb35JWhYQ4OEu8JThjbWekTw==
Date: Tue, 4 Feb 2025 22:39:10 +0000
Message-ID: <4e3c5d83-d215-4eff-bf02-6d420592df8f@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <88152B4E8AE41C4C8E17FFA379529E4F@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a2970e a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=aHxjIiu6NN9s3de2LD0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGksDQoNCkFzIEtyenlzenRvZiBwb2ludHMgb3V0IGluIFsxXSBJIHNlZW0gdG8gaGF2ZSBtYWRl
IGEgYml0IG9mIGEgbWVzcyB3aXRoIA0KdGhlIG1mZCBiaW5kaW5nIGZvciB0aGUgUlRMOTMwMCBF
dGhlcm5ldCBzd2l0Y2ggd2l0aCBpbnRlZ3JhdGVkIENQVS4gSSdtIA0Kc3Bpbm5pbmcgdXAgdGhp
cyBlbWFpbCB0aHJlYWQgc2VwYXJhdGVseSBzbyBhcyBub3QgdG8gdW5uZWNlc3NhcmlseSBzcGFt
IA0KdGhlIG5ldGRldiBmb2xrcyBhbmQgdG8gbWF5YmUgYXBwZWFzZSBnb29nbGUgc28gaXQgZG9l
c24ndCBhdXRvbWF0aWNhbGx5IA0KZ2V0IGZsYWdnZWQgYXMganVuay4NCg0KRmlyc3Qgb2ZmIHNv
cnJ5IGZvciBub3QgcHJvdmlkaW5nIGEgbW9yZSBjb21wbGV0ZSBiaW5kaW5nIGluaXRpYWxseSwg
DQpLcnp5c3p0b2Ygc3VnZ2VzdGVkIGRvaW5nIHNvIGEgZmV3IHRpbWVzIGJ1dCBJIHdhcyBjb25j
ZW50cmF0aW5nIG9uIA0KbGFuZGluZyB0aGUgZHJpdmVycy4NCg0KVGhlIFJUTDkzMDAgaGFzIHRo
ZXNlIGJhc2ljIGJsb2NrczoNCi0gcnRsOTMwMA0KIMKgIHwtIGNwdUAwIC0gbWlwczM0a2MNCiDC
oCB8LSBzb2NAMTgwMDAwMDANCiDCoMKgwqAgfC0gaW50Yw0KIMKgwqDCoCB8LSBzcGktbm9yDQog
wqDCoMKgIHwtIHNwaS1uYW5kDQogwqDCoMKgIHwtIHRpbWVyDQogwqDCoMKgIHwtIGdwaW8NCiDC
oMKgwqAgYC0gdWFydA0KIMKgIGAtIHN3aXRjaEAxYjAwMDAwMA0KIMKgIMKgwqAgfC0gZXRoZXJu
ZXQtcG9ydHMNCiDCoMKgwqDCoCB8LSBtZGlvDQogwqDCoMKgwqAgfC0gaTJjDQogwqDCoMKgwqAg
fC0gcmVzZXQNCiDCoMKgwqDCoCBgLSBsZWQvZ3Bpbw0KDQpUaGUgQ1BVL3NvYyBjYW4gYmUgZGlz
YWJsZWQgYW5kIHRoZSBzd2l0Y2ggbWFuYWdlZCBieSBhbiBleHRlcm5hbCBDUFUgDQoocmVnaXN0
ZXIgYWNjZXNzIG92ZXIgU1BJIEkgdGhpbmssIHRoZSBkb2NzIGFyZSBhIGJpdCB2YWd1ZSkuDQoN
CkkgdGhpbmsgSSBwcm9iYWJseSBpbmZlcnJlZCB0b28gbXVjaCBmcm9tIG1mZC9tc2NjLG9jZWxv
dC55YW1sIHdoZW4gSSANCmNyZWF0ZWQgbWZkL3JlYWx0ZWsscnRsOTMwMS1zd2l0Y2gueWFtbC4N
Cg0KSSBzdGlsbCB0aGluayB0aGUgc3dpdGNoQDFiMDAwMDAwIG5lZWRzIHRvIGJlICJzeXNjb24i
LCAic2ltcGxlLW1mZCIgYXMgDQp0aGF0J3MgaG93IHRoZSByZXNldCBhbmQgaTJjIGJsb2NrcyB3
b3JrIGFuZCB0aGV5J3JlIHByZXR0eSBpbmRlcGVuZGVudCANCm9mIGV2ZXJ5dGhpbmcgZWxzZS4N
Cg0KSSd2ZSBjdXJyZW50bHkgZGVzY3JpYmVkIHRoZSBtZGlvIGludGVyZmFjZSBhcyBhIGRldmlj
ZSBvbiBhIHNpbXBsZSBidXMgDQphbHRob3VnaCBpdCBjb3VsZCBqdXN0IGJlIGhhbmRsZWQgYXMg
YSBkZXNjZW5kYW50IG9mIHRoZSBzd2l0Y2ggYmxvY2sgDQp0aGF0IGEgZHJpdmVyIGxvb2tzIHVw
IGFzIGEgY2hpbGQgbm9kZSAoSSd2ZSB0cmllZCB0byBrZWVwIHRoZSBtZGlvIA0KZHJpdmVyIGlu
ZGVwZW5kZW50IGZvciBub3cgYnV0IHRoYXQncyBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwpLiBJ
dCBkb2VzIA0KbmVlZCB0byByZWFjaCBvdXQgdG8gdGhlIGV0aGVybmV0LXBvcnRzIHRvIGZpZ3Vy
ZSBvdXQgdGhlIG1hcHBpbmcgb2YgDQpwb3J0IHRvIHBoeSBzbyBpdCBpc24ndCBpbmRlcGVuZGVu
dC4NCg0KSSBzZWUgYSBjb3VwbGUgb2YgcGF0aHMgZm9yd2FyZA0KLSBrZWVwIGFkZGluZyB0aGUg
c3dpdGNoIHN0dWZmIHRvIHRoZSBtZmQvcmVhbHRlayxydGw5MzAxLXN3aXRjaC55YW1sDQotIG1v
dmUgbWZkL3JlYWx0ZWsscnRsOTMwMS1zd2l0Y2gueWFtbCB0byBuZXQvcmVhbHRlayxydGw5MzAx
LXN3aXRjaC55YW1sDQotIGtlZXAgbWZkL3JlYWx0ZWsscnRsOTMwMS1zd2l0Y2gueWFtbCB3aXRo
IHRoZSBpMmMgYW5kIHJlYm9vdCBidXQgaGF2ZSANCmEgJHJlZiB0byBhIG5ldyBiaW5kaW5nIHVu
ZGVyIG5ldC8gKG5vdCBzdXJlIHdoYXQgdGhhdCdkIGxvb2sgbGlrZSkuDQoNClRoZXJlJ3Mgb25s
eSBvbmUgaW4tdHJlZSB1c2VyIG9mIHRoaXMgc28gSSBkb24ndCB0aGluayB3ZSBuZWVkIHRvIGJl
IHRvbyANCmNvbmNlcm5lZCBhYm91dCBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eS4gRG93bnN0cmVh
bSBvcGVud3J0IGhhbmRsZXMgDQp0aGVzZSBkZXZpY2VzIHdheSBkaWZmZXJlbnRseSBhbHJlYWR5
Lg0KDQpUaGFua3MsDQpDaHJpcw0KDQotLQ0KDQpbMV0gLSANCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvMjAyNTAyMDQtZWNjZW50cmljLWRlZXItb2YtZmVsaWNpdHktMDJiN2VlQGtyemst
YmluLw0K
