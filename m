Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADF220459F;
	Tue,  8 Apr 2025 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744099805; cv=none; b=hZqtBqnGg+9i6ReaWQDgqQBRT9YidN3N+Q6t8POSm8/PuWsNggq3Y8wBTyKQA12fZMTBYWOZMh1kcnxQgtn3teNqRQOqALRs3GhoOLul5zQG4jhz3YmYdg/3+7NRFdciUOL7y4zJpA4HeH+fmLefcQUaxJHJR4Vr0jlkkIbUSUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744099805; c=relaxed/simple;
	bh=KuTOWjeh1mKtEtTStWh2LsIuxKIuB+Nc0WiTwPf/dYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQ62gqob5b47MywqSmx+b2dyej2C5Moe746JuzNLVr3s9ga8bL7rh8pcY/T5ccdTKqcOYZilM06mI/4QilwAeEksph39fB3xyg684FcLyomdlOBsYhA4ExR+4p/rweMW5+EicPrWIvQ2Xzb/AMn/po1nPSeUgV93vVeLUcp1aUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQoqcgoS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQoqcgoS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271AAC4CEE5;
	Tue,  8 Apr 2025 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744099804;
	bh=KuTOWjeh1mKtEtTStWh2LsIuxKIuB+Nc0WiTwPf/dYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQoqcgoSrZuDSLOM4aBawP4yEXKXh1leZyLF2XgXF7P/P7wvzSU8Dwecwfen73Pgy
	 GC3RsB/XhCizUx+AcG5ydDy4drxJqwE04ocNLxscB8cgyIahM9nab2jXD3V9zsHbkL
	 8EGtu4H5gc2KHE1lo4DvPaxYswmtRhYq/PMxl1p89yVP3tBE5FlDoDixDUeD3vyZiv
	 Ew6KqSp4CkM8gJYPjq+VKOyVYiq8yLlIFHAFcas3F40N6p5UnIRkVamFmeE77MX8CT
	 GDzNt+E7w3dFZdLC5IqTVKpMrTslDPIsY/kp98mZ0t9wsqh64L+foU+hGB8JMwQ0Eb
	 e/lI6rkaQSNiA==
Date: Tue, 8 Apr 2025 10:09:59 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Malaya Kumar Rout <malayarout91@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3] selftests/x86/lam: fix resource leak in do_uring()
 and allocate_dsa_pasid()
Message-ID: <Z_TZ138UxQ_uZzys@gmail.com>
References: <Z_QXURMplbCtx-YB@gmail.com>
 <20250407193449.461948-1-malayarout91@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407193449.461948-1-malayarout91@gmail.com>


* Malaya Kumar Rout <malayarout91@gmail.com> wrote:

> Exception branch returns without closing
> the file descriptors 'file_fd' and 'fd'
> 
> Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>
> ---
>  tools/testing/selftests/x86/lam.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/x86/lam.c b/tools/testing/selftests/x86/lam.c
> index 18d736640ece..88482d8112de 100644
> --- a/tools/testing/selftests/x86/lam.c
> +++ b/tools/testing/selftests/x86/lam.c
> @@ -682,7 +682,7 @@ int do_uring(unsigned long lam)
>  		return 1;
>  
>  	if (fstat(file_fd, &st) < 0)
> -		return 1;
> +		goto cleanup;
>  
>  	off_t file_sz = st.st_size;
>  
> @@ -690,7 +690,7 @@ int do_uring(unsigned long lam)
>  
>  	fi = malloc(sizeof(*fi) + sizeof(struct iovec) * blocks);
>  	if (!fi)
> -		return 1;
> +		goto cleanup;
>  
>  	fi->file_sz = file_sz;
>  	fi->file_fd = file_fd;
> @@ -698,7 +698,7 @@ int do_uring(unsigned long lam)
>  	ring = malloc(sizeof(*ring));
>  	if (!ring) {
>  		free(fi);
> -		return 1;
> +		goto cleanup;
>  	}
>  
>  	memset(ring, 0, sizeof(struct io_ring));
> @@ -729,6 +729,8 @@ int do_uring(unsigned long lam)
>  	}
>  
>  	free(fi);
> +cleanup:
> +	close(file_fd);
>  
>  	return ret;
>  }
> @@ -1192,6 +1194,7 @@ void *allocate_dsa_pasid(void)
>  	if (wq == MAP_FAILED)
>  		perror("mmap");
>  
> +	close(fd);
>  	return wq;

So in your previous patch you closed the file before the perror(), 
presumably so that file-leak detection in Valgrind or whatever tool you 
are using doesn't trigger.

But here it's done after the perror() call, why? It's perfectly fine to 
close the mapping fd straight after an mmap() call.

Finally, it would be nice to quote the before/after output of the leak 
detection tool you are using.

Thanks,

	Ingo
