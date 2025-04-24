Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC5721A436;
	Thu, 24 Apr 2025 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479628; cv=none; b=ct3SK+VDXLo9Z+A+lcs3imjj5R2DJdCstbaE6DTbSTgtxcl9R5akZPYHzzrdtBr5oIOSTIeNpSHswFVO3M267z/YSNQ3U17gu00mVtgySsa55sJGCOyppTTginKY6mlokllrV910kR9R6XxmqmJ+tM+YWCtmaIxHDZ4FNLvt2E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479628; c=relaxed/simple;
	bh=ljhJbQLJJ86qgaZxYsvXbNm6MCq8nLzlJBcZNJhB7ww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h2LLoSXoXmHYq977vrt1wNqqK+6uE05VGNccNbymSNhJlnWwe2TgqUOytAk1h7MIjdRfIOsyTgG03V9mtJG2lgJuI7RYshhfe9/oMDSVl0rVX53DYgkT7Su0TnxcY/sknWGe3utFJ2itxJ7UuQ/iE9+Xc0ZzvydzyrdwEr94Y2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=czB6Z5Pc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="czB6Z5Pc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745479624;
	bh=ljhJbQLJJ86qgaZxYsvXbNm6MCq8nLzlJBcZNJhB7ww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=czB6Z5PcJq38V/WRS9lzymYte5sDUYePs29i48bee56SfP5Ek4WFa5LlIW/Gk/sko
	 IEEJaERWEUV9xJs0frGN/UEYRleYGtPB/TyY7MFepxu+E/R9JZ2UyOtTIBoE5mcnA9
	 L/PhHPpu7r7WCgsXFV/RFSiCQpo/E+KPYGnWAQLKlLj7xNRon9LUVDV8FhKGFkAqzg
	 QpaZ1pZyrE83Y1qd74GZUuZlhrPCF/8Ynu2n2UEI5yJdTMC45bvs9TiO19F1IEtaC1
	 FT67ui3LtHrEWjRtxbOw/250wWG2uAYXjhWKkTWM6EZ6WF6urvr3F2xAQ8p/vDQ//6
	 enag0pi9tPg2g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BFC217E0808;
	Thu, 24 Apr 2025 09:27:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, yong.mao@mediatek.com, 
 qingliang.li@mediatek.com, andy-ld.lu@mediatek.com, 
 Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20250424013603.32351-1-axe.yang@mediatek.com>
References: <20250424013603.32351-1-axe.yang@mediatek.com>
Subject: Re: [RESEND] arm64: dts: mediatek: mt8186-corsola: make SDIO card
 removable
Message-Id: <174547962408.16683.11392020991480921546.b4-ty@collabora.com>
Date: Thu, 24 Apr 2025 09:27:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 24 Apr 2025 09:34:35 +0800, Axe Yang wrote:
> Under specific conditions, the SDIO function driver needs to
> remove/add SDIO card to perform a reset. Remove the non-removable
> property to support this scenario.
> 
> 

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8186-corsola: make SDIO card removable
      commit: ab394a9785f0339fd6617cd51ca4e2982a82cd87

Cheers,
Angelo


