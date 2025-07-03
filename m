Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.142.27])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B1C2D0C64
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.142.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530920; cv=none; b=bGW2PpsTM/QFXzceSazhFb4kvlC2tiNFSS14Al3LFRSLewwnv/d5Hlm4eTfyRekrgwEFl+a7+iXZ0BvCXlo26Fj0ia43mthbJ8WEucjmyBXPgbTrnLvhRpaXChvhuPlRLD013iCnf455oRvnwlwCslMblBbpcSFWMvu4dnY4OUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530920; c=relaxed/simple;
	bh=BcTs6ANR9qi9JTxK4s530UQSbdr1A+m5/RNNefQvdUE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=RFlAcCdZEK/0IkfhTa+emVVeRXSxIJrIHWlKwpfcZn/TpeMFS0KjDbkCabM917DMr9ISwZ40EbTOSH/yQKESTtP9tAeggQ4NsRoYyeRA00arYEzCfDtPt0g5vEjbl0vNynuSUbLcvFH4FAueT4FLkHUTt+VPGYnjEQAjE4ydQfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=13.76.142.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [115.197.243.13])
	by mtasvr (Coremail) with SMTP id _____wCnY8abPWZoz6zbAw--.12275S3;
	Thu, 03 Jul 2025 16:21:48 +0800 (CST)
Received: from linma$zju.edu.cn ( [115.197.243.13] ) by
 ajax-webmail-mail-app4 (Coremail) ; Thu, 3 Jul 2025 16:21:47 +0800
 (GMT+08:00)
Date: Thu, 3 Jul 2025 16:21:47 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Lin Ma" <linma@zju.edu.cn>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: wkang77@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject:  Re: [PATCH v1 1/2] staging: gdm724x: fix type confusion in
 gdm_lte_event_rcv()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.3-cmXT6 build
 20250620(94335109) Copyright (c) 2002-2025 www.mailtech.cn zju.edu.cn
In-Reply-To: <2025070359-remold-aneurism-c0ac@gregkh>
References: <20250703052723.14616-1-linma@zju.edu.cn>
 <2025070343-halves-prison-c40f@gregkh>
 <97e5af3.9183.197cefa02cc.Coremail.linma@zju.edu.cn>
 <2025070355-uncommon-handlebar-c6f3@gregkh>
 <7792df9a.9245.197cf193a6a.Coremail.linma@zju.edu.cn>
 <2025070359-remold-aneurism-c0ac@gregkh>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1f0087d1.9735.197cf60a718.Coremail.linma@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:zi_KCgBnWbqbPWZoc3VfAA--.11874W
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwcQEmhlCw4N8wAAsw
X-CM-DELIVERINFO: =?B?6vlUrgXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHs9E3REyVLMz4DLkghFkBLowvEjR9xFvPFr9w8XUumMu+vviU/cgrXzImJXzJkPGAYf4
	95hQtPLc6XvRYULgrnDAMLR+UqhCj1zM190NMUmpFANZaYPfpNkcCXuhs8InsA==
X-Coremail-Antispam: 1Uk129KBj9xXoWrKF4fWr4kWF1rtr47Ww1UCFX_yoW3Wwc_uw
	s8K3Z7AFWDAa1q9F1kG3WDurWFgF4fWF9xJa48Jr93C3yUZFsxWrZ5Wr92vw48W3Z2krn8
	uryF9ws7uF17uosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbBAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7xvr2IYc2Ij64
	vIr40E4x8a64kEw24lFcxC0VAYjxAxZF0Ew4CEw7xC0wACY4xI67k04243AVC20s07MxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr1l6VACY4xI67k04243Ab
	IYCTnIWIevJa73UjIFyTuYvjxU4VbkDUUUU

PiAKPiBBaCwgdGhhdCB3YXMgbm90IG9idmlvdXMgYXQgYWxsLiAgUmVtZW1iZXIsIHNvbWUgb2Yg
dXMgZ2V0IHRob3VzYW5kcyBvZgo+IGVtYWlscyBhIGRheSB0byByZXZpZXcsIHBsZWFzZSBtYWtl
IHRoaW5ncyB0aGF0IHlvdSBhcmUgc3VibWl0dGluZyBmb3IKPiBub24tbWFpbmxpbmUga2VybmVs
cyB2ZXJ5IHZlcnkgdmVyeSBvYnZpb3VzIGFzIHRvIHdoYXQgaXMgZ29pbmcgb24uCj4gCgpHb3Rj
aGEsIHRoaXMgaXMgYWxzbyB0aGUgZmlyc3QgdGltZSBJIGVuY291bnRlcmVkIGEgYnVnIHRoYXQg
aGFzIGJlZW4gZml4ZWQKYmVjYXVzZSBpdCB3YXMgInJlbW92ZWQiIChidXQgbm90IHRyZWF0ZWQg
YXMgYSBzZWN1cml0eSBpc3N1ZSkgaW4gdXBzdHJlYW0uCkkgd2lsbCBleHBsYWluIGNsZWFybHkg
d2hhdCdzIGhhcHBlbmluZyBhbmQgdW5kZXJsaW5lIHRoZSBub24tbWFpbmxpbmUKaW5mb3JtYXRp
b24gbmV4dCB0aW1lLgoKCj4gPiBUaGVyZWZvcmUsIHNoYWxsIEkgcHJvY2VlZCB3aXRoIHRoZSBw
YXRjaGVzPyBPciBtYXliZSB0aGUgc3RhYmxlIHRyZWUKPiA+IGNvdWxkIGFsc28gZGVsZXRlIHRo
YXQgdnVsbmVyYWJsZSBjb2RlPwo+IAo+IEZvciBhIHN0YWdpbmcgZHJpdmVyLCBpdCdzIG5vdCBh
biBpc3N1ZSwgZG9uJ3Qgd29ycnkgYWJvdXQgaXQsIG5vIGRpc3Rybwo+IHNob3VsZCBiZSB1c2lu
ZyBpdCBhbnl3YXkgYXMgbm8gb25lIGhhcyB0aGUgaGFyZHdhcmUgOikKPiAKCkNvb2wsIGdsYWQg
dG8ga25vdyB0aGF0LgoKPiB0aGFua3MsCj4gCj4gZ3JlZyBrLWgKClRoYW5rcwpMaW4K

