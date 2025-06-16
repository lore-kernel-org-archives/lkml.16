Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59642BF012;
	Mon, 16 Jun 2025 14:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085007; cv=pass; b=CSEdarrwJZOz6DcFUgbDb/vxIfra/qY0J5SUQhDXy8tWTkG8rnBz4HtCQxT2jmxIo9lhN502fegt4YwtIPPNH1ZHj078NXaojn9GoQiO2T7nR3reFrHxj2mQGGLmFWsv8csvlLT6TfCNqH5YhfuHKRuWefdOq0b6RKUisOXRTyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085007; c=relaxed/simple;
	bh=pP1xiFra15VE0xcoJZoV/ZTiyyuP/s1T6tuRzjmNIVk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=pRNlkkDrveg5ZLi7QMuIRvweMsb/C3j9v1rrlAp3Kllb6GvJHoxF4T9xsrbYxuOQ0TMo72te4TXjTOnKzHqfM7k1L5Llo00tCX9GB5giCNu2le9KtP7ZG0DkRz7QoIa1IsURqTTIS0wms9SYkiif8dXheT7Ae372XhtVj0R4QoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=V0OXg2VW; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="V0OXg2VW"
ARC-Seal: i=1; a=rsa-sha256; t=1750084979; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O103MT88nytMHJ8xqzCbEgWuBW+ZKSCvaLVUCBhi9NIxK6kTL/wNAbIK1xtxocnqXfqJRFalIl3cl5mJEjdEm2OmyArYbuhQljpcrKT19ChpYNJsSYSCvTffIGOpGqcRhaoSC2qX3AAydJtJQhI2Onu3UojtDtzfB/uVE4c+7y0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750084979; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pP1xiFra15VE0xcoJZoV/ZTiyyuP/s1T6tuRzjmNIVk=; 
	b=LNOyLEPUDykDzgHOrwpBnliufaSLe9sTNCpO+CMAbbGAfSCgzX82a6x0CoQGqdWPfwxdLDS/1auP3rBTBC35rzMmybrSeQrCt7ERptPO6XTbfTGc6V/ZW2zPKVYGRB3aUij3vfAsrIGXNltWO7pXw5ye3/howfuCxrpcLVoYhwk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750084979;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=pP1xiFra15VE0xcoJZoV/ZTiyyuP/s1T6tuRzjmNIVk=;
	b=V0OXg2VWwB37OxJmQRQtsr5i/HFRhFLNRtb7dPq2XaffkIhh4f+AF49vq9HbqCDF
	K1YT/XqMWxquneJ06B/QgZOs55rgBTBYmcinQCihhJnVA+ps8J+q0w0JiW9eWOEiHI6
	oj3wP+ua5Lo+PQNJ8gIT9YPyHazVRuKYnanH9O+k=
Received: by mx.zohomail.com with SMTPS id 1750084978404609.7770321053222;
	Mon, 16 Jun 2025 07:42:58 -0700 (PDT)
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
In-Reply-To: <aFAqLYBMHkC_X-dr@Mac.home>
Date: Mon, 16 Jun 2025 11:42:43 -0300
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
Message-Id: <D29BB87C-356E-4885-8308-456028AE3B6F@collabora.com>
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>
 <9578ECFC-6C59-40E3-9340-A426E8D2328A@collabora.com>
 <aFAqLYBMHkC_X-dr@Mac.home>
To: Boqun Feng <boqun.feng@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Boqun,

>=20
> We should tell/educate people to do the right thing, if a..b is not
> inclusive in Rust, then we should treat them as non-inclusive in Rust
> kernel code. Otherwise you create confusion for no reason. My =
assumption
> is that most people will ask "what's the right way to do this" first
> instead of replicating the old way.
>=20
> Regards,
> Boqun
>=20

This is just my opinion, of course:

I _hardly_ believe this will be the case. When people see genmask and =
two
numbers, they expect the range to be inclusive, full stop (at least =
IMHO). That's how it has
worked for decades, so it=E2=80=99s only natural to expect this behavior =
to transfer over.

However, I do understand and agree with your point, and I will change =
the
implementation here to comply. Perhaps we can use some markdown to alert =
users?

=E2=80=94 Daniel=
