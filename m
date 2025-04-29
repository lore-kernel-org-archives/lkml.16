Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83CE253B71;
	Tue, 29 Apr 2025 21:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745960787; cv=none; b=JcnXwuteb0waMdoM6B8Y+kSt4voFU17/H4WiaBiqhTl8iFoNW4kEJpaNLcmqzSIEt/tEqk5JnkWTiF1eq9wbu165yfrPvCoJ0WwM1CQTugboiPSztk+4TO9NO02+kAJPzyWwdthAsUoKqyKWq9EsY/NOtEH3IzE8pIQuq4hX/kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745960787; c=relaxed/simple;
	bh=Sy3N7rJ5RiZ35a/nbX7TVI03BJyyFekD1LmyBdUtxTg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=TBBYXRxBAwQrxmsbO29Itj+aj/X67IJPgMUs+fC8L3E8pSM1eR5QpNRlhwb690lARiAIIscfNSX/wDEnEGPnA9Vbj1V9SEDdXE9BK+iZy3ECKvQGFq1frjElgAAXl8omSnn4F+hGDeKqyvy0sDqV5rwyiQdDSMJeMZFaylUAJk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVs2MfUP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVs2MfUP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F650C4CEE3;
	Tue, 29 Apr 2025 21:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745960786;
	bh=Sy3N7rJ5RiZ35a/nbX7TVI03BJyyFekD1LmyBdUtxTg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nVs2MfUPOk0119jEuPto1ezBodHSocya//MhbXIAvrhLx742ZUTpret+TAWzAklFg
	 gluYYlXFkOetWe/vQTAwEmaLf5bXos0FxC1XqnGcHq9by0RnJWMQPwXUgl3oQEEYMw
	 pigTWeYOE/kUCOCA5W0m4sSSJbNvajg6pIEg10R16deiRgdAB4K3OJkSzEeO4QU0lz
	 rXkagZ2qI9SVfp90L2V05DEORkJhZcDCVDM/C5sFoVnbRfS5hm6A++frX5kECczlv1
	 oO93WLZpPE5RrJ7hggfQy4Sqv5KFYG+qnoBve3Mtx0Elp9hZK3DjooQDqjMPhFdeq4
	 vcLygE6kEZddw==
Message-ID: <a0863522af2f00e91c781cc1d7da6d0b@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250411212339.3273202-1-Frank.Li@nxp.com>
References: <20250411212339.3273202-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: clock: convert vf610-clock.txt to yaml format
From: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev
To: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 29 Apr 2025 14:06:23 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Frank Li (2025-04-11 14:23:38)
> Convert vf610-clock.txt to yaml format.
>=20
> Additional changes:
> - swap audio_ext and enet_ext to match existed dts order
> - remove clock consumer in example
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Applied to clk-next
