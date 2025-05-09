Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F923BCF2;
	Fri,  9 May 2025 18:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814122; cv=none; b=CWXjjp9a1y1+ZVGvYAFawYYZAUMcvuFLRmUgctTf83+p+SNfj0hz8WBKNTSQaEowlLxG1Xl22SziA85fTc8mVB7Nahj1g7aJfw8nSx9tTNpoRIHdLUZaHmU1kBA74kv3EV1SdG6CWkofkFkJHV4TLWOibxO/vLYpitC7ddwg2gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814122; c=relaxed/simple;
	bh=rXNl2rI5xNfuI6HXSc8aN98KAhrpbaveoKmawlIRVyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDlkCi2qiujCAhJJQXgh9rRLQb4HEOgRhuC8WCnc8OA/DSEDmkbOgQLZfzSPxeWDQR20+0ycn4sAvLXiJ8zWACnY2bmcVcC4xUvpDQiMoDiDYSAVG1TEE9G+e4OKZ71eKWthtL6W0SrJUsEwWG5H0uhwdo3NPHxoqWshsOfgODA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ko/IlS0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ko/IlS0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE1DC4CEE4;
	Fri,  9 May 2025 18:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746814121;
	bh=rXNl2rI5xNfuI6HXSc8aN98KAhrpbaveoKmawlIRVyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ko/IlS0xVBWOVfriGT0Pql7adrijlFjG8e48sTg7SAPaRyv6XakFDDmqZEQYdBbY5
	 45TDKKg7uh0xbO21j59MzKivdrREtpjXOpEhQ6rkqp0cJ8BA+U4nay9yv1zNe3hHet
	 YfARupwBzvdjsDJkuSZgnGaFQ1rj4SX+XKdWs2ZP92RU/9+NVMJoYwRndpTw6bjuuT
	 MFvFnR8xeBJZKe+rDZDspmx6qqKfMLPxm3UD/BdIx2Rs6eJ2wM1NuxcxIS9xTYN/JG
	 Gbb8TgWjs2w1mUL5LPD9I8oQ4hRKGIbaKI5qDqi66yW3DtDcTt5A6R7mFeOyrOQY4k
	 gMAQjB/QF9SEg==
Date: Fri, 9 May 2025 13:08:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 02/13] ASoC: dt-bindings: mt8173-afe-pcm: Add power
 domain
Message-ID: <174681411907.3875523.1397658621992836226.robh@kernel.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-3-wenst@chromium.org>


On Thu, 24 Apr 2025 18:24:56 +0800, Chen-Yu Tsai wrote:
> The audio subsystem sits under a controllable power domain.
> 
> Add it to the binding.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

