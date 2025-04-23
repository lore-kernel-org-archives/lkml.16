Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73AD269B07;
	Wed, 23 Apr 2025 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421967; cv=none; b=KzANsri3WwELg/3nJU/UCyKsv7y525LD/jU2gl+YGW3UASoQp429K8HEDi17a8/xhlN/wW+fmQ0nwqLnv36t2WWYfPJaAVl694vjoBZoKjZ/KUXsMeE63J34SCGCNWS20IOM9yK3wru3MGLrkF9u9HLQzB7ycFVqXtFIXqwCJyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421967; c=relaxed/simple;
	bh=fdx+A6tYLe/1AVGhBuKzYaJJVZ/VjPsQYhS5cYDFSBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CluJIn+GrplzilyvQU/SsPPvnx4jxbuwGqDi2H35n+ma1evJ8hYXlLnYkjFQqc8T8BEihaRwwDN2d0t0l/qDbnZIKB1A7JMPk+hgLR6j8wwbmEG5n7yXRSNSThqVEiVFZHBhnQAAteVzQNXryVZVfqaBzk8AeNaoxj3ApLGf6bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+PkeQFB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+PkeQFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D06C4CEE2;
	Wed, 23 Apr 2025 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421967;
	bh=fdx+A6tYLe/1AVGhBuKzYaJJVZ/VjPsQYhS5cYDFSBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+PkeQFBD7vF6kEIPZupcaoH+HjYVBpmdseVIlvNCtzLGfPDXsTSnyf8DNJTHuwi7
	 t4Q7rKe9eOx+XYLEGiWcHOZf27W2hCcV2h5HlZeSpduzhIVRLYFkcZl/tit8ezc/pM
	 WpNtKEp5itgJw0hOTU+HPpjCIb5rZ9ViEhzRHyQKf1Bd8fEBp1YSNZipKmqN0nLAd7
	 EBfUgwRogbwjXcv5evv6WgTXbsAlEJ2RngFPZ6teSl85RGEs8JFxVwK9lqChN5zlTe
	 JyAiqAX5dXQFYPMtBJWjjp9P4OzAKnCfxvH559redbajEVnRpHtd96NeCFtiEe1nBd
	 iq0Jv0JbCHdEw==
Date: Wed, 23 Apr 2025 10:26:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: timer: via,vt8500-timer: Convert to YAML
Message-ID: <174542196522.553193.15954115826639529513.robh@kernel.org>
References: <20250418-via_vt8500_timer_binding-v2-1-3c125568f028@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-via_vt8500_timer_binding-v2-1-3c125568f028@gmail.com>


On Fri, 18 Apr 2025 18:33:45 +0400, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia timer
> as YAML schema.
> 
> The IP can generate up to four interrupts from four respective match
> registers, so reflect that in the schema.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Split the series from v1 into separate bindings patches so as not to
> spam all the subsystems with unrelated changes, per Rob's suggestion
> 
> Changes in v2:
> - added description for the four possible interrupts (thanks Rob)
> - added overall description of the IC block
> 
> Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com/
> ---
>  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 -------
>  .../bindings/timer/via,vt8500-timer.yaml           | 51 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  3 files changed, 53 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

