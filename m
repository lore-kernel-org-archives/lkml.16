Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B343A139E;
	Tue,  6 May 2025 21:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565845; cv=none; b=nu/Cgf55JJtDylwyH0O4Zs3XND3dLjTUeRoUyDOLgCaH2re6OsIfNTt8YQE0lra7dLA5r3oGCfp7IPvjpkD2DrVHJEQ6tI5dbriI8fIorda84sTvugdUOkhXQzzmT833lF3COq9rDg/6W6tmii1FZoU9uh9N2v37OuWGraDVJLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565845; c=relaxed/simple;
	bh=f81Oq/ld8HnX/KmGmPCd3LFlu4ZYfW2HUh9VlkA95kY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=P18RoMzI8dZbcjOoI2oc2xJ3Lluv+AHw9PxtPcLVmQBAwMqcwQ7rKIUOVSVhdSXenImw580sFo/3t1TIINSj/ZRMcIhYAEeXEeROb+RpPXGoFsUz5BdqJPpbETmgpYyvHnLPh6Ub6zomGVNCfYMkzRCadMX8irHw+DQOXgn9nxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpDe0gBr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpDe0gBr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24556C4CEE4;
	Tue,  6 May 2025 21:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746565845;
	bh=f81Oq/ld8HnX/KmGmPCd3LFlu4ZYfW2HUh9VlkA95kY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cpDe0gBrCeBDyg8Z7mQSVUe7W1nRs+p5e6I6ENk1h18s6FtTaHm0xxZMHZCovgoTV
	 mqkRR4ccyZ/+nlxsYOr/C9dFOjEsDTs0ezjZe1SZDApcbPaZPYxoa51cFKPkZkqE6p
	 uZITkPmjGOntMCmR4J0yy0fy5E147uIzmBosmxYn8nHSEPKs75im3/AScG48boC7PU
	 glsCJurzBa9mow5ER+G87yKh/RsjB5TmsooFx1KfDyu1exJClBlOyC63fzbi8Ljmsl
	 CLeCTGEcHOhTHOzoKV4H0s3vLQd6seefhl2eIZ8hJ7QDFYB73n1aw4hQUh/7YBdW23
	 sSwchm81McoAw==
Message-ID: <0ee9dcfbb9244512f6be8e5e4fd6968b@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250505161943.1433081-1-robh@kernel.org>
References: <20250505161943.1433081-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Drop maxim,max77686.txt
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Tue, 06 May 2025 14:10:43 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Rob Herring (Arm) (2025-05-05 09:19:42)
> The clock binding for Maxim MAX77686/MAX77802/MAX77620 is already
> covered by mfd/maxim,max77686.yaml.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
