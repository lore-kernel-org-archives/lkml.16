Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7AC2472A8;
	Thu, 29 May 2025 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515049; cv=none; b=WOrNmdKP+gK2ydbIr4BkLh15w70bBflvWw1nVGf3UtCJP375TN4gGJMH0QqwryyuokAOJSZ8J7tDHNUn5cSFHY9dJIztp0e/dJ6umIAyAkvrc2Kgexu70kPYU64x97iqqMprCpKMQPHhbDefqzxKElNPQADhRZhAmoJUBkQXoeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515049; c=relaxed/simple;
	bh=QrUi4Kd3yBdZ5IMC4fOaSTdQhWhbS8Ene3hJ/6GZ++A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbYMCi5XRqjDSe2gjWY8vCt9w3sBYsGAycnqUnqo7mNrJv/TsKyIyNOnOQv5ZV0qDHfJeqkqKLw/pbKmZwvhBWSlb2xjznyAbJ5zI4rul1ZBtu5ZILtUjEpsJPRha2jNMeYwr/x2bisOzoqwwe3aWFrT1nU2J56+bUPm28623NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=dzny/4Kt; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="dzny/4Kt"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 766961F91C;
	Thu, 29 May 2025 12:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1748515043;
	bh=3n7o9td/bIF0NiAPn01aDgG1f/ieuz3uc3w/dftQk8I=; h=From:To:Subject;
	b=dzny/4KtJ49L0F+VPryo0Y43RMhAjaJJz5sI2Rau0XXq1Dq7MWqLNDF9ltOoVW6cn
	 SneGkFdUPYReBwiyR6lrp3ljz/kQGkiuTSk9kBkEjEsfRPBMGnYAtBsPVD3O7IVUsB
	 CgKKg3634JSe7B+IT73a2OYiPhVgodM06y/4hCrFlF0ry6WLuO7ae40nBj6yAWL9a8
	 fR5KtUeKChycVITqzq4ZIi/SPXjfkIc83Imn0zqX3wP9IwbRwRyqahvGWHJ+sB/Z/s
	 SwMJ20pDnJDbEt4Xd2ph2K8kgBNlll+33nMmI/PbxcCGnkc4XBpGHOOEfDZqNFN1NB
	 Rsa1r8ii2J4og==
Date: Thu, 29 May 2025 12:37:10 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62p-verdin: Enable pull-ups on
 I2C_3_HDMI
Message-ID: <20250529103710.GA103361@francesco-nb>
References: <20250529102601.452859-1-ghidoliemanuele@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529102601.452859-1-ghidoliemanuele@gmail.com>

On Thu, May 29, 2025 at 12:25:54PM +0200, Emanuele Ghidoli wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Enable internal bias pull-ups on the SoC-side I2C_3_HDMI that do not have
> external pull resistors populated on the SoM. This ensures proper
> default line levels.
> 
> Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

