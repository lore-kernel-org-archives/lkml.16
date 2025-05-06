Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F6521D3DF;
	Tue,  6 May 2025 21:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746567738; cv=none; b=U9DUKPNkXAdKCqlXbHrwdOiNxeX+RlKwkhybEfqYcTAhtvYjaKKHTa9G/7odFWjd+fGuzRFAiUrpjzZpjF2MuyRWiSOw5Ea1/GKJ81cr27UNYJ60r30b+XBWRuUcEDOvDjhoiQxBmfAfkfLc8wr6jAsuKyEKZY48QFdUbE1Y6+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746567738; c=relaxed/simple;
	bh=l6RYs86PJokxxvprMkqJYSIOrLFEEYltj79aVKHMFEM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=RiJ2DKFgz2YEvwQxOh601DNAiHpe6MWdPiLyykuvGb3xuSO/Boyi8qarXCzL2rrv0hiDsqVs8In0ZWpf8ZYKY24mkLhZMPyJm25W45+ew+g8L9niWm0hIloqSTJ7T94Gr3kvhifg9v7zhXfhRpdsFcKlI2Qcev9ZaAPu8rWiA3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPbQV2TE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPbQV2TE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4442DC4CEE4;
	Tue,  6 May 2025 21:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567736;
	bh=l6RYs86PJokxxvprMkqJYSIOrLFEEYltj79aVKHMFEM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JPbQV2TE9JMYlynQW3LOl2v8DFHIk++D8qK85nKqdbjKkrAwZlGLXd1xA5HD9t6Uz
	 f8Z8dszsKIzo/VFoHAHM8orxJT2AkLjDXsQGpV3sGHp8LusAJx8SePLf7LwEAqovsY
	 Sczjp2MC3lK7Yect2AAjyaQqJ06QgXLJ1+YQvKdJGpB2egQSW8VBTbVlCBcH+xdcaX
	 vR/0Ch6TOEKRgu3UhcJ3FhEYUWVBSmXsXrk2ujxKh0kFlafyNTaJt8sZbkLik9IeOk
	 i9ZdvAdwRqgXVL4LeOJAJ186P9DivLu4cgJ5gfAlmfGw1FU4cEP9HlvaHpuVjgE0rd
	 ms5vg8nHsq+3A==
Message-ID: <59c3c160b99f2cfce17d644534591952@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250402020513.42628-1-bsdhenrymartin@gmail.com>
References: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com> <20250402020513.42628-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v2] clk: bcm: rpi: Add NULL check in raspberrypi_clk_register()
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, popcornmix@gmail.com, mripard@kernel.org, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, nathan@kernel.org, Henry Martin <bsdhenrymartin@gmail.com>
To: Henry Martin <bsdhenrymartin@gmail.com>, dave.stevenson@raspberrypi.com
Date: Tue, 06 May 2025 14:42:14 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Henry Martin (2025-04-01 19:05:13)
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> raspberrypi_clk_register() does not check for this case, which results
> in a NULL pointer dereference.
>=20
> Add NULL check after devm_kasprintf() to prevent this issue.
>=20
> Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to clk-next
