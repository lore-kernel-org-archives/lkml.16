Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFC926B0BF;
	Tue, 29 Apr 2025 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745960166; cv=none; b=srW8jYFPb6PMQZVPH10N74oZbgso118GS/z/mhqV7VAJtwJnGULVDZu34qHdYPqe7LmITYa4eRCkRWAQHr9FxBC/TvLhHb+u3PcsDXLHcQ3ZHY6LHRA/Zw6/kfVVE9GZQg/SIMYnyo9CFg7eav87gYZDZGX19nLJjXrFRLAa41Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745960166; c=relaxed/simple;
	bh=Z+5E4pYeRS7hyX8eMeNUqz1ihn83QuyCW7khmFvB6bs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NtUFfXATxNP5hnvIzTqynUytxRfARczFnsisLsdUs1DTIdPywAl8rQIvILK8GM7zEzPqmt67vqP1fBV9+z4X1mJyf6dSnEaI9mLskjlQgKtCN+Jlgdy0hvFZbM24ZXdV8jiYTT06fncFOqL/tAbdVLfPem8D51yYdlhUdmMnA0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IW+Hcqtl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IW+Hcqtl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A7CC4CEE3;
	Tue, 29 Apr 2025 20:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745960165;
	bh=Z+5E4pYeRS7hyX8eMeNUqz1ihn83QuyCW7khmFvB6bs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IW+Hcqtl59JpPsGx8tNlXjWmQ0xINyBpkJMz859eVD0fUROkHrae3NX4PntW2uxzA
	 q3LHkxAHvcu9dNTAoq8yp5eP/o2kgjANVARI5NsCGKVMaUgpFunK0l5MRpkL2uj/Z3
	 jSMSZLEnABl8Nhi3YGaJ4+4BxGrhUtXKj18sY4787pMIV+wGtgdSHjDRVl5NPcjc6e
	 +KXZIuD8PtuD6gkI8S/UB+uf0u0FvhtDh5wI1oQcg9sGtlHp56yDaF5dIJrxplHvzN
	 zN8JTdMyIAh1D/CfYSFI4Iw9hkyACkm4x5de2QPNtFE6KNE02+/QPHimcULeXT1GTR
	 PiYaruyE4lbeg==
Message-ID: <aa67592bda7a30bec19d49414e5732c6@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
Subject: Re: [PATCH v4 0/7] clk: spacemit: add K1 reset support
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, dlan@gentoo.org, heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Alex Elder <elder@riscstar.com>, conor+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com, robh@kernel.org
Date: Tue, 29 Apr 2025 13:56:03 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Alex Elder (2025-04-14 12:17:07)
> This series adds reset controller support for the SpacemiT K1 SoC.

Please put the reset driver in drivers/reset so that it gets proper
review from reset maintainers. To do that, use the auxiliary bus when
the device is both a clk and reset controller.
