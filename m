Received: from mx10.gouders.net (mx10.gouders.net [202.61.206.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61738462;
	Fri, 18 Apr 2025 08:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.206.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744964249; cv=none; b=AVTsVvMw3Zdj0cdiYzKDREzIhY/+eKUe3olb09UHjOR2QXrLHR4qj17MrX3vLv6zj+gf9zcYzREgCyu2H4kgYjeTzro8tIVVxKWxG3OUvAy1KUUyOFd4+ebF0huRWJVEorQpAloeTWpF7BQjaaZQJB+tZjcu639RpB0tBJkG9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744964249; c=relaxed/simple;
	bh=HfserAq17Skx9yyn4OaPzK7uT4AvLX10etymwSKfJyk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LculeIk28NRfgZoSRRKcAfD1gw0wcYlSdFO73DVIidVTS8h4zpnew27m0ylsYd/ieQRDySpGAdKU5ufjF22cNmrjjUKyjdAg5yIuqdqqqjkviMIsRVN0bOnUXw+mgV7FE9Ptg/Nzn8GlzjJO2Pjcr3UHgU9JYLezaSocmkVbK0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gouders.net; spf=pass smtp.mailfrom=gouders.net; dkim=pass (1024-bit key) header.d=gouders.net header.i=@gouders.net header.b=SUX1l7iq; arc=none smtp.client-ip=202.61.206.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gouders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gouders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gouders.net header.i=@gouders.net header.b="SUX1l7iq"
Received: from localhost (ip-109-42-179-120.web.vodafone.de [109.42.179.120])
	(authenticated bits=0)
	by mx10.gouders.net (8.17.1.9/8.17.1.9) with ESMTPSA id 53I8GUi2025346
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 18 Apr 2025 10:16:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
	t=1744964191; bh=HfserAq17Skx9yyn4OaPzK7uT4AvLX10etymwSKfJyk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=SUX1l7iq5GXdFIVtE3I/1BV7D+Sgu/UQNrXCYzhokqytgNZdNokEHtylOwbpWhRs+
	 Z4jTpSNooYriaXFEAC72nh5+Mm7sSb26VT5UHZX5I7BXf3kAIpogIaVn8TGRCMyCzV
	 kOuO1LIWxnP5BO1159QpMrZSajcIUV/jGi5S47XA=
From: Dirk Gouders <dirk@gouders.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3 03/15] arm64: dts: freescale: imx93-phycore-som:
 Disable LED pull-up
In-Reply-To: <20250418063104.2202085-4-primoz.fiser@norik.com> (Primoz Fiser's
	message of "Fri, 18 Apr 2025 08:30:52 +0200")
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
	<20250418063104.2202085-4-primoz.fiser@norik.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Fri, 18 Apr 2025 10:16:25 +0200
Message-ID: <gh1ptpkhpi.fsf@gouders.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Primoz Fiser <primoz.fiser@norik.com> writes:

> There is already an external pull-down resistor on the LED output line.
> It makes no sense to have both pull-down and pull-up resistors enabled
> at the same time. Thus disable the internal pull-down.
                         ~~~~~~~              ~~~~~~~~~
Sorry for disturbing, but I couldn't resist: the above somehow
contradicts the subject line -- at least when reading this just by
chance.

Regards,

Dirk
