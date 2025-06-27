Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2719C2FB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751055332; cv=none; b=fOutprQc/Zhtfcun24cE96GgcXI2rCqcl09Xvw81+zB1Hm47Qk75HkUm8a/YSj+u5R09dxXNH40HuTYN8UzMe+O167pVzE8JlX3gN8aIxSxF2u8q8IHPtRfLrWWmm8IFB4Ntveh8cj0X0uq3C3FC1yCXWlXEdzLBWFb48iPVei4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751055332; c=relaxed/simple;
	bh=fhJzl/BU8BwWcrvqa0wNq4MSNWvssLce9yTWXyJlRKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4BBe5uODBH9F0iAHEGP0PjGOM6N3fNpgY4s/a5En9I1QwlGhU6Al81UgP+QdYpzNDxieechuAgYSE9IaIeswZfW20uqBySRj59XR2/8esZsilnCkmFrgBVnfV4KrUuTh86mo7YGxfTE+on1FohiTmd1rVhgsAj20KieXzAwHg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tDoMwArZ; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tDoMwArZ"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-40791b696a2so833900b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751055330; x=1751660130; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kEIb/b8zfSQ8Wgz/gF2ijAZBGf1xUf7mBAxLOW/TZ2A=;
        b=tDoMwArZwzY75qeEkmzrbh0/M1AemIoEv9vxKuyqt6zUFUWiekpwdZV0QSv8uAbn31
         p3c4JpeJ7aZ2xbjch1uOxkD1FF/G5qfujYQZSmMBCKZR/Tv9zrw5Dm7ocNEb3ppBFAyN
         JVEs53876JVZ68fQrKGOVrV75o1Q2I5Kujg8uQ9QpGGxDBPn5YBnNVEEsH+Hsc4UfODi
         sptqFg82iP4UemIRstAOl+pPjX/fN10V3EoXowGSoUeFcIYeD1qcL8Egdo9tgh/NkqLB
         i+u7eaptjTIq5hM6cYHwSmqFmWPaxYeE3atDF9aZz0VbS2aYd/z4OBxar61rEGiNr1xk
         QVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751055330; x=1751660130;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEIb/b8zfSQ8Wgz/gF2ijAZBGf1xUf7mBAxLOW/TZ2A=;
        b=ugVnP2PNpx8cgSuk/qGk7Cogf5x73wwupsyVUTOFHqLtZX1GBAaDAZ5acQJTsVPsXw
         P68/0R6CxNs2GLXXmonoBPPy+4mgrlKlL1Cn/p1Lbyiu6TvctJ2zP7fmBxSHBJAENr2v
         y3ZT/74knSNDkKNbrvmLaveDwYsfp6SzETEfi2A8EsPNcPEjcI6hPNmYrN5ByN0/Y86k
         n6+pR/T5IObJnN98WDIAkstSwHcNyhiHdZb8I+Is7Yr48ibX7/ixE3udSzkll4z50TQy
         4rZGMHKfNLU6N7Izhpu7okXG6oV4R0ME/FFSJ78iqmF6pFLIjKGBte0vTZ0VwE9FdNjS
         rnUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjI9coUFIo3GhJzcJOn5hVMrsLMyszzaRBDRDf98Ce3KpbDsA87pSN/XWhivxsO7Y6XtJZHMeRTpWF8dY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIX+5/6XZ04O1/kY4p23isk59N+ouXdiGAuhL9N4vYK9R0Jhfn
	gU6k4Uo3potIgbir2yB9D22F5F4OJ4jPe1PhCmdNzC7WEqESga5uzElBEUb1vh8hkv8=
