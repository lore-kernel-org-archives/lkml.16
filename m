Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BCB1917D6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851823; cv=none; b=IGZH3oV6texurWASgtE67KyYUGqCp15sIEBMMvbjq6loJGw2RFgV5myowxWqOsvn/Wz5zX524mxWXh4T9LOBclkZHE9dSV/8zydX7objolKqie6VkmolPFIlBhxuBmUTbx0WNb1FUl1MAgrGcMKl9RUC8LATC/4ik4EF9aFEkYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851823; c=relaxed/simple;
	bh=cEDi9ZKMQju5O/ESIIPxFOhF8RL9fAcN9hpv1FMsk10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOzvSjR0oPmkhX0yIougYHCsQtbsfplhHqNJnfB8Nl3JUG+7h9nc6dUZ7PqFvicatxraP7I5FnsOG1vsm/3Yk7RUnBis2WKODFcCYnmWmcPF1TMTsP5gp0TCDTE+hAe3MRMHvWhrt3dQasqVTDw7lBMPp73lya41p8Jc/+fybG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UvOROsfN; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UvOROsfN"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-40a4de175a3so4388500b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750851820; x=1751456620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XR0h6nvp/9pR9PG0WAomd1E7a7QNXrG2eff2Y2JJpOo=;
        b=UvOROsfNS0XCVqB+C1kcFiBIj6X7jF/2vt2WJzGjDj2D7bbb6CMWCD0dAr1gU8IWwq
         IDnKoDUJBvKUdDZ48pfRhsYx0x4Cutmn8owqBzAqgj2XwLmYp7x6ptvDMfcyf05Miw7m
         ykQMoN8hvsj2RA13igKti4BfwyGLpMRan7pFWtr7kLHfdN1K1tO7VhP8knz2Pe4oLVya
         ZgKUfF5NihPUgrMckMf6YlUAaD8yXzANGRKEeHP47qC2pfDiUSU0ov5/3+0TZX3kSS6o
         Tv+4zOjadDPgxgkB8OnyLEWrnHfHiB9vaNHjaftbqliBsEG4SlnaBOaMdxZZ7t+RWNBC
         a1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851820; x=1751456620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR0h6nvp/9pR9PG0WAomd1E7a7QNXrG2eff2Y2JJpOo=;
        b=c8TvejrVd95wKqUyA7ZQNUfhzR1QzQfsLlrMNqI6avXEOxJVxRMaNq0aYrWq3/yFTB
         +teY+ny++4wWrQecbi/pe4/if/lB2282U1CrH8BAmUhuVXGipAHHHeOtNPSRlRummkgl
         LKOel0IOcrul/rqBpmea4umhaI3us+At94NS1asjG0Qt2AwBzbAVyxkIhB6cC86ob0yy
         cldmbiLUTEBMbhSva4pjI56iRuoktEg0MuzZnhXQuNaxUkvUzUt2P0XydVkNaEUB42y/
         dnKLP6B5XAIuaUmyLMgD3M9eNSLzqCSbRVQWN9EDtPqhlnP5uqtODlaxmCWgj2A2hnZq
         riRQ==
X-Gm-Message-State: AOJu0YwNu09pGjeyTI5LlCMxtrNvohBhq04MzkuLR0332zHRm56RF3QQ
	zetmwVmIkcPw+eMBtWnuQJAWCgIqkSN5EzFDt2TTE9MMcPYqa643QTMWU6xxPqvaCYA=
