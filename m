Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE7D248F6F;
	Fri, 13 Jun 2025 06:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749795764; cv=none; b=oq91l9Fq3acpQ7vPIiHwVsqNa/9KEFwZbMZt61jSIZW3jFHt5YGVbaBmBOA5gl/F2HYUQ8iMhvwmBD1phf1/1aE1dD6+C1icDp27WncjJQMuHi6JmLUhsIAXHgu+I/Wn5a6urxlpGwUlQji/eV5X2zw9E+xj74rpKxxYwTJ1DOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749795764; c=relaxed/simple;
	bh=CqOl17e7Ivjdg620kfbggEADnVLIrP+tN+mDP2fqmf0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eAbRW5/Ux0Dy9pbl1nMULL7Cz/HwALpHhB9Xb18eLXTbO6Rnt5jKu/wvYDEC2aKpHsimAQzKb4kaC1r6v5qGq2snzWtyny8M5G6Q9M9LX3s/nSitQTpfLeLJnGQZ5whDPlI6wOFaTg0QUhpxWKLLaD9kRLPVkJUj4WpGmQ866r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=B40P4cfS; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="B40P4cfS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749795761;
	bh=uN1gPb2PJM1vKZa2B8fQ33X5LS8Zuqa+quq/5JZM2BA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B40P4cfSWEj4Q/LwKoGxYvT4RLjXhogL2r3AVuZNFrSQ292nwIkZyyIfsr6TMQwAS
	 CGgpA0sNwE0nIfTa2ujfVAzpvNpLtYq/idY1aK5rrPMFwgOUD8PC1SkqvA3YR65cKr
	 yloqW9w8OQ1lIixBEdWjeJiImDFbd5arK9CATd1Ev3FbqZJcf2SvDFLX3Vf6fNxxlV
	 Sms1eChY2DZW5N395hSbJbPe4nLNGEleb1u1LuAtJUWCLuGIoQ/LC/M5xeLLFwd1Ea
	 h43xtY7ffyR6GKo4TQK95/ceTkELC9GH5HKYOaKbO/roMChk2eF9TqZDGj7oX+iiM6
	 gZYh+bW+Xguzw==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 616D5680F3;
	Fri, 13 Jun 2025 14:22:40 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, Ankit Chauhan <ankitchauhan2065@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250612075057.80433-1-ankitchauhan2065@gmail.com>
References: <20250612075057.80433-1-ankitchauhan2065@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: lanyang: Fix 'lable' typo in LED
 nodes
Message-Id: <174979576026.385457.16320702443597106607.b4-ty@codeconstruct.com.au>
Date: Fri, 13 Jun 2025 15:52:40 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

On Thu, 12 Jun 2025 13:20:57 +0530, Ankit Chauhan wrote:
> Fix an obvious spelling error in the DTS file for the Lanyang BMC
> ("lable" → "label"). This was reported by bugzilla a few years ago
> but never got fixed.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

