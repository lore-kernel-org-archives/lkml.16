Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E377269CF1
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748421371; cv=none; b=iDh5fTMJlxpxYeY7olyPTWM99FIvNNtVqm8UTI4zb3HaiSB/En+ahzwQuFQ/aJfgnhxgt9vcVAJwivJgZyjCq16SugIUXW22kEu0D773A8PFwGlAB5zwHig2MS6YpapAS1deMbyssGVXAwv/9at9niiD1JR/79ZjAhqR/T+44vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748421371; c=relaxed/simple;
	bh=+juGPqQx2dxxIRe2qNdCPx4owhUmUrZBrz0AU2Mt+1o=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=pkS/MsZix5mHI8GPfr9dZNG2IhmfnrLEAgeauFMfzBGPthDmllb8TBnmJFS6kqVb6oBtKKrSHVi7eK3JapyDSty6eOnFMe16sk+4rWJVlexbwl0lTxAcnRU//8zqaCufmciixKPSQgWBOlQ7wAJqWULHUC1Lid3gt/qPDd4DeSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b6jWc6b90z51SZC;
	Wed, 28 May 2025 16:35:56 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 54S8ZqSF007524;
	Wed, 28 May 2025 16:35:52 +0800 (+08)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp02[null])
	by mapi (Zmail) with MAPI id mid14;
	Wed, 28 May 2025 16:35:55 +0800 (CST)
Date: Wed, 28 May 2025 16:35:55 +0800 (CST)
X-Zmail-TransId: 2b046836caeb06c-f558f
X-Mailer: Zmail v1.0
Message-ID: <202505281635550657WwIZSDv_Pkkfh9PqJSEV@zte.com.cn>
In-Reply-To: <20250521093157668iQrhhcMjA-th5LQf4-A3c@zte.com.cn>
References: 20250521093157668iQrhhcMjA-th5LQf4-A3c@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <jiang.kun2@zte.com.cn>, <wang.yaxin@zte.com.cn>,
        <akpm@linux-foundation.org>
Cc: <xu.xin16@zte.com.cn>, <bbonev@devuan.org>, <linux-kernel@vger.kernel.org>,
        <bsingharora@gmail.com>, <jiang.kun2@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBsaW51eCBuZXh0IHYzXSBkZWxheWFjY3Q6IHJlbW92ZSByZWR1bmRhbnQgY29kZSBhbmQKIGFkanVzdCBpbmRlbnRhdGlvbg==?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL:mse-fl1.zte.com.cn 54S8ZqSF007524
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6836CAEC.001/4b6jWc6b90z51SZC



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

PiByZW1vdmUgcmVkdW5kYW50IGNvZGUgYW5kIGFkanVzdCBpbmRlbnRhdGlvbiBvZiB4eHhfZGVs
YXlfbWF4L21pbg0KUGxlYXNlIHBheSBhdHRlbnRpb24gdG8gY2FwaXRhbGl6YXRpb24gb2YgdGhl
IGZpcnN0IGxldHRlciBhbmQgcHVuY3R1YXRpb24uDQpUaGlzIHBhdGNoIG1ha2UgdGhlIGNvZGUg
bW9yZSBjb25jaXNlIGFuZCBleHByZXNzaXZlLg0KQWNrLWJ5OiBZYW5nIFlhbmcgPHlhbmcueWFu
ZzI5QHp0ZS5jb20uY24+DQoNCj4gUmVtb3ZlIHJlZHVuZGFudCBjb2RlIGFuZCBhZGp1c3QgaW5k
ZW50YXRpb24gb2YgeHh4X2RlbGF5X21heC9taW4uDQpIaSBNb3J0b24sIHRoaXMgcGF0Y2ggYWZ0
ZXIgeW91IGFkanVzdGVkIGRvZXNuJ3QgaW5jbHVkZSBpbmRlbnRhdGlvbiBmaXgu


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iemNvbnRlbnRSb3ciPjxwPiZndDsgcmVtb3ZlIHJlZHVuZGFudCBjb2RlIGFu
ZCBhZGp1c3QgaW5kZW50YXRpb24gb2YgeHh4X2RlbGF5X21heC9taW48L3A+PHA+UGxlYXNlIHBh
eSBhdHRlbnRpb24gdG8gY2FwaXRhbGl6YXRpb24gb2YgdGhlIGZpcnN0IGxldHRlciBhbmQgcHVu
Y3R1YXRpb24uPC9wPjxwPlRoaXMgcGF0Y2ggbWFrZSB0aGUgY29kZSBtb3JlIGNvbmNpc2UgYW5k
IGV4cHJlc3NpdmUuPC9wPjxwPkFjay1ieTombmJzcDtZYW5nIFlhbmcgJmx0O3lhbmcueWFuZzI5
QHp0ZS5jb20uY24mZ3Q7PC9wPjxwPjxicj48L3A+PHA+Jmd0OyZuYnNwO1JlbW92ZSByZWR1bmRh
bnQgY29kZSBhbmQgYWRqdXN0IGluZGVudGF0aW9uIG9mIHh4eF9kZWxheV9tYXgvbWluLjwvcD48
cD5IaSBNb3J0b24sIHRoaXMgcGF0Y2ggYWZ0ZXIgeW91IGFkanVzdGVkIGRvZXNuJ3QgaW5jbHVk
ZSZuYnNwO2luZGVudGF0aW9uIGZpeC48L3A+PC9kaXY+


--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--

