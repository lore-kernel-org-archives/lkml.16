Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273E31E47B7;
	Fri, 20 Jun 2025 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750427374; cv=pass; b=OKLQbcanWd55FiUTs5WPLXJHQZlA7uoEVSDMdGszVfdQ2drTLcHXkG721VdRiZHGef4wpvYpHhnhOPGZAheJYDK5+hx/a6lhhst0SYsKwUiDxFEg76iqQdyhsGVbihJKRk5SfVoigLBY0fBfr/iWJGzBQqbjh0rJqgQdGIPgF1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750427374; c=relaxed/simple;
	bh=bJ6/AIFKREEsY+C/LkOodTDYobYRKzawwXB8Uew3M7c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XBilUubm54iLwz3/NhbRMvk7oU1eMlCaFa8it8aqOTyghKfyUK8JVPk0VKnUBUMeqffCk6hq4kXLNMkgXa+QdaR3NHXCN+JkSw2bKORvrWPQi8nK68PSYQccjRBxLEMRcGPLo4AlDeSCpWDT1vDfqNYakG/2W9JCOGT6mldzXxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Iz9c0aar; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Iz9c0aar"
ARC-Seal: i=1; a=rsa-sha256; t=1750427354; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VK9PaUR/nliY1fMcI+er9sZqw6RjYQRRv64G+KAOkKHLzB8aNb0hjD0ExZxK660BsbjzQElO4+AntVWFWxKf+S9Uk+AHi/Xt4q1zTyrA7Am7R7X2q7nYxYEwVZ1mMWuCB8N8nbDuwGdOb/eeWvvuu6Tv8Yz2/wAzxbmkW55nwOE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750427354; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bJ6/AIFKREEsY+C/LkOodTDYobYRKzawwXB8Uew3M7c=; 
	b=n9LRh+7KKcpAz2ETsUy0WkO1mR+0iUs1gjznJAujoKzmOcJpuFBOFizNlnrYGYo8SJDLGZ8Db6xVTjy6BOEUIGCV13LIiIG95QZyZpf0czjOgJkIsN8PNyVM7XCpa0T/Qh4PnzshZuUi5y4jlnsj4iSeMKwb84w7TtPbkWfykk8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750427354;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=bJ6/AIFKREEsY+C/LkOodTDYobYRKzawwXB8Uew3M7c=;
	b=Iz9c0aar5+aooTdkR5kB9qxwNJnVsiXxWjbSvsflLfhxrBtP0OZKpijcEtj/+d3A
	rOk0zbVfXVE/DfnLWIetnvFgTDqVus4/I8Hn2acMqZ3yWwBl7nUTZYb9Pa/HzAwQeWq
	Bv83SXf1Ldw6RjTJJC3cqRAyAZIRbBKdzy5kyNKY=
Received: by mx.zohomail.com with SMTPS id 1750427351914728.9472693277781;
	Fri, 20 Jun 2025 06:49:11 -0700 (PDT)
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
In-Reply-To: <20250618205824.GA1682301@joelnvbox>
Date: Fri, 20 Jun 2025 10:48:56 -0300
Cc: Boqun Feng <boqun.feng@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
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
Message-Id: <D553B512-2338-4602-8EEE-B87B2BFC2FC8@collabora.com>
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com> <aE2P3OBo1Ufjctxy@Mac.home>
 <aE2btHiDP5LRmBTL@Mac.home> <aE2d1RdR1-pxurzj@Mac.home>
 <20250618205824.GA1682301@joelnvbox>
To: Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Joel,

>=20
>>>>>=20
>>>>=20
>>>> I think generic over `RangeBounds` is a good idea, and we should
>>>> .is_emtpy() or .contains() instead of comparison + boolean =
operation
>>>> when possible. Seems we need a function to check whether one range
>=20
> I am also of the opinion that RangeBounds is a good idea. I think it =
may come
> down to both classes of devs, those who have used genmask before in C =
and
> expect inclusivity, and those who are using it for the first time in =
Rust -
> the latter may almost always want to use the non-inclusive syntax, no?=20=

>=20
> thanks,
>=20
> - Joel


Can=E2=80=99t do that in a const fn, and we really want a const fn as =
the default.
Hence my suggestion to only support a..=3Db, which is both correct and =
explicit.

=E2=80=94 Daniel=
