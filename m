Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF551E51D;
	Tue, 13 May 2025 09:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129775; cv=none; b=d1MwQdVJO+k7c3RgLRmq/xKk97I9Fv6Jsstp9uJWFgusu+0gC6nNqwGo0haFAtLoQ5Np2GNHG/uHHcuZtuPkdugPQpCwdzNh+rThKhdJ69DgnREEyrBo81CB5eXOEK3xnXwUI+F12FxWpIZl2jehbzREGrnjJ3ePw8Ew/HMIOoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129775; c=relaxed/simple;
	bh=tDHaUyPFPsTXbPXqyTR203/WVin54neZUQNaYDsIqyM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=JRHPT1uuhdVxGrS87rjnLzr42PqR4QnQQJBftxiWgc59DixioKTSpDwyXgIewWTnCBetfIlvtCpBvGJI8SqL3LKAZWos61IhdWO/L7Z2tKqOimRbv9jjNGgmiEbomv55DM1+OoshUR2QDf9zP2jXIBsTb/St0tbMExBoUkhwlEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=n+ZI8hlH reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="n+ZI8hlH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=3GUQMII91S1WyO44PVIBc4fKDtpO1Qp2juoUMvZtpHg=; b=n
	+ZI8hlHkBNvTM+4FMvyIllO4JFzgJiEekMiYHWwwDHvhY/SqlGkWQx7/s76NPP59
	XpnHVax8RFCh/POkda9hn9cJdJ0oj5/iAR8X24KdydeN8lBsa9YpOZ0ZPM+P19KU
	UNYYxnzfKrBDWm6YAoBw4kr/cv+yqae9K9lyG3Wj5k=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-110 (Coremail) ; Tue, 13 May 2025 17:49:02 +0800
 (CST)
Date: Tue, 13 May 2025 17:49:02 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Oliver Neukum" <oneukum@suse.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu, surenb@google.com,
	kent.overstreet@linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] USB: core: add a memory pool to urb for
 host-controller private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <b07c7d9f-a20a-49bc-adbc-d43326b2d2df@suse.com>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513055447.5696-1-00107082@163.com>
 <48d5cae9-ff7c-4076-8b71-8c16bcf00443@suse.com>
 <4006cec4.794d.196c8be2fd1.Coremail.00107082@163.com>
 <b07c7d9f-a20a-49bc-adbc-d43326b2d2df@suse.com>
