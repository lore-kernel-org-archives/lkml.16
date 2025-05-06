Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27898748D;
	Tue,  6 May 2025 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746568217; cv=none; b=N5Z5URobK9hwx44VnY72QFa4DBZNxTPIKJa0upYHRlw34egDmsZX/IJ0w7Kg+DNvKXvR/0hCgDSjxw7iOb8TRcYaCGLMJhyCWmYxTX48sGdT/u7mj9PUdjQW6OVJ/E9D8D01Sj3o/8UuSUHClTcoCTXciIz81qbQJ+YyCAuz8po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746568217; c=relaxed/simple;
	bh=TdfsfZoo1ufXztfn7xtCOUYQQhVVtnkgDa13wDitYV8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=pFdCnC5NEpd+eovy3mhQXTBAsLihTjIvhQptcuHSFjkog2uVu8bIIAgCp5IP/FoMG68dNcFBOkxwaRA9C6W2WsInNmu8w4xwQ78uHlkvTE2iikoXigNJLKfUhHMJ5830BhmtQPuF5knRAfJ6uaHbg2TVphfeaWZh2tdGmDX5mUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tK3a8iBG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tK3a8iBG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC29C4CEE4;
	Tue,  6 May 2025 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746568216;
	bh=TdfsfZoo1ufXztfn7xtCOUYQQhVVtnkgDa13wDitYV8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tK3a8iBGwc6UVf+IBFXMpMj9D1ggiJUcv3Wk+ldnqrvDbY/fOtM0Iel3eLI8/hO55
	 qBZjGhoC2HVbNDr8EniVvTydUHesQCIfPfJtdS9WXnwkevYrQqfAcuizQde30OlkdA
	 fRGPAjKDOToLA+FwReUH8BqnvIVFOBtzYJHYzKETARuA7ynrTT0MMneB061A1zpMdY
	 HW+aYy9q06Jlv10lS64zQGi0tbgjHWd/0ayS6BbKXTt6RH7ecYoL+Edny4BmO4aW0C
	 V9srNuDl7l2CjQpKJoebKJmXL/HaIipstx+O62PS9J8zCNPtskF1sCjYAdfrXH8QpT
	 86lB6w7Ta8FmA==
Message-ID: <d98756b84635ae189089793ef985658d@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250327125214.82598-1-rf@opensource.cirrus.com>
References: <20250327125214.82598-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] clk: test: Forward-declare struct of_phandle_args in kunit/clk.h
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>, brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com
Date: Tue, 06 May 2025 14:50:14 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Richard Fitzgerald (2025-03-27 05:52:14)
> Add a forward-declare of struct of_phandle_args to prevent the compiler
> warning:
>=20
> ../include/kunit/clk.h:29:63: warning: =E2=80=98struct of_phandle_args=E2=
=80=99 declared
> inside parameter list will not be visible outside of this definition or
> declaration
>    struct clk_hw *(*get)(struct of_phandle_args *clkspec, void *data),
>=20
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---

Applied to clk-next
