Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51931C3BF7
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748238546; cv=none; b=D8R+LT//2jy23TTu3jDnhOsqDwzhqzmmjaajFwnP82rIlElFdTR8C69lqbCpH3yr2NS4WXF/whrUV+xnQhxlClj26vAlRAgizyr8eQfsUiiWr8PBLXFy2WwPg1i9LWb9bxUkBQhFv1FuvBFLAepayIz80jxfUXMkcjWtKk86igc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748238546; c=relaxed/simple;
	bh=k1E77LZzqWPACgRClxG/Iz/D1GERBH4o8Dtv6xv+TZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qjSRT+U6G+ugwHnPnnZhM+H9OI8JbC/F11ZDoM3TlPmLPcbMuD0TL+GYzYRV19Q0UgMAEYH4enPPJ3uELeA9M8dP41+wSZ8c8DI0T22AMghiX1Jv5xeH1xuywPORXyisB/rsAmUR5keQ5I/AXhWl1lOTBtfNAJah5bkUTMkvn+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=BRFd8EQ6; arc=none smtp.client-ip=99.78.197.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="BRFd8EQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1748238545; x=1779774545;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=k1E77LZzqWPACgRClxG/Iz/D1GERBH4o8Dtv6xv+TZw=;
  b=BRFd8EQ6987P/0f0RJyT1eD1MN6alwK6l56c5/KKVl3hQ+BLaCvTH0M5
   pc8af6KgcP+JfNu+MAX4/jvEAclKt4r1OD1DlKxVqYye5PkZjyPO+OAtN
   tSZKM5rkNnLOkSUv5e5fGqC0H4RZdwZJMd8ib5ggiGyRvPX9dwbAY2rNZ
   2Xg9YNHzpUsWQV+JsZODUM5SFLpyDMKUOnnr3H/T6kqAodLM0mUoaqNgg
   JLReSw/K3/4BesDydbWX2/gL6wLb4iuJzteeGemJNqSIpGeoY8mWsLTS2
   orkvr0nsJWoxmXNqvIsoSEwkieyVfTQLp3qLwZwKHKAk3JzUQjAdNMW51
   w==;
X-IronPort-AV: E=Sophos;i="6.15,315,1739836800"; 
   d="scan'208";a="53857290"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 05:49:04 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.38.20:11457]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.71:2525] with esmtp (Farcaster)
 id a05f7f2e-b313-4a0b-b7aa-85bc43f445bc; Mon, 26 May 2025 05:49:02 +0000 (UTC)
X-Farcaster-Flow-ID: a05f7f2e-b313-4a0b-b7aa-85bc43f445bc
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 26 May 2025 05:49:02 +0000
Received: from [0.0.0.0] (172.19.99.218) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Mon, 26 May 2025
 05:49:00 +0000
Message-ID: <e35d0f10-74d3-40c3-a43c-0e96edf3a121@amazon.com>
Date: Mon, 26 May 2025 07:48:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] kexec: Enable CMA based contiguous allocation
To: Baoquan He <bhe@redhat.com>
CC: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, <nh-open-source@amazon.com>, "Zhongkun
 He" <hezhongkun.hzk@bytedance.com>
