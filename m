Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6514B1E72;
	Sat, 17 May 2025 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747468926; cv=none; b=W8v5ZTJ/WwtHQSTwYLlY/Hz3s0ZC+mjsj3yV7BZ7pgtXye9j+5aluYYWe2TyfBhdnSr+0cG7iH0M8x3rY4V8YusWk6ei6m3i5tdfeyny+7t7sFxzqzuX32rbHhgGPNBmV8xzx+6BWYkFnZwnuob4VVmbe8V1/Q4UBtNvzBuPXMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747468926; c=relaxed/simple;
	bh=4fe4zt5M3nf4+03roHHDsE3o2TVTyaNtDCOykucCCBQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NcXUNJhfIgFTr5MBrD73ykZFgjdJPOlmvgVIzH3tv62nUJYjluH2BGcEyRbvBT6kYGOUCGOc2vG9DSxOhz67V0ZjgQbEmAYa4SjoYFpCoXBIYWcvOBDEZYOiE63xSvHauuN7xJHF6JgCI6mK6mAkhoH2A+0/inH8SkLOpIV9l6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9Ag9yxF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9Ag9yxF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB7FC4CEE3;
	Sat, 17 May 2025 08:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747468925;
	bh=4fe4zt5M3nf4+03roHHDsE3o2TVTyaNtDCOykucCCBQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=N9Ag9yxFVDODbVGw++1CxHOfQAfOl5YT6+46lq/10LYo5BGuzJsUFgH2u9sCLfFrl
	 5r5Ha+UiqW9jZvbz7JhqyiwV/QqYQtOkRr/dG+d95K9ciJ9yHtV9nMdnw0WQAEImBG
	 tX3AATsoIr/4tx23a0Hh4JsYvNI0vRtWOCp073l+saWk6gpjoLU+nd0snbnyyvHSfQ
	 fRwbw0BvBuSgnK3dlo2mo2hpP691LG96UIfFDEuNunL6R0SbBkh96aAJGX1zrS9dY0
	 xrmW6h/d6GGNDJPejMmfXio+a7yVN0GQ0aZRPvEPuNKmxDnYL9kyW5uXtqlV+5dfZi
	 U7HQtOpJ51owQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 May 2025 10:02:02 +0200
Message-Id: <D9YA18ILM167.1EZ4U8KDI8HZP@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH] docs: fix typo in rust/kernel/str.rs
From: "Benno Lossin" <lossin@kernel.org>
To: "Jihed Chaibi" <jihed.chaibi.dev@gmail.com>,
 <skhan@linuxfoundation.org>, <alex.gaynor@gmail.com>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250517002604.603223-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250517002604.603223-1-jihed.chaibi.dev@gmail.com>

On Sat May 17, 2025 at 2:26 AM CEST, Jihed Chaibi wrote:
> Fixing a minor grammar error ("then" to "than") in rust/kernel/str.rs
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
>
> ---
>  rust/kernel/str.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
