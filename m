Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CA457C9F;
	Wed, 23 Apr 2025 14:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417356; cv=none; b=ttN2sE8v9jq4oi5O+09zH91vjtnS2unRv8/ra70Cpi3CR5+oeT/Ng8Euyk13YfnuYNdlZ8T9edMWCQHqPVmkETgf1gAW3+tebHwIBpOLh3FlxGbEinKfTHRbv6lVBYc7pPObZt7EIcN4L7/l3UgD5SnvDI1D3psHe8XfNZud0Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417356; c=relaxed/simple;
	bh=dWOG7RGEkSsD3bDbFE9e385tYFW5t5n87RHkOeTFJ2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BI04mA5YK00NrSypY4tDLe59qzOnl7Cy3J9HDEGMI2MdQPGJndu0goJAsIc4du+11WHWeDiLFjpF4WGj5DFMDX5eFFkt4of+dbiHLPKYyaWvetphm5/3to7w2KHANZMZGkIx9SwpHAB5el/1hhjclWSULeDH2Xbh3jCbDcAXutA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dMZmow7D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dMZmow7D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F145C4CEE2;
	Wed, 23 Apr 2025 14:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745417355;
	bh=dWOG7RGEkSsD3bDbFE9e385tYFW5t5n87RHkOeTFJ2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dMZmow7DCJnSh3Rs2NF7VXq/Q/gcgKjcJjEJ3lCP9ftu2LVkuFNWzCcFxmTEfLAh+
	 O26ab7P35o5Qff+n84u/WKNoph7BvCqIyuR2JObEpv8vGg+TpOT43IINELvXtSwjBe
	 lK3UCWP0vbGft1rdQtrEEQRLRNWD3kMsF6g+90Qg2oZvv8MDzFK4BxNBnIm8+8VF0W
	 i/fWaBdXzGTHeJ/XqVkmMsGoDdBmhklcI6m4JKxAIEUVUrqN9Zp4Pc/vPLRZMWeSnS
	 ToKomBeJBj4v7BvqmKJ1DqnB/wg+eSqYilLq6TXcRFvUlcHSgCXj87D9G2GaiTiRGR
	 /zTseAq4NBK3g==
Date: Wed, 23 Apr 2025 09:09:13 -0500
From: Rob Herring <robh@kernel.org>
To: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	saravanak@google.com, dmaluka@chromium.org, bgrzesik@google.com,
	jaszczyk@google.com, ilpo.jarvinen@linux.intel.com,
	usamaarif642@gmail.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, tnowicki@google.com,
	mazurekm@google.com, vineethrp@google.com
Subject: Re: [PATCH v2 2/2] x86/of: add support for reserved memory defined
 by DT
Message-ID: <20250423140913.GA360030-robh@kernel.org>
References: <20250418124718.1009563-1-jaszczyk@chromium.org>
 <20250418124718.1009563-3-jaszczyk@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418124718.1009563-3-jaszczyk@chromium.org>

On Fri, Apr 18, 2025 at 12:47:18PM +0000, Grzegorz Jaszczyk wrote:
> From: Grzegorz Jaszczyk <jaszczyk@google.com>
> 
> The DT reserved-memory nodes can be present in DT as described in
> Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml.
> Similar to other architecture, which supports DT, there is a need to
> create reserved memory regions for such nodes.
> 
> Additionally, the x86 architecture builds its memory map based on E820
> description passed by bootloader and not on DT. Since x86 already has
> some DT support and allows booting with both ACPI and DT at the same
> time, let's register an arch specific hook which will validate if a
> reserved-memory region passed by DT is valid (covered by E820 reserved
> region entry).
> 
> Without this check, the reserved memory from DT could be successfully
> registered, even though such a region could conflict with e820
> description e.g. it could be described as E820_RAM and could be already
> used at early x86 boot stage for memblock initialization (which happens
> before DT parsing).

Sorry, I don't get how it conflicts. Wouldn't the E820_RAM be registered 
with memblock and memblock then handles the conflict (or should).

Rob
