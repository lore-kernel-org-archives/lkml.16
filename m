Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617932248AB;
	Tue, 15 Apr 2025 21:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744754186; cv=none; b=MpeHY5yO335gL871qwJG0q4MmEDeeYoqq0kUKqY6YJh81u4VtFPoF5WhrQsnQ6m1nrfIR8KJvU+zMNUptQqihVMdEh8xhlCp9mhgo9DBkB/HHEPH+w+ymqr2m3WCqbzSF1pHcpYpiV7xknGBPFr10PnS3VVSZetazPJT+fXLcYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744754186; c=relaxed/simple;
	bh=Vo/YKkJ/8t7MWgy4qvcqRwSc3jZbe8FFEUN84uQGTQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImoD8KCnTwcEQVTM8t8JQ07INLOD1Wizsv5TGJadEwwem9lKOSp/bqmLNCySlNgdK5k1hUl9oKgy4tkKyDoXpICDO1MUpjhNdLTj3cLXormWn/cCt5aT+Cemd0PEhw0yc2ThDeKR9LQJVJb3h3K3LkWzK3fKXzEYvQZeUweOaDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2IDSzD6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2IDSzD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEFFC4CEE7;
	Tue, 15 Apr 2025 21:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744754186;
	bh=Vo/YKkJ/8t7MWgy4qvcqRwSc3jZbe8FFEUN84uQGTQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2IDSzD6Kl5nwaZoIdLcD6+WF8g5Tmol0Ffd8tTdPEvmDuYHUNBw1OpU5UFDwATzk
	 Zjx4aAYSKftDnaFVDbDnTRyCuBDgZkqDyPWyFXbYLlZ2Uk+NL4NheyqZ1fnMWs3Fwm
	 xV2gmbhNDCKmID211P2qWYsl0MtDHx7ad3WFGp7nHhi+UGv+iK3FdrCr/zxWW27gF+
	 pHWq+2EmLIg42/vj0cTNWCfR4FBqAU/Wwkfec9nhJCXdzmqWgsmMdOTB6q+xqz9QpU
	 SCoLm0bHvqWPtQ0eTzp/xV2zQHyaL5kt1SY9kIvQ3is+C7Ld9dHGoD0kDUlyDv/1MA
	 FLADkDwxK1Afw==
Date: Tue, 15 Apr 2025 16:56:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, wens@csie.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
Message-ID: <174475418391.894498.2952286031502803448.robh@kernel.org>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <20250413134318.66681-2-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413134318.66681-2-jernej.skrabec@gmail.com>


On Sun, 13 Apr 2025 15:42:56 +0200, Jernej Skrabec wrote:
> Orange Pi 3 LTS board is similar to Orange Pi 3, with slightly different
> hardware but mostly same functionality. It has less options than
> original variant. eMMC was optional before, now it's always included.
> 2 GB RAM is now standard, previous variant also has 1 GB RAM version.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

