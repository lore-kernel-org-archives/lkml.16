Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3158526FDB5;
	Thu, 22 May 2025 22:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952645; cv=none; b=gG/nBk7WygJeBvVFZczQ9WA+oAIDJtLYYcAnDixEbIdFqBGLu2y2lGppu23AUIFfZShTOGRICtUbmANhMBu6Y4BoFPda19M5X5ICUv9Apaq4IAIcAax9d0AGvHWbiIGJjtt4ymKIve9LRlRe7uvcsfzMpTT61snzI4X95R5tFbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952645; c=relaxed/simple;
	bh=mrLS9ALfBZ8yDjiGlgYJ6hgL8zQmN3FGQBk+6r5tqHU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=m6Mx4ZS2DQE9EUGTnBupU6adSGc2KH0x/QTV9fmNw0boCstwfeNAOzdJbXJzlxb6XKcSXeLf4Z0yXHAWjOAuU4KUA5+16wmbvnYuhzgWV35bsIsSkVF3DE/NAhNtXBPSONqQekX6ymvHapiNb4eQ+pK2weNqE/U6Lz9U3g6vS+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUZb/mZS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUZb/mZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17BBC4CEE4;
	Thu, 22 May 2025 22:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747952645;
	bh=mrLS9ALfBZ8yDjiGlgYJ6hgL8zQmN3FGQBk+6r5tqHU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mUZb/mZS1vNI8UcKuDHETaKYLKR1O3GUUCqJTvBz632A/5rSQzAEk+icjo+Oe+3hk
	 zmx5cWsZwIIpKOk8QqpLWLQAHdOaHa2h9ZKFtE4FT+s35mXokl+ESPtH9w9ze2Ic32
	 SWoNyzDHVSHXTa6lnVuAyMk4AASlnsmyXrBw/dOWXMGx0hVbBMQrt12pErrfDt7gBa
	 Jy8QS0ZT5aQu0awPGxeGuv0cDM3ismcLwzJ++UxW+V18LxIhVWdcjUcJb4KYZOJgOl
	 4mxsb3tzJSKaNduR5wasuYBy1Vec61q7W0SH7HfmkJ5SZF8KzkUpTAoCSKWODIQa4c
	 Dj2fgY6z0IUQQ==
Message-ID: <018214f410632eb3dc6c6bd6ab58cba1@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aBus+Yc7kf/H2HE5@x1>
References: <aBus+Yc7kf/H2HE5@x1>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, Michal Wilczynski <m.wilczynski@samsung.com>
To: Drew Fustini <drew@pdp7.com>
Date: Thu, 22 May 2025 15:24:02 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Drew Fustini (2025-05-07 11:56:57)
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   git@github.com:pdp7/linux.git tags/thead-clk-for-v6.16

I changed this to https://github.com/pdp7/linux.git but please fix it
next time.

>=20
> for you to fetch changes up to 50d4b157fa96bfeb4f383d7dad80f8bdef0d1d2a:
>=20
>   clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC (20=
25-05-07 10:09:28 -0700)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
