Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C8B1E51F1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308125; cv=none; b=IKG7A+pWI4f2pk+un7Mu/hMCg1QZq/rdjffnCYXsc63AbUwOQ60GxcbTLrLiWTj9OowgmehAM23Qymx0g02hqOG7t+tNI+HtGZDNHeC0u8BVxXeA7bV6mjvnFfumu2wLOwd+Q5O1mmt/mkmaSofxtRMcubKrW1EO9rud6K+aV3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308125; c=relaxed/simple;
	bh=Vcg4jvMeyradFYFlhfceNofHBCfEYhfgLYfIni8F40E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prar8zak85WNFVx5ltJNELBD5oOQAAH6fumtVCPSLiP/YrJoSgCc32IbuRXVh3fsuLRE80oGMRQ0oWpfo7TbAxS0avHIWQGa3HkOSIPXBrU/uaeI4daU9vjNLlcCJiCLvTMO74mNBcmR9GPDs4Q3i3Ggbz92mouzhPeeIgG7Sdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f2QTFXIy; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f2QTFXIy"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso2900587f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745308121; x=1745912921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zab4QDku25lz0nvmJrQTcIUVlTxqQeC0hgLov4LWsvo=;
        b=f2QTFXIyNHqmW5+liz6/XGdauxfJLmLhiIFH3SQWBI/eA6QoaAD0qmpgxhLg/W7t5X
         mSZMDKxmz7QIInwAdX08qkNd7OjGmWD8R3iICfByShdiSt6evzM1D75aJSadeOHOTh/I
         /loTHXsxjz3yGX4m4K7nGLGkAqXvA1ryxRsNxH2F0hS3U85/MoacKFqsKUOMeBUkwRFD
         eXSkeFh0diA/6jwKezfgl12XpRgxEDTGwRiJenuGdPORLNVIExtMXo9nyOOsK6QKiMq2
         icMj2baUjMNUX3El2hvNIUTEUh+QTGnDXcjZHmnQlezHwfZHsORFtwSajn/Rf1bFvflb
         R5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308121; x=1745912921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zab4QDku25lz0nvmJrQTcIUVlTxqQeC0hgLov4LWsvo=;
        b=dTLOL5Z9/4djb3YVyK2l9R37jWoUfO2WfyYBkpio0xyESw9T3bVCMmBbGTOkK8rNuR
         oqArbriGZimZIHS72Et6QfIekGMrTZKt8iTieBiKg4J/Ug1L0s0fece6XH8GAWA5hdvM
         cT5aimUfDrY+avUZj5WggYzse94ErSizvgMp9/9LDPUARsPAPnIO4DYWXGscnj/W+6Sb
         eYOY4vLCgkRUN0w5gk7XEUmUXi34hRL9y/kYLdO/myjAbNH444ixSNe6YcfASHLUyzcu
         WfrUpYUqospW3nUlQuGa+F7s8mGeQqSwGXtz9ObqGdrruqpBv/f98IrVzpIuuJzrDaOJ
         VkwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8bl43FO+I+J5jhADzFKoXUj0+BL8td+dmM+PmV/+qWgNXumzCG0kgrn3dMzaZzxX6Hvz8+70RZQ4qBtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwLO8WDmgn9vjlbcNYwwf7Tdkt1CJ2jmpecZG0IN0SufGxXRBk
	EIE2o7M3nAbM4YM0wG+h1CA3oqJwvlhDCc+rVskpGsWZup3tD1fMqGiz0yCTnOuuK8Yly5EM+Kh
	I
X-Gm-Gg: ASbGnctnm+/pdfLxZ5CyCseifJAscngc3q3Y6bJIvQ7JFonmcPOpu50jKC+ITCfzk8S
	/v678X5L8pBqLfYRThKepu4PQjjiTfg7Vy3pPDBcVRJgll0JFukObNa5E6ajR9avmbgdbKZKMhK
	pvwVAyaftzx/0ZnP+2YdhmzrBg7dVs3Jzl3bsPjtbMzLnQMn5buFjMH5vPPVMjFcbeXJ+9x8J/I
	XrARd7EmmKa7tEpOILSnds+/61m01RzQ0EZYbsPyGc6yAlIBkFMpbhttCDi67uU0//cXuW6fVqY
	ZywAf1kmswvWvN31rEqlsZVHLhB5sDaufy4RYabtYnY=
X-Google-Smtp-Source: AGHT+IFz9RsgqY8Wo1mqY9SHCprX+aN93EWUqTG4SpTvycudKLfZGL978tnCqYWy4J8zVy5l7OU93g==
X-Received: by 2002:a5d:6da6:0:b0:39a:e71d:ef3f with SMTP id ffacd0b85a97d-39efba2af49mr12016351f8f.5.1745308121468;
        Tue, 22 Apr 2025 00:48:41 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c8b0ea0sm6427365e9.2.2025.04.22.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:48:41 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:48:39 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the paulmck tree
Message-ID: <aAdJ18rRHdi9y3S9@pathway.suse.cz>
References: <20250422093834.57e9e9d0@canb.auug.org.au>
 <ef907eca-3a04-461a-9c75-404d65dbaf2b@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef907eca-3a04-461a-9c75-404d65dbaf2b@paulmck-laptop>

On Mon 2025-04-21 17:00:57, Paul E. McKenney wrote:
> On Tue, Apr 22, 2025 at 09:38:34AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >   9e13e90127fb ("ratelimit: Reduce ___ratelimit() false-positive rate limiting")
> > 
> > is missing a Signed-off-by from its author.
> 
> Ah, good catch!  I need to chase down that author!
> 
> Petr, you good with this one?

Yes, it looks good. I have just approved it...

Best Regards,
Petr
