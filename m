Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C8C9444;
	Wed,  2 Apr 2025 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582271; cv=none; b=gNevdFenTjJMxp79OfOyp3rmcRB/UPYvNo61b1r4L4LstD7Nq7DQKlEL9HAKk/ADsMWs4AoRl8L2HW8hrRyI8xygPERmbSwf8jv2gBs0FlWG9v0JyKsHYABWyutf5QTxij2ng2vphFefkzNE7hIhF7nnxkqSf5lwmwdWCaAKi3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582271; c=relaxed/simple;
	bh=gJTIWAo+mu6QnQlOUikh3g6htCbJXhBr8Ndes+q9IC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nH4w0Tbnd510QffYh4sUZ+XTj2tHmdUR09RQgEUmfA4tGjFJQux8Vm23o5jqvxgWjiNs5S01swHym5/BdJht+ipZeFESEr/uZ6IN0o2UETTA9aeSHr/LLEhwTEDFhxfKF2oZHO6KuZ5jpXxfpwwtwWkZoEZDjbGC5wOlKZAfsf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8Dnf2Sl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8Dnf2Sl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61003C4CEDD;
	Wed,  2 Apr 2025 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743582270;
	bh=gJTIWAo+mu6QnQlOUikh3g6htCbJXhBr8Ndes+q9IC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h8Dnf2SlDrGknfsTX8nPHtK3B2sAVQ1tzQh5H48VXouY5xcvihoC4Oce8Bpj77NRI
	 xhaetJ5KvQvH0qVBAub/SzRQ/djkA2ruTfygqKhPcTS67whyrsYOuyxqY2IFsYc905
	 EpPA3Hv0jzfjhTZexuu8niKHhO+y7w8/TVHoDQNwDR5BdwUBKKT/pCn0KypDlLj2//
	 4oAIjynHHrzbzIaG+8oBBkSli05agdGgllmut7rhkfiqMrd9QMsvDqXl0NDqcjhxL9
	 UdMaZ7oF05WcLzUMDnNsVvdKIlaUhwHwQFYFNNFp7YGO5EHItYbvZ+6mTkaBPml2WO
	 E48PrOp4bAkwg==
Date: Wed, 2 Apr 2025 08:24:27 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Slawomir Rosek <srosek@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	ukaszb@chromium.org
Subject: Re: [PATCH v1] platform/chrome: cros_ec_proto: allow to build as
 module
Message-ID: <Z-z0O4KafHMVZquk@google.com>
References: <20250328132612.511471-1-srosek@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328132612.511471-1-srosek@chromium.org>

On Fri, Mar 28, 2025 at 01:26:12PM +0000, Slawomir Rosek wrote:
> This allows to build ChromeOS EC communication protocol helpers as

s/This allows/Allow/.

> kernel module which is particularly useful for Android GKI (Generic
> Kernel Image) configuration. With this change the ChromeOS Platform
> (CONFIG_CHROME_PLATFORMS=y) can be enabled directly from the vendor
> kconfig fragment whithout additional configuration in gki_defconfig.

Does it work?  CROS_EC_PROTO is "selected" by other Kconfigs.  Wouldn't it
be either =y or =n?
