Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA1AA31;
	Fri,  4 Jul 2025 00:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751589396; cv=none; b=nY7OH1f43BLfmtTaGPfiMzxko5RdI1PQ9RWHB7iJ4euQZ8LBhWiteewxbLMiSraly+xTndWWOAJBJ+d6a90SXmbSrTbErhoMAqhO3LJDf4lwpE+Dg8R8pGuR7raUIhTkAUN/ORBQAnIaUq2qGvBr8/ATfCT3+DPvquANnbSUP6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751589396; c=relaxed/simple;
	bh=m4/t6a2AXa6XwntU1RU/WGvkIgn3+4d7zvITSDvt04I=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ab69QVX30h5ApjeNT9WmkWdwoftwbTYI5wTJ7oSM5+bh9GnsG0MIi/BKd3HMG9PY52FYYZ7jkOwRT1N+ZM0ZM4+fBe5A2gjBFvFP8kq087uHrS/vVqGdwNJqu0B9F2zcTABRhG1HFJuHNMpbVLsazwSDLUA5I0Uq6rATYIpOkfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UF9vBIWE; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UF9vBIWE"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so279445a12.2;
        Thu, 03 Jul 2025 17:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751589394; x=1752194194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4/t6a2AXa6XwntU1RU/WGvkIgn3+4d7zvITSDvt04I=;
        b=UF9vBIWEKPgjhpgFpxK7nolTEiX5P0jLbkhqorgkdGxEIgVAHLXu15XGg5HrSGPhfA
         xDDTQJnD1wpuGplONMVgjU/tYbp81SaW/PCHSprSeNUwaDkrbkczqfSHT18C9CKziPHD
         fcbv119xvcDAhGNZJejIRYb+q+HZ3XKVDS/NZ00WvUtOJbbWbg25KXMN1tPy5HXdZUxe
         qwjqEL1wtNqGxpNSCaIrv0x90WCLv0x9MkcVo5U1dokL18Bej7dz5xsFd3ifUC5CIffD
         2sjAwrQ1V09X1uAetAp1MrctQjtw/jhzIfWafCqvMauTkz31fW7xL2dx9g7dyFX5Dg/5
         sChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751589395; x=1752194195;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m4/t6a2AXa6XwntU1RU/WGvkIgn3+4d7zvITSDvt04I=;
        b=IHz9DJPA+MPzHUHbxL1UCIre1CgxcF10eVGW5+pLjBDz5KX1lAdFdKNfQly9v3+Glr
         gTfg8fM6/d4oA6qAadcBZuMGtyG58pUSMWXqhsvuNhcGNhamR5J2uV7drwCrOI4YU98I
         /GN4cTmRl+DoyiBsbjK5rt/x9Xh0ukEH1N/RsfiN2o6N1M0xBEJMEM5vismZVH1xz/DF
         hTHLiHTWozOosWhh+ssoKr8rpE/n06zhk8K9XJ+gcvoQZSFIuSnlABDc3kEoxXZ24e/1
         UA3uW6PkSbVzSFPkk9aS1zi1Hqsk+7Ws1WDsb0rGhYRs7JhzrER/0gpw2g+7oxseHQSY
         QRJA==
X-Forwarded-Encrypted: i=1; AJvYcCUQflL47JO51VfFxtmt6xZAyRUyKWhv0h1bV1pKByBs5AdQeXPthhQPC9Nql/KrEnc/pc/xHpajdh8lk+Q=@vger.kernel.org, AJvYcCWBeM8Gtm7Q/3JFR59VevslT2H7++6jmJdGOFI0q1gW2c88GTxodWlVHRLqfMj9DIlBuEWkpA5LUVqjoh5faIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZul8nqd0VV5JduCWf0O1xX3VTr+U8EWYGobLXDzPsJuMjE4Yh
	IDbg8MCwxEIEllk8pP/q6mRNsoFYJq50+8r4WrIiRiMICf0KZhsP4HRIvRJUh7cM
