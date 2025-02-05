Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032A7151987;
	Wed,  5 Feb 2025 12:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759095; cv=none; b=ewib7a0Z8Ijd69nmBrVUS0Y/2fBZo1w4bGPdKHkuMjwA81z3GMkOulCdak6fIieQVKj7bpSRiMW4S8qMNH2hkzlmN3I8N5/ZkJByAvNH/Qa7/3B8n78WTVIKVhW2w0MTFOk3I8T1q4iow30Zn2oqWqZpOJZgfrBqlImuyvVOl8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759095; c=relaxed/simple;
	bh=yVkYzT9iu21XdX/Wk9cBe9rcgtxJMysjII2zPq3PAAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txjTRQTLSOBo94KatmpupfqXafDxT/xAE7MWqMLQ8YCIsEX/yZqLL/wn+u6jjhz2NxraFcp219UcmvO1qkCwM0EH5dkfkb1KdXjQXPaTby6MfGszxOArbXTjgsRI48Et12jsU4AS+uiNje946wJSw/MGqqKwsh8yAp100TxzcmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=JvH8WnzC; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="JvH8WnzC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=7uMFfYO1WmbS/ZVgPPg4SEdKN86zPP893kBz9q+8nj8=; b=JvH8WnzCw23uvFeu
	OkNSYapNfjAeas0JWasfktf7aBtOBLDlbgM4TVxUWg5eBrAaDPSxcJ96rmFCmpeo45TSnbiH5l31x
	EofGCQjUa1PbOjRRyyQseEWQuhA5uxuPG5C8Kw9vwQTia+bzo+R5wTcYfgv9yiZHp9cHvdumH0bds
	fkQWjesOBnclGdxqME/wshVOtHr50dpHTr8RX601myp/knpKrru/qFpuSLMWGnx6kLQVoK2lbZQaK
	A/z0UK6HM0y86mB4HDG00j46Gqf5KDdPcW9cANsdedAnatnGoNhMFLSLofskWpNUUpQF1dqGO0k7g
	UuIJd2oMpnAl6OfClg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tfefP-00DjlZ-2Z;
	Wed, 05 Feb 2025 12:38:07 +0000
Date: Wed, 5 Feb 2025 12:38:07 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: max98095: Remove unused max98095_jack_detect
Message-ID: <Z6Nbr4XIN421orTF@gallifrey>
References: <20250205014458.486207-1-linux@treblig.org>
 <dc0bc826-6105-49f1-8a59-bb4881e9143e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <dc0bc826-6105-49f1-8a59-bb4881e9143e@sirena.org.uk>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 12:37:36 up 272 days, 23:51,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Mark Brown (broonie@kernel.org) wrote:
> On Wed, Feb 05, 2025 at 01:44:58AM +0000, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > max98095_jack_detect() was added in 2012 as part of
> > commit 9dd90c5db040 ("ASoC: max98095: add jack detection")
> > but hasn't been used.
> > 
> > Remove it.
> 
> > -	max98095_report_jack(client->irq, component);
> > -	return 0;
> > -}
> > -EXPORT_SYMBOL_GPL(max98095_jack_detect);
> 
> No, this is exported for machine drivers which might not be in tree.

Ah OK; of course it would be nice if they were in the tree.

Thanks,

Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
