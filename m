Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76234214A96
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 21:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738792615; cv=none; b=MCJNOOCLsTQwPd+zqqPfk4V5j5OBbawwWq/O2KfBQPWTiCHlDJP7jjjl7SfXHUR/NLtEYZ8ZIERnlgQUx2Y+Asy7WEZP3jVn4a+ED2hMl8d6Lq8C/B+mxbnJRUwzZ9BEmQCUILW51iBaTQOCZp9THfIesNwGEpoigMHwMtezsAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738792615; c=relaxed/simple;
	bh=4qql90pn4szEvuE1q2VwoHg70ZIx94oUk+Hs3pTwU2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tNyALQZDtkqsqKQVeD7lzb20eBJQCA+SIhUqm3APnfC+Td63r1WinzSHgkWYmpEikhCOJHLi0SVL+H1c2vM2JiRBPBTEr/Ciw4MhJbtDraRoTCSI+YrNEEfwjv5o8wi86NGepXxUAkMyZpqcYhL1QYqUEXDJNQcPT6vySjA0euY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7Zbi6A3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7Zbi6A3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so2298575e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 13:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738792612; x=1739397412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExpNnKUIu15RnPJeZ+26Wmgur2xuMxA57BJC1TlkS3k=;
        b=V7Zbi6A3Wc8DHvS/V+OxDhtOWTHrgjtiwsL3Lhwkf7OhEdDXmH9J5E0h+/FUq6gjb7
         ppVJRM+KX4SrUDqd2fKnwgkcxlWPQuBxnTf+VTR/2WjBnpyIY5HgkUDDXEc6APsuXsQZ
         qQUdNAX4EVaobf+Wg/MTRyn6JZWu8aN4TzfCBylq13BMidxj7OcBvsgak64xZ7jcYdEX
         EWc6dwd517ubwjzHPoExHKJzkXOr8/X7oN257oLy3SLpoP2JqMNe1CkvHUE595rti5ON
         jz8eObmQ3zcDccDl8DbVUz0ogXiVPlhq+liEWYa7x/Lk2Y9S8WwAyzmU4PyY5lJ2cyq2
         tvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738792612; x=1739397412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExpNnKUIu15RnPJeZ+26Wmgur2xuMxA57BJC1TlkS3k=;
        b=D60epFrECE/SYn4J0U9q9ZXNKlLyzRIV/72v1R9hZFG8KnhvBKk4xLZeGv/f3uFJAW
         k7GMqQPU+kX0smsZkhbmxczPBhK6awXGDRPQBQKBXIYer2iJ9gihN1VCL6XwDMrkfl1v
         TX2LkZIUh3Rm+3l4OI2EgyxGuNUKiGZw4uPzEFxg0r9AfqIes/FOHKVakLIriZg/h2P3
         EdB1sBFpFWatZGtZuEWZu9W2HMH71eEMVPXrJ3t+zOBWf2PHtM/Mtj1t+7i+GAKOZO4M
         QIr0G4BX5Q/FkfZ+wrrrFUiPyKESA5MvbhSBeP6Qc/mpCf0p3EUAfF3A+4A9+VhhdKPA
         b8Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUOIKYIDfcmXAu/BuqpbpneVQlSRdmclYbiosOw5q/M2ofKgkYi+nsDfzSdPOOuaXH0Tb9ASyj+SkMqEjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzixIQcsMrauRD/u5feuycwyDp3Eu5cQgTiKFJR3XsiW35pdYZy
	TjrKsweOqAcloypRA1gnT7C0fntyKNg2crFvimEACObaUSHZJISP
X-Gm-Gg: ASbGncumkuWhi85GB/+UkR/pJ13TwLgSNjkaU1d25yjhXIhdEQXpRuQwBRsvmlBIFYb
	s7c4kyJ5KomRdozDTzXhQnLqk3R3ijaQ6BQLZEJk8Y9vJIeZm3u3PIy/k2LNUpaw+1kIvI+OxHy
	v1T3ybRmUCxzhCgxIEZGeIuXB4T8+P2QgkMN782fcx7rAlgB+GSPdxHmaxpjosXF1Z0poqtiPJ5
	sstRnCPeRnmi3Fmqpy+nTIrBzWJaykOoQbhCEZpg5D96FXwbrYuGoKTu+082bHTGgYXmZ37SpTp
	SKkPonn7IW0yGsKnbLTnkgWV4ap7IEbJ1Lh5+lzZiB3vY2sbj6DAng==
