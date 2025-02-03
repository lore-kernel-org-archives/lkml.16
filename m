Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC020211A07;
	Mon,  3 Feb 2025 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738623944; cv=none; b=afuSJghnSZFw7jg0/5nFwGr0JRaxB+Zs/uNyRcQdEugw2V1R0VoRUjdeU3eTWTuPXwWb1pW16WtRddaCmR9CoB7RzEDgG8QmEkr7km3lqvvNmqszJb+zg1ZxvyOpd2t+Bu/nHFPhsRt9mR8JNJQWVmbno4CIsxbD+F4oPOmYtEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738623944; c=relaxed/simple;
	bh=I5tThkY58MIXwmPRE79kDyvNP0k17+Se/rPn1Ph6njQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiCmM31XshRwHnwKKGUaH/K/w70t5HJWHIHsR4+8+6ZZ7TaUEGqLVCFfY7G+bDe0uwRve++bGasbGNiDd1sa4Zx2EFflPgotqCQAb3AJaitjSb5wILKoEW+9uG3Bdc+ZHdYy6KL6q9G/XB6IH19YiQZ7HOY2K1/PS6SlhSHRqUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBGCaUtz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBGCaUtz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B2DC4CEEA;
	Mon,  3 Feb 2025 23:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738623944;
	bh=I5tThkY58MIXwmPRE79kDyvNP0k17+Se/rPn1Ph6njQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBGCaUtzvOxHO8GBP2eECpz8YLaf0GaYSTeugJk84ymUIAUj57FosRywdBEG7fw4K
	 tNT4zpF6CHoCRMwPdaYuOS575s4G+9uMIJ4V60VBs4n+f6A5oHjI/HMHbwC6tLrAkO
	 Fwz2knwZ4MN/JMOAIlW4lToVFf4lKs9H3GUrC6tU8V6Yo8QzboHSsZy1CaDRVJiGHc
	 rpA4D/aY0DEEjI2cMZ5mEysUJMsvKCQMXplqqzQfcrAkFmFlFVgxJcJnFVWIMdk6MS
	 As4j0dETGOy5lWWaZ2Gn6gDz+Fn985VosletOFzLd8bzlZYrFm6zUnMoJcNeHvoAE9
	 tEH/47YRT0wXQ==
Date: Mon, 3 Feb 2025 17:05:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Ferry Toth <fntoth@gmail.com>, Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: dwc3: Add a property to reserve
 endpoints
Message-ID: <173862394233.512701.17343597756592829862.robh@kernel.org>
References: <20250203191524.3730346-1-andriy.shevchenko@linux.intel.com>
 <20250203191524.3730346-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203191524.3730346-2-andriy.shevchenko@linux.intel.com>


On Mon, 03 Feb 2025 21:10:53 +0200, Andy Shevchenko wrote:
> Some of the endpoints may be reserved by hardware for different purposes,
> e.g., tracing control and output. This is the case, for instance, on
> Intel Merrifield and Moorefield platforms that reserve a few and USB driver
> may not use them for the regular transfers. Add the respective bindings.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  .../devicetree/bindings/usb/snps,dwc3-common.yaml     | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

