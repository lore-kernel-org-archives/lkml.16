Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632CA22686F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744846471; cv=none; b=XR1wwdhA+k/zo1R7W4i+nED9/1OCAi5Ss1uTAvQBn4otxABXb6IuDOEuR+tfYhK2AeyvTNrWYfapctvhoyx6JOcA5guR2+tYKPsYL8CHowiip4HUYheR6cZGlQTyJylpYPe0jEavb4smVanogdn39cht9wKcK0pmkI2clEZOhjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744846471; c=relaxed/simple;
	bh=Jo4Bx68R9wzYmIFUDOaq5ikt1AVX0s1/His1fruGw6c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hve4fiO1RfaP7qPT2P34Wfm1m47lv3rtCAt3L3IYcjuc4ktcyrtWv0dj5JX01WPEM4mEveXlyz0FGFOatvrUlrlJXzMwhL5ZW3Eox3ON4ugHqMvb4T8pj7q6DIETgJ/BDa2rLLlePL19pn1lgi08mW9d1o6vl3WF0jDBK12BT8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=AxYNzrxx; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="AxYNzrxx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1744846466;
	bh=Jo4Bx68R9wzYmIFUDOaq5ikt1AVX0s1/His1fruGw6c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AxYNzrxxedUhtopmNDvIla4GEcdoYqKoX7ecYje7nRqbqPonJShOpbFUjYXnEOZRN
	 TjZ6wz+e7ycYOLBjymVETCvkyO7FXu7rD6iZy/shnraIsB2NjFvXmsEn8lzKmR1UU2
	 Vj5Bj0Rhn+cmOtOa0IjVkJjsszex9h34+C66dk1C0u1fIqcGGXkdO+ifnD68rwMAyg
	 4bPxksrXK+q0g9LA1RB+DqE/oGeKKB2cZDahMkkkDyemwIOe4lT8DzYGY73e4x0of1
	 Hcagp08hMugYBz+y3VvxrQBQ66dSUFC8e9bp7ohRcGyDmVLHlRnd+6LuvD38yWCxvW
	 vm/IshuJXmctA==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6F3A664323;
	Thu, 17 Apr 2025 07:34:26 +0800 (AWST)
Message-ID: <8968108ce893df8b051f00ff70ad9943dba11783.camel@codeconstruct.com.au>
Subject: Re: [PATCH 3/7] soc: aspeed: lpc-snoop: Ensure model_data is valid
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jean Delvare <jdelvare@suse.de>
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, Andrew Geissler
 <geissonator@yahoo.com>, Ninad Palsule <ninad@linux.ibm.com>, Patrick
 Venture <venture@google.com>, Robert Lippert <roblip@gmail.com>,
 linux-kernel@vger.kernel.org
Date: Thu, 17 Apr 2025 09:04:22 +0930
In-Reply-To: <20250416141940.5495e537@endymion>
References: 
	<20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
	 <20250411-aspeed-lpc-snoop-fixes-v1-3-64f522e3ad6f@codeconstruct.com.au>
	 <20250416141940.5495e537@endymion>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gV2VkLCAyMDI1LTA0LTE2IGF0IDE0OjE5ICswMjAwLCBKZWFuIERlbHZhcmUgd3JvdGU6Cj4g
