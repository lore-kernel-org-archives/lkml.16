Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B9C242D82
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573781; cv=none; b=tSCVYDc/uDUmjjFkhAB+kYHGw2oDBcDOcqsdByNnsRKRoFcGLBc9CGh94F/tPi01W6PqovP7Zs+CCXb+xcsTAhOv4vLsSbIVBjcWj8DPaLvok4siXKBWbdbNZnVWuqYMFJNvAzXucYZA8nFc9XMrbobFePeXbW0SLCXOwEPzpa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573781; c=relaxed/simple;
	bh=63M8EFXm8sBwKZFSPxGOeNfWKp+6FLaM+HabAL+PUKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8YYRS8H6hiZdUP2INHIxSmTYs//rflgtlZJmmQW5gfBxaO43ERujXavglLH5rXHYiEYkyVvX2A0X32WLiKuXunYBrOM/fPXLeeX7QeZUlr9Fbqzjc0FtmJYCfB8pck5RqP6QMWt8Cs41XMk6tOqUFfZYES6kvH6KFQhTvbNbpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bz+7CE2l; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bz+7CE2l"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fb0a05b56cso75970286d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749573779; x=1750178579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0CWEECpRT9Cmdly39tbOBk7JejOCx9iUlAXd39yK2Y=;
        b=bz+7CE2lMrG6RqQeVYq0GIQuxvLQA4G7yKkxSt403CmPuUP7g2uLLZai/twNfKG0mY
         gPOLLXfQGDPPiS0zA2A3J2J1yStBZljuWpEw/Ha0MYRiAhUCzLsieHNyWhZDniPJqLzR
         9nYzij9YfE08AStEugQ3biY/yyFQxTeOkXeTSwOV/gh4Pu25ET65TQo/jVRDdpaj0JUr
         tiNvR9oOycrU0o8hWUueua6dhErbVFIFEgumi4Ef9RhPmCOwN1EVFnLixYo/byTinqcE
         wZ4IGcgm3Xti9UNc3Zgbqn2MO+OZn6kaw+w2nSh596MWRsL6qZppqN8i8vqjqKsbG7nQ
         rstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749573779; x=1750178579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0CWEECpRT9Cmdly39tbOBk7JejOCx9iUlAXd39yK2Y=;
        b=MpCyfc6StMvb3OZUEW3efYHxB8O9e2ze4FvaCNl/28u5fvN01BE+wM1LtO/DcyNdiR
         /3Zqx6JfyXyzM5sPFZeFKiggvOltuJ8cqZArEzFaqwMMXxQDJQfrB6X5CGqEl5DIqDaO
         NorbtfhqVWYDV6DE9xlYOdlba4DZWxIRZD41G4rGMYiMsjmwfNBfRLFqxdFjGxLMKkQo
         5pXCPBjIcbgCCpJaMHWxrPX55S1qBa056sVtYndCq11r8t/Faburs1suOpfdfJ1SH4dE
         kCaUR7epyz1MgtP3gcmOO4kSDA885JCiopE/xltHSWXvaHMSe5+kWgdw9OlSs7cUOM6z
         xhgg==
X-Gm-Message-State: AOJu0YyAvwV/mNcIBVBhbeq/IKjAr1eYktRhZmwmRcDPzaoXPzPhyUbC
	V4aORXoY4VktEt2+GV/YuzfnTO07c03A7L8trGOVY8sRJoH9jmzvJVKFfnCBIw==
X-Gm-Gg: ASbGncup7YrvZky/+xyrizhQg2sis/Nvfr4Llzx9PFvin19kNWstXc745MkH6pBCWBs
	CNiShdSbfqe15XcGEIzelo3GWS/M5wF9uTJzBDHMg8yrb9RuJcMEwipLS3WSLuvRLpOPzcBceP8
	5HGFb/9NwwA+DfisIeupEBQk1O8m/qMCTKVenH8Qm2Dqt1ohZUgI0/GnEO6Ft6RpxMIBRCQJcRX
	H6zEapBqBbAwu+GNfIE/zRU98o9DvVZBJNu0Vz/ghOrPZMS3o4bK9DdSA4DZFnL7V6RG5xDnNfI
	7bpRS1mnR9+Dxvb1blfk6MDOmqu+gHeDZtm6pKc/pDrNJHpJKq0n4N48W8CL7EAMhkB5vO0wRaa
	M4+lb4HGJ6ZTqYbw5NqfFYk+xNCP5QBjHU39bJp68pj/OJ7E9YL7q
