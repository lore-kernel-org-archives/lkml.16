Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B156A13AC1;
	Mon, 28 Apr 2025 21:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745877035; cv=none; b=VHMEKUbGLu8VYe6gvvSQugko+kjbSMX8r2TXSoKXLehHTcRhkpMBA9vpjtNifrU4WN9yb0oalDto/xbwZ9Y3a39uhRzUbFchTE+Cg8hdkAJLbrGLLdF8ku9GHaaXGa61ORZFfxHmSSp5sz0eoi4WcJzfJVyZd/R5FZ6KxdF9zYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745877035; c=relaxed/simple;
	bh=xkgKJ+mM+v2G3RDM01Ni5V44BfStJdd9Ju2IygrNch8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ZIa/HQBdG+D+zg/WzvjFEW/E/kKuxRXZbinzXsg6vl12IHWUBTRlZ1rzL42D0sk5106L1G7YIzV5iNejKs6lZxZsj6TYWqJSNP3DU8f918QE9+Jv7b3QeAzZEJL7l+WGU9LW68cltv4JD1Sf6az9TY10IIMuIKIcFaH9Z+p8W84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZmcZ80Q70z9tDb;
	Mon, 28 Apr 2025 23:50:24 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Apr 2025 23:50:19 +0200
Message-Id: <D9ILR2IG980H.34N8WNWKWJJO3@buenzli.dev>
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Danilo Krummrich" <dakr@kernel.org>, "Rob Herring" <robh@kernel.org>
Cc: "Dirk Behme" <dirk.behme@de.bosch.com>, "Dirk Behme"
 <dirk.behme@gmail.com>, "Saravana Kannan" <saravanak@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev> <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com> <aAyyR5LyhmGVNQpm@pollux>
 <0756503c-02e7-477a-9e89-e7d4881c8ce6@gmail.com> <aA4ht5sUic39mnHj@pollux>
 <ee888c8f-4802-48a1-bd08-b454b782fff4@de.bosch.com>
 <aA-oQAol8rAU7vzg@cassiopeiae> <20250428204840.GB1572343-robh@kernel.org>
 <aA_xUWQt6-UCdlGM@cassiopeiae>
In-Reply-To: <aA_xUWQt6-UCdlGM@cassiopeiae>
X-Rspamd-Queue-Id: 4ZmcZ80Q70z9tDb

On Mon Apr 28, 2025 at 11:21 PM CEST, Danilo Krummrich wrote:
> On Mon, Apr 28, 2025 at 03:48:40PM -0500, Rob Herring wrote:
>>=20
>> One thing that's really hard to debug in C drivers is where an=20
>> error came from. You can for example turn on initcall_debug and see that=
=20
>> a driver probe returned an error. It's virtually impossible to tell=20
>> where that originated from. The only way to tell is with prints. That is=
=20
>> probably the root of why probe has so many error prints. I think we can=
=20
>> do a lot better with rust given Result can hold more than just an int.=
=20
>
> This I fully agree with, not sure if the solution is to put more stuff in=
to the
> Result type though. However, there are things like #[track_caller] (also
> recently mentioned by Benno), which might be a good candidate for improvi=
ng this
> situation.
>
> As mentioned, for now let's go with
>
> 	pub fn required_by(self, dev: &Device) -> Result<T>
>
> additional to required() for this purpose to get a proper dev_err() print=
.

Could it make sense to _replace_ `required` with `required_by` ?
Otherwise `required` sits a little awkwardly between `optional` and
`required_by`. I can't think of a situation where `required` would be
preferred.

