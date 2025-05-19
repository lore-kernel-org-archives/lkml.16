Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A76626980F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665179; cv=none; b=lZQ1BQcTuCOuhIc/8gju79XDxKHRCOL1IJ5JdN4K2O6bIcuMkV47LnTHPwXzuqV0RY+usfmEOX2z+wCbrqfk3rukdNBZpy8q/ufinPc2SlonEM2L5MWUQfIVXOShbWLMCavBJS6jxRCXsQlrQ3lwbVJ9Cb9d00h28JwUMgaxJnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665179; c=relaxed/simple;
	bh=o/B6j6wUNx1mhhRqreU2D3A8Pr+4PiNSORFTlVKGai4=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=OqX2qwfzFierZtBVIvERretrelVO8vB0anwsV8ewqPRLGekUWLhLxe4J1QShe5bQdzvVCxRPP8KsSlDwnDkE+5qO/8R/+E0iL8WRXWZXE0JNWXXf2hyR/AUXc7KObgltmG+m6X+uTa4WprENJlGjQZPnrZJMZeT54tdEwnJWfNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4b1Ksc0wpFz5B1Jb;
	Mon, 19 May 2025 22:32:52 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 54JEWdEI047770;
	Mon, 19 May 2025 22:32:39 +0800 (+08)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp04[null])
	by mapi (Zmail) with MAPI id mid14;
	Mon, 19 May 2025 22:32:44 +0800 (CST)
Date: Mon, 19 May 2025 22:32:44 +0800 (CST)
X-Zmail-TransId: 2b06682b410cffffffffa61-40a8a
X-Mailer: Zmail v1.0
Message-ID: <20250519223244317Gbg_lRkV5N9i15dnPMo63@zte.com.cn>
In-Reply-To: <202505192131489882NSciXV4EGd8zzjLuwoOK@zte.com.cn>
References: 202505192131489882NSciXV4EGd8zzjLuwoOK@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <jiang.kun2@zte.com.cn>, <wang.yaxin@zte.com.cn>
Cc: <akpm@linux-foundation.org>, <xu.xin16@zte.com.cn>, <bbonev@devuan.org>,
        <linux-kernel@vger.kernel.org>, <bsingharora@gmail.com>,
        <jiang.kun2@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBsaW51eCBuZXh0IHYyXSB0YXNrc3RhdHM6IGFkanVzdCBpbmRlbnRhdGlvbiBvZgogeHh4X2RlbGF5X21heC9taW4=?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL:mse-fl1.zte.com.cn 54JEWdEI047770
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 682B4114.000/4b1Ksc0wpFz5B1Jb



--=====_001_next=====
Content-Type: multipart/related;
	boundary="=====_002_next====="


--=====_002_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PiBhZGp1c3QgaW5kZW50YXRpb24gb2YgeHh4X2RlbGF5X21heC9taW4gaW4gc3RydWN0IHRhc2tz
dGF0cy4NCkkgdGhpbmsgZml4aW5nIGluZGVudGF0aW9uIGFsb25lIGlzbid0IHdvcnRoIGEgc2Vw
YXJhdGUgcGF0Y2guIFRoZXJlDQphcmUgc3RpbGwgYSBsb3Qgd29yayB0byBkbywgZm9yIGV4YW1w
bGU6IHJlZHVjZSByZWR1bmRhbnQgYXNzaWdubWVudA0KYW5kIGNhbGN1bGF0aW9uIGNvZGUgaW4g
ZGVsYXlhY2N0X2FkZF90c2soKS4gU28gc2hvdWxkIHdlIGZpeCB0aGUNCmluZGVudGF0aW9uIGFz
IHBhcnQgb2YgdGhlIG5leHQgcGF0Y2gu


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iemNvbnRlbnRSb3ciPjxwPiZndDsmbmJzcDthZGp1c3QgaW5kZW50YXRpb24g
b2YgeHh4X2RlbGF5X21heC9taW4gaW4gc3RydWN0IHRhc2tzdGF0cy48L3A+PHA+SSB0aGluayBm
aXhpbmcgaW5kZW50YXRpb24gYWxvbmUgaXNuJ3Qgd29ydGggYSBzZXBhcmF0ZSBwYXRjaC4gVGhl
cmU8L3A+PHA+YXJlIHN0aWxsIGEgbG90IHdvcmsgdG8gZG8sIGZvciBleGFtcGxlOiByZWR1Y2Ug
cmVkdW5kYW50IGFzc2lnbm1lbnQ8L3A+PHA+YW5kIGNhbGN1bGF0aW9uIGNvZGUgaW4gZGVsYXlh
Y2N0X2FkZF90c2soKS4gU28gc2hvdWxkIHdlIGZpeCB0aGU8L3A+PHA+aW5kZW50YXRpb24gYXMg
cGFydCBvZiB0aGUgbmV4dCBwYXRjaC48L3A+PC9kaXY+


--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--

