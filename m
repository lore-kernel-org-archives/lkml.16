Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCA91B423C;
	Sat, 17 May 2025 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747473013; cv=none; b=iezZ2+mx4UCP7vdwxyOT681bTN0nX1ffI0NqDBgezG1ss6y3t3P1lfwXxCsx0cdefjbcz4xV4SDkC6mMv1kTM82GsJeIuGc3YIanqadxG9KOYHHf0tRNBQdlsYlIRs0ksjZPofDkp71KSgcBFF9FeVAiQs0Y5/XTGOyAkzzqbsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747473013; c=relaxed/simple;
	bh=/X2TOGVy41wIloM9iEcudrgU4bJ81DxeWPk/6lm+xIA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=A+OtnvTgKBKrSPEcMrcX93ZFw749huYL9TaLEi8MebpPLqH0hOqzdAbXV7St/qIwOGf+StZt+90w4R4RhExOAoKcSMvr3WQaPwjPxXRplNbq5//iTU2qLQw0uPukawQaAXJnJVn0f1P8PeIagzpb3VRHG2XbC5ZpoGtCWSvqO4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=YWflUEY7 reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="YWflUEY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=7JVIQBsQfGK9kOC6qJw77Cl4UupH51QrBZsx16GynDk=; b=Y
	WflUEY7ZsBfx5JCA4Ya9Q/ClV7HU+7ApAem2hineRThj8zH38RSs8bjQeBIR5uV2
	MvpiYCbCI5fwMpCZmkzdgmzPy3CkUGBrXyrxppeHP2ZqOc1K9zJePdb4HD5oGD+w
	Tkm866EVed51Jw59u7fdStekEOL6wqIfgfdHHiEotI=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-118 (Coremail) ; Sat, 17 May 2025 17:09:34 +0800
 (CST)
Date: Sat, 17 May 2025 17:09:34 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Oliver Neukum" <oneukum@suse.com>,
	"Greg KH" <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <d00a5238-90e7-4651-aaae-2919848be33b@suse.com>
References: <20250513113817.11962-1-00107082@163.com>
 <20250514064455.5488-1-00107082@163.com>
 <2025051405-glare-crazily-a9fa@gregkh>
 <d00a5238-90e7-4651-aaae-2919848be33b@suse.com>
