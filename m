Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0CA29B20D;
	Tue, 24 Jun 2025 16:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750783172; cv=none; b=bQhN0ERcAFsjz3B0m/ouvmUbGO1QXUDlUmWQoWTImnjdlmhbmpE84CKKpqKI96ud+NHhnYO/ijc0RyPoqkGdsxIm+2VRM0GmyKdn9FcAD+pPFcbUt7OFRoDHF9lynKkhrg79khyP1DW1uvKGAUg//HYOjohwIblYD5riTcJA0eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750783172; c=relaxed/simple;
	bh=kJqQr4moocEQK0Pk5DM3mR7NUS1dPAvgMGoCKnJI62s=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sYUPzvsVgrrnM4WdbzYI/C5l3/z9/ow8dCJ6tu0WHyrpGHP5f3dDFbmFGbwHWh00YXY+zEptchJW1eCXET0CyC0CNiS9ArpbZxzcmFhU8yhjzb0gC4tNrRaZPuqVb4qikwip3R3i584gyIw5qZigp9YhLU6R4TlWqQV/lRSge0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fH6u565u; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fH6u565u"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235f9e87f78so61345485ad.2;
        Tue, 24 Jun 2025 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750783171; x=1751387971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJqQr4moocEQK0Pk5DM3mR7NUS1dPAvgMGoCKnJI62s=;
        b=fH6u565ulfUQG1ohzgeA0y5rbCOqLSkWWfQQoAhX+NabZ+1RC8ypRV4dketke0meI5
         MaXXhGUPlkOKUEShBYESMJLKrFmW4nVjioiyaESgnEDMLNM+Vyvh8Z01xiSe/ObzQcY8
         BtFpsx+RezlEzEZRl6VhZHhsT8oOfBie0GA070fvUOTXlonDiE6PpOzhJ4zkf3YmnNiV
         6DUQLf8y/P9JMmmPxB4f7O0fMCJavzdEQH2coogDLUjRahQjwJwmvfFFzJxCG2p++rPl
         w/0y1jFgR3UkcTjiJN2NrZ2CFIvRI7JQaDwPiuZedq9BtuUO3sCBRO/6ZNp6iHOAyPzU
         zC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783171; x=1751387971;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kJqQr4moocEQK0Pk5DM3mR7NUS1dPAvgMGoCKnJI62s=;
        b=jbs3sSDrA/mWJt5XhpgzanfZ0tQFI+2Dle8JZZ+ewmlWXcZlM/nZWQO1og+1r4zIWv
         eDAKttbntoRSbvT7G0iay/2HejNsd4dPd8TmlDyvxfNBN1gm1xM10IREymYFLv0ji2sj
         IoFiyQ9trK3wRhmVLP/ax3fhy4NBjuGK4jwu/YXXcfFVhuOnk9rCCoJV23vAxNqBpOns
         TzAq2qqEhOUsDEUrndGXIjUhWs9WxCPOqR43BbjiqPA3u1ds1TeNQ55wukcpb2vC9J8e
         wka0CYNp5uPhdegzU4kzbBi38IreUZqRphqxMlKAB2BtFYOkmePVi5N0DHA6IkkWaDtW
         /bkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb7IhLjPHfdYuZ34NHSFenjiVlW6JIejFpyaLn0nk6+qnJLW1hrRTejogNdYno7wKThG2Y9SUEbECjTtjKrjU=@vger.kernel.org, AJvYcCXacV+Pg6q+YGT4HKA9EBwZ0YvwxKisOSSQWb4AITVkC+781vYKK2V/wPMoi2zLAQAROLucpEnfwgYTEv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2OMnhbFSFcDyPYxyZryP1/PYykleYlJaejGJE0ZUlrx+tZXXF
	rrQ9Bh6ajRvSAXVabz7Pb0KLwxCPWDhaOdNH1Wer2LMYWJ4xllGZVl9l
