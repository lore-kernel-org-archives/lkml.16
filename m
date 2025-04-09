Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3961A8F68;
	Wed,  9 Apr 2025 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193886; cv=none; b=RJzgjRzRDIIrHBNHINtSOdNCa4cdetQdKz1XPCczdlJsARO8j0iQuWvgk2shz9JsHXpAF2x0jDNMaXB+aEd+14pH9t+EbSgqlI+WEjV0ZFviuChenDUUr5x47PnTCz0drsdNr1Qzb4KbPgJlgoBQfsKNRFCTx5+VK8Zof+SHWWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193886; c=relaxed/simple;
	bh=W9Ha8ezlLaEReVjMawc8KcMqVPI6tgEDPaGTSBhobjg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PHqa1HVm7XuXAQJoMAOgQ8rPdUUgCfsdV488vdxHq6fm97Pnnz+Y0szPGuZNjHBY8ustN0DDIWcjFTzdJOdrAMFJID9AJQsO8WSNJBHxmJSdhulGI1PQEgwu7RKfieznse4xwE5Q5Xn3BaEqvCZvFhr4vz67MtvHMJXCyQiOzNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DALCqOL3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DALCqOL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77388C4CEE7;
	Wed,  9 Apr 2025 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744193885;
	bh=W9Ha8ezlLaEReVjMawc8KcMqVPI6tgEDPaGTSBhobjg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DALCqOL3GCPsQoxqO/rZwNq/TNN0t2byYUa/cWNHdQsnxMGSfwI/N8B7UFH2HIv81
	 vDmpV6NxrJGqTyAuBHkXtxDvK4mHWGL32NssCbmipdVXw+89dHTF/lpjtoTXq3Grno
	 VyESJ2wbgOtbGHmdXaC808ME9GkGyb5J6171kMPQ6xRdO7Ev/H5Fg45aPxMly/FhF1
	 lZ+RyXvb0b6d1px9NyMYx5vF+Yku24PcRNbcAqH00iELCt+F5CDsjRtnSiU2pkq9vh
	 D0O/jx2Oz0gftTi9yDQz0jUF+qoYnofs/Cv2Nb5LLy9MdbbPeB7Z82oUsy01HzmsUl
	 swa4+xKu21YpQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Asahi Lina" <lina@asahilina.net>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 5/5] rust: Add OwnableRefCounted and
 SimpleOwnableRefCounted
In-Reply-To: <20250325-unique-ref-v9-5-e91618c1de26@pm.me> (Oliver Mangold's
	message of "Tue, 25 Mar 2025 11:57:29 +0000")
References: <20250325-unique-ref-v9-0-e91618c1de26@pm.me>
	<yOhCZ7b6Mf8uxiog8iEuVFsIM30e9U_evXkKMRnN4ymorcOXAG06HppfoipzYe3Odty9-JmlgHVk8GEemBSKZA==@protonmail.internalid>
	<20250325-unique-ref-v9-5-e91618c1de26@pm.me>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 09 Apr 2025 12:17:49 +0200
Message-ID: <87y0w9bpv6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Oliver Mangold" <oliver.mangold@pm.me> writes:

> Types implementing one of these traits can safely convert between an
> ARef<T> and an Owned<T>.
>
> This is useful for types which generally are access through an ARef
> but have methods which can only safely called when the reference is unique,
> like e.g. `block::mq::Request::end_ok()`.

You have a few typos here

  This is useful for types which generally are *accessed* through an ARef
  but have methods which can only *be* safely called when the reference is
  unique, like e.g. `block::mq::Request::end_ok()`.

>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


