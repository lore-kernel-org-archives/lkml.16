Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3785223906A;
	Fri,  9 May 2025 18:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814278; cv=none; b=qQb0rUnpLVyLTKvgMu0vU9cVABSCLBYda7OXa/PvC1V7OiRQjQZTV+54dWovEMrM/GVnLXdPvWCEeRIw4jXFcuWJh5cM18CYdj945Nd5gypY3BmMLfterkB2WlPCxy98/r3RjdcdisLUvTLyKNV0ztbvkkrjixmdLyfqJVOoXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814278; c=relaxed/simple;
	bh=VTLaSm3GQYCxJUAqX/0OssZlKJmO1W0tBL876r7AKvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNpZ3CGSaRbO5AHW8vYnFvD2CjK7nMBeqN4EJ8Z4isO2CLJG03gZUI1PKr1EnttXLYoTtedR1doYAQxY0z1D4X+n4wrtX3TgJkzbVmQvB2MlZWiRIKxHU+blofDQlweEFNwMjaKxe8yFRDTyzr4fZ5CHCNCnBg/IIQkOfsEsMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEl8tBVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEl8tBVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759FBC4CEE4;
	Fri,  9 May 2025 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746814277;
	bh=VTLaSm3GQYCxJUAqX/0OssZlKJmO1W0tBL876r7AKvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EEl8tBVeCMFdZ5KZIvdbeV5PRg+wc6+AAq/nzexA0bC7p4XERK1umLkkPsy0QbH/C
	 nwCDplLJbyN+eWyKwfKNBlnBcRkMNeKsPV8hjiGUB/Dg37TjnZfqLUoCbTLxofIEX1
	 Dn4u8eFZO+dZSokrxZxYtynPUUJnr/Tj8LSf28jrIwO5CA6e8Yho76Aum259cjrXUA
	 QLKoI3o21qhK8QzMC8+l/eHnX/jpVEIUuWOvdlhzHJma7hAXAD8SjOB/0cz1WM0KJE
	 5AxELyzSf2tS1Vz9y+cRsx/+2IcbTuNergMwAUC74c71MIkJLKec+BNdElqtQi1gJq
	 7ipFV4FyRw6cg==
Date: Fri, 9 May 2025 13:11:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: dinguyen@kernel.org, mturquette@baylibre.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	sboyd@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: clock: socfpga: convert to yaml
Message-ID: <174681427510.3878879.9476467929074035789.robh@kernel.org>
References: <20250424144341.45828-1-matthew.gerlach@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424144341.45828-1-matthew.gerlach@altera.com>


On Thu, 24 Apr 2025 07:43:41 -0700, Matthew Gerlach wrote:
> Convert the clock device tree bindings to yaml for the Altera SoCFPGA
> Cyclone5, Arria5, and Arria10 chip families. Since the clock nodes are
> subnodes to Altera SOCFPGA Clock Manager, the yaml was added to
> socfpga-clk-manager.yaml.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
> v3:
>  - Add a properties level to $defs to improve reuse.
> 
> v2:
>  - Fix node name regexs.
>  - Remove redundant type for clocks.
>  - Put repeated properties under '$defs'.
>  - Move reg property after compatible.
> ---
>  .../arm/altera/socfpga-clk-manager.yaml       | 102 +++++++++++++++++-
>  .../bindings/clock/altr_socfpga.txt           |  30 ------
>  2 files changed, 101 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/altr_socfpga.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

