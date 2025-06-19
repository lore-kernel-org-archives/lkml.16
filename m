Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3361A0703;
	Thu, 19 Jun 2025 07:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316939; cv=none; b=KwsprjgroOvPzos4ivBSvYpjvI5srfnE+goGoROzowqxIiL9QrYt3DXrZo5GBB+6s0Qzm+wCCw7lJpmovFaEvJCc/OMpyN28vFSmIWyGIrbH8oGoYRh7J2COYrGIALIxmy22uXF8iHapdQp/lX321K8bKtts9ONxzpgKLuwtElE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316939; c=relaxed/simple;
	bh=QmsUY/anKNokAAQtOvEPKFRQKmgHYtKr92ZvQyctNPE=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TP3QJNxZno340wMA5tesX8oiyPPcIXwTpgY8F3u8hMTMv8uno/cViEnChyAz34cEvJ1bpQUmdgmJHEXVYXFwmKrOqhCs/pz0l+6I5YiULcVXYpr/gUlLRcTlE/6qxf0qQTcU8h7/5Bd0v8oeNqwRQC6NMah5RnQeZHe5B7RlgKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+OycHpj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+OycHpj"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2350fc2591dso3646765ad.1;
        Thu, 19 Jun 2025 00:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750316937; x=1750921737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmsUY/anKNokAAQtOvEPKFRQKmgHYtKr92ZvQyctNPE=;
        b=O+OycHpjEx++kwioXd6KFih0a6uWFGmVwsZlLhSNVZGszzJ7VqRLc+6vEQRiQ1SQk6
         D320bRP6QhC2r+buEEf+vmNp51LzXyFICbz/cvT7XPgeRKhp0s81G39Fbmm/T5VYml3K
         gP2JONF+fWpcby3DGEaEStU7dIqWW2nypPb/3CWSd9qnMUB/Uoivw3Y5rFhBdMv6ccup
         0z37fZiLsh8LTfyI0Stsl8kFR7eCDbauxB8sboynuzHNp3A9rNei/M7DWqtraDOLZFqc
         DTrcD7L3xeii2UEzZ+88NtZSjLTU5HJDd7YcR5ge6/vFJ2s61vvTwLVV8BA5VBjmmuFi
         tRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750316937; x=1750921737;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QmsUY/anKNokAAQtOvEPKFRQKmgHYtKr92ZvQyctNPE=;
        b=azUFIvf3umvYZNdQjtGC86r414SvqtOwh4xnM8Px/iFAAPDUn9EI0BmWzc3Joallny
         MQYi+oprbuTJiRNeKfETv78HbLR3lzQZeTaH2vppmwGD683vM41Q9nkcRcYZ0IZFElOZ
         mmeV33CqVsr16r9Tq4AMjq+nqvVs3qbsCtTw3vDysE1MxE+gJ2txbTHxqAdM92y9T0sx
         4B58/UdgkCgplB0pTb+ig2Vz5poWa8/I11m5U3Tp7/J7bvk7U0a3wJnm5vOHtqEqo7Cg
         EzAX9LCLtstuJUt0F0DBWWYJwxYi5rzwNQdECIuGNcpl1bMhPNHDfZ9toQ7mFyJRogQ2
         aRKw==
X-Forwarded-Encrypted: i=1; AJvYcCWDkusuoY/A5abNVF2rxftaPoIgA3Lpm9+sGqo2IuMQTVeyQTaQuWLUnEEe5V3EtV/rsFY3mzNPmoL7P7g=@vger.kernel.org, AJvYcCWyXNeKFzg+pKSMsO3++REBXwk8FT910IXTx8zKM7bF8sb4mo0js59KIKU2Hv7+8PfhWJuxzRFxSm3WweBLO4A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0SPTfCK6pElNBBoKdwCHKP6cu9tBVfy0FBtw8Ad4fO3BuQ0eH
	fh6wQiXX2gbQAmDKm3V8WMjvm6TvCcxwnDv7+gdDIG/lv2P5KUjD4byj
X-Gm-Gg: ASbGncsOY2j5dZsYGVy3JqEBvwGFp5gTK9c3yOwW4p7cym5pxMetP3M+0gNDIDwOuwC
	2FFzdPfeI/H3lU2lIvAJ0EN3Bo5xh00o85IuhnTCYtsVjzzoET7AKPd2eM6qDXFMlO6rS4GxlBK
	F1MbZOrQ68I5hw714iFw+A5CwOUCtPaD7jH1QQeWo1OgdFvYQEIa5etNo1Fgwjoj0FdnyXwpeeS
	Srq+/yU4vTbN1jV0hgnBoV5iOtP+A1x7CWSGJo8R0igvsq+rzvCjlIBWf7Kqu4J2bqZF6UESoKI
	zd6+p/bvxTzYFZRy6yMRhO8z+d96WI0XMyRKwotO+SeBNFg/CZ615y/DfFl86tz8wCCWpneCwIj
	p6vJnxaHQMG51bmOJg+O8+agvp76wJT5NMojbh7+i
