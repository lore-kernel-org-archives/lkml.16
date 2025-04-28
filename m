Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F01119ABC6;
	Mon, 28 Apr 2025 17:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862567; cv=none; b=Ov2RJ8HngFJ+e5aUb3lRpsC9EF3ANi4aCESikxr22S5cQ0r0Hmf75XNu45vXu8Rh6pedYDVV4o8gBsRFLsFkXNylk8aNsIUKZAY6kvQb8DJM9eJaMMJNNIxlCCjOTuD2D1nHSRbar4aOCHf5viXBUYoe4jLfZQOpf3R4s561jK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862567; c=relaxed/simple;
	bh=Cx88xJyEUUBcP16+Gaemcgw+vTlMOvqcht8PV2BOsQE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XNNG15/OKc/sANUggn1VJU7vBWkA/Re8gBwsRPEPj7SFRYcw8mYOi6QIW6bJXzMiNOlaTGVWOA1RywFOBltsklPEMraRs5qS/JFsbRWwOnjkemyg38wtF8DBdqfYFS+/ju2DLspjTfSySFx5gU7r4UmpFMdTgDw+O5HoLEvuJck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGXMz21g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGXMz21g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64313C4CEE4;
	Mon, 28 Apr 2025 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745862566;
	bh=Cx88xJyEUUBcP16+Gaemcgw+vTlMOvqcht8PV2BOsQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jGXMz21gwzY4LObWrhvdb7NheZ+SM3//+OYi6ygHu/2M5scLwHbyHPD0DdyGVf4zI
	 SfZfzKdShCiIPuYy2fsUIZF8fsyUmCu118r4X1OaVPIMDUjmn96nzESoRJPMIbVxdy
	 D9p+oK+4IIiFcoCRFWdQeUnsfrROUhjXNFvCuIm62O8Ii6EbcpMmOD1MeN0v0DTS3o
	 oXaR/qJF1DPOSlEarMVwjT7cS7WStHT96OimpyxLEfwvGqxTV/qtkeLJgFHUvoRNqT
	 d3lDYTHuUivCDjUGJYeXfMO5oahDeQdsQvgMHCIqnqBQ7ADh4afpOCq2aKEE1KJhUB
	 u2nRHHvu2CSlw==
Date: Mon, 28 Apr 2025 10:49:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: pmenzel@molgen.mpg.de, davem@davemloft.net, edumazet@google.com,
 frederic@kernel.org, hayeswang@realtek.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, romieu@fr.zoreil.com
Subject: Re: [PATCH 2/2] r8152: Call napi_schedule() from proper context
Message-ID: <20250428104925.1ff7ad41@kernel.org>
In-Reply-To: <9b822fe6-699a-4fe6-88c5-1e92e6a6e588@math.uni-bielefeld.de>
References: <8db2e1cd-553e-4082-a018-ec269592b69f@molgen.mpg.de>
	<9b822fe6-699a-4fe6-88c5-1e92e6a6e588@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 27 Apr 2025 22:50:34 +0200 Tobias Jakobi wrote:
> Hello everyone,
> 
> I believe this is still a problem, correct? I've been carrying the two 
> patches in my tree for some weeks now -- otherwise the network adapter 
> in my USB-C dock stops working randomly.
> 
> Anything I can do to get these merged?

Which kernel are you suffering on? 
The fix is in 6.14 -- commit 77e45145e3039a
It went in without Fixes and stable annotation, tho
