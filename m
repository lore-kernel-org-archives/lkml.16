Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539FCCA52
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478917; cv=none; b=AG4+D9/00uMMy5p7yyEqWZYeZPunalca6Cvjhx7x8iG/D0xqbw1pmgSVPMt+Sp4hMY7WvGQ3ekcNp84XoF/ag79VH10u819td9YI2uo8eaGJDSmOsweT61og/zlNLOOcRPqBuNRn8IgU8vgcUJ9rhYr/E6UwBGnZd0qYFfVInCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478917; c=relaxed/simple;
	bh=AbS9ukRr1Y1WjpI6BQAZO1j2qZxnAqa4Rj58ioDrX54=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NgVF4Yh+ZaqgB6wY1Fhu9peqGq/dJ/ATxJBMQBc/fziQV9q78gWpxueAPF5XUyxjQWAmauJYmI65IAKFm1SqwNAAiT+M2rJZALDOBW+F5rpWgsp08Qf2VQ6GPeHfcLXblB/TiszlG6hRfsPt658GntZ+FCmzFOKTpgaAiVi/agI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pWGZTyGr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pWGZTyGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745478913;
	bh=AbS9ukRr1Y1WjpI6BQAZO1j2qZxnAqa4Rj58ioDrX54=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pWGZTyGr/irwCzO6PHNxjv4mkiEiy0/qTjycZupYeiSqejKOccZCdioECqeb2Ybn2
	 7Abui4BbAADex/I99VKmzpEsBCRkSIT+4O2IeVzVYFhF63P6z220chDm0UG5X1EFY6
	 wahJBLPDjCxFW3dPEBp532jJrqfQto21d33e6CzTjUZDGQUGbiG3v+pLzI/W8MAKkk
	 HVxEHgBJlO9VxAyd1OryexbSGPmC92KqJKusSvTGQQOM9+usbrX2GJ01j0z4wOR/HA
	 D/7StkY/bUfgsCwsInZmwRoIy8UF8bfew/n+RAgK+4j6iuWzviZDY6pik3d8fm1qJZ
	 qQn6mv3iM8RLg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E13C717E065E;
	Thu, 24 Apr 2025 09:15:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Georgi Djakov <djakov@kerenl.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250423162958.2223689-1-arnd@kernel.org>
References: <20250423162958.2223689-1-arnd@kernel.org>
Subject: Re: [PATCH] soc: mediatek: mtk-dvfsrc: remove an unused variable
Message-Id: <174547891282.13811.10784757411900262854.b4-ty@collabora.com>
Date: Thu, 24 Apr 2025 09:15:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 23 Apr 2025 18:29:52 +0200, Arnd Bergmann wrote:
> This structure was left unused by a previous patch:
> 
> drivers/soc/mediatek/mtk-dvfsrc.c:542:43: error: unused variable 'dvfsrc_bw_constr_mt8195' [-Werror,-Wunused-const-variable]
> 
> 

Applied to v6.15-next/soc, thanks!

[1/1] soc: mediatek: mtk-dvfsrc: remove an unused variable
      commit: 69d63d19eda7792052f5f694f154898fc00d60ae

Cheers,
Angelo


