Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17801E9B1A;
	Wed, 14 May 2025 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239094; cv=pass; b=Q3fk5uJ0dbDnzuQs09gi/K6tRxqgcJfJf/N/+HdS/TJj6395RQB08gD7H6EffFS5m3KLK9PPI8CNVQYkbtEVWMozy0AvPD1nY36Ow+mhI4KooRlAVATTjuGnVuQgsdp71pca/IzYCZOxsBNZpkzwX699tbhogXsgsN4kCBrUPgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239094; c=relaxed/simple;
	bh=lQHCQ80hYkI7tRsS4CYNGCZob1ejmy5HFD0OETYTAcc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=JCtYDiJ8ZK8WmeKMq19l1kUCpPdM9//GQrrUac+2IqNiGU9RQwniFKgEZBWfyoO7lC5t3LQTgqsSC0rFz/BxGSqQomtsoHe0iVonz8QT1nVQ5hLvAc4qdbH5JNQ+Knun+VEDktmWWl1jlf0cT9Pu5P2xdSJ8AVF47HDfk1PbeDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ND9+wKun; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ND9+wKun"
ARC-Seal: i=1; a=rsa-sha256; t=1747239070; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q1kEt3vYykVudZA/dTsWLFYqzCv7YpU1k5tZLAD+bvbA2TwRjbaNth23/5txx4kges/BuAZFNELFqviLGdThokHqQsqDRoevjU6XjIDjFy0qCPW/ukFwL84Tf6mO7i78V6+TIuGZs5HJlfD4F/nEqB2Jj59C1DbVct2J1GGMfvU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747239070; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nv0IqvoJtsBRELJdGMAbLYGlK2WwW+8ndubCbm6OaW0=; 
	b=PgRE70nldNbtQxYusCVK7vWz6Zs8TR25CMVe15pnTw/20BNMgrLtykZi7xb9l9Hv03+aZX84gW7r+INDmyg41z8tZLuaucSSCktRhy7xc9VVOqv0AWMATEtT9HRyS0faIe2RIjUhdTLHQLcfHAHZ9iWn0K9woSmXUD71m9Qqycg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747239070;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=nv0IqvoJtsBRELJdGMAbLYGlK2WwW+8ndubCbm6OaW0=;
	b=ND9+wKundDUgTRxHuHRfEmmEbNtLBkElZK3Xp60NtdEP1gOUwpRVKmddxGFvTwW4
	lfsBi9sCO3bqoQOSOxwEEExwyx0fpo4daREGGSgGnTi5WRCC1IELWASpgPrwrB/7yfH
	NNhwdAaMBdnZ/87Na+vHL6AMhwadJ8IgNMNIWLog=
Received: by mx.zohomail.com with SMTPS id 1747239068698495.8203448866441;
	Wed, 14 May 2025 09:11:08 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aCS71sbQKn7zeosR@finisterre.sirena.org.uk>
Date: Wed, 14 May 2025 13:10:52 -0300
Cc: Benno Lossin <lossin@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
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
Message-Id: <4EF1B72A-826A-4435-A586-B7E0EB2DCF84@collabora.com>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <B288AFB1-BA0A-4383-9823-EAC9E5DCA59F@collabora.com>
 <D9VXPNT4HNXP.1PKET0Q1H7O9Y@kernel.org>
 <52CFFCA2-F253-49F1-9EA5-2865BD094B25@collabora.com>
 <D9VZV8APBYWU.2SWXJLHIQ18ZB@kernel.org>
 <aCS71sbQKn7zeosR@finisterre.sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External



> On 14 May 2025, at 12:50, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Wed, May 14, 2025 at 05:38:40PM +0200, Benno Lossin wrote:
>> On Wed May 14, 2025 at 4:40 PM CEST, Daniel Almeida wrote:
>=20
>>> By the way, IIUC, regulator_disable() does not disable a regulator =
necessarily.
>>> It just tells the system that you don't care about it being enabled =
anymore. It can
>>> still remain on if there are other users.
>=20
>> Hmm, so a `struct regulator` might already be enabled and calling
>> `regulator_enable` doesn't do anything?
>=20
> It takes a reference to the regulator.  This may or may not result in =
a
> change in an underlying physical regulator.


I assume these are two different reference counts, right? One for
regulator_get()/regulator_put(), and one for
regulator_enable()/regulator_disable().

Looking at regulator_dev, I can see both "use_count" and "open_count" =
for
example.=
