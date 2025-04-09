Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3BD2550CB;
	Wed,  9 Apr 2025 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193882; cv=none; b=AZ676IXAclOv3U2iHMSF1AghpXtFB2mIVVHvWIqYpyVguR1hHhcBoMu6ket8n9JURCTaMJYb2EM6wYAKm7M2kyYHf9HoNs0PM/IGUuwAQItANYxVzfntYMNBOvEsEFbsAJyJzQhR/A+j4dsWy9McecnjMVvbyn3vQwnm9eBdEtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193882; c=relaxed/simple;
	bh=YZ8Vuy/Bdu1plHkalSCMkdI6Kjd0KGZkqN2QecLoloU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wxc0L14Q1vpnOcakFsjFebSAEy260P+f7cO/RbI9SgFxRNZHI5F/N9ISU9UR17JTkA+Er+DYUEtbyrBsjOOvXk5Givj8ApLPWiC60knCIwyUdYukY1BksQ48GlFU7rOmveDM5k+qCC1vWGUFilxeFA28TiNbgCVZ9LJlTgqYzN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irhM08H+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irhM08H+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE91C4CEE3;
	Wed,  9 Apr 2025 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744193881;
	bh=YZ8Vuy/Bdu1plHkalSCMkdI6Kjd0KGZkqN2QecLoloU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=irhM08H+WWs5hAQf9VnIl0jVMNf1qcpUJ2bwZ1Ntgw1VrsA2ODzITQwXj2OTxWPhf
	 9PuUuJZ07XvbJZ1OsZc2r5I9rih4z0A4jRfR4iL5OpKmqHpIoW7vYDMvNYlaus1+hZ
	 4UV1FB8BhmvBcXcV7B4maXbSnN6h+RShFAny4VczjydCAO80NiibEsY1b7wNkRJtY4
	 vbK8x7g1BbDl5PPS276OefEsRZbrDnJzqvU2eMRHvoLioGUlL67NX4lQColO5B4zDX
	 rhMYjy+lRCgOeXLAkc7ckOel5WFxVeg2u55iYLUACtFeRCHMKeZYg2Y6NmX2P813KF
	 QfTojZmaT0VAA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Asahi Lina" <lina@asahilina.net>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 2/5] rust: Rename AlwaysRefCounted to RefCounted
In-Reply-To: <20250325-unique-ref-v9-2-e91618c1de26@pm.me> (Oliver Mangold's
	message of "Tue, 25 Mar 2025 11:57:01 +0000")
References: <20250325-unique-ref-v9-0-e91618c1de26@pm.me>
	<NS6AE7mNgtRfxl85HOWeO3zIH468tz7eUKbw4V3koVm5OyDvyzeBU2dOQxWsmq_sOpeO35v4JqphdwYEjDk4qg==@protonmail.internalid>
	<20250325-unique-ref-v9-2-e91618c1de26@pm.me>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 09 Apr 2025 10:41:46 +0200
Message-ID: <87ikndd8vp.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Oliver Mangold" <oliver.mangold@pm.me> writes:

> AlwaysRefCounted will become a marker trait to indicate that it is allowed
> to obtain an ARef from a `&`, which cannot be allowed for types which are
> also Ownable.

I would suggest using `ARef<T>` and `&T` in the commit message.

v6.15-rc1 includes some more uses of `AlwaysRefCounted` that need to be
converted. Otherwise looks good to me.


Best regards,
Andreas Hindborg


