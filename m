Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626DB21772D;
	Fri, 27 Jun 2025 06:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007420; cv=none; b=TtioHtDIRqecaJW8ncsP9n3p+fsofmRPC1wYVWMmtv2zLik3tDVqY94Mvi+NrSSoQnCiUVNSGQseawuf15dXMMWQE7FTg6Wa34/pXsO7Uv2zL9gX2sq01h9HLTcYuxdaRWF27YCDjlblUBq6klmKFWzLnG9PZLDm+cuFUORUGmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007420; c=relaxed/simple;
	bh=RUJsjmSGQPxvlILjO7Cg04n19x/+TREx8d9eLpvfC+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWp+MOWAWegdrQqyDNkbv44k1iR31/ZcOnKoRWuWS88/Gd7/7TbtbDAr/VHLNlOBG+uVOUEOIMN1fUiuzqF4KHB00WKVJU8fVDu9Ia2ixVgVqflX9AieSiZVGt2CsCS6Ioi5ogXEiEQkxU9sQDL5RTbrDkgx6ju3b7YjRCjppzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfxPO0xF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfxPO0xF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C8FC4CEE3;
	Fri, 27 Jun 2025 06:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751007420;
	bh=RUJsjmSGQPxvlILjO7Cg04n19x/+TREx8d9eLpvfC+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfxPO0xFDf8iwX3L/LLjc4NqWbApFKokjGOYNiMubo9FKIcNmC6O57xiZqOXFIpOn
	 44ZoqG769urqZ7N0S8Q7zN9XdDK+f4nbkxaRMwH3VX0/r2VdI4qBRrIfvtriLnwYBu
	 40n3Wfind6dDtwrZVQSXWZIE07lPRnbWglF6SGpmSmwiecfa/gu7inEKurwDX8lD6g
	 ihhJnrbD1l3urWdr4JMN1T88Tt8t+Ga5ff6AcFifAam6a7ze303Mg6LEu3+bDtaVOy
	 GFzo9jYJCvrxVV1RtNJ8yObHwceUaSBIPCngFi+6sVIwJ9nUzyDTwhzZmcyosyvs7H
	 RKFMlp7Pahwuw==
Date: Fri, 27 Jun 2025 08:56:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	gastmaier@gmail.com
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>

On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> core that implements the MIPI I3C Basic controller specification.

How did you resolve my last comment? I don't see any explanation -
neither here nor in the binding description. Binding description is
actually better place, I think now.

Best regards,
Krzysztof

