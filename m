Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6715725DD18
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734249; cv=none; b=ogQrMiydmHiTDpfaxNeAvb8HQZ7kD/bhuXuS9SXKbc5Eoe3nxoMAZi1m5KiKOyWprO85DzpjC3v8q0aazdQsWOMA+ij1vy49st3i2hjhlrAFwsw89s1/gWhTIPqErybo4c5fXr6ZCTUJr0NNSdqI0Y2ITC6TB95o3c+tgd6ADw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734249; c=relaxed/simple;
	bh=81YVmuYmtevEfhX9x4J6/zHe3QClnYVcSg/NVZegBSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UEYjrwn7lO0FnTCEBgOkwTIO+i4xrRCl/S1g9S4OovECmKO0IAHrMIQFab9DKtfvy4TnqWPVqReOtkkdDHxd+BLiqAxIvOmKrlaV9Qm6ip6TrQBuiTPkwTrPPHdzD5JGhGFS/ouF6itBUyQZGStAVuk5V/C7Jxm2WbvDqDTBgJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QBUiKiZw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QBUiKiZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747734245;
	bh=81YVmuYmtevEfhX9x4J6/zHe3QClnYVcSg/NVZegBSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QBUiKiZwaqEouo9eYJQ6b9MM0XPCBI2jnnCyimGiAG8Ulr6txqDgdAnGxC89n/ke6
	 LjiWvj4MUFLUHnenR3Ot+o7YevHG/HAcPXNs4PqXLw+Nq6w2X34NxJ1Fr8uKnIOHcg
	 gvZF/8Ma+GR1k92PS6d4UBI3fxMv1HFytDIfM4SuVopS2VS61oEUb0vseqY+dvu0BL
	 vEYCuoyzb1iSqUxVKPWIV7knIxEG5uPsVuEnszDKj2qqhxZX0e64FUZTe+8+T1VTVq
	 IHA1buGl4nlqICet1BMStUrFoHZAG1o1DzdUi5cFzQCK+L9u/mndtZX7BF44Tkh3zc
	 FH8J8SOWKxT1w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CFB4A17E0FE5;
	Tue, 20 May 2025 11:44:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250513-genio-defconfig-v1-1-c3862f91b6b2@collabora.com>
References: <20250513-genio-defconfig-v1-1-c3862f91b6b2@collabora.com>
Subject: Re: [PATCH] arm64: defconfig: Enable configs for MediaTek Genio
 EVK boards
Message-Id: <174773424476.2901578.7109647684484482687.b4-ty@collabora.com>
Date: Tue, 20 May 2025 11:44:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

On Tue, 13 May 2025 16:59:41 -0400, Nícolas F. R. A. Prado wrote:
> Enable the missing configs to get all devices on the MediaTek Genio
> 1200, 700, 510 and 350 EVK boards probing, as indicated by the DT
> kselftest.
> 
> This includes support for:
> 
> Genio 1200/700/510/350:
> * MT6359/MT6357 PMICs Auxiliary ADC
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: defconfig: Enable configs for MediaTek Genio EVK boards
      (no commit info)

Cheers,
Angelo


