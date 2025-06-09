Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB0319EEC2;
	Mon,  9 Jun 2025 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504029; cv=none; b=YkC85MTFgJ0nWSCqallnorNkaRpWAxREe/owOz97NrBvRvk+ZcJtRC5+P9rJx6m6MFCv0VVTvTA8Tdbr2D+d6mGOlhceOakvgCDjIPtLn1qOF1eGNj9N5U7wGtPz3B3Bz0OsWbX9si6ROuFCA5PSsmsXUHB6U3K0eNYHc2/vUkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504029; c=relaxed/simple;
	bh=cMuPBuufB6+XOxaqq4MpKQjJ8hvEUaAbzl/ATSQbcTw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LyiQTbd03iq7oNLD8qIyg3c5oOYcVsCDnF8hcitJlvjIwP2jXrVaRXdmU4lChexdNFF3YwdqvyxM/xp5VJgy30W+q/s0nA6QGf0ZQmRyH+JTTuBj4UYsboCaZQ/vCX1lX2zStbQlTLhRoKmSQYWwJ4PcMIbxoIqM3Bier28Pryc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlA8hM7J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlA8hM7J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD091C4CEEB;
	Mon,  9 Jun 2025 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749504029;
	bh=cMuPBuufB6+XOxaqq4MpKQjJ8hvEUaAbzl/ATSQbcTw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nlA8hM7J70YpqSDVBrSkAKdJ4B9WYuhZwyoo8RQZlaQnbgLc/ff0bfCHR5melXILC
	 eGEEtG2mNnyPFAhSUJRF+V0BIDjKzsRRk4P9HAhfe7vvKuLQKZU+gMSKr582GGdmrO
	 7rKpdmIHGqQbc5m9/bW7yVgX+jYohWpVoeigIN6dedIaq8kKb8+AJ1oAkvKeIxEFXc
	 G45sQwn2wIB470lz81EDExgjH5ctB/CzNPsfQnzvioYVCs9yvW414Copw5OWExmY2H
	 S+zuV7mo2vDa7123krAQzc6LIcVt1rOaBNjotds9XwFaBZop8GmMnVXuGHaXA8IoKH
	 1n1jdxsdiqdvg==
Date: Mon, 9 Jun 2025 14:20:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Abin Joseph <abin.joseph@amd.com>
Cc: <nicolas.ferre@microchip.com>, <claudiu.beznea@tuxon.dev>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <git@amd.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2] net: macb: Add shutdown operation support
Message-ID: <20250609142027.25d1e58c@kernel.org>
In-Reply-To: <20250607075713.1829282-1-abin.joseph@amd.com>
References: <20250607075713.1829282-1-abin.joseph@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Jun 2025 13:27:13 +0530 Abin Joseph wrote:
> +	rtnl_lock();
> +	netif_device_detach(netdev);
> +
> +	if (netif_running(netdev))
> +		dev_close(netdev);
> +
> +	rtnl_unlock();

nit: could you move the netif_device_detach() after
the dev_close() call? It feels a little backwards, even
tho I think it will work just fine with current code.
Also nit2: you added an empty line before the unlock
but not after lock?
-- 
pw-bot: cr
