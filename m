Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A02905;
	Mon, 12 May 2025 12:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054353; cv=none; b=hwlxlPmGmknUlmA+K5Q7TQ/ZTCi2gGbymLoRKn8vwFA8FTwk7Mz6X+zLp+n3nN9I7Q27LFen3BjX/4bdxtfn05A5WbnhkK6stGbmKPQtkITZPNgcsitcNnpS2kX3+9hjAURxem9MN2FDGm+Oqd1C7MMHs97Tph5z4nZNNFwugwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054353; c=relaxed/simple;
	bh=8ZmiWEvYDdcWO94VvVuvtMz1yjFZ7HIfQWAcdyV8D+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhJp/zuW1hWeKF1GFQdFaKagCu7okVLfz+sqcU6R2MzV1iYmvDBKlYibtlYKQcdstJAvewinQjA5uEeM39EFW9Rtz+uyhq5qgjLYaWuNDhEBJp9yrEcLo1bN7IMt06w+Ej353SVgOTa9vztjUD9O6dwqnTeGZUPPTDckObHM1f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAfVIzWs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAfVIzWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF990C4CEED;
	Mon, 12 May 2025 12:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747054353;
	bh=8ZmiWEvYDdcWO94VvVuvtMz1yjFZ7HIfQWAcdyV8D+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RAfVIzWsPVZm7gw396VeBjXGD+0F9G4XAL6WIXJE8dCziqLBFcDeROkJqAOOl0aig
	 I9JplluoHJnSJ20Y+OE4pcJuzeX+d/hesUp2uqs7zql+0JEwvvaHXR1IwD3qrhfoJG
	 WDQPeqRLc1gbUAe2HubdoWqxa/GduSgKWc0Jfvuh/hci39QKmYjBlqs7cFSMkalAGK
	 ideD98/y7d6jMLrm+MLy67iGXwT7Om9+UF0U5WnZY1sjPy9ZuXpqAMyGC6pjaP6XLi
	 Hzq5PiaYciW7O1O1aEd7uUxYYjY6kuKHJ8iRR0/7xLdQYQsW926fwweDjYiZsOx0sq
	 xYjZyYXOv8XWw==
Date: Mon, 12 May 2025 07:52:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,qman-fqd: Fix reserved-memory.yaml
 reference
Message-ID: <174705434967.2948939.9106067871185056281.robh@kernel.org>
References: <20250507154231.1590634-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507154231.1590634-1-robh@kernel.org>


On Wed, 07 May 2025 10:42:31 -0500, Rob Herring (Arm) wrote:
> The reserved-memory.yaml reference needs the full path. No warnings were
> generated because the example has the wrong compatible string, so fix
> that too.
> 
> Fixes: 304a90c4f75d ("dt-bindings: soc: fsl: Convert q(b)man-* to yaml format")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!

