Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5789F4174A;
	Mon,  7 Apr 2025 02:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743992187; cv=none; b=k5ydsZ0ru5zy4mFD/NKcDRw8DFI/1bEQGPpZgqyZZhhfN7EFBBhh+UAyIhNDZAUynxMK64TLbhMSftH10l9IdollBjjuAecsrtRDrutKG+st/KEuHIy6zqEhNHtVFMYGMAqWPhdY8yTPWQa47Fhn5wsiHt15cLzGdKCXBcU3+qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743992187; c=relaxed/simple;
	bh=3rHspDM4Z5rVXG4tA5JfDXRtzhVtLN/iGOYarrS7OaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/1C4dZPlXtRfiTVVJ9Q5ki67rFuhRL5VQHOFrlbTE0CClz8jRDHc8kk+Yw7We14EYIAQcTzgOiG86wFQvB8itBo5sZsz33KMGPavinNUquFdNAlFLFeeeyg+EQ+ZlYT3y0vmfZ8VhZtRFIYgFUXKMenr7K0a1+/et1Zm5WJFJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nd3On4L0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nd3On4L0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0528C4CEE3;
	Mon,  7 Apr 2025 02:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743992186;
	bh=3rHspDM4Z5rVXG4tA5JfDXRtzhVtLN/iGOYarrS7OaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nd3On4L0RRnfdW4UpVrVDTfvgyoJBRLKLksqf40lOGeFMZEr6wCgvvEyslc82DDDc
	 Uw8fHsH92SfvGU6SrO3I+pspMWlDmu6D9YZ5d39BgBuIBet+Df/f4Ae2eaqAKjrlPZ
	 rM25M+WsfVymcB8XLe4/GHJQqM8OZlrYH4zHeU7/NJIAV5kZiOJ8XAtT+RxjvR2+Xr
	 25EKDktVGqKHqZ9vi4OXiB++uepdgzQQ1Jl260KCrLKjXX3a/wcLdz0rHaVTx7LfGv
	 MPLEiibWo6n66Hd1vg7oXL6WyxEsuMiv7JzqfWLQrnba5W9EgQVTEnYkkQduMiLaJT
	 s5mn1ZsHglNAg==
Date: Mon, 7 Apr 2025 02:16:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	bleung@chromium.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	nfraprado@collabora.com, kernel@collabora.com
Subject: Re: (subset) [PATCH 0/2] Use ChromeOS DT hardware prober with MT8192
 Spherion trackpads
Message-ID: <Z_M1dti05ZUeTfrG@google.com>
References: <20250318102259.189289-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318102259.189289-1-laura.nao@collabora.com>

On Tue, Mar 18, 2025 at 11:22:57AM +0100, Laura Nao wrote:
> This series marks the trackpads for the Google Spherion variants as
> "fail-needs-probe" and makes them compatibile with the ChromeOS DT hardware
> prober.
> 
> Laura Nao (2):
>   platform/chrome: Add support for Google Spherion in HW prober
>   arm64: dts: mediatek: mt8192-asurada-spherion: Mark trackpads as
>     fail-needs-probe
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform/chrome: Add support for Google Spherion in HW prober
      commit: 8dc528bed728ca0b887d9d5edecbcf23d7fed5a4

Thanks!
