Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D5A225A23
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832687; cv=none; b=s2Zrxq7PB7k8OOV0qZxhiPOcdQDX/5NUYxB25hCd/sdgmbJmNVMteMYDxUSwQ1SB5BVrmQsnqbctM7CEMnWgbvBKWb6vW5VwA/YY3VsCQOlIEN0AggjSL1gJTW/nA5x1Oj2KuGwyuCPx5S6Gmge/rl/MZV8Rsojy1FpU1snnWoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832687; c=relaxed/simple;
	bh=LP4dK31wcFSB2SAjUnFFSG15Ot8orCOC/FFNmbf4TaA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CWJlN5V49TVRhoPVqbBM/O7l/IF+im6NbINAdFN1LB9y2Fhtwlo17M8mUhnYiba0UddHyN3UEgL7QT1alWauo2g/5fEy0R1mK/zms617kc1uae2VDLGC1A5Np1kfVunqNyIgfNEv9rtMLusPViBFiLvA2XfnJFQfxWtQZs/rnNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hm5Gb2qE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hm5Gb2qE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso4057605e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738832683; x=1739437483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsyEsq1JFUX/+Vqr9eaRC5qhshNu0SP+iy3UfIGUGZc=;
        b=Hm5Gb2qEfKGwLe8YI8KxEb+EpqCsM8IXwjri5hLQGIKJG8Lnw1V+pg4mYG7PDeF1vb
         ZfKgYkK1DiGNkjrfYLgql4rgje9kNHnLBV3pCF1QtjG6xhhJTRAogDcn4NFf/JfXetk8
         ONvTX7kKGw9rO1px+qFxEHnfEmo293GuLENUbBzYOPaYOZnjcEcCBFYO1YiOuq8fuJar
         N23KZM/+xA8qP4WsSeZ45C036ICG7p/63gNMsim/5wSrp8Jr+k38Qjeirr2cxTQLWNRh
         ehhTttNaagqHuwM7WR4KFnwuIzp/xsIF0TKp5OCumaxXj/Mxf2cVlsp8CXz3KyEIX8H3
         Kbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738832683; x=1739437483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsyEsq1JFUX/+Vqr9eaRC5qhshNu0SP+iy3UfIGUGZc=;
        b=llmE/Dd5PDNbBFUsd/resVB8jZp/bkoXFoE+PrOUUpJzXdPL+T7yFHkqlsFpwt6SIf
         XwOwynNEBFEpL1jjD0ZHvDTavHN7IIaEEJDDpDnuDJ4D2N9L0jWXXX/rSf0HxL3wj2LC
         xFOZnbniUPPKMfGVOd3+K0laQxkIangYfLhGdm4jIn/3vXe2xvxZs+cUYrRf2SROeiU9
         h58tG66nGmYeNu9bhPYwecad4IZ1FNXGbo/0iGRO9uHfh9ksYZ2bfqrho0Sc2hU+ZDfg
         vD11Xlsu2A02gjKv0A1QsjX22LT9Sy2mD4WwN1sOA4kcBo0c/b0iJrDAf+SJnrymH23n
         SsPw==
X-Forwarded-Encrypted: i=1; AJvYcCWLYy9K4Y7QWhrIIVVP38Am/Qfx2gszyAKvSX64kZxXcFPC0COOzvgIBHXPU59uJM20gKAt6rAB9wRUcXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwShUHXcarO0/flutJ5DmpBbW1wigNI6hN2aMmmZTOEhIlLFjpH
	e1CcsxYlWuJhUnecryMfA43MQTNAuDrOUB7Ewe02pxYqJkz6IT2W
X-Gm-Gg: ASbGnctiuAouVMF/7FFrXEdom+Pn/Q6wjokWifML7H4cpXdwqG466UoEFaHKIE1IcFB
	+XmESgNQVdPogG/Jjn5T1VgBx2H42ejvOQBPb0p/SmJQ4MbS0kopxDO6tJyilbZd6ttSjySHW9Q
	6jNQKVklCh7/amd/7/7BxBc/UfdwhbrbBdhCRn2V6jhTAroo4TZILDZEQSPuJ/otsF4H31o6xN1
	aYyRoYckGVHIpJjaCyicewi//E265UZzHOGI0n+Wyd7AiQqM0ehp59jF6D1dwYy78hMcRUEERcN
	jqgtjXjt7lB7M2uH2mjca9nXRwKTVBNu7pcEwODy+mNPzPn2ZGPh2A==