T24gRnJpLCAxMSBBcHIgMjAyNSAxMDozODozMyArMDkzMCwgQW5kcmV3IEplZmZlcnkgd3JvdGU6
Cj4gPiBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSBjYW4gcmV0dXJuIE5VTEwsIHRob3VnaCBz
aG91bGRuJ3QgaW4KPiA+IGN1cnJlbnQKPiA+IGNpcmN1bXN0YW5jZXMuIFJlZ2FyZGxlc3MsIGlu
aXRpYWxpc2UgbW9kZWxfZGF0YSBjbG9zZXIgdG8gdXNlIHNvCj4gPiBpdCdzCj4gPiBjbGVhciB3
ZSBuZWVkIHRvIHRlc3QgZm9yIHZhbGlkaXR5IHByaW9yIHRvIGRlcmVmZXJlbmNpbmcuCj4gPiAK
PiA+IEZpeGVzOiAyZGVlNTg0YmM5ZTMgKCJkcml2ZXJzL21pc2M6IChhc3BlZWQtbHBjLXNub29w
KTogQWRkIGFzdDI0MDAKPiA+IHRvIGNvbXBhdCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
SmVmZmVyeSA8YW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1Pgo+ID4gLS0tCj4gPiDCoGRyaXZl
cnMvc29jL2FzcGVlZC9hc3BlZWQtbHBjLXNub29wLmMgfCAxMyArKysrKysrLS0tLS0tCj4gPiDC
oDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLWxwYy1zbm9vcC5jCj4gPiBi
L2RyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQtbHBjLXNub29wLmMKPiA+IGluZGV4Cj4gPiBlOWQ5
YThlNjBhNmYwNjJjMGI1M2M5YzAyZTVkNzM3Njg0NTM5OThkLi4yOGYwMzRiOGEzYjcyMjZlZmUy
MGNiZTMwCj4gPiBhN2RhMGMyYjQ5ZmJkOTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9h
c3BlZWQvYXNwZWVkLWxwYy1zbm9vcC5jCj4gPiArKysgYi9kcml2ZXJzL3NvYy9hc3BlZWQvYXNw
ZWVkLWxwYy1zbm9vcC5jCj4gPiBAQCAtMTg2LDEwICsxODYsMTAgQEAgc3RhdGljIGludCBhc3Bl
ZWRfbHBjX2VuYWJsZV9zbm9vcChzdHJ1Y3QKPiA+IGFzcGVlZF9scGNfc25vb3AgKmxwY19zbm9v
cCwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlu
dCBjaGFubmVsLCB1MTYgbHBjX3BvcnQpCj4gPiDCoHsKPiA+IC3CoMKgwqDCoMKgwqDCoGludCBy
YyA9IDA7Cj4gPiArwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1Y3QgYXNwZWVkX2xwY19zbm9vcF9t
b2RlbF9kYXRhICptb2RlbF9kYXRhOwo+ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiBoaWNyNV9lbiwg
c25wd2Fkcl9tYXNrLCBzbnB3YWRyX3NoaWZ0LCBoaWNyYl9lbjsKPiA+IC3CoMKgwqDCoMKgwqDC
oGNvbnN0IHN0cnVjdCBhc3BlZWRfbHBjX3Nub29wX21vZGVsX2RhdGEgKm1vZGVsX2RhdGEgPQo+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0
YShkZXYpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaW50IHJjID0gMDsKPiA+ICsKPiAKPiBEdXBsaWNh
dGUgYmxhbmsgbGluZS4KCkknbGwgY2xlYW4gdGhhdCB1cC4KCj4gCj4gPiDCoAo+ID4gwqDCoMKg
wqDCoMKgwqDCoGlmIChscGNfc25vb3AtPmNoYW5bY2hhbm5lbF0uZW5hYmxlZCkKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FQlVTWTsKPiA+IEBAIC0yMzYsOSAr
MjM2LDEwIEBAIHN0YXRpYyBpbnQgYXNwZWVkX2xwY19lbmFibGVfc25vb3Aoc3RydWN0Cj4gPiBh
c3BlZWRfbHBjX3Nub29wICpscGNfc25vb3AsCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmVnbWFwX3Vw
ZGF0ZV9iaXRzKGxwY19zbm9vcC0+cmVnbWFwLCBISUNSNSwgaGljcjVfZW4sCj4gPiBoaWNyNV9l
bik7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgcmVnbWFwX3VwZGF0ZV9iaXRzKGxwY19zbm9vcC0+cmVn
bWFwLCBTTlBXQURSLAo+ID4gc25wd2Fkcl9tYXNrLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBscGNfcG9ydCA8PCBzbnB3YWRyX3NoaWZ0
KTsKPiA+IC3CoMKgwqDCoMKgwqDCoGlmIChtb2RlbF9kYXRhLT5oYXNfaGljcmJfZW5zbnApCj4g
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnbWFwX3VwZGF0ZV9iaXRzKGxwY19z
bm9vcC0+cmVnbWFwLCBISUNSQiwKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGhpY3JiX2VuLCBoaWNyYl9lbik7Cj4gPiAr
Cj4gPiArwqDCoMKgwqDCoMKgwqBtb2RlbF9kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRh
KGRldik7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAobW9kZWxfZGF0YSAmJiBtb2RlbF9kYXRhLT5o
YXNfaGljcmJfZW5zbnApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnbWFw
X3VwZGF0ZV9iaXRzKGxwY19zbm9vcC0+cmVnbWFwLCBISUNSQiwKPiA+IGhpY3JiX2VuLCBoaWNy
Yl9lbik7Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoGxwY19zbm9vcC0+Y2hhbltjaGFubmVs
XS5lbmFibGVkID0gdHJ1ZTsKPiA+IMKgCj4gPiAKPiAKPiBBY2tlZC1ieTogSmVhbiBEZWx2YXJl
IDxqZGVsdmFyZUBzdXNlLmRlPgo+IAoKVGhhbmtzLAoKQW5kcmV3Cg==

