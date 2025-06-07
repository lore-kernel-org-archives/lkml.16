Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6283619B3EC;
	Sat,  7 Jun 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749310637; cv=none; b=BM04HDcVrxchaJfRE7HACB1oIjfblGDjcd4CwfAfb1sK2lv2yOLIf0CWNUyOMNWKSSfQm11fJC6GKKlzSnOrT+vGKcTb4q6HGHU40dnjefcgEFgpG7/eY0uM3mWJMdOOfxks5JXJUtSLcPIFLeMYbMH4/cbGTHX8eymn7obPX3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749310637; c=relaxed/simple;
	bh=hobH2cB3D9QwmS6w1z716NpBDziaPQlLuXLn2ppt2ds=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Su+IWPzEF3u0xMD4Itn3oK9WP6F4cO7BonZJMjm9FkJ7AqvcRDh3Cev+5uUCjyVxBEDcWRUqs2qEtd7bruZzsdp0YMuOvYiC3VtIEPBkW2FcMw/uP5CjExJcdyfbtnXXtYIJ3W8GS+R6c1efRdNkNphIemWy8vTQgXsecWxnDPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5GxZDed; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5GxZDed"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFBF2C4CEE4;
	Sat,  7 Jun 2025 15:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749310637;
	bh=hobH2cB3D9QwmS6w1z716NpBDziaPQlLuXLn2ppt2ds=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=E5GxZDedPl+41pY/vVBqkFmxpDdW5WeJMQEKhAH6VITuytZdPE0rLK8C4m4T7OBVf
	 y4NDj9vj/QUO+q0Ed7HUHAMLOcCxEAbK3rPEwmW8oSwOkrPHEj0PKpG0mO/oRBp+Vj
	 ERrCngCKNm2Sqlco1GnfjEtgypM1pkXL3p6OvnZ23GDcB7Nfe/NibxjneP0Q2Ov2U7
	 JnRt27o+cwBuzKz6A47Q/ZnYvsscpxcXnIur5AFtbqvIp1v6lcajeWf8Pkyn8uRe8o
	 8U0e6olPLh8R1fpO8oxpOH/hiS2opATt7nV1ehzBcaB8g8eeqIeX/8oqg7kfiBND0m
	 MPjKtg2h9Pvhw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Jun 2025 17:37:11 +0200
Message-Id: <DAGEV65EU1DO.152XYF0ZYTM6P@kernel.org>
Cc: =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to
 MiscDeviceRegistration
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Arnd Bergmann" <arnd@arndb.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Lee Jones" <lee@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com> <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com> <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org> <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com> <DADAEIT9E1R8.1J69W5DKYAQGY@kernel.org> <3c1c0563-7f48-4222-a28d-316f885bcad4@gmail.com> <DAEQ7VRHEP4W.4O0KV31IPJFG@kernel.org> <89066f83-db7f-405c-b3b5-ce553f8e6b48@gmail.com> <DAERY78ROO76.2WSPPIC01XQ5H@kernel.org> <8f491c61-e7b2-4a1f-b4f8-8ff691015655@gmail.com>
In-Reply-To: <8f491c61-e7b2-4a1f-b4f8-8ff691015655@gmail.com>

On Sat Jun 7, 2025 at 1:34 PM CEST, Christian Schrefl wrote:
> Yeah I understand that its not UB, but to me it seems a bit fragile and o=
paque why it is allowed.
> That's what I meant by "a bit iffy".

What's fragile about it? That someone could add a non-opaque field to
the struct? Or that one is not allowed to take an `&`?

> Alright but I doubt that realistic, since the `Data` would always at
> least be shared between the owner of `MiscDeviceRegistration` and the
> `fops` implementation. Meaning its always shared with syscall context
> and I don't think it makes sense to have a registration owed in=20
> that context.

That might be the case, but I think we should have this as a general
design guideline: avoid unnecessary trait bounds.

---
Cheers,
Benno
