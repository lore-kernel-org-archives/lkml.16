Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616F22367CC;
	Tue, 10 Jun 2025 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749588726; cv=none; b=sAPL554IkvaObyhDegg+zX3XlXtWyOuYL+XtQiBT30WiRsVIe0b0I1IDUNrXUMaJlJAgZsFHIsLpvtAXio3llgb4EigACcD7N0J0awBhvDy+RRgj5bgKvJZRssaFQMmfyvhYGeZDwW3weVYM6p+i9H9AxEUS7hZFzxeCtw+nbTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749588726; c=relaxed/simple;
	bh=4/mjL6DCLB9sU8qSu6cX8+w0OujCflu4S+CA31auwjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSns2p9M+agX+O3Q4VmtkPhUnVawwRxo2Hp/D+Jmr4x0AYJXNy1Xt1zss+hS9CZDfRv4ztJoATJeLe8KEpl3FZclrORoQopA/JTmcAA93expYze1uWeebYbwtLQlXoKSBGsQoRmsCxN7UnIHYnJA9hPn3h6XfyloXaxhhhfGUJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2dgTxWl; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2dgTxWl"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234b9dfb842so53246015ad.1;
        Tue, 10 Jun 2025 13:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749588725; x=1750193525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lvDDtsSJOqLbUB9jROuDsshsMgX7lIbOe6gG2Mnat0=;
        b=B2dgTxWl5gpBkuFg0HAY2t19qGmi5pRBH36xno+qLiO2rPIuCdorH3eD/RTaAQNNn1
         sH40tigIf74nppL2yansIGwvjq6RN0CGqUor2em6L3MXNozM/oj14Jg/vvFfd8JoozLI
         9875NxzGu6nbtQB61+6rhanDzSgl1LGb4lEjznvhWWLreJVkHHgSTNxvBXCYr+bxji43
         UEo3kGc4WTjGr5qLduL/oBIlArPX+HMtOoYmlkECCn4YH3jgmJyMXT2c79zJY+M+zbZB
         Mr8AF2BUDiRKLp8mLy4oU2kJQXC98sH7Lz2r4y5zhCSw1bytInOxs+LP4ENzshaKJIdQ
         q46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749588725; x=1750193525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lvDDtsSJOqLbUB9jROuDsshsMgX7lIbOe6gG2Mnat0=;
        b=uy5RhREyfk3DYUam4aGurDn3rkh/ch/ydiFIeAVIXNp3lDJQYrrQncIAgEzfbArhD0
         X+bPRK+6LkNq0V0dCG/XL3qYti6CWQ5u5jQZ27B2NHzcgJ4rxh3j68L4pUxx1Dolvtm8
         Y5ZrHwEuAhaeynzuBORLC20XnxvVGvm4/SrS7jg+6k5U99p3N3R99YfdZkM4Sj9Dp5BF
         Gp+7+yA/4zygETa7hz16rAXXRr4KvXays96xC+ZKK0LoWDfNLDhF+oYhBL3AQBfIaoGl
         me2vicok4hMjCWRoDq/36rKBqk8TBdfRYCFst+qbyFYFxEd2qSIVul3rwQ+SeEzdl+w1
         oKog==
X-Forwarded-Encrypted: i=1; AJvYcCW56IcLj8fZSioF6MwN0SyBIG5uv/m+h2Merf9hXonyIjCCFeD8NHdICjYy4/WA/VRRt1rcOG8eb7yM0w==@vger.kernel.org, AJvYcCXSNNtzdS8oC1zhaIlUVGqmUABS8Pww4OijSEcAbM4H1ZAouvZNzhxzEb73AWUA/yvrNv/4S4IKwum0gtf5@vger.kernel.org
X-Gm-Message-State: AOJu0YzNTuFalkZCvZ+xJV7U8aIur8RXQGeg9+F1OpVY3rFmdDg1Z2Nl
	LUI0ky3od3WJuOdD6YJeDe+2vsrC8V4tQYXNDT6CpNRX9bBOt92nLzRd
X-Gm-Gg: ASbGncs1Y5bBDlk9dD2yGPwiVFH7v2Jb0krVAPYncT9IVCij7ceKGjqEVkF/ri4ttHk
	PX6f+SZgC/5LZbsRnymmAag4vLuX1VC8x/crebPDQpVsBeuOy7ckn5cmswaVSoPifcvotkrDb85
	zyRzNAPdFex4kIrlxZJfWQ0szOfKw6QfQkS3viTNexVQZeMzrj4L7h2iPpotoLnmHtJ/K2kyxsz
	jBxoo8OJH8z1xDG1paQ8glnkWIw1qerYskU+0esOxykffs+KgKIc5IShNdF126D+/wXC9ZLMgpA
	uX0F0E1yQp6Vgb8Yo/nciQphwOGn+VUddeB+3Wd83xwZlmmCKIwugNzGp11ohJtS2iIaWseCD7A
	=
X-Google-Smtp-Source: AGHT+IFDTTJ12ct4ggXuJT+vt0JAsn5V3O2f4+SATlVrGxDureE2GORMih5a6gauFrVmV7FuCHUP2g==
X-Received: by 2002:a17:902:fc46:b0:235:f45f:ed41 with SMTP id d9443c01a7336-23641a9a269mr10914095ad.19.1749588724651;
        Tue, 10 Jun 2025 13:52:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603507a3csm74795905ad.228.2025.06.10.13.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:52:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 10 Jun 2025 13:52:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Nathan Chancellor <nathan@kernel.org>,
	Eddie James <eajames@linux.vnet.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] hwmon: occ: rework attribute registration for stack usage
Message-ID: <7f1a87f9-1a70-4d63-a8a3-f914d4036f79@roeck-us.net>
References: <20250610092315.2640039-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092315.2640039-1-arnd@kernel.org>

On Tue, Jun 10, 2025 at 11:23:06AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang produces an output with excessive stack usage when building the
> occ_setup_sensor_attrs() function, apparently the result of having
> a lot of struct literals and building with the -fno-strict-overflow
> option that leads clang to skip some optimization in case the 'attr'
> pointer overruns:
> 
> drivers/hwmon/occ/common.c:775:12: error: stack frame size (1392) exceeds limit (1280) in 'occ_setup_sensor_attrs' [-Werror,-Wframe-larger-than]
> 
> Replace the custom macros for initializing the attributes with a
> simpler function call that does not run into this corner case.
> 
> Link: https://godbolt.org/z/Wf1Yx76a5
> Fixes: 54076cb3b5ff ("hwmon (occ): Add sensor attributes and register hwmon device")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied.

Thanks,
Guenter
