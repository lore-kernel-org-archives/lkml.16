Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5DB3196D4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470537; cv=none; b=lVsnkBywTke55l0qZNUfO0EjVP/W9gQBJY7uMuIUZAiMGXrW8PRjaZ45BGdLr+RBbJOxaPdRJhQSwdyIG0qnYZg9KyQNQK2rmSpOtyb2mVBAXh+nqC2XP20aFBRi+6Gig544SUM1N35E4eBzbxI+kWeu7dBY/PxVMrq2WejOr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470537; c=relaxed/simple;
	bh=Kc79dqolfdMivEjozLvUnizcJnpqsFrOniS+Oju3Cq8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XrYja/8VQhObJlzPO6+g2OvpvuLd0tLXFdbVxFI1Img2evOp21T0Ax+WOUkFQpNG2B++iovs++e+2tnORxAQqGrx57ClHGnqgd/H1uXDRs0/cbi1kjaaS8sKOqL5SIhFDHIQErY6m6dqqxfQ57h7fDHRv7TxqPbReF0y9GyYrws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grFoTW+Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grFoTW+Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04899C4CEE7;
	Wed,  2 Jul 2025 15:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751470537;
	bh=Kc79dqolfdMivEjozLvUnizcJnpqsFrOniS+Oju3Cq8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=grFoTW+Z+6g/YF6pmMrOyrs+tYqRdafTxkKvCRjkzKOmztetAUyDFXcTCL7UwgyNa
	 3/HFiX4jCyu8b9Jv9jKdOUqfbyqR6m4r/KOAk8+S61n92BxDi4jYOZ5Cg9SeO7pKIz
	 BRZjQNcNnq3rF8EP8oOt4VJpg24OHbi9DRo5VfpOfDoiOBscLJlTiT9QP+MI9UrImu
	 RiBZacXE20pyG2vl4LrUPqZk+fLcf3Ep2gBuovqMYAXUHgM8mNt+qTQ7T2zQXaO7uO
	 tc82tGLQdQz1FdnhD5DPo/7n4ZY78xLVfGF9WeUpdLoRZmLhbCjQNcSuLzk+qOpAIQ
	 AKtzzvBf7HITw==
From: Lee Jones <lee@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20250627164414.1043434-1-andriy.shevchenko@linux.intel.com>
References: <20250627164414.1043434-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v2 1/1] mfd: syscon: atmel-smc: Don't use
 "proxy" headers
Message-Id: <175147053575.3047592.16340866453491480313.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 16:35:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Fri, 27 Jun 2025 19:43:58 +0300, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.
> 
> 
> [...]

Applied, thanks!

[1/1] mfd: syscon: atmel-smc: Don't use "proxy" headers
      commit: e1411d38da67e53a25aee615c3e5320d373ef741

--
Lee Jones [李琼斯]

