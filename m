Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3695275855;
	Wed, 14 May 2025 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225812; cv=none; b=bjcUDXf4JXct0ZOb3Km2031I4t1JSj8DXAFsKBEMhKYsgTitZsgXDLaJM6xCeT5sUHZO2jbdEqhnj6cpfVTL/hatf0WNQ4obMn8d1jd9hat/Ww3u4HLmsorYNjd4cNhxFOvKA0CwFxvpMhBa/shS2YdoIs+9qiFJ2ufauJdI9b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225812; c=relaxed/simple;
	bh=tP9L5C1rvddbEnxd24vplfYVy2/tC/gIQexaA+xejZw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=sBYLghv08ftsZIcggBFkOrsdGEm5g5jlbJtLvDr4vbcdzj2/eTKA6Jve3OzyEd5YNgiMBdDfugYqQd+KNxYnlVMHRqEG950hB1DUzMJs/zbiBzgFcQwAwb/a5A12FjA13pWDcspvmVYwQ76iZx7kxWGHSkbj6EjOKgWcc3asWMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=HukT74WZ reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="HukT74WZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=gL2u/ROB3I3qIp0hFELWnUpvndH2DoBDZRYJJ5eJ9pg=; b=H
	ukT74WZ+2tsADoEtliKDQXVUzMKdpMKq8DVh8dUAOMxXXan2W1dOP3Zokq7yk1S9
	lzCoITf/jYaj2WIrcpAa8bfBTD5/ZaMqB8vPQNi2QDj9Ho1014ea103WE7ofmCEY
	qn7RD2kLwptd1oupgJ/Y2CKBvPmYMSSKmRYHFp7Rik=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-146 (Coremail) ; Wed, 14 May 2025 20:14:41 +0800
 (CST)
Date: Wed, 14 May 2025 20:14:41 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Oliver Neukum" <oneukum@suse.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <7419cfbc-1269-46fc-95b9-502e6fe23226@suse.com>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <51fe78fb-5d73-458f-b3d1-fc84cd6c5869@suse.com>
 <484fe5f7.9d28.196cea2c6db.Coremail.00107082@163.com>
 <7419cfbc-1269-46fc-95b9-502e6fe23226@suse.com>
X-NTES-SC: AL_Qu2fBf6Zu0Aj5yScZekZnEYQheY4XMKyuPkg1YJXOp80tCb8wgUaeXBjIGn77cOIKS2Svxeadh1H8uJQYYtJWbKDkJ09LockjeE16/gfbRha
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7542e47.9ea9.196ceb7e927.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kigvCgD3v7QyiSRoMIUEAA--.29610W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkBtNqmgkhOVIpwADst
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMDUtMTQgMjA6MDM6MDIsICJPbGl2ZXIgTmV1a3VtIiA8b25ldWt1bUBzdXNlLmNv
bT4gd3JvdGU6Cj4KPgo+T24gMTQuMDUuMjUgMTM6NTEsIERhdmlkIFdhbmcgd3JvdGU6Cj4gIAo+
PiBJIGFtIG5vdCBxdWl0ZSBzdXJlIGFib3V0IHRoZSBjb25jZXJuIGhlcmUsIGRvIHlvdSBtZWFu
IHNvbWVib2R5IGNyZWF0ZSBhIHVyYiwKPj4gYW5kIHRoZW4gdXNiX2luaXRfdXJiKCkgaGVyZSwg
YW5kIG5ldmVyIHVzZSB1cmJfZGVzdHJveSB0byByZWxlYXNlIGl0Pwo+Cj5ZZXMuCj4KPj4gCj4+
IFRoYXQgd291bGQgY2F1c2UgbWVtb3J5IGxlYWsgaWYgdXJiX2Rlc3Ryb3kgaXMgbm90IGNhbGxl
ZC4uLi4uLkJ1dCBpcyB0aGlzIHJlYWxseSBwb3NzaWJsZT8uCj4KPkkgdGhpbmsgYSBmZXcgZHJp
dmVycyB1bmRlciBkcml2ZXJzL21lZGlhIGRvIHNvLgoKVGhhdCB3b3VsZCBjYXVzZSByZWFsIHBy
b2JsZW0gaGVyZS4uLi4gSSB3aWxsICBrZWVwIHRoaXMgaW4gbWluZC4uLgooSXQgaXMgcmVhbGx5
IGEgYmFkIHBhdHRlcm4gdG8gaGF2ZSBvbmx5IGluaXQgZnVuY3Rpb24sIGl0IHNob3VsZCBiZSBw
YWlyZWQKd2l0aCBjb3JyZXNwb25kaW5nICJyZWxlYXNlIiB0byBjYW5jZWwgc2lkZS1lZmZlY3Rz
Li4uLi4uKQoKClRoYW5rc34KRGF2aWQKCgo+Cj4JUmVnYXJkcwo+CQlPbGl2ZXIK
