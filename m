Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE01282F1;
	Thu, 15 May 2025 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747293244; cv=none; b=oRMeJ4vDv0o01/xRG3EYG00aqCL4d5J5pP+DZ5Zrp7DoGiAeyOv6670n4vsZknW4axUspba5Y/G2hQmd8k7EJBIbSY31O4kgMrQP71JZWpTHmZYLegD32OAduQf5Bk1YyMGwt9enqVNVinBlely7MC0OdCAHYZFGzVSrZYgGxpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747293244; c=relaxed/simple;
	bh=Syz8C/K8vQVrYKBBm3kOIZvaSdCxUO5VXlp+cippDyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RljHYWsFu/+yX1d7Eukn3fLLGrtxgdvjORCjzL6IZsPjT06bnmOgnrYdq/AUjdBwj4ZBha2/WO8VyhZwcV7dA5Ip62GyCmjHRdkmEP2mOGk+/QWWXPKrKJAiKglH8U9GAgM8da8JUgBmc0OoZrpb8gqMeh66px4HmD+LecM3SuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcF5w+bp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcF5w+bp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FC0C4CEE7;
	Thu, 15 May 2025 07:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747293243;
	bh=Syz8C/K8vQVrYKBBm3kOIZvaSdCxUO5VXlp+cippDyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcF5w+bpiB1TFh70WadbYABFSsa5q3WA8YOQaDkAjYHrVmGQTC6rWfIJe5JDJQl8v
	 eI6sWG6owQL2vThL+lO4+AWtBVr1sgtbqeWkMZd8CD3FXTcAA2lT4YCgZUwQkIXgll
	 0VzTkunGCmI4S/DE1Lo4O3lDcl4ToPYf7h6t16odQ6zC/0Y/yswTxhKpfUu09w/Grj
	 7f3476LoaXXyeZ/QBc+7reZYlfS6AMRxq6yK5XgjUyN0MrLhPz7Ls+fY6qs/fvK3lt
	 pGFQ8O4/Hb7S0rLek3i+/kYxYKRe6hQVUYrQvuNwYw//boTwZ5T1N9z6Pi0jL0WCvR
	 coAjHPKXFJ6HQ==
Date: Thu, 15 May 2025 08:13:57 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <20250515071357.GD2936510@google.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>

On Wed, 14 May 2025, Mark Brown wrote:

> On Fri, May 09, 2025 at 03:09:57PM +0100, Lee Jones wrote:
> > On Wed, 30 Apr 2025, Artur Weber wrote:
> 
> > > ---
> > >  drivers/mfd/bcm590xx.c       | 12 +++++++++++-
> > >  include/linux/mfd/bcm590xx.h |  7 +++++++
> > >  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> > I can't merge this until Mark has provided the Regulator Acks.
> 
> Could you be more explicit what you're looking for here, the diffstat is
> entirely MFD?

Okay, more explicitly, I can merge this and MFD will have no issue.
However, the Regulator commits make use of 'pmu_id' introduced in this
change and would therefore cause a compile break.  So we could:

  1. Apply this now and merge the dependents next cycle
  2. Apply this now and provide an IB
  3. Wait for all Acks and apply as a unified set

We usually choose 3, hence my assumptions above.

-- 
Lee Jones [李琼斯]
