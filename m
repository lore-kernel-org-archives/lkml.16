Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050C97462;
	Thu,  5 Jun 2025 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139447; cv=none; b=HA7rOn9G1krYfSmc27t+bbwhZs7FAh7eTHiE+dFvSRAEIK026LAY8R6tkFXs8SZGtGvMzkr8+jw7UVLF1sZMPufQg8Kpx6VGHLlbYveHg5rvh3DnNCPlzSolrJBrb8jiGXxQbw79uVSPBGAMlqnIbeEeI2JXBy/atZh53EwhWFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139447; c=relaxed/simple;
	bh=UBysjsstSD1/iZwyVGE2p3qHDV0cPt51Aznc735XX5Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LGsoUARq4Z8IReEYGzbSnRbrQjQwkzn0NaS3a+Pg/F5ni2ySlj5ggeEslrCBM7XELPVMqwX6r/KwUVe7z/h7nplCO5Nb2i8v+mCGP7JQSphb8yBkh1wwlC/xy2RRqh3y3BK9C8TK0O9AHXm9SsGMG1WygRysI/80AGg5V42NuFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhFWAWYD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhFWAWYD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5038C4CEE7;
	Thu,  5 Jun 2025 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749139446;
	bh=UBysjsstSD1/iZwyVGE2p3qHDV0cPt51Aznc735XX5Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DhFWAWYDYDW66Hdk1CxVh1q2U3WmYDn8ThTTEN3uyutmc4T451vDPZzY+2IBkWRio
	 +W6dh7PUr9A0iphvG+p1zpmq7H+tAJgvBWbOpBKZTk88c4xwVwH1C5dzHU7bdo774p
	 h6xY9UCTaC37BIiQlfD8X1q7Dl7aQp3MWRuNTTXOAg5Povu/uLHJCeQYB6G4dyZoks
	 Tm+ugAlfgXMsJ31oGiMy/Cd5m/d3dTJZROmXBp3BUiprR4r3meaNyQA874bB6XaEnY
	 l2m14LdFFmoon3U8qh4RSZKLOL8mrBMWF2fQuNnlYMGcb3+bw5lTIcnkQsmGduam/x
	 Rhy9/iPgb+HKQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org,  jasonmiu@google.com,  graf@amazon.com,
  changyuanl@google.com,  rppt@kernel.org,  dmatlack@google.com,
  rientjes@google.com,  corbet@lwn.net,  rdunlap@infradead.org,
  ilpo.jarvinen@linux.intel.com,  kanie@linux.alibaba.com,
  ojeda@kernel.org,  aliceryhl@google.com,  masahiroy@kernel.org,
  akpm@linux-foundation.org,  tj@kernel.org,  yoann.congal@smile.fr,
  mmaurer@google.com,  roman.gushchin@linux.dev,  chenridong@huawei.com,
  axboe@kernel.dk,  mark.rutland@arm.com,  jannh@google.com,
  vincent.guittot@linaro.org,  hannes@cmpxchg.org,
  dan.j.williams@intel.com,  david@redhat.com,  joel.granados@kernel.org,
  rostedt@goodmis.org,  anna.schumaker@oracle.com,  song@kernel.org,
  zhangguopeng@kylinos.cn,  linux@weissschuh.net,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-mm@kvack.org,  gregkh@linuxfoundation.org,  tglx@linutronix.de,
  mingo@redhat.com,  bp@alien8.de,  dave.hansen@linux.intel.com,
  x86@kernel.org,  hpa@zytor.com,  rafael@kernel.org,  dakr@kernel.org,
  bartosz.golaszewski@linaro.org,  cw00.choi@samsung.com,
  myungjoo.ham@samsung.com,  yesanishhere@gmail.com,
  Jonathan.Cameron@huawei.com,  quic_zijuhu@quicinc.com,
  aleksander.lobakin@intel.com,  ira.weiny@intel.com,
  andriy.shevchenko@linux.intel.com,  leon@kernel.org,  lukas@wunner.de,
  bhelgaas@google.com,  wagi@kernel.org,  djeffery@redhat.com,
  stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 09/16] luo: luo_files: implement file systems callbacks
In-Reply-To: <20250515182322.117840-10-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-10-pasha.tatashin@soleen.com>
Date: Thu, 05 Jun 2025 18:03:57 +0200
Message-ID: <mafs0y0u6rx8y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 15 2025, Pasha Tatashin wrote:

> Implements the core logic within luo_files.c to invoke the prepare,
> reboot, finish, and cancel callbacks for preserved file instances,
> replacing the previous stub implementations. It also handles
> the persistence and retrieval of the u64 data payload associated with
> each file via the LUO FDT.
>
> This completes the core mechanism enabling registered filesystem
> handlers to actively manage file state across the live update
> transition using the LUO framework.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  drivers/misc/liveupdate/luo_files.c | 105 +++++++++++++++++++++++++++-
>  1 file changed, 103 insertions(+), 2 deletions(-)
>
[...]
> @@ -305,7 +369,29 @@ int luo_do_files_prepare_calls(void)
>   */
>  int luo_do_files_freeze_calls(void)
>  {
> -	return 0;
> +	unsigned long token;
> +	struct luo_file *h;
> +	int ret;
> +
> +	xa_for_each(&luo_files_xa_out, token, h) {

Should we also ensure at this point that there are no open handles to
this file? How else would a file system ensure the file is in quiescent
state to do its final serialization?

This conflicts with my suggestion to have freeze callbacks never fail,
but now that I think of it, this is also important, so maybe we have to
live with freeze that can fail.

> +		if (h->fs->freeze) {
> +			ret = h->fs->freeze(h->file, h->fs->arg,
> +					    &h->private_data);
> +			if (ret < 0) {
> +				pr_err("Freeze callback failed for file token %#0llx handler '%s' [%d]\n",
> +				       (u64)token, h->fs->compatible, ret);
> +				__luo_do_files_cancel_calls(h);
> +
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	ret = luo_files_commit_data_to_fdt();
> +	if (ret)
> +		__luo_do_files_cancel_calls(NULL);
> +
> +	return ret;
>  }
>  
>  /**
> @@ -316,7 +402,20 @@ int luo_do_files_freeze_calls(void)
>   */
>  void luo_do_files_finish_calls(void)
>  {
> +	unsigned long token;
> +	struct luo_file *h;
> +
>  	luo_files_recreate_luo_files_xa_in();
> +	xa_for_each(&luo_files_xa_in, token, h) {
> +		mutex_lock(&h->mutex);
> +		if (h->state == LIVEUPDATE_STATE_UPDATED && h->fs->finish) {
> +			h->fs->finish(h->file, h->fs->arg,
> +				      h->private_data,
> +				      h->reclaimed);
> +			h->state = LIVEUPDATE_STATE_NORMAL;
> +		}
> +		mutex_unlock(&h->mutex);
> +	}

We can also clean up luo_files_xa_in at this point, right?

>  }
>  
>  /**
> @@ -330,6 +429,8 @@ void luo_do_files_finish_calls(void)
>   */
>  void luo_do_files_cancel_calls(void)
>  {
> +	__luo_do_files_cancel_calls(NULL);
> +	luo_files_commit_data_to_fdt();
>  }
>  
>  /**

-- 
Regards,
Pratyush Yadav
