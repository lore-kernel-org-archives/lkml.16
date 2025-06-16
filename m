Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B783482FF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088541; cv=none; b=kUw9hsqC80MTdA/5veh05C3M1hV/CwJb1m3jHMzwUrvRJav2YkxL2QXWGJiqhL5gdmYo8iqKmtTtI9/JIzNczTBK8hPGOmoAkcQIDuzvbpn5IEDQaQ2xfg5FncBJK8nWTvJ1Hh2zNAVYsdLJncTOkE+8W08UdSKW4b+hitRp3IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088541; c=relaxed/simple;
	bh=di8xudatdp5SMy7eHmZefJhZ5PeWDPFTRDk8xQCxU20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+8iAdmtsYN0b0WgdkW3AYOeFFAJaTkeepflqFFadmzSJxmdtj+Nc9fsVKFyMfrFR5+zrdDkeLH/NohrD3K8x+n1+RP/72rTq/yi56jvnCKwMCcJKY2wMEADIjoUVkvwXo7b0bsI9kY1hYgmbMoy72X2f/qAbJsVQOuXsKieBnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=g/tcpNQS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="g/tcpNQS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4531e146a24so29109515e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1750088537; x=1750693337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yP/CQ5X3qQ+mpgXoALhvLq02Vdqe/xFaFqGX6GUODjI=;
        b=g/tcpNQSto44OBu5ZPyJ0TfYU72cr7/vgKA9n+bPHE3hKBnaIdIHnkik0uCxJToRrg
         HWFTCtl1EVZ36FDaNZEZyH27VfEaq0ueY5PEI/gggqzgAFYaQMtPVNGxrdZOgAzFqZAI
         CPXlR5F0nC/o/PyjmX3rdAXMKXeLHI8eXF7pStcG/SK3B6ZvFnT1a24iLuMj3XI1sQRY
         jxqZKq+p5nfFWZ1BcgMdz/a0ijGU77RfC+179A+t4MoZE5C5Ekcu4rhmt3il6lsququF
         YMv6dZIH1/JoWQFwIz+CnJXVqUZKmgAF3bKWjos+lWIV2vcnAmAVzKk6WE5dOqirXqpZ
         AhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750088537; x=1750693337;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yP/CQ5X3qQ+mpgXoALhvLq02Vdqe/xFaFqGX6GUODjI=;
        b=NCN6JI9otuY9leee10nGHt6zF6vovvsFeuGLp6IzJqxyIJxAouLwP2ByqDKh3ryHyE
         lL+CPVsQu3McSlsHPcfnHDabWL1lNSM6oDvNAdZK7kZY2Q7WElv4Ne3q3LlVRyYGIl7l
         sg7gWJExFa74zgFBZCY/1/iEMLwQJA6Sw72BkCOgpObFNVHiFQsi4oH2tj8CCkxA2nMT
         naNc+HmPw0JKqUGo0X4OXBFQApa4fqP3KSnkMjRaYBwXHVScOF2+EAg9JSBaRqaC3dDO
         g6eaNd/IW6FYrC3vd2X8Nd/FmHi1UMPRxJslMJ8IRo9Bb3hIpVNPLnNbi1SjUIDXNdaz
         xOrg==
X-Forwarded-Encrypted: i=1; AJvYcCUzO5x3Wvozc2zeQdFaCx+niY2Ike7fPduQbsUQw4HvO+v55w3BdmdZiR8cGtdI6c6bzBJa+e01tp5sfRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8HFCSgTqTHkQve7XyhDoq3s9ZVhrQJT5/g6otSjUOMSWbnAJs
	chu64S81Kn3Kd16rU/s34AhTFh1tLG8mu21rwk3erkzsA5s6NwmkZrd+FBp5wNRkTaI=
X-Gm-Gg: ASbGncsHhpW4uJ75+lNKyx8WAUTf5NFZliNRNR8kjsdlKcj6h76Ej4jJWYJeGOo3WKQ
	NDXd8KIr+z/nLFHY1cIc9q6KRhHUBi8Bm+hHe696uQnkkrfPAOQ/YjmTLjsPjejj79h6IznRuFG
	87NAhBRyKh5/912vMP6LHPLi1vegAIfQSiszj09+6P+ygGwxPMcXFR+b1uDCAteEvceNXRCdVaC
	1IXgwSJQINX1N9gki5QULSb+MfnZPreG3NlU4iQWNbkPwS3cTASJ2xfYR9eTPZCpq7qPsUbteLC
	LTrLBG3YoWxunYsppEg2qbNHid4946VO3bm1EiGQ/oBNWm2OnreQufcKb2AhvNcHH1Q=
X-Google-Smtp-Source: AGHT+IFy6UZIT7ibKTKBEfFAC0y/576cRTmSYSV0MMDa6HeLuamo7ZHSBOMvKASYcuA96i14m1MBRA==
X-Received: by 2002:a05:600c:4e14:b0:44a:ac77:26d5 with SMTP id 5b1f17b1804b1-4533ca572f5mr98219285e9.14.1750088536696;
        Mon, 16 Jun 2025 08:42:16 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e22460bsm156250815e9.6.2025.06.16.08.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:42:16 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:42:13 +0300
From: Joe Damato <joe@dama.to>
To: Justin Lai <justinlai0215@realtek.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	horms@kernel.org, jdamato@fastly.com, pkshih@realtek.com,
	larry.chiu@realtek.com
Subject: Re: [PATCH net-next v2 1/2] rtase: Link IRQs to NAPI instances
Message-ID: <aFA7VdI7BWQOKW0V@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Justin Lai <justinlai0215@realtek.com>, kuba@kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, horms@kernel.org, jdamato@fastly.com,
	pkshih@realtek.com, larry.chiu@realtek.com
References: <20250616032226.7318-1-justinlai0215@realtek.com>
 <20250616032226.7318-2-justinlai0215@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616032226.7318-2-justinlai0215@realtek.com>

On Mon, Jun 16, 2025 at 11:22:25AM +0800, Justin Lai wrote:
> Link IRQs to NAPI instances with netif_napi_set_irq. This
> information can be queried with the netdev-genl API.
> 
> Also add support for persistent NAPI configuration using
> netif_napi_add_config().
> 
> Signed-off-by: Justin Lai <justinlai0215@realtek.com>
> ---
>  .../net/ethernet/realtek/rtase/rtase_main.c   | 20 +++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 

Did you test the persistent NAPI config on one of these devices?

Reviewed-by: Joe Damato <joe@dama.to>
