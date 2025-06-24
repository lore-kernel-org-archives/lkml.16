Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA822CCC1;
	Tue, 24 Jun 2025 23:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807235; cv=none; b=VzT9F7vGiwt1XQWE/1akN2iaZbm26o/Weg3Auic9y/opvRgsGK73n54w3i1kThcYGnpVCxZKfGzFYGawfz6FLuNLLA9lyUGKnV+FceAeHriZ5cZdfTIP+DYIjQUJZEVsCsOIR4gZcFZ6Gi0aSvm4wSyDgqeR52JGLy+fPB8E6TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807235; c=relaxed/simple;
	bh=wOHD0SgMzZAtR543TlfjWsKkA3Vc34NprgOavgZiRkc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sSLYHlUEiSh5cHh3wSJr/SgRg4H4Sbi+Uu+D8yvBxDSmTxVK0pRDczrr/mVMu8On440QoabpYOSkhLYO1N98JOOfjXW+RMB/SC97JuRkcty1WvXPh/OGwma9G9FGNs4vjL1UeQkSxxOuzswKPiiFTwEvjlq+XWJD/QhBhO7HlCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pa/EmC6P; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pa/EmC6P"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23526264386so65286805ad.2;
        Tue, 24 Jun 2025 16:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750807233; x=1751412033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOHD0SgMzZAtR543TlfjWsKkA3Vc34NprgOavgZiRkc=;
        b=Pa/EmC6PPPfQrIWPpiXDOic4Y0NS7ozNZjfdFoLmQdraf1Puv0188ZK1zFFDQ/bZQm
         7mR9jtHfTW2ofEs+yPzwIMfo5nJkpU4CK3aMfC+gtqPSXmGUjDq9pwsSNhkT/UVlOfBa
         sVVhBywNcef5fzeSqfUpUUp9kp9lHm/MIlBQhOCp2ifHsE+d312a5pdJfg8G4i1xQGAY
         H34caV5Kr2LLjv9cEWbQJ2ybKvIK7LqPXl7fvGPhNmA7H15NfiJP45V/14XDBcBs8Qon
         LDIdSvwSKMdH5BA2RocX/DeQgLJdPekRYrdBIiafnKK414MZqLk3XbVfhKxIpDVrTAv9
         9TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750807233; x=1751412033;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wOHD0SgMzZAtR543TlfjWsKkA3Vc34NprgOavgZiRkc=;
        b=BXa9jn4w1PoS+zd5fWt+1aT7jVY2wpcEu39yvGCcIVVJ8o767HaEPzN7E8vWyf5k9/
         DDXcDdpFosmryLa1God/viI1exNLgofmAsnqKFfR5nfOt23uM6/2MTVxRq1/DnAkSkhZ
         QfceODd2U7xwzlJc392UuyhYC5bFmCcRYg09Hmv9bQqLGNC/4fNBnfybhot5TOs3PlmB
         DTy7+RXwN8RBeGdPmU1E15mMo7z4aZRFel/xMe7EPjzzPh5SC0pkiDGDDhOJEOdolbAC
         IgyF7VS2xYpasH2bmlf/Pe3/wFg4izaksB42WFuoOBK4s+W6HZFoi6SwzRQQNzRMIMEV
         RBrg==
X-Forwarded-Encrypted: i=1; AJvYcCXXoJF1AvBreKXMQytYgeh2CyAOEMTIGFXz8d/6OpRn8ivOFN81UN07zvXPny/XxH2obW2DGEDWkiMHwpXpeDw=@vger.kernel.org, AJvYcCXZ7BBxo7M2vbb4+mGmtSriot8ErwiTObJWlDBUW6xZKYxIA9VEjdcAawUVULyv7wP6FrM12uN6l7yIOhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4KOx28m9w+OoBEp5kXkjJCDFwgILJXzUt0diyugPYYZz3VxLK
	PQZy9bZQKSPeFE1ocDw6KJFF0lZyW3SMWD5Iz3P31z4XgURZkqeXgtlq
X-Gm-Gg: ASbGncsNSLbzOHTV8uLt9wFt97UKWJDo+DsHgYq8AqTX2jL5V3zKJws6ZcOrgTzrLOj
	cyULatGmTea8Ku58HpMhbVUkKzyu3MV7cG0vpUj6SJqHkdfmw3AR8ZFNkb1s1H/ta6y46WV1A1n
	RyzcVpUICKXIODN+KlHG3L7Dk0bf7Lmmy/shYqrjb450hjEZsgiHg4Chqtrhqn/uL4nDWLa6Xz8
	QGmI/+QPjJbXxFtk10fDpYcI8T9QNik+DSHa5NC8LTkgfoWMCIQ9yJ9WShI2rnmkEwJCBIwb43f
	kd5wW8Llg41sv5dIHQy7X9Yn7g5p9x5pZmMUV1HW+APXyNqwlhrgEPYxpsN3ALw7IBLU9eEtA4O
	AAYth2r8aMdYJfj9snYX6iRTgCSpwzTQnGqx8v1wo
