Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03CE101EE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348948; cv=none; b=Jp5k0ULQAyHSCSJzfzPJOw9C4BEaxQly7+3cwCV4pSYD80hBMVmUMoa18l8NaNRU5uuY6Bqqa2ruxwOwHxm6m89rM2SrmaiPmrSreV+4krxCxeP6jAPQxCK0T/+fDHeYj9GfcAI2eF8aZwilEMkxDi+bA3nTNNB744qGfykFQ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348948; c=relaxed/simple;
	bh=LfsXnykbEIjRaYHhJ1kTIbtEyApTzq1KUHzEHI6CZ7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DP5xY2myH7JjsAwl8dH0VQD4hCPVlQV6x2+aXWXYLo1hFLY1UaVSi9WFrKzfCjqexbadqCsX7LXTGYyZhn8gfoUxS6KiNyeilW4r4CTeBirPGq/ANbYC4kif9L7CvQ5M7e5veAPiUqAYJCZOSZ03DjCrOrK8ouVm4JLl3Oeu8q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GMnO8sQk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GMnO8sQk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A48C4CEEB;
	Tue,  1 Jul 2025 05:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751348948;
	bh=LfsXnykbEIjRaYHhJ1kTIbtEyApTzq1KUHzEHI6CZ7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMnO8sQknfzCkAi96A+3pjMTqgBdjc6Y1PB7PUeaAUu8rSuaWBJmbyLVgXsai2RTg
	 6jMmw8E5rC93Tra8nytHPDvDZeRbBwJ5mX/HrW1KV6/g9CBi1nIt3d9L+ax9COfZAQ
	 1idPSGoeletdCbFcfocberAWdjfE5G99B+iY6Oeo=
Date: Tue, 1 Jul 2025 07:49:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gupta <akshay.gupta@amd.com>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de, shyam-sundar.s-k@amd.com,
	gautham.shenoy@amd.com, mario.limonciello@amd.com,
	naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v3 1/2] misc: amd-sbi: Address potential integer overflow
 issue reported in smatch
Message-ID: <2025070125-ice-outbreak-3e02@gregkh>
References: <20250701054041.373358-1-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701054041.373358-1-akshay.gupta@amd.com>

On Tue, Jul 01, 2025 at 05:40:40AM +0000, Akshay Gupta wrote:
> Smatch warnings are reported for below commit,
> 
> Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
> from Apr 28, 2025 (linux-next), leads to the following Smatch static
> checker warning:
> 
> drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
> drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: potential integer overflow from user 'msg->cpu_in_out << 32'
> drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
> drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: potential integer overflow from user 'msg->mcamsr_in_out << 32'
> 
> CPUID thread data from input is available at byte 4 & 5, this
> patch fixes to copy the user data correctly in the argument.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
> ---
> Changes from v1:
>  - Split patch as per Greg's suggestion
> 
>  drivers/misc/amd-sbi/rmi-core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
> index b653a21a909e..3570f3b269a9 100644
> --- a/drivers/misc/amd-sbi/rmi-core.c
> +++ b/drivers/misc/amd-sbi/rmi-core.c
> @@ -42,7 +42,6 @@
>  #define RD_MCA_CMD	0x86
>  
>  /* CPUID MCAMSR mask & index */
> -#define CPUID_MCA_THRD_MASK	GENMASK(15, 0)
>  #define CPUID_MCA_THRD_INDEX	32
>  #define CPUID_MCA_FUNC_MASK	GENMASK(31, 0)
>  #define CPUID_EXT_FUNC_INDEX	56
> @@ -129,7 +128,7 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
>  		goto exit_unlock;
>  	}
>  
> -	thread = msg->cpu_in_out << CPUID_MCA_THRD_INDEX & CPUID_MCA_THRD_MASK;
> +	thread = msg->cpu_in_out >> CPUID_MCA_THRD_INDEX;

So this takes a u64 and just moves it over 32 bits and then does what?
I guess it makes sense but how did the original code ever work at all?

>  
>  	/* Thread > 127, Thread128 CS register, 1'b1 needs to be set to 1 */
>  	if (thread > 127) {
> @@ -210,7 +209,7 @@ static int rmi_mca_msr_read(struct sbrmi_data *data,
>  		goto exit_unlock;
>  	}
>  
> -	thread = msg->mcamsr_in_out << CPUID_MCA_THRD_INDEX & CPUID_MCA_THRD_MASK;
> +	thread = msg->mcamsr_in_out >> CPUID_MCA_THRD_INDEX;

Same here, was the original code just wrong?

And if this wrong, should this get a fixes: line?

thanks,

greg k-h
