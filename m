Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C259D1CAA70;
	Mon,  7 Apr 2025 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035230; cv=none; b=p5NZdgUTT6bPBGu6Q6h9kA/NS3jF3fOwy8iyH/FHYReVRVddz8D/egQngDb83oSefTIAZNfcpPYYHCUx9LCmLp1d5Db/NFv7wFNFWLP0dUkdviJhWgxamLjnzLGsJhf3UgvHrIuCTxCPv4v5Xdj99JpnSCBZYQDPvqOKga5RFcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035230; c=relaxed/simple;
	bh=ahGOKRGJmVuL3rnUqzbdjyTJAQIanf1NZjaOE+zSZes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAnpJRwW4yt6wvq2aUc8MwY5SiaFgD/N13H7MLJpTNlks1mwXUnpaV7AqKAdmyzwRDypMJCXMrjzb1tVHasC/5qfSpa2dYdBye0pGfodeAa3SzQDz0nzMFRrvgpb/y8LAxaNWVW7MgZT4l5dwBRHc5s0NIsDhvlXojnTfit+4PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Osk59fOa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Osk59fOa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61733C4CEE7;
	Mon,  7 Apr 2025 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035230;
	bh=ahGOKRGJmVuL3rnUqzbdjyTJAQIanf1NZjaOE+zSZes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Osk59fOafMhVKJyIc3lhaBtEhZ1E+eyNpYibhPmolxY9yHL6hdpODTieP4Q9XtglN
	 bkfRhuGlDD+9zzCPjs3oIQUlH9L/kjmKdDBRmKbMxUwREyiELDmQrdH720kZTyxBQu
	 UDMf8rg7ZM4u3436PtEPaHWmJIUiuW0t5RxZ6LzKooGc6mB0VmR+iiW+4QnLic91U8
	 VRXAe4rgJmkZ231me51Y+r4EgW5S5JASYmaaK5Endvt1HJlUpLpZJTnGffYYAx6JQB
	 Vtk2QO7tOpoBRvbBRXvLJdMXStl8+kuWOOWSivNXTzjrZnsLXwITp/zvZMeRhrKsem
	 GoN4v7FDE44Gw==
Date: Mon, 7 Apr 2025 09:13:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, tglx@linutronix.de,
	prabhakar.mahadev-lad.rj@bp.renesas.com, krzk+dt@kernel.org,
	alex@ghiti.fr, aou@eecs.berkeley.edu, tim609@andestech.com,
	daniel.lezcano@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: riscv: add Andes QiLai SoC and the
 Voyager board bindings
Message-ID: <174403522889.2246903.6406254978033445523.robh@kernel.org>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-3-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407104937.315783-3-ben717@andestech.com>


On Mon, 07 Apr 2025 18:49:30 +0800, Ben Zong-You Xie wrote:
> Add DT binding documentation for the Andes QiLai SoC and the
> Voyager development board.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../devicetree/bindings/riscv/andes.yaml      | 25 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/andes.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

