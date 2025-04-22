Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41861F4736
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315777; cv=none; b=NKRLQiSExCRTxZvOHRTHf14JLWkgGabzMQ020BYv2j6L5mLCBKCH1oufD+hGO7i+2WxowtzpXGvIVXDtMJMViQjRr9//yP2GZ9xWwWg3QeMODjJuXnLaLuZOYHVe0HD0w+Xi3VYDf7GYfIirepXuPg5KI1xvgdK+3U190DkBmis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315777; c=relaxed/simple;
	bh=OaDHdFMJReEzzMzGKjfztjktwikXKwV2jaClKSYlPh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2Q5PE/jhlTExX1zmzgSa64S6nkp7Kmk9NaJi3H+oCZdzspR5fXOjEF6ucgAQfE/KIlU32ETrCnxTqJxfRIHrFJu+o1+AI+80P6qUQ/z79W7wbu0PhTn7A1jVu1QeSRMrnpsarJKAFXmlGCpMHUMS/kqZ+T2wqfjQnlrjj6pQWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2JDsKiK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2JDsKiK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso58099955e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745315773; x=1745920573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+QO98qmgj2ki6WgHqTR2cADuePWk5fgnSKgzFwIQUw=;
        b=i2JDsKiKlp/3FNN3zYYFViavLCcYdiOEJuM8EZjtuYLIl045r9qZHnYxuDRQYMUfWI
         xILYGLRoHSL9ced49fwx1vY2GrC6m+r4IiQL44YCHw11wYMz+iC7d7vGX8+pFqukmtF5
         1KGW5frHX6jLRnLQYdOmKz/2Vk+1ybVUyYHkcvlrilCyFUuvFRuanoc/sFjv2Sv+9QKO
         tuA+2FvZ9IAYTx16PoH2xEW6Wx7OchrS1BmjfVb/8vsFTCOev1cXNBZCOwJ3H9b+NRkw
         ig+V2fhf3Un1Nk887PdoSvhFs4052OsMGWo+GLwWmH2EoUVYgo3d61NBO0GyYAIITC1F
         HEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315773; x=1745920573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+QO98qmgj2ki6WgHqTR2cADuePWk5fgnSKgzFwIQUw=;
        b=qwTpmj95xkniiTWpjZkRLeW/M/shUBljZm7Kep9ATXDKBMKHhLN9BoPqzkpJx1zahu
         eDkyEavxreHdmY1FFbgEZcTwgFVv25LWOqt8EtSY2Ss3A0XFjrr5NMJtuMpXGCzIO0oN
         3ty5YGCY2ZxbN17h/tHKZ/WSpShDQBxgV2Dh9O16uXIiB4Ous5C1LlKsb4TovgjXLdDQ
         VdMqh+Yb4J0241dSqXzdPDtpLVmS6g3KzT6zL3e85/g8AKHLvKXekq/605YuJCmeLrKm
         NfMv4iu+lKNdcueE0S3S8PjdFNfeSkBochc1N2phvtJSARwcq6Fq0RKRv7vI+/hCTsC/
         rENA==
X-Forwarded-Encrypted: i=1; AJvYcCWgDvaEZ+uR/eiZjkEsSbCYqODiV5JKU+wG9fwOcfudwikF1a+N4YiYgmBtRa3UQHKx91jmgnG0QuyTXvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIj2zoe9+QTDj6J2EmubUGt8nevPe1LNgvdwKIBVApAVDQnEfl
	eLwIH9hLvMRWTmUMFRvgvbE3nIMw+JRwq3OPBbaUb1EzRLRN4FFSd13I0v/RZjlUpvxr2t6JVmo
	b
X-Gm-Gg: ASbGncsprcUt4x2Q0fMX6PQlmbqGnKT+x1bIObxOi6cYfEnr535KJSXWEkCq5ySp5KR
	yDUsshb9SvVU+PSpXYcfbr04CCRWW/sIFJLbFyEfrOBWP+0uyGKF0PacFK6p1DQFd6XBCpnu+qV
	7rZARYf3l05GixVe6Bxbr9wofAZti8VmpXCJI1ug8GIJt+MeDcpgMkhVtarruqebCf/MNHxwC8u
	qSwr1HzDJZOG8sb728LnQJQMXf3bQ0HqOr2C0U7TaWNsrAbVj8F1z9F2XWkq5g5/pvVIdTAGxEA
	DhiA22v++JPGNfCrDmGiF9DC6P8M5wBtVxe9nk1Yjt3S3w==
