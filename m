Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F54A1E47B3;
	Fri,  6 Jun 2025 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199395; cv=none; b=hH+fsCqQ0bEZJv2pJmwlRxgWUmuaDv+Ct8QuG3O41X8zWudD2EiB+5QEdPQzLt18KXJjBb3NSewvmHkNf7uZgx6AoK/4ciiok+M1sbfbW5m+uvbDOWbkB6M1QecJELO07UgWU1TiAqbopJ2JqsyC2FfZ22ep7jNLQKBg6NLiNGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199395; c=relaxed/simple;
	bh=xY60W2BpmB0R6C9zKdovNQDuFT/q6JFS4MVm+3+XWpQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6DNhiqocMP9mJL7WFkHuvCcovM0A3ObTy8eN9CQ0NVh0qi7pCeor5zeVp+aolzAP6vOs1LvHt3GNZhhmvVLH8RQZrRi2nzQFzs4aNVRQJJu5dlfwWD7VRpsTRASxv9tnNMuMhmv033BLPKtoDeqbdZymhyG/4Zhy82Yjhdb2Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=yA4L+iDT; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="yA4L+iDT"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1749199390;
	bh=Tcu/KYS+fxw8u/obcEYaDuxxeoOnLQd6Ipi8xhkZ5U8=; l=490;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=yA4L+iDTXwcqe76lhVSAP0pB+f4N0Mg6Hm4gKvEs8ncFe1duGSedBctgdvJ8nw3CB
	 iwZTNkXal8bxejrD+/MxPHY5jinsrnId6iXk71t4fjn1pX3/PZrRBWV9TXCwMz5nUF
	 dKQCNIdruW4US2AH+vofYltySqzBG89G3wHXzYKQamtPrSUVtDeVG8b06f6mFzvoT6
	 9jA/aAX1KBY0P8nNRQXwk5EYjt/T2NHpeWOc4dPqdWalZQT6InuZTSiUfVVoi2E8Id
	 5+wLBy52e00bd28933IIJrvAOgQOWyMBFdmXE1MqEmm0NMT4c4qZbFYqlWnutpWFq4
	 fJT3pLHpegoJg==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2288475:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 06 Jun 2025 16:42:51 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Jun
 2025 16:42:50 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Fri, 6 Jun 2025 16:42:50 +0800
Date: Fri, 6 Jun 2025 16:43:05 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Conor
 Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Roy Chiu <roy_chiu@richtek.com>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add Richtek RTQ9124
Message-ID: <aEKqGS8xGKNL4WxD@git-send.richtek.com>
References: <cover.1749197773.git.cy_huang@richtek.com>
 <b95d701e5eb93d011a9e428adede845a309d1f12.1749197773.git.cy_huang@richtek.com>
 <3853e99b-30bf-4263-8abb-2b9f812415bc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3853e99b-30bf-4263-8abb-2b9f812415bc@kernel.org>

On Fri, Jun 06, 2025 at 10:33:46AM +0200, Krzysztof Kozlowski wrote:
> On 06/06/2025 10:24, cy_huang@richtek.com wrote:
> > +
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - richtek,rtq9124
> 
> Exactly the same as richtek,rt9123. Don't create same binding files for
> similar devices.
> 
Do you mean to expand rtq9124 description in rt9123 binding file? Any example that I
can refer to?

> Best regards,
> Krzysztof
