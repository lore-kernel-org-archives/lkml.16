Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9356198A1A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749669523; cv=none; b=BM2VMNgk8N+zPbfmSkNbgQ4YOHsnNQPZQ0+9wsmo2heS8+zht3n9X0SOX+3zECAZwHbNlQbEYEHrTT/EZp1hrzYRoZFAKYMZcwZk2g0zsvlxfO96KjoNo15K9ItEICYyENx/6AnMuhLbD48MVsjayxEth7SGQI2RbDMSuy6nBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749669523; c=relaxed/simple;
	bh=fgUe9b2qDsgJmbUQKzVEGW8IZ6IqLriGahw85ECywOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPxxYvUyV2/9kNj9PAL+Fn61c2jRoXqj2DDkZfSy8bFLFMasLQoJzfrFLR9tc8g3VLexBHHQNF8FX5+t9cP1hX1MBa72vLAv3tqZeU3cDaEfPhaRn3d6z9Ou1ZeFP4WngY/1nfMa+HmvgqZwCQMpu9At3ejM+7iFa2x0U61CJ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=xS7/njEY; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="xS7/njEY"
Date: Wed, 11 Jun 2025 15:18:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1749669509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T7fxo3q5zRvtn6y/SCuAsnMPegqoz8YNRTrlcg1kSc4=;
	b=xS7/njEYBTGVj+XQys0OeTRvJbIslTpkzVwP5HZTRxG1dr9FteQ84d09ko5aQzmIR54n3Y
	MDvwR8nbAe9EpQ2Y5LgaPu+AapAchfueR9BwT4929UCSiDxhlQ0uwhPe6BM8MkJiVSxmPo
	YsA2PcSqfz+t/FDhUKhJw1mZhUZyRtwGgYp4jGJNZjlg2s1VLv+AWwMIXCuHeMHOl2JiNh
	uXtrZjyfrtju1PPzYae1byKtiCTDgdcHpL/bfKBwGKPZkn+B3DQULbRoMZZ/ihcz9RswGG
	vldfxoVbp5bew0aIPK5Hh22JLynv3hCGDwG819zvrVH+4losBF+2EAvgtbJKGg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Rob Herring <robh@kernel.org>
Cc: fnkl.kernel@gmail.com, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
Message-ID: <aEnWgbSb77M9zdy3@blossom>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
 <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

> > +              - apple,agx-g13s
> > +              - apple,agx-g13c
> > +              - apple,agx-g13d
> > +          - const: apple,agx-g13x
> 
> I'm assuming the 'x' is a wildcard. The preferred thing to do make one
> of the 3 actual devices the fallback. Typically, the oldest one is
> used.

Yeah, it's something of a family. G13X is an apple codename for these
three chips.

We can do `apple,agx-g13d, apple,agx-g13s` as the compatible list and
omit the g13x compatible. I'm not sure if that's actually better since
we'd continue to use the G13X naming in the driver itself but it's a
minor point either way.
