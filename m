Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410231A5BA6;
	Tue, 27 May 2025 11:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748343776; cv=none; b=l46XG1hkD5No4RMCOc7f6e10nfwVtFE529a5pVTLr1IqUBTRwNNUPlBdB9CGBhYGfsddQO7SVdxO5QNLu1QkL6cpsSpgdevkiwFZixY8KE71pOfcpUGv0h7bRsCa7acSQWiHsAQuqG3qqeMjP2ksXsXsbZfvMnurkCwFKULi98U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748343776; c=relaxed/simple;
	bh=iZOBoOJNMP1cX0PxAhnetfLEINkjoyOn94aO5yf29Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLDVQXGmkNxrnpn1GoBOIrbIZ8WgD4+BPzL6llaiWvJbgqNVvuEUX+e0+UQKzongCGJDO+tKWssEjKF+ELs7FGtBQG0DYuKQ72n9hOvFZJPCLd/X3hCNMJO+5ez/6s3yeixb5gLIUv4OrP99lcI79Vk0FdcVkMTkwBi+Mn/CCyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LH6euR4K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LH6euR4K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA60CC4CEEA;
	Tue, 27 May 2025 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748343775;
	bh=iZOBoOJNMP1cX0PxAhnetfLEINkjoyOn94aO5yf29Ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LH6euR4KfOox4qt6inqIQ/4H2CuB63VnYKu6vuw4ZGaRhIPGojtnEYt6jOTGOfXNy
	 mp8zEXMCWJhDWEqnswIcIHJG3NFYYK5GRKOkYqWB+5nzVesy2xJZeLI3jshSHhOgbU
	 rTRzAGhVv2IPIjk9csKqBWr9qg1ru3kxFPbLdZ7Ro15I+ZpMFR47CNq4QkSE7JSO+T
	 jyvJ6M4V8donIdKQmYL2qIQX2p3qfyAXMuIpD/DwqJpv8Q0sJsKhVmteHj65Tkygma
	 2opnk2N8iPv0kxhF7vb1pHszGA5P4a9Z0QTxoPTAND/XMX6YulbI8rwi2iGv1P0wwG
	 mLy6BAIvHEXZw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uJs5B-00000000116-1UDg;
	Tue, 27 May 2025 13:02:57 +0200
Date: Tue, 27 May 2025 13:02:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alejandroe1@geotab.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: gnss: add u-blox,neo-9m compatible
Message-ID: <aDWb4ZlBgr_oSaGH@hovoldconsulting.com>
References: <20250523-ubx-m9-v3-1-6fa4ef5b7d4a@geotab.com>
 <dfd63c64-184e-4e48-9344-a3db0612036b@kernel.org>
 <dd1540f7-f4f8-4cf4-a448-aa91b71dd42d@kernel.org>
 <aDWXi7qBnkt3nTNW@hovoldconsulting.com>
 <c36055f3-c10d-4f33-a4bf-b6aff8f04852@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c36055f3-c10d-4f33-a4bf-b6aff8f04852@kernel.org>

On Tue, May 27, 2025 at 12:51:12PM +0200, Krzysztof Kozlowski wrote:
> On 27/05/2025 12:44, Johan Hovold wrote:
> > On Tue, May 27, 2025 at 10:35:14AM +0200, Krzysztof Kozlowski wrote:
> >> On 23/05/2025 13:52, Krzysztof Kozlowski wrote:
> >>> On 23/05/2025 13:19, Alejandro Enrique via B4 Relay wrote:
> >>>> From: Alejandro Enrique <alejandroe1@geotab.com>
> >>>>
> >>>> Add compatible for u-blox NEO-9M GPS module.
> >>>>
> >>>> Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> >>>> ---
> >>>> This series just add the compatible string for u-blox NEO-9M module,
> >>>> using neo-m8 as fallback. I have tested the driver with such a module
> >>>> and it is working fine.
> >>>> ---
> >>>
> >>> I assume there is a user somewhere?
> >>>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Un-reviewed. Please drop the patch. It turns out there is no user for
> >> this binding. We don't take bindings for every possible device out there
> >> - you need users of that binding.
> > 
> > No, we don't require manufacturers to upstream their machine dts.
> 
> No, we don't take bindings for whatever is there. In any case, drop my
> review tag.

Perhaps not for whatever, but here we have an actual user that needs
this binding do I'll take it.

And I'll try to remember to drop your tag.

Johan
