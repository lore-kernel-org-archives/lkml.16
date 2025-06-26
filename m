Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7475F1D798E;
	Thu, 26 Jun 2025 00:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750896787; cv=none; b=L9oLjk1H7QN5NQTPdJ7uCWfRVzdJ4uUWXOSnoct7uZLylc9yqOxeZvMIkROCLTSB9DHsycHUVD+0GhBFLUJ7A/slM/OGqYPXLz5mEJIXhU2+tw70wWSX89aiU+FMo4Kw59fbjhy7y9ey5qoyISWa6Fdo0HoNLryNKYvyyaE5c44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750896787; c=relaxed/simple;
	bh=nAVHFD+i9xZWVVU/vBhB3qKx5mEAFbUlAUwinOef2J8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kB+agpoRyV0pbha0Q0uIrQ68flARAq4hjHYacwIcR2SEuHDojgMQ38HGVOhLwPcDslg/24C3eGF3lCDIhpSIA9twTi8L2EwbPhLLReMrI5rTe0uPE4BEYi+ZxgAzp5FpQEQbrtfJAv3ZMXTthYvXNwS0s02LzQ0EioYDlZfBPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiPrI1yQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiPrI1yQ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234bfe37cccso6278265ad.0;
        Wed, 25 Jun 2025 17:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750896785; x=1751501585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAVHFD+i9xZWVVU/vBhB3qKx5mEAFbUlAUwinOef2J8=;
        b=GiPrI1yQfmKH5p/yU6yyiO3b1JSSPNqr4NKdFhXypDwruhYH/DPFOd1tdHB9tphk4n
         78zxmm9/CCNdw7ku3nMhkAJj/wnqaxfDjQguGW3EZl2WwIKFXP09TYBvdVYQHRGw64lI
         TdQI4qegtue9CY5Znks6VuQE2YHPB2tDi1rLtAI9sXtRjyBYfL1Ua7ldWzMIb3I3vrhz
         V9db7hFte+d0ncMBmkK7kS/GZZ98KZknd32xYwt+dZ2P7/b26kc3dyMz3xOO1sit9RUL
         6/hSOHixIbfUumTKigggRQ2wzT+vE/0ox6FLxj8qqZirp/fImfRU/zhWNY94xGbcVuWm
         GUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750896785; x=1751501585;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nAVHFD+i9xZWVVU/vBhB3qKx5mEAFbUlAUwinOef2J8=;
        b=qDsBroLUk8H7VU4BlXTsvtHaHzNjXEALMZ69z8pyaNcoRJobWHziuTK1f183XwsOZo
         OLZQEMd5OGYjZ9ZakX6cSpx4aoDtzamdVPXr1Eu6lwufr0EYbB6QATpTSHX13UC+Masc
         tw2/oD3aNL08+vF2P0BHamT+/2Gan0roOsEky0x414MAS4PKF90r3m6S4jhd6fc9csZH
         JvHGxvHdPAzKjj7xJNwAqWOOc5n3Un3UNjuhuIzceu9Maeg8gDm9LVK1h236v04Oo1FV
         mUU3i+NQc7puLZOtUaerhbWmIjYpZbZu3ZapwlG16pGhTsOB98/3CA+WDq1ZEH5Mzo0Z
         Falg==
X-Forwarded-Encrypted: i=1; AJvYcCWHYYlArnhC7drrNzpLCwBrexvfgqXfifx4owVKnzg8/xfLsEs4jjgFw+8J6UFeQrPdsdkBhSkxtQpJ7Fc=@vger.kernel.org, AJvYcCXEJ0nTlKUCF99CeiYsU+6O30vIdJmeIVCpnDDFRE8OWvT9pmJ5lPohsBH3hcP9NgKhTBLT7ZbJAnlNF0P8MgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGI5B98IUbucnLRNizKHx1xxTl5WdcduAzlAQhINEyJyBQyUfh
	k+HT3B4vTcoB4oqr5ZgyOxPR1zFaOmxwiF5IkEwpVz0S9Fnkq51QrqYAFyJ5kQJI
