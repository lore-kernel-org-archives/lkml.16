Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A910130E849;
	Thu, 19 Jun 2025 20:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750363365; cv=none; b=n5gLhBRryOmWZyDHNZ/YXwNQSEiMpuTrcCsy69+M4j9r6D9wD8n5s5upVxp5JvHF9Flf3s0YAux1BuOHrKCSlD7CyHds6Baff4f5UN4dCtv1WlHEx5B0aOO2x/jbk8TSONZSKIQWGdWVQELWpruU9xUYRSFTJo3cKEyBKZCUqMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750363365; c=relaxed/simple;
	bh=4QdX6S4x0XEshK7BTOqLCSvid8HDlM1C6Xd+Rr9jdqM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=p+7w7+GNRwk8SyeeJn0qqQXYUIxJBnZolmkVUDX6otzXS7viNvSbSMt4vZabyFNDMRvlBIKh/zihiDvBvYmA66B8bkdNMIksyn7SaShYnMolVY2/6ETSDi2hP6uF7BsmVDaUzOEM5z6UsoMW/nr6wOTlnwj1IVwnztHYM7Avprc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OejIBUyV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OejIBUyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0A9C4CEEA;
	Thu, 19 Jun 2025 20:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750363365;
	bh=4QdX6S4x0XEshK7BTOqLCSvid8HDlM1C6Xd+Rr9jdqM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OejIBUyVWLe5elZSTKm3AFVUlNs+ZdsZEfEx6/BjflIn6/5JovxPbnWR0BSl65Hmo
	 2YX1g4yRPoAESzq/Rio8Yv2osygAjEzy/87XdsqH1VXfL7liKk0cYcliWGNCq6AjKO
	 BA04bwhwkTkKZDiZ78EsxK2kAZ7omDnl6Sze/szUF5HyyH3A0XmgDIqRblr5ZGi+iC
	 68bN1YWNLgkj9vsC+Hi1EOZCTnpcEKeaygmFfDNOnSil+x/LEYeHZ6DkygBB6y0Gdk
	 LsNgDjH+Gzzecsv/nrxLIsXukXEo/KHz4zxHF1cC4On67IhYF9JAOylY8gpiyqrnx6
	 M1Elj8zH/fkgQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250602141937.942091-1-Frank.Li@nxp.com>
References: <20250602141937.942091-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: clock: convert lpc1850-ccu.txt to yaml format
From: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev
To: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Jun 2025 13:02:44 -0700
Message-ID: <175036336439.4372.5290139630877956933@lazor>
User-Agent: alot/0.11

Quoting Frank Li (2025-06-02 07:19:36)
> Convert lpc1850-ccu.txt to yaml format.
>=20
> Additional changes:
> - remove label in examples.
> - remove clock consumer in examples.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Applied to clk-next
