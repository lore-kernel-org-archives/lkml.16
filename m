Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273D21A23BD;
	Thu, 19 Jun 2025 01:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297297; cv=none; b=MZG0zVT+ucWsxZuFveBWSXCGmrXX6vf4fj238uO16a1ZUZG07czlnfq1LGq3RZtafd6J/EO1XlpUSz/OAIySwU6LUrZe1tZ9Mkj7fW1SZLze8Jb+AR+Gxs0saVUypwnAQcKiJzMfMoX3J5370R2h4LiNjGME5PLJrymBveYocUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297297; c=relaxed/simple;
	bh=7YKvNYqt+Twd5T7zjq6afoZqjn+Fa8WapowcXDJ/sfs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TY4dmGM0WKYdyHwcWvyUSvEE7pCSwndssKprM01l0Arp8gdGqdlM3pd+tMuQ7SpF59V/5Ii5Reff45M3/F/knfcNiKU2ti8f9PBMvk4ehilLh/uiRozBAjCUaFhXSL28kJOSvoLCHvy0m5jb5Ajw7SZT+Ehq7ao0+hqwxaqLegA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrdylVj2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrdylVj2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E944DC4CEE7;
	Thu, 19 Jun 2025 01:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297297;
	bh=7YKvNYqt+Twd5T7zjq6afoZqjn+Fa8WapowcXDJ/sfs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UrdylVj2Rhp6r7bbFKo/RdBcf20+eO9t4tHQZB7OP+7NDkCIZNelOvToCMM+Tuj+Z
	 dqHI4PyM1yFivBk9wUqvbXRnlHiUqjpW3DXYoVNCBPMOOEqNLrnlOmPA7hYIkY9hyd
	 JeqkY3GnQ/XdIExRAI8XEyDPrHmnF97qQsUQmVIOxo/qQXL5BztqbT2kBn7t3q8sip
	 KOyHSUB0yrMno5qWydbAi0OvH6HyXX1YkOi3tzVEEyWJB9VUm1YFyMnvhMe3rnY7Ho
	 JRfvAbktq0FWTwDzrKX68MsYQ7Zm5MOoBQDNKWF4yoHH/MsTwkqsz5a0/vXoDcJyop
	 zLM3xPfY3meEg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521211826.77098-1-robh@kernel.org>
References: <20250521211826.77098-1-robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clock: Convert marvell,armada-3700-periph-clock to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:41:35 -0700
Message-ID: <175029729520.4372.8440279253281238540@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-21 14:18:25)
> Convert the Marvell Armada 3700 peripheral clock binding to DT schema
> format. The north bridge is also a "syscon", so add the compatible to
> it.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