X-Google-Smtp-Source: AGHT+IF9fy6M1v4d0lWhKbUDLOQiqlGUYo7EzNe2DjmFHvUdUwMdkQLZL5+HmiuJwmh09aueJUCXjg==
X-Received: by 2002:a05:600c:3c8e:b0:436:f3f6:9582 with SMTP id 5b1f17b1804b1-4390d433bbamr43134835e9.8.1738832682587;
        Thu, 06 Feb 2025 01:04:42 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca004esm12263035e9.13.2025.02.06.01.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:04:41 -0800 (PST)
Date: Thu, 6 Feb 2025 09:04:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Xu, Even" <even.xu@intel.com>
Cc: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
 <oe-kbuild-all@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, "Sun,
 Xinpeng" <xinpeng.sun@intel.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>
Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38:
 sparse: sparse: dubious: !x | !y
Message-ID: <20250206090441.56c61c27@pumpkin>
In-Reply-To: <IA1PR11MB6098B4AFF412D34D2F62C535F4F62@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <202501292144.eFDq4ovr-lkp@intel.com>
	<20250129222141.478c03df@pumpkin>
	<IA1PR11MB6098ECA558A36C0EAA1F21FCF4F72@IA1PR11MB6098.namprd11.prod.outlook.com>
	<20250205215650.1a93dc58@pumpkin>
	<IA1PR11MB6098B4AFF412D34D2F62C535F4F62@IA1PR11MB6098.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Feb 2025 02:50:17 +0000
"Xu, Even" <even.xu@intel.com> wrote:

