Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CE726F475;
	Mon, 19 May 2025 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652517; cv=pass; b=KIEV4bsnU2MrS40p8c/a6GQZ4cO0pq94ZkC3Wk+523JEEjksmOpY/7XVsO+FsxmVSexyD+oYks6/XB9yxh4gWfgPzne/CMc+F6sfkEScE8RlPOb5aEJf+Lnsc8j+zvV/dXt0smV8t29E3eZaqI9B+8f6C3nsnIjhqL3d9vrSRPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652517; c=relaxed/simple;
	bh=161YKafeuZNBBRQedRWPgSGczjQQFeXjckeJgSUb4Ug=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kSUM5F7QxV5IlNqTWr3HVAqwoHqfw2VAkwxJ9yDfav3bPAu/k5lNGg825Ix8+bgHoqBxPLddWy9ifDEMxC4+IhcouSs4BZXQmEdQcThSGChj+of4gueu6zhLxZ0tzX2h3fHFWXm55h8A4IyHIgtywFYodtGOUbAih7Oypakk4N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=lDnEexXp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="lDnEexXp"
ARC-Seal: i=1; a=rsa-sha256; t=1747652492; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hha3soeWmrR5sI8lj0Pn1aptnlszujnHw0dutzRMR2pwtTpS1r5LAUiKrAhBBga6SQzy4LvRF2MxQGXQK4jXwkfnWCnbdoxp9TZPGplF9n0BTZIINF+c5kJB60+vlccgctooSj7RWpMZjsFL6/QCpui0hyShQwYVUB1A5B9nNrU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747652492; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=161YKafeuZNBBRQedRWPgSGczjQQFeXjckeJgSUb4Ug=; 
	b=RJshY1k1c4WSV+I/EJDUsBrMBJFNY1tDM+hw4YsAau9ad/62/VkAhaJTQvQ5se0OPGNN3xLEoaq7jA8oH+7u26hDjcSt0HRnD4mYfAZon1FWxh/Yn717XYBLzGsvKGeJLu7nqWn8T5RbbiS+kAwBCEsqK2dXSmPmrLybAbZ2nsY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747652492;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=161YKafeuZNBBRQedRWPgSGczjQQFeXjckeJgSUb4Ug=;
	b=lDnEexXpJYXQtOW357EOXaSUc62BOfwx8fr7qwLDSwUTIvy+lbZkqHUbOpYm9fpI
	GPNjsr3HZ93/k2zPYcOZOcWY9yakCYwmh7TaoqRyvvXN5Op3HOk+tNJuF62VJWbBpoH
	IfCBuXbj21ey9knQ6/QVh7QID0FP7x4D+I7TFAZI=
Received: by mx.zohomail.com with SMTPS id 1747652490961168.45082575803247;
	Mon, 19 May 2025 04:01:30 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <8517D6F0-C1A2-4E38-8E62-57DCCD5E58D4@collabora.com>
Date: Mon, 19 May 2025 08:01:15 -0300
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
 Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A0008125-1FE6-4B95-8188-9DEA67F68942@collabora.com>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <498AB71C-58EF-487E-8D9B-C7C113862948@collabora.com>
 <D9ZQUUA4FLXD.19MJI9HD48EMZ@nvidia.com>
 <8517D6F0-C1A2-4E38-8E62-57DCCD5E58D4@collabora.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External

Minor correction:


> This is explicitly not supported, because (given the current code) why =
should it be?
>=20
> If you want a given regulator to be enabled, just make sure you have
> Regulator<Enabled> in your kernel::types::Either container.
>=20
> You don't need a counter either: Regulator<Enabled> has a count of =
one, and
> when that goes out of scope, it's decremented.

Regulator<Enabled> has a +1 on the count. The actual underlying count is =
unknown.

=E2=80=94 Daniel