X-Google-Smtp-Source: AGHT+IHPrO5NyJZiMwSFwErreeVoUXpzLKRBxklvoKfDbKH3cvQhU/vDIdIrs9bKD7fLc0CC6TRQzw==
X-Received: by 2002:a17:902:e84b:b0:235:f091:11e5 with SMTP id d9443c01a7336-237cbf15369mr44395505ad.10.1750316937216;
        Thu, 19 Jun 2025 00:08:57 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deaa9f7sm112623365ad.168.2025.06.19.00.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:08:56 -0700 (PDT)
Date: Thu, 19 Jun 2025 16:08:44 +0900 (JST)
Message-Id: <20250619.160844.1477802332578239775.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com, aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, a.hindborg@kernel.org,
 alex.gaynor@gmail.com, ojeda@kernel.org, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de,
 tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods
 as_micros_ceil and as_millis
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72mBfTr0cdj_4Cpdk62h2k+Y5K3NSs54_1-9jiszMZ6AuA@mail.gmail.com>
References: <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
	<CAH5fLgggDKUwmU3oCTMS1dQGzA5Whp2fnXoLmbGmNF1W89Ar_A@mail.gmail.com>
	<CANiq72mBfTr0cdj_4Cpdk62h2k+Y5K3NSs54_1-9jiszMZ6AuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gV2VkLCAxOCBKdW4gMjAyNSAxNzo0NzoyNyArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBXZWQsIEp1biAxOCwgMjAy
