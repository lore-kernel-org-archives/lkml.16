Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36352C256D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926790; cv=none; b=msx4pAiREgjY01jo8XjUTFeBDSIpOLpE23Glsfa1+8qp0ypzZ80NN8Sv8f8Nc5JBKNzCd3/ZHuQNRmnsXe1cAQqelE2L8tVtGEBMf2JNLpo+3Fk7cLqL7JY1y/4Zw3ZPmW8TdgGIhWgifD8GIIAFr7lk7L7CEVJoHvG/GxvmY/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926790; c=relaxed/simple;
	bh=BwZDjGnAk1UJgl/brXYK/H4LstIXponojMQGkQ7BN0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtj/827qBolxT2eLYTBi5H7uC8YVj19tO5bQEPebsbebdPQiewr1JMjjMKGFLMwoHfn/UsuANekwoEQNMEo0TxVHDmiCCx7n6CEFaL0nCyFmiQ6Gc/hPoS9B0b9Vbht1OTavrN0eICEJNbvDr3PMb22HgGM+7CRY63V49Xmj9Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=c2giPj6k; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="c2giPj6k"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acbb48bad09so1098521066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745926786; x=1746531586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vjNdZRo+0JKNJCIrNVFAoCGrKjiVgsh/8WizVWXn7Jw=;
        b=c2giPj6kex5ZlKgncnCuv5Z+k9MUX5UXHI0vzCIbdLoSEVqHm0FbFmsBr6bSJDTXHy
         JDJMT30q0TQfniOtB1zmUTYJ4VpnRPxDUPG9BdUGFka9Fh1vk3mmopNlEeU+e0PDBWfw
         X6rEa5w7c9fv+9Mc0WZ+Ht5wlmPQrOsukC+ZzBnEjy5wMv3Y1IiqviFXwTqy6KOIcoJc
         rH/t+LjCJ8fp9sm2r5F1dYnLgRsopQGM6kLZCs5pdkAZgwz/2qOht1LGWlo8SLpFQYoW
         6g5DBIeOe4VbaU916SKrM1BDRS/AAkGezr5mAiZ5bVzIhCeGQP856JV2w3IXgVJ4J2mv
         iBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745926786; x=1746531586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjNdZRo+0JKNJCIrNVFAoCGrKjiVgsh/8WizVWXn7Jw=;
        b=rfKGS8eSp9J5TeLOg2F8zgEMHnVD5vOpdq3iz0UtllwJJf1+VIzV6rUusJYxyFmjs2
         ZaIHG9wBgKFwzbSpEjkopXUDzgmONE7DDwAzO70d8XkAY6LWzR3BPFYMfWLMnICJzBXH
         +HH+4hwjX0ZgH3wFH72VttVDa8lfH9jN5N+HTrFH6Tu+9DDpmWM2eWy8cJeKn8XYGgFx
         qLFjEfiSlnV8YIj3d0VX/6LVESKFw+/sxpzKQKWzmhzhi4kPxQDmM2CCV1zdmiF4vbls
         QMpAxWIMleYO5zam1ORf47EpJp5LGkTE92JDsqonn7IuENOBVQmcaPRMUR/3wS8M0uF7
         FOnA==
X-Forwarded-Encrypted: i=1; AJvYcCXwPYGu9RTvkEq+XAcTxgq1AntOkhKNiUHSmLG7i3kkhhRGgAK/lmbDanM3Ha7VsaGPVbHH6sQKzPizwP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnvG4isNJvHtRKiZcohb4kIzmZ9ZAG7ES+2E0VDmQH60WGa+gO
	nnmdAtUyU3aCqFPXjQh72gxE32l+kJyeIkMcTetwfzqZh3xs/ltwgg/+t0yn47s=
X-Gm-Gg: ASbGncscuTLy+RqU/QYhhQHT2PLeiM3dWPYX9hGhdnQpv1jEyZKr1sK52Ul/GgwTT1B
	iSBsU0dlaopDR/PP69GgMDtBnrpuCvo2YqI0XqoOX6KD2SCj4HPWXQQ3G+sxmyHRUHYQNQ+FTdc
	gTbRuPM/m8+RVS91LfsCWU0T2Nfcjmpb7FZ+2wiy1gOteTLEB5b3whIF9kwRNxF0t7bDkSfJmLO
	8CzXQWm3HTfOvWHyMpfnmOmLhdbnqkd7g/QpbC9Br0ZtvRD/CfqfPnMx7YjKUmABwC9G7RyyLbU
	KLgGxk557kvG49xX4MXGz9J5rtA5iEE1qBTMG8b2
X-Google-Smtp-Source: AGHT+IEvfTQCJKCNh3qhke/KxsW/y1p2uYXP6K9g5VKxCSG1GBRIRQqV1uYXaafKpVqcupU8bMrCXw==
X-Received: by 2002:a17:907:86ac:b0:ac2:7f28:684e with SMTP id a640c23a62f3a-ace848c2393mr1062210766b.6.1745926786169;
        Tue, 29 Apr 2025 04:39:46 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec0530c37sm169875066b.136.2025.04.29.04.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 04:39:45 -0700 (PDT)
Date: Tue, 29 Apr 2025 13:39:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	Kees Cook <kees@kernel.org>, tamird@gmail.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data
 in reversed host ordering
Message-ID: <aBC6f8Vmlik9ua0K@pathway.suse.cz>
References: <20250428123132.578771-1-pmladek@suse.com>
 <aA-0MuLxVTueDAhm@blossom>
 <PN3PR01MB959715E4B4C95911A60ED075B8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB959715E4B4C95911A60ED075B8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Mon 2025-04-28 22:38:13, Aditya Garg wrote:
> 
> 
> On 28-04-2025 10:30 pm, Alyssa Rosenzweig wrote:
> > Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > 
> > Since the other patches went thru drm-misc-next, I guess this should
> > too?
> 
> I think yes.

Yes, it would be ideal to add this to drm-misc-next as well.

Best Regards,
Petr
