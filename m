Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBC42DE201;
	Tue, 17 Jun 2025 12:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164137; cv=none; b=uwbPHyN9nXf2shega5J61sBjtSKTBOXGjW+YUkkfEaVKGlUzVYx6yzOZhwJdDKnhwSLufcOPlp17ZMuSlncgMkMdJePpy93N/6M6Pf2wHWX/5dgZC6+LGNhIlSN5dSosfWh8igPvo7dORNiQiT3bLQCmN5xeH4LBhlombUu3Uyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164137; c=relaxed/simple;
	bh=wp8zThC6N9cw43TcQ+r9RrsBd53rRBbiCjDiUQaJpo0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QNWQzdv2JK+gJHk1nVPMHLgfYe4EiDRXQ4xhPVjyfeXrtvyBDN898TAIy/hbWoOqp3VMhfQAMWNuc2As/aEAAHd7ynihBUosbynF08wtTW772S7EMIAocJ0X9djYMx7hZfTfoWvTUGo8cJr7RC+RjLQmaJY4jxZZMltwzJ1XtwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eU4PqvnW; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU4PqvnW"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so4571772a12.3;
        Tue, 17 Jun 2025 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750164135; x=1750768935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wp8zThC6N9cw43TcQ+r9RrsBd53rRBbiCjDiUQaJpo0=;
        b=eU4PqvnWcfWgxe47DNPQfmKGcFEWehy+F2LUXEIDW50kROSPREqiVdmNSNhwhMcbY9
         NK0rnOKpPNdZrOyFzzRiqOenCydXNGci+3qq3VOcsV0mOqXZnjPAD1wIduHRr3TUBNBB
         TfN+vPMUiAcLkjtiirs7pxKwQ6i+LNTvSNRrRJHZC2vHi1UkOpSj64J+vKabpH/BJ+fn
         Xg2SfGwbGA8q05+40qBug2CI8Mxj45SJ49cL2deDsmRsCgo/KfipC4zyxuY4RlD89tAK
         ZDTUapfxRAu2AwtJemgTf7of4iKeTtpo1f0V7NrW/1yZocKAzL7Iido/dVdwtGyDGJ82
         GVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750164135; x=1750768935;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wp8zThC6N9cw43TcQ+r9RrsBd53rRBbiCjDiUQaJpo0=;
        b=MybXMdZkpIEP/ssPTjW8aKKVujP9vELoLYa3yc7F58WVzuOgfUkLfTH0vfp9ntKQuF
         DYly8V0pk++NeXZGr+8+pNVMVMWxqKtQP+0A6A68uQBAr2Dk79HL7GtniC24hjDMU5R2
         pI5Ytk/JsrZeENHOwHCDNibSdBlB215nOJsNB4ne8hS9bAhYbJplqrtJn1NCBKoTumIa
         rnk1Ig72etasNfOTaxNMcsTswo8XtjWCmsKTXsPPPosAmqnQeIBuhOK6zVdlil6yhXTV
         d0Hgl34ENAd9Oj75504e1/O4EZD3zP2tUa8QpV1VYFy2an4RPIbURfQ/jFHflzURLJaZ
         SPpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD12Qx97h7drZtIksMODEeJ33SHEt0U9j3gQeP9Ysf6wrEjVViETkEAvKThIE7kjL5xmS9BHtIOZRRyGFi1gM=@vger.kernel.org, AJvYcCXitTqYYtyQOVor9+sEbDWE9HVJ/Cf6HhvB8wH5xfBbnGIX2gITzLXJG/SEUb6YbL6lXVDwQB7kXaQlH+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6bE7ENoRypJCCT41+1WBYNbYMv5v7mKHR2ZVS60MTiBifz+8h
	7XmZX1a0Sh65qH3YznLY9kqkJqSDQQIrDmbDJCT3PitHEQO5q2aJ5GAe6Bwjivu8
