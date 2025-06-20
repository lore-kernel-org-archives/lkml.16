Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C017D226CFB;
	Fri, 20 Jun 2025 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750404619; cv=none; b=YYHh9zjgPtQxloaI26GD0GrtrcqVLa0DM/MRK24gzq56mgZ5G7YnZ9D3eB9gsTIdnxbauVTdR7NPyg15D+7xTub4yLUyfzXC1wGhRVb/0knZKzU1Il7Pk027ucDP24L8KN5QEZ+OjuKXoM1bLyGjeCJrmKcB1ygim4rXZQUU2ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750404619; c=relaxed/simple;
	bh=Yrt2TcHzfK/2skWTG9EDpbM90y6BNCwHb5IOESl5biY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Hia1q0rfXqoSw/uqw9icfNfRZK0l8558tJJLFYa++5Al5h+4UGl/lIkBoDhQkBetEBGHOpj+MxaGE2Vh7WriTWhzv3iOdwHOkwyN8b1bRRnM6oOHZMBYvngm2xAKaKuNNsGMHQ0Pmb/Cqwar8yKU07JexS1BrQIJskcysiw/b7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3O7idWY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3O7idWY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E75C4CEE3;
	Fri, 20 Jun 2025 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750404619;
	bh=Yrt2TcHzfK/2skWTG9EDpbM90y6BNCwHb5IOESl5biY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=o3O7idWYy1KTa1StFEsoNrdMP0TQ/iFgHBgKnyX/tlS0NvCRJGqTJ8tmzCjqZNQLx
	 uP92eBGU53f80ol5Psg/nZNkrlb2AO11esIDAsUmQYLShI9FT2XbqyhNFZLYWsWwSG
	 1+kubEV+l7BaT6kVY+tgnLUNDzak3UXNLFtEJYR/a1wvBxxKAubgBgwVV60ldXHrm0
	 Kois7ioMiYmXz30/qqseIfStW7CV6P858v8HsPGMsuQ27tvPXT9QayACdOD4htqp5M
	 cWwfs+7eLD+6n0NZeUxTpy4TEZ0ADDgzANYO8mGlhagx3FSFuOhgV1/KJse5ggW5GS
	 iF6m9y6Mql7IA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250528194453.567324-2-krzysztof.kozlowski@linaro.org>
References: <20250528194453.567324-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: versaclock7: Constify regmap_range_cfg array
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alex Helms <alexander.helms.jy@renesas.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Jun 2025 00:30:18 -0700
Message-ID: <175040461828.4372.15455002701463298980@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2025-05-28 12:44:54)
> Static 'struct regmap_range_cfg' array is not modified so can be changed
> to const for more safety.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
