Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED150239E99;
	Fri,  9 May 2025 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814140; cv=none; b=pFbc+Nf4cMfH7cL0FoLbGcH91QDPQxd7Z5L1L9N+KQr+Wyrw0G20dRbNU3FOstRc9IrV/IXPoWmJHNGYeecq1GjRD2T/a98thBsyKwd2+HA3BOJRknZ/ddSgH+VpSE8rfKTo1W8jmO4jC/nwueap9C0wweIHdqpnQGVTKixCT7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814140; c=relaxed/simple;
	bh=rmApFCzA/VMmdODpUj4/fzF7DClCCzkmQq4dgE+/N/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltyDSTSABH7L4wfk7ykaluLeXDsMx68LIp4loQQ/y1i+wd8eBvY3MwTPZq3fVDyjohY14sAxC6EJZhMmbXWKcRMO7Wlea/zOMdbFA9HpuVVMLU1yM4Sv6iBEFJmDG1vT0lznbckkwETCrkh+heKEZc+W2DbYEVzkAIcuGclm91A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwKGMDqt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwKGMDqt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D908C4CEEE;
	Fri,  9 May 2025 18:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746814139;
	bh=rmApFCzA/VMmdODpUj4/fzF7DClCCzkmQq4dgE+/N/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NwKGMDqtaxZ4cge6Xjczald7lOTaRMHFoNVHlruiKX4ZWZvpDvSxHtTRtKa1lhkme
	 KSxDcNwtVBJcwSMHzi8/qGrSEQ0HKg582aSZauiN4difEnxvfQ/+a9l62xr3k7Ba+i
	 v0jKJjb234XTQ5vnpnCfTNiS7POSqlanpdF5+8aYNCi8eONxnixUzHxqEvi3Fz3oaT
	 4JlK0/A5Okz80bTAMTNPnabCy5y8n1hi39WTguqTeLBZNDM4ZimvtPQMBqFg5Uef62
	 mUPxqPfrltEgB0pkbYrdALq91uDJrb9sYHTLQZ1BB2U+L1R+wzhwMetjAgRVcbBmqA
	 Mri/IqM4Gz2YQ==
Date: Fri, 9 May 2025 13:08:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 04/13] ASoC: dt-bindings: mt8186-afe-pcm: Allow
 specifying reserved memory region
Message-ID: <174681413699.3876088.12249965431481195226.robh@kernel.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-5-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-5-wenst@chromium.org>


On Thu, 24 Apr 2025 18:24:58 +0800, Chen-Yu Tsai wrote:
> It is desirable to reserve memory for the audio frontend.
> 
> Allow the "memory-region" property, to be used to point to a reserved
> memory region.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

