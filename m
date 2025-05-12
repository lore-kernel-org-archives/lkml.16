Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8F6248F79;
	Mon, 12 May 2025 16:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066804; cv=none; b=fjop7WwurmszxYYibPweyUABwkW18Wy0sB2XY6C2XFA1FRbQuuNS/Ib1SCUBwQ41EO5czt/yGmKWCNtkrZ8xsI5tqhJtW2IfHF4bVTRdpScnLklXRMruKDA+455LoLNmYa8zcgcUfI6rk41xIId9L0ua4B1FT8M8R777TkaBfzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066804; c=relaxed/simple;
	bh=NuChRmRJy9IVedPiJWavOEaBj5M9HcNfhrt1sdSYEco=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=uAVeRt3ZA9v94IPEpFLBc3b+VybHKr5FoWdWAV8qNr0dmgugT0CGIVVsFKzV4+qXyhYiBDZY62UAntHRk73fEoCXLl6y2o3NANUsLr68u+th7nhOHrXYAgM4iiVfc4XE9gyEhpGNyTzwkc/BUAfLgt90Tmmjlvu/wxDmUPM+dhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=AnA2kpHq reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="AnA2kpHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=TiNJOGCkyvYGxXbi7iZSpB1qRZy/qZFJ87Ymv91xQ0c=; b=A
	nA2kpHqROpUa2VuOnZH+eGB6EanJZpoSEuMsGcG6VQkIj/BLo2Iwz759WEhRjSmT
	PnhFMJRIALrwHLLkorVm4ItHofaOm83kT40c6yp6zFYxuk8cRuBJxnWRCMlB7Qm3
	w2DOO1lhXdMHXWQVhfTxiRCCWE1Jub72tond0YVlOA=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Tue, 13 May 2025 00:19:22 +0800
 (CST)
Date: Tue, 13 May 2025 00:19:22 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Alan Stern" <stern@rowland.harvard.edu>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	surenb@google.com, kent.overstreet@linux.dev
Subject: Re: [RFC] USB: core/xhci: add a buffer in urb for host controller
 private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <7fd35044-3719-44c1-b4cf-89551e27da26@rowland.harvard.edu>
References: <20250512150724.4560-1-00107082@163.com>
 <7fd35044-3719-44c1-b4cf-89551e27da26@rowland.harvard.edu>
X-NTES-SC: AL_Qu2fBfyduU8t5CCdYekZnEYQheY4XMKyuPkg1YJXOp80siTf2Ck/W29vH1fHws6NJQOhoAiYbxlS0vZ2Zrtqb4kzNH95oMNdQIooLkROCHl+
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <8fb02f6.b8dd.196c54b3349.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgD330KLHyJoc5cCAA--.17769W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0h1LqmgiDjNFZwACs5
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA1LTEyIDIzOjM0OjQxLCAiQWxhbiBTdGVybiIgPHN0ZXJuQHJvd2xhbmQuaGFy
dmFyZC5lZHU+IHdyb3RlOgo+T24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgMTE6MDc6MjRQTSArMDgw
MCwgRGF2aWQgV2FuZyB3cm90ZToKPj4gLS0tCj4+IEkgd2FzIGNoZWNraW5nIG1lbW9yeSBhbGxv
Y2F0aW9uIGJlaGF2aW9ycyAodmlhIG1lbW9yeSBwcm9maWxpbmdbMV0pLAo+PiB3aGVuIEkgbm90
aWNlIGEgaGlnaCBmcmVxdWVudCBtZW1vcnkgYWxsb2NhdGlvbiBpbiB4aGNpX3VyYl9lbnF1ZXVl
LCBhYm91dAo+PiAyNTAvcyB3aGVuIHVzaW5nIGEgVVNCIHdlYmNhbS4gSWYgdGhvc2UgYWxsb2Nl
ZCBidWZmZXIgY291bGQgYmUga2VwdCBhbmQKPj4gcmV1c2VkLCBsb3RzIG9mIG1lbW9yeSBhbGxv
Y2F0aW9ucyBjb3VsZCBiZSBhdm9pZCBvdmVyIHRpbWUuCj4+IAo+PiBUaGlzIHBhdGNoIGlzIGp1
c3QgYSBQT0MsIGFib3V0IDAvcyBtZW1vcnkgYWxsb2NhdGlvbiBpbiB4aGNpIHdpdGggdGhpcwo+
PiBwYXRjaCwgd2hlbiBJIHVzZSBteSBVU0IgZGV2aWNlcywgd2ViY2FtL2tleWJvYXJkL21vdXNl
LiAKPj4gCj4+IEEgZHluYW1pYyBjYWNoZWQgbWVtb3J5IHdvdWxkIGJlIGJldHRlcjogVVJCIGtl
ZXAgaG9zdCBjb250cm9sbGVyJ3MKPj4gcHJpdmF0ZSBkYXRhLCBpZiBsYXJnZXIgc2l6ZSBidWZm
ZXIgbmVlZGVkIGZvciBwcml2YXRlIGRhdGEsIG9sZCBidWZmZXIKPj4gcmVsZWFzZWQgYW5kIGEg
bGFyZ2VyIGJ1ZmZlciBhbGxvY2VkLgo+Cj5UaGlzIHNvdW5kcyBsaWtlIGEgYmV0dGVyIGFwcHJv
YWNoOyB5b3Ugc2hvdWxkIHRyeSBpdC4gIEFsbG9jYXRpb25zIGFuZCAKPmRlbGxvY2F0aW9ucyBm
cm9tIGEgcHJpdmF0ZSBtZW1vcnkgcG9vbCBjYW4gYmUgcmVhbGx5IHF1aWNrLiAgQW5kIGl0IAo+
d291bGRuJ3Qgd2FzdGUgc3BhY2Ugb24gYnVmZmVycyBmb3IgVVJCcyB0aGF0IGRvbid0IG5lZWQg
dGhlbSAoZm9yIAo+ZXhhbXBsZSwgVVJCcyB1c2VkIHdpdGggb3RoZXIgaG9zdCBjb250cm9sbGVy
IGRyaXZlcnMpLgo+Cj5BbGFuIFN0ZXJuCgpUaGFua3MgZm9yIHRoZSBxdWljayBmZWVkYmFja34K
SSB3aWxsIHdvcmsgb24gaXQgYW5kIHVwZGF0ZSBsYXRlcn4KCkRhdmlkCg==