X-Gm-Gg: ASbGncu1nk7p2JWlx2GH2+lCGVcnxqKe5jwaVyCBJxFxHon+jbXSQMXIb1vw6UmTrKA
	fsOYw4owCd0sgPWBtnqWrqBgRNTAAx8Aav0jYt+ScjQLWRZhwJqeOq8d86Hyk0G/gNIKz/4WUBQ
	L/B1nyakobC/AF53c+zDLiLHHvKqUPl21Eug6YSXpHtiwV39GWlFGOjEU0TgQB0RIHxIch8hOwn
	1QEj2D3pQaySrJG+YWQZR3zth+zyhDnEkdnU8mUfrOk5cEBinscL+5S6vZTRlwHYy5MqGYZhR2m
	RVg5VkSiezFRpj5/h2Elz06yEkZj1U3l1KsQ8nl++dtcGVx1WZrTSt+Or9XsavQiQe6dQJYVaMn
	Rm5e3tpvQ5CiLDv9owVo6AUI2qzLsTM/uQNrLutAz
X-Google-Smtp-Source: AGHT+IE35C4YzBhApDL/QlPCpZu3UDcvIFW6f+pu3aTaGKSjpNeS+Vx15cLfn4EdGf95ihJ52v2NzQ==
X-Received: by 2002:a17:902:e743:b0:235:e76c:4362 with SMTP id d9443c01a7336-238240f4048mr66997305ad.18.1750896784561;
        Wed, 25 Jun 2025 17:13:04 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d864bc91sm142973835ad.150.2025.06.25.17.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 17:13:04 -0700 (PDT)
Date: Thu, 26 Jun 2025 09:12:48 +0900 (JST)
Message-Id: <20250626.091248.526065656918619245.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org, miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
 lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <877c102pxs.fsf@kernel.org>
References: <94kOZwdYnRPRMO6SAHAvEFEygT4dU-njfBxTMC6BiPQ-u49pyL5hLgbLQBGOct1ruxVJPtYGJ0Dq0Ns2mh-sMQ==@protonmail.internalid>
	<20250625.082020.1714542193051382332.fujita.tomonori@gmail.com>
	<877c102pxs.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-7
Content-Transfer-Encoding: base64

