Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527FBCA4E;
	Fri, 23 May 2025 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994684; cv=none; b=kIS8ZO4fWsiJrkqNb854NHc8gWBplqueHvLBMLCTmKiYu7c2c2cMdqelZsE6l6ir0iecAEijCpwlMa+I9a5UvuwiDh1Eb3ndP9sdjxKb25LH32Vne7a9iS2jzoV9mfoQk2UW/Ekw/vldJdKlJltfUbygkc9Eqn8JjdzaqIyQEtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994684; c=relaxed/simple;
	bh=LqqTEKsZGOlen8A5zdVQ/tcZunierACeScgI5NQ2Df0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=PrIX5aS64Pjgk9oheU7Tk74qFW0FaYJN6o1OgeblMS2x6sJGT1qLKs/a2QEZW7cFMSkguwH6fCakDzVaDHJNTjHAGIpsS5bo84OZ9+Q0KuiRbFoeofkfn6cxmj/csk/QyTx46dUig8ot6ghDGKBgm+tTwUI1voGV5Ed1dQ/mKSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from linmin$eswincomputing.com ( [10.10.96.205] ) by
 ajax-webmail-app2 (Coremail) ; Fri, 23 May 2025 18:04:00 +0800 (GMT+08:00)
Date: Fri, 23 May 2025 18:04:00 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p6X5pWP?= <linmin@eswincomputing.com>
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Paul Walmsley" <paul.walmsley@sifive.com>,
	"Samuel Holland" <samuel.holland@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Daniel Lezcano" <daniel.lezcano@linaro.org>,
	"Pritesh Patel" <pritesh.patel@einfochips.com>,
	"Yangyu Chen" <cyy@cyyself.name>,
	"Lad Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"Yu Chien Peter Lin" <peterlin@andestech.com>,
	"Charlie Jenkins" <charlie@rivosinc.com>,
	"Kanak Shilledar" <kanakshilledar@gmail.com>,
	"Darshan Prajapati" <darshan.prajapati@einfochips.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Heiko Stuebner" <heiko@sntech.de>,
	"Aradhya Bhatia" <a-bhatia1@ti.com>, rafal@milecki.pl,
	"Anup Patel" <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/10] dt-bindings: riscv: Add SiFive HiFive Premier
 P550 board
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20250410152519.1358964-5-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-5-pinkesh.vaghela@einfochips.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <12b31aa1.107c.196fc99801d.Coremail.linmin@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgDHZpUQSDBo3PiJAA--.14149W
X-CM-SenderInfo: 5olqzx3q6h245lqf0zpsxwx03jof0z/1tbiAQELCWgvUWdFOQACsN
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

T24gMTAvMDQvMjAyNSAyMzoyNToxMyBQcml0ZXNoIFBhdGVsIHdyb3RlOgo+IEZyb206IFByaXRl
c2ggUGF0ZWwgPHByaXRlc2gucGF0ZWxAZWluZm9jaGlwcy5jb20+Cj4gCj4gQWRkIERUIGJpbmRp
bmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIEVTV0lOIEVJQzc3MDAgU29DIGFuZAo+IEhpRml2ZSBQ
cmVtaWVyIFA1NTAgQm9hcmQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQcml0ZXNoIFBhdGVsIDxwcml0
ZXNoLnBhdGVsQGVpbmZvY2hpcHMuY29tPgo+IFJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8
c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQaW5rZXNoIFZhZ2hl
bGEgPHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbT4KPiBSZXZpZXdlZC1ieTogTWF0dGhp
YXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGtlcm5lbC5vcmc+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBI
ZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+CgpBY2tlZC1ieTogTWluIExpbiA8bGlubWlu
QGVzd2luY29tcHV0aW5nLmNvbT4KCj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L2Vzd2luLnlhbWwgICAgICB8IDI5ICsrKysrKysrKysrKysrKysrKysKPiAgTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysKPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXN3aW4ueWFtbAo+IAo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXN3aW4ueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9lc3dpbi55YW1sCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmM2MDNjNDVlZWYyMgo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXN3aW4ueWFtbAo+IEBAIC0wLDAgKzEsMjkgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0K
PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9yaXNjdi9lc3dpbi55YW1sIwo+
ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMK
PiArCj4gK3RpdGxlOiBFU1dJTiBTb0MtYmFzZWQgYm9hcmRzCj4gKwo+ICttYWludGFpbmVyczoK
PiArICAtIE1pbiBMaW4gPGxpbm1pbkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gKyAgLSBQaW5rZXNo
IFZhZ2hlbGEgPHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbT4KPiArICAtIFByaXRlc2gg
UGF0ZWwgPHByaXRlc2gucGF0ZWxAZWluZm9jaGlwcy5jb20+Cj4gKwo+ICtkZXNjcmlwdGlvbjoK
PiArICBFU1dJTiBTb0MtYmFzZWQgYm9hcmRzCj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgICRub2Rl
bmFtZToKPiArICAgIGNvbnN0OiAnLycKPiArICBjb21wYXRpYmxlOgo+ICsgICAgb25lT2Y6Cj4g
KyAgICAgIC0gaXRlbXM6Cj4gKyAgICAgICAgICAtIGVudW06Cj4gKyAgICAgICAgICAgICAgLSBz
aWZpdmUsaGlmaXZlLXByZW1pZXItcDU1MAo+ICsgICAgICAgICAgLSBjb25zdDogZXN3aW4sZWlj
NzcwMAo+ICsKPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKPiArCj4gKy4uLgo+IGRpZmYg
LS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggYmZjZGYyYmNlZDYxLi5m
OTBjOTQwZjI4NmMgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVS
Uwo+IEBAIC04NzY4LDYgKzg3NjgsMTMgQEAgTDoJbGludXgtY2FuQHZnZXIua2VybmVsLm9yZwo+
ICBTOglNYWludGFpbmVkCj4gIEY6CWRyaXZlcnMvbmV0L2Nhbi91c2IvZXNkX3VzYi5jCj4gIAo+
ICtFU1dJTiBERVZJQ0VUUkVFUwo+ICtNOglNaW4gTGluIDxsaW5taW5AZXN3aW5jb21wdXRpbmcu
Y29tPgo+ICtNOglQaW5rZXNoIFZhZ2hlbGEgPHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNv
bT4KPiArTToJUHJpdGVzaCBQYXRlbCA8cHJpdGVzaC5wYXRlbEBlaW5mb2NoaXBzLmNvbT4KPiAr
UzoJTWFpbnRhaW5lZAo+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXN3aW4ueWFtbAo+ICsKPiAgRVQxMzFYIE5FVFdPUksgRFJJVkVSCj4gIE06CU1hcmsgRWlu
b24gPG1hcmsuZWlub25AZ21haWwuY29tPgo+ICBTOglPZGQgRml4ZXMKPiAtLSAKPiAyLjI1LjEK