X-Gm-Gg: ASbGncuz8ff9jmjsO6ANXo+ogvy8C6jml6fRctZ6ssMUvwrw91FQdKzrGWbUjfYqEvj
	4nTD7W6RI24wIhEyLuvXIhcR4IgGjYsFN1UemP+nLUbirVYrnnjvEzNdVtaz0N9wPhoF7JjouFK
	XVFnEQ/NgNlCpGKirAqLVidrOSFJx4GOqJjefRgIzwsjE0Mz1GDowb9KH3NGuDwP/WiXsOz0RdG
	L+cBbdnXaqclO3LBRqXErI7XKoshizRRzgwjl2g5Zmiz2KRl7C6uE1GeuLjs2dddP6zTS1nzfNL
	N81I51RUy8ub4VqU7kNXl/2N33gbjB/JtB4EBKczJF5IK05hbawddIoJ8aTXRRnkWuQJdJYj9SD
	66gA5BImiaO6wEI0bOkXLW8tbV6Keumyrp0mb7oRV
X-Google-Smtp-Source: AGHT+IFeTKwyeiio0pQVFAsVSGhMCgrA9f1ytwHQ06ioNFisJ8tcI8y4NsuusgTHsQtkTvgkRXpPcw==
X-Received: by 2002:a17:90b:5210:b0:311:d258:3473 with SMTP id 98e67ed59e1d1-31aac4620e5mr912274a91.13.1751589394518;
        Thu, 03 Jul 2025 17:36:34 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaaf5186fsm618107a91.35.2025.07.03.17.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 17:36:34 -0700 (PDT)
Date: Fri, 04 Jul 2025 09:36:18 +0900 (JST)
Message-Id: <20250704.093618.1554080777023438310.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
 lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: time: Add examples with doctest for Delta
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72ntFkvN983N3x=AKMd6fW2yXb8d0LB1LT3c20oYmPCiGg@mail.gmail.com>
References: <20250701001809.496389-1-fujita.tomonori@gmail.com>
	<874ivvvvjw.fsf@kernel.org>
	<CANiq72ntFkvN983N3x=AKMd6fW2yXb8d0LB1LT3c20oYmPCiGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gV2VkLCAyIEp1bCAyMDI1IDE0OjIyOjQ4ICswMjAwDQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+IE9uIFdlZCwgSnVsIDIsIDIwMjUg
