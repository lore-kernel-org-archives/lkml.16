Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26E24C6C;
	Mon, 30 Jun 2025 03:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751253556; cv=none; b=K9qXXm0q0Ou2WG/cYSgGgohO/bQtLg2tzvJgg8GK7sdStpKHP63ujC5uOaFoeuAIdunBzobV8QPV3F9UHYLPPyXnHAV2MOLnCKPQ4SEXTE9vQCPlyVlGW2Tmjpm1YB95YAZImRAM61rI7GCWJGc3IzgxJFcJHk635mtBKXuCHJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751253556; c=relaxed/simple;
	bh=24mF+f1aBPsZZ9WvExocelIJ24L/eUq8BiwB4pRl6QQ=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=dtNcJgbBzJvc9uNyu9q6Ha1SrTpfA4gYZaO/HmbXcMV+08aWgqIOJyd718fHTMsAaH90ljtp+tr/Wwcj/nkusRQ4NlCEY5Bzy/fKO0gfsD8L7cCFmk22bnABNArn4I8fTUkgEqnhbisjil/dqE3jbQtdbFwgU81cnTI1mrVFK/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bVrwr5KC7z51STg;
	Mon, 30 Jun 2025 11:19:08 +0800 (CST)
Received: from njy2app01.zte.com.cn ([10.40.12.136])
	by mse-fl2.zte.com.cn with SMTP id 55U3IJAk006345;
	Mon, 30 Jun 2025 11:18:40 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid204;
	Mon, 30 Jun 2025 11:18:42 +0800 (CST)
Date: Mon, 30 Jun 2025 11:18:42 +0800 (CST)
X-Zmail-TransId: 2aff68620212ffffffffdef-116e5
X-Mailer: Zmail v1.0
Message-ID: <20250630111842136Podxz5UuLjjgBb274mr_W@zte.com.cn>
In-Reply-To: <2949fb39-7e94-40a6-ad75-636a194f0b2f@linux.dev>
References: 20250630104028091JYqwlWt_OOKp3u4LK6A_1@zte.com.cn,2949fb39-7e94-40a6-ad75-636a194f0b2f@linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <si.yanteng@linux.dev>
Cc: <alexs@kernel.org>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <xu.xin16@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <wang.yaxin@zte.com.cn>,
        <fan.yu9@zte.com.cn>, <he.peilin@zte.com.cn>, <tu.qiang35@zte.com.cn>,
        <qiu.yutan@zte.com.cn>, <zhang.yunkai@zte.com.cn>,
        <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MyAwLzMgbGludXggbmV4dF0gRG9jcy96aF9DTjogVHJhbnNsYXRlIG5ldHdvcmtpbmcgZG9jcyB0byBTaW1wbGlmaWVkIENoaW5lc2U=?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL:mse-fl2.zte.com.cn 55U3IJAk006345
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6862022C.004/4bVrwr5KC7z51STg



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

Pj4gUGluZw0KPg0KPllvdSBzZW50IG91dCB0aGlzIHBhdGNoIHNldCBsYXN0IEZyaWRheSBhbmQg
dGhlbiBwdXNoZWQgZm9yIGEgcmVzcG9uc2UNCj4NCj5vbiB0aGUgbWFpbGluZyBsaXN0IG9uIE1v
bmRheSAod2hlbiB0aGUgdXN1YWwgdGltZWZyYW1lIGlzIHR3byB3ZWVrcyksDQo+DQo+d2hpY2gg
aXMgbm90IGEgZnJpZW5kbHkgd2F5IHRvIGNvbGxhYm9yYXRlLg0KPg0KPk5vdCBldmVyeW9uZSB3
b3JrcyBvbiB3ZWVrZW5kc+KAlGF0IGxlYXN0IEkgbmVlZCB0aW1lIHRvIHJlc3QuDQo+DQo+WWFu
dGVuZw0KDQpJJ20gc28gc29ycnksIHRoaXMgZW1haWwgd2FzIHNlbnQgYnkgbWlzdGFrZSwgYW5k
IHRoZSByZXBseSB3YXMgcXVpdGUgdW5mcmllbmRseS4gSSBhcG9sb2dpemUgdG8geW91IG9uY2Ug
YWdhaW4u


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iemNvbnRlbnRSb3ciPjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxNHB4O2ZvbnQt
ZmFtaWx5OuW+rui9r+mbhem7kSxNaWNyb3NvZnQgWWFIZWk7bGluZS1oZWlnaHQ6MS41Ij48ZGl2
IHN0eWxlPSJsaW5lLWhlaWdodDoxLjUiPiZndDsmZ3Q7IFBpbmc8L2Rpdj48ZGl2IHN0eWxlPSJs
aW5lLWhlaWdodDoxLjUiPiZndDs8L2Rpdj48ZGl2IHN0eWxlPSJsaW5lLWhlaWdodDoxLjUiPiZn
dDtZb3Ugc2VudCBvdXQgdGhpcyBwYXRjaCBzZXQgbGFzdCBGcmlkYXkgYW5kIHRoZW4gcHVzaGVk
IGZvciBhIHJlc3BvbnNlPC9kaXY+PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41Ij4mZ3Q7PC9k
aXY+PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41Ij4mZ3Q7b24gdGhlIG1haWxpbmcgbGlzdCBv
biBNb25kYXkgKHdoZW4gdGhlIHVzdWFsIHRpbWVmcmFtZSBpcyB0d28gd2Vla3MpLDwvZGl2Pjxk
aXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNSI+Jmd0OzwvZGl2PjxkaXYgc3R5bGU9ImxpbmUtaGVp
Z2h0OjEuNSI+Jmd0O3doaWNoIGlzIG5vdCBhIGZyaWVuZGx5IHdheSB0byBjb2xsYWJvcmF0ZS48
L2Rpdj48ZGl2IHN0eWxlPSJsaW5lLWhlaWdodDoxLjUiPiZndDs8L2Rpdj48ZGl2IHN0eWxlPSJs
aW5lLWhlaWdodDoxLjUiPiZndDtOb3QgZXZlcnlvbmUgd29ya3Mgb24gd2Vla2VuZHPigJRhdCBs
ZWFzdCBJIG5lZWQgdGltZSB0byByZXN0LjwvZGl2PjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEu
NSI+Jmd0OzwvZGl2PjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNSI+Jmd0O1lhbnRlbmc8L2Rp
dj48ZGl2IHN0eWxlPSJsaW5lLWhlaWdodDoxLjUiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJsaW5l
LWhlaWdodDoxLjUiPkknbSBzbyBzb3JyeSwgdGhpcyBlbWFpbCB3YXMgc2VudCBieSBtaXN0YWtl
LCBhbmQgdGhlIHJlcGx5IHdhcyBxdWl0ZSB1bmZyaWVuZGx5LiBJIGFwb2xvZ2l6ZSB0byB5b3Ug
b25jZSBhZ2Fpbi48L2Rpdj48L2Rpdj48YnI+PGJyPjxicj48YnI+PC9kaXY+


--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--

