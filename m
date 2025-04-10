Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C31283CB2;
	Thu, 10 Apr 2025 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289824; cv=none; b=u0DeDVOPlHoQOSCBuLoDSshD5Yr9jOej2yRa5bXxGE9dItGJLbhtxRewmU4vdmpUybF1PSV4wZSvak+1QZN3DRB5x93AawCxL2+Hr+0FTFWrYB8stVfYWtxPkWKrkp+a5QtuAHWhXNuwKVdBoBZO9FaihHojlKwx6FDSOf/NyNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289824; c=relaxed/simple;
	bh=EZ4z/28EfxfO3oxZfrJLQlmuqBAgYz/OgMCvp3sNkQo=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TOyOWDrT5n0wNkylBX0rLtbjzkLZdqjISVKgj7q0ylfsk/D15LZM53NloKcXXkXEXHQSqBrnTDMCk+seJMnOBU5JfxTgwOv0Aqq0BKcY8Fg2WKmbPBPRXK3Zlfk9Wbu/MU8Y7mATGEwcudyOG8USQ/l+n+cN/qzwtd1Xp/hPkQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqRKLv36; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqRKLv36"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2255003f4c6so7642095ad.0;
        Thu, 10 Apr 2025 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744289822; x=1744894622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZ4z/28EfxfO3oxZfrJLQlmuqBAgYz/OgMCvp3sNkQo=;
        b=lqRKLv36QwKFFQ9L31TGZ7TiGE+AwSZvc0jjY5bkuhBXJRlN6GdEJ26qdGGLGXvaA+
         ZkW4PL8tXbHH5fndqGkQbf2X7isru56xomDSL2pAHTCgY34a8wvzxgER6wV0QBbDZT8V
         CMOnkHHO531uoe1KpxfrmQTrMu2K2KOmec0KYS3AK7DhZeohIkcWck4bsjTd0MUsxKKV
         9CRZ+FaFnPbUimFt7xl3WIXBD0wZ/fNOi/g3mJ2Cvd/1VCxzlqZ7ZfL4FKV8Nb77V77M
         otcNvm7RPrZ488Or7M8alOyB+EyStk2o4yxhOt5aCdRIdAQPflac53ubKmi0I+mwCGyv
         NbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744289822; x=1744894622;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EZ4z/28EfxfO3oxZfrJLQlmuqBAgYz/OgMCvp3sNkQo=;
        b=GGtk7xj2MMT9LCpVH7Tg8ix7fHH53u1iEKFPWz4cVf65GOR72v2jwRjdMHLE1bd/L1
         jLGuI8gZK6eiMuOVj8nXGQ9hpfU+cwmOZLDpqMVvP2ZPYvZNlObrIryLYIW3p7etVz5w
         dIPjRj0u+IC1YahZQL8TcvweMSz76G76b35UBgBc9uBZOallSf6PH7L8/C8f26OffHSe
         MpkwNWdom+bZ4SX4rewyxowSh/gGy1yFwkLggjfaavO4iot28UUVtE0omS4GLvWZAN+W
         CRhh6sWQHid2UV6oWii2sxm/dmfdCdOedUuMbOibTD5fYjPiGfHTXh5JKQs2uwpBWjXK
         1Taw==
X-Forwarded-Encrypted: i=1; AJvYcCWoB4V6tUxtLOY2Jidel9t6IlXGqb+nSFoLJRnSlMUPGh+/0+IaxDSGdBo4FInFZuxW2+IrPEc3kOx+/oh+9bg=@vger.kernel.org, AJvYcCXjTS0zzo3kB0O/luGMO4ui9c3FAnqyWTJi+JgWj0yD0HOT6rkHrDZq1kI7PO5r4wPW5Qji45ALtW94gO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkBtedCjtrjullexaIgmII5FNi2j5zDyAkj/FraHHZKnHvWiyi
	oJETcQy0zbNRkQKH4ea+AHgPz1PyjQRayMyYdw3+oLojbMmrHgF0xyQggJNk
X-Gm-Gg: ASbGncuipwoj26yG7bJdus0IXcfoYkpoREsdIbpaTy39PtFV0vCUqQ1adTEb0wLZ/R9
	JnWUdpoZmBvUXN+/+fPs0zTAanabRCLtHm+yptUXdXAQccgS+1WYpwCxIuDK9kNwMbkc8XwpUmE
	N+wrcpDslslXufRQ4NrS/CrR8y6MjI4TFaJSNcXmpanjJS4f0WoCkMnY77qcOvvNG59xFiDSIqf
	5jzeGD5ecTRlklwXiAyooLyuMnC4PyqbDhlecAi6AwxS3MbG7R4JcI0AJs4ZlB1xP1ILYWqRr4a
	cFerCYvs2KjUg59zzMGT69gxkcT2Mk0yrTylJSVxatkHxsCaVjNJl2WWYG+Ax3sMKn4ZYPUOIBU
	10Zp2JLOll2TPDqdplcZVA+I=