X-Gm-Gg: ASbGncv/tRkk+czoFGOU3eg8MUHnAhRaCKvJzF8v7+aYLNXaiyLRLPInh9HoyvFLnwJ
	DVQ+t6rvTkxqs6bOrnLtP8fzudxlSPBvyk2HFGBng+kZ1v+LgvAiAooBXSFoTRPW4zznCc+lMAv
	uJuWN+GuwiWKngyQ9JOYUtkjsNgOZMpKbWLHty+d00O+jOQjQi5vokc2GsmMAL6fgebKIbx9BQ3
	l4qzMNJSQEqovkI9RpjVtpmVlpHQo2+ddNkC+vZUcNUWSlqzumHZvnrf86gM2g66XPzQc8ZGtNJ
	+fIhGOB9b8bsii46ut+Nn9HrwHO2VuEK5Skc4pdpEFKaXxEWLgqT84IoA4NhA/qbqu9WqA==
X-Google-Smtp-Source: AGHT+IELqMvmlnygIS4B9arBKFzvmzktHr65gCsThSoqSAND4qXrdXRwMi9SILSeCCyt72INteDqqA==
X-Received: by 2002:a05:6870:3118:b0:2d5:2955:aa6c with SMTP id 586e51a60fabf-2efed72bbd1mr2960606fac.31.1751055329792;
        Fri, 27 Jun 2025 13:15:29 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-611b85c79e6sm335864eaf.38.2025.06.27.13.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 13:15:29 -0700 (PDT)
Date: Fri, 27 Jun 2025 23:15:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdalla Ahmad <Abdalla.Ahmad@sesame.org.jo>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul =?iso-8859-1?Q?Retourn=E9?= <paul.retourne@orange.fr>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers: staging: gpib: minor fixes for some C macros.
Message-ID: <2cf34cff-717b-41b7-96ba-2041028bc0f0@suswa.mountain>
References: <20250627193613.552193-1-abdalla.ahmad@sesame.org.jo>
 <4edd380e-6314-4fa0-8051-ac55144e061d@suswa.mountain>
 <AM9PR08MB61145157B28A55649F155F2AA145A@AM9PR08MB6114.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM9PR08MB61145157B28A55649F155F2AA145A@AM9PR08MB6114.eurprd08.prod.outlook.com>

On Fri, Jun 27, 2025 at 07:53:21PM +0000, Abdalla Ahmad wrote:
> Hi
> 
> > This breaks the build.
> Sorry but how is this breaking the build? Putting checkpatch.pl aside, intuitively it makes sense to wrap long macros in parenthesis to avoid compile time errors and runtime bugs...
> 

Take a look at how the LINVAL define is used and then try building
the gpib_bitbang.o file.

$ make drivers/staging/gpib/gpio/gpib_bitbang.o 2>&1 | head -n 30
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC      drivers/staging/gpib/gpio/gpib_bitbang.o
In file included from ./include/linux/printk.h:616,
                 from ./include/asm-generic/bug.h:28,
                 from ./arch/x86/include/asm/bug.h:103,
                 from ./arch/x86/include/asm/alternative.h:9,
                 from ./arch/x86/include/asm/atomic.h:7,
                 from ./include/linux/atomic.h:7,
                 from ./drivers/staging/gpib/include/gpib_types.h:12,
                 from ./drivers/staging/gpib/include/gpibP.h:12,
                 from drivers/staging/gpib/gpio/gpib_bitbang.c:56:
drivers/staging/gpib/gpio/gpib_bitbang.c: In function ‘bb_read’:
<command-line>: warning: format ‘%d’ expects a matching ‘int’ argument [-Wformat=]
./include/linux/dynamic_debug.h:224:29: note: in definition of macro ‘__dynamic_func_call_cls’
  224 |                 func(&id, ##__VA_ARGS__);                       \
      |                             ^~~~~~~~~~~
./include/linux/dynamic_debug.h:250:9: note: in expansion of macro ‘_dynamic_func_call_cls’
  250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/dynamic_debug.h:273:9: note: in expansion of macro ‘_dynamic_func_call’
  273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/dev_printk.h:165:9: note: in expansion of macro ‘dynamic_dev_dbg’
  165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~
drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro ‘KBUILD_MODNAME’
   28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
      |                     ^~~~~~~~~~~~~~

regards,
dan carpenter

