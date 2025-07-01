Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAA52777FC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383474; cv=none; b=PV9fKPujTLD15ZSF8fGx/sZZ2HXNm+woFuc64u2ldm4yoB6qnGyRM3qon7m8RwdLWUO2S924IW39XXEujnfKo9wRF6VO689j175XZ4QGVOjJJ8bxSRTNmlCocLxfbjwv/Gq2QMcYN/9F1txGPvYfV6niU9YwjX5EoNnAhRUKnFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383474; c=relaxed/simple;
	bh=gzy0HYW1aiyamvIuwFD3xssIx7Of7faKEIvouPwowlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noYbXpdn5kIENSUYc9NXq4Qb3vtW4EUKymD63Gt5//VjUFh+ftFyu3YVOZo8tQ9W2aPDa988HStx3K9u2cq55rx3kzERPjw1cL6REHwQdA0iBoJNiBD1YVvOLT/eyny1hfrguFKHMh98Vmfz7bbogicnEw+6G5vqtxSMGSp1Eo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G4dzMgaG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G4dzMgaG"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so2093794f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751383471; x=1751988271; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TWTUS4XDaGfHhbLK/yKE5holBOESHiUAlAPrvZOBErY=;
        b=G4dzMgaGk4piVorXG+wr3/IA0UAi7rIqRfmN3WJ4Xk1jJS7Bthw50C7nT5sSR4WxmW
         dRyGY3aqh1+yUVK+ETYEZxODBsGqXN50HPo3hh433DkE6qMhyEjBEL1aBBHlH7X4SeVi
         d0BgXpP/pDw0CwekZeju+iVpItG2h44Q3ZzlJ91oOrg4SRS94/5rRDTtc8Ppxaxi2XYA
         vdgQag/2fSK1/dR6ueSQw1scOV+weqTb3bx90Z+cp3ff5+OTvpjEu9IMZz/NjrpPCia1
         HFLGwm+p2h0wO+0BNPEs9h2D2erYTAhqvZ+pnmNUZhusUmB78pjPBKvOq0QeEgXRYIRr
         zmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383471; x=1751988271;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TWTUS4XDaGfHhbLK/yKE5holBOESHiUAlAPrvZOBErY=;
        b=OCodnyNEXYsNovuNfWS/C3os2qmIyr25d3ZY/R3s7dKee4xOLQGKn/C8+//u33oV7G
         vrTXwERqwI6NH+XtVpJsoHcIa2bImd4XwJvMKYyMCw+OMOez1fM3bQGKN4bbJ6V5rwG8
         yNxQq8qB3+xZrDtO0tCwgbc4WMqmzxihFFlC2CXUE8tXZHhXTm4q3UrGu7PkdBgr2h9O
         +QyM6j/I+xWXnxwSf9KydJRCp+oNrP6ZWF5e2h9A6OgeA0kUxAWrRsKdrlASL1VxZ2cL
         xs0mQak3BMbxfZYu1e2Q7EZFH8pPbEiZPlYJp8Kt6u9u79wpwOhR2X8xKaTBHNH+Ljtd
         YXFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq7subeZWCoavaMlslTl8JJb5zCM0HVzkvBKRHG0TeV5CtEdHz8eS3oj8MlPgWjn3Zv/YxqHnyViLlNIM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd443zEuTed3Ro4RyJchsMQ4Ty6yxUmJUIpYg1W1DghfTD2NH2
	VaN5s0Qu3njnxcDTwETnl2YCqhyvZ1aw1kFBjpTAxciNYZrxEpiQcxXn5/gG+wrsHHM=
X-Gm-Gg: ASbGnct5oR4LOsjxxOe6yR9HuixS+bXrcH6cy9VJ/wCTd+SJmkXXTKDdMLgciSeMp2G
	feGwQ28ZmOpkkEyErgt4HCIpzOMQnT9qs1jTwazGvvNKe5EKHKipDiSKmzCLbLU4nWb/mD8Hqqc
	tCfJsXEzcC9piBnufgtZ5xUrXXOCyykoLwGgfHAIZkT42hGXkp8wyLh+9CAlRB7fhWWn8YbWXly
	PInT7VzKMYCs9NLn44xxci+BaVAvYgXWoalvA1MTA0GQ9rI+8Bm+RXaNG7B14jgV7fDUTJFm6Z1
	FzeNMh0yfO8sRVjgAssaYztjvGhvVMTsGj0/utRa5dFX7yfnHGvtI8fjeJO1jFmk
X-Google-Smtp-Source: AGHT+IF8wfGH2gABidn97K6pcyx6hogp9QScuA+QUd2PL6iDQ+isNSIi1grDYA07z8SPbV8FgoUiJw==
X-Received: by 2002:a05:6000:25e2:b0:3a5:88e9:a54f with SMTP id ffacd0b85a97d-3a8f435ed20mr13353032f8f.1.1751383471106;
        Tue, 01 Jul 2025 08:24:31 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm16082565a91.26.2025.07.01.08.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:24:30 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:24:18 +0200
From: Petr Mladek <pmladek@suse.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	John Ogness <jogness@linutronix.de>,
	David Gow <davidgow@google.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4] printk: ringbuffer: Add KUnit test
Message-ID: <aGP9ouAP5UFQQn0z@pathway.suse.cz>
References: <20250620-printk-ringbuffer-test-v4-1-8df873f1f3e0@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620-printk-ringbuffer-test-v4-1-8df873f1f3e0@linutronix.de>

On Fri 2025-06-20 12:26:09, Thomas Weiﬂschuh wrote:
> The KUnit test validates the correct operation of the ringbuffer.
> A separate dedicated ringbuffer is used so that the global printk
> ringbuffer is not touched.
> 
> Co-developed-by: John Ogness <john.ogness@linutronix.de>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Tested-by: Petr Mladek <pmladek@suse.com>
> ---
> Changes in v4:
> - Add comment about possible prb_reserve() failures
> - Pick up tags from Petr
> - Link to v3: https://lore.kernel.org/r/20250612-printk-ringbuffer-test-v3-1-550c088ee368@linutronix.de

I have already pushed v3. And I would prefer to avoid a rebase.
I am going to send a patch which will add the comment.

Best  Regards,
Petr
