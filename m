Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0193596A;
	Mon,  5 May 2025 11:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746444087; cv=none; b=Z/IjSGvBkUU5UTzJPohyRmAugf20AVbUsZWxGMfRZ1+lmpK5ULL5S7N890JLaQNzKXi3FrY0KGUPFLl6YSpMUlTgik43xp6daEdouzvH6xyphWwUKUU7TmH2xy7KIDmDOMcO4+5kgAzNC1Ed7tInLj6Ur+h80QrQdwyRxj+smiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746444087; c=relaxed/simple;
	bh=pFHoGF4eR/esOPyY0NpyPkrHPO25l3+a6P/HKWcIYSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDsmn8jPjIVGgapZeJv5+FWdIXRGucMw5C1heA6RkZPZofCpP0QzNYlZKx5dyfme2hcegR7KG7U7yLFo+WWQz2Ytb3OuC1cfauEbvA6Gx/lbVeAN4s5tfo2/CZJCzJoZJAJDKiUsON5k/IxT9ZaspLXbsckj341ip+NF18ZVnKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yCQg60dV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yCQg60dV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425E4C4CEE4;
	Mon,  5 May 2025 11:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746444086;
	bh=pFHoGF4eR/esOPyY0NpyPkrHPO25l3+a6P/HKWcIYSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yCQg60dVFD61b/qzkQ85VrW6/be3UgmwHAzhgKQQ7HZ3zuGVwE6RZnyl9BMrTfTXU
	 FjYAiDgMEOCQzaMG+xi/eTvdz0iVRMlvc/VG845qijmAA4rKtUhCmxsfExI0yHndm7
	 OIfsNDz9J7McIWoJZ8Hhpquf5uCvx0XlSmZ8OfmI=
Date: Mon, 5 May 2025 13:21:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: detect orientation in debug acc mode
Message-ID: <2025050510-malformed-outweigh-3dbf@gregkh>
References: <20250505-tcpm-v1-1-e6142985a012@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505-tcpm-v1-1-e6142985a012@pengutronix.de>

On Mon, May 05, 2025 at 01:06:16PM +0200, Michael Grzeschik wrote:
> For the debug accessory case, the orientation can be detected by reading
> the cc resistor values. The will be TYPEC_CC_RP_DEF and TYPEC_CC_RP_1_5
> in sink mode and TYPEC_CC_RA TYPEC_CC_RD in src mode.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

What commit id does this fix?

thanks,

greg k-h
