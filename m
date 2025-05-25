Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDF242056;
	Sun, 25 May 2025 19:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748202545; cv=none; b=gY8nJsz1GEzoQEpTbIh243NOiQ/G8lpbzm6Zrmt80jHtVcWd8V8OVU0G2r2nnLzDffWyjoH3FPvXxBb5aXk1JAMhos/Zn10A061EBffwsje0j//CoVGVt8CgeTImVkD6DuOu24ZDJrXWmJPFYFFvykWQmkrYwc7y45TANBwdEAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748202545; c=relaxed/simple;
	bh=/DmTHaUZs7suL5hcYpA5tSC6x3bDtgo62nAThlCgNSc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ne7eFZk6QsbGyGa6QtEtzSvc2I93k/wN2xhwHfLxEpOO/whSqwZ9NIrsYy8dCqlhKHLukszLzSo6K3dasOH2j3VA5p/5Ci6WKnQS6bbSAz5SK9zVa3b8pL3eX0A5PW8RhTaGm51eTZcafODu0p1fgP4xEPfgnwfnNzdTohctaq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+LzYf5a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+LzYf5a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A7DC4CEEA;
	Sun, 25 May 2025 19:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748202544;
	bh=/DmTHaUZs7suL5hcYpA5tSC6x3bDtgo62nAThlCgNSc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=R+LzYf5awzytA7rRUikz7Ps9M3jZmCpaI/vJoGIziKlaTVyUqIik+Vovvmu/XtVRf
	 iCErTlkne6B3qB9QKMgWBCTQWyZ1g9xWe7LIgfNMolo1P+5wv+gDXYV2ZJr87M1zfM
	 owK6A9GwHb3u4yH+VpZd0Wt6y5ueS9CyehgVKO1LPPyffQf6zA/PMrmcccyGXfZ8t0
	 jegcK1+qxX/CeQitDTdG3H8STVaSfLmNUgvqyrl/fvxtHscmlMmk1WyOECRiamrN1f
	 qRAGnXjdh3FbF/pIHQYXUW9LsU5ORCn0k1wsMlh0wFlYx9192JwGnC1AGOX76XcT7l
	 0/DvxfDRNNA5A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 May 2025 21:48:59 +0200
Message-Id: <DA5I2VR8H6UT.1HI11TBE16MD3@kernel.org>
Subject: Re: [PATCH] rust: list: fix path of `assert_pinned!`
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Xiangfei Ding" <dingxiangfei2009@gmail.com>, <stable@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250525173450.853413-1-lossin@kernel.org>
 <DA5FBED7E1NX.W675V3MKQSMD@kernel.org>
 <CANiq72m_L3YBX-_1yKdknyn1VU9h2fDcTROzTghzA3grz8aT0g@mail.gmail.com>
 <CANiq72=5Qh-9Dp4-+PyNhTWCmknSzLzU1mSC5wFprZ_rbj6Y7Q@mail.gmail.com>
In-Reply-To: <CANiq72=5Qh-9Dp4-+PyNhTWCmknSzLzU1mSC5wFprZ_rbj6Y7Q@mail.gmail.com>

On Sun May 25, 2025 at 8:53 PM CEST, Miguel Ojeda wrote:
> On Sun, May 25, 2025 at 8:51=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> "since it is in a macro <rule that> has no current users"?
>
> i.e. the macro has uses, but not the `tracked_by` rule in particular, rig=
ht?

Oh yeah that's correct.

---
Cheers,
Benno
