Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3476D34545;
	Thu,  1 May 2025 12:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746100963; cv=none; b=XP4VpBrERLr9BPBTqEmXoALkVtQl/wKxBk169hsIQ62Y16fp6hzEipMzvqmj01sH25O2DJx7FrB1flTFY9l2rRB1gh7pqXar8Mm8rtlaGh+eE5mqqiYaBPc0zynG436tWZ7+TiN0m9VIzOv/r+KzIvk6lcxBsso4jnWTiyIzqxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746100963; c=relaxed/simple;
	bh=jGk1OplUE0le5suV3S4zcZwUPvU/lk7gB1S+ZPLlncs=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=N8SGqR+9ApD+BUueHfy5kxd9wHsxUImWAYPWwUOekIvapTx5EgC66GbMp7SRWP+98G+uiFjWJOuTbXH+yE0YwSucL7vZOxc7cbTN4Uw0jziwdfxMpEJbGpushZcsoXsk8SN2NKOTJAEwfY/2B5qQ6eP4vuO2/nVfeKCD/jea3Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7Vhs/ws; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7Vhs/ws"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227cf12df27so8052105ad.0;
        Thu, 01 May 2025 05:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746100961; x=1746705761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGk1OplUE0le5suV3S4zcZwUPvU/lk7gB1S+ZPLlncs=;
        b=c7Vhs/wsAvPqpKsAjCSi8lI5RWnclVQ/O6+TN4bb1HrEi5Xni94+hKfUFuPR9eU6gV
         h2rDzYJttkzhMeFY5Kg+xxLNBYC2gdD5bJW4/ATzD8Z1p3975IAX5FIpWO7TypfTK0w6
         wt5MhlH48RvrVvscUriFFIZ7oQBXJsxS5MuCzHnTMeSTFlVU0cEjf6sGpaBaukfPsqmI
         56ADS7uvF262xAmURAAEPJ/QtUWvuamt1iH2VhDSdtJ7sG4WIeMNdYCaZz+PhgSYUhMe
         qQHTWpjwpFdJWUDtohTW+ThljurA+hoEPK/AzXDZnvarl6mR5yW8d4ouzlPTr748hM/4
         4wIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746100961; x=1746705761;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jGk1OplUE0le5suV3S4zcZwUPvU/lk7gB1S+ZPLlncs=;
        b=MGN8+sWiojIbbEollplTrCwjPF9AhtiVRrTjak39084fIvCTwHSbWXircEkoziWW43
         zcxdxgT4z9qkM+APbUz54F9h/fclb11qzc00DiMrohGWQaZebEUz2+sPc7ANrmhbek7N
         QXtASxwfdnUb1fixqa8qSjIt1gHzEJNcdEOhXVmWz0nr49JaVwsLk4KX6xQQvbo3d1Nw
         SeyA7RkpfvXsoNMQggYBhMLQjUJL5/5nyHWTuW1H8mFI6ndyZ+Bw89t5vqhsQSjbB8pD
         yC5BtNz6k2S0foS5ho3WtEaesAUgzUSmxTWwXXoJYpAZc3hOmdqdstbl2KXUrDaT6gYy
         I3rg==
X-Forwarded-Encrypted: i=1; AJvYcCUz+nKPxECOiyee48POLBW0cBGzeWviE9iIesiRRYoYQWcOVqi26rB1n4SAEEA3rwe4UYL228kmPI6HIVQ=@vger.kernel.org, AJvYcCWMvgrhi5nOr4oRDfxLTwoON6Shs2ls3CQRgeBSKK7e2G9wtj1laP6GjfSIiHPjznmDJZvI0BPeDUp69UwF8NI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyui4+5QI9YfGCRxqFIdEHfiT9P8Ca/d/6T30fdn0RRg3MkOVYQ
	ylS36e3LFrPO+mfSaB5QYZeNw4uEuzLRgrw6luYtAv1G3aVUjRq8
X-Gm-Gg: ASbGncsXykxxnRPbN9qdSoXqWq+6PSDs60Mif4ZvisQx/fQWxF8aPXuo/eEedfYAizP
	UKiv9vl7dV/6+SwcvrhMPbmeyZD/LopfS8TrWGKQOwxBfPSlE+M2CbrbEECpRoWRj/5rMW7wW7h
	NbeT0VMNAzmhYBSkLoumyE7nU1oH1ChrfxhxoxdCPDPPTbp9lvmpEdp78soocqkXiSh3AE7trZe
	dB7/tyyuPbMAOhpEvq83+zRWkiuHWaY0JQA5TFiaYWj7WXgH4gtiw/WA9xSDGp/bJcNrAfMVDiL
	rGbMIrl7MNxQ8QB9jHlUI+fLV+MapXf3JVknU9e7B//PL6NppxHqzpyBbKokMo2Nt3Nu3fi8HTM
	9UyTqqp7aI+2LDtVOAQseLWR61zzYbWp5Yg==
X-Google-Smtp-Source: AGHT+IETed+W3jYpghjJLBblsKLuIb+MtVoT+v/jsF/l1Dvq5v+yc0OvlLfCs9/Y9O6jAeFWDQH/cw==
X-Received: by 2002:a17:903:2ed0:b0:21f:40de:ae4e with SMTP id d9443c01a7336-22e087e959amr32953875ad.9.1746100961306;
        Thu, 01 May 2025 05:02:41 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bc87a44sm4866675ad.228.2025.05.01.05.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:02:40 -0700 (PDT)
Date: Thu, 01 May 2025 21:02:24 +0900 (JST)
Message-Id: <20250501.210224.1459267327368250719.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, a.hindborg@samsung.com,
 boqun.feng@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com,
 arnd@arndb.de, linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72kiTwpcH6S0XaTEBnLxqyJ6EDVLoZPi9X+MWkanK5wq=w@mail.gmail.com>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
	<20250501.114534.1953073574103349822.fujita.tomonori@gmail.com>
	<CANiq72kiTwpcH6S0XaTEBnLxqyJ6EDVLoZPi9X+MWkanK5wq=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCAxIE1heSAyMDI1IDExOjI0OjI0ICswMjAwDQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+IE9uIFRodSwgTWF5IDEsIDIwMjUg
YXQgNDo0NeKAr0FNIEZVSklUQSBUb21vbm9yaQ0KPiA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNv
bT4gd3JvdGU6DQo+Pg0KPj4gT29wcywgdGhleSBzaG91bGQgY2FsbCBrdGltZV90b191cygpIGFu
ZCBrdGltZV90b19tcygpIHJlc3BlY3RpdmVseS4NCj4+DQo+PiBJJ2xsIHNlbmQgdjIgbGF0ZXIu
DQo+IA0KPiBXaGF0IGFib3V0IGFkZGluZyBhIGNvdXBsZSBleGFtcGxlcyB0byB0aGVpciBkb2Nz
IHNvIHRoYXQgdGhleSBhcmUNCj4gYWxzbyB0ZXN0ZWQgYW5kIHRoaXMgd291bGQgYmUgY2F1Z2h0
Pw0KPiANCj4gKEluIGFub3RoZXIgcGF0Y2gsIHBvc3NpYmx5IGluIGFub3RoZXIgc2VyaWVzIG9y
IG5vdC4gV2UgY291bGQgYWxzbw0KPiBvcGVuIGEgZ29vZCBmaXJzdCBpc3N1ZSkNCg0KSSdsbCBz
dWJtaXQgYW5vdGhlciBwYXRjaCB0byBhZGQgc29tZSBkb2N0ZXN0cyBvbmNlIHRoaXMgaXMgbWVy
Z2VkLg0K
