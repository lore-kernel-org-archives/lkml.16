Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9252420D4F6;
	Wed, 23 Apr 2025 10:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745402553; cv=none; b=Iwy9u1Tg+E5d38I4xfbNsIdykyJFMleA5hRQPXB/L3qoHnNQrXssp+bTxDRdyDifUn/UBn+86GhiUzE7r2EFFDX6itCJGzSGzh3FV6FP0aCQse2+gqJ5FPQdlWtdVAjgGFbSd6ryeLYg/yEme3ixVS7yO8/zTEmlyCiiDiGYH3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745402553; c=relaxed/simple;
	bh=ktV0WTPer3asI6aYq9UAR47uR805GI8B92zxNTsMtn0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E/obkVKs8apa6wjgjPU7SGQLL+zfBgtXh869D4EKZ+dReNaan49r0pfR/g6HT2kaO1EA8gXSMP/QWZT+QcqyVnvL1a8ZvwKlWai1VKaM9rdqdvLfJw4nLTcHd4n41fAFeQKTZpKYwffIHoIavGBFDOVE20oYplXOn/WXvtXhIn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G8dgid8o; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G8dgid8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745402549;
	bh=ktV0WTPer3asI6aYq9UAR47uR805GI8B92zxNTsMtn0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G8dgid8oB/Uln65s3r/q+ZfQYLOBCybERkwrw9drzKh6Lel2fcpNt0XucNtrDaEEz
	 xWvAldiHmhVo4DvfvZB76gBu+x6JNL5DrxFYJ6dLC/b4/AmIYZy4B9xj3rV85mLhhy
	 UapOt6TsbWw7mAxwMPGltm84Jorfhj1CV6YIsA4PChAmpCRI3c9MjrqDz4ea+W1N+K
	 ElSLFEAPkLpsDuc1WzJKPw9S96Ogo39Ema2RZ0wNVJPRRsLGgRk8Hft+Aziyg5YGlO
	 eQDmaWCgq6wZBILdOWnCyGCm30c/Ks2g24FRKLlQOtJ6ySwrQQGNcVtDsQrDiQkv0q
	 RKG7ZGY0ovw6w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D4F9817E0702;
	Wed, 23 Apr 2025 12:02:28 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Pin-yen Lin <treapking@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>, 
 Nicolas Boichat <drinkcat@chromium.org>
In-Reply-To: <20250423040354.2847447-1-treapking@chromium.org>
References: <20250423040354.2847447-1-treapking@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: mt8183: Add port node to mt8183.dtsi
Message-Id: <174540254879.65934.8631292816995667484.b4-ty@collabora.com>
Date: Wed, 23 Apr 2025 12:02:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 23 Apr 2025 12:03:39 +0800, Pin-yen Lin wrote:
> Add the port node to fix the binding schema check. Also update
> mt8183-kukui to reference the new port node.
> 
> 

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mt8183: Add port node to mt8183.dtsi
      commit: d15059f7be59f887c1a370037cc2337c2ff2ad56

Cheers,
Angelo


