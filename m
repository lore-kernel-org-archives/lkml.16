Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ABD182B4;
	Wed, 11 Jun 2025 16:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658646; cv=none; b=aZs5+Pq6wQyfrtqmPHUyL3qzd5SZS/FQ70fdR+8GULVkVMgonGyl+MNLAjozEtKQXoGImVKdsnDCcWopP/Ykm7EZOppF+uG/aHPqVMzA9gM4AnBUQmx7EIbkP+uYC19LCE1PFIg5X5M+iUJQuE18r1hq+O7MVtY6ygVq76McUZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658646; c=relaxed/simple;
	bh=z/vpSmF64EBBpLs9+Nxj4lerMAXaaCZIn0xJoPWM2SI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=XcgHB6OQZGAbaUPfcmJIhNsyD7yVXm9NV6ErMPs4y6rp603IJOyFZY8QohRMKQzetjdguGJaAz61gWRbMFRZQ2MOpiq3ZuUFArQUEjj6tqLmR6gmACebVjFAqRzaxk5wiyZzAPAZaW+eirSeilwa0BpES2CpgnO5oRgvpjNp1uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9k6E7p4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9k6E7p4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5F5C4CEE3;
	Wed, 11 Jun 2025 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658645;
	bh=z/vpSmF64EBBpLs9+Nxj4lerMAXaaCZIn0xJoPWM2SI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=B9k6E7p43I0fVlXO6VjkJq69RUfkgo+wOoHVi52C0WKLKiE02GMQuGxtCZ1IUoawS
	 M9fCZQ+fWJpB/7MJp9nq7hYTzZY/sXwQuLdHp8siYkaDcW5j/Cug/CzPViNlDZH7bK
	 BzAhjkNzpG/XsoUL9seyYyTIYwsFwMXU6xQtuQOPm7EoKqTLfVzHhNTntsBU+V6+9W
	 mfD2kiMsURvQNSebBt0j+d7p3olSOpDCzz5vH4ZqTN+EqQTeOl7bC+wBu4jFl4bOs4
	 k0fDDw76wgmgFB3YhehGwlMYnJnEZ2ypsaT+Y8nCqHlq45cpqaGodewFLutUC2bpc9
	 bORoWUwovrwJQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250516081612.767559-2-sbellary@baylibre.com>
References: <20250516081612.767559-1-sbellary@baylibre.com> <20250516081612.767559-2-sbellary@baylibre.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: ti: Convert autoidle binding to yaml
From: Stephen Boyd <sboyd@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>, Tero Kristo <kristo@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sukrut Bellary <sbellary@baylibre.com>
Date: Wed, 11 Jun 2025 11:17:24 -0500
Message-ID: <174965864472.7717.17541212965175325191@lazor>
User-Agent: alot/0.11

Quoting Sukrut Bellary (2025-05-16 03:16:10)
> Autoidle clock is not an individual clock; it is always a derivate of some
> basic clock like a gate, divider, or fixed-factor. This binding will be
> referred in ti,divider-clock.yaml, and ti,fixed-factor-clock.yaml.
>=20
> As all clocks don't support the autoidle feature e.g.,
> in DRA77xx/AM57xx[1], dpll_abe_x2* and dpll_per_x2 don't have
> autoidle, remove required properties from the binding.
>=20
> Add the creator of the original binding as a maintainer.
>=20
> [1] https://www.ti.com/lit/ug/spruhz6l/spruhz6l.pdf
>=20
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> ---

Applied to clk-next