X-Gm-Gg: ASbGncueybXgsY8phwJLtyv1CMFv5cl2uFHnBLa/ul7iWwJN/9pg4RyASU0BbAUeuKJ
	P3zF21WrncEuKv3nn4uuuZMr4q4+kW2IA2JuhBLixheir88sGZuvjG0KPGo39puHeR9f44S0JRN
	vzJ1nQPDuT4XCesWsQqCKfK2Z/dHPgJJZ/dbDOuRzKtOQPDzn3pN/pbRXJMI2Mi63CneZ0wOfZu
	fNfOLEuqSmdVQE1Su4MsweqtR3xx0bOVb24aEvPSRFbtnjuMJr5r8Od5tGLyAvPhYzkU+8XUqIf
	F53HrkFCCxCm2bmt2moFux99GyHn5lVDf1CF+AbeuflvAVGFtS3Z61PJ/1kyiMYdSGE412djvyv
	UBHvsujmQgK1XkoAzbWz62ipI+4Nm2Ho+Xc9h+bz0
X-Google-Smtp-Source: AGHT+IE/ZmjOHRhTQdqaVQShP8bEN4S4h2lA0A6J9/K1R/f0vZaOwNQS/9KI0VJKoik2n8h8REqBEA==
X-Received: by 2002:a17:902:c94a:b0:235:ef67:b595 with SMTP id d9443c01a7336-237d9acc6e7mr292901335ad.35.1750783170524;
        Tue, 24 Jun 2025 09:39:30 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d839326asm111329165ad.32.2025.06.24.09.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:39:30 -0700 (PDT)
Date: Wed, 25 Jun 2025 01:39:14 +0900 (JST)
Message-Id: <20250625.013914.1516176234783852509.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, miguel.ojeda.sandonis@gmail.com,
 a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org,
 lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods
 as_micros_ceil and as_millis
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgi7R9iVXwU+k6vvQYHyxix-sU_OL0nKZsbnuuFDJjAMTA@mail.gmail.com>
References: <CAH5fLgjttTnev2h4J-hF-LdUTJCoryJyFm5_LqJ6_GBe+=An5Q@mail.gmail.com>
	<20250624.231428.764205178512881259.fujita.tomonori@gmail.com>
	<CAH5fLgi7R9iVXwU+k6vvQYHyxix-sU_OL0nKZsbnuuFDJjAMTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVHVlLCAyNCBKdW4gMjAyNSAxNTo0NTo0NSArMDEwMA0KQWxpY2UgUnlobCA8YWxpY2VyeWhs
