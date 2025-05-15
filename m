Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8857529614F;
	Thu, 15 May 2025 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300806; cv=none; b=iLx0RzVZswvEoWEs4KZZHxlmA8VOkIgtfWdoVhRZn1Q5w4rD6j5Y5SiBwJ6QulyIxiY4yfyErmoVWE28k9Fe44r01uHiOzBc15plzz3SGfD1B+mBpcHFN/tyXiMgbe23w5du0z2/eNH+fTrNvfYRVZ+nBUxRuxzrIkxm1gekBRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300806; c=relaxed/simple;
	bh=rm618sxDeCiPbi8y8NEmx3FDI0gdJMROpy9V3fCDMDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCqZ2LU458bHuR53oJuL8ZX1yHjaJ4MQ9t3TVYTm22aconVhdp3j5RmrSPxOEhmJ0daG6OB1B09ukCK6g3MZIarl8FoJuHm7jjdPbTLt2IsdEuFC2Liy6A9S+GutEQWGGpeikSDuKqne/cE2NoP/ygt08/5x4WJxJxlvwBhVon4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZOSz8X4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZOSz8X4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226EAC4CEE7;
	Thu, 15 May 2025 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747300806;
	bh=rm618sxDeCiPbi8y8NEmx3FDI0gdJMROpy9V3fCDMDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MZOSz8X4ZqAwZlE2i4UNV3piIuYOa7FOuUZiETU8K1rG+qkCBfajGh9vnIF6NhVMj
	 pgJsy4tLUzSAkZMM2u34obTByikyyOHn/D4XfZx6DuOaHoeLzrktc8DB6uJebYtOLw
	 71RYOtNxXT0hBXSkQl5PjSt2HZZoBnkAVNmvIj2Uh+qvX1GP6+bWG35Em0ysD0H8Eq
	 UsVg6nz1/2H7HunM2n3XZia+LuZCqlhI4pFKPGprfyeQ8TYmEiEMT62FkRd1OKOjY+
	 3/HgEyi2ngq4aQgnJSecO5Pk+h9VQzQc8vZv+5okj2CKDIbMKdjsTaXgpwChXrxzPT
	 EL2k2gcGKk7Xg==
Date: Thu, 15 May 2025 10:20:00 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <20250515092000.GF2936510@google.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
 <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>

On Thu, 15 May 2025, Mark Brown wrote:

> On Thu, May 15, 2025 at 08:13:57AM +0100, Lee Jones wrote:
> > On Wed, 14 May 2025, Mark Brown wrote:
> 
> > > Could you be more explicit what you're looking for here, the diffstat is
> > > entirely MFD?
> 
> > Okay, more explicitly, I can merge this and MFD will have no issue.
> > However, the Regulator commits make use of 'pmu_id' introduced in this
> > change and would therefore cause a compile break.  So we could:
> 
> >   1. Apply this now and merge the dependents next cycle
> >   2. Apply this now and provide an IB
> >   3. Wait for all Acks and apply as a unified set
> 
> > We usually choose 3, hence my assumptions above.
> 
> Well, you choose 3 - I do think it'd be a lot easier to go with option
> 2, or with applying the rest to your tree as acks come in.  There seemed
> to still be a reasonable amount of discussion on the MFD bits (eg,
> there's some formatting comments still) so I was expecting this series
> to churn some more and was waiting for a resend.

Yes, I expected to apply v9 with your Ack.

I can go with 2 in this case.  Applying in dribs-and-drabs as Acks come
in would be sub-optimal and would likely end up in a mess.

-- 
Lee Jones [李琼斯]
