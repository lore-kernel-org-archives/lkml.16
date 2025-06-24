Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B630E84D;
	Tue, 24 Jun 2025 08:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753254; cv=none; b=qq38nhWAMPIB3wvUsDor/LaWwsxR894IaO6NpPhbEPUqPvu3m4KSvjd7KyEidwUbIqdno+mqn+tl8cCI+eVaHpAEAXqTj2qKeWiYbVJe/7dJknIjSgUCspz22tja2Oq+23zLC1i16KJHbwM6z0v1dVudGwaZpK0lXFKG9lvtet0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753254; c=relaxed/simple;
	bh=MT2ajhY7wBsxVe1u0WpkIwXTE93WmbRHqKzUBLSi+Cc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=g8QpkC3eP3nxJ/0SqkyVZkaQqa12gTJJJbKb262msBu+ZoLMZMEaH1QdeYXEohbd47OTJsk35g4QKjr7X4VUpmxYWzTtyt9RlJF95QonScNC8bs2pbcHU1a05vQ/ZXH3DwTD3CcpRSlX3aeNXgK0XLhymJYJ90+RVxYUaJJeORo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvutBbAf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvutBbAf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CC1C4CEE3;
	Tue, 24 Jun 2025 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750753254;
	bh=MT2ajhY7wBsxVe1u0WpkIwXTE93WmbRHqKzUBLSi+Cc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=lvutBbAfVXmj1ZMHbzOxFilI6BH6zaExqSK5o5j/FEuZtLGxwsaYRltqPRVegyhVM
	 ME/N4uiz9VeS0iNejQTO5huO/BsnLQMQshee4k1gtdsr0Iul6GNhiuXkyQrhkn4u7u
	 6hJqU5Aflh9wt9xc4e5KdszFH4cIq4Qs+g/o8iaccojclIrjyAXYSavsE2b5y95QBF
	 /bdUy8ILbBtLS9Kk42ErF2bG1ta/9Z2+XKyLIGRtLQOypGLuhMDfcdftgXvsqSCW5s
	 YDV5iE68DTJaS/HAwSM5iqACPvWFwZCAp2EtN7AzODZNPoA5G5JsFm6Nr4l+wt7j1y
	 fT/vdxJb//SHA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 10:20:48 +0200
Message-Id: <DAUM8B2ZUMFQ.25R95W7IDAEHM@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <gary@garyguo.net>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
 <longman@redhat.com>, <felipe_life@live.com>, <daniel@sedlak.dev>,
 <bjorn3_gh@protonmail.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
From: "Benno Lossin" <lossin@kernel.org>
To: "Onur" <work@onurozkan.dev>
X-Mailer: aerc 0.20.1
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org> <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org> <aFlpFQ4ivKw81d-y@Mac.home>
 <DAU0ELV91E2Q.35FZOII18W44J@kernel.org> <aFmKsE_nJkaVMv0T@tardis.local>
 <DAUARTYJ118U.YW38OP8TRVO3@kernel.org> <20250624083437.1e50d54c@nimda.home>
In-Reply-To: <20250624083437.1e50d54c@nimda.home>

On Tue Jun 24, 2025 at 7:34 AM CEST, Onur wrote:
> Should we handle this in the initial implementation or leave it for
> follow-up patches after the core abstraction of ww_mutex has landed?

Since you're writing these abstractions specifically for usage in drm, I
think we should look at the intended use-cases there and then decide on
an API.

So maybe Lyude or Dave can chime in :)

If you (or someone else) have another user for this API that needs it
ASAP, then we can think about merging this and improve it later. But if
we don't have a user, then we shouldn't merge it anyways.

---
Cheers,
Benno
