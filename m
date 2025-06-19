Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EEF22154B;
	Thu, 19 Jun 2025 23:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750376972; cv=none; b=N8MTmyYCwn/t6v9DNbeRf4CElczgybWRAsH1ZqBBzWKjdhetAYxFppNZcouY8BcNfKUO/pZnMwjqtV3x4iIEynzWrYp8qP+Hs2R8ltK/Ypaensaxc2Dyy+vrEpVeVcRK+/FoaqspkhdWefA2TquDBD3lmR6H8h6A61pXhax1I5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750376972; c=relaxed/simple;
	bh=5X1Z/D0ZDpNeqSdLDo2cYo/9qvHNG8M6nbnrhxBlvIA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=iY7ONOYzMBAuMMrW7VMqX12T4Fb3sPhj0HtcFIctJ8aR5mFuu8nAOBkIqZJm9CKZ1JDxb/c2qt92WIJ1YaElGwLPzjRfSKcUiZXdZJSzME1G31dAVcpToup45Iuhv9QMOUjhg+x49bYJuPn2i4vtylf2wjjXE1bMiUzfzAwAQKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELSJ+3+6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELSJ+3+6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A660AC4CEEA;
	Thu, 19 Jun 2025 23:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750376971;
	bh=5X1Z/D0ZDpNeqSdLDo2cYo/9qvHNG8M6nbnrhxBlvIA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ELSJ+3+6k7paGwMR3lz+SWhu0a2XlFNzo/5Dk4smXEiVFVVk1iB60JMuQmQUxAFfn
	 ECYMpeN/62LuPnGJBffKxldnohd97ZGBGyqbbcmduYr/bS221p3mNIgRx8i6JUjt7D
	 YiZ+G4seR+DY2G2ySOPQQL8OI8r/GRXL1rTah6uC+IMpGyK2U80lnC7AdQvFxZMF7O
	 e97Wy1zKGM61dlzjcjyUH/xnVb7h1qnSeGjUtIr0EB+YopkrKPVgmMmRWXDpFUriJl
	 qGBCB5YQk7SQZTbnj543hGd0oYcAfvy0GAc/9K3BqOoosRf/UuQ3/Qpu//UDr3CwY0
	 HDSJU5kqlIe6w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250401131341.26800-1-bsdhenrymartin@gmail.com>
References: <20250401131341.26800-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v1] clk: davinci: Add NULL check in davinci_lpsc_clk_register()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Henry Martin <bsdhenrymartin@gmail.com>
To: Henry Martin <bsdhenrymartin@gmail.com>, david@lechnology.com, mturquette@baylibre.com
Date: Thu, 19 Jun 2025 16:49:30 -0700
Message-ID: <175037697096.4372.16715056720786799698@lazor>
User-Agent: alot/0.11

Quoting Henry Martin (2025-04-01 06:13:41)
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> davinci_lpsc_clk_register() does not check for this case, which results
> in a NULL pointer dereference.
>=20
> Add NULL check after devm_kasprintf() to prevent this issue and ensuring
> no resources are left allocated.
>=20
> Fixes: c6ed4d734bc7 ("clk: davinci: New driver for davinci PSC clocks")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---

Applied to clk-next
