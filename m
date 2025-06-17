Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D5186E2E;
	Tue, 17 Jun 2025 03:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750129502; cv=none; b=OF51EFCedpI9mRADpP64PYxHVl43XrdeGkGlL7Rf86qqnzQtuhntLC4f4msyfy63+oi1qTYNOkqZho9pnolU6IuwIe7ZmYG7RN0VoraaUPDpP/SZFDwfJOvaXlJ9MF0on2C7or+Gtf8PNEEspdeui+lSk8VvzcfKYGQpiiy7fnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750129502; c=relaxed/simple;
	bh=EHtcsoXy8FP/5jGKm4I65g/JvYOkmWUZU9tpBSETRI0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=O6E0HXvf9rA/tagLkamaoo9fESBwrVHcr98m5qorRIPEohY9yyPjEKWTtcHa3Tm3BqrowANmQ22IjXg9re4jBFyLPBGTCrmVNNWlm2F8h06Y0oQFcsOSj0Ft29/7VNwgCvYi9uxgsQkbNS/0kox3kfqS50K6hbYdomXZIPAufjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jszp1Tu/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jszp1Tu/"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742c7a52e97so4365516b3a.3;
        Mon, 16 Jun 2025 20:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750129500; x=1750734300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHtcsoXy8FP/5jGKm4I65g/JvYOkmWUZU9tpBSETRI0=;
        b=jszp1Tu/zuWAf7Q1RS0FxSOgaIanujpCgcZUZMgTqycbU9KiAUfbb2U3AnOFVz9c1g
         RAPaUsZL9BUXoOrOagzNu4RT2dgi+3rsuP1ilS5ZdsOYJKXllbBaWywt5G/ovQws+i13
         Eb5PUDBp8zyDy0CPCDeNUjHf+LK5hugSf1QbxgOoi/iYM2i/+VxvIW1fF1sSJFqTh1Gj
         L/OIYWNIKj2KJ8O4LuLapZFaiMAtJ8mrA3CeoBRw2O3MtnMMFOM4mL6rfIkcf3PMw+ZS
         cCiJYEO2WWC3EWfNlg3Wcc7TgU2rMJAy9wEXDYCh620HA2lQymCtoFXDW9jdLxavlKmI
         5iuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750129500; x=1750734300;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EHtcsoXy8FP/5jGKm4I65g/JvYOkmWUZU9tpBSETRI0=;
        b=P2EacFV1vipwUTBet+gN6ctZNM0cLikXnWLwmhdQVsiJIMXMww5QKW9kfQe7PMQpk7
         O8FAEPy4HEtynOLHoTAryJHNhaH2ni4dnrXJieRQPReocCbp/l8qaAoNFM8m6xAcylhj
         B1D18mN1GlvyMPE0iLeHHdFgKVLcot3Wq/vuhJ+cFKKBHXuLrz7ebbfVePWUuEd7BKno
         W1W66fKzO6q++06c71gVwCZTDz07HfCdWnfON5DBDxeHJzd/jFJAP/OAWUlqXdQ/y8Uu
         fs2izol37Gcib1+MOLIx9Qc9kshvMWj/fPDhHbPWT0MCVYvkLonoy73YKZWAMW0z4Yb4
         pnZw==
X-Forwarded-Encrypted: i=1; AJvYcCW+UWoTJYv28pl4k9kmRjd1G5mLw99zMtFU+z+oNQ4zFYlzVffKk/HYuPY59PR3GtktDeaVO60yHSg73do=@vger.kernel.org, AJvYcCWwBZ3QEiKt9QkX9lz9c8MSDquaPpaYrMdK/OH2Y8sinbpUx7if8URtKRCLMb3gxr1ijf5b0qsQMkzm8AyfDJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFE8gx0Hkfz9VsYYZhkkyANq1ayfzHHfVzHf6jFqwiO+Sk/m7P
	jpeBua8QkPynqLF8qQFw3U4syOyawdqoNX9+u7j1qkjBlmLklVT2546T
X-Gm-Gg: ASbGncv1fg4V0WPlV5SrRF8/hNukXIWL8SSGYy3ZxYJ9or5sOUGgVhDd5pe8gefKdzd
	3ye8HPNH4ltjuwLkRz8wKfU2rsna+UhBGzA85U5RodoPimHPgQK0f6LzuyolOduRUhiYdIPAec9
	I2Mh0NdPFyKCAYX1awCXYaC9emem0HRxlW9JSKLhy+Yeq/3LmJit4zir9UrolVe1DRK0OIDC2N3
	mA1VgwU3SYXRhjgB3RmOpk7bZr6vHhdWnGZmUIBmZbLGAdl89wjl8X2M+ysfkBfjNC9JcgbOVXV
	hny1xbBe657qJo3XBxCIzXL2RKduVQAohSdXEOvRgTdspl2p5TlUWYG3SW/tnnP0/DIQpfPt1Cx
	Wcb80aKIRXY2E+Rm0f+/IZfAgM+jGWtHe0HyUv+ge
X-Google-Smtp-Source: AGHT+IFDLdr+ApwZ+xw59SjFo0LVzZ1Qci7YkepyXP7WfU2hzCzGz+0ha9MitRbqlpmVCDSnqAkjow==
X-Received: by 2002:a05:6a21:3a48:b0:1f3:2e85:c052 with SMTP id adf61e73a8af0-21fbd634e55mr20240251637.35.1750129499871;
        Mon, 16 Jun 2025 20:04:59 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680c5fsm7719007a12.49.2025.06.16.20.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 20:04:59 -0700 (PDT)
