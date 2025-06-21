Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5D721CA14;
	Sat, 21 Jun 2025 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750521835; cv=none; b=BKmlGpjeoMBOlrdX6HBQZiOGSy6rlCxeOG6AtH6Zx/sb8BHDczJU2n8TWKqK0E2egItx7rL4f7qCZbmAyYqVhSsrql3AyY3KixNc7EnpoTqT6g0rPIdCX67C10S66A8L1L8tT8FAbpoXckXh4XDPqzghovDFvbB5bkC0AZNo3WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750521835; c=relaxed/simple;
	bh=fK0szu7oKlcx4ykmNjXo08CHT5AcRlE5UnCS2Rd0ivU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtFAj3epPbTp7hXWNRGfZYj8xuC3C5I9Ohvx854wEdhcdqDPbHPFdJkeqcZcAwD354EJBodSldBPN5SuNcXqkQicjbpeID7mtsd5/tP5tSW2TZizA4sD9Z4CbfEVbqJYnB6wrG/eBiMxaTYTrrbKSYULU5iHLOQyJfqD+dHafwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+fEWf3J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+fEWf3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37C1C4CEE7;
	Sat, 21 Jun 2025 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750521835;
	bh=fK0szu7oKlcx4ykmNjXo08CHT5AcRlE5UnCS2Rd0ivU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u+fEWf3JpwaQFvkurB2cj92/djRgmEnGIJEl/mdWXIDbOTH6jDwNn+smq87gvEsye
	 AHgqB+9DY9lSohUc8SQeXlqHSMdQx+vXQzyGbvLvCVQgfTqH8+y3Bky1JitoAOr/8d
	 vikt6nrEmTk7LevSkyKPD4S/C+UQi++L8dBwQzFJGhBXZzM6y0k1KvOQqw4hjvdgo2
	 /mpgXcomEDj5y/vOKWA1fHDoQcQH2dEZN2C9tm+lCX/en02EmtVDx8tCXP9o2GAdXG
	 BeG7V07ritbMdx/ZOP7zS9wNpTlqdOt7VpBnlpJgtqG83FrdoZ0GfD6t+aLV9c9ydg
	 0TmmFq8UUK0pw==
Message-ID: <5e0a5cac-b88b-4721-a516-b179f9cfd3a0@kernel.org>
Date: Sat, 21 Jun 2025 18:03:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: Add Apple SoC GPU
To: fnkl.kernel@gmail.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com>
 <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.06.25 23:17, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add bindings for the GPU present in Apple SoCs
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven

