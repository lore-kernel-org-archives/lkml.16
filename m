Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1731E18DB03;
	Sat, 28 Jun 2025 13:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751118586; cv=none; b=FbSX0mX5chG/2MD/YS0ER+13g/jlkX1BNK1LDOHOfzXZS9c9B3EqltDdOr2KUXG1i2bB1Vw6JxuW1FlJmMIQ7hm8RRMUuSXoTx7u1ynNfAClAn3YYSBoEJJf8qNQDuc7Fq0Xn85vNsaqR4t8S80ZNzpjV4R6+Yvv0tmXZqXF04o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751118586; c=relaxed/simple;
	bh=Cd+ciLByq3LRGO8G0Mo9rb0LZaomCwo/towAFMRozlU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YYPsORPr173mj3xqaUF73ke3RABUdrx5xzFd7O6FmrA90GfI9GUeUollwGJDdpXvzxpNoD9yLS2xUmQi53H4eCzkg5xrdG7QZ8WEjyPAx0Q0RFRY/etDtSr6aHUgU1863xbU/57tS5Klc4zyVNL5QsT0MYDMjXxatyXUqlhqQeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V81AIsrB; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V81AIsrB"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so663924a12.3;
        Sat, 28 Jun 2025 06:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751118584; x=1751723384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cd+ciLByq3LRGO8G0Mo9rb0LZaomCwo/towAFMRozlU=;
        b=V81AIsrB2QqGGSr6RCtdZRh2XVW+6szqoSG5wl4jxjXLJPs/2NaBVPIeO8f88QH9vW
         ++wI5Y7ud/C5GfR+WUJ1LRjzocoHUIfnyydTyj1sJbs/NU2mt6oAa3Z2Oy+Z/eGyBx7v
         bA8yBK4sbWKEjuF4QqLuo2puxVLrRtuOLH0XMK3u6f7UgdrkPUdZLqFY5q/1yMcIUVPc
         dP/bI0Uk4YYDRwuR1nUqW2ZxUbpP8tJYfitXCIQhMS3dhqVIXcIDFisSaTz8yU5tfanf
         iHN5F/RTBzSdb8ND+0qbLKrXzNqeKLnYKWvngt1XFT8lKJt4AnVoVI9XezT6M4wsMTAl
         +TfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751118584; x=1751723384;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cd+ciLByq3LRGO8G0Mo9rb0LZaomCwo/towAFMRozlU=;
        b=xRGLsj4SPNAWZjdHxhP96fCJcswTHAuUN+QifvHsTT79grwxU+L0Va1Qys/qHeTCJy
         YoI3sDY6F9N3KX64gLKMS0fcv2yP0H0u/XKoPFKvfIYjdUz9qy5xuL6YpR/qaYb4z/KZ
         NHEtnZwB1960TcA5w9bYLvSkCY9FztUgAwoL+KLOwGrnLgfsnNAjf1dKYX3Gn3XXPOKo
         0s/kTTnd8H09+VVMJDOGbGruH4OqqVGhsGvrsm6siAHMt3Hz2Q1VSj3/EiivMowLbuZb
         BhWlln51GHZRlg86RBgRxnGG/7Diek7+Mh7bMqozZ4Pn7RC2iju/Sdbt1SKBd5+3oYjt
         itEw==
X-Forwarded-Encrypted: i=1; AJvYcCWMaPfyxp3jrdfD61zLCGPpg8tejDaIkVrVjF7yhqmSVZyZekV6G7zb+5yQehFiWf3U+cqcFgGUQG5n47s=@vger.kernel.org, AJvYcCX+gZgy5dIKcQrV56XsHRfu5Ee6cBTyfmYAqBn/8SWHxVogpuxTavx571cGOncmJhILv+fUZFzY4KFhV31Z6ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfI9Q2etyCNsSLgORDvsvsAnbCXaKaPLRO6ibgMW6fyKgOt+Zg
	wh1aSSQ2h5w1wkYWblouhaNAF8UpuiyopX5FlmlTTdFYtBpGwyqqXJtt
