Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4329478;
	Mon, 30 Jun 2025 23:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751326801; cv=none; b=BHo9U+wCTVcZr61pWyS7Ugz/BSEjPu3y+6GjHUKywN/003Ots5W/brYj0eYQf6GVUlzcmVz97F4axljJlwfcI5/q18+15MvUbVU/nb+sgZXmpASSi++KynVl0xMUWmgF6R9I5/zA4wv0a3uamj6kQga87xn/dPMbEtm+OeGPD/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751326801; c=relaxed/simple;
	bh=CYre7OL2mRvivFFml9SLwffbKKDDylW5Otv7Fe/ZbrU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PoqtgOI3hlDRnd6x66tJ0ehur/+Pc/VIF+507vO+wDRahO6zjySHRBbo24lDNbqQylti2xPtAhLMbAIuY7ZpHDQtzl39TFlH8owrQR2li3nFDEs0P1oRf6yAXloe/zgtpNwL94m8Uau6OQ1u1OJMQMALsCURMyws5OsWybqU7WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdV9DK6M; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdV9DK6M"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so5665863b3a.0;
        Mon, 30 Jun 2025 16:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751326799; x=1751931599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYre7OL2mRvivFFml9SLwffbKKDDylW5Otv7Fe/ZbrU=;
        b=LdV9DK6Mqxkb8vDCAPQxNG/SNnce3idnJVwagDqmPP4n+LSxwtVg52B54juzP+v7nG
         Ok0AupfBn50pIcmaQLw8hIhk9sCa653bIEHi22I+nXeW0BTTOgu3hPqe9Sc3hY+U2xVH
         e7RiYUuIEPWQd9TCFbaW2yRqxyqjp+/Lrr7BvyFkcp/BnuLoi/ZUouzH5cUsbHOWluPo
         LAu9YRf9wK+NQT0zdrNbBkfi2feBmmmTHo214prBmsubxT20tHkPXEO56/zwww23AR31
         2H53lEyuIOrYo46jxxlM9VDhccyo/KBswpXvodik7HOGanAXbP9raqHA/XYZk3F+Six/
         yyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751326799; x=1751931599;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CYre7OL2mRvivFFml9SLwffbKKDDylW5Otv7Fe/ZbrU=;
        b=GZsBaqYCuo/rLwLmsO8yVQKvwTkSRMzTRTnKL7F3ZaYAvCkekWT4jeFWpf1dDNTMmK
         auTFEvUngl8lgHa6+2/seMSvszPBNiZy7LNUxxscpIuAnq+HiEx7C7AZiMO5Rx0A8w31
         YXSE+CK4qPed98Ec9X5wany1P61uMoGmh8V02smYDGU6zAVhQ3wX+fSDIahx8bjFZ+qs
         3UMhHt3KE8UEHZ+wD/0DiIfEvrd8VB61ZWKUMv26pD1b7O1iJoXkXZGzVjEexVlevP9n
         IRq8hzSxCDgCrCbw9NxkVeiXLYjpHGCFE2uM8v7HLDBBxJoKniJCVcPXlGvr+s9+D7jJ
         T3lw==
X-Forwarded-Encrypted: i=1; AJvYcCV8uoF23S6KE4dbIG86CFmHpGzNKa3/daDjgFhRwPueVvFBxXd+L2I0b66MHXFH5SIay9eN8OC/1Lc/zxVTW7M=@vger.kernel.org, AJvYcCWky4znBrtWscLl8WorkcMgpLr7sZpE+BgEZxkgoKctqeejTjscPk0FgXcctTmPQTcwl6ajI096OWy0Fq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywusgjjw5jEIvAoVRrWKIfwLW6mgnpWmvcqzZotxS8c1mRmC8p9
	U25UfscNLw3qVOf1TaDLtauOwPPxwcFXWJor5e8LWjzA3mBPAMcRa3Nc
X-Gm-Gg: ASbGncseWxvTwCOmQTgmiQ6CD604zcuLSUlhtH3F2Tw50yNdXCEbF+dbLYDAHgdIP8J
	UZK77o2r+xoL4x+zlMtdR+fcBWRBOLhwwiSUBCYp4S162DBy2n3PRHIklIM255uG4Pv6L4Va8Ln
	EKR/ImUiEn3lQF+KWv0nq36Js4o3JtHD4n29fLe2NetVGqvruGrClpEmYs+1AeDlzYmSf8OVXXz
	5MjoB9dosDQyB1gnJlKmIHXvyySG0rABx5TvjN/gbcWPAVM2Nf+GkGW9DV3w2bir54VcqJaJfoD
	OInjRNM10zBXqWRoDWe0zt8vS5A2JeXrfnlixA6VrUuwV5pFk9bf0yLzCkIXqCE/uSQq7KAYxFB
	POoKdtDg+qP36m4wlieiNsHQ4hhRfPj8I0jYmhMEnGGW+wZZiO9U=
