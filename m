Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D48B19ADBF
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017866; cv=none; b=FFXCUezXsejTTv79mvZ1ii8TTTQAhc+7YDVxQof7Zd78boyjaD8N5phwBYpdyVF9YjhRfIS0xfZyiCL8eRtIGLjYftiWapqsjXGgiTefbRDAicso5oi5x07UNhTtJhTlWCJOKqUgV7zgy6cVfXXXoeEQTzAr4+tBUOiQ2LzI3mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017866; c=relaxed/simple;
	bh=Gnya4kZJNaiLXSzvh+buuhUU5zQHKYGxGFiSUVggn2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkzTxdkEAIuPKjmdBya7OJj0CkVdrd1wFJaOesWqahmTj0EGTu/u03kYQuzNaBbkiwSUfC5mXgNuHMhdekY4qqHqelgOF7BSiWQiry65WBiYW8gKhCaPw6bpmgx5jhOSfGz2EeWQ79IY258xIorLdLRZyMPGZeC+jCtqIsDgQ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EzTYcsH+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EzTYcsH+"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a363ccac20so77617f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748017863; x=1748622663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=igC70o8ybU294XiVgv2dCfqybHERyfthoQG4v5gTf+k=;
        b=EzTYcsH+ieJ5fX2NllerQTXMyQxKFnWPU+3zbOOEnfQRiaq/jJXyscLGoeTWraIOC4
         QkLYHyUABa1nYZdp8fpa5m1pa6qmn0aD7NZz/x2egfiXx+MY757sj23oAJfqVR8ly0dW
         iY5Pntf2btt5gHlj91fM5gALOTBgrT969EUKzobzzflnRwpvjjLnvInc0rkXeOwoo8ug
         iDNuInh8VmHqnATrgiOxdSbWT2xwLbOsvNh26Lp6KKmdrL9ZRocxF1EP4yZmjb7hhM6A
         hIythVqCjncip4OfeWhRSYAl/xFrdzW9QCla7qUrMoD9owVgwrHnPzFSwRptVKKrlBcl
         aR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748017863; x=1748622663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igC70o8ybU294XiVgv2dCfqybHERyfthoQG4v5gTf+k=;
        b=D1pDNxP5nao0xE4E5AEoitOJuE6Yai/16UIv8WWztb9QHD89odF/WcPlpmXhFMX/AM
         nmUHrg+ttyMyh5SBY2lxjbo29Kdq2fW8nogPG421gH44LGEsnp3qItYtDBXvIJmmpgmY
         WbBG0MYuQ5qtB5Dx5xNKQPJYBUn78irVVJSCnZX950SVuuCfi4IxyfwhA22WQnDL9ntP
         Gd2EGBAp2tPgwrHJKRuq5CndbsjUfaT3has8BiJuJcEX5aC8CuY3LK6//gKeS38CPAwi
         BeIDoNL0XBm65E/go2Np6+pnRctahE7NIfdkPZQaYBjKCFb8j+HYaRqhms++wnsUHyUI
         kErg==
X-Forwarded-Encrypted: i=1; AJvYcCUfx3VuZMGkdk8Dbm3MCDvwpPmUJtYS7iro9JzUbI2MubqdRsTDtwyeftZI1L8adHIJ/mouYJLkitSkvpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqk0A7QY59zq0OQg/ug5TWY6zTIYBRmv1mHhsvrmHFk5H9d66I
	ph89FQn19GckzIa0Dd/ksk09vTaNpJlRi35Ds+fBYrwVee+Isc6ZNH3S04iuahzlk80=
X-Gm-Gg: ASbGncs6N/F7K2Rrjp2xRlt0S4xHCgCLXE9VoJ4hoqTIEC1Fzc6XrkChddvdoFZYKpK
	VjWOYprQw2ksgrQ9Pfh32Q1iPzDbkiqwt4D1t8JhWIyZuYvM7hI3ib4Z0BDUFEOTqATfpfS3WKe
	/LG9REfwUi2NU0m6AhQKDJaHEU44sJo3wnz9Ku1PSn6GEOONh2a1oE4+x3LHz474QlvWkgeALyN
	CYoEpAafCiriDtCP4QME84H12HW84CQMMrpwWKs7La5fBqOOwR1I1PgN8grmv51FjhGUIjJO4AT
	fOmJfyNTDZ20jZiIotsszPtE3Molyzvmcmt+QPoTnbRB4fpcSSk06SZm
X-Google-Smtp-Source: AGHT+IGGTvjpF7sv2w5zjZ0EW0X+dRfZsZNJ1QvwQmRtd2GPgdBA3IhgoeMEt8+gF3DgVzVaSIQ1fw==
X-Received: by 2002:a05:6000:4202:b0:3a3:61b8:a637 with SMTP id ffacd0b85a97d-3a4c20f8dedmr3518632f8f.22.1748017862887;
        Fri, 23 May 2025 09:31:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44804e89c42sm153252035e9.21.2025.05.23.09.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:31:02 -0700 (PDT)
Date: Fri, 23 May 2025 19:30:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: long.yunjian@zte.com.cn
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, peng.fan@nxp.com,
	florian.fainelli@broadcom.com, fang.yumeng@zte.com.cn,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
	mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn, xu.lifeng1@zte.com.cn
Subject: Re: [PATCH v2] firmware: arm_scmi: Use dev_err_probe() simplify the
 code
Message-ID: <aDCiwqwez8nzk5F8@stanley.mountain>
References: <20250521161449954uFxEsoI6Zg_7wDu6IAfWk@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521161449954uFxEsoI6Zg_7wDu6IAfWk@zte.com.cn>

On Wed, May 21, 2025 at 04:14:49PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> ---
> v1 -> v2
> (1) Order the includes alphabetically.
> (2) Delete "ret = PTR_ERR(*)", and then replace ret in dev_err_probe with "PTR_ERR(*)".
> 
>  .../firmware/arm_scmi/transports/mailbox.c    | 20 +++++++------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
> index bd041c99b92b..764cbeac2492 100644
> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> @@ -8,6 +8,7 @@
> 
>  #include <linux/err.h>
>  #include <linux/device.h>
> +#include <linux/dev_printk.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -214,31 +215,24 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
> 
>  	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
>  	if (IS_ERR(smbox->chan)) {
> -		ret = PTR_ERR(smbox->chan);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(cdev,
> -				"failed to request SCMI %s mailbox\n", desc);
> -		return ret;
> +		return dev_err_probe(cdev, PTR_ERR(smbox->chan),
> +				     "failed to request SCMI %s mailbox\n", desc);
>  	}

Remove the { } braces as well.  They will cause a checkpatch problem if
you re-run checkpatch.pl --strict on the resulting file.  Same for the
other two as well.

regards,
dan carpenter

