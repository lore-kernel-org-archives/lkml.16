Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCC017BB21
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970388; cv=none; b=ZMvQoClweulH0ShnR8fxG0t2rm5QwyapymFYn3TVpktph71gbvTZxAoPHpN42YKo9WCuZwXdJaHPl+gM/V0hL4qkdtooRVcDtYR6u70WlxQBakYQfvWR5SiwcbrKNOpZcCb/xJZpKL1Oy4JACPGOvobq/9ys3uuo1SrhzEdL/Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970388; c=relaxed/simple;
	bh=X95ZllVOiPEaND+UrBHQGK5TGyMYk2cUxwQWZfDArFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nonNkNBOcxD8tTTKh7AEe1TIDA/HmDhOKlb716rzt4YAnsQur+5KynpTbFBvOy3eZol3LF54EkOxifXI4IJMNhGDCh8qLFywvFVioeqNrlaDfda9FKMEBSQpQMT9GfnWYzSG0AD6dK+z4T8j2Pl1Ft7KrV/qKjgfuBT/tiJp/pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRk+TyWR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRk+TyWR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4801C4CEF1;
	Sun,  6 Apr 2025 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743970387;
	bh=X95ZllVOiPEaND+UrBHQGK5TGyMYk2cUxwQWZfDArFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRk+TyWRT2G4xP0H3f5IGbZfaC1HmFbRrc3bcIcmmBR08BjW/NyfQtcR9ybnlJ9HE
	 coJC8FxZ4nAOHxw79j3V7oWt/lNCkPyKEo3L/ihwcgW3WGjkOZv+RBam5zaQQR2sHH
	 Pix5vX8q710gIMvTvKzn2gp8dGqUpWfF/ybVSBn+1rEomFgCCp/AY7Zse8w359pDh/
	 nJqUerSWnMRLM6e8pzJqJ7L+vwyu0beR9sKLdAiMruqJSAKAaUWHJbDsnFSh1oAx36
	 R1byJVlZCTCIkDyeiz5HuULIvu9zM9Gff4+Dx7cNbCzxJAjcNzvAwhDcveUbyKshKz
	 W8pYVloSj/hLw==
Date: Sun, 6 Apr 2025 22:13:04 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: turris-mox-rwtm: fix building without
 CONFIG_KEYS
Message-ID: <s23b6ai3dx7k66jm4onvzjjd77n3uykmzd5f7ez3nwqs5chpzs@c55lefqqk5qq>
References: <20250404135531.2421755-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404135531.2421755-1-arnd@kernel.org>

ack
