Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6F31F03C9;
	Sat, 14 Jun 2025 19:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749928879; cv=none; b=kKPl3uViruRrZvZ0XAeIM7Fkkd9h5LQ44xnyZMLCDw+yt07wT5byLT5hFCHpsjeghelYbOz9AG9pZJpeO70yO7A38877jPk1foqJL4xOp+T5PYKbsixvxkpZW78TOUNr5VbboPDMpsz+tqZdHqvqeLwI+48Eh4dGj1Mj9gXq/II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749928879; c=relaxed/simple;
	bh=KAYl0hucEHos7xlm1aoCd/eBrRHAi4sK/xMgSIA/VUM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RQQU8ODkDHowdGw7JE/k6rj109AoLeOoB4fCXh6gtnPwLKZ5qAK0CAo+FPtCUMl9LIoeY2nydtvzjIsgPVeAWCmd13RBPcYvt1xSN5bHS4dazdTZyFcV0OJqwZALz3/lGdaP7cDBG34lM9nWqzu7wjobB1yKwvV4Ivq/yPatBMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRq180Af; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRq180Af"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9F9C4CEEB;
	Sat, 14 Jun 2025 19:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749928877;
	bh=KAYl0hucEHos7xlm1aoCd/eBrRHAi4sK/xMgSIA/VUM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=cRq180AfdV6q5potyHwkSG3vqZ2jMeqA3N8B5PEkur/P5uYCG2GdPTcemMJgE/Hxo
	 y0GI1Q0cbRbGWZvQmaNGfd0Y1i0K8SWHHC3A+MiS2Y0Gi2Z5D5Os5nKa/s5EBh6Z01
	 uRavTHJ/zw26AXF7HCIViUmHAgujzysfsmXKeRcmSclE3+vl6tvCZKtrSLmUROrAs3
	 hjhadvfpMoSRhcF2g6Wp89dExZYn855+aYny777zVZEzFCe+H8pXqjwQ2BY/VUWNz3
	 mkZ4EuRnNKhlGGWKoiGJcTfXGAS8cokPuYNZHCsTXQTbLP2PFHxONCIHIgN3TcQypB
	 sXB9bwfUaa1Bg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 21:21:13 +0200
Message-Id: <DAMI0IICAMTG.1HWNXJ1PUSHXV@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] rust: str: implement `Borrow` and `BorrowMut`
 for `CString`
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
 <20250613-borrow_impls-v2-4-6120e1958199@nvidia.com>
In-Reply-To: <20250613-borrow_impls-v2-4-6120e1958199@nvidia.com>

On Fri Jun 13, 2025 at 3:46 PM CEST, Alexandre Courbot wrote:
> Implement `Borrow<CStr>` and `BorrowMut<CStr>` for `CString`. This
> allows `CString` to be used in generic APIs asking for types
> implementing those traits. `&CStr` and `&mut CStr` also implement those
> traits allowing users to use either owned or borrowed values.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

With the doc comments fixed as detailed in the other thread:

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/str.rs | 49 ++++++++++++++++++++++++++++++++++++++++++++++++=
+
>  1 file changed, 49 insertions(+)
