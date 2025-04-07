Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A30C22A4CC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010445; cv=none; b=jPjMcfXrMomgfZhQb7y0FOYz5mjd0cGEzsru4yP6w91EPn64WaqbvKTFzszOmIafpLOT+6XYSFsW/eKHm8fz1X8JLAW10AjXauaVFidLc9RctlHlzPLxrllPPkchwcN1I1zI+feD3mLQJ8HtNQ0wHNlPuk42he5Yb1KpBGHxftw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010445; c=relaxed/simple;
	bh=cHMIUDK3l74NZLLEqV2LIUIplXGhecJNcFy3KgsXMhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2moUHNI2z/uBUniombnV49eSsZwEbSDvrIOnuIhd4AIFumIjBSgfUtZ0XvOcIaBvUzeKhsenzSkOPO20O4MhF6gjN7gAAz2idpf8EhRUJa2MiguMLSVF3okx2+i5LpTMWcBnrwXDBgvYhKhGuYVbM3tYsx+dKDA8+aQwAx8RUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bV2WPlvV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bV2WPlvV"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913d129c1aso2697477f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744010441; x=1744615241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8AQPY5eAZttYfbBPqcFbME0mxQEUbb1b9Jm7VX+7QX4=;
        b=bV2WPlvVJ5ssLyVMN9Ju549lQjaWql7xjS6KkQpj0tBiQA4yE8zAC75pxQnLn2wOtK
         WIYNcQWCBJ9/+LCyA3NKy9cHFrmeWnPjPv30M7RAfCNTW1yG1rHXhi/IwoTYQ8Y/4OjX
         HrZXACo8pBCb7bOGR3bKnZiBgSU1orsqmMCxeEqoFz9tao7SY6GILXPciSRMnHQo2ED8
         xQb0qtA3v0apYMH5m+zgBUNovTZeU4g2zBEbBDIULroPG2RfqvRFfG6ZMg17iDmNGIqa
         FcewnxFYPjShUUumoYPUMxduf2n5sMwxQLUSTVqKb1RepgCCn0KBO2EfnfUnAf+KSclv
         TeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010441; x=1744615241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AQPY5eAZttYfbBPqcFbME0mxQEUbb1b9Jm7VX+7QX4=;
        b=VXIYK+Bw7i7aw52zJNG/E35mLeHWueEV4uLb7/ZD1IpPhjCz5mLzHUOYgBz2+L9sdg
         L9BTRofvF2RQgsEZpjdjFq/z9y8+qQczwiqrHCikVCdWu9mw4MJOu80TZkLspaoFYWpX
         lEeZU12BErIk/Li2bnYgWXexl5kQqIVss6q7lQxiSfkHOFTR+w2nkhPis0RaXQF5DUJT
         1wUmBpex2TcigXaUJBPU32zkklyg3BdGvreklIqohMKKkUbZRpgHAqkp2ornuV8oWdyg
         Jld+8rCYI8HDuVdgwTMvX2uFIhyYV37929GUisCx4jUSY0mZkymkvObeurkPcTCSysY1
         64/A==
X-Forwarded-Encrypted: i=1; AJvYcCW8a2qjDjTHUQbS6ybVMU8UjDK0qL7JWZ8Vq2lUnblsFdwMJKVfKaqk19Um6o/fHxK9Qx1aacNYi+RVXkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwepFRlGJ/0XdN65xLco5xbstcStkMuSMlv3am/iPudk2x6M0tT
	RpbOP2psgpboQO8SjTn1DkMV58Bt8x33vmAf07v4+VyZvkemt86BJrYk2kcCMDU=
X-Gm-Gg: ASbGncvsN6pyNyTXhOKEs1PEIflms2iqRz4Zmi7IWBk8dKYlnZftqMacFa09OJGVSku
	sg+EDFLXeEAwfAfivR1+yAq+GuEYRBMVSxXtXMUFk4tPtUKJ1VW2UjE5pvuYSQOajU/h4SJfmL1
	FQXarZMr3JePn+StYYTl26ru7p0+7T2acDd3cx/YroDEgr1UHNEFkV51cj9hfL4lJT6CIkXfOtA
	u1Kxn+R8lvnwiRcyiesERO9i32o/AiZOci8lSPGLBjh1gBV2PEJ0AONeCN10SLeNBBoTqzFBPgZ
	Z3a5Vim63RioEKiyUHA1VVDGwm2H+jpWBzenu9cNKlu2pog82A==
X-Google-Smtp-Source: AGHT+IFlFea8q60vJbXkh0XwiaPvmeolbvPuYxUASQOR+ImsTm/0fCsRTxAtHed3qXOlMSPOZqPAwg==
X-Received: by 2002:a05:6000:4310:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39cba94dabdmr9345131f8f.25.1744010440777;
        Mon, 07 Apr 2025 00:20:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301b8161sm11374805f8f.50.2025.04.07.00.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:20:40 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:20:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: gregkh@linuxfoundation.org, julia.lawall@inria.fr,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, andy@kernel.org,
	david.laight.linux@gmail.com
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <0d62aab3-bd51-4739-88a4-9419cca7159a@stanley.mountain>
References: <Z/NxGilPLPy7KSQ3@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/NxGilPLPy7KSQ3@ubuntu>

On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote:
> The sequence number is constrained to a range of [0, 4095], which
> is a total of 4096 values. The bitmask operation using `0xfff` is
> used to perform this wrap-around. While this is functionally correct,
> it obscures the intended semantic of a 4096-based wrap.
> 
> Using a modulo operation with `4096u` makes the wrap-around logic
> explicit and easier to understand. It clearly signals that the sequence
> number cycles though a range of 4096 values.
> It also makes the code robust against potential changes of the 4096
> upper limit, especially when it becomes a non power of 2 value while
> the AND(&) works solely for power of 2 values.
> 
> The use of `4096u` also guarantees that the modulo operation is performed
> with unsigned arithmetic, preventing potential issues with signed types.
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---
> Changes in v3:
> 	- Added more description to the commit message
> 	- Removed blank line in tag block.
> 	-  Added more patch recipients.
> Changes in v2:
> 	- Changed the commit message to a more descriptive message which
> 	makes it clear why the patch does the change.
> 	- Changed the subject title to include `4096u` to show that an unsigned
> 	module is used.
> Changes in v1:
> 	- Added more patch recipients.
> 
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 297c93d65315..f534bf2448c3 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  
>  			if (psta) {
>  				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
> -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> +				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 4096u;

You forgot to change the & to %.

regards,
dan carpenter

