Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7019A2DCBE3;
	Sun,  1 Jun 2025 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748794316; cv=none; b=EGPtVMcdGPgoSOHCXzKfN+yUl6cfqsTfG2o0AXqZjXO1jv2DwORU2zeLi57DsNI0aJr5sf5WL8Ztx6Jm/YP9BMHfs/W9QE/A8uDJ6Cl0yKW1A+2NTCiqjw4qjNOV43AAENSosKotL1MBptjI4TsvGrH8lxKmnngNAjNlC1tYenk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748794316; c=relaxed/simple;
	bh=28jIVc78+jBmX66goiJg2JSDlj3PEqtKaNOILuANC3E=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=D56FoaCknqXRqB1iWYPUo9EROCxWHTW/lJPcUNewmq/Bc2Y+ikJG45xsQN3rEdAouLThRMrJ3y+PW15Wfmn6YpIn1W1p3e0Xz8/3xsTH+AI1gxq9DTQP7eQ739/1BORneO1uxGXf3CNvpUYs1ebQc4i8tGgSugv95LmaIKwAGkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U107z8au; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U107z8au"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF90C4CEE7;
	Sun,  1 Jun 2025 16:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748794316;
	bh=28jIVc78+jBmX66goiJg2JSDlj3PEqtKaNOILuANC3E=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=U107z8auWLxxatiRCKgNL5Mi/FIlkPJ2HLcC6I11W+E8RhZ/UlmXzjWUzHqrtxOFB
	 +DWxx5qHdHWHmSjFGQggbo1RnCw935ljc6kgS5sLV+g75zcTGkM7u1fPIGV8TtkfsB
	 gwTULls33MGbWjaHyMOySGtCUxi8x61NdgXCn6huuHZXndqXRFlp6UlLxZQSDObE2q
	 weoNXqKjgV5BdY/o7rUddYAgJu1i0Q8ccHUz+pIGEKm6brbivpm+zCcZNvfBclzQU2
	 L18UQj4PvuMXEVnVAf8ja4v87Z0/P2gXJ5cz0Z83/QVeKyagRagubofjrBxbw3hSMB
	 xODXLlXsbyIYg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Jun 2025 18:11:51 +0200
Message-Id: <DABBUFXP4O5X.1JG9O6Z2BRAQX@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Vec`
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
 <20250601-borrow_impls-v1-1-e1caeb428db4@nvidia.com>
In-Reply-To: <20250601-borrow_impls-v1-1-e1caeb428db4@nvidia.com>

On Sun Jun 1, 2025 at 5:00 AM CEST, Alexandre Courbot wrote:
> Implement these two common traits, which allow generic types to store
> either an owned value or a reference to it.

I don't understand the second part of the sentence.

> The implementation leverages `as_slice` and `as_mut_slice`.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/alloc/kvec.rs | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

The code itself looks good.

---
Cheers,
Benno

