Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FF126B745;
	Tue, 24 Jun 2025 23:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807535; cv=none; b=h4Qi852bG4ZbESIP0+InULKquVbSCEQ1usuTlaKLCsEO3qoMMcvqrvR4QnyPtAaOeXIRQZY+PHvEi0GpyFBmOeYwjCyEfQJBC7VAh3ZuiHnxiCzWzRHhg1b9Ig65LPn0f0qSpNOZYBFg8EouwDpJJnv7KfXJmWI6Wgn4HTdr2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807535; c=relaxed/simple;
	bh=5VnjwA/zxW1JjxlWjMu14cv3eQfv5VgkEZgARXUwWpY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YxTg1ZD+7qIby6OjerKYPwXhjw18Wdf3GVQy8PbUdah5k0BuzHseqfU1RRv2W+A0WGzWsuYQttYW+SvMThDeYMoCk7BxeDyrRe2KsY4RWsRuJmHV5qWzlWeAdX2vqye1getLktZ6Wpw0l31prv35y4bsm1wUlpnJic2s+kUnjXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=SMCN3RjJ; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="SMCN3RjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750807524;
	bh=w+f5W0eoB477n5tZdxO4dFP4iyclYTFOfRC2PI/WiYY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SMCN3RjJLGMVXWlCMZWDR6UnRhkHcHT/gEstpcg32yeThnUmB6Gv1XAflf5HeaSRg
	 T3LMr/jtSoAOdYqskjI3FY/MeMJ9+iVYDyin7TYwVsiwS3WrM/M3/Tb1Lc068tVrPN
	 CYrDZOKXWvwqJNAqrVcoCCTPii+Qqdfqwx+uF3PyhMgDrSpdn6Nkh/yhZwQYM2tsf0
	 jga6hPoQ4mJxtCeTP+ReDsJE2Tu2jol6+7d94Yqj2fX7S9yQpFhY5PZN4mB356fM2V
	 uEMSlt6SbF6ZPDwAQYmzS5qK+skcHVO4uXF23f2m84Sf96sq4pU5ttMrWikiK0hBJO
	 qH2eJULGxULRg==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 329D9640CD;
	Wed, 25 Jun 2025 07:25:23 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, Cosmo Chou <chou.cosmo@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 cosmo.chou@quantatw.com
In-Reply-To: <20250622034247.3985727-1-chou.cosmo@gmail.com>
References: <20250622034247.3985727-1-chou.cosmo@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: bletchley: enable USB PD negotiation
Message-Id: <175080752310.266748.15058369884173202115.b4-ty@codeconstruct.com.au>
Date: Wed, 25 Jun 2025 08:55:23 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 22 Jun 2025 11:42:47 +0800, Cosmo Chou wrote:
> - Enable USB Power Delivery with revision 2.0 for all sleds
> - Configure dual power/data roles with sink preference
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