Date: Tue, 17 Jun 2025 12:04:53 +0900 (JST)
Message-Id: <20250617.120453.1403624234989149033.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: boqun.feng@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com,
 fujita.tomonori@gmail.com, mingo@kernel.org
Subject: Re: [PATCH v3 2/2] rust: task: Add Rust version of might_sleep()
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72mES+dPBuhsdh0-hJcV69AO74j6W5vhCeo+yV5S-Zp+yg@mail.gmail.com>
References: <20250616153604.49418-1-boqun.feng@gmail.com>
	<20250616153604.49418-3-boqun.feng@gmail.com>
	<CANiq72mES+dPBuhsdh0-hJcV69AO74j6W5vhCeo+yV5S-Zp+yg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gTW9uLCAxNiBKdW4gMjAyNSAyMzoyODozMSArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBNb24sIEp1biAxNiwgMjAy
NSBhdCA1OjM24oCvUE0gQm9xdW4gRmVuZyA8Ym9xdW4uZmVuZ0BnbWFpbC5jb20+IHdyb3RlOg0K
Pj4NCj4+ICsvLy8gRXF1aXZhbGVudCB0byB0aGUgQyBzaWRlIFtgbWlnaHRfc2xlZXAoKWBdLCB0
aGlzIGZ1bmN0aW9uIHNlcnZlcyBhcw0KPiANCj4gSSBhbSBhbHdheXMgcGxlYXNlZCB0byBzZWUg
aW50cmEtZG9jIGxpbmtzLCBidXQgd291bGRuJ3QgdGhpcyBvbmUNCj4gcG9pbnQgdG8gdGhlIFJ1
c3QgaXRlbT8gOikgaS5lLiB3ZSBuZWVkIHRvIGFkZCB0aGUgbGluaywgcmlnaHQ/DQoNCkFoLCB5
b3UncmUgcmlnaHQuDQoNCj4gSSB3b3VsZCBub3JtYWxseSBhc2sgZm9yIGFuIGV4YW1wbGUgb2Yg
dHlwaWNhbCB1c2FnZSwgYnV0IGRvIHdlIGhhdmUNCj4gc29tZSBnb29kIEMgZG9jcyBvbiB0aGF0
IGFscmVhZHkgdGhhdCB3ZSBjb3VsZCBsaW5rIG90aGVyd2lzZT8NCg0KSSBjYW4ndCBmaW5kIEMg
ZG9jcyBvbiBtaWdodF9zbGVlcCgpLiBEZXZpY2UgZHJpdmVyIGRldmVsb3BlcnMNCnByb2JhYmx5
IGRvbid0IG5lZWQgdG8gdXNlIG1pZ2h0X3NsZWVwKCkgZGlyZWN0bHkuIEkgY2FuJ3QgdGhpbmsg
b2YgYQ0KZ29vZCBleGFtcGxlLg0KDQpIb3cgYWJvdXQgYWRkaW5nIGEgbGluayB0byB0aGUgaGVh
ZGVyIGZpbGUgd2hlcmUgdGhlIG1pZ2h0X3NsZWVwIG1hY3JvDQppcyBkZWZpbmVkLCBsaWtlIHRo
aXM/DQoNCi8vLyBBbm5vdGF0aW9uIGZvciBmdW5jdGlvbnMgdGhhdCBjYW4gc2xlZXAuDQovLy8N
Ci8vLyBFcXVpdmFsZW50IHRvIHRoZSBDIHNpZGUgW2BtaWdodF9zbGVlcGBdIG1hY3JvLCB0aGlz
IGZ1bmN0aW9uIHNlcnZlcyBhcw0KLy8vIGEgZGVidWdnaW5nIGFpZCBhbmQgYSBwb3RlbnRpYWwg
c2NoZWR1bGluZyBwb2ludC4NCi8vLw0KLy8vIFRoaXMgZnVuY3Rpb24gY2FuIG9ubHkgYmUgdXNl
ZCBpbiBhIG5vbmF0b21pYyBjb250ZXh0Lg0KLy8vDQovLy8gW2BtaWdodF9zbGVlcGBdOiBzcmN0
cmVlL2luY2x1ZGUvbGludXgva2VybmVsLmgNCiNbdHJhY2tfY2FsbGVyXQ0KI1tpbmxpbmVdDQpw
dWIgZm4gbWlnaHRfc2xlZXAoKSB7DQogICAgI1tjZmcoQ09ORklHX0RFQlVHX0FUT01JQ19TTEVF
UCldDQogICAgew0KICAgICAgICBsZXQgbG9jID0gY29yZTo6cGFuaWM6OkxvY2F0aW9uOjpjYWxs
ZXIoKTsNCiAgICAgICAgbGV0IGZpbGUgPSBrZXJuZWw6OmZpbGVfZnJvbV9sb2NhdGlvbihsb2Mp
Ow0KDQogICAgICAgIC8vIFNBRkVUWTogYGZpbGUuYXNfcHRyKClgIGlzIHZhbGlkIGZvciByZWFk
aW5nIGFuZCBndWFyYW50ZWVkIHRvIGJlIG51bC10ZXJtaW5hdGVkLg0KICAgICAgICB1bnNhZmUg
eyBjcmF0ZTo6YmluZGluZ3M6Ol9fbWlnaHRfc2xlZXAoZmlsZS5hc19wdHIoKS5jYXN0KCksIGxv
Yy5saW5lKCkgYXMgaTMyKSB9DQogICAgfQ0KDQogICAgLy8gU0FGRVRZOiBBbHdheXMgc2FmZSB0
byBjYWxsLg0KICAgIHVuc2FmZSB7IGNyYXRlOjpiaW5kaW5nczo6bWlnaHRfcmVzY2hlZCgpIH0N
Cn0NCg==