X-Google-Smtp-Source: AGHT+IGCRmoxS1zS4tW8gFl5fzI7gwL+BsMOXnOBUlG6VzNXgSR1hewla7A4SswFBn81JMiNi/32hw==
X-Received: by 2002:a17:903:1a68:b0:223:517c:bfa1 with SMTP id d9443c01a7336-22b42c28921mr46105425ad.38.1744289821807;
        Thu, 10 Apr 2025 05:57:01 -0700 (PDT)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95ca4sm29407145ad.124.2025.04.10.05.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 05:57:01 -0700 (PDT)
Date: Thu, 10 Apr 2025 21:56:50 +0900 (JST)
Message-Id: <20250410.215650.1951840861716787929.fujita.tomonori@gmail.com>
To: dakr@kernel.org
Cc: geert@linux-m68k.org, miguel.ojeda.sandonis@gmail.com,
 fujita.tomonori@gmail.com, richard@nod.at,
 anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, logang@deltatee.com, sbates@raithlin.com,
 dinguyen@kernel.org, arnd@arndb.de
Subject: Re: [PATCH v1] um: fix incompatible argument type in iounmap()
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Z_auq9XEUxMwKVoN@cassiopeiae>
References: <CANiq72mbci8kxEx5jrq=HVc6WKuJqq8NCLzNsjH1wFcJNoHm+w@mail.gmail.com>
	<CAMuHMdWtgSjxeGYJVNzeWPOCd9nUWeKQnCtFQaROQ1o=r_-QwQ@mail.gmail.com>
	<Z_auq9XEUxMwKVoN@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gV2VkLCA5IEFwciAyMDI1IDE5OjMwOjE5ICswMjAwDQpEYW5pbG8gS3J1bW1yaWNoIDxkYWty
QGtlcm5lbC5vcmc+IHdyb3RlOg0KDQo+PiBPbiBXZWQsIDkgQXByIDIwMjUgYXQgMTY6NDgsIE1p
Z3VlbCBPamVkYQ0KPj4gPG1pZ3VlbC5vamVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0K
Pj4gPiBPbiBXZWQsIEFwciA5LCAyMDI1IGF0IDg6MTbigK9BTSBGVUpJVEEgVG9tb25vcmkNCj4+
ID4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+IHdyb3RlOg0KPj4gPiA+DQo+PiA+ID4gQWxp
Z24gaW91bm1hcCgpIHNpZ25hdHVyZSB3aXRoIG90aGVyIGFyY2hpdGVjdHVyZXMuDQo+PiA+DQo+
PiA+IE1vc3QgaW5kZWVkIGhhdmUgYHZvbGF0aWxlYCwgYnV0IG5pb3MyIGFuZCBtNjhrIGRvbid0
IC0tIENjJ2luZyB0aGVtDQo+PiA+IGp1c3QgaW4gY2FzZS4NCj4+IA0KPj4gSW5kZWVkLiBBcHBh
cmVudGx5IHRoZSB2b2xhdGlsZSBrZXl3b3JkIGhhcyBub3QgYWx3YXlzIGJlZW4gdGhlcmUuLi4N
Cj4+IFdoeSBkb2VzIGlvdW5tYXAoKSBuZWVkIHRoZSB2b2xhdGlsZSBrZXl3b3JkPw0KPj4gV2h5
IGRvZXMgcGNpX2lvdW5tYXAoKSBub3QgaGF2ZSB0aGUgdm9sYXRpbGUga2V5d29yZD8NCj4gDQo+
IEkgdGhpbmsgbm9uZSBvZiB0aGUgZnVuY3Rpb25zIHdpdGhpbiBydXN0L2hlbHBlcnMvaW8uYyBu
ZWVkIHZvbGF0aWxlLCBzaW5jZSB0aGV5DQo+IGp1c3QgZGVmZXIgdG8gdGhlIGNvcnJlc3BvbmRp
bmcgQyBmdW5jdGlvbiAvIG1hY3JvLg0KDQpZZWFoLCBhbGwgdm9sYXRpbGUgaW4gdGhlIGZpbGUg
c2hvdWxkIGJlIHNhZmUgdG8gcmVtb3ZlLiBJJ2xsIGdvIHdpdGgNCnRoYXQgYXBwcm9hY2ggZm9y
IHRoZSBuZXh0IHZlcnNpb24uDQoNCkkgdGhpbmsgaXQgd291bGQgYmUgbmljZSB0byBoYXZlIHRo
ZSBzYW1lIGZ1bmN0aW9uIHNpZ25hdHVyZSBhY3Jvc3MNCmFsbCBhcmNoaXRlY3R1cmVzLCBidXQg
dGhhdCdzIGEgc2VwYXJhdGUgdG9waWMuDQoNClRoYW5rcywNCg==
