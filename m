Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519EB1F4C9D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782332; cv=none; b=mQ1J4T1BohB5lXtN2qkGn+aHPvX6OqyGT4WLR8IJBLKGzAr+6qYqAsY8rM/QreUxF9XSq3zYJKFCn/vje7Rj+eJKVgqCvz4DnhCEdi0W3z3zwqm6epQ7udaz6NdR2XcpOVHQp43oWdx1mTIYE0VVD8k4bhkEVwY5bMVEw7u244A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782332; c=relaxed/simple;
	bh=hPWgMTqoBA3G7qPvTb/wIs6TJofMudda6ovl5E3tato=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=p9zK9Gtd7xOmvtdM6ysuqhrnSmaPr1OeJn0bfsrhKD0mStb9dl7brQwfy8XDzuqIvX6pMqQnDciEf0lh/ZOp7IOJA0WA7GHxe3eicW+g36WJ4YDVvKwVbGMcvsjyc835G5MpHfplVwIdZ8m0QR6ccvNrWwOAuQwB/NP24u+M++o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=icUEij9g reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="icUEij9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=YTsbKWTYCKG/IzKP6ByjaRHK5LKm1VEeQJxr8iPN39s=; b=i
	cUEij9gVaKlyfTnRCNjYhBt0s0/fCVWeKWfDog1I4mD4NS6jA9YWk2qSUo8ubVNw
	6d6UMJZtIPVCyeTZJWGA1EcwGjAwIUNKmVx4VPjCSGTIJ+HBM4NufYym4fWWuFxt
	CmxBiN1lUjXppgetgs2T3JJsBmpCWTMwS2+yW78FH8=
Received: from xavier_qy$163.com ( [103.126.24.24] ) by
 ajax-webmail-wmsvr-40-140 (Coremail) ; Fri, 9 May 2025 17:17:47 +0800 (CST)
Date: Fri, 9 May 2025 17:17:47 +0800 (CST)
From: Xavier  <xavier_qy@163.com>
To: "David Hildenbrand" <david@redhat.com>
Cc: 21cnbao@gmail.com, ryan.roberts@arm.com, dev.jain@arm.com,
	ioworker0@gmail.com, akpm@linux-foundation.org,
	catalin.marinas@arm.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, willy@infradead.org, ziy@nvidia.com
Subject: Re:Re: [PATCH v4] arm64/mm: Optimize loop to reduce redundant
 operations of contpte_ptep_get
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <9ada79ec-f2b4-42bc-84f9-3f7b461ad829@redhat.com>
References: <CAGsJ_4xVFDioe4G9wtjfRCKZMLBu94GaFG1z5j0YrHs3j1PkAw@mail.gmail.com>
 <20250508070353.2370826-1-xavier_qy@163.com>
 <9ada79ec-f2b4-42bc-84f9-3f7b461ad829@redhat.com>
X-NTES-SC: AL_Qu2fBPuTvUot4SGaYOkfmkgWgus/WcW2u/Qj3IRSO5FwjB/o6ioBZXtMF2nw19+OOxmBrheYYTVKy/xaWZFUcrobURIGU0Tkr5sTVmfzWLRZjw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <29f1ebb9.8e60.196b45626fb.Coremail.xavier_qy@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:jCgvCgDnL_88yB1o3tEAAA--.7579W
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTR9IEGgdwSzvVwAAsq
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKQXQgMjAyNS0wNS0wOCAxNjozMDoxNCwgIkRhdmlkIEhpbGRlbmJyYW5kIiA8ZGF2aWRAcmVk
aGF0LmNvbT4gd3JvdGU6Cj5PbiAwOC4wNS4yNSAwOTowMywgWGF2aWVyIFhpYSB3cm90ZToKPj4g
VGhpcyBjb21taXQgb3B0aW1pemVzIHRoZSBjb250cHRlX3B0ZXBfZ2V0IGFuZCBjb250cHRlX3B0
ZXBfZ2V0X2xvY2tsZXNzCj4+IGZ1bmN0aW9uIGJ5IGFkZGluZyBlYXJseSB0ZXJtaW5hdGlvbiBs
b2dpYy4gSXQgY2hlY2tzIGlmIHRoZSBkaXJ0eSBhbmQKPj4geW91bmcgYml0cyBvZiBvcmlnX3B0
ZSBhcmUgYWxyZWFkeSBzZXQgYW5kIHNraXBzIHJlZHVuZGFudCBiaXQtc2V0dGluZwo+PiBvcGVy
YXRpb25zIGR1cmluZyB0aGUgbG9vcC4gVGhpcyByZWR1Y2VzIHVubmVjZXNzYXJ5IGl0ZXJhdGlv
bnMgYW5kCj4+IGltcHJvdmVzIHBlcmZvcm1hbmNlLgo+PiAKPj4gSW4gb3JkZXIgdG8gdmVyaWZ5
IHRoZSBvcHRpbWl6YXRpb24gcGVyZm9ybWFuY2UsIGEgdGVzdCBmdW5jdGlvbiBoYXMgYmVlbgo+
PiBkZXNpZ25lZC4gVGhlIGZ1bmN0aW9uJ3MgZXhlY3V0aW9uIHRpbWUgYW5kIGluc3RydWN0aW9u
IHN0YXRpc3RpY3MgaGF2ZQo+PiBiZWVuIHRyYWNlZCB1c2luZyBwZXJmLCBhbmQgdGhlIGZvbGxv
d2luZyBhcmUgdGhlIG9wZXJhdGlvbiByZXN1bHRzIG9uIGEKPj4gY2VydGFpbiBRdWFsY29tbSBt
b2JpbGUgcGhvbmUgY2hpcDoKPgo+Rm9yIHRoZSBmdXR1cmUsIHBsZWFzZSBkb24ndCBwb3N0IHZO
KzEgYXMgcmVwbHkgdG8gdk4uCgpJIHdpbGwgcGF5IGF0dGVudGlvbiB0byBpdCB3aGVuIEkgc3Vi
bWl0IGl0IGxhdGVyLiBUaGFuayB5b3UgZm9yIHRoZSByZW1pbmRlci4KCj4KPi0tIAo+Q2hlZXJz
LAo+Cj5EYXZpZCAvIGRoaWxkZW5iCgotLQpUaGFua3MsClhhdmllcgo=
