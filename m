Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCF4235062;
	Tue, 10 Jun 2025 18:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749579930; cv=none; b=LXhwup0OOOqw1QArz30veM3+RA7Ttzkf5j1f5ZsScwplfBO7jUaNo9UnZBp4sZkUyTcf5An26JZKdab7CIPtSjByutwOJqOaVV35xemTkP8xYXON3+kOd2e4h5VXqFFE1+p3fvCbeP96iefsv7CU1jnKDo7CpDRzbKRc7ePIj54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749579930; c=relaxed/simple;
	bh=vV+zLlcDSXwtI6VzeEwGPed4NzhJqKATMkkeQ6fc7BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXUyWh7PQhQB/aC/ZYMniqEOBVE0EAs+lq8n2om3IuhQDhOuztLNH8zSGWC/PHeKjUTNkQ+0m37FGE9qyXGeH3RQsw/3dxfNRXeDe34RJeqzy+A7kCJH9rTAN9VOuYF9IIFMODZ6+CVVc48k0mwRdTzZB40k+aZMMVgE+tV3cXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1grllPP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1grllPP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7190C4CEED;
	Tue, 10 Jun 2025 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749579930;
	bh=vV+zLlcDSXwtI6VzeEwGPed4NzhJqKATMkkeQ6fc7BY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1grllPPHXth1TJlkbaw4qXNOwj+92Ex/TvtFotue/oourA6MJVvYWIxlZmSdl4Ym
	 5aM3anf5/kYMb0RdQ4aE9OtniMf3ZI6Tv5owKL9oD6MGzD0oeYLmMJY9Nu6MEHEXRQ
	 aszZWaUsYTwHv1+mOiHQYAlck++1Vz+RM9Cw3C5AFtZ7zkMK8h5EfZBy0ZHknDaFHz
	 Hlv9PwUB/0qMFBgtQAlTHTo9Ly5IaN5dQ9FOAvMqY42XjXBqniEaXbT8CJ91VGEbHk
	 vognlTrhTUxYYG2ABpcgudfKEgAzn4J/UUy2luncTwM8HHbSstolZRJC48+HIg520J
	 f23unPKzuG79Q==
Date: Tue, 10 Jun 2025 13:25:29 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: trivial: Add tps53685 support
Message-ID: <20250610182529.GA2478194-robh@kernel.org>
References: <20250610102556.236300-1-chiang.brian@inventec.com>
 <20250610102556.236300-2-chiang.brian@inventec.com>
 <99f846c6-4041-4d68-b2f7-c686aa8c2bca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99f846c6-4041-4d68-b2f7-c686aa8c2bca@linaro.org>

On Tue, Jun 10, 2025 at 12:41:15PM +0200, Krzysztof Kozlowski wrote:
> On 10/06/2025 12:25, Chiang Brian wrote:
> > Add device type support for tps53685
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> > ---
> > v8 -> v9:
> > - No code changed, correct the order of Acked-by tag
> > - Link to v8: https://lore.kernel.org/all/20250602042454.184643-2-chiang.brian@inventec.com/
> Stop sending this to me 6 or more times. Every version you send multiple
> times, that's way too much.

I only have v1, 2, 3, 8 and 9...

Rob
