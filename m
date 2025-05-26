Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F40258A;
	Mon, 26 May 2025 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748244721; cv=none; b=qbRBK6JKxi5k8W9NXx+JrWj3wWK+gekjYYk3V7+h63uny3yrCo6gOyD6TNJ/pwD25z79MTQqUQ3x4SCh8NKIixpy3juZBrqDanBXWiskzQC5v4DEF81oXzU5LeMIt1qF+3KBghNSA7S2ri12wjL8aTrLG4AIlHhDgggxlXBabUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748244721; c=relaxed/simple;
	bh=MO/4ARkNvR6Truprt23/4h1IxkmjVoXyFgAZc0Ho/vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKzRl5vfkpB7+Xb1ay0Qqa/r8yt5aOXjuIf1m/3C5pOs5XDI80tBqN3+EZex6Z+gIQyyRYPLB+25iW8wAQknCZn+It0cc6zaeZiv9c/bis1ZSgTMoe2MnlWzGYrsI2cn4CR+g7vU7xYlG4e5VfpFW3oVwgJ3QUVeEh6sFfP6AsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbBA7aNh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbBA7aNh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015A0C4CEE7;
	Mon, 26 May 2025 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748244720;
	bh=MO/4ARkNvR6Truprt23/4h1IxkmjVoXyFgAZc0Ho/vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mbBA7aNhItRnqtALzSE1jHexDePTqhVw9YIoRtxHOHP2G3Ndf/GFaCJlXAKtN3UwP
	 bTmSKc5OFoznrdWeOzN4xjDffDLgFYf7lOd4wKJjCFZ8NdrU8T48EpgAfvy4dvggXj
	 K0GIR8wdnfmeSOUT2YRSm7ig2y/gK7ISleBryf98oCKf6jZY9TrEdJrHVckKtI4Wta
	 gEmFZ+Xb+pL/RZ3tE5Rt/YIBVQUBegvXpTRO0ZCpuGvKO2vowtMZIJqdv5cvXyEdNt
	 tJ4+Chd8sis6e1ISEl5zGgqLYtWbmAbYCpId+gG5/pxrHrmvDcPFNQB87qCEuNyiZx
	 YEs1vl8p1IHlA==
Date: Mon, 26 May 2025 10:31:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com,
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com,
	corbet@lwn.net, rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com,
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org,
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr,
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com,
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com,
	vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Subject: Re: [RFC v2 06/16] luo: luo_subsystems: add subsystem registration
Message-ID: <aDQY2_XUBY9a6BsX@kernel.org>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-7-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515182322.117840-7-pasha.tatashin@soleen.com>

On Thu, May 15, 2025 at 06:23:10PM +0000, Pasha Tatashin wrote:
> Introduce the framework for kernel subsystems (e.g., KVM, IOMMU, device
> drivers) to register with LUO and participate in the live update process
> via callbacks.

...

> diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> index c2740da70958..7a130680b5f2 100644
> --- a/include/linux/liveupdate.h
> +++ b/include/linux/liveupdate.h
> @@ -86,6 +86,39 @@ enum liveupdate_state  {
>  	LIVEUPDATE_STATE_UPDATED = 3,
>  };
>  
> +/**
> + * struct liveupdate_subsystem - Represents a subsystem participating in LUO
> + * @prepare:      Optional. Called during LUO prepare phase. Should perform
> + *                preparatory actions and can store a u64 handle/state
> + *                via the 'data' pointer for use in later callbacks.
> + *                Return 0 on success, negative error code on failure.
> + * @freeze:       Optional. Called during LUO freeze event (before actual jump
> + *                to new kernel). Should perform final state saving actions and
> + *                can update the u64 handle/state via the 'data' pointer. Retur:
> + *                0 on success, negative error code on failure.
> + * @cancel:       Optional. Called if the live update process is canceled after
> + *                prepare (or freeze) was called. Receives the u64 data
> + *                set by prepare/freeze. Used for cleanup.
> + * @finish:       Optional. Called after the live update is finished in the new
> + *                kernel.
> + *                Receives the u64 data set by prepare/freeze. Used for cleanup.
> + * @name:         Mandatory. Unique name identifying the subsystem.
> + * @arg:          Add this argument to callback functions.
> + * @list:         List head used internally by LUO. Should not be modified by
> + *                caller after registration.
> + * @private_data: For LUO internal use, cached value of data field.
> + */
> +struct liveupdate_subsystem {
> +	int (*prepare)(void *arg, u64 *data);
> +	int (*freeze)(void *arg, u64 *data);
> +	void (*cancel)(void *arg, u64 data);
> +	void (*finish)(void *arg, u64 data);

What is the intended use of arg in all these?

> +	const char *name;
> +	void *arg;
> +	struct list_head list;
> +	u64 private_data;
> +};

I suggest to split callbacks into, say, liveupdate_ops so we could constify
them.
And then it seems that the data in liveupdate_subsystem can be private to
LUO.

> +
>  #ifdef CONFIG_LIVEUPDATE
>  
>  /* Return true if live update orchestrator is enabled */
> @@ -105,6 +138,10 @@ bool liveupdate_state_updated(void);
>   */
>  bool liveupdate_state_normal(void);
>  
> +int liveupdate_register_subsystem(struct liveupdate_subsystem *h);

int liveupdate_register_subsystem(name, ops, data) ?

> +int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h);
> +int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h, u64 *data);
> +
>  #else /* CONFIG_LIVEUPDATE */

-- 
Sincerely yours,
Mike.
