Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DDD800;
	Mon, 16 Jun 2025 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085159; cv=pass; b=UG6jb5j2D/Tb92sSQGkic1yr1dnqy4ahYBO8IfJXpQNf42paDqcOt81onoy3FcMXV7PGYt9ZKA+h+WOkfiHk5BUc0zmHVWT/MbDWIJw6NxtVfBKeYUDiV7J4j7qihb4iucaXS52r7mbNXd4y+49X6HR8cTQ3Rr+FwlLnZFugNVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085159; c=relaxed/simple;
	bh=1JyUBZa8RyOxC1jZqL4pHwGDCZdl9cPHYBUvbGcntZ4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=utPlAm798gcqyPn39oMAESq2O4WRolyNfiVtknVfqphZYMux2mQGBYWQco6xd9Ve//3v0YAHz8tt2TtI9TXu0td1RvSaqyd67hx4BHmbkv3CT3dOZINpnj/glo9BgQSapwv2ufs0NUlCGiLcJ7waVDyztOLMTwR5Gm3Lng/YXMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=XNPSDV2v; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="XNPSDV2v"
ARC-Seal: i=1; a=rsa-sha256; t=1750085139; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aB9+sWJPt+RPD15x7pQUhBvMUlW1TUmE1covY2qF4KS/g7/rS8FChAsgzkApELKO8rWVKM1a+0UnA5Cd4a9j6dVbtJTsabdd1uqZpI28yS1tC8tTVGZY/34gNmPYuggJB9zweRj0l/Yu+P+v9K6Z2P3P3kFPN6udhJoLS30s6Rc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750085139; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1JyUBZa8RyOxC1jZqL4pHwGDCZdl9cPHYBUvbGcntZ4=; 
	b=RcWCWLLNVuzg2V5H5i0xyp/8PNKmTyEIVUFh+BI3B67MVERJcLu7dthwNR54Y//WCSmUPnDAIG6dOxAa9TXmfyGS6HBILpDdGiMsQQuwODo+WOF322ZVMRwKtByhZJgtRzTLKjurF0UxXuLQclXv0XsuEev0gm3U9wZm5s//g8U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750085139;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=1JyUBZa8RyOxC1jZqL4pHwGDCZdl9cPHYBUvbGcntZ4=;
	b=XNPSDV2vumsY2TOlb6dl+LqXxFDRAzDxyB80l8F/qNBjEAw521OkrrUEz+Ua1PUt
	DUQVRVUd9rmIjWO+JbUh6kvoD+5zGK5fMcQXtmgHIs09+7Prmd29UfD8F/PcxhgMvGT
	4UbguzvGV7X8wv50zOI4v9PjtXHzXU1+TBjFzQiw=
Received: by mx.zohomail.com with SMTPS id 1750085136480843.106553204945;
	Mon, 16 Jun 2025 07:45:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <D29BB87C-356E-4885-8308-456028AE3B6F@collabora.com>
Date: Mon, 16 Jun 2025 11:45:21 -0300
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D12DC02A-E1EE-47F1-86AF-C25C492FA3D4@collabora.com>
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>
 <9578ECFC-6C59-40E3-9340-A426E8D2328A@collabora.com>
 <aFAqLYBMHkC_X-dr@Mac.home>
 <D29BB87C-356E-4885-8308-456028AE3B6F@collabora.com>
To: Boqun Feng <boqun.feng@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External



> On 16 Jun 2025, at 11:42, Daniel Almeida =
<daniel.almeida@collabora.com> wrote:
>=20
> Hi Boqun,
>=20
>>=20
>> We should tell/educate people to do the right thing, if a..b is not
>> inclusive in Rust, then we should treat them as non-inclusive in Rust
>> kernel code. Otherwise you create confusion for no reason. My =
assumption
>> is that most people will ask "what's the right way to do this" first
>> instead of replicating the old way.
>>=20
>> Regards,
>> Boqun
>>=20
>=20
> This is just my opinion, of course:
>=20
> I _hardly_ believe this will be the case. When people see genmask and =
two
> numbers, they expect the range to be inclusive, full stop (at least =
IMHO). That's how it has
> worked for decades, so it=E2=80=99s only natural to expect this =
behavior to transfer over.
>=20
> However, I do understand and agree with your point, and I will change =
the
> implementation here to comply. Perhaps we can use some markdown to =
alert users?
>=20
> =E2=80=94 Daniel

Or better yet, perhaps we should only support a..=3Db.

=E2=80=94 Daniel=20=
