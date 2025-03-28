Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9FA1B87CE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 22:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743202062; cv=none; b=fi723KAmB6wk4uegdID46L0gX8nKGYZgafVsMmVf76emhwb/6Ph1lx9fMNIXvz34rG/fvyTchRhInqwSTjUvyIkXcMQOopmx/BVV0tdXW/4yTQ/VEK9zTwwHzfdEwvfnzYFy2cfvOLsPYIThyg1827ZLbEYo2nSiDkz4rkVMIAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743202062; c=relaxed/simple;
	bh=ULnZTnfuv0v/lDcoUnMrZJyKYfNW4eToADm5yrD16aw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SRRUew5YWBVZJvpJ+u4KKp9RCvf375gi6eKo7pOCTckk9zLK5xOob9kfnOF2iN4xLDosbGVLHTyec6ezlfrIuNFaVpBBfit6XFQfeO/QZuQJqqtMVL1GiAH8HVD2NF5elPWEny6pnDgq7mFGNyMQzIfZhQQrM2DOr/iOwqF4ZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fMJlxRVz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fMJlxRVz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22928d629faso19854155ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743202060; x=1743806860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULnZTnfuv0v/lDcoUnMrZJyKYfNW4eToADm5yrD16aw=;
        b=fMJlxRVzCOfM13puJDGcPynD866201n8KAtfwPT/p8CmvLXoLzgXAZ01jCa2EmPkZK
         LK09UW0UH2+WY++fpEB3wDteGYz474niIe0T4CkHZ6gioCUBZWLUDo8uf0mo3JRHTjOT
         gcpUBbCSBL9XHXHmVBsj9W1YNzR9G54E7H99iv6X+BGROV50XxbuPYgwXjQ402zCYUDn
         sWZxVlUS2jJqNCaWwlkf4u9y/ctO5UV4mSnR0O26xDwHPFeD+WUISCcvn5of4rLBes51
         49bruRHD3b1O/7e77H30hDfzypNl5Y1H/wT2nfJFvwYcu0gyoeJ+6GywBPa/lFMxUzJp
         5UTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743202060; x=1743806860;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ULnZTnfuv0v/lDcoUnMrZJyKYfNW4eToADm5yrD16aw=;
        b=wV8WkynoNHhnWtjzTRJblApB4F+z12sgx1c5cYe085QZM9cVWBQxy8xWrHqZBlskDo
         ZFF4d9ODk+v/G06zKctIsArkzZDK0K9wXvPnz32ixRxiH+PnNWv2IRkAcEJH0ephSN8L
         m+6KBoDRfPXExi++39ZYGCSVQCrp9h0TI8bGZ3QdzczCgDk340+MP0JEqQZe8BB3bOvu
         vtreqTGnmOBF4WFiw8yUvYtztd8np6IA6BwJ1QYwlpKTbrXw//u0X0wcHYVtVingTiFc
         p7hro+KxsmilSi499JiU/CjegOvKBjxmXJOjupwp3QXT+YD764kXpzJk4WxVY8BkOBWj
         N7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVHEQqbT/5+oaCd6SQe2yRs1PmmlGpdsoRPGCHL8ZqHdKBWlPL76kMCQ0J3etVR4KXe49FxpAFMwwbF8Hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHhTJUQLKYO59ZAqXr+KiLVnkrloG9OeRXc54ToF4kHpeCEHnQ
	tYwfwuSzDuhntufXZ7GiGXP3RIyZheXHfVvvA5YRY6KLgkhgml4YM9OvEMWePw==
X-Gm-Gg: ASbGncueDl2axbT1faagryP53DkUUxsr/7vyW4uGqswqNFNGQNN4JoSQo2wtq0CRaxF
	T5O3ByUztVnCH0F1EbkG09qB9Ix/p8A2wmAuqquDPWnvfq9UJGUP/GRVpMF7uRUFPKIu9GLVAS2
	mVUNPERHwAXXGF09VCDvCyeerjf5dbjoqOyVG9GIWCdwcmYk5KL/ltXGnrxD3SzYyo6mQntsuka
	FdQl6sMKYUsubcYugvG4ov0ggjrEYUWBlZIT3rhq6o6acuSumtwHsBrgGUB3xqiLQhuekKbjHl8
	N96jA+lds0XqAOPNc7s9NPcz8oqvZHyX1MqKosHskI62bT0rDF4gKgcAzPgUdHZ5XoXlWh+IVo7
	XCp2rUn0ulpoNdXJjCeKtWN/KfOmzgfYMMQ==
