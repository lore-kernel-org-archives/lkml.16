Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC042882C0;
	Tue, 27 May 2025 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373995; cv=none; b=hYR9oFxQFpKE67jbOfeDNycUvJl18sLDAsS1gfQiVBkz8965RaHZUxHZ2O6BhLHC3pUT0sdDfK6dy0kqgm6SiHn1q0/1c1w1Gq9kRGc9XaHuuE+HWVcXcbiulBjUIjHA9+RHh3AH7051Jc/Fn7UcVxouJVGQ1Pt5Kf67JZ2lboI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373995; c=relaxed/simple;
	bh=8b7Ot1h0kWRufg9jq3azIqDVbfLb610Zg17izxeq5mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TO50rmw4Fx3nw91OL2I4mOb5djwk5qLpk0v5dSBI1J2wYtPYBDyKEaPtQPFJXLxEq/PTe+N00kOdCJFrGJptRC/mRybX04rzJZMzxhOEqEOAUH+POgLdZiHrczpFpyO8l5/f4VLTIU5vWE+GYMmDCMJFjg4foiZQBzvqZM2Tk/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbWgiM8B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbWgiM8B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE022C4CEE9;
	Tue, 27 May 2025 19:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748373995;
	bh=8b7Ot1h0kWRufg9jq3azIqDVbfLb610Zg17izxeq5mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lbWgiM8BThAq1FK9PnBWXw5Ea3jqTSikytUKVSl2TLgIvZiMebu1I70wy7sHvHuV7
	 Mx/asaNJz8aXte7R/VQGO8OmA0QEHjtpQFGO49Maw23fNLD9mlu4DFAzMgV4I59AAb
	 IrD8YsHZJjl7I19eX2M46MssS503LfabJ0eWIMs5JRxImghckhaDwOZqrsbOI/pMcm
	 6C/wZe6lWOWaDmLT1mXeTBqbVocwP1SCkqJc8BT8PdsIkF7GOvXfztLu+pIyaLzC4+
	 fYJpolT/yc9BItvVIXwfUO+pOxtQag+8D6zR40aLbQfp73D5JycanCY7u7jvq4bHkP
	 6yjMeVfux3lLA==
Date: Tue, 27 May 2025 14:26:33 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	gregkh@linuxfoundation.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	michal.simek@amd.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH] dt-bindings: usb: dwc3-xilinx: allow dma-coherent
Message-ID: <20250527192633.GA1084631-robh@kernel.org>
References: <1747401516-286356-1-git-send-email-radhey.shyam.pandey@amd.com>
 <20250516-exclusion-suffocate-94a1c87c1262@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516-exclusion-suffocate-94a1c87c1262@spud>

On Fri, May 16, 2025 at 03:16:02PM +0100, Conor Dooley wrote:
> On Fri, May 16, 2025 at 06:48:36PM +0530, Radhey Shyam Pandey wrote:
> > On Versal Gen 2 SoC the LPD USB DMA controller is coherent with the CPU
> > so allow specifying the information.
> 
> Sounds like it should actually be marked required on this platform, no?

Should still work without it, just more overhead of unnecessary cache 
flushes.

Rob
