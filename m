Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6772E13AF2;
	Tue, 15 Apr 2025 00:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744676221; cv=none; b=uLe0g5kc4fKPPUJ5pOv2C6H9fpiHBIrlS58P5SAPR0Ft4pTDfBENsVSjn9MqR/X/PoDQh+UbHy04SqmUM/iZX0Cz9CnsUuSGSMuxtEgcJ6J5vkTkduBfJRaO6HjeCqnjPH6nWAOPFuP/aIis6mrglHiq7LOQFC0dz5od43Z5cDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744676221; c=relaxed/simple;
	bh=ugM52EDDN5T4m7r/U5qsyvGrmtbv8uvnFRRVmHC+5uI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NgmfNWr7mkttXDPrxMvOhTQ2x41/Uhg1UHaSn72DWFpDhKj/pH3f71gWyJmDYGA2e77Yd9OTaevsJfledFDN5WTrHQKWc49svEEkE7phq0Madbijj6R2I/G7CXnp0f5nfcsUf9PP/bhZUT6MaMn5M26kazcOXIrguc7TCAP/XdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erkyWkyk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erkyWkyk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EFAC4CEE2;
	Tue, 15 Apr 2025 00:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676220;
	bh=ugM52EDDN5T4m7r/U5qsyvGrmtbv8uvnFRRVmHC+5uI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=erkyWkykhGfY8ZkymHjIOJrKT9DeXyK/jmtUy7UBbpAPRFhvm5nooC/0EHHjqdMsu
	 UlGFRPBf5DC0DRngjM0vWwoMLzaWKHnZR6FqOk1i+KOiVeGr5FzKPHWrKctsZnHH0q
	 aZKK3Tn9HeeEiTAIfT7Nnl8++CJ7cOz3mlvMFyg6GUUjKEM8OnP0b7W2OFd7SwPJet
	 0n8RHeF9qpUWgXCrLz+XXNQuYLwgueMmTvpQGcv6G/3mx7Y+RwjLJ+hmldUbf2rf3W
	 yHxSOGPOcRAZT+qzTuDi6hlOU4Ee4NLizHW+ljw4S/pczBfCDxzvxXKwytjeU0p5Cv
	 ZeO/OeFf4U6yw==
Message-ID: <756e49dfefe4838c5dce4855c1e7ce87@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250409-spmi-v4-1-eb81ecfd1f64@gmail.com>
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com> <20250409-spmi-v4-1-eb81ecfd1f64@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: spmi: Add Apple SPMI controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>, Sven Peter <sven@svenpeter.dev>, fnkl.kernel@gmail.com
Date: Mon, 14 Apr 2025 17:16:58 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Sasha Finkelstein via B4 Relay (2025-04-09 14:52:12)
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>=20
> Add bindings for the SPMI controller present on most Apple SoCs
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Applied to spmi-next