> > -----Original Message-----
> > From: David Laight <david.laight.linux@gmail.com>
> > Sent: Thursday, February 6, 2025 5:57 AM
> > To: Xu, Even <even.xu@intel.com>
> > Cc: lkp <lkp@intel.com>; oe-kbuild-all@lists.linux.dev; linux-
> > kernel@vger.kernel.org; Jiri Kosina <jikos@kernel.org>; Sun, Xinpeng
> > <xinpeng.sun@intel.com>; Srinivas Pandruvada
> > <srinivas.pandruvada@linux.intel.com>; Mark Pearson <mpearson-  
> > lenovo@squebb.ca>  
> > Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: sparse:
> > sparse: dubious: !x | !y
> > 
> > On Wed, 5 Feb 2025 02:56:05 +0000
> > "Xu, Even" <even.xu@intel.com> wrote:
> >   
> > > > -----Original Message-----
> > > > From: David Laight <david.laight.linux@gmail.com>
> > > > Sent: Thursday, January 30, 2025 6:22 AM
> > > > To: lkp <lkp@intel.com>
> > > > Cc: Xu, Even <even.xu@intel.com>; oe-kbuild-all@lists.linux.dev;
> > > > linux- kernel@vger.kernel.org; Jiri Kosina <jikos@kernel.org>; Sun,
> > > > Xinpeng <xinpeng.sun@intel.com>; Srinivas Pandruvada
> > > > <srinivas.pandruvada@linux.intel.com>; Mark Pearson <mpearson-  
> > > > lenovo@squebb.ca>  
> > > > Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38:  
> > sparse:  
> > > > sparse: dubious: !x | !y
> > > >
> > > > On Wed, 29 Jan 2025 22:02:59 +0800
> > > > kernel test robot <lkp@intel.com> wrote:
> > > >  
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git  
> > master  
> > > > > head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> > > > > commit: a688404b2e20f00cce6d0a2b888ef4ca9154e144 HID: intel-thc-hid:  
> > > > intel-thc: Add THC DMA interfaces  
> > > > > date:   3 weeks ago
> > > > > config: x86_64-allyesconfig
> > > > > (https://download.01.org/0day-ci/archive/20250129/202501292144.eFD
> > > > > q4ov
> > > > > r-lkp@intel.com/config)
> > > > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0 reproduce (this is a
> > > > > W=1
> > > > > build):
> > > > > (https://download.01.org/0day-ci/archive/20250129/202501292144.eFD
> > > > > q4ov
> > > > > r-lkp@intel.com/reproduce)
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a
> > > > > new version of the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes:
> > > > > | https://lore.kernel.org/oe-kbuild-all/202501292144.eFDq4ovr-lkp@
> > > > > | inte
> > > > > | l.com/
> > > > >
> > > > > sparse warnings: (new ones prefixed by >>)  
> > > > > >> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: sparse:
> > > > > >> sparse: dubious: !x | !y  
> > > > >    drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c: note: in
> > > > > included file  
> > > > (through include/linux/mmzone.h, include/linux/gfp.h,  
> > include/linux/mm.h, ...):  
> > > > >    include/linux/page-flags.h:237:46: sparse: sparse:
> > > > > self-comparison always  
> > > > evaluates to false  
> > > > >    include/linux/page-flags.h:237:46: sparse: sparse:
> > > > > self-comparison always evaluates to false
> > > > >
> > > > > vim +298 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c  
> > > > ...  
> > > > >    297		for (i = 0; i < config->prd_tbl_num; i++) {  
> > > > >  > 298			if (!config->sgls[i] | !config->sgls_nent[i])  
> > > > >    299				continue;  
> > > > ...
> > > >
> > > > If zeros are unlikely the bit-wise 'or' is pretty likely to generate
> > > > better code than a logical 'or'.
> > > >
> > > > 	David  
> > >
> > > Good suggestion!
> > > So the code can be optimized to:
> > > 	for (i = 0; i < config->prd_tbl_num; i++) {
> > > 	         if (config->sgls[i] && config->sgls_nent[i]) {
> > >                                     ......
> > >                        }  
> > 
> > That just adds a level of indentation to the source.
> > It'll generate much the same code as !x || !y.
> > Both will generate two conditional branches.
> > 
> > It almost certainly makes in immeasurable difference here, but !x | !y can be
> > generated using (on x86) the 'sete' instruction to get a 0/1 from the x == 0
> > compare (that sets the flags), and then doing an 'or' and a single jump.  
> 
> You are right.

I'm always right (except when I'm not)

> I do a simple testing:
> 
> 83 7d f8 00             cmpl   $0x0,-0x8(%rbp)
> 0f 94 c2                sete   %dl
> 83 7d fc 00             cmpl   $0x0,-0x4(%rbp)
> 0f 94 c0                sete   %al

On a modern cpu those two pairs will run in parallel.

> 09 d0                   or     %edx,%eax
> 84 c0                   test   %al,%al

The compiler needn't to add the 'test' instruction, but doesn't really like
the fact that the x86 'sete' is only available for 8-bit registers.

> 74 0f                   je     1186 <main+0x3d>
> 
> Compare to:
> 
> 83 7d f8 00             cmpl   $0x0,-0x8(%rbp)
> 74 06                   je     116f <main+0x26>
> 83 7d fc 00             cmpl   $0x0,-0x4(%rbp)
> 75 0f                   jne    117e <main+0x35>
> 
> So you suggest I'd better keep the original (!x | !y) code, if just for unlikely Zero comparing?

Looking at the code I'd guess common case is that both values are non-zero.
So in the normal case both tests are needed.

The branch predictor will (hopefully) get the tests right after the first
iteration, and I suspect the performance of this code isn't that critical.

So while using | might be an optimisation (rather than a mistake)
changing it to || probably doesn't matter.

	David


> 
> Thanks!
> 
> Best Regards,
> Even Xu
> 
> > 
> > 	David
> >   
> > > 	}
> > >
> > > Will create a patch for this.
> > >
> > > Best Regards,
> > > Even Xu
> > >
> > >  
> 