X-Gm-Gg: ASbGncuWXq6KD3Kbi5NJ9kQaGospUdbY4fJmVIvuOsFFdSgH1gdXLmcWPAB0kVwn2vD
	JytdYCJ+I86XesqEec1t0UfYglBifRPKizpnjuJveaRhCZyypTThi/5bTB9Ruh47dm3JMgrOscg
	hnndKjLsI+d9GC815SoPnTOz5vqHzcIsE37B8bMdbWkKP3Zj6k2DRp31d7BnmGDndirATq5OQ+Z
	Py4D4bZg+UTqOuFeXBQnYnDb3Ej2QKga5FAnN4vBhwqOBN4BrD+xHupE3PXzunNkl6YB14fCkoq
	TXWbwLrSsc3AuymzS/0VrcmSXEVsb+a7jD9SwHw35GlJXrtha84dupCknfsEcVMNRwlLtGG5Vdr
	kFQnEO71BwRu5p1qECglKglkxcpm0r/bpV+DUWCAwGPT9YT9t1no=
X-Google-Smtp-Source: AGHT+IHNKm5dkn6mnQptZdFdnu/mQN3UbWeEKv4Iseoi1OWcufhFeymz4Tk1ScLSjs3IkBpvLgJw7w==
X-Received: by 2002:a17:90b:5347:b0:313:2e69:8002 with SMTP id 98e67ed59e1d1-318c92c8f19mr9661447a91.20.1751118584206;
        Sat, 28 Jun 2025 06:49:44 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539ed37sm8833234a91.18.2025.06.28.06.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 06:49:43 -0700 (PDT)
Date: Sat, 28 Jun 2025 22:49:28 +0900 (JST)
Message-Id: <20250628.224928.690831629261546521.fujita.tomonori@gmail.com>
To: daniel.almeida@collabora.com, boqun.feng@gmail.com,
 a.hindborg@kernel.org
Cc: miguel.ojeda.sandonis@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 daniels@collabora.com, robh@kernel.org, alice.ryhl@google.com,
 beata.michalska@arm.com, carsten.haitzler@foss.arm.com,
 boris.brezillon@collabora.com, ashley.smith@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] Introduce Tyr
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <48605183-78B6-461E-9476-C96C8E55A55D@collabora.com>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
	<CANiq72nJcEM09HbQB3_NpKGxr9x8Ah0VE+=XS=xvA26P2qg=_g@mail.gmail.com>
	<48605183-78B6-461E-9476-C96C8E55A55D@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-7
Content-Transfer-Encoding: base64

