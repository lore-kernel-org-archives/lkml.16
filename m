Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673CE28A41C;
	Fri, 20 Jun 2025 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422687; cv=none; b=MPY2eGHCrFfAxRzyCNZ1ZfBU2us3l/E4sZhn6n7kZxVjGCe7WFdrnycpxYlyi18l2NI8Y42J58WSQCiAXfcxzMycjY0GGqVEHYrItglwq9pt35u1KgwkmjwN1Cn0hsB+8/5Ie6pZ7Jz2B+Ybe+TPb/GGoOFGH0ZqCNMGFfHV/CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422687; c=relaxed/simple;
	bh=aD43/sOhmsUVweGrvb0kOVvuYKCc6XzsFSDt8n0p6Lc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RBAfRGYTwbKbnLgv3qmpk+QiAcJa5vGbXx8c7vQhDMWLqLEtzGAKAMnY5HNilFsc3UQBus6KR0NMa4IKYEJCWxsGWHsepje+2hqUNe1PDDsuIszSLclcsAAV2eroOEmzietuh1LKwQAiThQ06NaaQlBxQ52vO3KvI7gvIqPSt/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXQHHIbn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXQHHIbn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82017C4CEE3;
	Fri, 20 Jun 2025 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750422686;
	bh=aD43/sOhmsUVweGrvb0kOVvuYKCc6XzsFSDt8n0p6Lc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=NXQHHIbnIGMf2IECcaAYEpTDKBvyrbqaAb2oS5t8pY85PEa8ALOWZbnjVK9rQwChH
	 J7oLZHOEQLr1S2r6M3XA4GTHCczxJ6S9fcfNfrEC2Dxq1GOIFTAyFdOWk0VdAivY11
	 2vhn0uavNoK8kY3kLeaTuQWCDPs8+hW+wsdz5yQqnCEqgBFFf0HWNAdsbMg776n/pq
	 Qnj35G4baCi4+7PrqOielawwW9+GreC2JF2K9ZYDyWOostAJyBwurnzjYGJ1ts4AO7
	 DFB0fd5u6e74uMwbzM2IZEFDBQFJEgo8nfr+kZdFoNjIbIXrNtxAVXTDfivMgPJjLZ
	 /M9GlXMSCwy1w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 14:31:22 +0200
Message-Id: <DARD1ZC0W9QR.3CBLX6RYE65VU@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] poll: rust: allow poll_table ptrs to be null
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Jan Kara" <jack@suse.cz>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Christian Brauner" <brauner@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250620-poll-table-null-v1-1-b3fe92a4fd0d@google.com>
In-Reply-To: <20250620-poll-table-null-v1-1-b3fe92a4fd0d@google.com>

On Fri Jun 20, 2025 at 1:49 PM CEST, Alice Ryhl wrote:
>      ///
>      /// # Safety
>      ///
> -    /// The caller must ensure that for the duration of `'a`, the pointe=
r will point at a valid poll
> -    /// table (as defined in the type invariants).
> -    ///
> -    /// The caller must also ensure that the `poll_table` is only access=
ed via the returned
> -    /// reference for the duration of `'a`.
> -    pub unsafe fn from_ptr<'a>(ptr: *mut bindings::poll_table) -> &'a mu=
t PollTable {

Returning `Option<&'a mut PollTable>` is not an option? I'd like to
avoid wrapping raw pointers...

---
Cheers,
Benno

> -        // SAFETY: The safety requirements guarantee the validity of the=
 dereference, while the
> -        // `PollTable` type being transparent makes the cast ok.
> -        unsafe { &mut *ptr.cast() }
> -    }
