Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E55718B0F;
	Sat, 21 Jun 2025 22:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750543336; cv=none; b=dmmrvjXqAWbbR+VtF+lTiS1IEmjZLvBhhpqiUvKOpdfGfSvJ1dvzTZeCYVdNC1I6P71dcWuPqYWcn+IApzj7+fQXp2oQ+hoOko4jMvU7wZfxoG6GXjQqrrSxTy+l0F7ONcdfyTmRKBtYRJAE2qkHF7xYTtOU4wTW9hL/5ViN8/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750543336; c=relaxed/simple;
	bh=NCq/juDCvtziWom7lNki6q2dc5bMdd/bHo61zp1H9tA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=iJcXf9tkLSKkpSMoFEcaEfz6mi25k7dq0XMFl5Syfvmq8jxSbbGkOY7H7UyFZnj9PFlaYe0lShlLGjwCVUMbCjsjMoaeEu3kW1E/3S1kuVpLR5CSi/E1S3+lo7Xw/9lgBZsYAUNqquILrmkt5vf+/SNgEhdqA8tek5PH9KEyA8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkPbYw8j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkPbYw8j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5F3C4CEE7;
	Sat, 21 Jun 2025 22:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750543335;
	bh=NCq/juDCvtziWom7lNki6q2dc5bMdd/bHo61zp1H9tA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lkPbYw8jpj54Yd4O9J2KbLskEJtKWd28rL4D9WaG9WyAkZkFzOiWtkskuUhn2hwsU
	 tXvZwWNNtuMl9nG/uvYTVd/yxnEJLMgK3GQc+iccwIf9kJyk4gsmy0f21mox7c5yN3
	 nZVoyCEpUfNoY49YD1DaJD3p+0lVM/+P0KxqXlMDwHhWpgNlkAAcZC6HO1Y/vBm1y2
	 dLQb+w7ZnHCdT+jvqyC8skN+M+rXEE8FpKx0inNUVnCndEPXc/R1TpUtczLTv97iiZ
	 smN+t2SoN77eEg7pnbT/lhzt616KaDinjqCvai+V2XUNY1AK4vWx35cFKBGbH6D0FB
	 cqPPbuguykEvQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
References: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com> <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: Add #reset-cells property for MT8188
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Friday Yang <friday.yang@mediatek.com>, Garmin Chang <garmin.chang@mediatek.com>, Julien Massot <julien.massot@collabora.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, kernel@collabora.com
Date: Sat, 21 Jun 2025 15:02:14 -0700
Message-ID: <175054333472.4372.4818173316901510961@lazor>
User-Agent: alot/0.11

Quoting Julien Massot (2025-05-16 07:12:13)
> The '#reset-cells' property is permitted for some of the MT8188
> clock controllers, but not listed as a valid property.
>=20
> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset f=
or MT8188")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---

Applied to clk-fixes