X-Google-Smtp-Source: AGHT+IEsd7/SkNcLAUxED4n6XevcQYOpxf2v+BtFf+hSK1o6FW2FhCD6Cwbfwe4yTzK66M4PoWZ8mA==
X-Received: by 2002:a05:600c:190d:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-4406ab67e15mr128331075e9.7.1745315772926;
        Tue, 22 Apr 2025 02:56:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5bbc13sm165298515e9.17.2025.04.22.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 02:56:12 -0700 (PDT)
Date: Tue, 22 Apr 2025 12:56:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jacobsfeder@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	sergio.paracuellos@gmail.com, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] axis-fifo:  Remove hardware resets for user errors
Message-ID: <1a34379e-4c41-40ec-99f9-87342c33b45c@stanley.mountain>
References: <20250419004306.669605-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419004306.669605-1-gshahrouzi@gmail.com>

On Fri, Apr 18, 2025 at 08:43:06PM -0400, Gabriel Shahrouzi wrote:
> The axis-fifo driver performs a full hardware reset (via
> reset_ip_core()) in several error paths within the read and write
> functions. This reset flushes both TX and RX FIFOs and resets the
> AXI-Stream links.
> 
> Allow the user to handle the error without causing hardware disruption
> or data loss in other FIFO paths.
> 

I agree with the sentiment behind these changes, but they are basically
impossible to review.  The reset_ip_core() does some magic stuff in the
firmware and I don't have access to that.  How are you testing these
changes?

> Fixes: 4a965c5f89de ("staging: add driver for Xilinx AXI-Stream FIFO v4.1 IP core")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 7540c20090c78..76db29e4d2828 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -393,16 +393,14 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  
>  	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
>  	if (!bytes_available) {
> -		dev_err(fifo->dt_device, "received a packet of length 0 - fifo core will be reset\n");
> -		reset_ip_core(fifo);
> +		dev_err(fifo->dt_device, "received a packet of length 0\n");
>  		ret = -EIO;
>  		goto end_unlock;
>  	}
>  
>  	if (bytes_available > len) {
> -		dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu) - fifo core will be reset\n",
> +		dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu)\n",
>  			bytes_available, len);
> -		reset_ip_core(fifo);
>  		ret = -EINVAL;
>  		goto end_unlock;
>  	}
> @@ -411,8 +409,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  		/* this probably can't happen unless IP
>  		 * registers were previously mishandled
>  		 */
> -		dev_err(fifo->dt_device, "received a packet that isn't word-aligned - fifo core will be reset\n");
> -		reset_ip_core(fifo);
> +		dev_err(fifo->dt_device, "received a packet that isn't word-aligned\n");


The commit message talks about "user errors" but these aren't user
errors so far as I can see.

>  		ret = -EIO;
>  		goto end_unlock;
>  	}
> @@ -433,7 +430,6 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  
>  		if (copy_to_user(buf + copied * sizeof(u32), tmp_buf,
>  				 copy * sizeof(u32))) {
> -			reset_ip_core(fifo);

Yes.  Absolutely.  Delete this.

>  			ret = -EFAULT;
>  			goto end_unlock;
>  		}
> @@ -542,7 +538,6 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  
>  		if (copy_from_user(tmp_buf, buf + copied * sizeof(u32),
>  				   copy * sizeof(u32))) {
> -			reset_ip_core(fifo);

Same.  Delete.

This type of code is often written for a reason.  Potentially as a hack
to paper over a real bug.  And then people get carried away adding resets
all over the place.  It's fine to delete the last two calls but I would
be very careful to delete the others.  Even though the patch might be
correct it needs to be tested very carefully.

regards,
dan carpenter

>  			ret = -EFAULT;
>  			goto end_unlock;
>  		}
> -- 
> 2.43.0
> 