NSBhdCAzOjE34oCvUE0gQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdvb2dsZS5jb20+IHdyb3RlOg0K
Pj4NCj4+IFRoZXJlIGFyZSBhbHNvIG1ldGhvZHMgc3VjaCBhcyBEdXJhdGlvbjo6YXNfbWlsbGlz
KCkuIFllcywgdGhvc2UgdGFrZQ0KPj4gJnNlbGYgYnV0ICZzZWxmIGlzIGVxdWl2YWxlbnQgdG8g
c2VsZiBmb3IgQ29weSB0eXBlcywgc28gdGhlcmUgaXMgbm8NCj4+IGRpZmZlcmVuY2UuIEFuZCBl
dmVuIGlmIHdlIGRpZCB0cmVhdCB0aGVtIGRpZmZlcmVudGx5LA0KPj4gRHVyYXRpb246OmFzX21p
bGxpcygpIGlzIGFjdHVhbGx5IGJvcnJvd2VkLT5vd25lZCBhcyB0aGUgcmV0dXJuIHR5cGUNCj4+
IGlzIG5vdCBhIHJlZmVyZW5jZSwgc28gLi4uDQo+IA0KPiBJbiBtb3N0IGNhc2VzIGl0IG1heSBu
b3QgbWF0dGVyLCBidXQgZXZlbiBpZiB0YWtpbmcgZWl0aGVyIHdhcyBleGFjdGx5DQo+IHRoZSBz
YW1lLCB0aGUgcG9pbnQgb2YgdGhlIGRpc2N1c3Npb24ocykgd2FzIHdoYXQgaXMgbW9yZSBpZGlv
bWF0aWMsDQo+IGkuZS4gaG93IHRvIHNwZWxsIHRob3NlIHNpZ25hdHVyZXMuDQo+IA0KPiBJIHVu
ZGVyc3RhbmQgeW91IGFyZSBzYXlpbmcgdGhhdCBgRHVyYXRpb246OmFzX21pbGxpcygpYCBpcyBh
bHJlYWR5IGENCj4gc3RhYmxlIGV4YW1wbGUgZnJvbSB0aGUgc3RhbmRhcmQgbGlicmFyeSBvZiBz
b21ldGhpbmcgdGhhdCBpcyBub3QNCj4gYm9ycm93ZWQgLT4gYm9ycm93ZWQsIGFuZCB0aHVzIHRo
ZSBndWlkZWxpbmVzIHNob3VsZCBiZSB1bmRlcnN0b29kIGFzDQo+IGltcGx5aW5nIGl0IGlzIGZp
bmUgZWl0aGVyIHdheS4gSXQgaXMgc3RpbGwgY29uZnVzaW5nLCBhcyBzaG93biBieQ0KPiB0aGVz
ZSByZXBlYXRlZCBkaXNjdXNzaW9ucywgYW5kIG9uIHRoZSBwYXJhbWV0ZXIncyBzaWRlIG9mIHRo
aW5ncywNCj4gdGhleSBzdGlsbCBzZWVtIHRvIHByZWZlciBgJnNlbGZgLCBpbmNsdWRpbmcgaW4g
dGhlIGVxdWl2YWxlbnQgbWV0aG9kcw0KPiBvZiB0aGlzIHBhdGNoLg0KPiANCj4gUGVyc29uYWxs
eSwgSSB3b3VsZCB1c2UgYHNlbGZgLCBhbmQgY2xhcmlmeSB0aGUgZ3VpZGVsaW5lcy4NCg0KU28g
d291bGQgdGhlIGZ1bmN0aW9uIGJlIGRlZmluZWQgbGlrZSB0aGlzPw0KDQpmbiBhc19uYW5vcyhz
ZWxmKSAtPiBpNjQ7DQoNCklmIHRoYXQncyB0aGUgY2FzZSwgdGhlbiB3ZSd2ZSBjb21lIGZ1bGwg
Y2lyY2xlIGJhY2sgdG8gdGhlIG9yaWdpbmFsDQpwcm9ibGVtOyBDbGlwcHkgd2FybnMgYWdhaW5z
dCB1c2luZyBhc18qIG5hbWVzIGZvciB0cmFpdCBtZXRob2RzIHRoYXQNCnRha2Ugc2VsZiBhcyBm
b2xsb3dzOg0KDQp3YXJuaW5nOiBtZXRob2RzIGNhbGxlZCBgYXNfKmAgdXN1YWxseSB0YWtlIGBz
ZWxmYCBieSByZWZlcmVuY2Ugb3IgYHNlbGZgIGJ5IG11dGFibGUgcmVmZXJlbmNlDQogICAtLT4g
L2hvbWUvZnVqaXRhL2dpdC9saW51eC1ydXN0L3J1c3Qva2VybmVsL3RpbWUvaHJ0aW1lci5yczo0
MzA6MTcNCiAgICB8DQo0MzAgfCAgICAgZm4gYXNfbmFub3Moc2VsZikgLT4gaTY0Ow0KICAgIHwg
ICAgICAgICAgICAgICAgIF5eXl4NCiAgICB8DQogICAgPSBoZWxwOiBjb25zaWRlciBjaG9vc2lu
ZyBhIGxlc3MgYW1iaWd1b3VzIG5hbWUNCiAgICA9IGhlbHA6IGZvciBmdXJ0aGVyIGluZm9ybWF0
aW9uIHZpc2l0IGh0dHBzOi8vcnVzdC1sYW5nLmdpdGh1Yi5pby9ydXN0LWNsaXBweS9tYXN0ZXIv
aW5kZXguaHRtbCN3cm9uZ19zZWxmX2NvbnZlbnRpb24NCiAgICA9IG5vdGU6IGAtVyBjbGlwcHk6
Ondyb25nLXNlbGYtY29udmVudGlvbmAgaW1wbGllZCBieSBgLVcgY2xpcHB5OjphbGxgDQogICAg
PSBoZWxwOiB0byBvdmVycmlkZSBgLVcgY2xpcHB5OjphbGxgIGFkZCBgI1thbGxvdyhjbGlwcHk6
Ondyb25nX3NlbGZfY29udmVudGlvbildYA0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0
LWZvci1saW51eC8yMDI1MDYxMDEzMjgyMy4zNDU3MjYzLTItZnVqaXRhLnRvbW9ub3JpQGdtYWls
LmNvbS8NCg0KDQpIclRpbWVyRXhwaXJlcyB0cmFpdCBuZWVkcyBhc19uYW5vcygpIG1ldGhvZCBh
bmQgSW5zdGFudCBhbmQgRGVsdGENCm5lZWQgdG8gaW1wbGVtZW50IEhyVGltZXJFeHBpcmVzIHRy
YWl0Lg0KDQpXZSBuZWVkIGEgY29uc2lzdGVudCBkZWZpbml0aW9uIG9mIGFzX25hbm9zKCkgYWNy
b3NzIHRoZQ0KSHJUaW1lckV4cGlyZXMgdHJhaXQsIGFuZCB0aGUgSW5zdGFudCBhbmQgRGVsdGEg
c3RydWN0dXJlcy4NCg0KQW5kIGl0IHdvdWxkIGJlIGJldHRlciBpZiB0aGUgZGVmaW5pdGlvbiBv
ZiBhc19uYW5vcyB3ZXJlIGNvbnNpc3RlbnQNCndpdGggdGhlIG90aGVyIGFzXyogbWV0aG9kcy4N
Cg0KSXQgbG9va3MgbGlrZSB0aGUgY29udmVyc2lvbiBmcm9tIERlbHRhIHRvIGk2NCBkb2VzbuKA
mXQgcXVpdGUgZml0IGFueQ0Kb2YgdGhlIGNhdGVnb3JpZXMgaW4gdGhlIEFQSSBndWlkZWxpbmVz
LiBIb3cgc2hvdWxkIGl0IGJlIGRlZmluZWQ/DQoNCg==