YXQgMTA6MzbigK9BTSBBbmRyZWFzIEhpbmRib3JnIDxhLmhpbmRib3JnQGtlcm5lbC5vcmc+IHdy
b3RlOg0KPj4NCj4+IEkgdGhpbmsgdGhpcyBraW5kIG9mIHRlc3Qgd291bGQgYmUgYmV0dGVyIHN1
aXRlZCBmb3IgdGhlIG5ldyBgI1t0ZXN0XWANCj4+IG1hY3JvLiBXb3VsZCB5b3UgYWdyZWU/DQo+
IA0KPiBJIGRvbid0IG1pbmQgc2VlaW5nIHRoZSBlZGdlIGNhc2VzLCBzaW5jZSB0aGUgYmVoYXZp
b3IgaXMgbWVudGlvbmVkIGluDQo+IHRoZSBkb2NzLCBqdXN0IGxpa2Ugc29tZXRpbWVzIHdlIHNo
b3cgZS5nLiB0aGUgYEVycmAvYE5vbmVgIGNhc2VzIGluDQo+IG90aGVyIGZ1bmN0aW9ucyBldGMu
LCBhbmQgaXQgbWF5IGhlbHAgdG8gZnVydGhlciBoaWdobGlnaHQgdGhhdCB0aGlzDQo+IGNhbiBh
Y3R1YWxseSByZXR1cm4gcG9zc2libHkgdW5leHBlY3RlZCB2YWx1ZXMuDQo+IA0KPiBJdCBpcyBh
bHNvIHdoYXQgdGhlIHN0YW5kYXJkIGxpYnJhcnkgZG9lcywgYXQgbGVhc3QgaW4gc29tZSBzaW1p
bGFyIGNhc2VzLCBlLmcuDQo+IA0KPiAgICAgaHR0cHM6Ly9kb2MucnVzdC1sYW5nLm9yZy9zdGQv
cHJpbWl0aXZlLmk2NC5odG1sI21ldGhvZC5zYXR1cmF0aW5nX2FkZA0KPiANCj4gTWF5YmUgaW5z
dGVhZCB3ZSBjYW4gaGVscCBtYWtpbmcgaXQgYSBiaXQgbW9yZSByZWFkYWJsZSwgZS5nLiBhdm9p
ZGluZw0KPiB0aGUgaW50ZXJtZWRpYXRlIHZhcmlhYmxlIHRvIGhhdmUgYSBzaW5nbGUgbGluZSBw
bHVzIHVzaW5nIGEgYCMgdXNlDQo+IERlbHRhYCB0byBmdXJ0aGVyIHJlZHVjZSB0aGUgbGluZSBs
ZW5ndGg/DQo+IA0KPiBBbHNvIGFkZGluZyBhIG5ld2xpbmUgYmV0d2VlbiB0aGUgIm5vcm1hbCIg
Y2FzZSBhbmQgdGhlIHNhdHVyYXRpb24NCj4gY2FzZXMgd291bGQgcHJvYmFibHkgaGVscCB0b28u
DQoNCkkndmUgdXBkYXRlZCBmcm9tX21pY3JvcygpIGJhc2VkIG9uIHRoZSBhYm92ZSBzdWdnZXN0
aW9uIC0gbG9va3MNCmJldHRlciB0byBtZS4gV2hhdCBkbyB5b3UgdGhpbms/DQoNCi8vLyAjIEV4
YW1wbGVzDQovLy8NCi8vLyBgYGANCi8vLyB1c2Uga2VybmVsOjp0aW1lOjpEZWx0YTsNCi8vLw0K
Ly8vIGFzc2VydF9lcSEoRGVsdGE6OmZyb21fbWljcm9zKDUpLmFzX25hbm9zKCksIDVfMDAwKTsN
Ci8vLyBhc3NlcnRfZXEhKERlbHRhOjpmcm9tX21pY3Jvcyg5XzIyM18zNzJfMDM2Xzg1NF83NzUp
LmFzX25hbm9zKCksIDlfMjIzXzM3Ml8wMzZfODU0Xzc3NV8wMDApOw0KLy8vIGFzc2VydF9lcSEo
RGVsdGE6OmZyb21fbWljcm9zKC05XzIyM18zNzJfMDM2Xzg1NF83NzUpLmFzX25hbm9zKCksIC05
XzIyM18zNzJfMDM2Xzg1NF83NzVfMDAwKTsNCi8vLw0KLy8vIGFzc2VydF9lcSEoRGVsdGE6OmZy
b21fbWljcm9zKDlfMjIzXzM3Ml8wMzZfODU0Xzc3NikuYXNfbmFub3MoKSwgaTY0OjpNQVgpOw0K
Ly8vIGFzc2VydF9lcSEoRGVsdGE6OmZyb21fbWljcm9zKC05XzIyM18zNzJfMDM2Xzg1NF83NzYp
LmFzX25hbm9zKCksIGk2NDo6TUlOKTsNCi8vLyBgYGANCiNbaW5saW5lXQ0KcHViIGNvbnN0IGZu
IGZyb21fbWljcm9zKG1pY3JvczogaTY0KSAtPiBTZWxmIHsNCiAgICBTZWxmIHsNCiAgICAgICAg
bmFub3M6IG1pY3Jvcy5zYXR1cmF0aW5nX211bChOU0VDX1BFUl9VU0VDKSwNCiAgICB9DQp9DQoN
Cg0K
