Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399071AA7BA;
	Thu, 17 Apr 2025 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900904; cv=none; b=rIjsR94erZ4VmORzCJItwGw/23ZxXxESnAr4dtxVjo8KCiRP4Jzk6qdtZvtVtkF0AELJ4L9h6nEF73eGExhOWxRhECTUmzeYuY5jCo/TsQUy31OuQSdh//AoWL4mR9L6jOcs7L4KoX2v1k3n+eRilAI3xPEfJdQnVPvhjnM/Q/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900904; c=relaxed/simple;
	bh=nkD3Ai6sPz5TId+HbEZ4D9DCKviA/qssHMxlH8W2gus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcbcdhFiX7x9K+bP4ze1XIf0o6ZVAO6kkrZSmm0DOrwDpf6Ez8mgZw0nl2MJQzemO1KjRrVXB+IIfMdC+08uuO1A06tgN5Gqnd1AmQexmqFON2MUuWpLvZDLM7Gem/p3r95G3/Umc0Dpwxa8gyo/SbLsw7+K5L7oI4TGPG58mcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=mJ1C4mME; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="mJ1C4mME"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 27BAA48658;
	Thu, 17 Apr 2025 16:41:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744900900;
	bh=nkD3Ai6sPz5TId+HbEZ4D9DCKviA/qssHMxlH8W2gus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJ1C4mMExs/+iMj/0PL47U2PCET7Lrv1LMiNjzWbVOBN49hZ4phcYRRCLj7idVIW1
	 +z6O3QEoGeg5dpfa9orG1FqGULOe7JmiR53JRPKnDnyrfTJS50JRrK1DQwB/lHNGe9
	 BcaZ1qX7mObOJh83jIgXLF/UjUzd57nF2ARQ2Yp1eTNNR4lnBfWHiPGp4p+JT2GOuw
	 JzSrnu28992HH0TH72xQQbF6TO6yWWdvEuvLM33oZ99GT+0k803ZHbrNz5FGXGoytF
	 mkHXsjH1CnifDZpMUT1oVZkST9EmTLnWYXWQsz8m07tHjAjIrEoY7IeCTNHhlGAJpH
	 IGgIIHdC8iK6w==
Date: Thu, 17 Apr 2025 16:41:39 +0200
From: Joerg Roedel <joro@8bytes.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yong.wu@mediatek.com, will@kernel.org, robin.murphy@arm.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 0/2] MediaTek Dimensity 1200 - Add IOMMU support
Message-ID: <aAETI0hrOiQZDKh2@8bytes.org>
References: <20250410144008.475888-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144008.475888-1-angelogioacchino.delregno@collabora.com>

On Thu, Apr 10, 2025 at 04:40:06PM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the IOMMU found in
> the MediaTek Dimensity 1200 (MT6893) SoC.
> 
> AngeloGioacchino Del Regno (2):
>   dt-bindings: iommu: mediatek: Add binding for MT6893 MM IOMMU
>   iommu/mediatek: Add support for Dimensity 1200 MT6893 MM IOMMU
> 
>  .../bindings/iommu/mediatek,iommu.yaml        |   4 +
>  drivers/iommu/mtk_iommu.c                     |  37 ++-
>  .../memory/mediatek,mt6893-memory-port.h      | 288 ++++++++++++++++++
>  3 files changed, 318 insertions(+), 11 deletions(-)
>  create mode 100644 include/dt-bindings/memory/mediatek,mt6893-memory-port.h

Applied, thanks.
