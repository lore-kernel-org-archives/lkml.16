Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B9B1519B8;
	Tue,  1 Apr 2025 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512520; cv=pass; b=P5Wxxu313xMdSZAWNqlQg/+GB9Juf4NYVFo0ad4XNA1gO8MuyJYrD5/dvmuoE2vWyxmpuWf3wJMx//jxqWg1VZ8RViQTscMN6vlwsiIpXX+tQ4dX9Lz6Mn9qjn/xspjQc6Tu0R3GSQghfKzjcdjs4Bw93lzAPridfdDskNuRauU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512520; c=relaxed/simple;
	bh=3zbii5dIIWakMYL6/HmtVA9itZdrTHHqMBWHuHOlCi0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OE2Qbdzce3xbE9ml7XuZfsvx4FsxRC7M0teYAk7zmniaWGC+fGAXC6nMUPGV/+cYEDflWH62k4GMwF+CRNG+3tqXdoBgbLTHbO9XS83CDOL2OO8llwYXNKHIRDmPZPE0h31p6mb3aSgurdKGIzHC/62HtEk3IWAavHOEx/rX3QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=caTR4Gtb; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="caTR4Gtb"
ARC-Seal: i=1; a=rsa-sha256; t=1743512478; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dA8AM9eafn6zU/LhzQqg3GKKNZc1i8vfgfC+APtx7OskUQpSADUL+LXyZusWdIapU0c16eA3dj6Ed49RFEUoW8KRj6PMx4LAXGeXtYrGQJWgSzLeRnaDNyRzUaBULdXqVffXCwja4YcskOWHQpRSh2Jkp2x2Cy8cmonzeMTdwXs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743512478; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3zbii5dIIWakMYL6/HmtVA9itZdrTHHqMBWHuHOlCi0=; 
	b=iQO/cm0Y03SQBefRGMGq6ri2P6YfNhpiuxcRnK4jiKI9B7ylBBiD4gV3iQX/ixRJ5k7JdThaQmW0owejnuC+Gt+oEBmh+sSGXjTfnWwEt6sZxkuxpZQXW887TwwC9JWWDCdqeOElQs0ndpswQcd8rBA4BBNjQ+Vhp0U2LWDRnWQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743512478;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=3zbii5dIIWakMYL6/HmtVA9itZdrTHHqMBWHuHOlCi0=;
	b=caTR4GtbQNRnfynd6Jb2LtEqYx/+9wsXbKWv7eTOinNEpS0FqJg0YBPTZVV1Tt9T
	5ujBL/4EpDPjyTm3dtcWvu6r3IKYKuVe+K8ES6CzkH/Z6pArPy/3m3aFYOnRX9H59X4
	8N2iqc5kVvvZv0Bc0MGytX1CKyiB0UI4T/ekzxGg=
Received: by mx.zohomail.com with SMTPS id 174351247702681.5996379232995;
	Tue, 1 Apr 2025 06:01:17 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v5 06/13] scripts: generate_rust_analyzer.py: add type
 hints
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAJ-ks9mNZWrAaHChU6kXHOKcwUkL4MJ1ENjuTPBaE8CKrEYQPA@mail.gmail.com>
Date: Tue, 1 Apr 2025 10:01:01 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris-Chengbiao Zhou <bobo1239@web.de>,
 Kees Cook <kees@kernel.org>,
 Fiona Behrens <me@kloenk.dev>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Lukas Wirth <lukas.wirth@ferrous-systems.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <37B638D3-969F-4834-9948-22FCFFEEF62E@collabora.com>
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com>
 <20250325-rust-analyzer-host-v5-6-385e7f1e1e23@gmail.com>
 <1B186177-16B9-4D2D-9603-F713F0FE9BEC@collabora.com>
 <CAJ-ks9mNZWrAaHChU6kXHOKcwUkL4MJ1ENjuTPBaE8CKrEYQPA@mail.gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-ZohoMailClient: External

Hi Tamir,

>>=20
>> I found `args_crates_cfgs()` a lot easier to understand, but I guess =
this is a
>> matter of taste. I also find that this `defaultdict()` call slightly =
pollutes
>> the surrounding code, but again, that might be just me.
>=20
> Would extracting a local variable suffice?
>=20

Yeah, that would make it less crowded.

=E2=80=94 Daniel


