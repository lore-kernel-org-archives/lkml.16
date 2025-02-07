Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13901448E0;
	Fri,  7 Feb 2025 13:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934750; cv=pass; b=asDiusdERM69XkSU3oQ1+2Njmmtv+XcYQk1OwUHLSp4eMqUpWQ2doqJku/JZkxzW3xjqnAKOkNC+y30fwfOenWQHaQljVzlt4ieQ0jUsC7a1+CJk+6V01Aep+3hBJw7XFjZY+5/d/2T/IwJUQN+Q9arKAjt8FSxOpGH35uhsBNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934750; c=relaxed/simple;
	bh=npiJI/Jl/eTm7nVbldwPPxU8JxbWR8l/VeHbzpXdrRc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=elCJjtcBT8IRPdQF3WOGexPehXsNtegUNivG9GQPbZjmiKG2rWxDxC98hIukC35Wa0BAwpc1LB4f/FYt2kMWAATwdaphUaRRd6w8svs1BQk/0qNnYCa8GFBPT2fZfruLdpE8eb3Whx1W+Tn8ZUO3FXNMF0Thm0yHCL7uqOBInrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Jr2F3i/u; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Jr2F3i/u"
ARC-Seal: i=1; a=rsa-sha256; t=1738934727; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HsRX8OfwKxh0N6MJarx5824n+QEBwgyCSGP1424+GCJXusQgwYxEgkQ/IXIxZyQUkicER67r5OULHufIGs+yJVcag7LGwwUjpqYpa/4SLZbHMa6bvdvfZe9+V/inKFr35SM4RFxJCvJyq4vHAsYe3Jxv26i1b/o+3XBb/ioDMes=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738934727; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=npiJI/Jl/eTm7nVbldwPPxU8JxbWR8l/VeHbzpXdrRc=; 
	b=lc5sxzGN84U01jia8XWe2/xE7X2i/iYCZtoems9FeQ2IXN31VsZSFvi6ugQx9W4NvsEOaxZpBslwcMdtFUCkdsFgsRz7tS/SJJtFuyLMBEPrqMqRbF2aAu7xnP6STpguoQGf9+zpi9R4/4BsqlMJphqvBPXKbSZKm6Q0t1kE0oo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738934727;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=npiJI/Jl/eTm7nVbldwPPxU8JxbWR8l/VeHbzpXdrRc=;
	b=Jr2F3i/uiCb63tAcU23T7XPNa/EDy6nUeBHkGSPrfHK2GHhJ9tNJ08qcfLmME4Ag
	Iu60key0wdxdkxvg/5pw7uFNBBpOBSrVCyCSK9pmIMAm0Ms3FDHnOe6RCZvk4MTZxOR
	F4a9nA4jg3OkC/X8oAtgVYW2e47ZqDQw3AUAxfb4=
Received: by mx.zohomail.com with SMTPS id 1738934724448370.76818352174746;
	Fri, 7 Feb 2025 05:25:24 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <Z6Ttn83DQ_8asHXl@cassiopeiae>
Date: Fri, 7 Feb 2025 10:25:08 -0300
Cc: =?utf-8?B?5bSU5YWJ5Y2a?= <2407018371@qq.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>,
 a.hindborg@kernel.org,
 alex.gaynor@gmail.com,
 benno.lossin@proton.me,
 bjorn3_gh@protonmail.mco,
 boqun.feng@gmail.com,
 boris.brezillon@collabora.com,
 gary@garyguo.net,
 gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 ojeda@kernel.org,
 rafael@kernel.org,
 robh@kernel.org,
 rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Content-Transfer-Encoding: quoted-printable
Message-Id: <774D098D-9FEC-45CC-8645-A6E5A7BEB4DF@collabora.com>
References: <20250130220529.665896-3-daniel.almeida@collabora.com>
 <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
 <CAH5fLgi+Qf=o91XEPamjycdrGeso1yDEDOGNQRmmy-miakDaOg@mail.gmail.com>
 <tencent_9719A47A97C91AAD7453E64CE987EDABD608@qq.com>
 <CANiq72mS-AgdAva4mB=FWf5dh3vZg95Ka7Wv36ypoZXChuwk=A@mail.gmail.com>
 <tencent_E1DC219DB45DC03A8454E2124D238DCEC705@qq.com>
 <Z6Ttn83DQ_8asHXl@cassiopeiae>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Sorry, didn=E2=80=99t find time to reply yesterday,


>=20
> That's two different things here. Miguel questions whether the comment =
is
> correct. And I think it's not, they are indeed exposed.
>=20

Yes, I said =E2=80=9Cnot exposed=E2=80=9D, but in truth I meant =E2=80=9Cy=
ou can=E2=80=99t use it=E2=80=9D, as shown by
the build_error being triggered.

My bad. I will fix the wording so that it=E2=80=99s clear in the next =
iteration.

=E2=80=94 Daniel=
