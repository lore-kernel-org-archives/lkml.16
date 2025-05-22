Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE4119ABDE;
	Thu, 22 May 2025 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907260; cv=none; b=nYou9YFtdrtR2vIOHE/TLiSL8N2wwtIOXyFV/E+fEf5l5xUJ2CqvdOv3a5YrDruV0CfNLov9SrOQs+YLlbKA/rP/l4CNy0k3w67cBnQYjjp8L/9gqAb0vEZYq/PpFAOseFGx4BaE/0aXstNqiUrVdzE64QfqTn+mC/+xGfPOmIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907260; c=relaxed/simple;
	bh=Q/JtzSsynX2wUmCK1eEor5G/XtxF0d+v18cJ5Ise+c8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=LETHg81pEvr62CKM2LI6+SpvNwmRjWCFE4GYUaI3OtxFMlsl5VVlWT8bwdpnMxLrRF3gvlP4aSj9ChWbRjzxX60ri28eVjZ7Mu50aWVIeEsWSGOljWSnvHhoPpGkvCuDCMWRmTie+QhhCdoIefVRKIe5RtrzfTtbGuydBzkXdNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=MGX/qAUj reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="MGX/qAUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=UkSR7r/KpcJT49OPCs8Qy98yUDr2Bj0rxe+RJe/hqD0=; b=M
	GX/qAUjDTJgIUt2mcAIMmT6/3vBpiJSnPYHJWlw0PebKeO18qfPYACXADub4SZmm
	qUlntSYcmtF76KizoD906deKxvJ76WMLybu1ykQaHR8zeNti9nq3eTO1dc9jZhqP
	A5tEJ4sDdZQksUP8LN+xBFUKrAQ/d/EpLIzCKe+Xtc=
Received: from 00107082$163.com ( [111.35.189.95] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Thu, 22 May 2025 17:47:17 +0800
 (CST)
Date: Thu, 22 May 2025 17:47:17 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, mathias.nyman@intel.com,
	oneukum@suse.com, stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] USB: core: add a memory pool to urb caching
 host-controller private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <2025052257-expectant-macarena-69ee@gregkh>
References: <a235e322e270942dc3d607d4b46ff7db29abeb2d.1747897366.git.00107082@163.com>
 <2025052257-expectant-macarena-69ee@gregkh>
X-NTES-SC: AL_Qu2fBfWbuEoo4SOQYOkZnEYQheY4XMKyuPkg1YJXOp80siTL9w4MZm9zFkDN986wFQWhoAiIdylMx/1of7R9bZKdajeYGU2/DaUyEP9X97ij
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2ffd5bed.9108.196f763d60d.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgDnzwOm8i5oi8oKAA--.22741W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkBBVqmgu58u1pQACsH
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMDUtMjIgMTY6MzM6NDIsICJHcmVnIEtIIiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+IHdyb3RlOgo+T24gVGh1LCBNYXkgMjIsIDIwMjUgYXQgMDM6MDk6NDNQTSArMDgwMCwg
RGF2aWQgV2FuZyB3cm90ZToKPj4gRnJvbSBhbiBlbmQtdXNlcidzIHBlcnNwZWN0aXZlLCB0aGUg
cGVyZm9ybWFuY2UgZGlmZmVyZW5jZSB3aXRoIHRoaXMgY2hhbmdlCj4+IGlzIGluc2lnbmlmaWNh
bnQgd2hlbiBzeXN0ZW0gaXMgdW5kZXIgbm8gbWVtb3J5IHByZXNzdXJlLCBhbmQgd2hlbiB1bmRl
cgo+PiBoZWF2eSBtZW1vcnkgcHJlc3N1cmUuIFdoZW4gc3lzdGVtIGlzIHVuZGVyIGhlYXZ5IG1l
bW9yeSBwcmVzc3VyZSwKPj4gZXZlcnl0aGluZyBpcyBzbG93LiAgVGhlcmUgY291bGQgYmUgYSBw
b2ludCBpbi1iZXR3ZWVuIG5vIG1lbW9yeSBwcmVzc3VyZQo+PiBhbmQgaGVhdnkgbWVtb3J5IHBy
ZXNzdXJlIHdoZXJlIHRoZXNlIDFrKy9zIG1lbW9yeSBhbGxvY2F0aW9ucyB3b3VsZAo+PiBkb21p
bmF0ZSB0aGUgcGVyZm9ybWFuY2UsIGJ1dCB2ZXJ5IGhhcmQgdG8gcGlucG9pbnQgaXQuCj4KPkZv
ciB0aGlzIHJlYXNvbiBhbG9uZSBJIGNhbid0IHRha2UgdGhpcyBjaGFuZ2UsIHNvcnJ5LgoKU3Rp
bGwsIHJlYXNvbmFibGUgdG8gbWUuLi4uCj4KPkFsc28sIGFzIG90aGVycyBoYXZlIHN0YXRlZCwg
dGhpcyBjb3VsZCBiZSBkb25lIGluIHRoZSBoY2QgZHJpdmVycwo+dGhlbXNlbHZlcyBpZiB0aGV5
IHdhbnQgdG8sIG5vIG5lZWQgdG8gcHVzaCB0aGlzIGludG8gdGhlIHVzYiBjb3JlLgoKCj4KPnRo
YW5rcywKPgo+Z3JlZyBrLWgKCgpUaGFua3MgYWxsIHlvdSBndXlzIGZvciB0YWtpbmcgdGltZSBy
ZXZpZXdpbmcvZGlzY3Vzc2luZyB0aGlzLgoKRGF2aWQK
