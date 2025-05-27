Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D932CCC0;
	Tue, 27 May 2025 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748362405; cv=none; b=CS31QJOov/fLASMvV5LsOYaHqBxOzltQe22dctI1SBS2aKPChn1wj8Zh5Kgt/P1bsEHn6LzcFwGKhaZK/Gj0oTBHqnhyJ6Tt9EQPNpMUGsI9Uxsv8xINjqwd74ndxqkaW3uSJr0jZHqArl7fhwWBd4XE9cnK0Eygsl07DM6pSC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748362405; c=relaxed/simple;
	bh=+rOhBA3MDB0wclaiXc132kW6TF3NIYNXXbvmM/76Yu4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=na2BdyytHK58hGbC0UwoPtYPKj1Jv7L6qlZm4ZEvrFFWJr0PBEE/cCiLxYF1GWsYC2aXccydVJsgVVnExjBiWHETvonPf+4uXTWG8ZDLKlcuq+V7Cqk0JnraEXOA0Xs9tmi3fjJyVv9B1VXMmbng+tGH8q84C64XqRIrQcoMnSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCM4Afd7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCM4Afd7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2DEC4CEEB;
	Tue, 27 May 2025 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748362405;
	bh=+rOhBA3MDB0wclaiXc132kW6TF3NIYNXXbvmM/76Yu4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gCM4Afd7hOao43lcgZKa5wIrqBtufzW6FH4r94YSR+xFhMj2+EW0AERgnc5R8R5DE
	 r9KH2tPwU8ZeIJ6I0/UxA9R1Z0FsmJA0R77pWJk8FZ333XU+SJkQDFMZW4WRp3fWa4
	 /e0rpZxTsYxRQlBRE6+B2CLzgB9+1io/WelunIbc+kNl+e+GiQuRdkqIhzYuTTIO3i
	 P5mjSBjLKovKN/OU1uVQDt9r+DRyHlM89pSXCc+gCyCiYMBEBkwLCrMaVtqVoYgYLC
	 Z+R8UVtFkBkxV6o4Z3pKq1jqWt9/JtAWvayCUjGzOSGMHMmYpUT2umT/Vhmmvbz4ks
	 1R1G5eZulcb2A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org (open list:SPI NOR
 SUBSYSTEM),  devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS),  linux-kernel@vger.kernel.org (open
 list),  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mtd: jedec,spi-nor: Add atmel,at26*
 compatible string
In-Reply-To: <20250523155258.546003-1-Frank.Li@nxp.com>
References: <20250523155258.546003-1-Frank.Li@nxp.com>
Date: Tue, 27 May 2025 18:13:22 +0200
Message-ID: <mafs0r00arpzx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, May 23 2025, Frank Li wrote:

> Add atmel,at26* compatible string to fix below CHECK_DTB warning:
>
> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/spi@4002c000/at26df081a@0:
>     failed to match any schema with compatible: ['atmel,at26df081a']

Is there any problem with setting the compatible to "jedec,spi-nor" in
the DTS instead? If not, it would better to do that instead.

[...]

-- 
Regards,
Pratyush Yadav
