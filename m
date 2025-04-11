Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76476230D35;
	Fri, 11 Apr 2025 17:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392503; cv=none; b=qK50ue4GpjiXececf16W6hyelz9yGqJrR4vHyJsC3ULACUW6Al8UI2p+oymz65DmU4hbESpWPamtG0A1KLOFARaTV5CrXW+ijDXRIhPnwSCZ4BRwAd8VMtQxlclf0bXQa/rpcio5Vf8wILsHC2aRdGztTwkj1jwAkK02XdsFAv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392503; c=relaxed/simple;
	bh=Zgeijt2L3xmMVOj41zXB5W/Ov2bbKub6fLsjPUsMN/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7vuZtvUtqPvtAKl2MqP4V+dhP1IkTn1MZfzJA2BQQCZg4fBQxjIMlo240ggY5ZUTypRAH6tVzFCVyGXT10cjfEv8L8xSqBIfTnvmegjTpdvdmuJs6zVMGetfmHFAppS4FvYRiX/Ste1Be6g8Gi4+n5pGr2Dqkbd0ZYRS+C8CmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5Obqq35; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5Obqq35"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5CAC4CEE2;
	Fri, 11 Apr 2025 17:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392502;
	bh=Zgeijt2L3xmMVOj41zXB5W/Ov2bbKub6fLsjPUsMN/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5Obqq35/zWhTa5AFgJOeB9pKQWOMMdtyWUJFFbyyhjwHWnqbwSh8qbgfa35tWzil
	 JhaKLuYyFp8Bp2/sOJLTC7mBIO5DzmlbnPXp32LrvEvEATfxtNFhnkgvUynw2IaYRc
	 bWD/fhNC/QXPblXhZTu8vIpUpXlKa6x5qQCXjhUN64LcJXfg77t1K/HR2Bvf5JPkQo
	 Jj9x3xdAM5jm8LhBtTnUEOO9+tzRHRUdEW7SUwrvtRr4Qzl6cQ2nc7yNI+3GJohY8L
	 LTAkz1KcnikoWMVz9PKIBx8vt2ho1qv6umMapE1aaHb/6rmyJTXbJ30n11aRxfaVel
	 O2xcTSliYrbSA==
Date: Fri, 11 Apr 2025 12:28:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	broonie@kernel.org, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org, henryc.chen@mediatek.com,
	krzk+dt@kernel.org, lgirdwood@gmail.com, matthias.bgg@gmail.com
Subject: Re: [PATCH v1 2/5] dt-bindings: regulator: mediatek-dvfsrc: Add
 MT6893 support
Message-ID: <174439250122.3591052.15241487083361117894.robh@kernel.org>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
 <20250410144019.475930-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144019.475930-3-angelogioacchino.delregno@collabora.com>


On Thu, 10 Apr 2025 16:40:16 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC's
> regulators over DVFSRC.
> This SoC uses different values for the vsel, hence it is not
> compatible with the currently supported ones.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

