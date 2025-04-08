Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587742550B0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151181; cv=none; b=Ud24vvU0LaEJGq8+W8dauCOlLSkNQ1EHyDmhp1PCL8Mts2TvJsxVNpsurrH/oxdNbWYczP31JUm2upYG6UunXnbSHjxbevWkW5zUZK8JzesPy7m7SB0z1uViZivY8RYtpAsIZzCdIV5JzbRwhEcnm7tGshO729L9LMayO9AB+nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151181; c=relaxed/simple;
	bh=RzMwxVv3Rdq1h37bOZy05l4H6nn0k9DEkiOylKCjz2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3NOWtplFNKO+cc6HYNtDquOyGotIVc8DY62+XGP6MOl2SdWDoZPzJ/9Gx1nNO4MEx5DSLn6vYYzvHH/kXz65DCWutKZjnjw4fWeJvE5nvcHctrcKdC5O7at//EHPltqMxQFtCiF/TGL+zt8b9yBhG7WTqv2dI/kP8eXXjf+ih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=evilplan.org; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=fail (0-bit key) header.d=infradead.org header.i=@infradead.org header.b=DAAHtIj0 reason="key not found in DNS"; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=evilplan.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=infradead.org header.i=@infradead.org header.b="DAAHtIj0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u3TatYH3QrXLN7ebYdITqrn/KzYt6PXiy/UuhcZpUnE=; b=DAAHtIj0+gh4xWLNrRsodVBq4S
	/1jSbyTS6oNWNiwyyJgt3I2cDEXrepgZ8SLp0HvkSSJfkNfEGepORrdAzhXqcniAK7oOhL+vlthee
	O6YEuQUrSJpym7Z3NByj4Eekzv0XfLZ7GLKd7Bhej8HK9QnHp57OumzlzhCiYA3scnbKMvh+oXx/v
	0pqGUJEiNWXGbz1X4TGFKddBKgNFehQqn2aHwW2JxgRMH4rLwSD8E9R09rdrC28xLdkhA6OyGc8aZ
	rIG/JNfGXKspEWAwMGki01HOykTaAUMXHhXBcoFASLCCnFQn9asbe5qCQwdxFY8aEcZLa12xz8Y+N
	J+Gm4Qqg==;
Received: from jlbec by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2HOW-00000002fu9-3wzt;
	Tue, 08 Apr 2025 22:26:13 +0000
Date: Tue, 8 Apr 2025 15:26:09 -0700
From: Joel Becker <jlbec@evilplan.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
	Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH 3/4] configfs: Correct error value returned by API
 config_item_set_name()
Message-ID: <Z_WigcRfU7iWnTVv@google.com>
Mail-Followup-To: Zijun Hu <zijun_hu@icloud.com>,
	Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
	Zijun Hu <quic_zijuhu@quicinc.com>
References: <20250408-fix_configfs-v1-0-5a4c88805df7@quicinc.com>
 <20250408-fix_configfs-v1-3-5a4c88805df7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-fix_configfs-v1-3-5a4c88805df7@quicinc.com>
X-Burt-Line: Trees are cool.
X-Red-Smith: Ninety feet between bases is perhaps as close as man has ever
 come to perfection.
Sender: Joel Becker <jlbec@ftp.linux.org.uk>

On Tue, Apr 08, 2025 at 09:26:09PM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> kvasprintf() failure is often caused by memory allocation which has error
> code -ENOMEM, but config_item_set_name() returns -EFAULT for the failure.
> 
> Fix by returning -ENOMEM instead of -EFAULT for the failure.

The original code would return -ENOMEM on allocation failure before
calling vsnprintf().  The -EFAULT was because vsnprintf() failed.

This changed in 707c62352909a when vsnprintf() was changed to
kvasprintf().  Since kvasprintf() only really fails on -ENOMEM, the
error code should have been updated at the time.


> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>

Reviewed-by: Joel Becker <jlbec@evilplan.org>

> ---
>  fs/configfs/item.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/configfs/item.c b/fs/configfs/item.c
> index 254170a82aa337d95cbfbdf1a2db1023db3a2907..c378b5cbf87d28387a509c3cabb93eccfb520c9c 100644
> --- a/fs/configfs/item.c
> +++ b/fs/configfs/item.c
> @@ -66,7 +66,7 @@ int config_item_set_name(struct config_item *item, const char *fmt, ...)
>  		name = kvasprintf(GFP_KERNEL, fmt, args);
>  		va_end(args);
>  		if (!name)
> -			return -EFAULT;
> +			return -ENOMEM;
>  	}
>  
>  	/* Free the old name, if necessary. */
> 
> -- 
> 2.34.1
> 

-- 

Life's Little Instruction Book #274

	"Leave everything a little better than you found it."

			http://www.jlbec.org/
			jlbec@evilplan.org