X-NTES-SC: AL_Qu2fBf2Ztk8v5CKcYukZnEYQheY4XMKyuPkg1YJXOp80vyTg8BgQZm9MAUHHws6uNDKhoAi0TT1A0eZkcIVZfqSIyg+KHZRdQ1+fSG2pOTmB
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <3dd5e698.921f.196c90c33af.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bigvCgDX36WOFSNoqXUDAA--.12715W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hVMqmgjDQV06AAGs4
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA1LTEzIDE2OjQ2OjM5LCAiT2xpdmVyIE5ldWt1bSIgPG9uZXVrdW1Ac3VzZS5j
b20+IHdyb3RlOgo+T24gMTMuMDUuMjUgMTA6MjMsIERhdmlkIFdhbmcgd3JvdGU6Cj4KPkhpLAo+
ICA+IFRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoaXMuICBUaGUgbWVtb3J5IGZsYWcgdGhpbmcgZG8g
cmFpc2UgY29uY2Vybi4KPj4gSSB0aGluayBJIGNhbiBtYWtlIGFkanVzdG1lbnQ6ICByZWFsbG9j
IHRoZSBtZW1vcnkgaWYgZmxhZyBjaGFuZ2VkLgo+Cj5JIGFtIHNvcnJ5LiBJIGhhdmUgYmVlbiB1
bmNsZWFyLiBIZXJlIGNvbWVzIGEgZGV0YWlsZWQgZXhwbGFuYXRpb246Cj4KPldoYXQgd2UgY2Fs
bCAiZ2ZwX3QiIGlzIGEgY29tYmluYXRpb24gb2YgZmxhZ3MuIFRoZXkgZGVzY3JpYmUKPgo+QSAt
IHRoZSB0eXBlIG9mIG1lbW9yeSAoYWx3YXlzIHZhbGlkKQo+QiAtIHRoZSB3YXkgdGhlIG1lbW9y
eSBjYW4gYmUgYWxsb2NhdGVkICh2YWxpZCBvbmx5IGF0IGEgc3BlY2lmaWMgdGltZSkKPgo+VGhl
IFVSQiBpcyBhIGdlbmVyaWMgZGF0YSBzdHJ1Y3R1cmUgdG8gYmUgcHJvY2Vzc2VkIGJ5IHRoZSBD
UFUsIF9ub3RfCj50aGUgSEMuIEl0IGlzIGFsd2F5cyBnZW5lcmljIGtlcm5lbCBtZW1vcnkuIEZs
YWdzIG9mIHR5cGUgQSBtYWtlIG5vIHNlbnNlCj50byBwYXNzLgo+SW4gZmFjdCB5b3UgbWF5IG5v
dCBrbm93IGZvciB3aGljaCBkZXZpY2UgYW4gVVJCIHdpbGwgYmUgdXNlZCB3aGVuIHlvdQo+YWxs
b2NhdGUgaXQuIFRoZSBvbmx5IHZhbGlkIG1lbV9mbGFncyB5b3UgY2FuIHBhc3MgdG8gdXNiX2Fs
bG9jX3VyYigpCj5hcmUgR0ZQX0tFUk5FTCwgR0ZQX05PSU8gb3IgR0ZQX0FUT01JQy4KPgo+SWYg
eW91IG5lZWQgdG8gcmVhbGxvY2F0ZSBtZW1vcnkgZm9yIHByaXZhdGUgZGF0YSB5b3UgX211c3Rf
IHVzZQo+dGhlIGZsYWdzIHBhc3NlZCB3aXRoIHVzYl9zdWJtaXRfdXJiKCkuIEEgSENEIGNhbiBt
b2RpZnkgdGhlbSBieSBhZGRpbmcKPmZsYWdzIG9mIHR5cGUgQSwgYnV0IHlvdSBjYW5ub3QgY2hh
bmdlIGZsYWdzIG9mIHR5cGUgQi4KPkZvciBleGFtcGxlLCBpZiB1c2JfYWxsb2NfdXJiKCkgdXNl
ZCBHRlBfS0VSTkVMIHRvIGFsbG9jYXRlIHRoZSBVUkIsCj5idXQgdXNlcyBHRlBfQVRPTUlDIGlu
IHVzYl9zdWJtaXRfdXJiKCksIHlvdSB3aWxsIGRlYWRsb2NrIGlmIHlvdSBzYXZlCj5hbmQgcmV1
c2UgdGhlIEdGUF9LRVJORUwuCj4KPglIVEgKPgkJT2xpdmVyCj4gIAoKSGksIEkgaGF2ZSBvbmUg
cXVlc3Rpb24gYWJvdXQgbWVtIGZsYWdzLgpJZiB1c2Jfc3VibWl0X3VyYiB3YW50cyBhIG1lbW9y
eSBpbiBjb250ZXh0IG9mIGZsYWdzIEEsIHNheSBHRlBfQVRPTUlDLCBidXQgSSBhbHJlYWR5IGhh
dmUgYSBtZW1vcnkgYWxsb2Mgd2l0aCAgZmxhZ3MgQiAgYW5kIGl0cyBzaXplCmlzIGJpZyBlbm91
Z2gsICBpcyBpdCBzYWZlIHRvIHJldHVybiB0aGlzIG1lbW9yeSAgdG8gdXNiX3N1Ym1pdF91cmIg
IHdoaWNoIGlzIGluIHRoZSBjb250ZXh0IG9mIGZsYWdzIEE/IAoKClRoYW5rcwpEYXZpZAo=