References: <20250521152934.48841-1-graf@amazon.com> <aDPbWW1x1RhnJNza@fedora>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <aDPbWW1x1RhnJNza@fedora>
X-ClientProxiedBy: EX19D041UWB002.ant.amazon.com (10.13.139.179) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDI2LjA1LjI1IDA1OjA5LCBCYW9xdWFuIEhlIHdyb3RlOgo+IE9uIDA1LzIxLzI1IGF0IDAz
OjI5cG0sIEFsZXhhbmRlciBHcmFmIHdyb3RlOgo+PiBXaGVuIGJvb3RpbmcgYSBuZXcga2VybmVs
IHdpdGgga2V4ZWNfZmlsZSwgdGhlIGtlcm5lbCBwaWNrcyBhIHRhcmdldAo+PiBsb2NhdGlvbiB0
aGF0IHRoZSBrZXJuZWwgc2hvdWxkIGxpdmUgYXQsIHRoZW4gYWxsb2NhdGVzIHJhbmRvbSBwYWdl
cywKPj4gY2hlY2tzIHdoZXRoZXIgYW55IG9mIHRob3NlIHBhdGNoZXMgbWFnaWNhbGx5IGhhcHBl
bnMgdG8gY29pbmNpZGUgd2l0aAo+PiBhIHRhcmdldCBhZGRyZXNzIHJhbmdlIGFuZCBpZiBzbywg
dXNlcyB0aGVtIGZvciB0aGF0IHJhbmdlLgo+Pgo+PiBGb3IgZXZlcnkgcGFnZSBhbGxvY2F0ZWQg
dGhpcyB3YXksIGl0IHRoZW4gY3JlYXRlcyBhIHBhZ2UgbGlzdCB0aGF0IHRoZQo+PiByZWxvY2F0
aW9uIGNvZGUgLSBjb2RlIHRoYXQgZXhlY3V0ZXMgd2hpbGUgYWxsIENQVXMgYXJlIG9mZiBhbmQg
d2UgYXJlCj4+IGp1c3QgYWJvdXQgdG8ganVtcCBpbnRvIHRoZSBuZXcga2VybmVsIC0gY29waWVz
IHRvIHRoZWlyIGZpbmFsIG1lbW9yeQo+PiBsb2NhdGlvbi4gV2UgY2FuIG5vdCBwdXQgdGhlbSB0
aGVyZSBiZWZvcmUsIGJlY2F1c2UgY2hhbmNlcyBhcmUgcHJldHR5Cj4+IGdvb2QgdGhhdCBhdCBs
ZWFzdCBzb21lIHBhZ2UgaW4gdGhlIHRhcmdldCByYW5nZSBpcyBhbHJlYWR5IGluIHVzZSBieQo+
PiB0aGUgY3VycmVudGx5IHJ1bm5pbmcgTGludXggZW52aXJvbm1lbnQuIENvcHlpbmcgaXMgaGFw
cGVuaW5nIGZyb20gYQo+PiBzaW5nbGUgQ1BVIGF0IFJBTSByYXRlLCB3aGljaCB0YWtlcyBhcm91
bmQgNC01MCBtcyBwZXIgMTAwIE1pQi4KPj4KPj4gQWxsIG9mIHRoaXMgaXMgaW5lZmZpY2llbnQg
YW5kIGVycm9yIHByb25lLgo+Pgo+PiBUbyBzdWNjZXNzZnVsbHkga2V4ZWMsIHdlIG5lZWQgdG8g
cXVpZXNjZSBhbGwgZGV2aWNlcyBvZiB0aGUgb3V0Z29pbmcKPj4ga2VybmVsIHNvIHRoZXkgZG9u
J3Qgc2NyaWJibGUgb3ZlciB0aGUgbmV3IGtlcm5lbCdzIG1lbW9yeS4gV2UgaGF2ZSBzZWVuCj4+
IGNhc2VzIHdoZXJlIHRoYXQgZG9lcyBub3QgaGFwcGVuIHByb3Blcmx5ICgqY291Z2gqIEdJQyAq
Y291Z2gqKSBhbmQgaGVuY2UKPj4gdGhlIG5ldyBrZXJuZWwgd2FzIGNvcnJ1cHRlZC4gVGhpcyBz
dGFydGVkIGEgbW9udGggbG9uZyBqb3VybmV5IHRvIHJvb3QKPj4gY2F1c2UgZmFpbGluZyBrZXhl
Y3MgdG8gZXZlbnR1YWxseSBzZWUgbWVtb3J5IGNvcnJ1cHRpb24sIGJlY2F1c2UgdGhlIG5ldwo+
PiBrZXJuZWwgd2FzIGNvcnJ1cHRlZCBzZXZlcmVseSBlbm91Z2ggdGhhdCBpdCBjb3VsZCBub3Qg
ZW1pdCBvdXRwdXQgdG8KPj4gdGVsbCB1cyBhYm91dCB0aGUgZmFjdCB0aGF0IGl0IHdhcyBjb3Jy
dXB0ZWQuIEJ5IGFsbG9jYXRpbmcgbWVtb3J5IGZvciB0aGUKPj4gbmV4dCBrZXJuZWwgZnJvbSBh
IG1lbW9yeSByYW5nZSB0aGF0IGlzIGd1YXJhbnRlZWQgc2NyaWJibGluZyBmcmVlLCB3ZSBjYW4K
Pj4gYm9vdCB0aGUgbmV4dCBrZXJuZWwgdXAgdG8gYSBwb2ludCB3aGVyZSBpdCBpcyBhdCBsZWFz
dCBhYmxlIHRvIGRldGVjdAo+PiBjb3JydXB0aW9uIGFuZCBtYXliZSBldmVuIHN0b3AgaXQgYmVm
b3JlIGl0IGJlY29tZXMgc2V2ZXJlLiBUaGlzIGluY3JlYXNlcwo+PiB0aGUgY2hhbmNlIGZvciBz
dWNjZXNzZnVsIGtleGVjcy4KPj4KPj4gU2luY2Uga2V4ZWMgZ290IGludHJvZHVjZWQsIExpbnV4
IGhhcyBnYWluZWQgdGhlIENNQSBmcmFtZXdvcmsgd2hpY2gKPj4gY2FuIHBlcmZvcm0gcGh5c2lj
YWxseSBjb250aWd1b3VzIG1lbW9yeSBtYXBwaW5ncywgd2hpbGUga2VlcGluZyB0aGF0Cj4+IG1l
bW9yeSBhdmFpbGFibGUgZm9yIG1vdmFibGUgbWVtb3J5IHdoZW4gaXQgaXMgbm90IG5lZWRlZCBm
b3IgY29udGlndW91cwo+PiBhbGxvY2F0aW9ucy4gVGhlIGRlZmF1bHQgQ01BIGFsbG9jYXRvciBp
cyBmb3IgRE1BIGFsbG9jYXRpb25zLgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHMgbG9naWMgdG8gdGhl
IGtleGVjIGZpbGUgbG9hZGVyIHRvIGF0dGVtcHQgdG8gcGxhY2UgdGhlCj4+IHRhcmdldCBwYXls
b2FkIGF0IGEgbG9jYXRpb24gYWxsb2NhdGVkIGZyb20gQ01BLiBJZiBzdWNjZXNzZnVsLCBpdCB1
c2VzCj4+IHRoYXQgbWVtb3J5IHJhbmdlIGRpcmVjdGx5IGluc3RlYWQgb2YgY3JlYXRpbmcgY29w
eSBpbnN0cnVjdGlvbnMgZHVyaW5nCj4+IHRoZSBob3QgcGhhc2UuIFRvIGVuc3VyZSB0aGF0IHRo
ZXJlIGlzIGEgc2FmZXR5IG5ldCBpbiBjYXNlIGFueXRoaW5nIGdvZXMKPj4gd3Jvbmcgd2l0aCB0
aGUgQ01BIGFsbG9jYXRpb24sIGl0IGFsc28gYWRkcyBhIGZsYWcgZm9yIHVzZXIgc3BhY2UgdG8g
Zm9yY2UKPj4gZGlzYWJsZSBDTUEgYWxsb2NhdGlvbnMuCj4+Cj4+IFVzaW5nIENNQSBhbGxvY2F0
aW9ucyBoYXMgdHdvIGFkdmFudGFnZXM6Cj4+Cj4+ICAgIDEpIEZhc3RlciBieSA0LTUwIG1zIHBl
ciAxMDAgTWlCLiBUaGVyZSBpcyBubyBtb3JlIG5lZWQgdG8gY29weSBpbiB0aGUKPj4gICAgICAg
aG90IHBoYXNlLgo+IFdvbmRlcmluZyBhdCB3aGF0IHN0YWdlIHRoaXMgJ2ZhdGVyIGJ5IDQtNTBt
cyBwZXIgMTAwTUInIGlzIGdvdC4gVXN1YWxseQo+IGtlcm5lbCBpYW1nZSArIGluaXRyZCB3b24n
dCBiZSBtb3JlIHRoYW4gMTAwTUIsIGFuZCBpZiBzeXN0ZW0gaXMgcnVubmluZwo+IGFuZCBtZW1v
cnkgaXMgYWxsb2NhdGVkIGhlYXZpbHksIGtleGVjIGxvYWRpbmcgY291bGQgbWVldCBtaWdyYXRp
b24gaW4KPiBDTUEgYXJlYS4KCgpUaGlzIHBhdGNoIG9wdGltaXplcyB0aGUgaGFuZG92ZXIuIExv
YWRpbmcgdGhlIGtleGVjIGltYWdlIGlzIG5vdCByZWFsbHkgCnRpbWUgY3JpdGljYWw6IFlvdXIg
c3lzdGVtIHN0aWxsIGZ1bmN0aW9ucyB3aGlsZSB5b3UgcGVyZm9ybSBhIGtleGVjIApsb2FkLiBJ
dCdzIHRoZSB0aW1lIHdoZW4geW91IGRvIHRoZSBqdW1wIHRoYXQgeW91IHdhbnQgdG8gZG8gYXMg
bGl0dGxlIAphcyBwb3NzaWJsZSB3b3JrIGluIHRvIGFjY2VsZXJhdGUgYSBrZXhlYyBiYXNlZCB1
cGRhdGUgZmxvdy4KCgo+Cj4+ICAgIDIpIE1vcmUgcm9idXN0LiBFdmVuIGlmIGJ5IGFjY2lkZW50
IHNvbWUgcGFnZSBpcyBzdGlsbCBpbiB1c2UgZm9yIERNQSwKPj4gICAgICAgdGhlIG5ldyBrZXJu
ZWwgaW1hZ2Ugd2lsbCBiZSBzYWZlIGZyb20gdGhhdCBhY2Nlc3MgYmVjYXVzZSBpdCByZXNpZGVz
Cj4+ICAgICAgIGluIGEgbWVtb3J5IHJlZ2lvbiB0aGF0IGlzIGNvbnNpZGVyZWQgYWxsb2NhdGVk
IGluIHRoZSBvbGQga2VybmVsIGFuZAo+PiAgICAgICBoYXMgYSBjaGFuY2UgdG8gcmVpbml0aWFs
aXplIHRoYXQgY29tcG9uZW50Lgo+IFllYWgsIHRoaXMgaXMgdGhlIHNpZ25pZmljYW50IGJlbmVm
aXQgaW4gdmlldyBvZiBzb21lIGRyaXZlciBsYWNraW5nCj4gLnNodXRkb3duIGxpa2VseSBjb2xs
YXBzaW5nIGtleGVjIHJlYm9vdGVkIGtlcm5lbC4gVGhlIHRoaW5nIGlzIHN5c3RlbQo+IHdpdGgg
aGVhdmlseSBhbGxvY2F0aW5nIG1lbW9yeSBjb3VsZCBmYWlsIHRvIGFsbG9jYXRlIG1lbW9yeSBm
cm9tIENNQQo+IGR1ZSB0byBtaWdyYXRpb24gZmFpbHVyZSwgYW5kIHNvbWUgc3lzdGVtIG1heSBl
dmVuIG5vdCBoYXZlIENNQSBhcmVhLgoKCkNvcnJlY3QuIEluIHRob3NlIGNhc2VzLCB0aGUgbG9h
ZCBmYWxscyBiYWNrIHRvIHRoZSBjdXJyZW50IHNjaGVtZSBvZiAKYWxsb2NhdGluZyByYW5kb20g
bWVtb3J5LiBBbGwgd2UncmUgZG9pbmcgaGVyZSBpcyBzaGlmdCB0aGUgb2RkcyAtIGJvdGggCm9m
IGV4ZWN1dGluZyB0aGUga2V4ZWMgcXVpY2tlciBidXQgYWxzbyBvZiBsZXNzIG92ZXJsYXAgd2l0
aCBwb3RlbnRpYWxseSAKc3RpbGwgaW4gdXNlIHBhZ2VzLgoKCkFsZXgKCgoKCgpBbWF6b24gV2Vi
IFNlcnZpY2VzIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKVGFtYXJhLURhbnotU3Ry
LiAxMwoxMDI0MyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2Vy
LCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVy
ZyB1bnRlciBIUkIgMjU3NzY0IEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMzY1IDUzOCA1OTcK

