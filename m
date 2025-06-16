Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352B62BF017;
	Mon, 16 Jun 2025 14:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084090; cv=pass; b=apcdMDMmxWLgStdgAosbYydTZB2zt+vaKmHDS4Sh3yHHGGjSS+5p01qQFSTlaWZjDFLyrxqej2TAlfj8fbRZejoJxA1ItcJp6jBKtc19rducgjp3I4VrB8HvWbbVS5z71ghHJknuGutOCT//79cUEHAZTot8EnC7D+eQMZ1vSCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084090; c=relaxed/simple;
	bh=0pRvbSGRt3AQQuVD8byNb+NP8wTfFRltOpXxdOxPygM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uyU85zrLHx6AQT1Iexlul2L88i3rg00GLVVDlW/glUIAPt2RLzIrJk9Jye5jpaSQQa/FWnS3tl8LpvRIEIUfUWnyG4NOZwHoSBIo1EFABCELcwUVnZd2yZRQtXGhnlfA8hE6wb/MtJ0UJh4CWg4s9KvdDnoVumSF8OgXjfEU6oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=R1iM/nD5; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="R1iM/nD5"
ARC-Seal: i=1; a=rsa-sha256; t=1750084062; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gUuvqIuNqTbaW3jIsupm/x6BMKSjBN8V1Qa+R8EKU3M18KmEX9z5l8aD436t03tc3F0JKiudq1IFqrqwi9Bit2JejojbKdoEE3attzfN5+CYKdGkLZEjVpqJr6gHqybL0GwoKHrykiACwYi9HuP2tOXQmTmZ2QGGID71KCgGqmA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750084062; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=F8bXUy3Bo9HR5kOOZmrCShKyAkBT2AWqhHDEKbHnNPE=; 
	b=mxPmI9wpM/PUKBeCYO8dIAqwYgS0vGRTqC45B8FYJj8uAXlSg8nNDD6lC8fDEcpEprS+Z5WojWVeTipVSZdNMX5sSkhyaNNe/YyCznTVET/YOeMwgEZycUsO43slXAJjPWzHG6Z5iLRdlKNQFSLpBcNzzlJ+vsfMPmmudJqDRJ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750084062;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=F8bXUy3Bo9HR5kOOZmrCShKyAkBT2AWqhHDEKbHnNPE=;
	b=R1iM/nD5R9vmIB5/xoH98JZa5lYGfY7NrMwwoFYAj4nXDPcqCj+IihBscWDkX8Sh
	jY1sm0kVdOBwcj/AxsD1KYhQVQPLw4EhyQ7RJztAhbm/KqWbQKqs0EXuauL/FcIV+ow
	CcVPUV7JJeIVbkqXE6ZvS6U+gWGjUr9B0hlkcLe8=
Received: by mx.zohomail.com with SMTPS id 1750084061109357.29402544373875;
	Mon, 16 Jun 2025 07:27:41 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v4] rust: regulator: add a bare minimum regulator
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <db5fd836-6fa2-41eb-841c-98cd54f21687@sirena.org.uk>
Date: Mon, 16 Jun 2025 11:27:25 -0300
Cc: Alexandre Courbot <acourbot@nvidia.com>,
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
Message-Id: <6A5766B8-EF9A-41EA-AE55-D29C5184A9DB@collabora.com>
References: <20250609-topics-tyr-regulator-v4-1-b4fdcf1385a7@collabora.com>
 <DAN57NVEBNIF.270U4DKHZC13P@nvidia.com>
 <db5fd836-6fa2-41eb-841c-98cd54f21687@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Mark,

The current patch implements different strategies to handle regulators. =
By
=E2=80=98dynamic regulator=E2=80=99 he means the one that implements the =
current C
behavior.

> I'm not sure what you mean by a "dynamic regulator" here but as
> previously outlined we currently take a very conservative approach and
> don't do things without being explicitly told to do so since getting
> things wrong can result in physical damage to the system.
>=20
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Ok, no worries, this current version of the binding is already =
implemented as
you said, so we won=E2=80=99t have any problems there.

=E2=80=94 Daniel=
