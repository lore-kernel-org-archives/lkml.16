Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B77F23BCF2;
	Fri,  9 May 2025 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814131; cv=none; b=j5SeADjIoVXBVnPkgk3dtCElxC6A+OlifmtnHhQ/14rru5MqgPfrzr67EbfQ3YR2cR5TPtQzKwbOaJv36U8PcXT1kLMdjQw7OUu1DlOK6DNsDGfFV/bl7pojIgiqsV2IhNPHKbmONQrl9niZT95bTyfSqrzrEHZuhzNCpDsS0MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814131; c=relaxed/simple;
	bh=pMapIl7fyKZCEmOFy48K78SJeKImJHx0SaMo77sU6qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stUeZPcK1kdM5GjVa0PwlUrqpmm5W2OFiZM56B/BRmBEDubwrbvCj2nETZDmP/TMXnCJCJGFIw8jtvT/iDaqdQvuQuhNXRBPr3kCfsrMQDU1UYeOi0FBnreuRUdw+QvPtXFqDHvqoeKY9U3NWWg8hNoZjfYqCN8Oqcw4cZ9zD4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXCtVqX5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXCtVqX5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1875C4CEE4;
	Fri,  9 May 2025 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746814131;
	bh=pMapIl7fyKZCEmOFy48K78SJeKImJHx0SaMo77sU6qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXCtVqX5LZO8X6YmLwmFZZl4CpQw3KLsJR8dUo7wr5hesGyyRh9yFelKyutWIE97O
	 M+6a6dAtO7KQynPTDZRE0mzhrN70P+e6JcLFHxxl8JTONqLbw47BXR7rHDVP8Zh+pz
	 BuZA0nhji9xGc1bIZ1CPdc9bOOcdqOgoOq9pZ4YmHK6JYxB4R3YHaj89iwIqw5K3Zh
	 Alc6NNLx56jaOI/Iuvax/C1uluhQQobo3InDz2XinFSa9VK47KuFw9IID8WPP2BWG9
	 UAN91JlIr7djQpl6kYiWGB2cy8Qm+5OhQaZxMpcgxd/fjmOeFBsNKTVs1o3GNKuud3
	 Y6Jb/KGOADtKw==
Date: Fri, 9 May 2025 13:08:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 03/13] ASoC: dt-bindings: mt8173-afe-pcm: Allow
 specifying reserved memory region
Message-ID: <174681412863.3875813.695297684123812813.robh@kernel.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-4-wenst@chromium.org>


On Thu, 24 Apr 2025 18:24:57 +0800, Chen-Yu Tsai wrote:
> It is desirable to reserve memory for the audio frontend.
> 
> Allow the "memory-region" property, to be used to point to a reserved
> memory region.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

