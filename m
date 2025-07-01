Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B221A0BF3;
	Tue,  1 Jul 2025 16:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386234; cv=pass; b=YUHj8x3UCuCX/6GXvl/iK9uAFiQuGA3AXCyH62Kt1rZMmFsNp23e5w+lfYA5DhMZC2xSv1suhRqec9rsMRW+iE9/I+ABGwq66MGi1BjGivoHZYXEyCK1/fxqZp/fdQ0PQP99pHHxh61/WqYcbf51qWX5TwbQzOgzTGvO/IsjsWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386234; c=relaxed/simple;
	bh=x1qGCQgelaLxofKdit6EBhI1imMhPEdkaaVrDIbEQjE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=IF2km7nda6C+yujomBD/m1160wVLcsXzeC18Gw/OyFni4kwU9c1+BTYkWP7FFtk8uNj/QFCqfRsQljSnrrL6vbhH3T8ZDUy4j8mhFUhATaR4ijEIKfEOhCXIVXEzLh3Yib5fE6/lsPEmJyBLON+RgeGlJlGN5OtvZphPwUK5y+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Jfkhlvwc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Jfkhlvwc"
ARC-Seal: i=1; a=rsa-sha256; t=1751386214; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bwe7574DJ71S6deqceQzpzjpIXC6JOjuOhtDqtP2IVtT7VXubIMkjdTv1UPIY4Zbrwr8dpsMlprIDzGiXNN8PDx6mLD5QHjShD+/04JouVzhJvNVyDQKW6O0J8kOv5PeCmWOLE8WoC73WELgVxEkbyiNJnPZZ9T6V08pNm0nQQc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751386214; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MyN19d0qYooXy4ljYZwHK6qQV1IUB2tRRk5Vjjv2GF8=; 
	b=kJZ9EXD2PgP3bWG4xfgMUn5KfJi/ZciUZ6sFyAHDPyw/shC+g+tNoCkUccpdYIMNUoDh+xbfym0mA5SUHuCPqlZ/uxiGWozqdQWj1qfRuA930clXUZeZ4GpebUGuy2mu7HFdbmPoyGMUN6Gk8ubAQ0ltcXpuGpYoMvmdYg5aGuw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751386214;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=MyN19d0qYooXy4ljYZwHK6qQV1IUB2tRRk5Vjjv2GF8=;
	b=JfkhlvwcTUAW3inEhsVpDadalzZg6FFJpnJwmx8ycjaAQOgTlRriJMeryQG1a2fF
	rbdNVDR2Ho+1fjRi4LkuJ8V6ybJqO2J/iBovE8kOZAGQc6NfWYosS+1b1PncsMMVzKF
	uh7GzFv1q5/1DaKUiCiXlxlBdewUjviOROJfe/dI=
Received: by mx.zohomail.com with SMTPS id 1751386212406353.3401923756019;
	Tue, 1 Jul 2025 09:10:12 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v6 0/2] Add a bare-minimum Regulator abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <25e9a9b6-4d81-4731-98fa-add40ccd4aab@sirena.org.uk>
Date: Tue, 1 Jul 2025 13:09:55 -0300
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <42FAAE27-E6D0-4CA8-83EF-5E4F9199FA9C@collabora.com>
References: <20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com>
 <CC8F34AD-811F-4504-B625-AFD845198549@collabora.com>
 <25e9a9b6-4d81-4731-98fa-add40ccd4aab@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External



> On 1 Jul 2025, at 12:34, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Tue, Jul 01, 2025 at 12:28:37PM -0300, Daniel Almeida wrote:
>=20
>> Is it ok for the abstraction to only be built when =
CONFIG_REGULATOR=3Dy? This
>> means that any Rust drivers using it have to depend on =
CONFIG_REGULATOR too.
>=20
>> I thought this was acceptable, but apparently that is not the case? =
See this
>> comment from Rob Herring [0].
>=20
> The regulator API stubs itself out when disabled, but given that this =
is
> just wrappers it's not clear what the tasteful thing would be here - =
it
> should do the right thing because it will itself be built in terms of
> the C stubs.  I don't know if Rust can sensibly stub things, or if
> there's much percentage in that for a thin wrapper which does =
basically
> nothing itself.

Well, if all functions in the regulator API have stubs, then perhaps a =
trivial
solution would be removing this #[cfg] from here:

+#[cfg(CONFIG_REGULATOR)] <---
+pub mod regulator;

This would build the abstractions unconditionally, and it would =
transparently
use the C stubs when calling the C functions.

Waiting for more comments from the other RFL folks.

-- Daniel=