QGdvb2dsZS5jb20+IHdyb3RlOg0KDQo+IE9uIFR1ZSwgSnVuIDI0LCAyMDI1IGF0IDM6MTTigK9Q
TSBGVUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+IHdyb3RlOg0K
Pj4NCj4+IE9uIFR1ZSwgMjQgSnVuIDIwMjUgMTQ6NTQ6MjQgKzAxMDANCj4+IEFsaWNlIFJ5aGwg
PGFsaWNlcnlobEBnb29nbGUuY29tPiB3cm90ZToNCj4+DQo+PiA+PiA+PiBTbyB3b3VsZCB0aGUg
ZnVuY3Rpb24gYmUgZGVmaW5lZCBsaWtlIHRoaXM/DQo+PiA+PiA+Pg0KPj4gPj4gPj4gZm4gYXNf
bmFub3Moc2VsZikgLT4gaTY0Ow0KPj4gPj4gPj4NCj4+ID4+ID4+IElmIHRoYXQncyB0aGUgY2Fz
ZSwgdGhlbiB3ZSd2ZSBjb21lIGZ1bGwgY2lyY2xlIGJhY2sgdG8gdGhlIG9yaWdpbmFsDQo+PiA+
PiA+PiBwcm9ibGVtOyBDbGlwcHkgd2FybnMgYWdhaW5zdCB1c2luZyBhc18qIG5hbWVzIGZvciB0
cmFpdCBtZXRob2RzIHRoYXQNCj4+ID4+ID4+IHRha2Ugc2VsZiBhcyBmb2xsb3dzOg0KPj4gPj4g
Pj4NCj4+ID4+ID4+IHdhcm5pbmc6IG1ldGhvZHMgY2FsbGVkIGBhc18qYCB1c3VhbGx5IHRha2Ug
YHNlbGZgIGJ5IHJlZmVyZW5jZSBvciBgc2VsZmAgYnkgbXV0YWJsZSByZWZlcmVuY2UNCj4+ID4+
ID4+ICAgIC0tPiAvaG9tZS9mdWppdGEvZ2l0L2xpbnV4LXJ1c3QvcnVzdC9rZXJuZWwvdGltZS9o
cnRpbWVyLnJzOjQzMDoxNw0KPj4gPj4gPj4gICAgIHwNCj4+ID4+ID4+IDQzMCB8ICAgICBmbiBh
c19uYW5vcyhzZWxmKSAtPiBpNjQ7DQo+PiA+PiA+PiAgICAgfCAgICAgICAgICAgICAgICAgXl5e
Xg0KPj4gPj4gPj4gICAgIHwNCj4+ID4+ID4+ICAgICA9IGhlbHA6IGNvbnNpZGVyIGNob29zaW5n
IGEgbGVzcyBhbWJpZ3VvdXMgbmFtZQ0KPj4gPj4gPj4gICAgID0gaGVscDogZm9yIGZ1cnRoZXIg
aW5mb3JtYXRpb24gdmlzaXQgaHR0cHM6Ly9ydXN0LWxhbmcuZ2l0aHViLmlvL3J1c3QtY2xpcHB5
L21hc3Rlci9pbmRleC5odG1sI3dyb25nX3NlbGZfY29udmVudGlvbg0KPj4gPj4gPj4gICAgID0g
bm90ZTogYC1XIGNsaXBweTo6d3Jvbmctc2VsZi1jb252ZW50aW9uYCBpbXBsaWVkIGJ5IGAtVyBj
bGlwcHk6OmFsbGANCj4+ID4+ID4+ICAgICA9IGhlbHA6IHRvIG92ZXJyaWRlIGAtVyBjbGlwcHk6
OmFsbGAgYWRkIGAjW2FsbG93KGNsaXBweTo6d3Jvbmdfc2VsZl9jb252ZW50aW9uKV1gDQo+PiA+
PiA+Pg0KPj4gPj4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvMjAy
NTA2MTAxMzI4MjMuMzQ1NzI2My0yLWZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20vDQo+PiA+PiA+
DQo+PiA+PiA+IEFyZSB3ZSBtaXNzaW5nIGEgZGVyaXZlKENvcHkpIGZvciB0aGlzIHR5cGU/IENs
aXBweSBkb2VzIG5vdCBlbWl0IHRoYXQNCj4+ID4+ID4gbGludCBpZiB0aGUgdHlwZSBpcyBDb3B5
Og0KPj4gPj4gPiBodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL3J1c3QtY2xpcHB5L2lzc3Vl
cy8yNzMNCj4+ID4+DQo+PiA+PiBJIHRoaW5rIHRoYXQgYm90aCBEZWx0YSBhbmQgSW5zdGFudCBz
dHJ1Y3RzIGltcGxlbWVudCBDb3B5Lg0KPj4gPj4NCj4+ID4+ICNbcmVwcih0cmFuc3BhcmVudCld
DQo+PiA+PiAjW2Rlcml2ZShQYXJ0aWFsRXEsIFBhcnRpYWxPcmQsIEVxLCBPcmQpXQ0KPj4gPj4g
cHViIHN0cnVjdCBJbnN0YW50PEM6IENsb2NrU291cmNlPiB7DQo+PiA+PiAgICAgaW5uZXI6IGJp
bmRpbmdzOjprdGltZV90LA0KPj4gPj4gICAgIF9jOiBQaGFudG9tRGF0YTxDPiwNCj4+ID4+IH0N
Cj4+ID4+DQo+PiA+PiBpbXBsPEM6IENsb2NrU291cmNlPiBDbG9uZSBmb3IgSW5zdGFudDxDPiB7
DQo+PiA+PiAgICAgZm4gY2xvbmUoJnNlbGYpIC0+IFNlbGYgew0KPj4gPj4gICAgICAgICAqc2Vs
Zg0KPj4gPj4gICAgIH0NCj4+ID4+IH0NCj4+ID4+DQo+PiA+PiBpbXBsPEM6IENsb2NrU291cmNl
PiBDb3B5IGZvciBJbnN0YW50PEM+IHt9DQo+PiA+Pg0KPj4gPj4gI1tkZXJpdmUoQ29weSwgQ2xv
bmUsIFBhcnRpYWxFcSwgUGFydGlhbE9yZCwgRXEsIE9yZCwgRGVidWcpXQ0KPj4gPj4gcHViIHN0
cnVjdCBEZWx0YSB7DQo+PiA+PiAgICAgbmFub3M6IGk2NCwNCj4+ID4+IH0NCj4+ID4+DQo+PiA+
PiBUaGUgYWJvdmUgd2FybmluZyBpcyBhYm91dCB0aGUgdHJhaXQgbWV0aG9kLg0KPj4gPg0KPj4g
PiBXYWl0LCBpdCdzIGEgdHJhaXQgbWV0aG9kIT8NCj4+DQo+PiBZZXMuIENsaXBweSB3YXJucyB0
aGUgZm9sbG93aW5nIGltcGxlbWVudGF0aW9uOg0KPj4NCj4+IHB1YiB0cmFpdCBIclRpbWVyRXhw
aXJlcyB7DQo+PiAgICAgZm4gYXNfbmFub3Moc2VsZikgLT4gaTY0Ow0KPj4gfQ0KPj4NCj4+IENs
aXBweSBkb2Vzbid0IHdhcm4gd2hlbiB0aGUgbWV0aG9kcyBvbiBEZWx0YSBhbmQgSW5zdGFudCBh
cmUgd3JpdHRlbg0KPj4gc2ltaWxhcmx5LiBTbyBDbGlwcHkgaXMgaGFwcHkgYWJvdXQgdGhlIGZv
bGxvd2luZ3M6DQo+Pg0KPj4gcHViIHRyYWl0IEhyVGltZXJFeHBpcmVzIHsNCj4+ICAgICBmbiBh
c19uYW5vcygmc2VsZikgLT4gaTY0Ow0KPj4gfQ0KPj4NCj4+IGltcGwgSHJUaW1lckV4cGlyZXMg
Zm9yIERlbHRhIHsNCj4+ICAgICBmbiBhc19uYW5vcygmc2VsZikgLT4gaTY0IHsNCj4+ICAgICAg
ICAgRGVsdGE6OmFzX25hbm9zKCpzZWxmKQ0KPj4gICAgIH0NCj4+IH0NCj4gDQo+IElmIGl0J3Mg
YSB0cmFpdCBtZXRob2QsIHRoZW4gaXQgc2hvdWxkIHRha2UgJnNlbGYgYmVjYXVzZSB5b3UgZG9u
J3QNCj4ga25vdyB3aGV0aGVyIGl0J3MgQ29weS4NCg0KQSB0cmFpdCBtZXRob2QgYXNfKiBzaG91
bGQgdGFrZSAmc2VsZi4gVGhlIHNhbWUgbmFtZSBvZiBhIG1ldGhvZCBpbiBhDQpzdHJ1Y3R1cmUg
d2hpY2ggaW1wbGVtZW50cyB0aGF0IHRyYWl0IGNhbiB0YWtlIHNlbGYgKGlmIHRoZSBzdHJ1Y3R1
cmUNCmltcGxlbWVudHMgQ29weSBhbmQgdGhlIGNvc3QgaXMgZnJlZSkgaW5zdGVhZCBvZiAmc2Vs
ZiwgYWx0aG91Z2ggaXQNCmRvZXNuJ3QgbWF0Y2ggdGhlIHNhbWUgbmFtZSBvZiB0aGUgdHJhaXQg
bWV0aG9kLg0KDQpBbHNvLCB0aGUgY29udmVyc2lvbnMgdGFibGUgc2F5cyB0aGF0IHRoZSBvd25l
cnNoaXAgb2YgYXNfKiBpcw0KYm9ycm93ZWQgLT4gYm9ycm93ZWQgc28gbmVpdGhlciBvZiB0aGVt
IG1hdGNoZXMgdGhlIHRhYmxlLg0KDQpSaWdodD8NCg==
