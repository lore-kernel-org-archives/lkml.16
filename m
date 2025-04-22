Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429EE1E3774;
	Tue, 22 Apr 2025 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326238; cv=none; b=Qc1e8eOasZOSAtvYP11ZCoWWNOdyBhc3nLROYRYag/kl7TOmdfk8tr5dosdgcn4yR+J+acC/JlKIx2y2aHjIgSEfxs8plvECpaKZkTkHmuhQo5yzJeHQnTEuDowqZ3mHg9/e3bAqD8VN0p5taY1/PswF8CrVV0wMpsjeWcbVRKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326238; c=relaxed/simple;
	bh=ezUAAvrWZq+SfBhumiyZwTC1b8cAjSVNn0r03WnlHbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEtR5K9lHpFPQa/w/ZbayGvDe5vF86ddOAmru60QQ62awNkrgmYProaSofNNyHoFQP2ivS8jsNUw7mgnZr7mN9rMlhe2qo3e8epOT5DAtEbTLHUum/qKrKWiLFAezVppqBNMvNwisZEj4pHvxm+yNDrfyJaZrdG7iG/rqcAkw24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQfXeIP0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQfXeIP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DFDC4CEEA;
	Tue, 22 Apr 2025 12:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745326237;
	bh=ezUAAvrWZq+SfBhumiyZwTC1b8cAjSVNn0r03WnlHbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQfXeIP0FUDQkmQeNKo3qBQXsZ2p1REsH/Rj5cc5Ec1jdgX+eik8C+na4GVgWdEBl
	 VKg6iH/Rx3hGrRXOCB3wuKBdbeuXoX0j8bk+y0t1hIiQ6IRp5Ld0/Ggt3eIZQoMLry
	 vEibG7bdts7/IZYnXID1EwrV7+RMzcEY7if8nniC3uiYcrKpaR7bfkqQO68Mh0bz90
	 IllVIIPlS0zjZrDa68OZodTqvlH+pew4aO7NXp/TSNOBTXowm2g28pkATIwzTKI9y2
	 IdaKQrcUNRWQrVTm5vycOHMjz9dj4g8ZfPga6A82/CO4XXLwfJrOJfeWEdr6VJtCy2
	 ZIX121RSoHZhg==
Date: Tue, 22 Apr 2025 07:50:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Naveen N Rao <naveen@kernel.org>,
	devicetree@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Conor Dooley <conor+dt@kernel.org>, Crystal Wood <oss@buserror.net>
Subject: Re: [PATCH v3] dt-bindings: powerpc: Convert fsl/pmc.txt to YAML
Message-ID: <174532623458.953813.9838833701705754537.robh@kernel.org>
References: <20250417-fslpmc-yaml-v3-1-b3eccd389176@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417-fslpmc-yaml-v3-1-b3eccd389176@posteo.net>


On Thu, 17 Apr 2025 16:21:14 +0200, J. Neuschäfer wrote:
> This patch rewrites pmc.txt into YAML format. Descriptive texts are
> expanded or shortened in a few places to better fit today's conventions.
> 
> The list of compatible strings (and combinations of them) is based on
> existing device trees in arch/powerpc as well as compatible strings
> already mentioned in the plain-text version of the binding.
> 
> One thing I didn't handle are soc-clk@... nodes as seen in
> arch/powerpc/boot/dts/fsl/pq3-power.dtsi. They are also ignored
> by Linux drivers.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> Changes in v3:
> - Combine two compatible strings into one "enum"
> - Remove sleep consumer (sata@19000) from example
> - Fix reference to example for soc-clk@... nodes, and explain why they
>   are not modeled
> - Link to v2: https://lore.kernel.org/r/20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net
> 
> Changes in v2:
> - Rebase on v6.15-rc1
> - Link to v1: https://lore.kernel.org/r/20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net
> ---
>  .../devicetree/bindings/powerpc/fsl/pmc.txt        |  63 ---------
>  .../devicetree/bindings/powerpc/fsl/pmc.yaml       | 152 +++++++++++++++++++++
>  2 files changed, 152 insertions(+), 63 deletions(-)
> 

Applied, thanks!

