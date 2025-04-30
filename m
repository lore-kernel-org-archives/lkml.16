Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB197F7FC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745978269; cv=none; b=IF9BKO23OxcBaXKMQv6rtPHdyLYpEA6fy5E8d1ghA4fXEWKygecwRuLybeVnOwqz0sCwMyMsiDsg4q0ePAWSp1ZDudyA0jjBXkSEwzw2+OzbPWGXjcSY9yPLqwnooGMUqVrVkoqO+N1I3vJ8OM+BBssQRwePFoTdO6OgRXHNlFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745978269; c=relaxed/simple;
	bh=onDw+KF/VTFjCin01iqZIboAsgIfjNYKeNCEdO9IYiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IeiKN2xthkaWIRnqauxVrgvZxUlve/B83tWR25vazi3iU+WYdoVoOTjeRuGIUTx2vPnjo+/xsT2CpD79Lauy/sK+SRbCdOUfCeb60TflmcmEDfegT8RwewvtDzcKcQWUsbudO6fN3p8k4Ttwo2wvCHy3W5totnjwCVRCrucQ6rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jGZn5LSP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jGZn5LSP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227c7e57da2so57401065ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745978267; x=1746583067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=clnT89Mi8scDqk+vtaxF+ZKjfCi67lZOnmPiFJKa6io=;
        b=jGZn5LSPKeruW/5a5Sa+FZp0/H64LXIkt4JcGOIPbiXMmaUjKUfbHuGiZPAjGqf2ZE
         /mFSA4cbp8PmKH02k9zQEfi8349sUbOw/mYNP4jHs/rMy7kqu0To1PfC+3R09G79XmcH
         G4ykqySbtQxpsQBST5pOPEEAyPzAImy2TuPI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745978267; x=1746583067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clnT89Mi8scDqk+vtaxF+ZKjfCi67lZOnmPiFJKa6io=;
        b=hrOH4VtQmzRjEsgW7XiO6kyDzc/4BwSAQNzYRFCG00A0XrzHgDNzQGQxOkSfUN/WVW
         UcOCA/WPJD4gF78j4+VyBniKfk/mgoRYTdU6HTWHYyO2g5J82yCJ/dKx/NWYE9ENuVEA
         iuZ3LtpPQ9eOJIAMOCbcfAWcRTBSSHSzh+JByund1LiPYPxLdrgRBBjZTCcNMgkfp5Vy
         KEFoe889x10WcImTL5mFx5Ojz4GAkwVkFkQ0511PBJdjBpZmAXXm5VtCXW3jtRTT9FmL
         LxoPMVxJ2JMJR5lhmD6xe+TM93iz89VpBSM1inXrM/SZ4V7ocQ2f40bcxIOouvqr/bB+
         00ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzRpSaIMR4ZpjWwEoqC6ZZxhN/is2N6ei3IUFqrOTcpLy4qca9DAAh4H8YpQwfWt1rxFKWOay7UUvhfcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwIAe7lxrWilb+CK7P4gr6bljXxtdYoRnWtV2GaMn//EoKo5eD
	66s0SWAOKhwiT1M7EPKNWlGqou4SYdMg5TXs//QOW93ETEVZem0YhbGDrTskbg==
X-Gm-Gg: ASbGncsI+IzzIEdNzsojhzcVk6IpT9hPtswBf3Dn8jih0zw7T2Mcwa4nvGHeKnTyJ53
	F21hfimcjaupDIZn7nWWtBF/j8upjz6qpdEsTn0Io7QuICfWfRSuG8f1GC/3SVZk+qXVtrXlAPA
	UAQENMGL6dLL82rnWqK92wA1opoN+FBrxlnTssCZBPDXGm78H0UmmIAyHQ9QBfmDUAgw0d2zXSs
	WXMgZDyqN3E0JblQHIbJvcHIGqEksHtTQgATWTBf/kPzVE5KJqL3tsTNSot6VVUaDC3HxKkiNM0
	X0YftaIvw8nz6q/KKpkPvjwD17w40tY8U9x3hegJthkr05AhAT/QoZ8=
X-Google-Smtp-Source: AGHT+IGavAmdfeIHdyEnXgZ9PB3ruNCoy/TmaaEcl+2yoVdiYORA0VXpaHzLWY/wbqTnph9a5jvQKw==
X-Received: by 2002:a17:902:ebcc:b0:223:f408:c3f8 with SMTP id d9443c01a7336-22df578bcebmr13047955ad.14.1745978266913;
        Tue, 29 Apr 2025 18:57:46 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:92cd:5354:744b:319b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dc3bb4sm110269335ad.99.2025.04.29.18.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:57:46 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:57:41 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Tomasz Figa <tfiga@chromium.org>, John Ogness <john.ogness@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] hung_task: configurable hung-task stacktrace loglevel
Message-ID: <z4w5bgiith2bonfofdqr5w2xasqoy4ooq2sbmr2gbihrfsvxw6@tgjys5bwg6fd>
References: <20250424070436.2380215-1-senozhatsky@chromium.org>
 <aAoZbwEtkQ3gVl5d@pathway.suse.cz>
 <xhkbymqobtva6j7xmwzvh5g2tvuixvu2hwfdozed6hijrt3vkl@rywdhz43e52y>
 <aAuie7Pgm3_9MsXK@pathway.suse.cz>
 <3f5nqvveevlfabujnmc7ume54y2zga6ovtxdnpmneynonw5m34@2t677akblpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f5nqvveevlfabujnmc7ume54y2zga6ovtxdnpmneynonw5m34@2t677akblpd3>

On (25/04/30 10:34), Sergey Senozhatsky wrote:
[..]
> > int printk_report_start(const char *lvl)
> > {
> > 	int report_id = atomic_inc_return(&printk_report_count);
> > 
> > 	if (printk_force_report_loglevel)
> > 		printk_force_loglevel_enter(lvl);
> > 
> > 	printk("%s---------- Report No. %d start --------\n", lvl, report_id);
> > 
> > 	return report_id;
> > }
> > 
> > void printk_report_end(const char *lvl, int report_id)
> > {
> > 	printk("%s---------- Report No. %d end --------\n", lvl, report_id);
> > 
> > 	if (printk_force_report_loglevel)
> > 		printk_force_loglevel_exit();
> > }
> 
> Looks good to me, however
> 
> > My problem with the log level manipulation is that I do not know what
> > loglevel right.

We still might want to introduce CONFIG_CONSISTENT_REPORT_LOGLEVEL.
