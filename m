Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD9C155756;
	Wed,  5 Feb 2025 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765315; cv=none; b=fyk7ooSSHLA40+jSy8Bv+QkcE6lG1dchoCjQvast/e51hvEzyGreRUL9XHQxG3AtdBPKJJah/qU93Uyy1GHbiGo+8oiXVdtkyjwTb1pMfmMFIJm/RL3XlMzsBKQpR/qcp9T0zvrCegCboQSV02YuVclCTDEhV+O7ybnkuHtkYfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765315; c=relaxed/simple;
	bh=z4xLhAFLf/B1L/TVeba89CAK71hycjBQqvUHHn5ZRdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hX+OICOat6Xqe8bQCle04cnRYltffRb9dEnq0U4rLFmmMOwpkVM1aGpLQw4qdd/W0EMxvA3vKC+s9+Jf2xUYrDbwtrUdA31JskNbHDmtGgA8E3ZCQxbuso7gVUpwQMV+wkfSZCK8dVVGhMqZNDDPT/M5K0IjWcSWGY4uA6Y8fEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZkGr9NCR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZkGr9NCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738765312;
	bh=z4xLhAFLf/B1L/TVeba89CAK71hycjBQqvUHHn5ZRdw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZkGr9NCRwiKXGkl2q0INFs3zGNBYED8Zcn8p5X5Hh5aCphcjGV2K14e/S93fZL1Ax
	 mXbZ0jWnnLCOidjAqQ52ku0Bfpl4+kIdCtynjbAInpPhjCbKO8RKmE4E1CrNV/Ierl
	 WNZV7t0Px1T+X0QOIkw+RWwSSIFEHPw/A8XvSNMk4ND90cP+TxQuakyBKYJRi43pR2
	 6ZrGXoM2atJUZOCN7J8+vP9sqrBXRMwprwrvC3UQC8BXZl5gGLUMHSileRtogJCA7g
	 PhTChgWI/hrHcGxWOXTSog3UFGxfCVwjAM6GIxpntrsbGc5UMrVhrCx7bkYQX8jsH4
	 Lx8xmA2qshMtg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 815C617E153A;
	Wed,  5 Feb 2025 15:21:51 +0100 (CET)
Message-ID: <fa193392-0057-4bfa-9674-8d92062d74bd@collabora.com>
Date: Wed, 5 Feb 2025 15:21:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: mt8390-genio-700-evk: Move
 common parts to dtsi
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com>
 <20250115-dts_mt8370-genio-510-v2-3-fc9b01d08834@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250115-dts_mt8370-genio-510-v2-3-fc9b01d08834@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/01/25 11:29, Louis-Alexis Eyraud ha scritto:
> In preparation for introducing the Genio 510 EVK board support, this
> commit splits mt8390-genio-700-evk.dts file in two to create

Again, "this commit". Everyone knows that we're reading a commit, so "this
commit" is obvious.

> mt8390-genio-common.dtsi file, containing common definitions for
> both boards.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
In preparation for introducing support for the Genio 510 EVK, split the
...blahblah.

After fixing the commit description:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
