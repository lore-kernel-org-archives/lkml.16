Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5701A83FB
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747762719; cv=none; b=oyrboh/gZOKxs5YN+hFgZ7+FbMJ3UzEAueAITo4k/jjcQNpWmhwspE6EanwZzm3wAt4ndcBx8Hpq3nh8wyofGOTDNlza070bunbvQ9PleQz/8w1C+rEJKCWqgrp4wFmF9LB5hae6yPeCOvXmI3jzVbqXdU6Wa60bPNj+OdCDK2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747762719; c=relaxed/simple;
	bh=VGaDhBtg0n9ra9pI5cqVWokgALf7WrZel6+4231gxXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Leo5b84erLNWUeU8SLDpnG3aNpLJyI3VREZGi+YWUHUoCMCouZ2hwPZZ3CTed4h/M2G7PDIJhZnpyjEU4PI6aAnFE/q9bhtEpWQwu0SQ3YGxnSn7F/edtj9m/pCte2JsXzrbcJwnXOIcY4YG/cQD0+jXIohQALeenvVXAqF8IqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2dFTZpA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2dFTZpA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E04C4CEE9;
	Tue, 20 May 2025 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747762718;
	bh=VGaDhBtg0n9ra9pI5cqVWokgALf7WrZel6+4231gxXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W2dFTZpAcl9M+nfc1r9xaDZCJk8TLn67XmTY8rdFlL6tQ3H6x08/Itbbx3g/eApix
	 Dss9HxHoifsrAihzkzYOEEYsJ7bFueP8jkPDp20DleaNQ0gf5dy2hpkB3ZwCo0bQMS
	 pIe5ScVI19r2WcAY0fYDmxmzoLEvAg1Thy7i1o8rL7MfhB0M1UX+DVys/jR+lZGvwF
	 pQhnTVQtpx9hOzvQlgRlgLk9daRYqmLAP1Jscou9wWSfCATsexWNrPecHuHfaKNWBt
	 5OKdFpE5uZeb7rq7gEROMefo9pyMd/3R7yG31av6Ei3J9yUc+UGQlnfBFqj/6Lj1IL
	 +30Ae3besJmug==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Himanshu
 Chauhan
 <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Xu Lu
 <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v4 1/4] riscv: add SBI SSE extension definitions
In-Reply-To: <20250516152355.560448-2-cleger@rivosinc.com>
References: <20250516152355.560448-1-cleger@rivosinc.com>
 <20250516152355.560448-2-cleger@rivosinc.com>
Date: Tue, 20 May 2025 19:38:35 +0200
Message-ID: <87ldqri3ms.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com> writes:

> Add needed definitions for SBI Supervisor Software Events extension [1].
> This extension enables the SBI to inject events into supervisor software
> much like ARM SDEI.
>
> [1] https://lists.riscv.org/g/tech-prs/message/515
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

After you reviewed the checkpatch output, feel free to add:

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
