Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDD020FAA3;
	Mon,  3 Feb 2025 18:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607358; cv=none; b=ZUb7tDh4cWu5CWhBju544gOHE/5O6+82UabnAPOH7UCahDkB9wHFRSIgmOZYUX+hcmxNvxrVJdaeSFLyt0i9Dm9Yg/7GqY638UAKq0r087u86F+llmqs2ihRZ4VVlBNtQ2c/7EBz88bGPyl/aBD5DtJFS05Fdb8r0zVq4FS5JNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607358; c=relaxed/simple;
	bh=WiQw3lRFLXzzurHN7Z2cZ91YvqKN9pKKM/mbocrKS4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4rIYybnISacG5ya7eskx9gCK08wMqVcMYpOFu3eQ1ZMxUj9pSzrHwZC5yTKgVZW+vdCIjUdC9KMIQGb/QSOHU5Ac7CP2E4ZE8OXQqemLLAwDCTqPbnOHdAiqS1V3nGVeojgytlFkgC6ewrzgpYOZj9CtklUtjATCVvaH2qoWa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wvf52oeT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wvf52oeT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17828C4CEE2;
	Mon,  3 Feb 2025 18:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607358;
	bh=WiQw3lRFLXzzurHN7Z2cZ91YvqKN9pKKM/mbocrKS4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wvf52oeTW2qcDtwkUFck2Fynik4Oba2Emu/YBIn4j96LSSmSxw+YnVsLrl8Hqnczd
	 6MAtKj+Mz5sqKpLNoMEz7hrkW95XGRx45Rx7snNYYrkqchhIvFjL8/AWrzmduxSVKH
	 wYvxfpEgrwID/TI2JhyAo74BMxmGo0BjBnJ+3/M7wYVvOIiif7HKhGhcFjkq06A29v
	 8Ie2llK0Q88K/CTZpeykKK9Rn86pZVa/YdiE9AiXQEcxlVG/KxQEoxKqjD00ppcpmb
	 7e0PLh0xVtJWzHUt5I3wiq/6EVKJQimRXMA3a8hdPYJX/JJHXh8AXZ0Tzo8EHooiqU
	 tzZqwrvc1Y3jg==
Date: Mon, 3 Feb 2025 12:29:16 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Sean Anderson <sean.anderson@seco.com>, linux-kernel@vger.kernel.org,
	michal.simek@xilinx.com, Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	git@xilinx.com, monstr@monstr.eu,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] dt-bindings: xilinx: Remove uartlite from xilinx.txt
Message-ID: <173860735538.3354146.9270602675475288843.robh@kernel.org>
References: <cover.1738600116.git.michal.simek@amd.com>
 <aa0b7f9a851c6b8d11f37050f84e0ec69cfa72a2.1738600116.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa0b7f9a851c6b8d11f37050f84e0ec69cfa72a2.1738600116.git.michal.simek@amd.com>


On Mon, 03 Feb 2025 17:28:38 +0100, Michal Simek wrote:
> current-speed description has been added to uartlite description by commit
> 3de536a8c365 ("dt-bindings: serial: uartlite: Add properties for
> synthesis-time parameters") that's why no reason to have in xilinx.txt too.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> 
> Fixes: 3de536a8c365 ("dt-bindings: serial: uartlite: Add properties for synthesis-time parameters")
> ---
> 
>  Documentation/devicetree/bindings/xilinx.txt | 7 -------
>  1 file changed, 7 deletions(-)
> 

Applied, thanks!

