Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA9D1C862D;
	Wed, 14 May 2025 16:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238701; cv=none; b=MZHDXCAhwzb+4PfUtsK+FDon+gkn5WUJglUyiJpE67TINoya5eqh4xHwPejzLOJTXZoIBM3oYagcpegR0PTw4j6lMOeBEjL3Z4KnK4Di9xYN76ZbPW7o3+70MO2xoL24oVcwKd4NpqrIF4ekjF0NLhYAf/P0y+sr4GMwjVLcqbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238701; c=relaxed/simple;
	bh=RkTxB0ZxzYAlqUbtPbrV4H9RQUd/PeOBalusgwRU4PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Amjy+LaDoHE0rX+TPbR5S8ur+ctXungzP5m2phiOskhuB+ozFBCmyimvoj9nMv+bWPktIfpZdU95KgEMmKa/7PmxYyVlbFIi+TQhBgzTk1K70Iikn6w/gnw9gQjG9ZrJo4Bnj6KT8SHxLP0oK575VF5g586MhBONkX6MEqjyHUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exI/7OTy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exI/7OTy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8E2C4CEE3;
	Wed, 14 May 2025 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238701;
	bh=RkTxB0ZxzYAlqUbtPbrV4H9RQUd/PeOBalusgwRU4PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exI/7OTyHwVQ4yU9GlyrC6Q1hbJTnYs6PYs3JiP+nrVv1++gwisHzaVv0wWvYlHWQ
	 1HN34m8JJorMxTUMDHJN9j3KMw6rKNq2IUv3TSc82Kvx2VpHNERr3y+P5rxWH1v3Wu
	 3LZwkymkIUmoX1rcU5n8bAibpdVfhHSlYj9XKrLA18WSvRa0aMamciKHhp5gqeSfTO
	 /mllHgmeoJhCnFsAw0mnZpupjOIbCBIyNmIKqZMJoawYIVF4s5RP7SUB5Q7PsxSiXU
	 ARKSz7ODHRbZm4TtlpowsV9qUh114yyxhQmXew1KdVJnzKyjl01+hg/g+nAaKcSflF
	 zd+68Zpr2a/Zg==
Date: Wed, 14 May 2025 11:04:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel: Document Renesas
 R61307 based DSI panel
Message-ID: <174723869857.2423571.2570619557941621488.robh@kernel.org>
References: <20250506092718.106088-1-clamor95@gmail.com>
 <20250506092718.106088-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506092718.106088-2-clamor95@gmail.com>


On Tue, 06 May 2025 12:27:15 +0300, Svyatoslav Ryhel wrote:
> R61307 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/panel/renesas,r61307.yaml         | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