X-NTES-SC: AL_Qu2fBficvUEs4iWRYOkXn0oTju85XMCzuv8j3YJeN500qCTp5i0rZ25sIEvQ0fmoFSSmoQmbWyhi+uN1ZJN5YJ65a+evgfq1KzBe38IqD3dI
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <274d13bb.2736.196dd818307.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:digvCgDnTzFPUihoUtUGAA--.43916W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqA5QqmgoQ9C8gAAHs0
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMDUtMTQgMTc6MzQ6MjEsICJPbGl2ZXIgTmV1a3VtIiA8b25ldWt1bUBzdXNlLmNv
bT4gd3JvdGU6Cj5PbiAxNC4wNS4yNSAwOToyOSwgR3JlZyBLSCB3cm90ZToKPiAgCj4+IE5vLCB0
aGlzIGlzbid0IG5lY2Vzc2FyaWx5IHRydWUgYXQgYWxsLiAgQWxsb2NhdGlvbnMgYXJlIGZhc3Qs
IGFuZCBpZiB3ZQo+PiBmcmVlL2FsbG9jYXRlIHRoaW5ncyBxdWlja2x5LCBpdCdzIGV2ZW4gZmFz
dGVyLiAgVVNCIGlzIGxpbWl0ZWQgYnkgdGhlCj4+IGhhcmR3YXJlIHRocm91Z2hwdXQsIHdoaWNo
IGlzIF92ZXJ5XyBzbG93IGNvbXBhcmVkIHRvIG1lbW9yeSBhY2Nlc3NlcyBvZgo+PiB0aGUgYWxs
b2NhdG9yLgo+Cj5JZiBhbmQgb25seSBpZiB3ZSBkbyBub3QgdHJpZ2dlciBkaXNrIElPLiBJZiB5
b3UgcmVhbGx5IHdhbnQgdG8gZ2l2ZSB0aGlzIHBhdGNoCj5hIGdvb2QgcGVyZm9ybWFuY2UgdGVz
dGluZyB5b3UnZCBoYXZlIHRvIGRvIGl0IHVuZGVyIG1lbW9yeSBwcmVzc3VyZS4KPgo+CVJlZ2Fy
ZHMKPgkJT2xpdmVyCgoKSGksIEkgbWFkZSBzb21lIHRlc3Q6CgpVc2luZyBGUFMgZm9yIHdlYmNh
bSBhbmQgYml0cmF0ZSBmb3IgYXVkaW8gbWljIGZvciBtZWFzdXJlbWVudC4KV2hlbiBzeXN0ZW0g
aXMgdW5kZXIgbm8gbWVtb3J5IHByZXNzdXJlLCBubyBzaWduaWZpY2FudCBkaWZmZXJlbmNlIGNv
dWxkIGJlIG9ic2VydmVkIHcvbyB0aGlzIHBhdGNoLgpXaGVuIHN5c3RlbSBpcyB1bmRlciBoZWF2
eSBtZW1vcnkgcHJlc3N1cmUsIGJpdHJhdGUgd291bGQgZHJvcCBmcm9tIH43NjAuM2tiaXRzL3Mg
dG8gfjUyNC4za2JpdHMvcywKYnV0IHRoaXMgcGF0Y2ggZG9zZSBub3QgbWFrZSBhbnkgc2lnbmlm
aWNhbnQgZGlmZmVyZW5jZSwgYml0cmF0ZSBkcm9wcyBhcmUgYWxtb3N0IHRoZSBzYW1lIHcvbyB0
aGlzLiAKV2hlbiB1bmRlciBoZWF2eSBtZW1vcnkgcHJlc3N1cmUsIG15IHdob2xlIHN5c3RlbSBn
ZXRzIHNsb3cuLi4uCgpCdXQgSSB0aGluaywgaW4gYmV0d2VlbiBubyBtZW1vcnkgcHJlc3N1cmUg
YW5kIGhlYXZ5IG1lbW9yeSBwcmVzc3VyZSwgdGhlcmUgd291bGQgYmUgYSBwb2ludCB3aGVyZQph
biBleHRyYSAxay9zIHdvdWxkIGtpY2sgc3RhcnQgYSBjaGFpbi1vZi1lZmZlY3QgbGFuZGluZyBh
IHZlcnkgYmFkIHBlcmZvcm1hbmNlLCBpdCBpcyBqdXN0IHZlcnkgaGFyZAp0byBwaW5wb2ludC4K
ClVzaW5nIG15IHdlYmNhbSB3b3VsZCBoYXZlIH4yNTAvcyBtZW1vcnkgYWxsb2NhdGlvbiByYXRl
LCBhbmQgbXkgbWljIH4xay9zLiBJIGFtIGltYWdpbmcgYSBzeXN0ZW0gd2l0aApzZXZlcmFsIHVz
YiB3ZWJjYW0vbWljIGNvbm5lY3RlZC4gVGhlcmUgd291bGQgYmUgeCoxay9zIGFsbG9jYXRpb24g
aWYgdGhvc2UgZGV2aWNlcyBhcmUgdXNlZAphdCB0aGUgc2FtZSB0aW1lLiAoTm90IHN1cmUgd2hl
dGhlciBhbGwgYWxsY3RhdGlvbiBjb3VsZCBiZSBhdm9pZGVkIHVuZGVyIGhlYXZ5IHVzYWdlIG9m
IHVzYiBkZXZpY2VzLApidXQgSSB0aGluayBnb29kIHBhcnQgb2YgdGhlIGFsbG9jYXRpb25zIGNh
biBiZSByZXVzZWQuKQoKU3RpbGwgdGhpbmsgdGhpcyBjaGFuZ2UgYmVuZWZpdHMgZXZlbiB3aXRo
b3V0IGEgc29saWQgZXZpZGVuY2UgeWV0LgooSSBoYXZlIHNlbmQgb3V0IGFub3RoZXIgdmVyc2lv
biBhZGRyZXNzaW5nIE9saXZlcidzIGNvbW1lbnRzIGFib3V0IHVyYiBtYW5hZ2VkIGJ5IGRyaXZl
cnMpCgoKVGhhbmtzCkRhdmlk
