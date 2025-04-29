Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A72C148;
	Tue, 29 Apr 2025 02:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745895145; cv=none; b=MktRE0bF9cuO76q2Q+r/KM+kRQdODun3ProqCUvdC4GKZgoNkD3Iw7Es7PvKIUqF0Xa9GFKRh5Xjs5eikvmKlRHhf7RFj5q+0NOZoDuqEPfjLOTPimOXaYu4RVwkIYvYyE7BEiBB8n5ZEOUYigfS9nlbLy1cRxr3ECqIc1V9gHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745895145; c=relaxed/simple;
	bh=lBuIFGFjBZJ5imQSXfGrcMnPzqcmQI9mGKZu4cAnHaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqiP880FKSeRWDRXow+BfgkfzYVg5/lC+mHKTfMazVaLtm/5/DAVfqRpRNLlYxqPDa+RLPYavWMOQ+qXJxgaYkQ8A5Ct+VfbN6Y7gDGTh1KMb4vuWRoW25rHFbGl63U9DzF9dR36Q79aI7nWTHTO3BSDvttONXw+0MChRurSvB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cC3veEzJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cC3veEzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131B5C4CEE4;
	Tue, 29 Apr 2025 02:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745895144;
	bh=lBuIFGFjBZJ5imQSXfGrcMnPzqcmQI9mGKZu4cAnHaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cC3veEzJvT//ZfKliSAf9eAiUBQsjBWVA1LSV6WCEf/sHj1Vm0DITzqUZWv3QUm0w
	 Kv5pDyYhSHqIqWQpat1TUQweCSoCS36C7z1ht41MITcYmafUALVY1if6PcJf/k81iC
	 Z3PY18Mfr5nkhRPWKE46xiuBKxotSaTWzWDxQF8Xv+ibOpaHhA0b/7dTNUsByOBoFa
	 cB2AH6ZE1m5XKvoGNgW7iimW10tnWL1yjbZAqmhJQtXroCWSlfAYd1VvzPpC7w1knf
	 Vu78WSO1N0IEpRfZVuSTmoaAiV6v3OoVL77GwsUw6dk0bHoyCqir0E4ZI4eaNTbQyp
	 sdtB2QZzFrlMg==
Date: Tue, 29 Apr 2025 02:52:20 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: abhishekpandit@chromium.org, jthies@google.com, akuchynski@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	sukoo@google.com, bleung@google.com
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: Set Pin Assignment E
 in DP PORT VDO
Message-ID: <aBA-5JsyV3MdmIjl@google.com>
References: <20250426024810.3876884-1-bleung@chromium.org>
 <20250428174828.13939-1-bleung@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428174828.13939-1-bleung@chromium.org>

On Mon, Apr 28, 2025 at 05:48:28PM +0000, Benson Leung wrote:
> Pin C and D are used on C-to-C cable applications including docks,
> and for USB-C adapters that convert from DP over USB-C to other
> video standards.
> 
> Pin Assignment E is intended to be used with adapter from USB-C to DP
> plugs or receptacles.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_typec: Set Pin Assignment E in DP PORT VDO
      commit: a9635ef0ca12e7914f42bfa7ca6a019f606c2817

Thanks!
