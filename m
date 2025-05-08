Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE89C78F32
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723531; cv=none; b=Wbpn49syJKKTVl3dlaVi19jNjDp3etf+pnTdb3rgu/OA6cbo/+u9jkQkcjXq/BERPlUeqpUANO8KO+IIX2USzxeFYq9kcewZGflZ395xqnE775VAGFVdD1C4ID0+bfdVG3Cnaa/3ZCIE3QF68pdXbSxhFKNdNTFCB74g2mX4lrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723531; c=relaxed/simple;
	bh=ZqobqM2vZzLH24+UX93I9LeszRIZIYFA7793dYmO/CU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=dmOxVBeX6AQJA6M99OEo5+9BW8hQ0fDott4hUe/jYZaYjkGPaS4hOVQJIOQ3bFah9J1tyBITVueubEBHXPyCOZD9GbPBL/KtZDpn3D5Fgb1UeP2pKziAnTOY2O8HP909fmULGUhKY5LnH86Y4wgVvmyT5TikZuQcOuhtuNbrLDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=adyKaEPq reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="adyKaEPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=PT2CjwBDQ9svHo3AvbdVjOmer8B6rAjjmSMUut87RVg=; b=a
	dyKaEPqqSURmVVxHuX+BTKWA/nm0xwv6R1YGPLvQH3BWjxPUqyZCM8IKWhUertfT
	sFu6VPDYbAbJa5dvbHW0OCFGptwP972MhVyVrayw+H5b4m9TDRZAei0z3HAvQ63C
	lZWNbB2JdmdaBKfc+pZ+Fg/0Z6xbDGUGhuVHcK9Ii8=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-103 (Coremail) ; Fri, 9 May 2025 00:58:25 +0800 (CST)
Date: Fri, 9 May 2025 00:58:25 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Kent Overstreet" <kent.overstreet@linux.dev>
Cc: "Suren Baghdasaryan" <surenb@google.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading
 allocinfo
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <is4valhxssgmj7cjdlp2gfvyivhdflu75vzzbkjeiyb47wom55@yx5lfwsptamg>
References: <a0ebf2e.b422.196abf97373.Coremail.00107082@163.com>
 <CAJuCfpFAUdqqvFPfe_OLR76c0bX_ngwG=JKC42pVB+WAeX4w0w@mail.gmail.com>
 <nubqzts4e6n3a5e7xljdsql7mxgzkobo7besgkfvnhn4thhxk3@reob3iac3psp>
 <289b58f1.352d.196addbf31d.Coremail.00107082@163.com>
 <y6egptcxlbzgboykjorh3syxwy4wu37eolmjtwuwu36gtbfhgf@o3o34qii4gmq>
 <1ed4c8f7.3e12.196adf621a2.Coremail.00107082@163.com>
 <52tsrapmkfywv4kkdpravtfmxkhxchyua4wttpugihld4iws3r@atfgtbd5wwhx>
 <e1cc19.5287.196ae733594.Coremail.00107082@163.com>
 <y6d7vzvii5wvfby5446ukpvdmulwd5lzcyki6rpxckh432d6jz@xwtlwnkhztuo>
 <7bf1ee37.b6a4.196b0b6dce1.Coremail.00107082@163.com>
 <is4valhxssgmj7cjdlp2gfvyivhdflu75vzzbkjeiyb47wom55@yx5lfwsptamg>
