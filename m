Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033FC223702;
	Wed,  7 May 2025 07:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604679; cv=none; b=dpVqZVl5nR2eJT2jZy5i2w78umRmXDs57PpuV0ckhWLp6megdBMayjuzA/2M2+lDkhM8h6RybylgebSdH3XFTFFexLMiP1ZTAp41yAtKdLcCm+JJ7V0kSMckHKZsPx/t5UQT4X5FEXHVJSCDllZZfjfuCYZ1FiIe2G+o/QbaaRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604679; c=relaxed/simple;
	bh=Zh1Ax+79urOihrTf+frzyudruYuijX+G+RsUCOtrxR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vF6beFHSyFCU27FQHaGYnAe46H3oJ2DDoIyeklJ4VQvCK23eFBXeH67ssZPmMgsrVgX4Oq0rQbQdaT1vng181hS1lrVnkX00DoIXQwpTEbbTtNSxC0cWfIoxIvDOoFRTmdw2Z4Ck6XKFlNDYbTSHa9XsOjuDGpU3FJ5TKdlAt5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=bp9/PJqD; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="bp9/PJqD"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 31F241F949;
	Wed,  7 May 2025 09:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746604666;
	bh=Zh1Ax+79urOihrTf+frzyudruYuijX+G+RsUCOtrxR4=; h=From:To:Subject;
	b=bp9/PJqDfYkHIwO7r+oExaz/LOmHOCYbtrw7u8McQMGBwBEBzefL8rw1+uhHO9H8V
	 KsxoETq9zRTZIj7jKRr6hFzVI/sXYCGlb7k10JDhkdpcH2ncI31Xu6xqs9NecIamkb
	 5/cPThsxaK3iMWAstY52ZvvSy1waW4gewOfNaXVPYS2cesx7sMNyrtcDMBy/PX8hnc
	 ML6uBtSPxKAgQJWtSZiOZN1p0yFQVhUj1zHkhtaOjCqqkx+ESG56c24rrQ9F8SbtNK
	 b1hc0Gy/NpD2LD1ZjPOUpB/0ttCXco4YCsYsdqLqhgeXj1URNRA5ssUCSUsXTaK8EF
	 uTo1SBb6IAxjg==
Date: Wed, 7 May 2025 09:57:34 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Daniel Schultz <d.schultz@phytec.de>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, robertcnelson@gmail.com,
	francesco.dolcini@toradex.com, upstream@lists.phytec.de,
	w.egorov@phytec.de
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-am625-*: Specify Temperature Grade
Message-ID: <20250507075734.GA10198@francesco-nb>
References: <20250507050847.912756-1-d.schultz@phytec.de>
 <20250507050847.912756-2-d.schultz@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507050847.912756-2-d.schultz@phytec.de>

On Tue, May 06, 2025 at 10:08:45PM -0700, Daniel Schultz wrote:
> Specify the temperature grade in the base device tree to ensure
> correct trip points are applied for each board.

At least for Verdin this is not correct.

Verdin AM62 is available in different variants, the correct
thermal thresholds should be set in firmware/bootloader, see for example
in u-boot, arch/arm/mach-k3/am62x/am625_fdt.c

Francesco

