Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2EB1991DD;
	Mon,  5 May 2025 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457779; cv=none; b=R8p1En2OdSkdBkDODk2Kq60uckLCiqvc5hJEL0ck7Prwm/Hgqg9kW1jYawCm4Pq6q21aviYDYA0UENHU1LTRi5HWCwL+oVqdvNANjv5ddqx13BUc8C7KZRUG+w+I6WIiXOx0Pxuz+r4bx/+dDG4A2Ra48uwPy7ke6Fm08H7fUwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457779; c=relaxed/simple;
	bh=TSUZKeCdQhdSNxarE2Jb8rQpBLaG9AFMMnYpT2x7Odo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/ANv+lemgp0uSTuwwWkzm1aH7X4RhOLnRmDEJSU2hMO0a/3cphtUTYN6Ngb/q961Bqfz98BZSmn2w1T5jrWkPRKdNFxfrj2f7L/3r6dpV+p59kzyQViMcaoizfRzcp9G+gsGQ5rf1TEgKYD8Tyb7fKfFDzUHd/jxqcinqLaAtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=QgGNUXco; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="QgGNUXco"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kWu5GJ/61aSn6x94SwqhrcX8Db76+qXS9tFC+eWlWv8=; b=QgGNUXcooNpXGyc0ZCLQdGrbSK
	VnLeqcKzMUrQdNCvQi/jczUba522CT8xjzYYxpU1Yz1b6xwI795L8tnXtNHIqxz7kKlD7gCjrpNB/
	4c/7cLCXoanQNknxMOdfC8canG4ldWUK0MK8Fv+6c8FM+5UoFLzNA7/r7Gh+lb3l2BUc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uBxRW-00Bbh1-MR; Mon, 05 May 2025 17:09:18 +0200
Date: Mon, 5 May 2025 17:09:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 marvell,orion-bridge-intc to DT schema
Message-ID: <dd9795f1-872a-4f7f-b4df-52cee65151a7@lunn.ch>
References: <20250505144743.1290672-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505144743.1290672-1-robh@kernel.org>

> +++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,orion-bridge-intc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/marvell,orion-bridge-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell Orion SoC Bridge Interrupt Controller
> +
> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

You should probably drop Sebastian. I've not heard from him in years.

Apart from that:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
