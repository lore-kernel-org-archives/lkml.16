Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF731EB5DA;
	Wed, 25 Jun 2025 05:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831107; cv=none; b=VYwRerr9uiRlzbKGTTNI1LYyxvxnMLcd+W7LRelNLb3nu70ul2QiTlixJIkvwzrI4KtfQBzz3/TIb6sD6fp/LjlOHqO5razzhtftSQnSwISWaP9M2YZELk79/JHEjuMAkFJ0TdAsgw0xZOVz7rNgVHnFuaNSSfCsBDHY/JeYcaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831107; c=relaxed/simple;
	bh=g1MLqeR79hOYUxWgeeCPpoArtcMqIScphcNaGj3edpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kawFnn/SBq268bb+FopFp08TulG+2LzKOfyqBtwbfrDYTEEwknmyQWYwTfXns6I9NDiDEfEUu0A0mJFOc8ETgh5SVchDxFzhB+z9J5/H2syK3d+ow8FcCrxm5exBTKTo4XGyfQhleU1kDKrPrjVo3iHkZxJVFRBLVs/bC0bFZdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXAPXuzl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXAPXuzl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD7DC4CEEA;
	Wed, 25 Jun 2025 05:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750831107;
	bh=g1MLqeR79hOYUxWgeeCPpoArtcMqIScphcNaGj3edpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXAPXuzlrsFWc32EldsNWABwtej8qqOZsemQsFulk/cVDjmikbaDK0rP0sYT5HnJR
	 bchNCSpgKhfqm3V40jGRIiRuhLLt29M8oChOuz7/1sYtT2kZOqo7o+HEu/bMaQnXjY
	 Tj2xJ2DVLO77LDU928etAgqkyECRfBkg75DxwPJpUorwxOqW7vtlKWugBdazaO/N42
	 mfUBFC8M/oTqbnwt2kdW4Bro6U9+OHeAfCU2ujrJZYwZtnZCgG9Wx/R3e0SXqGFHh0
	 A4tiEudrvmnDm8ePCrTl4wE/a87KidQdGnxB7njMCe8EuYNH/FN2p8saFspwLONhm0
	 PFCQWYYBC2Agg==
Date: Wed, 25 Jun 2025 05:58:24 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: Re: [PATCH v2 0/3] firmware: coreboot: Support for System Management
 Interrupt (SMI) handling in coreboot payload (MM payload concept)
Message-ID: <aFuQAG4-p6FnaPQK@google.com>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>

On Mon, Jun 16, 2025 at 04:01:11PM +0200, Michal Gorlas wrote:
> Hi,
> 
> This patchset adds support for MM payload when Linux is used as

Please provide some annotation when you first time use the acronyms for
readability. From the context, here MM stands for Management Mode?

> coreboot's payload. The main idea is to delegate higher-level SMM
> functions to the payload, limiting the coreboot's System Management
> Mode (SMM) related responsibilities to the minimum of basic SMM setup [1]. This is
> done by loading a blob with SMI handler to the shared buffer, from
> which it is copied to SMRAM [2].
> 
> The MM payload is still in a Proof of Concept stage, and we are still
> working on getting the patches needed for coreboot upstreamed, but I would
> appreciate any feedback that you may have.

I don't think I could provide any useful comments to the feature. Only
feedbacked some general comments for the driver parts. 