X-Gm-Gg: ASbGnctgbR8mTZfKEupC+2g/HD8PWgvpuMnLgaMHUrQix9fu6uMrHucSEleB+4Stfk2
	RdG+75p/ZmXEu9KpBlSequYaT83pDJ3Ym3g7qs225TcHvKG9zZXhTFqXpN4h92tc34jR3A/eHps
	fpS8w1q1sLzayLMjg24ESVkaN6ZiQdTPm8CAuED8G/gdB5beuXcwejn7tdjNUrlWakp5o9akqPV
	9wGseQSpMAIyKhXmVy4cJkzm5doXxFW36JLUAkt2TBcwSMc6dyELXx/qHQDAxRpwzfXHtSz1e3S
	JcHtD4ppZZPAQM49oEvuugSKuhzxWnytmsGi9fMCsHeJ8wAJ4ButyXiNLgmm61qetQk0gGWxob6
	1xz3qx5a9UPdqN7XRAUIXMyzolR/HUBZLoeaCWryP
X-Google-Smtp-Source: AGHT+IGBYiDSH+XW/7WiEAN4Iu3Ysp2ENeOE4J3gC0oSaPzWxHuRYw0Gng+rL/KaJtLA2HzaAc1tkQ==
X-Received: by 2002:a17:90b:5150:b0:312:1143:cf8c with SMTP id 98e67ed59e1d1-313f1cafae6mr21539935a91.16.1750164134653;
        Tue, 17 Jun 2025 05:42:14 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31429aae8eesm1265192a91.40.2025.06.17.05.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:42:14 -0700 (PDT)
Date: Tue, 17 Jun 2025 21:42:07 +0900 (JST)
Message-Id: <20250617.214207.1883960660906763456.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com, boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com, mingo@kernel.org
Subject: Re: [PATCH v3 2/2] rust: task: Add Rust version of might_sleep()
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72kB4hxsyi9D-PV0YDc9KEgfC9iYCTJVEOosZv3fg1+mYA@mail.gmail.com>
References: <CANiq72mES+dPBuhsdh0-hJcV69AO74j6W5vhCeo+yV5S-Zp+yg@mail.gmail.com>
	<20250617.120453.1403624234989149033.fujita.tomonori@gmail.com>
	<CANiq72kB4hxsyi9D-PV0YDc9KEgfC9iYCTJVEOosZv3fg1+mYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVHVlLCAxNyBKdW4gMjAyNSAxMDowMjoyMiArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBUdWUsIEp1biAxNywgMjAy
