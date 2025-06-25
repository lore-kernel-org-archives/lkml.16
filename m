Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF4A3074AF;
	Wed, 25 Jun 2025 19:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750880755; cv=none; b=bG+Kge6Pyp9o0l1XLIhkM8SDLoKtH68b6Q7gOjeLMowkaEjq7N6XVqya857KXyqduvSdJLSDrBA5lMeATGPmtXVUbSrSfggzbhQUMsHgm3vNJpLsa3wByXRtL6S0/ylvv156qH5q5Hon1lYlg4k0GwcCXqjxbfIrCmI54af/U14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750880755; c=relaxed/simple;
	bh=iE1k+ki4BDdbDrZW8QEoC64t7Lu6xKcC681QpLa1rY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsT3zpqPq3IfM8I9BKt6DDpJ2n1XzUdWE/HFsujmySMNw8S0DWnmE3t5Lrc23Ak/yNPZar5/O/a+6FiZ4hyiMva9vZcnyaPnGfOKBgtCsfVsRp67+jOOFkqccZI+Fuc3c8LB4g5Xny+xUINSl7T/cBBTry+JOAAZ0Q+l0GnMTgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQOavjnZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQOavjnZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BD2C4CEEA;
	Wed, 25 Jun 2025 19:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750880755;
	bh=iE1k+ki4BDdbDrZW8QEoC64t7Lu6xKcC681QpLa1rY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQOavjnZxWmUZHTbOz8yFFpo5sGNpNLSBrl8C5crhVXZoNQt6olfvEFxEQ3X/y/p8
	 Q15QiBuOhtyDvrsiESvOlS9cRAJNjZeCIqXGyJD0zNklCwGgtTjAioQz2ZKXbJYF/Y
	 teYaXwipFxZ8OQnlva3SBr/PDeIfXfCJ7gtwnREmrcG+KfnpFA00ssyNJUKz9qL3tD
	 IpROvUS7c6+/m+K5hTdHOCPFGUGDMKDBpZt35gr0WiMpDvi2pkcE3uFHQhRsi0sYqB
	 MB1dLL2tfic1KBSJ5fOAxFj12j6gT3Ixm8mc3bya2CwBWjxUdUmiotxTVitZy6DKz+
	 PpUpTWSWu4dVA==
Date: Wed, 25 Jun 2025 14:45:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: memory-controller: Define fallback
 compatible
Message-ID: <175088075350.2101342.9839294436407973749.robh@kernel.org>
References: <20250609212356.2264244-1-florian.fainelli@broadcom.com>
 <20250609212356.2264244-2-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609212356.2264244-2-florian.fainelli@broadcom.com>


On Mon, 09 Jun 2025 14:23:55 -0700, Florian Fainelli wrote:
> All of the DDR controllers beyond revision b.2.1 have had a consistent
> layout, therefore define a "brcm,brcmstb-memc-ddr-rev-b.2.1" fallback
> compatible string to match them all rather than having to continuously
> add to the list.
> 
> Link: https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  .../brcm,brcmstb-memc-ddr.yaml                | 54 ++++++++++++-------
>  1 file changed, 34 insertions(+), 20 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