X-Google-Smtp-Source: AGHT+IF9Lnac8vLx0Lch1E/U4g3+70BcOuxYX6wPveyHWXIkh22if2ugk0Wjk5x+SbNJB9g+wbpVMg==
X-Received: by 2002:a05:600c:314a:b0:438:e256:a77d with SMTP id 5b1f17b1804b1-4390d43db08mr38919505e9.15.1738792611470;
        Wed, 05 Feb 2025 13:56:51 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf896sm20490902f8f.94.2025.02.05.13.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 13:56:51 -0800 (PST)
Date: Wed, 5 Feb 2025 21:56:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Xu, Even" <even.xu@intel.com>
Cc: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
 <oe-kbuild-all@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, "Sun,
 Xinpeng" <xinpeng.sun@intel.com>, "Srinivas Pandruvada"
 <srinivas.pandruvada@linux.intel.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>
Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38:
 sparse: sparse: dubious: !x | !y
Message-ID: <20250205215650.1a93dc58@pumpkin>
In-Reply-To: <IA1PR11MB6098ECA558A36C0EAA1F21FCF4F72@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <202501292144.eFDq4ovr-lkp@intel.com>
	<20250129222141.478c03df@pumpkin>
	<IA1PR11MB6098ECA558A36C0EAA1F21FCF4F72@IA1PR11MB6098.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Feb 2025 02:56:05 +0000
"Xu, Even" <even.xu@intel.com> wrote:

> > -----Original Message-----
> > From: David Laight <david.laight.linux@gmail.com>
> > Sent: Thursday, January 30, 2025 6:22 AM
> > To: lkp <lkp@intel.com>
> > Cc: Xu, Even <even.xu@intel.com>; oe-kbuild-all@lists.linux.dev; linux-
> > kernel@vger.kernel.org; Jiri Kosina <jikos@kernel.org>; Sun, Xinpeng
> > <xinpeng.sun@intel.com>; Srinivas Pandruvada
> > <srinivas.pandruvada@linux.intel.com>; Mark Pearson <mpearson-  
> > lenovo@squebb.ca>  
> > Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: sparse:
> > sparse: dubious: !x | !y
> > 
> > On Wed, 29 Jan 2025 22:02:59 +0800
> > kernel test robot <lkp@intel.com> wrote:
> >   
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> > > commit: a688404b2e20f00cce6d0a2b888ef4ca9154e144 HID: intel-thc-hid:  
> > intel-thc: Add THC DMA interfaces  
> > > date:   3 weeks ago
> > > config: x86_64-allyesconfig
> > > (https://download.01.org/0day-ci/archive/20250129/202501292144.eFDq4ov
> > > r-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0 reproduce (this is a W=1
> > > build):
> > > (https://download.01.org/0day-ci/archive/20250129/202501292144.eFDq4ov
> > > r-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new
> > > version of the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes:
> > > | https://lore.kernel.org/oe-kbuild-all/202501292144.eFDq4ovr-lkp@inte
> > > | l.com/
> > >
> > > sparse warnings: (new ones prefixed by >>)  
> > > >> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: sparse:
> > > >> sparse: dubious: !x | !y  
> > >    drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c: note: in included file  
> > (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, ...):  
> > >    include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always  
> > evaluates to false  
> > >    include/linux/page-flags.h:237:46: sparse: sparse: self-comparison
> > > always evaluates to false
> > >
> > > vim +298 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c  
> > ...  
> > >    297		for (i = 0; i < config->prd_tbl_num; i++) {  
> > >  > 298			if (!config->sgls[i] | !config->sgls_nent[i])  
> > >    299				continue;  
> > ...
> > 
> > If zeros are unlikely the bit-wise 'or' is pretty likely to generate better code than a
> > logical 'or'.
> > 
> > 	David  
> 
> Good suggestion!
> So the code can be optimized to:
> 	for (i = 0; i < config->prd_tbl_num; i++) {
> 	         if (config->sgls[i] && config->sgls_nent[i]) {
>                                     ......
>                        }

That just adds a level of indentation to the source.
It'll generate much the same code as !x || !y.
Both will generate two conditional branches.

It almost certainly makes in immeasurable difference here, but !x | !y
can be generated using (on x86) the 'sete' instruction to get a 0/1 from
the x == 0 compare (that sets the flags), and then doing an 'or' and a
single jump.

	David

> 	}
> 
> Will create a patch for this.
> 
> Best Regards,
> Even Xu
> 
> 

