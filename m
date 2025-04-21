Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A0314EC46;
	Mon, 21 Apr 2025 18:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261139; cv=none; b=TkPUYYmwvsz/cxBqU4zm28Wt8hCaNzfvQ6kBadiLaRDH796qtqAKeLpzlgKq3jF+S3Bg2KnfD7dlBKGGa6hiksT7/zN3RFcwxSBSlgVDPlv1tsDFyaP8hGhU5XFHNbJUP/gGHM8Pw/vGRx9z4MVrzaWXPIR3KtrqLRp+gdoGGmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261139; c=relaxed/simple;
	bh=dCkTnUBLg+0/XJ/SASAZxMykW2757Adc+Od7Um/fspQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOy45NXzaTYSnrBU7ur4umRMFZkEmR4rxB2969sSuo6iWSZBLpHq3ICq2bmvJCNbZ5CEEuvTOrNFPn7K+JBfzIsMIOGF+yENfDP5MjPdyWZ2zbPjeVknF0VzQnYnQFXhEYJF/wrTON8lIZ2II9+8TAoE8FZH7c5ahAXSUb3XgMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LK5uJYgZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LK5uJYgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB978C4CEE4;
	Mon, 21 Apr 2025 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261138;
	bh=dCkTnUBLg+0/XJ/SASAZxMykW2757Adc+Od7Um/fspQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LK5uJYgZ/J/VPCthMipXYAI6HtkiqJ/uBDr9yBG7zqiyOrcP0y2gVi2Am2Nlj0cTn
	 O4cZXCACC/we0XjQZSjbBQMx7QlVoTtyBn9REKSF6Clke7/MQA70il94yDnyfplhPk
	 Gg3ODUTL6n9ZMjhcH6eixVwrG6IKzQz7BCbaCsexD6nHSE/2h+3Qz2x7eBtO8+7EYW
	 Wf36jfsHzmNKLx17OH3TK81UtOAQoq3BYf6rXQ1s3AC+Wyf+pGjnoJHnrYasIz8vJR
	 GFgagbgc35MvEtY8foP+Cop9b4LiKyIJ6DtdnW2GHUJ+fIY7m2vILBSY8mq9oHFy3n
	 7C/nF7MYSYENw==
Date: Mon, 21 Apr 2025 13:45:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, heiko@sntech.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: nvmem: rockchip,otp: Add support for
 rk3562 and rk3568
Message-ID: <174526113626.2604105.2555938938491872990.robh@kernel.org>
References: <20250415103203.82972-1-kever.yang@rock-chips.com>
 <20250415103203.82972-2-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415103203.82972-2-kever.yang@rock-chips.com>


On Tue, 15 Apr 2025 18:32:01 +0800, Kever Yang wrote:
> Add compatible entry for the otp controller in rk3562 and rk3568, add schema
> for different clock names for new entry.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v3:
> - update the clock name from "usr" to "otp" and re-order to sync with
>  other soc.
> 
> Changes in v2:
> - Update the commit message and add maxItems in schema.
> 
>  .../bindings/nvmem/rockchip,otp.yaml          | 53 ++++++++++++++++---
>  1 file changed, 46 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

