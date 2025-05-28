Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710F81724;
	Wed, 28 May 2025 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748458659; cv=none; b=eN8Y5xGUe08sAB1HvUxHEigc9i0kApmGfAsWby2pVAzL2TkAGR0csQO7DcQqb8FFSWiJ6uRx75QHFXSalE1iMTWie4OHJpK3cI+2CIeG/iY1HUE/9nIOZhpF3+0XYMbTNvjsZhIM1BQtFWqIF0v0pn69hH5nTHyzM8lXyTFzo/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748458659; c=relaxed/simple;
	bh=NP57BkZzjq1plXytv+G2I0CdgzK0RRxKGjgpR/vkFpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ArxovfAFDuMWc9xvusiXoiN2BowELBSZWLFoSzUuZvOiiNnJaCy/jk3qQ9aRlwvGLM0Mpi6awxYEo4kBmc8pF0I8Ah4K7kiwxURUibVHKbOmhP87z/VEuPypjTlfOJ/20oUxngSDKW1+MAAa5uIV0xB79Of2w6sivvjEmeAiKp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEp2ES2M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEp2ES2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48774C4CEE3;
	Wed, 28 May 2025 18:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748458658;
	bh=NP57BkZzjq1plXytv+G2I0CdgzK0RRxKGjgpR/vkFpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sEp2ES2M+ul6PIPV1rZfhiYM/d90zzKKgNVDy225KDFyY1bxf2Dj92txydVum6btm
	 caEqAbBbSyU/ts78I9S8NxWVIZVAYfc1y2CLRBaPx7XdRsMFUTY0d9WStdFuIKL81I
	 EnGoSwXZbtCsyXYGQ9BvZAE19IytBgSlNa5ZBoTve76yq+3fa14y2M9LoVM33DDSk6
	 UQeraxWvFw7UD2WLjzqJ4N2X69jIckJOiiuJ5bHCsrNHmB0nvNJ2EAZawFcdGiUyUX
	 wDscLytqpT9VQaJznHUJwkPOCnCoUFlFALDgV5xoR4tUYnga2j87v4mbOQ35XeqJ9a
	 kJRXKgy0D3ckg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>,  "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,  open list
 <linux-kernel@vger.kernel.org>,  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mtd: jedec,spi-nor: Add atmel,at26*
 compatible string
In-Reply-To: <aDcscr4pF5vC4kNq@lizhi-Precision-Tower-5810>
References: <20250523155258.546003-1-Frank.Li@nxp.com>
	<mafs0r00arpzx.fsf@kernel.org>
	<aDcscr4pF5vC4kNq@lizhi-Precision-Tower-5810>
Date: Wed, 28 May 2025 20:57:35 +0200
Message-ID: <mafs0tt54r2ao.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, May 28 2025, Frank Li wrote:

> On Tue, May 27, 2025 at 06:13:22PM +0200, Pratyush Yadav wrote:
>> On Fri, May 23 2025, Frank Li wrote:
>>
>> > Add atmel,at26* compatible string to fix below CHECK_DTB warning:
>> >
>> > arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/spi@4002c000/at26df081a@0:
>> >     failed to match any schema with compatible: ['atmel,at26df081a']
>>
>> Is there any problem with setting the compatible to "jedec,spi-nor" in
>> the DTS instead? If not, it would better to do that instead.
>
> I suppose it should work. But it is quite old legancy boards. I have not
> board to test it.  And dt also prefer add chip specific compatible string
> before common failback compatible string in case need workaround some chip
> issues.

Hmm, poking around with old DTs is probably not a good idea. Anyway, the
flash is listed in spi_nor_dev_ids just like the others in this yaml, so
this patch looks fine.

Acked-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav
