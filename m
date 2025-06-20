Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5AD1E9B0D;
	Fri, 20 Jun 2025 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750403885; cv=none; b=dfBJVPR9OIZgrXAh10wDkUw3ky+2HKrM4tprcNVw7Y5vIJaFgQmMMGnSscOgp2HNbMbFZxkdXQP6urUKN73FTBZd2apT5ql28bqFhkAstLWSIFvIhTnPYuoNUMt7fiVjDVeULJ5LmzoiY+0TA+ez+LqncWyZVuoXD148uLS3/KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750403885; c=relaxed/simple;
	bh=fDcUt1jlTrQ6VNFYYrz7MON0T25AFTWzCuckqbQWg00=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=sJhRBdHlgL91VgNi3ukmYDUNrfR16k2+2LHONGvKR4UqyViSUVjTqFdPPRs/VXNfSHnID8GvCQRliM49pY3MQZTK6LafFLcgCTGPehbpWBm/HXasY/UIC2HDeM6A4liA84Y73WAZThe/XEEGrjXShYxj1XywQWvxNAgSKL/bJJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzdd0O8e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzdd0O8e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01D9C4CEE3;
	Fri, 20 Jun 2025 07:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750403885;
	bh=fDcUt1jlTrQ6VNFYYrz7MON0T25AFTWzCuckqbQWg00=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pzdd0O8e1wzDKaqJH0XeeIsKtFfMbGYhrp2ziU5NM7cDdYOuy9z0mU/Popdeln6ws
	 DQ7unD91fgbIdvmes0B0FkCwKk3ngy9l/udw4cP+V+19vRINiwFpgBf4ojVUrkCNwJ
	 99JcoUS34BCI2p53OsIjG6HNkc8+UBHyfoRU1tf93VnOTPP21AbxxEhs8V7UtXemrW
	 mHoHaPi6vG1V/+p6G3okGTDSqStVryaKNot6NzXJpVrghnHXrHCpNaFGLv1RsrXR8D
	 UKJ16dvxMpsDEgxqGh1AbkOciG0xJS1XLRVUwcPzfjcuYPEmVIdawBORtTXqa+bRNC
	 xMd9RVQBZN41A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250417-clk-hw-get-helpers-v1-1-7743e509612a@baylibre.com>
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com> <20250417-clk-hw-get-helpers-v1-1-7743e509612a@baylibre.com>
Subject: Re: [PATCH 1/2] clk: add a clk_hw helpers to get the clock device or device_node
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>
Date: Fri, 20 Jun 2025 00:18:04 -0700
Message-ID: <175040388408.4372.15649852030378832697@lazor>
User-Agent: alot/0.11

Quoting Jerome Brunet (2025-04-17 06:44:22)
> Add helpers to get the device or device_node associated with clk_hw.
>=20
> This can be used by clock drivers to access various device related
> functionality such as devres, dev_ prints, etc ...
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-next
