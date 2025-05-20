Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C3A182BC;
	Tue, 20 May 2025 20:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773816; cv=none; b=WHvC1HdsYMkzVZ4mK3tvCwH/75u3B1HROa/ThfrOx/Uu+FfCECzZxh0E5Mn0mTYS76P/KowCKdHQ1FLIoC05SXVDR0U2V2l2bgnEj2cmwyLtwaL9VeTZ1IeEKXIU5mscjjcctKClqttgGDBWUVxkOqqt2Z2ZL8MPFMoN3U7CY5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773816; c=relaxed/simple;
	bh=QKRukmbuEwwuWzb3b6AjUBX0NaLEkAeTqogcvnWc3BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWL79n5j5SGUUECY1+HOzIhpZQpsS5dUPHGNcEu1AK+NEMEg7FIerVTZljyeFgmCQdh8e45wqbrGfNfwv/w5nNxg6UKUR18L9iNa1XVJ88d/mpHhNIptVqRRT04/h+Ptzr5LMLXEJTvhlisW3oyeWpGl4RvewzpodhrSo/0LKvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYQmjl10; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYQmjl10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E35C4CEE9;
	Tue, 20 May 2025 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747773816;
	bh=QKRukmbuEwwuWzb3b6AjUBX0NaLEkAeTqogcvnWc3BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fYQmjl10u8d+o/qHPxX+Z4MEajH6bpHF2ohSk/NMgfeyJ5W5YUMRkuFGZjq/d0jsx
	 BaG0g/U2ABvNahgnQkduP/YtmH25pTyvP7MW/rqC0N8a5r01uuYJ0bsgP71CUbd45o
	 dSBdU9zjTGvwXGTJqqKmGtOlW4OTSbwBVx3tsTKrhmPESN0Pr9xBKrrdf4j2o8NpJC
	 nm4LNnLsxDAiZkg3dmhPe0NVMch4yJadifVjnodGrZuvk50Y92jkjqRGEMj0HNJqN8
	 vsNcIC94Lfy1pUknXFU9sxrXGI95oXCzy6czSad81gv8n6YlT8qYoWlImEAE1gXGtI
	 1R1MsPbymYs0Q==
Date: Tue, 20 May 2025 15:43:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <174777381319.1323810.4064448957148847478.robh@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>


On Tue, 13 May 2025 19:47:54 +0200, Lorenzo Pieralisi wrote:
> The GICv5 interrupt controller architecture is composed of:
> 
> - one or more Interrupt Routing Service (IRS)
> - zero or more Interrupt Translation Service (ITS)
> - zero or more Interrupt Wire Bridge (IWB)
> 
> Describe a GICv5 implementation by specifying a top level node
> corresponding to the GICv5 system component.
> 
> IRS nodes are added as GICv5 system component children.
> 
> An ITS is associated with an IRS so ITS nodes are described
> as IRS children - use the hierarchy explicitly in the device
> tree to define the association.
> 
> IWB nodes are described as a separate schema.
> 
> An IWB is connected to a single ITS, the connection is made explicit
> through the msi-parent property and therefore is not required to be
> explicit through a parent-child relationship in the device tree.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  .../interrupt-controller/arm,gic-v5-iwb.yaml       |  78 ++++++++
>  .../bindings/interrupt-controller/arm,gic-v5.yaml  | 202 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  3 files changed, 287 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

