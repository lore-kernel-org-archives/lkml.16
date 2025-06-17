Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C141D136A;
	Tue, 17 Jun 2025 07:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145411; cv=none; b=rdt/MkMgCPCTlnNk5sROxGpQABNzAQuQMhbFDN+6M2+ECWmsy+2lx/ZYVH4XhdwtSZ+bMqps4rem4YhNoehiPSM+WYnWbN3RAge8OwLTXaHxHlUN31UKZ0/fQ8QFdoDIEyrEcyxX98IyLWBt8wC96hBonvDqKiOh6Jk9pPmFC1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145411; c=relaxed/simple;
	bh=BDDZCm5nFDKQHj3QLEh1e4sRE/tvZ86qotheLpogL6c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Qqgo7oTQVehZxrH2Dm8cMFA9uSrByzikvv49jpr0c/77h4brEgBm2GoLlaogqrnUUsnKYSBPozyHQQpmJYHn77aqqpU3Sfzjn21H2Y/IZ7ygEqF/4ich/kxoy0ocFI9qrBANxyNxEvAK3Lc+2sR7XcBHMfO/v4hO1Dw1o9k/7Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=in7r1TxF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="in7r1TxF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CD9C4CEE3;
	Tue, 17 Jun 2025 07:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750145411;
	bh=BDDZCm5nFDKQHj3QLEh1e4sRE/tvZ86qotheLpogL6c=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=in7r1TxFdEJ+VYaRIrBCQVy2oZSZhHav5iplcNi0zzqZrKEpLWtrvT84GQGCDL724
	 7CMCImXFbG0aNATvyp2z3z199NAui2dF7mlYjWNouSVgzPCQNQhU2sre797dtvbjF/
	 cPUCNXio083nKtTPgM5Os8eEngit4IzpFS94KFJIR2xpwBG2Bs7wk48hgnz/09QPb5
	 AGsyScw2hKkJhMtms4D3xQy0PJItMlmoS9pIRJ7BK3w3pcU1dPcHyBNkQq/2H2wfJt
	 3iG3NIXks0+8McUBkzW48S+SLIVjk2Ig8ooaBs0jiCxjXmGjuuFXYKvhiZ8l8OVmIv
	 g6jqyTHP4fGsw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 09:30:08 +0200
Message-Id: <DAOMRPB1PANF.3GPOCH6T8NF80@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rbtree: rust: add RBTree::is_empty
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250616-rbtree-is-empty-v1-1-61f7cfb012e3@google.com>
In-Reply-To: <20250616-rbtree-is-empty-v1-1-61f7cfb012e3@google.com>

On Mon Jun 16, 2025 at 12:36 PM CEST, Alice Ryhl wrote:
> In Rust Binder I need to be able to determine whether a red/black tree
> is empty. Thus, add a method for that operation to replace
>
> 	rbtree.iter().next().is_none()
>
> This is terrible, so add a method for this purpose. We do not add a
> RBTree::len method because computing the number of elements requires
> iterating the entire tree, but checking whether it is empty can be done
> cheaply.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/rbtree.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