X-Google-Smtp-Source: AGHT+IEHBSuIdDeLQ7IXF1he/K1MuwZaJMGBdewonHbymZq0pwLSntchF8HTj3O3g72gU5LkAkMaww==
X-Received: by 2002:a17:902:ce03:b0:220:e362:9b1a with SMTP id d9443c01a7336-2292f979d37mr15914045ad.25.1743202059408;
        Fri, 28 Mar 2025 15:47:39 -0700 (PDT)
Received: from bsegall-glaptop.localhost (c-73-202-176-14.hsd1.ca.comcast.net. [73.202.176.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f924bsm23966625ad.251.2025.03.28.15.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 15:47:38 -0700 (PDT)
From: Benjamin Segall <bsegall@google.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Chengming Zhou <chengming.zhou@linux.dev>,  Josh Don
 <joshdon@google.com>,  Aaron Lu <ziqianlu@bytedance.com>,  Valentin
 Schneider <vschneid@redhat.com>,  Peter Zijlstra <peterz@infradead.org>,
  Ingo Molnar <mingo@redhat.com>,  Vincent Guittot
 <vincent.guittot@linaro.org>,  <linux-kernel@vger.kernel.org>,  Juri Lelli
 <juri.lelli@redhat.com>,  Dietmar Eggemann <dietmar.eggemann@arm.com>,
  Steven Rostedt <rostedt@goodmis.org>,  Mel Gorman <mgorman@suse.de>,
  Chuyi Zhou <zhouchuyi@bytedance.com>,  Xi Wang <xii@google.com>
Subject: Re: [RFC PATCH 2/7] sched/fair: Handle throttle path for task based
 throttle
In-Reply-To: <66a69f8e-6f0c-48d0-b8d6-6438092f9377@amd.com> (K. Prateek
	Nayak's message of "Thu, 20 Mar 2025 12:29:48 +0530")
References: <20250313072030.1032893-1-ziqianlu@bytedance.com>
	<CANCG0GcFF7cnR4rCbU5MmY1Gq3M+r4gPXv39QPXXC=Cdr6sRww@mail.gmail.com>
	<CABk29Nuuq6s1+FBftOPAcMkYU+F1n2nebcP5tDK9dH4_KXA2cw@mail.gmail.com>
	<f121fdf9-aa0d-419f-9323-bd8b0c9682f3@linux.dev>
	<66a69f8e-6f0c-48d0-b8d6-6438092f9377@amd.com>
Date: Fri, 28 Mar 2025 15:47:36 -0700
Message-ID: <xm26zfh4eprr.fsf@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SyBQcmF0ZWVrIE5heWFrIDxrcHJhdGVlay5uYXlha0BhbWQuY29tPiB3cml0ZXM6DQoNCj4gSGVs
bG8gQ2hlbmdtaW5nLA0KPg0KPiBPbiAzLzE3LzIwMjUgODoyNCBBTSwgQ2hlbmdtaW5nIFpob3Ug
d3JvdGU6DQo+PiBPbiAyMDI1LzMvMTYgMTE6MjUsIEpvc2ggRG9uIHdyb3RlOg0KPj4+IEhpIEFh
cm9uLA0KPj4+DQo+Pj4+IMKgIHN0YXRpYyBpbnQgdGdfdGhyb3R0bGVfZG93bihzdHJ1Y3QgdGFz
a19ncm91cCAqdGcsIHZvaWQgKmRhdGEpDQo+Pj4+IMKgIHsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgcnEgKnJxID0gZGF0YTsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgY2Zz
X3JxICpjZnNfcnEgPSB0Zy0+Y2ZzX3JxW2NwdV9vZihycSldOw0KPj4+PiArwqDCoMKgwqDCoMKg
IHN0cnVjdCB0YXNrX3N0cnVjdCAqcDsNCj4+Pj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgcmJfbm9k
ZSAqbm9kZTsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgwqDCoMKgIGNmc19ycS0+dGhyb3R0bGVfY291
bnQrKzsNCj4+Pj4gK8KgwqDCoMKgwqDCoCBpZiAoY2ZzX3JxLT50aHJvdHRsZV9jb3VudCA+IDEp
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4+Pg0KPj4+
PiDCoMKgwqDCoMKgwqDCoMKgIC8qIGdyb3VwIGlzIGVudGVyaW5nIHRocm90dGxlZCBzdGF0ZSwg
c3RvcCB0aW1lICovDQo+Pj4+IC3CoMKgwqDCoMKgwqAgaWYgKCFjZnNfcnEtPnRocm90dGxlX2Nv
dW50KSB7DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNmc19ycS0+dGhyb3R0
bGVkX2Nsb2NrX3BlbHQgPSBycV9jbG9ja19wZWx0KHJxKTsNCj4+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbGlzdF9kZWxfbGVhZl9jZnNfcnEoY2ZzX3JxKTsNCj4+Pj4gK8KgwqDC
oMKgwqDCoCBjZnNfcnEtPnRocm90dGxlZF9jbG9ja19wZWx0ID0gcnFfY2xvY2tfcGVsdChycSk7
DQo+Pj4+ICvCoMKgwqDCoMKgwqAgbGlzdF9kZWxfbGVhZl9jZnNfcnEoY2ZzX3JxKTsNCj4+Pj4N
Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0NIRURfV0FSTl9PTihjZnNfcnEt
PnRocm90dGxlZF9jbG9ja19zZWxmKTsNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKGNmc19ycS0+bnJfcXVldWVkKQ0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY2ZzX3JxLT50aHJvdHRsZWRfY2xvY2tfc2VsZiA9IHJxX2Ns
b2NrKHJxKTsNCj4+Pj4gK8KgwqDCoMKgwqDCoCBTQ0hFRF9XQVJOX09OKGNmc19ycS0+dGhyb3R0
bGVkX2Nsb2NrX3NlbGYpOw0KPj4+PiArwqDCoMKgwqDCoMKgIGlmIChjZnNfcnEtPm5yX3F1ZXVl
ZCkNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2ZzX3JxLT50aHJvdHRsZWRf
Y2xvY2tfc2VsZiA9IHJxX2Nsb2NrKHJxKTsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgwqDCoMKgIFdB
Uk5fT05fT05DRSghbGlzdF9lbXB0eSgmY2ZzX3JxLT50aHJvdHRsZWRfbGltYm9fbGlzdCkpOw0K
Pj4+PiArwqDCoMKgwqDCoMKgIC8qDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAqIHJxX2xvY2sgaXMg
aGVsZCwgY3VycmVudCBpcyAob2J2aW91c2x5KSBleGVjdXRpbmcgdGhpcyBpbiBrZXJuZWxzcGFj
ZS4NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgICoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgICogQWxsIG90
aGVyIHRhc2tzIGVucXVldWVkIG9uIHRoaXMgcnEgaGF2ZSB0aGVpciBzYXZlZCBQQyBhdCB0aGUN
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgICogY29udGV4dCBzd2l0Y2gsIHNvIHRoZXkgd2lsbCBnbyB0
aHJvdWdoIHRoZSBrZXJuZWwgYmVmb3JlIHJldHVybmluZw0KPj4+PiArwqDCoMKgwqDCoMKgwqAg
KiB0byB1c2Vyc3BhY2UuIFRodXMsIHRoZXJlIGFyZSBubyB0YXNrcy1pbi11c2Vyc3BhY2UgdG8g
aGFuZGxlLCBqdXN0DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAqIGluc3RhbGwgdGhlIHRhc2tfd29y
ayBvbiBhbGwgb2YgdGhlbS4NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgICovDQo+Pj4+ICvCoMKgwqDC
oMKgwqAgbm9kZSA9IHJiX2ZpcnN0KCZjZnNfcnEtPnRhc2tzX3RpbWVsaW5lLnJiX3Jvb3QpOw0K
Pj4+PiArwqDCoMKgwqDCoMKgIHdoaWxlIChub2RlKSB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBzY2hlZF9lbnRpdHkgKnNlID0gX19ub2RlXzJfc2Uobm9kZSk7
DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFlbnRpdHlf
aXNfdGFzayhzZSkpDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIG5leHQ7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcCA9IHRhc2tfb2Yoc2UpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB0YXNrX3Rocm90dGxlX3NldHVwX3dvcmsocCk7DQo+Pj4+ICtuZXh0Og0KPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub2RlID0gcmJfbmV4dChub2RlKTsNCj4+Pj4gK8KgwqDC
oMKgwqDCoCB9DQo+Pj4NCj4+PiBJJ2QgbGlrZSB0byBzdHJvbmdseSBwdXNoIGJhY2sgb24gdGhp
cyBhcHByb2FjaC4gVGhpcyBhZGRzIHF1aXRlIGEgbG90DQo+Pj4gb2YgZXh0cmEgY29tcHV0YXRp
b24gdG8gYW4gYWxyZWFkeSBleHBlbnNpdmUgcGF0aA0KPj4+ICh0aHJvdHRsZS91bnRocm90dGxl
KS4gZS5nLiB0aGlzIGZ1bmN0aW9uIGlzIHBhcnQgb2YgdGhlIGNncm91cCB3YWxrDQo+PiBBY3R1
YWxseSwgd2l0aCBteSBzdWdnZXN0aW9uIGluIGFub3RoZXIgZW1haWwgdGhhdCB3ZSBvbmx5IG5l
ZWQgdG8gbWFyaw0KPj4gdGhlc2UgY2ZzX3JxcyB0aHJvdHRsZWQgd2hlbiBxdW90ZSB1c2VkIHVw
LCBhbmQgc2V0dXAgdGhyb3R0bGUgdGFzayB3b3JrDQo+PiB3aGVuIHRoZSB0YXNrcyB1bmRlciB0
aG9zZSBjZnNfcnFzIGdldCBwaWNrZWQsIHRoZSBjb3N0IG9mIHRocm90dGxlIHBhdGgNCj4+IGlz
IG11Y2ggbGlrZSB0aGUgZHVhbCB0cmVlIGFwcHJvYWNoLg0KPj4gQXMgZm9yIHVudGhyb3R0bGUg
cGF0aCwgeW91J3JlIHJpZ2h0LCBpdCBoYXMgdG8gaXRlcmF0ZSBlYWNoIHRhc2sgb24NCj4+IGEg
bGlzdCB0byBnZXQgaXQgcXVldWVkIGludG8gdGhlIGNmc19ycSB0cmVlLCBzbyBpdCBuZWVkcyBt
b3JlIHRoaW5raW5nLg0KPj4gDQo+Pj4gYW5kIHNvIGl0IGlzIGFscmVhZHkgTyhjZ3JvdXBzKSBm
b3IgdGhlIG51bWJlciBvZiBjZ3JvdXBzIGluIHRoZQ0KPj4+IGhpZXJhcmNoeSBiZWluZyB0aHJv
dHRsZWQuIFRoaXMgZ2V0cyBldmVuIHdvcnNlIHdoZW4geW91IGNvbnNpZGVyIHRoYXQNCj4+PiB3
ZSByZXBlYXQgdGhpcyBzZXBhcmF0ZWx5IGFjcm9zcyBhbGwgdGhlIGNwdXMgdGhhdCB0aGUNCj4+
PiBiYW5kd2lkdGgtY29uc3RyYWluZWQgZ3JvdXAgaXMgcnVubmluZyBvbi4gS2VlcCBpbiBtaW5k
IHRoYXQNCj4+PiB0aHJvdHRsZS91bnRocm90dGxlIGlzIGRvbmUgd2l0aCBycSBsb2NrIGhlbGQg
YW5kIElSUSBkaXNhYmxlZC4NCj4+IE1heWJlIHdlIGNhbiBhdm9pZCBob2xkaW5nIHJxIGxvY2sg
d2hlbiB1bnRocm90dGxlPyBBcyBmb3IgcGVyLXRhc2sNCj4+IHVudGhyb3R0bGUsIGl0J3MgbXVj
aCBsaWtlIGp1c3Qgd2FraW5nIHVwIGxvdHMgb2YgdGFza3MsIHNvIG1heWJlIHdlDQo+PiBjYW4g
cmV1c2UgdHR3dSBwYXRoIHRvIHdha2V1cCB0aG9zZSB0YXNrcywgd2hpY2ggY291bGQgdXRpbGlz
ZSByZW1vdGUNCj4+IElQSSB0byBhdm9pZCBob2xkaW5nIHJlbW90ZSBycSBsb2Nrcy4gSSdtIG5v
dCBzdXJlLCBqdXN0IHNvbWUgcmFuZG9tIHRoaW5raW5nLi4NCj4+IA0KDQpZZWFoLCBsb29waW5n
IG92ZXIgYWxsIHRoZSBmdWxseSB0aHJvdHRsZWQgdGFza3MgaW4gdW50aHJvdHRsZSBzdGlsbA0K
aXNuJ3QgZ3JlYXQgKGFuZCBuZWVkaW5nIHRvIGRvIGEgZnVsbCBlbnF1ZXVlIG9wZXJhdGlvbiBm
b3IgZWFjaCkuIEl0J3MNCnByb2JhYmx5IG11Y2ggYmV0dGVyIHRoYW4gbG9vcGluZyBvdmVyIGFs
bCB0aGUgcnVubmFibGUgdGFza3MgaGVyZQ0KdGhvdWdoLg0KDQpSZW1vdGUgSVBJIHNob3VsZG4n
dCBiZSB2ZXJ5IGhlbHBmdWwsIGJlY2F1c2Ugd2UgYWxyZWFkeSBoYXZlIHRoYXQgaW4NCmFzeW5j
IHVudGhyb3R0bGUuIFdoZXRoZXIgb3Igbm90IGl0J3MgdXNlZnVsIHRvIG9jY2FzaW9uYWxseSBy
ZWxlYXNlIHRoZQ0KbG9jayB3aGlsZSBkb2luZyBhbGwgdGhlIHBlci10YXNrIHVudGhyb3R0bGVz
IGxpa2UgbG9vcF9icmVhayB3aG8ga25vd3MsDQpidXQgaXQncyBjZXJ0YWlubHkgZWFzeSBlbm91
Z2ggdG8gZG8gd2hpbGUganVzdCBzdGF5aW5nIHVuZGVyIHJjdS4NCg0KPj4+DQo+Pj4gSW4gSyBQ
cmF0ZWVrJ3MgbGFzdCBSRkMsIHRoZXJlIHdhcyBkaXNjdXNzaW9uIG9mIHVzaW5nIGNvbnRleHQN
Cj4+PiB0cmFja2luZzsgZGlkIHlvdSBjb25zaWRlciB0aGF0IGFwcHJvYWNoIGFueSBmdXJ0aGVy
PyBXZSBjb3VsZCBrZWVwDQo+Pj4gdHJhY2sgb2YgdGhlIG51bWJlciBvZiB0aHJlYWRzIHdpdGhp
biBhIGNncm91cCBoaWVyYXJjaHkgY3VycmVudGx5IGluDQo+Pj4ga2VybmVsIG1vZGUgKHNpbWls
YXIgdG8gaF9ucl9ydW5uYWJsZSksIGFuZCB0aHVzIHNpbXBsaWZ5IGRvd24gdGhlDQo+PiBZZWFo
LCBJIHRoaW5rIFByYXRlZWsncyBhcHByb2FjaCBpcyB2ZXJ5IGNyZWF0aXZlISBUaGUgb25seSBk
b3duc2lkZSBvZg0KPj4gaXQgaXMgdGhhdCB0aGUgY29kZSBiZWNvbWVzIG11Y2ggY29tcGxleC4u
IG9uIGFscmVhZHkgY29tcGxleCBjb2RlYmFzZS4NCj4+IEFueXdheSwgaXQgd291bGQgYmUgZ3Jl
YXQgdGhhdCBvciB0aGlzIGNvdWxkIGJlIG1lcmdlZCBpbiBtYWlubGluZSBrZXJuZWwuDQo+DQo+
IEkgdGhpbmsgdGhlIGNvbnNlbnN1cyBpcyB0byBtb3ZlIHRvIHBlci10YXNrIHRocm90dGxpbmcg
c2luY2UgaXQnbGwNCj4gc2ltcGxpZnkgdGhlIGVmZm9ydHMgdG8gbW92ZSB0byBhIGZsYXQgaGll
cmFyY2h5IHNvbWV0aW1lIGluIHRoZSBuZWFyDQo+IGZ1dHVyZS4NCj4NCj4gTXkgb3JpZ2luYWwg
YXBwcm9hY2ggd2FzIGNvbXBsZXggc2luY2UgaSB3YW50ZWQgdG8gc2VhbWxlc3NseSByZXN1bWUg
dGhlDQo+IHBpY2sgcGFydCBvbiB1bnRocm90dGxlLiBJbiBCZW47cyBwYXRjaCBbMV0gdGhlcmUg
aXMgYSBUT0RPIGluDQo+IHBpY2tfbmV4dF9lbnRpdHkoKSBhbmQgdGhhdCBwcm9iYWJseSB3b3Jr
ZWQgd2l0aCB0aGUgb2xkZXIgdnJ1bnRpbWUgYmFzZWQNCj4gQ0ZTIGFsZ29yaXRobSBidXQgY2Fu
IGJyZWFrIEVFVkRGIGd1YXJhbnRlZXMuDQo+DQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwveG0yNmVkZnhwb2NrLmZzZkBic2VnYWxsLWxpbnV4LnN2bC5jb3JwLmdvb2dsZS5jb20v
DQo+DQo+IFVuZm9ydHVuYXRlbHkga2VlcGluZyBhIHNpbmdsZSByYnRyZWUgbWVhbnQgcmVwbGlj
YXRpbmcgdGhlIHN0YXRzIGFuZA0KPiB0aGF0IGluZGVlZCBhZGRzIHRvIGNvbXBsZXhpdHkuDQo+
DQoNCkRvZXMgYW55dGhpbmcgYWN0dWFsbHkgcmVseSBvbiB0aG9zZSBndWFyYW50ZWVzIGZvciBj
b3JyZWN0bmVzcyBpbiB0aGUNCnNjaGVkdWxlcj8gV291bGQgYW55dGhpbmcgYWN0dWFsbHkgYnJl
YWsgaWYgc29tZXRoaW5nIG92ZXJyb2RlDQpwaWNrX25leHRfdGFza19mYWlyIHRvIGp1c3QgcGlj
ayBhIHJhbmRvbSBydW5uYWJsZSB0YXNrIGZyb20gdGhlIHJxLCBvcg0Kc2ltaWxhcj8gSSdkIG9u
bHkgZXhwZWN0IHVzIHRvIGxvc2Ugb3V0IG9uIGZhaXJuZXNzLCBhbmQgb25seSB0byB0aGUNCmV4
dGVudCB0aGF0IHdlJ3JlIG92ZXJyaWRpbmcgdGhlIHBpY2sgKGFuZCBub3QgYXMgYW4gb25nb2lu
Zw0KcmVwZXJjdXNzaW9uIGZyb20gYSBzaW5nbGUgdW5mYWlyIHBpY2spLg0KDQpUaGVyZSdzIHN0
aWxsIHBsZW50eSBvZiBwb3RlbnRpYWwgcmVhc29ucyB0byB3YW50IHRvIHByb3ZpZGUgYmV0dGVy
DQpmYWlybmVzcyBldmVuIGJldHdlZW4gInRocm90dGxlZCB0YXNrcyBzdGlsbCBydW5uaW5nIGlu
IHRoZSBrZXJuZWwiIGJ1dA0KSSBkb24ndCB0aGluayB0aGF0IGhhbGZhc3NpbmcgaXQgd291bGQg
YnJlYWsgRUVWREYgbW9yZSB0aGFuIENGUy4gSXQNCndvdWxkIGhvd2V2ZXIgYmUgc2lnbmlmaWNh
bnRseSBtb3JlIGFubm95aW5nIHRvIGR1cGxpY2F0ZSB0aGUgdHJlZQ0Kbm93YWRheXMgd2l0aCB0
aGUgbW9yZSBkYXRhIHJlcXVpcmVkIGJ5IGVudGl0eV9lbGlnaWJsZS4NCg==
