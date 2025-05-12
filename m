Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749C51C701C;
	Mon, 12 May 2025 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068262; cv=none; b=hzytZG8thyQODupHKjCemkzccJ+GMChaknR6LjUqENsmwLFCJJUhyXiDSyhNEfVz416rhCyrOm4Zl3Mz3/LgR1pFtAz5N/jxUbbrZ/r5Es8f6XK0VMCpz3wQTb6YtHQiVJv61Bl6FYGorZrzpllprANdqGNYrLNF5htch0qKyro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068262; c=relaxed/simple;
	bh=/FjOPQ9ADoXOurJj2iXkzmHMVMyGvLaEyi8uwSEUezg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYN43i8fb4cWNyQUoZr6dS2zJi4u0uOGRiS1OcMq8cFlSjDJDaAasZ0f4N9Qfy7AB/gBtpkYUzd2Mpe2UxrfTWiwROMgd2ih1Cu6Wea/sFKS0TQfhzDf8KekyHsvPbsJMBewpwIYQ8MCPIaxd5/8wSE/a6nrJYuNxDjHm6sB28U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVORyYCC; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVORyYCC"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso3752144b3a.1;
        Mon, 12 May 2025 09:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747068260; x=1747673060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AAAHnDzhkW7jZhJRaHexsmodJRMriRvLGEK72qa7Po=;
        b=jVORyYCCKC6rgllgJ+8dSfStFC3XKYfmmW98A+Zqm/4vNDMM2D6HP71cQSdczAiaCp
         JHbw+Z7zOOMhzs59JoDZMQiEmkZ/FoisRm9EA/6Up8lkupDpAfdBXU116/yMU/bxInlg
         wRFPOIlvDuwXNxP5fw7pDfCR02Sl7phfMjVN/oKg6WUbuqkObt7ejYjGCVj3ZmDIaFFz
         dxBGJCZopeob08y6xW7djL1hX0TF7QLF/U8ZmNM19n28g3Kex1xsYPFaSsvUAXrwkmKN
         cQZXztBVcTLFD0IUzQ4ce5WMjPepQ5iJZtuWqIQZhG2Luw0nNrFYzqOof/I4oWVoDyvX
         DGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068260; x=1747673060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AAAHnDzhkW7jZhJRaHexsmodJRMriRvLGEK72qa7Po=;
        b=cP7TipImeYbsgizGwgApAShOvChiBLB3WK9iBtH3fjvwXeKZtPoOVPRKipoJKc0PE6
         HPPIOegGGKhd51jsXdjmB7WPZpYDTNAL/z4Tzkv6Fb3Epmo26Ip08EQrakM5SBIF/hWm
         v9sx60jnwz3x6SLkxhj7yKoG9AmL4Gyo2BVb9I17tpziyL4iwcbO4IaMsKuHOs0ipU+7
         J/PU5h6iQ4B3VV1HTZWE5w3fMX9WveFKe0Kh7Xn33PEmgycACuD5miOCww3h1YoupqI9
         NdQQNu34jLedclJv3F2Im4sbkiWKbpXtz6PsNNDVs2r3LPDUR+QOZJx2SwZ05eCtnNbI
         xF3w==
X-Forwarded-Encrypted: i=1; AJvYcCV6b3xJ1YL5xjNm0p1j5MOmAdSuyGWqxfd4QuNsXNRIwTeYHakqkTer4zB9cYraC11VP4ltsGwFNInM@vger.kernel.org, AJvYcCVWmlq4EuNCHK0EDzp5jcbLhkvn0av6hHL83gKb+LajNcz1rnXE8SB1lTNBnQmQN9BQYhIDPCZnIsKFLtug@vger.kernel.org, AJvYcCXP+ZCJNkQPdt8HDQ9TtaLDqI53p6VimXqYAxTqcV6L6F//XuXwmok4p6s8pagLXerkxaGYabc2mF9s@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0SXQzuf8jTkjzHON87iGx8GukMDjM1AMQePo0tBnyMr360lLa
	mxdtmSoRILC4+oqbcjPFgcCs3HjkhlsGQasWveHbCuvU894453+r
X-Gm-Gg: ASbGncthKZJouuNCdFW5SqZuV04PD8bWr3AC7nnEcwhVhHkyvKmRcsB9dDG0maskGJD
	yvDB16ed1cmAli9C9rKEPejJAQQaRwxVA9IDuEO6A18+YSrUi8Us64cAa2bYNuq5LLHPBHmKfWU
	py5NNZfGdGIeDfampFYi8I07h7pPqC0AzIC6WXMzcVc3nSb2QRUsF48yLLG0nPKHI6pzIcyRaeL
	ywgWyvMU+y+EWOBVC5kcMipJ9LXXf+mzjlhNEpFN0xn+nk5zZJslGG9aRs0J98+Yd9WyWZC8yKa
	Wi2AUN0H3zrDMn8lErnuZQmGZ1inNRGg6mGjDbTvkSkJknT7CqJtOEt2TY+YNYhf7fS/YnH5QGo
	=
X-Google-Smtp-Source: AGHT+IEN5A7YuTJMq0Dr4zk7RPTtifkZAmNN1C/InEbIHqROmLU2iaEPGuwPJrXRQnibG7RVXuPcYw==
X-Received: by 2002:a05:6a21:1789:b0:1f5:52fe:dcf8 with SMTP id adf61e73a8af0-215abd027c7mr19263603637.26.1747068259635;
        Mon, 12 May 2025 09:44:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2349dd30c4sm5814133a12.29.2025.05.12.09.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:44:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 May 2025 09:44:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Charles Hsu <ythsu0511@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 4/5] hwmon: pmbus: mpq8785: Add support for MPM82504
Message-ID: <988e3528-1200-497f-a737-c590db0c2d89@roeck-us.net>
References: <20250511035701.2607947-1-paweldembicki@gmail.com>
 <20250511035701.2607947-5-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511035701.2607947-5-paweldembicki@gmail.com>

On Sun, May 11, 2025 at 05:55:47AM +0200, Pawel Dembicki wrote:
> Add support for the Monolithic Power Systems MPM82504 digital voltage
> regulator. MPM82504 uses PMBus direct format for voltage output.
> 
> Tested with device tree based matching.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

Applied.

Thanks,
Guenter
