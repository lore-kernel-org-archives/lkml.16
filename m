Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A559220699;
	Fri, 20 Jun 2025 07:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750403891; cv=none; b=p3lvrUji2Gz8N1564x/n/qNTxg8bKQDLg0gPsmpr/8H19Jd+A7i0v9VNbXzuUPzEWomsIrdf1pJHancapfz6840Coma/gdo6imBlj59k2QzWObM51g7slsatLoNmlni9Pv47vKTVfNIJbXCdh+zj2xqc78DqHGh2ojDEc1ummjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750403891; c=relaxed/simple;
	bh=dQhw/2ZjUtTGnRRiatUsj5alDBE97wMYGOJvewqC4Dc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HgSPFabrihSB3b0esRcBbAiibT7QHozfamshAFXkFvz+X6/2Ue3xNhQ68nvQbPavpWUnXX6Xq1YmFWRa79eyPkDFtoc36Mxn8hps3x/wM2PHm/C420bYDz6KywF0SFyk/syUJwImqMjBtxpcaQ4pWp8i/ZAp9TO3OAnxkZyQBGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqpIPb35; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqpIPb35"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A0EC4CEE3;
	Fri, 20 Jun 2025 07:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750403891;
	bh=dQhw/2ZjUtTGnRRiatUsj5alDBE97wMYGOJvewqC4Dc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lqpIPb35GS9N8IGXitS/BCmI57tH8i/Ad8uh9V8uLG1x36cgG3OugU5EteckDg0DV
	 tF4LsqZeUrbJXOhEv9rR3aF5kF/WiG/yKSjcQIio6gwWF35kNlKsNXMp4CDMTg12+N
	 6ZMCqWNznIzyprwjC51kEzvX5Uc9MkPBLvLemJXXzN7T9cVDi58gU8JOb3cVCToXzj
	 pkoRq+SMRTp30lJ7MX1LR03tCL0YYaGHN6xk6BKhhBEeRHIISuPowyvbCXdz1nyTv6
	 cDzaJAvqR2NsW97ft2xGu/F5Eh+avFUDor/xduGw5W2/Kqtx6jBu9JtWWH1YovisiE
	 CBD9TTCGYBLFQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250417-clk-hw-get-helpers-v1-2-7743e509612a@baylibre.com>
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com> <20250417-clk-hw-get-helpers-v1-2-7743e509612a@baylibre.com>
Subject: Re: [PATCH 2/2] clk: tests: add clk_hw_get_dev() and clk_hw_get_of_node() tests
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>
Date: Fri, 20 Jun 2025 00:18:10 -0700
Message-ID: <175040389008.4372.10273534996762441532@lazor>
User-Agent: alot/0.11

Quoting Jerome Brunet (2025-04-17 06:44:23)
> Add kunit test suites clk_hw_get_dev() and clk_hw_get_of_node()
> for clocks registered with clk_hw_register() and of_clk_hw_register()
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-next