X-Google-Smtp-Source: AGHT+IEYEiSqaHdxm46rrnAh71iN23AAhX9Jl3CrrIidf9aMQL0RmyPHcVlV4Pkw4V7s2UUgh+FKMQ==
X-Received: by 2002:ad4:5cab:0:b0:6fa:ce21:cad with SMTP id 6a1803df08f44-6fb2c32b287mr2738866d6.18.1749573778290;
        Tue, 10 Jun 2025 09:42:58 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a608ff5sm722535885a.76.2025.06.10.09.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:42:57 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5862C1200066;
	Tue, 10 Jun 2025 12:42:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 10 Jun 2025 12:42:57 -0400
X-ME-Sender: <xms:kWBIaJS2MBRHeVgIu_Vr0wImDcwO5J6cu_RkaxyRDKXsWBJg_ExvWw>
    <xme:kWBIaCzRLE2SvdJpkcXdTjuXmDyjuA5ruoQ1YwjOJZlzgGxo8shBnNb990kYuafj1
    OEfuCr_fC3NlaXrRw>
X-ME-Received: <xmr:kWBIaO3v8hMvFHYa06eIgCVoFBJvNAZ7LWWRNpmnZxENpwDlk4-zje0sQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehvihhrvghshhdrkhhumhgrrheslhhinhgrrh
    hordhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepvhhinhgtvghnthdrghhuihhtthhotheslhhinhgrrh
    hordhorhhgpdhrtghpthhtohepnhgvvghrrghjrdhuphgrughhhigrhieskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpth
    htohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunhes
    fhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:kWBIaBCCXrvrYXxkRJ-CI6rI1ts3KPpmrI52c95mcnrgdAf0KW8EbQ>
    <xmx:kWBIaCiFG7MTFYhh4kZJS593gunRkHnNKyZ6CfMxk3siV_Ke1CrnnQ>
    <xmx:kWBIaFo-IO5pJ2WKef_R9JGr7LG_Ul_4CB7qJ480rMvmo1PBFZA_Kw>
    <xmx:kWBIaNj5VFVPDSgUxSfzGLaNSw8QOx4G2g5V8dqFV8htydY4gOU9-w>
    <xmx:kWBIaNQ9d1m_SMq7EbSC1DOWW3FdJ-_u6omb9wUP8jlZHUpEfNdo68Pt>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jun 2025 12:42:56 -0400 (EDT)
Date: Tue, 10 Jun 2025 09:42:55 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] smp: Fix typo in comment for raw_smp_processor_id()
Message-ID: <aEhgj793zqsdbp6m@tardis.local>
References: <d096779819962c305b85cd12bda41b593e0981aa.1749536622.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d096779819962c305b85cd12bda41b593e0981aa.1749536622.git.viresh.kumar@linaro.org>

On Tue, Jun 10, 2025 at 01:27:13PM +0530, Viresh Kumar wrote:
> The comment in `smp.h` incorrectly refers to `raw_processor_id()`
> instead of the correct function name `raw_smp_processor_id()`.
> 
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  include/linux/smp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/smp.h b/include/linux/smp.h
> index f1aa0952e8c3..bea8d2826e09 100644
> --- a/include/linux/smp.h
> +++ b/include/linux/smp.h
> @@ -234,7 +234,7 @@ static inline int get_boot_cpu_id(void)
>  #endif /* !SMP */
>  
>  /**
> - * raw_processor_id() - get the current (unstable) CPU id
> + * raw_smp_processor_id() - get the current (unstable) CPU id
>   *
>   * For then you know what you are doing and need an unstable
>   * CPU id.
> -- 
> 2.31.1.272.g89b43f80a514
> 
