Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AE7EEA9;
	Tue, 15 Apr 2025 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728458; cv=none; b=ozTrwAP1lxFDyQJzNEXi0gqZLopHiTnRTjYEXF1EcmV2or1xBuyALeMBxJLXKtU6zMiXHOP+qKgBv1sae78A6fweka6vbfehQj8Ei2Wsk+3XXswQUr38uNOOT/olMl3DnBscJ7HuzveYN+PPasIBFKRzA/w/e3ud8PeTDXEB8W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728458; c=relaxed/simple;
	bh=yehWU6Cn1U0Ig31Ss4U++BRxjRmpPRpJ3DovWt/2v+w=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=PWwWFzEk8vJHIfX42NSP3VAPSAJNo0RGUQfhKwyruiU7XS1zpREw2cspsys84dx8ojLs3/36IQoH5MTQ5hC08oXubLoNJUyZqDuBHTVJSTxAEukDsPsoBreiT+U7OE7MaO426AsRDLceAeptal/L39Ke5WrWPije6RDWL0/h93U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZcRp62VGNz9tRl;
	Tue, 15 Apr 2025 16:47:26 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Apr 2025 16:47:21 +0200
Message-Id: <D97AM4S7VLL2.260GHNH82O60I@buenzli.dev>
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Rob Herring" <robh@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Saravana Kannan"
 <saravanak@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] rust: Add bindings for reading device properties
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-3-remo@buenzli.dev> <Z_1Jfs5DXD2vuzLj@cassiopeiae>
 <D96RNFS3N8L2.33MSG7T019UQM@buenzli.dev> <Z_4rVyUjK1dlnTsT@pollux>
 <D9760KMM0PSB.HONQ7MUG8OTN@buenzli.dev>
 <CAL_Jsq+wGopPRcdp6t0h2cu03vrxxP3=msNmpju4nqq9XENmng@mail.gmail.com>
In-Reply-To: <CAL_Jsq+wGopPRcdp6t0h2cu03vrxxP3=msNmpju4nqq9XENmng@mail.gmail.com>

On Tue Apr 15, 2025 at 2:46 PM CEST, Rob Herring wrote:
>
> Adding PropertyGuard changes the API. I don't think it makes sense to
> review the API without it and then again with it.

We could add the PropertyGuard first and introduce the users later.
Then they are in separate patches and the API doesn't change.
