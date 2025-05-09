Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DD72192F3;
	Fri,  9 May 2025 18:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814158; cv=none; b=AV+XQIRY2ajK6FB/TPLfOb+Ax9glQM9L+rP3UxbHLCAMl8gAEEl1Bzz+aPlXrWYOZ8rKRuMlgkbJ9/e4/HMa/1RNM2rB3dr/hFMxBRHHyXn8aJeHvWQRyxN8UwnFkk0+Tgo3lM9L1eqGoTcvBQqA1y8GW18rSd5HDhdQv3uBOQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814158; c=relaxed/simple;
	bh=cmje0Gqin1UMwYrEQVfW/u3H9mdsF20Jozm64dt9YDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6aIA6sRlO89hRF58QdIuyMlx6MubICa0nXiw4O1mhMDvE0/fVoLNDQKOGbQPZDf/18r2Z7oCVkds0dalkw/DAEd3h5nw0Vu4JylCzsFRf3iXTJafwjqlYBSKputsPo4jvHu/CBeMM0ftQf0mp4rlkT6986ZZCZgge+SMgRoakg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Am4m4k/s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Am4m4k/s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A6BC4CEE4;
	Fri,  9 May 2025 18:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746814157;
	bh=cmje0Gqin1UMwYrEQVfW/u3H9mdsF20Jozm64dt9YDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Am4m4k/s/uSA+9iHikVl3vssi2y3uBjthLsNORupTj8CpJx4R8d2XbA1rdooSBpIH
	 11Q02LEfmtKlE0P5UJUZuype0h1P/jK9rRg8fC7v/1uHiLcvfI2YeZ3rP3rwWHAeNd
	 idg6a26cCvSWHcIVO2eVLYZx29cEickdDmQDWezJaknApzvNAsxme2jtXRqrqL8yQd
	 0c8YsLfr3JMSgQFDSRfIo3Oqj1uUc3crl9PRuuMYaKy9H2eWKx9lZYPKdCcv9E4lGS
	 aSm9HUjEE3I2KYYgjebF9mOV5Od2ULi4ngH200yQT8t1x4qzOMuZVTr0Y+jrHCxFkd
	 4YtENvW0P6COg==
Date: Fri, 9 May 2025 13:09:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 05/13] ASoC: dt-bindings: mt8192-afe-pcm: Allow
 specifying reserved memory region
Message-ID: <174681415530.3876555.5160678199255318947.robh@kernel.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-6-wenst@chromium.org>


On Thu, 24 Apr 2025 18:24:59 +0800, Chen-Yu Tsai wrote:
> It is desirable to reserve memory for the audio frontend.
> 
> Allow the "memory-region" property, to be used to point to a reserved
> memory region.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

