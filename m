Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD78927701;
	Sat,  7 Jun 2025 19:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749323162; cv=none; b=lmkJTuE7UHLs4O+jkO3+YKx/YGRPLV8I6tM5cIQov+pL4bO8JsOGscWz21e5gOMIt1AYBEED+Ez7HgltZayJAMfexyJumZKm1pfu3w830xIz7NVVvIlYXL5U0rLDrsnaaI/o1kg42tciOdTaDc+TDfwOQYLQ1OrfEgFJ1slPf3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749323162; c=relaxed/simple;
	bh=9vSi8Ri4jM07UFJyfBKvFdE9d3Wg0c0G82IByjE5ALE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sVz+r64uvoSEPXJgCBTg/8XnHCKT6WT6haocFNVB7TNnDexqv3xUxdx8n5fQHhmpo2zBk/OB0EaOCCK0fTsPOvCYfeDjW5SuQo/QvWFHbgQUQHjHOJcwhjTpnCwqT5v1EfkKhGl6drnui5+u+jdoRmAl7oOpeOLbFfT7iBGu2HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBdKOgDy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBdKOgDy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F91DC4CEE4;
	Sat,  7 Jun 2025 19:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749323162;
	bh=9vSi8Ri4jM07UFJyfBKvFdE9d3Wg0c0G82IByjE5ALE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=KBdKOgDyNkfr7h1JwHFrqem6rpCijrTKMMp3nbSTOlfN4XHwLZ4NshZ7LqK+p3e7Y
	 HiWp1MRahq649+Tr9FiN4YZ2JGBeZzAGkg960HfLOQQZfyKd84+SUfqyxzIn01m/Zv
	 I/XJj4ajJ77Rt7/8LE5xKlolkYi0sd1AG1zcFv+sGMyqJZHMhwnG/ddN25K7m8YGKz
	 BSY4SCF2f1yUIdrPmLf9EOedpGTvjxZOmmc3FsSzmCpoSM8eaqH0Idgln7YWgJf05q
	 xQTlQcnyF1Ajsne9uhkrY/HT8rzUyNJrcz+DBARS0FP89nFRsRhbKrE1qG0sBu1SjZ
	 WuboBbFguLh9w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Jun 2025 21:05:57 +0200
Message-Id: <DAGJB089ANQI.X0EM66P0KMWF@kernel.org>
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
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com> <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com> <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org> <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com> <DADAEIT9E1R8.1J69W5DKYAQGY@kernel.org> <3c1c0563-7f48-4222-a28d-316f885bcad4@gmail.com> <DAEQ7VRHEP4W.4O0KV31IPJFG@kernel.org> <89066f83-db7f-405c-b3b5-ce553f8e6b48@gmail.com> <DAERY78ROO76.2WSPPIC01XQ5H@kernel.org> <8f491c61-e7b2-4a1f-b4f8-8ff691015655@gmail.com> <DAGEV65EU1DO.152XYF0ZYTM6P@kernel.org> <68fd9ef6-a93a-413a-99b4-1b4d100aecb9@gmail.com>
In-Reply-To: <68fd9ef6-a93a-413a-99b4-1b4d100aecb9@gmail.com>

On Sat Jun 7, 2025 at 5:39 PM CEST, Christian Schrefl wrote:
> On 07.06.25 5:37 PM, Benno Lossin wrote:
>> On Sat Jun 7, 2025 at 1:34 PM CEST, Christian Schrefl wrote:
>>> Yeah I understand that its not UB, but to me it seems a bit fragile and=
 opaque why it is allowed.
>>> That's what I meant by "a bit iffy".
>>=20
>> What's fragile about it? That someone could add a non-opaque field to
>> the struct? Or that one is not allowed to take an `&`?
>
> Yeah that a added field could cause UB seems bad to me.

Actually, I don't think it would be UB, since only the `data` field
would be borrowed mutably/immutably at the same time, but not the new
field.

---
Cheers,
Benno
