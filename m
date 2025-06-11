Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A9B157A6C;
	Wed, 11 Jun 2025 16:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658653; cv=none; b=HNGdBBJyiolG/QcsjpGj4miuTEouEqyrmTTXpA57F3F6R3MjnFla5/gNF9DZ2rOVKUuLwzLgkwTBb7N2ZrRpTT7EdA0/+MC5YVw2bDJXPlYZxv59M7goxqj538ZNW7cQqXcpi7REvAi1ybB7AMLOyRqqEO9h07YmqkEeXHTdMVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658653; c=relaxed/simple;
	bh=QetImXL2zSKJs1oIH5F9qJ1LwZNyBvCap54Qx9Zq6jA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=EQAuC/UQ1qUbEIsszO6b41Gw3c5J+S3hsEbxGMksyHJvvjWKS9io8R7APgYVtUCDTxXC1Awk6gavBsjtNXEMQmLrQSmrOmvQu8CitZfBwqLG5i3FODoAzDh7TXppSf0SurpcSvvRPmaEypnWr8N+XoQiyWSVVr3O1LLO/KHxTO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/fJMs4i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/fJMs4i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81664C4CEE3;
	Wed, 11 Jun 2025 16:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658653;
	bh=QetImXL2zSKJs1oIH5F9qJ1LwZNyBvCap54Qx9Zq6jA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=c/fJMs4i8Pss52dYedxqd0aOCWiC7SlM3W/PqLgRFBLCi2qWIBxH4L0/RMz5F6LTW
	 QEnVWl44Jji8dnq4yyv4bEMW4Elh2it6cKQIXgZB7IQuQ8/8uYlIuEo5IejMub9Ou5
	 H3QvnpXHpICkzHakQewqnJ30vyr5cSGKQAZKS7b2S+tdhtjZ5Fcnz7mAP0VqdzkuRb
	 grkcakHhWT4x5m7NYyn8STvOlaYu4PqnKCjibky7HaPrRLMbt1wb56WmLm1FUgw2ET
	 w2I+v/A964xtga9Xvu/1RIlPsMaR2kEOrCYV/g8A24rgK2uZD8EBKbDggK/RFL/rxi
	 XrprGcUazTqhw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250516081612.767559-3-sbellary@baylibre.com>
References: <20250516081612.767559-1-sbellary@baylibre.com> <20250516081612.767559-3-sbellary@baylibre.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: ti: Convert fixed-factor-clock to yaml
From: Stephen Boyd <sboyd@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>, Tero Kristo <kristo@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sukrut Bellary <sbellary@baylibre.com>
Date: Wed, 11 Jun 2025 11:17:32 -0500
Message-ID: <174965865257.7717.9515259020106965915@lazor>
User-Agent: alot/0.11

Quoting Sukrut Bellary (2025-05-16 03:16:11)
> This uses the ti,autoidle.yaml for clock autoidle support. Clean up the e=
xample
> to meet the current standards.
>=20
> Add the creator of the original binding as a maintainer.
>=20
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> ---

Applied to clk-next
