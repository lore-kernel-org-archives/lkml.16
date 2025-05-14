Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8461D54EF
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747187850; cv=none; b=uiWMQGvok2WiFB6MML6Bk9h/YeJwGmlFlaq3HwDQ5pAr8GS18tj+3jTS2CuSUiP4RkRkggkdREKUfifvQjRho68dxLeRgi+w/S4J6NCs4adB9ENk481Wc2MnSd6Vm/+4Gn+fx/SHr1WD37KUVJIVuh5KyD0b0dPvLU8uheJky6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747187850; c=relaxed/simple;
	bh=tDrvq9S8UbkdawsX8X91djBZBoRSYZ+8h/HviY3r1dk=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=A2QdygRh7a+UX+R4N+yMKkroy5xE+wsaf7Sy4aDSVgUhKquJP/luwEEro4WnoJQ8MJMRZNMjZS/ooPeBwyxTHctAiKkFcKtUeYCjn9sQ7DZlHKzdJ0msib6g3Qpb6JR3XiMZTHEFdDhIFaK4bT34MviSbSI+ujLnfUA0ot+XXdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZxxLB5ppbz8R044;
	Wed, 14 May 2025 09:57:22 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl2.zte.com.cn with SMTP id 54E1vEuk019126;
	Wed, 14 May 2025 09:57:14 +0800 (+08)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp01[null])
	by mapi (Zmail) with MAPI id mid14;
	Wed, 14 May 2025 09:57:15 +0800 (CST)
Date: Wed, 14 May 2025 09:57:15 +0800 (CST)
X-Zmail-TransId: 2b036823f87bffffffffe21-f0575
X-Mailer: Zmail v1.0
Message-ID: <20250514095715517YAAvcCEiCPevDbByvfkG8@zte.com.cn>
In-Reply-To: <20250510155413259V4JNRXxukdDgzsaL0Fo6a@zte.com.cn>
References: 20250510155413259V4JNRXxukdDgzsaL0Fo6a@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <jiang.kun2@zte.com.cn>, <wang.yaxin@zte.com.cn>
Cc: <bbonev@devuan.org>, <linux-kernel@vger.kernel.org>,
        <bsingharora@gmail.com>, <jiang.kun2@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <akpm@linux-foundation.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBsaW51eCBuZXh0XSB0YXNrc3RhdHM6IGZpeCBzdHJ1Y3QgdGFza3N0YXRzIGJyZWFrcyBiYWNrd2FyZAogY29tcGF0aWJpbGl0eSBzaW5jZSB2ZXJzaW9uIDE1?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL:mse-fl2.zte.com.cn 54E1vEuk019126
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6823F882.004/4ZxxLB5ppbz8R044



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

