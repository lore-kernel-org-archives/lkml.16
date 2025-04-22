Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546AB2980D1;
	Tue, 22 Apr 2025 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310652; cv=none; b=io1RYjVCrtORgmzQMruykacNz6WCVaRhkkKHMC1v5MOrVExr+/40Agyj4vv2eYJ6PrILLkiDlwG31PO0wbWQOS/rZn0HrjrAV/gzbaj7avlCQ4UYrTChxK9ABx7o4Cnf9+4NAjhepisURJG1tCpnl3jbI2/HiwT+wUcgi09j8vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310652; c=relaxed/simple;
	bh=C5mIRS3dzEcYmKJBNeFhlDprX+NHGThBEEjONwEtQbI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UsGcEDqVTWtGwOJiLtbyi6rknKVePPgUSZwjeSDTjGM9SGBXqeGPlE5UpEsmds/lR61QUV1fyvaZA+nkz9yScn56gcmnJ8lNbQN/k+nsyAm/88EM409i6V3r0P2O+nql6aUUjh4me+5Td6Svq2CaRLW8u0dNoiG7vdSv3L07W0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Ekg6vFnf; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Ekg6vFnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745310648; x=1745569848;
	bh=C5mIRS3dzEcYmKJBNeFhlDprX+NHGThBEEjONwEtQbI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Ekg6vFnfWjsrbFw+hynhxe3C1uT3C6LPep41M/2bou7F6CtOHlxVLpzgjRyCqO2sy
	 mOsZVolPOnYYrmUPBM2uG3JTE7AUFW0cF4XPiC3yWAgxAonJgHVV6foafgGN5tcfN6
	 fl+bltzckzumOoJPsOguoercSsuKlUBG0qNRNamnNRgHqnQHJ/LtpZlvXRMjHPbDv9
	 LNwwwds2qoagmpAQyB+hadpiGhNd4gXc9WZ4HBuwRK6zHlS4l7H7ryurPlL1NsPkiL
	 Sv/dekX+wnBcgiUb5Ec6Rf1wP3gDiEGN00BjHb2EP0w8QCt4/ipN6LRHKmgyuckenb
	 jS3i1YcS0SlgQ==
Date: Tue, 22 Apr 2025 08:30:40 +0000
To: Boqun Feng <boqun.feng@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Alban Kurti <kurti@invicto.ai>, Michael Vetter <jubalh@iodoru.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] rust: pin-init: allow `pub` fields in `derive(Zeroable)`
Message-ID: <D9D0ZHG5ZKGL.30GLJKI6X8TG7@proton.me>
In-Reply-To: <aAchUjDJsukcCgKM@Mac.home>
References: <20250421221728.528089-1-benno.lossin@proton.me> <20250421221728.528089-7-benno.lossin@proton.me> <aAchUjDJsukcCgKM@Mac.home>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: ab7ae93b7534ad356e5f005a162c1e363b38f057
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue Apr 22, 2025 at 6:55 AM CEST, Boqun Feng wrote:
> On Mon, Apr 21, 2025 at 10:18:33PM +0000, Benno Lossin wrote:
>> Add support for parsing `pub`, `pub(crate)` and `pub(super)` to the
>> derive macro `Zeroable`.
>>=20
>> Link: https://github.com/Rust-for-Linux/pin-init/pull/42/commits/e8311e5=
2ca57273e7ed6d099144384971677a0ba
>> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
>
> Kindly request tests/examples for this patch and the following one
> (patch #7) ;-)

If you send a patch, I'll take it :)

---
Cheers,
Benno