SGksDQoNCk9uIFNhdCwgMjggSnVuIDIwMjUgMTA6MDU6MTEgLTAzMDANCkRhbmllbCBBbG1laWRh
IDxkYW5pZWwuYWxtZWlkYUBjb2xsYWJvcmEuY29tPiB3cm90ZToNCg0KPiBBbnl3YXksIEkgdGhv
dWdodCB0aGF0IGhhdmluZyBhIGJyYW5jaCB3b3VsZCBiZSBtb3JlIHRpZHkgdGhhbiBsaXN0aW5n
IHRoZW0sIGFzDQo+IHRoZSBicmFuY2ggc2hvd3MgaW4gd2hhdCBvcmRlciB0aGV5J3JlIGFwcGxp
ZWQgYW5kIGV0Yy4gRm9yIGV4YW1wbGUsIHRoZSBwYXRjaA0KPiBmb3IgcmVhZF9wb2xsX3RpbWVv
dXQgd2FzIGNoZXJyeS1waWNrZWQgZnJvbSBGdWppdGEncyB2MTIgc2VyaWVzLCBhbmQgdGhhdCB3
YXMNCj4gc3Vic2VxdWVudGx5IGRyb3BwZWQgaW4gdjEzIHVudGlsIHRoZSByZXN0IG9mIHRoZSBz
ZXJpZXMgd2FzIG1lcmdlZCBvbiB2MTUuIEkNCj4gdGhvdWdodCB0aGF0IHJlZmVycmluZyB0byB2
MTIgb2YgdGhhdCBzZXJpZXMgd291bGQgYmUgc2xpZ2h0bHkgY29uZnVzaW5nLg0KPiANCj4gSU9X
OiB0aGlzIHNob3VsZCBiZSBhcHBsaWFibGUgYXMgc29vbiBhcyB0aGUgZGVwZW5kZW5jaWVzIHRo
ZW1zZWx2ZXMgYXJlDQo+IG1lcmdlZC4gSSBhbSBob3BpbmcgdGhhdCB0aGlzIGNhbiBoYXBwZW4g
b24gdGhlIDYuMTcgbWVyZ2Ugd2luZG93IGFzIHRoZQ0KPiBjb21tZW50cyBvbiBtb3N0IG9mIHRo
ZW0gYXBwZWFyIHRvIGJlIGR5aW5nIGRvd24gc28gbWF5YmUgdGhlIHItYidzIHdpbGwgc3RhcnQN
Cj4gY29taW5nIHNvb24uIEl0IGFsc28gZ2l2ZXMgYSB1c2VyIHRvIHJlYWRfcG9sbF90aW1lb3V0
KCksIHdoaWNoIG1heSBwcm9tcHQgRnVqaXRhDQo+IHRvIGtlZXAgd29ya2luZyBvbiBpdC4NCg0K
SSBleHBlY3QgcmVhZF9wb2xsX3RpbWVvdXQoKSB0byBiZSBtZXJnZWQgZHVyaW5nIHRoZSA2LjE4
IHdpbmRvdy4NCg0KVG8gZXhwbGFpbiB0aGUgc2l0dWF0aW9uLCByZWFkX3BvbGxfdGltZW91dCgp
IGRlcGVuZHMgb24gZnNsZWVwKCkgYW5kDQptaWdodF9zbGVlcCgpIGFic3RyYWN0aW9ucy4NCg0K
SSBleHBlY3QgdGhlIGZvcm1lciB0byBiZSBwYXJ0IG9mIHdoYXQgQW5kcmVhcyBpcyBwcmVwYXJp
bmcgdG8gbWVyZ2UNCmZvciB0aGUgNi4xNyB3aW5kb3csIGFsb25nIHdpdGggdGhlIHBhdGNoc2V0
IGNvbnZlcnRpbmcgaHJ0aW1lciB0byB1c2UNCkluc3RhbnQgYW5kIERlbHRhLg0KDQpCb3F1biBo
YXMgc3VibWl0dGVkIHRoZSBsYXR0ZXIgYXMgYSBwdWxsIHJlcXVlc3QgdG8gdGhlIHRpcCB0cmVl
IGZvcg0KaW5jbHVzaW9uIGluIHRoZSA2LjE3IHdpbmRvdy4NCg0KU2luY2UgdGhlIHR3byBmZWF0
dXJlcyBhcmUgYmVpbmcgbWVyZ2VkIHRocm91Z2ggZGlmZmVyZW50IHRyZWVzIGFuZCBJDQpkb26i
dCB3YW50IHRvIGNvbXBsaWNhdGUgdGhlIHByb2Nlc3MsIEmibSBwbGFubmluZyB0byB0YXJnZXQN
CnJlYWRfcG9sbF90aW1lb3V0KCkgZm9yIHRoZSA2LjE4IG1lcmdlIHdpbmRvdy4NCg0KSWYgeW91
J3JlIHRhcmdldGluZyB0aGlzIGRyaXZlciBmb3IgNi4xNywgaXQgbWlnaHQgYmUgc2FmZXIgdG8N
CmltcGxlbWVudCBhIHNpbWlsYXIgZnVuY3Rpb25hbGl0eSBsaWtlIHRoZSBub3ZhIGRyaXZlciBk
aWQgYW5kIHJlcGxhY2UNCml0IGxhdGVyLg0KDQoNClRoYW5rcywNCg==