NSBhdCA1OjA14oCvQU0gRlVKSVRBIFRvbW9ub3JpDQo+IDxmdWppdGEudG9tb25vcmlAZ21haWwu
Y29tPiB3cm90ZToNCj4+DQo+PiBIb3cgYWJvdXQgYWRkaW5nIGEgbGluayB0byB0aGUgaGVhZGVy
IGZpbGUgd2hlcmUgdGhlIG1pZ2h0X3NsZWVwIG1hY3JvDQo+PiBpcyBkZWZpbmVkLCBsaWtlIHRo
aXM/DQo+IA0KPiBTb3VuZHMgZ29vZCB0byBtZS4gVGhvdWdoLCBmb3IgQVBJcyB0aGF0IGhhdmUg
cmVuZGVyZWQgZG9jcywgd2UNCj4gdHlwaWNhbGx5IHBvaW50IHRvIHRob3NlIGluc3RlYWQ6DQo+
IA0KPiAgICAgaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZHJpdmVyLWFwaS9iYXNpY3MuaHRtbCNj
Lm1pZ2h0X3NsZWVwDQoNCkFoLCBzb21laG93LCBJIG92ZXJsb29rZWQgdGhhdC4gVGhhbmtzIQ0K
DQpCb3F1biwgaGVyZSBpcyB0aGUgcmV2aXNlZCB2ZXJzaW9uLg0KDQpkaWZmIC0tZ2l0IGEvcnVz
dC9oZWxwZXJzL3Rhc2suYyBiL3J1c3QvaGVscGVycy90YXNrLmMNCmluZGV4IDMxYzMzZWEyZGNl
Ni4uMmM4NWJiYzI3MjdlIDEwMDY0NA0KLS0tIGEvcnVzdC9oZWxwZXJzL3Rhc2suYw0KKysrIGIv
cnVzdC9oZWxwZXJzL3Rhc2suYw0KQEAgLTEsNyArMSwxMyBAQA0KIC8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wDQogDQorI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KICNpbmNs
dWRlIDxsaW51eC9zY2hlZC90YXNrLmg+DQogDQordm9pZCBydXN0X2hlbHBlcl9taWdodF9yZXNj
aGVkKHZvaWQpDQorew0KKwltaWdodF9yZXNjaGVkKCk7DQorfQ0KKw0KIHN0cnVjdCB0YXNrX3N0
cnVjdCAqcnVzdF9oZWxwZXJfZ2V0X2N1cnJlbnQodm9pZCkNCiB7DQogCXJldHVybiBjdXJyZW50
Ow0KZGlmZiAtLWdpdCBhL3J1c3Qva2VybmVsL3Rhc2sucnMgYi9ydXN0L2tlcm5lbC90YXNrLnJz
DQppbmRleCA4MzQzNjgzMTMwODguLmI3OWQxOWRlYjAyZSAxMDA2NDQNCi0tLSBhL3J1c3Qva2Vy
bmVsL3Rhc2sucnMNCisrKyBiL3J1c3Qva2VybmVsL3Rhc2sucnMNCkBAIC00MDAsMyArNDAwLDI3
IEBAIGZuIGVxKCZzZWxmLCBvdGhlcjogJkt1aWQpIC0+IGJvb2wgew0KIH0NCiANCiBpbXBsIEVx
IGZvciBLdWlkIHt9DQorDQorLy8vIEFubm90YXRpb24gZm9yIGZ1bmN0aW9ucyB0aGF0IGNhbiBz
bGVlcC4NCisvLy8NCisvLy8gRXF1aXZhbGVudCB0byB0aGUgQyBzaWRlIFtgbWlnaHRfc2xlZXBg
XSBtYWNybywgdGhpcyBmdW5jdGlvbiBzZXJ2ZXMgYXMNCisvLy8gYSBkZWJ1Z2dpbmcgYWlkIGFu
ZCBhIHBvdGVudGlhbCBzY2hlZHVsaW5nIHBvaW50Lg0KKy8vLw0KKy8vLyBUaGlzIGZ1bmN0aW9u
IGNhbiBvbmx5IGJlIHVzZWQgaW4gYSBub25hdG9taWMgY29udGV4dC4NCisvLy8NCisvLy8gW2Bt
aWdodF9zbGVlcGBdOiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9kcml2ZXItYXBpL2Jhc2ljcy5o
dG1sI2MubWlnaHRfc2xlZXANCisjW3RyYWNrX2NhbGxlcl0NCisjW2lubGluZV0NCitwdWIgZm4g
bWlnaHRfc2xlZXAoKSB7DQorICAgICNbY2ZnKENPTkZJR19ERUJVR19BVE9NSUNfU0xFRVApXQ0K
KyAgICB7DQorICAgICAgICBsZXQgbG9jID0gY29yZTo6cGFuaWM6OkxvY2F0aW9uOjpjYWxsZXIo
KTsNCisgICAgICAgIGxldCBmaWxlID0ga2VybmVsOjpmaWxlX2Zyb21fbG9jYXRpb24obG9jKTsN
CisNCisgICAgICAgIC8vIFNBRkVUWTogYGZpbGUuYXNfcHRyKClgIGlzIHZhbGlkIGZvciByZWFk
aW5nIGFuZCBndWFyYW50ZWVkIHRvIGJlIG51bC10ZXJtaW5hdGVkLg0KKyAgICAgICAgdW5zYWZl
IHsgY3JhdGU6OmJpbmRpbmdzOjpfX21pZ2h0X3NsZWVwKGZpbGUuYXNfcHRyKCkuY2FzdCgpLCBs
b2MubGluZSgpIGFzIGkzMikgfQ0KKyAgICB9DQorDQorICAgIC8vIFNBRkVUWTogQWx3YXlzIHNh
ZmUgdG8gY2FsbC4NCisgICAgdW5zYWZlIHsgY3JhdGU6OmJpbmRpbmdzOjptaWdodF9yZXNjaGVk
KCkgfQ0KK30NCg==
