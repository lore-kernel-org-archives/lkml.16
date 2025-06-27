Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCADB2980BF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021687; cv=none; b=A1YMgViR39AOiUc3xE6qKiR4nV8dS1jH46W0oS4R3ZKn2KuyLkwW7S3NVmBmuHTAwEH51vTCTH7j2xT5dlkYjshUvJ4gDOHwDhn3yNYjVd8MLKkVJ9B7csJi0AMktobk3SeLcBboOMWNSQHgd0Mc2hwDbIc5kODYeECiOQWerjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021687; c=relaxed/simple;
	bh=Ek+lA1SX5gipBxgIfPVabXXslyult+iMQ0m7IDgHvtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMnB8sqUN8xS1ofA41Ng0mgilclg047xjTTeJnIpXyfN7yQIYR/TiranRX5Gx0Qx8HqNSu6yFXTlT7DmX+YvDH/eHJJ3j5gwqk6e+hXy5cy0u4KlFhaZSLaYgLzqDC0POGJBqD2TMvcNQuxcK+aVMNzr9oeU1LpQrIV8V3tlotA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H25St+d9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H25St+d9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/VkP
	h9CtKvJ+8x44vX4RgQiDyyc1lUXyDR2rjHDL+Zo=; b=H25St+d9xO6yD4YGBtxY
	cB3vQ/If8IPj4Vpp7+JlEHWYGJ9/dVCAP1TyX5mB4bI2FblUvSJv6I7cSoGaK3XN
	OBPChSVjJ6P4xqCRlDIjVAEJMyhtGKdhedPLbcGJhmw7BeH2C8hDCwFYz4V/dyry
	XUPOb1XmfAYDbcI0gd1/LmHNQ/3W9utyfvesZyJwCi1V8tvi6mQS2GSep10g8N2Y
	qH5TrQtrF+lDhqBlKSId2CMToz6731wF5duFfsTYi6KNBzey6s93Fcq9WMGJnvi/
	SlE0ttxT+i4GV2jHRwKayiN1mtZl0RBD2AoINW5K2Z8OKQTb3IFY2QydElj0QzK2
	cw==
Received: (qmail 1435052 invoked from network); 27 Jun 2025 12:54:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2025 12:54:42 +0200
X-UD-Smtp-Session: l3s3148p1@kS1hgYs4os4gAwDPXzuUAOCQSK0rM+sw
Date: Fri, 27 Jun 2025 12:54:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de,
	Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Use dev_fwnode()
Message-ID: <aF54cmMncmbtU3Qb@shikoro>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-8-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611104348.192092-8-jirislaby@kernel.org>

On Wed, Jun 11, 2025 at 12:43:36PM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: linux-i2c@vger.kernel.org

Added "mux: pca954x:" to the header and applied to for-next, thanks!

