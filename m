Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818161401C;
	Fri, 11 Apr 2025 16:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744387796; cv=none; b=SBtBSC/w2cYTHXfuUIDtghO08sWM/cWEBGysHatwC+S5PN8CgzKVk76+/wTDXiLF52L1N1u8OLVEYoTZFWk6pOg+ZVID8+8wwCjm32zUAN1Fan+pr0fnOO8U1oeM3PgVQlMOQj8TUM0tRqhN06zrDGqeKGwOGO9Q3hudE32GN9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744387796; c=relaxed/simple;
	bh=Lh0eplrsvr1S79YQIrUKkhAALj9GjbocaqWKIedMsHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+WIF1zE0Nvxe/wSt1CIeQkvdc4OEBApfdh5e5KgDGOU3fy8JFL10uHle2G3t4o94ZYuEw1QllL5yttasHh+kmrHPe8S412+Vr2Y5NAnFdHhs5k2uyAsWLGCXUx3YUxIwyWSmHWBYuNYDpg4fExT9/duMuK7bQJ3Fyz8YaGLZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sj3xClT0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sj3xClT0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36B7C4CEE2;
	Fri, 11 Apr 2025 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744387796;
	bh=Lh0eplrsvr1S79YQIrUKkhAALj9GjbocaqWKIedMsHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sj3xClT0RceTjgaqgnOEGmyF4t/+Ewmp9bxnQKApNdjAa7fnnqWHTLF0WdOEtATd1
	 LoP49y34eiiB3YnslZvMO7z7JCRVavkaDVByzVjYAW0B7gbRyqQ40566IUGREX+hCB
	 OupZNG0CjlNPv5p8xd1mSwHNX4wxM+Fg7z9PbnEOmHYTjEpFTEjypRlFf+uLoA3L5G
	 VVJDOoPWYV0cvwbhIwWv9WZkowzqcNBMTiLIGyljBOufu5Sy8u2DK0yWvNuAToQXJG
	 7tjt5Yhx68d/nulSC3mINS4q/mM7LaU7okC53LVo+MX1d1fVLpDEMlDxDY6gewYPPd
	 kfVT2IpFG48tQ==
Date: Fri, 11 Apr 2025 11:09:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: cy_huang@richtek.com
Cc: Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Otto lin <otto_lin@richtek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>, Allen Lin <allen_lin@richtek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 3/4] ASoC: dt-bindings: Add bindings for Richtek
 rt9123p
Message-ID: <174438779424.3324928.12460771479545206809.robh@kernel.org>
References: <cover.1744245663.git.cy_huang@richtek.com>
 <0c80e1c6165fee5e9884d541167eee0a7f676c06.1744245663.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c80e1c6165fee5e9884d541167eee0a7f676c06.1744245663.git.cy_huang@richtek.com>


On Thu, 10 Apr 2025 08:58:12 +0800, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Document the ASoC Richtek rt9123p.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> v2
> - Modify the property name from 'enable-delay' to 'enable-delay-ms' to make the
>   time unit more specific
> ---
>  .../bindings/sound/richtek,rt9123p.yaml       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