X-Gm-Gg: ASbGncsAOK9ubG0QgMZt5CsiATaJmFwEOyJh3uAiEgd7d8m1hsN0Oy4saPzSRB9xVBg
	/B1pQ3a0N5djdDC9SCHt7NJvf88YWnd4RyFyIFsi1F8nTIlLgjOlFEIOCLk1kqfB7JFmEISoQCU
	/IDu++KNiLrVqh9s09PJir7fBVUaeu9zaErAkBoFGg7xxkapcsB/uk55Bv6XsG/UNFvfiq9+D4C
	/f5YQWjmhJORJ98qgBQmX5m5Xua6JnCj0/JU1M8DQ6OzXhDFZM7rLDYkHtmd58YzHm2ndTmhkDH
	5pqne5zpi4weiF2XVuPHJn0oMiW0JNo8gFGmxc/JjIoPo0MhZKSeUNFec/iupuK7+Ouvlw==
X-Google-Smtp-Source: AGHT+IGHbPCyH1l2CklT51825R4v7DezvBt+8FBSn2k+YzHNVnUrJ0xW7pjHWydN10rMm8JVVrtnNw==
X-Received: by 2002:a05:6808:30a7:b0:3fa:7909:2716 with SMTP id 5614622812f47-40b058246b3mr2209518b6e.39.1750851819874;
        Wed, 25 Jun 2025 04:43:39 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b7a1cf9sm1601911eaf.24.2025.06.25.04.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:43:38 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:43:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akshay Gupta <akshay.gupta@amd.com>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de,
	shyam-sundar.s-k@amd.com, gautham.shenoy@amd.com,
	mario.limonciello@amd.com, naveenkrishna.chatradhi@amd.com,
	anand.umarji@amd.com
Subject: Re: [PATCH v2 2/2] misc: amd-sbi: Address copy_to/from_user()
 warning reported in smatch
Message-ID: <0d18ed52-86cf-44a3-913a-d514f7b8d4a7@suswa.mountain>
References: <20250625110707.315489-1-akshay.gupta@amd.com>
 <20250625110707.315489-2-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625110707.315489-2-akshay.gupta@amd.com>

On Wed, Jun 25, 2025 at 11:07:07AM +0000, Akshay Gupta wrote:
> Smatch warnings are reported for below commit,
> 
> Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
> from Apr 28, 2025 (linux-next), leads to the following Smatch static
> checker warning:
> 
> drivers/misc/amd-sbi/rmi-core.c:376 apml_rmi_reg_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
> drivers/misc/amd-sbi/rmi-core.c:394 apml_mailbox_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
> drivers/misc/amd-sbi/rmi-core.c:411 apml_cpuid_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
> drivers/misc/amd-sbi/rmi-core.c:428 apml_mcamsr_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
> 
> copy_to/from_user() returns number of bytes, not copied.
> In case data not copied, return "-EFAULT".
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
> ---
> Changes from v1:
>  - Split patch as per Greg's suggestion
>  drivers/misc/amd-sbi/rmi-core.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
> index 3570f3b269a9..9048517c088c 100644
> --- a/drivers/misc/amd-sbi/rmi-core.c
> +++ b/drivers/misc/amd-sbi/rmi-core.c
> @@ -372,7 +372,8 @@ static int apml_rmi_reg_xfer(struct sbrmi_data *data,
>  	mutex_unlock(&data->lock);
>  
>  	if (msg.rflag && !ret)

Unrelated to this patch, but it's always better to do if (ret) {.
Do error handling not success handling etc.

> -		return copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg));
> +		if (copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg)))
> +			return -EFAULT;
>  	return ret;
>  }
>  
> @@ -390,7 +391,9 @@ static int apml_mailbox_xfer(struct sbrmi_data *data, struct apml_mbox_msg __use
>  	if (ret && ret != -EPROTOTYPE)
>  		return ret;
>  
> -	return copy_to_user(arg, &msg, sizeof(struct apml_mbox_msg));
> +	if (copy_to_user(arg, &msg, sizeof(struct apml_mbox_msg)))
> +		return -EFAULT;
> +	return ret;

This fixes the -EPROTOTYPE as well.  In the original code, it would
return success where -EPROTOTYPE was intended.  It's probably worth
mentioning that in the commit message and maybe adding a test cases to
your test platform.

regards,
dan carpenter