PiBTb2x1dGlvbj4gPT09PT09PT09PiBtb3ZlIGRlbGF5IG1heCBhbmQgZGVsYXkgbWluIHRvIHRo
ZSBlbmQgb2YgdGFza3N0YXQsIGFuZCBidW1wPiB0aGUgdmVyc2lvbiB0byAxNiBhZnRlciB0aGUg
Y2hhbmdlDQpQbGVhc2Ugbm90aWNlIERvY3VtZW50YXRpb24vYWNjb3VudGluZy90YXNrc3RhdHMu
cnN0LCBpdCBzYWlkOg0KQWRkaW5nIG1vcmUgZmllbGRzIHRvIHRoZSBlbmQgb2YgdGhlIGV4aXN0
aW5nIHN0cnVjdCB0YXNrc3RhdHMuDQoNCj4gKyBfX3U2NCB3cGNvcHlfZGVsYXlfbWF4Oz4gKyBf
X3U2NCB3cGNvcHlfZGVsYXlfbWluOw0KVGhlcmUgc2VlbXMgdG8gaGF2ZSBhIHdoaXRlc3BhY2Ug
cHJvYmxlbXMsIGVsc2UgTEdUTS4NClJldmlld2VkLWJ5OiBZYW5nIFlhbmcgPHlhbmcueWFuZzI5
QHp0ZS5jb20uY24+DQoNCkFub3RoZXIgdGhpbmcgdG8gbWFrZSBpdCBiZXR0ZXIgKG1heWJlIG5l
eHQgcGF0Y2gpOiBzdHJ1Y3QgdGFza3N0YXRzDQpoYWQgY29tbWVudHMgdG8gZXhwbGFpbiB4eHhf
Y291bnQgYW5kIHh4eF9kZWxheV90b3RhbCwgd2Ugc2hvdWxkDQphbHNvIGV4cGxhaW4geHh4X2Rl
bGF5X21pbi9tYXgu


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iemNvbnRlbnRSb3ciPjxwIHN0eWxlPSJmb250LXNpemU6MTRweDtmb250LWZh
bWlseTrlvq7ova/pm4Xpu5EsTWljcm9zb2Z0IFlhSGVpOyI+Jmd0OyA8c3BhbiBzdHlsZT0iZm9u
dC1mYW1pbHk6IEFyaWFsLCAmcXVvdDtNaWNyb3NvZnQgWWFoZWkmcXVvdDssICZxdW90O0x1Y2lk
YSBHcmFuZGUmcXVvdDssIFZlcmRhbmEsIEx1Y2lkYSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBi
YWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij5Tb2x1dGlvbjwvc3Bhbj48YnIg
c3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IG91dGxpbmU6IDBweDsgZm9udC1mYW1pbHk6
IEFyaWFsLCAmcXVvdDtNaWNyb3NvZnQgWWFoZWkmcXVvdDssICZxdW90O0x1Y2lkYSBHcmFuZGUm
cXVvdDssIFZlcmRhbmEsIEx1Y2lkYSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyB3aGl0ZS1zcGFj
ZTogbm9ybWFsOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij48c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCAmcXVvdDtNaWNyb3NvZnQgWWFoZWkmcXVvdDssICZx
dW90O0x1Y2lkYSBHcmFuZGUmcXVvdDssIFZlcmRhbmEsIEx1Y2lkYSwgSGVsdmV0aWNhLCBzYW5z
LXNlcmlmOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij4mZ3Q7ID09PT09
PT09PTwvc3Bhbj48YnIgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IG91dGxpbmU6IDBw
eDsgZm9udC1mYW1pbHk6IEFyaWFsLCAmcXVvdDtNaWNyb3NvZnQgWWFoZWkmcXVvdDssICZxdW90
O0x1Y2lkYSBHcmFuZGUmcXVvdDssIFZlcmRhbmEsIEx1Y2lkYSwgSGVsdmV0aWNhLCBzYW5zLXNl
cmlmOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUs
IDI1NSk7Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCAmcXVvdDtNaWNyb3NvZnQg
WWFoZWkmcXVvdDssICZxdW90O0x1Y2lkYSBHcmFuZGUmcXVvdDssIFZlcmRhbmEsIEx1Y2lkYSwg
SGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1
NSk7Ij4mZ3Q7IG1vdmUgZGVsYXkgbWF4IGFuZCBkZWxheSBtaW4gdG8gdGhlIGVuZCBvZiB0YXNr
c3RhdCwgYW5kIGJ1bXA8L3NwYW4+PGJyIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBv
dXRsaW5lOiAwcHg7IGZvbnQtZmFtaWx5OiBBcmlhbCwgJnF1b3Q7TWljcm9zb2Z0IFlhaGVpJnF1
b3Q7LCAmcXVvdDtMdWNpZGEgR3JhbmRlJnF1b3Q7LCBWZXJkYW5hLCBMdWNpZGEsIEhlbHZldGlj
YSwgc2Fucy1zZXJpZjsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgYmFja2dyb3VuZC1jb2xvcjogcmdi
KDI1NSwgMjU1LCAyNTUpOyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgJnF1b3Q7
TWljcm9zb2Z0IFlhaGVpJnF1b3Q7LCAmcXVvdDtMdWNpZGEgR3JhbmRlJnF1b3Q7LCBWZXJkYW5h
LCBMdWNpZGEsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1
NSwgMjU1LCAyNTUpOyI+Jmd0OyB0aGUgdmVyc2lvbiB0byAxNiBhZnRlciB0aGUgY2hhbmdlPC9z
cGFuPjwvcD48cCBzdHlsZT0iZm9udC1zaXplOjE0cHg7Zm9udC1mYW1pbHk65b6u6L2v6ZuF6buR
LE1pY3Jvc29mdCBZYUhlaTsiPlBsZWFzZSBub3RpY2UmbmJzcDtEb2N1bWVudGF0aW9uL2FjY291
bnRpbmcvdGFza3N0YXRzLnJzdCwgaXQgc2FpZDo8L3A+PHAgc3R5bGU9ImZvbnQtc2l6ZToxNHB4
O2ZvbnQtZmFtaWx5OuW+rui9r+mbhem7kSxNaWNyb3NvZnQgWWFIZWk7Ij5BZGRpbmcgbW9yZSBm
aWVsZHMgdG8gdGhlIGVuZCBvZiB0aGUgZXhpc3Rpbmcgc3RydWN0IHRhc2tzdGF0cy48L3A+PHAg
c3R5bGU9ImZvbnQtc2l6ZToxNHB4O2ZvbnQtZmFtaWx5OuW+rui9r+mbhem7kSxNaWNyb3NvZnQg
WWFIZWk7Ij48YnI+PC9wPjxwPiZndDsgKyBfX3U2NCB3cGNvcHlfZGVsYXlfbWF4OzxiciBzdHls
ZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgb3V0bGluZTogMHB4OyBmb250LWZhbWlseTogQXJp
YWwsICZxdW90O01pY3Jvc29mdCBZYWhlaSZxdW90OywgJnF1b3Q7THVjaWRhIEdyYW5kZSZxdW90
OywgVmVyZGFuYSwgTHVjaWRhLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IHdoaXRlLXNwYWNlOiBu
b3JtYWw7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPiZndDsgKyBfX3U2
NCB3cGNvcHlfZGVsYXlfbWluOzwvcD48cD5UaGVyZSBzZWVtcyB0byBoYXZlIGEgd2hpdGVzcGFj
ZSBwcm9ibGVtcywgZWxzZSBMR1RNLjwvcD48cD5SZXZpZXdlZC1ieTombmJzcDtZYW5nIFlhbmcg
Jmx0O3lhbmcueWFuZzI5QHp0ZS5jb20uY24mZ3Q7PC9wPjxwPjxicj48L3A+PHA+QW5vdGhlciB0
aGluZyB0byBtYWtlIGl0IGJldHRlciAobWF5YmUgbmV4dCBwYXRjaCk6IHN0cnVjdCB0YXNrc3Rh
dHM8L3A+PHA+aGFkIGNvbW1lbnRzIHRvIGV4cGxhaW4geHh4X2NvdW50IGFuZCB4eHhfZGVsYXlf
dG90YWwsIHdlIHNob3VsZDwvcD48cD5hbHNvIGV4cGxhaW4geHh4X2RlbGF5X21pbi9tYXguPC9w
PjwvZGl2Pg==


--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--

