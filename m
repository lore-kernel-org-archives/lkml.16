Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27B22FF58;
	Thu, 22 May 2025 08:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901635; cv=none; b=V9GwzEz4mEvuv+a0ckSlruoESV7aqnlORP6XKA+3x3nPSHEESBx31ggeZDsucLMLryHvc5uzg+ERw9GCZLEYajUXC7/Tm+Z4bXKL9IA8uff0a29pUGCbW12eLi3KTZ8nySKEeQyR7wNB4XgYaQiS1EIPDxLS94Rbjh3Q+4tReM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901635; c=relaxed/simple;
	bh=ucKCUlLYSYT3nj8S/fG2k2xkdPHQzH9hjqYueghoDL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1IT8fFTm85+/PbQ5gKvOu9Ce54V7qyessmyMBAFI+63qwNTeGqYPtTenp7k4SMmdcPcSt+oBSyoVbrAFZRrlFzOUYbRoppvXwndhjIR2XjdpWwtMMnfSo6u4iQQ3eB1aW+4P0B/ZrRCOM3SQV+E2zUPwiq+6ApQ2j0LDRE1jTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZSEL/YZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZSEL/YZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84367C4CEE4;
	Thu, 22 May 2025 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747901632;
	bh=ucKCUlLYSYT3nj8S/fG2k2xkdPHQzH9hjqYueghoDL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZSEL/YZ1Hpq1nto08f+Dyi3Hg8/2ZhTWK8dLFHgQUx7SfwC4fa85+f/h5xHykFke
	 UH8gTvRcumqwhmT95DaGnNCzwEfAroKTEgoVSMEcKCyNHVBCUQYmJEqbkEnZwPcUBw
	 HypAiGGdA0qOC3F+wqbuhRBI4x4/5kepHJA0BS2p6cfSROz9Qb0ncCB9s5FdXAvFwE
	 w/lder3nTNXd2bsGZ2LnyIaKTUCFqXYpXsbJp9kS1uJHxyX7kER6mx8OH9Y1eiPcjL
	 o0nO3KtTE1yi4cVn4vgnEPQ6Ga8vUwslLkGjXYFamM9vbq8CDGJp2dUwktWsEaHPae
	 7aOYMhczK4RDQ==
Date: Thu, 22 May 2025 10:13:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: nvmem: convert vf610-ocotp.txt to
 yaml format
Message-ID: <20250522-calm-pronghorn-of-storm-bb8a8c@kuoka>
References: <20250521164031.306481-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521164031.306481-1-Frank.Li@nxp.com>

On Wed, May 21, 2025 at 12:40:30PM GMT, Frank Li wrote:
> Convert vf610-ocotp.txt to yaml format.
> 
> Additional changes:
> - Remove label in examples.
> - Add include file in examples.
> - Move reg just after compatible in examples.
> - Add ref: nvmem.yaml and nvmem-deprecated-cells.yaml
> - Remove #address-cells and #size-cells from required list to match existed
> dts file.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Thanks!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

