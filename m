Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC361F2367;
	Fri, 11 Apr 2025 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744385256; cv=none; b=FTvZEP7k+7r3V+CnNGuTv7s6z3Bo4TqCZhJm47FrUZ5HkW1yHtNBjrkh0rnag33ePKHiZgBBkXK9vEmZ8I4D6rH8raA3QYI3zmPCyxsJxCvHXodsDuoW2pyFbtnM2FzzOxmUogaN9GPDjpn+C6dBOX7+hObLifJ8ZCAGL5eGmrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744385256; c=relaxed/simple;
	bh=jPLcZIwSzCWBcWi+cAhyZX59qPuiRtXIzL2gT2e6Iek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjubYLllrhyRIYgvK4J0/UQJ38L8BMxphNyhRtpUXSJwGtMrjZTOHba+W0prXniVnwARy9ckip/DaaWdiPNdudYpAB0tK8LHOMQH5J//RMtOlhrvfwCvyqfzxILszO+vETBIcrdpRqhL1iDIP4GoB6WjhpurgAuVMggunXWVBjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REi8RDpT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REi8RDpT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDDCC4CEE2;
	Fri, 11 Apr 2025 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744385255;
	bh=jPLcZIwSzCWBcWi+cAhyZX59qPuiRtXIzL2gT2e6Iek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=REi8RDpTXZ9wO+D598QQgL0agVTfBW28JOt9Hukl0SQ7RUvHl5bIK6kUe+bOXSG/L
	 SNbrJ31tqs0OdCB5IXt62U+6cLGvSqL0vCzuwfU1mNOZ/8CN1/iL4DrTttX6+CyX47
	 PES+0FC8ASItpgCfezWj7/kGDoTl4qIUB2KC2obH8qaCjZgtgmTieKHBtWopaPBs8c
	 ko41nHTrz794nt2lqNU6oJ/TpkUt7xVYx2tkiiNSDC060PYRJgxNxE/krGQlQcm+28
	 /PC6QGf9E6+Q3k6UCyNRpjgjuC+fuZzSx30gfAcQzUN9EK+tOKJxHPQs+RQ8wOxKTw
	 LEcwmBB4+sarg==
Date: Fri, 11 Apr 2025 10:27:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Drew Fustini <drew@beagleboard.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: starfive: add Orange Pi RV board
 compatible
Message-ID: <174438525359.3278076.8626650371046097286.robh@kernel.org>
References: <20250409091801.855083-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409091801.855083-1-uwu@icenowy.me>


On Wed, 09 Apr 2025 17:18:00 +0800, Icenowy Zheng wrote:
> Orange Pi RV is a newly released JH7110 board by Xunlong.
> 
> Add a compatible string to the starfive platform DT binding.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

