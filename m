Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FD72110E;
	Tue, 27 May 2025 17:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748367183; cv=none; b=gU7fRi8ewGa7s+B+kuIdVgC1pRwXRIS5JYJy/nWej3iJTv1HLPymZMnd3Q8Ojd3lAx1ZyryGwAK858J+ekVogF9X5VHUPXZehWukQIvdho1D2YzVQd8I8UUW3Mm0waA1RITa4IZnZmJmIEVuDniOzViUt6KjxYyce0z1vr9oKL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748367183; c=relaxed/simple;
	bh=pCLTy3LXAWqqFA4OATDMnN2LK941XT/HplJ0FPKZugg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUEG6wbhbCnd1ifRxXGgjLAZb8fVCJ/HKGs1tWjoPUSUBHywtQH+h2rcP8L0u+CAABNBUERGtPzr+E2yyVpY46Hgq8ygWcnpqlpBzfErKskWEbyiOMav8I5ltzOXHj0Yn7S2F4957HGXXH1g+XSarvnMYc1ilQ07ZQmuUE1Ix/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qRpp5miN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qRpp5miN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4F4C4CEE9;
	Tue, 27 May 2025 17:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748367183;
	bh=pCLTy3LXAWqqFA4OATDMnN2LK941XT/HplJ0FPKZugg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qRpp5miNVoenYdyoAzjCQA+RXRrUZs2qreQ2g0usCAx9bZil3C/RrWUXY1rh5C0uS
	 i+Wp9pgA4d5ERmJ/ppdEmJNFvSg21ezc5H7W9bHHXcskiP60QC/HT9+pgkDgT+CBa8
	 /2AZ7nfh85S5aIpfmZNlrfpvogcau1L/iCdgFGt7V5bP40dyDdM6wFXcDz7b+zbT7d
	 omemFA64qVyWPczpYYBShYu5hnWcfYNaWFZgIz5y1RTUM7FXYIyHwuBIiLRCGvpekz
	 dtd6fD6xFhy+wv7yeYw3I7zGY7fFydbYqBEhmBopTWSLfR5xCGCAKHGBPmgrE8xbio
	 rdla1VgQYMkeA==
Date: Tue, 27 May 2025 12:33:01 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, alejandroe1@geotab.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: gnss: add u-blox,neo-9m compatible
Message-ID: <20250527173301.GA756121-robh@kernel.org>
References: <20250523-ubx-m9-v3-1-6fa4ef5b7d4a@geotab.com>
 <dfd63c64-184e-4e48-9344-a3db0612036b@kernel.org>
 <dd1540f7-f4f8-4cf4-a448-aa91b71dd42d@kernel.org>
 <aDWXi7qBnkt3nTNW@hovoldconsulting.com>
 <c36055f3-c10d-4f33-a4bf-b6aff8f04852@kernel.org>
 <aDWb4ZlBgr_oSaGH@hovoldconsulting.com>
 <0225b57c-1240-4382-a15a-6fa16abdec14@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0225b57c-1240-4382-a15a-6fa16abdec14@kernel.org>

On Tue, May 27, 2025 at 01:14:54PM +0200, Krzysztof Kozlowski wrote:
> On 27/05/2025 13:02, Johan Hovold wrote:
> > On Tue, May 27, 2025 at 12:51:12PM +0200, Krzysztof Kozlowski wrote:
> >> On 27/05/2025 12:44, Johan Hovold wrote:
> >>> On Tue, May 27, 2025 at 10:35:14AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 23/05/2025 13:52, Krzysztof Kozlowski wrote:
> >>>>> On 23/05/2025 13:19, Alejandro Enrique via B4 Relay wrote:
> >>>>>> From: Alejandro Enrique <alejandroe1@geotab.com>
> >>>>>>
> >>>>>> Add compatible for u-blox NEO-9M GPS module.
> >>>>>>
> >>>>>> Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> >>>>>> ---
> >>>>>> This series just add the compatible string for u-blox NEO-9M module,
> >>>>>> using neo-m8 as fallback. I have tested the driver with such a module
> >>>>>> and it is working fine.
> >>>>>> ---
> >>>>>
> >>>>> I assume there is a user somewhere?
> >>>>>
> >>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> Un-reviewed. Please drop the patch. It turns out there is no user for
> >>>> this binding. We don't take bindings for every possible device out there
> >>>> - you need users of that binding.
> >>>
> >>> No, we don't require manufacturers to upstream their machine dts.
> >>
> >> No, we don't take bindings for whatever is there. In any case, drop my
> >> review tag.
> > 
> > Perhaps not for whatever, but here we have an actual user that needs
> > this binding do I'll take it.
> 
> Great, I understand above that I can send you bindings for multiple
> devices I have (or had and still have interest in or my previous
> employer has interest in), which are used in downstream products, and
> you will take these bindings?
> 
> That would be cool, because I have bunch of GNSS devices related to my
> pre-previous job, which I would really like to upstream.
> 
> Is my understanding correct?

What's the issue here? We have a driver and that's the user. The 
requirement is a driver OR .dts for the user. Are we now discouraging 
having a specific compatible for a new device that's backwards 
compatible with an existing device? No!

Rob