X-Google-Smtp-Source: AGHT+IEeXmH+JJybTRW5p9il5o29FFDX0lq8gJv9ny+NPMnLdkd1UgA+uKN238FefGwfCoeL/Xh0OQ==
X-Received: by 2002:a05:6a00:3315:b0:74b:b11:edd5 with SMTP id d2e1a72fcca58-74b0b11f1e8mr16616776b3a.3.1751326798566;
        Mon, 30 Jun 2025 16:39:58 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540b389sm10305688b3a.35.2025.06.30.16.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:39:58 -0700 (PDT)
Date: Tue, 01 Jul 2025 08:39:40 +0900 (JST)
Message-Id: <20250701.083940.2222161064880631447.fujita.tomonori@gmail.com>
To: aliceryhl@google.com, a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 boqun.feng@gmail.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org,
 lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: time: make ClockSource unsafe trait
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgirsNn9WwEUgFaY2z9+9gG3SWssCoNSzpE56F=sS02kEw@mail.gmail.com>
References: <20250630131011.405219-1-fujita.tomonori@gmail.com>
	<CAH5fLgirsNn9WwEUgFaY2z9+9gG3SWssCoNSzpE56F=sS02kEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gTW9uLCAzMCBKdW4gMjAyNSAxNTozMzozMSArMDIwMA0KQWxpY2UgUnlobCA8YWxpY2VyeWhs
QGdvb2dsZS5jb20+IHdyb3RlOg0KDQo+IE9uIE1vbiwgSnVuIDMwLCAyMDI1IGF0IDM6MTDigK9Q
TSBGVUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+IHdyb3RlOg0K
Pj4NCj4+IE1hcmsgdGhlIENsb2NrU291cmNlIHRyYWl0IGFzIHVuc2FmZSBhbmQgZG9jdW1lbnQg
aXRzIHNhZmV0eQ0KPj4gcmVxdWlyZW1lbnRzLiBTcGVjaWZpY2FsbHksIGltcGxlbWVudGVycyBt
dXN0IGd1YXJhbnRlZSB0aGF0IHRoZWlyDQo+PiBga3RpbWVfZ2V0KClgIGltcGxlbWVudGF0aW9u
IHJldHVybnMgYSB2YWx1ZSBpbiB0aGUgaW5jbHVzaXZlIHJhbmdlDQo+PiBbMCwgS1RJTUVfTUFY
XS4NCj4+DQo+PiBVcGRhdGUgYWxsIGV4aXN0aW5nIGltcGxlbWVudGF0aW9ucyB0byB1c2UgYHVu
c2FmZSBpbXBsYCB3aXRoDQo+PiBjb3JyZXNwb25kaW5nIHNhZmV0eSBjb21tZW50cy4NCj4+DQo+
PiBOb3RlIHRoYXQgdGhlcmUgY291bGQgYmUgcG90ZW50aWFsIHVzZXJzIG9mIGEgY3VzdG9taXpl
ZCBjbG9jayBzb3VyY2UgWzFdDQo+PiBzbyB3ZSBkb24ndCBzZWFsIHRoZSB0cmFpdC4NCj4+DQo+
PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC9aOXhiMXIxeDV0
T3pBSVpUQGJvcXVuLWFyY2hsaW51eC8gWzFdDQo+PiBTdWdnZXN0ZWQtYnk6IEJvcXVuIEZlbmcg
PGJvcXVuLmZlbmdAZ21haWwuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogRlVKSVRBIFRvbW9ub3Jp
IDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPg0KPiANCj4gTEdUTToNCj4gUmV2aWV3ZWQtYnk6
IEFsaWNlIFJ5aGwgPGFsaWNlcnlobEBnb29nbGUuY29tPg0KDQpUaGFua3MhDQoNCj4gVGhvdWdo
IHlvdSdyZSBtaXNzaW5nIGBgIGFyb3VuZCBbMDsgS1RJTUVfTUFYXSBpbiBzb21lIHBsYWNlcywg
d2hpY2gNCj4gbWF5IGJlIHdvcnRoIGFkZGluZy4NCg0KQW5kcmVhcywgd291bGQgeW91IGxpa2Ug
bWUgdG8gc2VuZCB2MiB3aXRoIHRoZSBhYm92ZSBjaGFuZ2VzPw0KDQo=
