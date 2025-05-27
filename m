Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6941E51E1;
	Tue, 27 May 2025 06:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748327277; cv=none; b=b3f7x8lxIxQIiYJuXQ/eZk5b/B37HQUReFl1/YLcjkk4NRFZg7gbIvpZdNEU5uFOTXnvb3o8LZGBLfV6MYy8o5cWCOQI00A6BMgYn/seOYw5ENOLzumwtHJRGi6bO/eokWfA4qxqKH0fpg6GyYu1FHWqEUHS4VuiKaoqk5e1jgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748327277; c=relaxed/simple;
	bh=+sELbp8YRRY7fuTDVxVNE0bI3IM895ApE6C3fnACgwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h67HYp9JYtzyxkdkL8YtW6mGJX3thvL5a8ihqSIfiypLy8INAzT9HPl5xae45iJ6E90Z/XU9EmiJSj5DBqziP9HUjoPMMI4i/WI0Ugr7mz3vizMiktU5vZ66fgbPScF3mc3c9d1RqFF28kIMLi8a4zd6iwg6ytXZ4LmZdX9XKmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEXB+vYd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEXB+vYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C13DC4CEEA;
	Tue, 27 May 2025 06:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748327276;
	bh=+sELbp8YRRY7fuTDVxVNE0bI3IM895ApE6C3fnACgwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dEXB+vYdt/2KozeRJGxtheYoq0RKHzgQuhcfQlsq6nMQp+OFkeAuVfl6OpSH9kYbt
	 Ev+Gzx9Rsx3ZXFlSh84RmptW9uQQdN6M20Naef6KNgPochKS/n5e2k89P/rcpD0XIp
	 YgjeeOJE4ovikcL8BjGBKuYeyKVDWU6EugZwT1RVpal4QZ4cnn6H+ueTAuHdxAMicf
	 p1xVVNWE4yDYf+nnGCY4FcAqZltSFObu5IRog3VoQurGXYiQ8FvILwMLTJ+lph0R6v
	 SZbcNuQSIiGxpeRM6h5D9CLKx8qnV93lQmYMXrHd6se8vGpu4L6rIHB33zWtCNycF/
	 od5vo/aBkYcJg==
Date: Tue, 27 May 2025 08:27:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: alejandroe1@geotab.com, Johan Hovold <johan@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: gnss: add u-blox,neo-9m compatible
Message-ID: <20250527-ubiquitous-super-bison-babfac@kuoka>
References: <20250523-ubx-m9-v3-1-6fa4ef5b7d4a@geotab.com>
 <dfd63c64-184e-4e48-9344-a3db0612036b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dfd63c64-184e-4e48-9344-a3db0612036b@kernel.org>

On Fri, May 23, 2025 at 01:52:06PM GMT, Krzysztof Kozlowski wrote:
> On 23/05/2025 13:19, Alejandro Enrique via B4 Relay wrote:
> > From: Alejandro Enrique <alejandroe1@geotab.com>
> > 
> > Add compatible for u-blox NEO-9M GPS module.
> > 
> > Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> > ---
> > This series just add the compatible string for u-blox NEO-9M module,
> > using neo-m8 as fallback. I have tested the driver with such a module
> > and it is working fine.
> > ---
> 
> I assume there is a user somewhere?

This question is still valid.

Best regards,
Krzysztof