T24gV2VkLCAyNSBKdW4gMjAyNSAxMDoxOTo1OSArMDIwMA0KQW5kcmVhcyBIaW5kYm9yZyA8YS5o
aW5kYm9yZ0BrZXJuZWwub3JnPiB3cm90ZToNCg0KPiAiRlVKSVRBIFRvbW9ub3JpIiA8ZnVqaXRh
LnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JpdGVzOg0KPiANCj4+IE9uIFR1ZSwgMjQgSnVuIDIwMjUg
MjE6MDM6MjQgKzAyMDANCj4+IEFuZHJlYXMgSGluZGJvcmcgPGEuaGluZGJvcmdAa2VybmVsLm9y
Zz4gd3JvdGU6DQo+Pg0KPj4+IEFuZHJlYXMgSGluZGJvcmcgPGEuaGluZGJvcmdAa2VybmVsLm9y
Zz4gd3JpdGVzOg0KPj4+DQo+Pj4+ICJGVUpJVEEgVG9tb25vcmkiIDxmdWppdGEudG9tb25vcmlA
Z21haWwuY29tPiB3cml0ZXM6DQo+Pj4+DQo+Pj4+PiBPbiBUdWUsIDI0IEp1biAyMDI1IDE1OjEx
OjMxICswMjAwDQo+Pj4+PiBBbmRyZWFzIEhpbmRib3JnIDxhLmhpbmRib3JnQGtlcm5lbC5vcmc+
IHdyb3RlOg0KPj4+Pj4NCj4+Pj4+Pj4gYW5kIGFscmVhZHkgaW50cm9kdWNlcyBwYWluIGZvcg0K
Pj4+Pj4+PiBvdGhlcnMgKGFuZCBsaWtlbHkgZXZlbiBtb3JlIHBhaW4gd2hlbiB3ZSBuZWVkIHRv
IHJlbmFtZSBpdCBiYWNrIG5leHQNCj4+Pj4+Pj4gY3ljbGUpLCBpdCBkb2Vzbid0IGxvb2sgbGlr
ZSBhIGdvb2QgaWRlYSB0byBrZWVwIGl0Lg0KPj4+Pj4+DQo+Pj4+Pj4gT2ssIEknbGwgZHJvcCBp
dC4NCj4+Pj4+DQo+Pj4+PiBEbyB5b3Ugd2FudCBtZSB0byBzZW5kIHRoZSB1cGRhdGVkIGhydGlt
ZXIgY29udmVyc2lvbiBwYXRjaHNldA0KPj4+Pj4gKHVzaW5nIGFzXyogbmFtZXMpPw0KPj4+Pg0K
Pj4+PiBObywgSSBhbSBqdXN0IGFib3V0IGZpbmlzaGVkIGZpeGluZyB1cCB0aGUgcmVzdC4gWW91
IGNhbiBjaGVjayBpZiBpdCBpcw0KPj4+PiBPSyB3aGVuIEkgcHVzaC4NCj4+Pg0KPj4+IEkgcHVz
aGVkIGl0LCBwbGVhc2UgY2hlY2suDQo+Pg0KPj4gVGhhbmtzIQ0KPj4NCj4+IFRoZSBjb21taXQg
ZDlmYzAwZGM3MzU0ICgicnVzdDogdGltZTogQWRkIEhyVGltZXJFeHBpcmVzIHRyYWl0IikgYWRk
cw0KPj4gdG8gSW5zdGFudCBzdHJ1Y3R1cmU6DQo+Pg0KPj4gKyAgICAjW2lubGluZV0NCj4+ICsg
ICAgcHViKGNyYXRlKSBmbiBhc19uYW5vcygmc2VsZikgLT4gaTY0IHsNCj4+ICsgICAgICAgIHNl
bGYuaW5uZXINCj4+ICsgICAgfQ0KPj4NCj4+IFdvdWxkIGl0IGJlIGJldHRlciB0byB0YWtlIHNl
bGYgaW5zdGVhZCBvZiAmc2VsZj8NCj4+DQo+PiBwdWIoY3JhdGUpIGZuIGFzX25hbm9zKHNlbGYp
IC0+IGk2NCB7DQo+Pg0KPj4gQmVjYXVzZSB0aGUgYXNfbmFub3MgbWV0aG9kIG9uIHRoZSBEZWx0
YSBzdHJ1Y3QgdGFrZXMgc2VsZiwgd291bGRuonQgaXQNCj4+IGJlIGJldHRlciB0byBrZWVwIGl0
IGNvbnNpc3RlbnQ/IEkgdGhpbmsgdGhhdCBteSBvcmlnaW5hbCBwYXRjaCBhZGRzDQo+PiBpbnRv
X25hbm9zKCkgdGhhdCB0YWtlcyBzZWxmLg0KPj4NCj4+IFRoaXMgY29tbWl0IGFsc28gYWRkcyBI
clRpbWVyRXhwaXJlIHN0cmFpdCwgd2hpY2ggYXNfbmFub3MoKSBtZXRob2QNCj4+IHRha2VzICZz
ZWxmOg0KPj4NCj4+ICsvLy8gVGltZSByZXByZXNlbnRhdGlvbnMgdGhhdCBjYW4gYmUgdXNlZCBh
cyBleHBpcmF0aW9uIHZhbHVlcyBpbiBbYEhyVGltZXJgXS4NCj4+ICtwdWIgdHJhaXQgSHJUaW1l
ckV4cGlyZXMgew0KPj4gKyAgICAvLy8gQ29udmVydHMgdGhlIGV4cGlyYXRpb24gdGltZSBpbnRv
IGEgbmFub3NlY29uZCByZXByZXNlbnRhdGlvbi4NCj4+ICsgICAgLy8vDQo+PiArICAgIC8vLyBU
aGlzIHZhbHVlIGNvcnJlc3BvbmRzIHRvIGEgcmF3IGt0aW1lX3QgdmFsdWUsIHN1aXRhYmxlIGZv
ciBwYXNzaW5nIHRvIGtlcm5lbA0KPj4gKyAgICAvLy8gdGltZXIgZnVuY3Rpb25zLiBUaGUgaW50
ZXJwcmV0YXRpb24gKGFic29sdXRlIHZzIHJlbGF0aXZlKSBkZXBlbmRzIG9uIHRoZQ0KPj4gKyAg
ICAvLy8gYXNzb2NpYXRlZCBbSHJUaW1lck1vZGVdIGluIHVzZS4NCj4+ICsgICAgZm4gYXNfbmFu
b3MoJnNlbGYpIC0+IGk2NDsNCj4+ICt9DQo+Pg0KPj4gVGhhdCdzIGJlY2F1c2UgYXMgSSByZXBv
cnRlZCwgQ2xpcHB5IHdhcm5zIGlmIGFzXyogdGFrZSBzZWxmLg0KPj4NCj4+IEFzIEFsaWNlIHBv
aW50ZWQgb3V0LCBDbGlwcHkgZG9lc24ndCB3YXJuIGlmIGEgdHlwZSBpbXBsZW1lbnRzDQo+PiBD
b3B5LiBTbyB3ZSBjYW4gYWRkIENvcHkgdG8gSHJUaW1lckV4cGlyZXMgdHJhaXQsIHRoZW4gQ2xp
cHB5IGRvZXNuJ3QNCj4+IHdhcm4gYWJvdXQgYXNfbmFub3MgbWV0aG9kIHRoYXQgdGFrZXMgc2Vs
ZjoNCj4+DQo+PiArLy8vIFRpbWUgcmVwcmVzZW50YXRpb25zIHRoYXQgY2FuIGJlIHVzZWQgYXMg
ZXhwaXJhdGlvbiB2YWx1ZXMgaW4gW2BIclRpbWVyYF0uDQo+PiArcHViIHRyYWl0IEhyVGltZXJF
eHBpcmVzOiBDb3B5IHsNCj4+ICsgICAgLy8vIENvbnZlcnRzIHRoZSBleHBpcmF0aW9uIHRpbWUg
aW50byBhIG5hbm9zZWNvbmQgcmVwcmVzZW50YXRpb24uDQo+PiArICAgIC8vLw0KPj4gKyAgICAv
Ly8gVGhpcyB2YWx1ZSBjb3JyZXNwb25kcyB0byBhIHJhdyBrdGltZV90IHZhbHVlLCBzdWl0YWJs
ZSBmb3IgcGFzc2luZyB0byBrZXJuZWwNCj4+ICsgICAgLy8vIHRpbWVyIGZ1bmN0aW9ucy4gVGhl
IGludGVycHJldGF0aW9uIChhYnNvbHV0ZSB2cyByZWxhdGl2ZSkgZGVwZW5kcyBvbiB0aGUNCj4+
ICsgICAgLy8vIGFzc29jaWF0ZWQgW0hyVGltZXJNb2RlXSBpbiB1c2UuDQo+PiArICAgIGZuIGFz
X25hbm9zKHNlbGYpIC0+IGk2NDsNCj4+ICt9DQo+Pg0KPj4gSSdtIGZpbmUgd2l0aCBlaXRoZXIg
KHRha2luZyAmc2VsZiBvciBBZGRpbmcgQ29weSkuDQo+IA0KPiBMZXQncyB3YWl0IGZvciB0aGUg
d2hvbGUgbmFtaW5nIGRpc2N1c3Npb24gdG8gcmVzb2x2ZSBiZWZvcmUgd2UgZG8NCj4gYW55dGhp
bmcuIEkgYW0gaG9uZXN0bHkgYSBiaXQgY29uZnVzZWQgYXMgdG8gd2hhdCBpcyB0aGUgbW9zdCBp
ZGlvbWF0aWMNCj4gcmVzb2x1dGlvbiBoZXJlLg0KPiANCj4gSSB0aGluayB0YWtpbmcgYCZzZWxm
YCB2cyBgc2VsZmAgbWFrZXMgbm90IGRpZmZlcmVuY2UgaW4gY29kZWdlbiBpZiB3ZQ0KPiBtYXJr
IHRoZSBmdW5jdGlvbiBgI1tpbmxpbmUoYWx3YXlzKV1gLg0KDQpJIGJlbGlldmUgd2UndmUgcmVh
Y2hlZCBhIGNvbnNlbnN1cyBvbiB0aGUgZGlzY3Vzc2lvbiBhYm91dCBgJnNlbGZgIHZzDQpgc2Vs
ZmAuDQoNCk1pZ3VlbCBzdW1tYXJpemVkIG5pY2VseToNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC9DQU5pcTcybmQ2bTNlT3hGKzZrc2NYdVZ1N3VMaW00S2dwT051cGdUc01jQUY5VE5o
WVFAbWFpbC5nbWFpbC5jb20vDQoNCj4+IFllcywgSSB3b3VsZCBwcmVmZXIgdGFraW5nIGJ5IHZh
bHVlLiBJIHRoaW5rIEFsaWNlIG1lbnRpb25lZCBlYXJsaWVyIGluDQo+PiB0aGlzIHRocmVhZCB0
aGF0IHRoZSBjb21waWxlciB3aWxsIGJlIHNtYXJ0IGFib3V0IHRoaXMgYW5kIGp1c3QgcGFzcyB0
aGUNCj4+IHZhbHVlLiBCdXQgaXQgc3RpbGwgZmVlbHMgd3JvbmcgdG8gbWUuDQo+IA0KPiBJZiBp
bmxpbmVkL3ByaXZhdGUsIHllczsgYnV0IG5vdCBhbHdheXMuDQo+IA0KPiBTbyBmb3Igc21hbGwg
KCJmcmVlIikgZnVuY3Rpb25zIGxpa2UgdGhpcywgaXQgc2hvdWxkIGdlbmVyYWxseSBub3QNCj4g
bWF0dGVyLCBzaW5jZSB0aGV5IHNob3VsZCBiZSBpbmxpbmVkIHdoZXRoZXIgYnkgbWFudWFsIG1h
cmtpbmcgb3IgYnkNCj4gdGhlIGNvbXBpbGVyLg0KDQo+IEJ1dCwgaW4gZ2VuZXJhbCwgaXQgaXMg
bm90IHRoZSBzYW1lLCBhbmQgeW91IGNhbiBzZWUgY2FzZXMgd2hlcmUgdGhlDQo+IGNvbXBpbGVy
IHdpbGwgc3RpbGwgcGFzcyBhIHBvaW50ZXIsIGFuZCB0aHVzIGRlcmVmZXJlbmNlcyBhbmQgd3Jp
dGVzDQo+IHRvIG1lbW9yeSB0byB0YWtlIGFuIGFkZHJlc3MgdG8gcGFzcyBpdC4NCj4gDQo+IFdo
aWNoIG1lYW5zIHRoYXQsIG91dHNpZGUgc21hbGwgdGhpbmdzIGxpa2UgYGFzXypgLCBvbmUgc2hv
dWxkIHN0aWxsDQo+IHByb2JhYmx5IHRha2UgYnkgdmFsdWUuIFdoaWNoIGNyZWF0ZXMgYW4gaW5j
b25zaXN0ZW5jeS4NCg0KDQpJIHRoaW5rIHRoYXQgYW5vdGhlciBjb25zZW5zdXMgZnJvbSB0aGlz
IGRpc2N1c3Npb24gaXMgdGhhdCB0aGUgdGFibGUNCmluIHRoZSBBUEkgbmFtaW5nIGd1aWRlbGlu
ZXMgZG9lc24ndCBjb3ZlciB0aGlzIHBhcnRpY3VsYXIgY2FzZS4NClRoZXJlZm9yZSwgaXQgbWFr
ZXMgc2Vuc2UgdG8ga2VlcCB0aGUgY3VycmVudCBmdW5jdGlvbiBuYW1lIGFuZCBtb3ZlDQpmb3J3
YXJkLg0KDQpEZWx0YSBhbHJlYWR5IHByb3ZpZGVzIGBmbiBhc19uYW5vcyhzZWxmKWAgKGFuZCBk
cm0gdXNlcyBpbg0KbGludXgtbmV4dCwgYXMgeW91IGtub3cpIHNvIEkgYmVsaWV2ZSB0aGF0IElu
c3RhbnQgc2hvdWxkIHVzZSB0aGUgc2FtZQ0KaW50ZXJmYWNlLg0KDQoNClRoYXQgdGFibGUgbmVl
ZHMgaW1wcm92ZW1lbnQsIGJ1dCByZWFjaGluZyBjb25zZW5zdXMgd2lsbCBsaWtlbHkgdGFrZQ0K
dGltZSwgaXQgbWFrZXMgc2Vuc2UgdG8gYWRkcmVzcyBpdCBpbmRlcGVuZGVudGx5Lg0K