X-Google-Smtp-Source: AGHT+IGJaGuRMxNfrWWSjg38U9ompKDJ8WOzfj8301tYTS2tc+Y5WQTIzkUwMler6gUdozl73qywEA==
X-Received: by 2002:a17:902:da88:b0:234:a139:1216 with SMTP id d9443c01a7336-23824087149mr20616685ad.44.1750807233556;
        Tue, 24 Jun 2025 16:20:33 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d839389esm117859325ad.41.2025.06.24.16.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:20:33 -0700 (PDT)
Date: Wed, 25 Jun 2025 08:20:20 +0900 (JST)
Message-Id: <20250625.082020.1714542193051382332.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, miguel.ojeda.sandonis@gmail.com,
 alex.gaynor@gmail.com, ojeda@kernel.org, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org,
 lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87cyat2c8z.fsf@kernel.org>
References: <20250624.224130.2089845741064711087.fujita.tomonori@gmail.com>
	<87o6ud2fbx.fsf@kernel.org>
	<87cyat2c8z.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-7
Content-Transfer-Encoding: base64

T24gVHVlLCAyNCBKdW4gMjAyNSAyMTowMzoyNCArMDIwMA0KQW5kcmVhcyBIaW5kYm9yZyA8YS5o
aW5kYm9yZ0BrZXJuZWwub3JnPiB3cm90ZToNCg0KPiBBbmRyZWFzIEhpbmRib3JnIDxhLmhpbmRi
b3JnQGtlcm5lbC5vcmc+IHdyaXRlczoNCj4gDQo+PiAiRlVKSVRBIFRvbW9ub3JpIiA8ZnVqaXRh
LnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JpdGVzOg0KPj4NCj4+PiBPbiBUdWUsIDI0IEp1biAyMDI1
IDE1OjExOjMxICswMjAwDQo+Pj4gQW5kcmVhcyBIaW5kYm9yZyA8YS5oaW5kYm9yZ0BrZXJuZWwu
b3JnPiB3cm90ZToNCj4+Pg0KPj4+Pj4gYW5kIGFscmVhZHkgaW50cm9kdWNlcyBwYWluIGZvcg0K
Pj4+Pj4gb3RoZXJzIChhbmQgbGlrZWx5IGV2ZW4gbW9yZSBwYWluIHdoZW4gd2UgbmVlZCB0byBy
ZW5hbWUgaXQgYmFjayBuZXh0DQo+Pj4+PiBjeWNsZSksIGl0IGRvZXNuJ3QgbG9vayBsaWtlIGEg
Z29vZCBpZGVhIHRvIGtlZXAgaXQuDQo+Pj4+DQo+Pj4+IE9rLCBJJ2xsIGRyb3AgaXQuDQo+Pj4N
Cj4+PiBEbyB5b3Ugd2FudCBtZSB0byBzZW5kIHRoZSB1cGRhdGVkIGhydGltZXIgY29udmVyc2lv
biBwYXRjaHNldA0KPj4+ICh1c2luZyBhc18qIG5hbWVzKT8NCj4+DQo+PiBObywgSSBhbSBqdXN0
IGFib3V0IGZpbmlzaGVkIGZpeGluZyB1cCB0aGUgcmVzdC4gWW91IGNhbiBjaGVjayBpZiBpdCBp
cw0KPj4gT0sgd2hlbiBJIHB1c2guDQo+IA0KPiBJIHB1c2hlZCBpdCwgcGxlYXNlIGNoZWNrLg0K
DQpUaGFua3MhDQoNClRoZSBjb21taXQgZDlmYzAwZGM3MzU0ICgicnVzdDogdGltZTogQWRkIEhy
VGltZXJFeHBpcmVzIHRyYWl0IikgYWRkcw0KdG8gSW5zdGFudCBzdHJ1Y3R1cmU6DQoNCisgICAg
I1tpbmxpbmVdDQorICAgIHB1YihjcmF0ZSkgZm4gYXNfbmFub3MoJnNlbGYpIC0+IGk2NCB7DQor
ICAgICAgICBzZWxmLmlubmVyDQorICAgIH0NCg0KV291bGQgaXQgYmUgYmV0dGVyIHRvIHRha2Ug
c2VsZiBpbnN0ZWFkIG9mICZzZWxmPw0KDQpwdWIoY3JhdGUpIGZuIGFzX25hbm9zKHNlbGYpIC0+
IGk2NCB7DQoNCkJlY2F1c2UgdGhlIGFzX25hbm9zIG1ldGhvZCBvbiB0aGUgRGVsdGEgc3RydWN0
IHRha2VzIHNlbGYsIHdvdWxkbqJ0IGl0DQpiZSBiZXR0ZXIgdG8ga2VlcCBpdCBjb25zaXN0ZW50
PyBJIHRoaW5rIHRoYXQgbXkgb3JpZ2luYWwgcGF0Y2ggYWRkcw0KaW50b19uYW5vcygpIHRoYXQg
dGFrZXMgc2VsZi4gDQoNClRoaXMgY29tbWl0IGFsc28gYWRkcyBIclRpbWVyRXhwaXJlIHN0cmFp
dCwgd2hpY2ggYXNfbmFub3MoKSBtZXRob2QNCnRha2VzICZzZWxmOg0KDQorLy8vIFRpbWUgcmVw
cmVzZW50YXRpb25zIHRoYXQgY2FuIGJlIHVzZWQgYXMgZXhwaXJhdGlvbiB2YWx1ZXMgaW4gW2BI
clRpbWVyYF0uDQorcHViIHRyYWl0IEhyVGltZXJFeHBpcmVzIHsNCisgICAgLy8vIENvbnZlcnRz
IHRoZSBleHBpcmF0aW9uIHRpbWUgaW50byBhIG5hbm9zZWNvbmQgcmVwcmVzZW50YXRpb24uDQor
ICAgIC8vLw0KKyAgICAvLy8gVGhpcyB2YWx1ZSBjb3JyZXNwb25kcyB0byBhIHJhdyBrdGltZV90
IHZhbHVlLCBzdWl0YWJsZSBmb3IgcGFzc2luZyB0byBrZXJuZWwNCisgICAgLy8vIHRpbWVyIGZ1
bmN0aW9ucy4gVGhlIGludGVycHJldGF0aW9uIChhYnNvbHV0ZSB2cyByZWxhdGl2ZSkgZGVwZW5k
cyBvbiB0aGUNCisgICAgLy8vIGFzc29jaWF0ZWQgW0hyVGltZXJNb2RlXSBpbiB1c2UuDQorICAg
IGZuIGFzX25hbm9zKCZzZWxmKSAtPiBpNjQ7DQorfQ0KDQpUaGF0J3MgYmVjYXVzZSBhcyBJIHJl
cG9ydGVkLCBDbGlwcHkgd2FybnMgaWYgYXNfKiB0YWtlIHNlbGYuDQoNCkFzIEFsaWNlIHBvaW50
ZWQgb3V0LCBDbGlwcHkgZG9lc24ndCB3YXJuIGlmIGEgdHlwZSBpbXBsZW1lbnRzDQpDb3B5LiBT
byB3ZSBjYW4gYWRkIENvcHkgdG8gSHJUaW1lckV4cGlyZXMgdHJhaXQsIHRoZW4gQ2xpcHB5IGRv
ZXNuJ3QNCndhcm4gYWJvdXQgYXNfbmFub3MgbWV0aG9kIHRoYXQgdGFrZXMgc2VsZjoNCg0KKy8v
LyBUaW1lIHJlcHJlc2VudGF0aW9ucyB0aGF0IGNhbiBiZSB1c2VkIGFzIGV4cGlyYXRpb24gdmFs
dWVzIGluIFtgSHJUaW1lcmBdLg0KK3B1YiB0cmFpdCBIclRpbWVyRXhwaXJlczogQ29weSB7DQor
ICAgIC8vLyBDb252ZXJ0cyB0aGUgZXhwaXJhdGlvbiB0aW1lIGludG8gYSBuYW5vc2Vjb25kIHJl
cHJlc2VudGF0aW9uLg0KKyAgICAvLy8NCisgICAgLy8vIFRoaXMgdmFsdWUgY29ycmVzcG9uZHMg
dG8gYSByYXcga3RpbWVfdCB2YWx1ZSwgc3VpdGFibGUgZm9yIHBhc3NpbmcgdG8ga2VybmVsDQor
ICAgIC8vLyB0aW1lciBmdW5jdGlvbnMuIFRoZSBpbnRlcnByZXRhdGlvbiAoYWJzb2x1dGUgdnMg
cmVsYXRpdmUpIGRlcGVuZHMgb24gdGhlDQorICAgIC8vLyBhc3NvY2lhdGVkIFtIclRpbWVyTW9k
ZV0gaW4gdXNlLg0KKyAgICBmbiBhc19uYW5vcyhzZWxmKSAtPiBpNjQ7DQorfQ0KDQpJJ20gZmlu
ZSB3aXRoIGVpdGhlciAodGFraW5nICZzZWxmIG9yIEFkZGluZyBDb3B5KS4NCg0K