X-NTES-SC: AL_Qu2fBPuZvE0r4yCQbekXn0oTju85XMCzuv8j3YJeN500tSTu1xw5Zm9ZHnDfws6lOxmhoAi0Xj5Pz8ZQTIhae6/tH8iGZyaQgtWmOv20C0m/
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5294252d.b74a.196b0d583c6.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgDX3+my4hxoqQcAAA--.427W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hhHqmgcyMqBEAASsS
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMDUtMDkgMDA6MzQ6MjcsICJLZW50IE92ZXJzdHJlZXQiIDxrZW50Lm92ZXJzdHJl
ZXRAbGludXguZGV2PiB3cm90ZToKPk9uIEZyaSwgTWF5IDA5LCAyMDI1IGF0IDEyOjI0OjU2QU0g
KzA4MDAsIERhdmlkIFdhbmcgd3JvdGU6Cj4+IEF0IDIwMjUtMDUtMDggMjE6MzM6NTAsICJLZW50
IE92ZXJzdHJlZXQiIDxrZW50Lm92ZXJzdHJlZXRAbGludXguZGV2PiB3cm90ZToKPj4gPlRoZSBm
aXJzdCBxdWVzdGlvbiBpcyAtIGRvZXMgaXQgbWF0dGVyPyBJZiB0aGUgb3B0aW1pemF0aW9uIGlz
IGp1c3QgZm9yCj4+ID4vcHJvYy9hbGxvY2luZm8sIHdobydzIHJlYWRpbmcgaXQgYXQgYSBoaWdo
IGVub3VnaCByYXRlIHRoYXQgd2UgY2FyZT8KPj4gPgo+PiA+SWYgaXQncyBvbmx5IGJlaW5nIHVz
ZWQgaW50ZXJhY3RpdmVseSwgaXQgZG9lc24ndCBtYXR0ZXIuIElmIGl0J3MgYmVpbmcKPj4gPnJl
YWQgYXQgYSBoaWdoIHJhdGUgYnkgc29tZSBzb3J0IG9mIHByb2ZpbGluZyBwcm9ncmFtLCB3ZSdk
IHdhbnQgdG8gc2tpcAo+PiA+dGhlIHRleHQgaW50ZXJmYWNlIGVudGlyZWx5IGFuZCBhZGQgYW4g
aW9jdGwgdG8gcmVhZCB0aGUgZGF0YSBvdXQgaW4gYQo+PiA+YmluYXJ5IGZvcm1hdC4KPj4gLi4u
Xl9eLCBBY3R1YWxseSwgSSBoYXZlIGJlZW4gcnVubmluZyB0b29scyBwYXJzaW5nIC9wcm9jL2Fs
bG9jaW5mbyBldmVyeSA1IHNlY29uZHMKPj4gLGFuZCBmZWVkaW5nIGRhdGEgdG8gYSBwcm9tZXRo
ZXVzIHNlcnZlciBmb3IgYSBxdWl0ZSBsb25nIHdoaWxlLi4uCj4+IDUgc2Vjb25kcyBzZWVtcyBu
b3QgdGhhdCBmcmVxdWVudCwgYnV0IEkgYWxzbyBoYXZlIGFsbCBvdGhlciBwcm9jIGZpbGVzIHRv
IHJlYWQsIAo+PiBJIHdvdWxkIGxpa2Ugb3B0aW1pemF0aW9uIGZvciBhbGwgdGhlIHByb2MgZmls
ZXMuLi4uLi4KPj4gCj4+IElvY3RsIG9yIG90aGVyIGJpbmFyeSBpbnRlcmZhY2VzIGFyZSBpbmRl
ZWQgbW9yZSBlZmZpY2llbnQsIGJ1dCBtb3N0IGFyZQo+PiBub3Qgd2VsbCBkb2N1bWVudGVkLCB3
aGlsZSBtb3N0IHByb2MgZmlsZXMgYXJlIHNlbGYtZG9jdW1lbnRlZC4gSWYgcHJvYyBmaWxlcwo+
PiBhcmUgZWZmaWNpZW50IGVub3VnaCwgSSB0aGluayBJIHdvdWxkIHN0YXkgd2l0aCBwcm9jIGZp
bGVzIGV2ZW4gd2l0aCBhIGJpbmFyeQo+PiBpbnRlcmZhY2UgYWx0ZXJuYXRlIHRlbnMgb2YgZm9s
ZCBmYXN0ZXIuCj4KPlRoaXMgd291bGQgYmUgYSBwZXJmZWN0IHBsYWNlIGZvciBhIGJpbmFyeSBp
bnRlcmZhY2UsIHlvdSBqdXN0IHdhbnQgdG8KPnJldHVybiBhbiBhcnJheSBvZgo+Cj5zdHJ1Y3Qg
YWxsb2NhdGVkX2J5X2lwIHsKPgl1NjQJaXA7Cj4JdTY0CWJ5dGVzOwo+fTsKCgoKPgo+UHJpbnRp
bmcgaXQgaW4gdGV4dCBmb3JtIHJlcXVpcmVzIHN5bWJvbCB0YWJsZSBsb29rdXAsIHdoYXQgeW91
J3JlCj5vcHRpbWl6aW5nIGlzIG5vaXNlIGNvbXBhcmVkIHRvIHRoYXQgYW5kIHZzbnByaW50Zigp
LgoKT2gsIG5vLCB0aGlzIG9wdGltaXphdGlvbiBpcyBtb3N0bHkgYWNoaWV2ZWQgYnkgYXZvaWRp
bmcgaXRlciByZXdpbmRpbmcsIEkgdGhpbmsKSSB0YWxrIGFib3V0IHRoZSBleHRyYSBtZW1vcnkg
YWxsb2NhdGlvbiAidG9vIG11Y2giLi4uLgpUaGVzZSBsaW5lcyBvZiBjb2RlOgotCXdoaWxlICgo
Y3QgPSBjb2RldGFnX25leHRfY3QoJnByaXYtPml0ZXIpKSAhPSBOVUxMICYmIG5vZGUpCi0JCW5v
ZGUtLTsKaGF2ZSBhY2N1bXVsYXRlZCB3YXkgdG9vIG11Y2guClRoaW5rIGl0IHRoaXMgd2F5LCBh
ZHZhbmNpbmcgaXRlcmF0b3IgbiB0aW1lcyB0YWtlcyAxJSwgcmVhc29uYWJsZSBub2lzZQpjb21w
YXJlZCB0byAgc3ltYm9sIGxvb2t1cCBhbmQgcHJpbnRmKCkuIFRoZSBwcm9ibGVtIGlzIHNlcV9m
aWxlKCkgd291bGQKcmVzdGFydCBhYm91dCA4MCB0aW1lcyB0byByZWFkIG91dCBhbGwgY29udGVu
dCBvZiAvcHJvYy9hbGxvY2luZm8sIGFjY3VtdWxhdGVkCnRvIGEgdG90YWwgNDAqbiBpdGVyYXRv
ciBhZHZhbmNlbWVudCwgaGVuY2UgMSUgYmVjb21lIDQwKjElLCBub2lzZSBiZWNvbWUgc2lnbmlm
aWNhbnQuCgpNeSB0ZXN0IHJlc3VsdCBzaG93cyBhbiBpbXByb3ZlbWVudCBmcm9tIDdtcyB0byA0
bXM6CgpUaW1pbmdzIGJlZm9yZToKCSQgdGltZSBjYXQgL3Byb2MvYWxsb2NpbmZvICA+IC9kZXYv
bnVsbAoKCXJlYWwJMG0wLjAwN3MKCXVzZXIJMG0wLjAwMHMKCXN5cwkwbTAuMDA3cwpyZWFkLXN5
c2NhbGxzIGdldCBzbG93ZXIgYW5kIHNsb3dlcjoKCXJlYWQoMywgImFsbG9jaW5mbyAtIHZlcnNp
b246IDEuMFxuIyAgICAgPCIuLi4sIDEzMTA3MikgPSA0MDg1IDwwLjAwMDA2Mj4KCS4uLgoJcmVh
ZCgzLCAiICAgICAgICAgICAwICAgICAgICAwIGRyaXZlcnMvZ3AiLi4uLCAxMzEwNzIpID0gNDA0
NiA8MC4wMDAxMzU+CglyZWFkKDMsICIgICAgICAgICAgIDAgICAgICAgIDAgc291bmQvY29yZSIu
Li4sIDEzMTA3MikgPSA0MDIxIDwwLjAwMDE1MD4KCS4uLgoKYW5kIHdpdGggdGhlIGNoYW5nZToK
CSQgdGltZSBjYXQgL3Byb2MvYWxsb2NpbmZvICA+IC9kZXYvbnVsbAoKCXJlYWwJMG0wLjAwNHMK
CXVzZXIJMG0wLjAwMHMKCXN5cwkwbTAuMDAzcwoK
