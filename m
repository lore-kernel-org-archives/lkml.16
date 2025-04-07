Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4621ADC67
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017789; cv=none; b=l67+4zW0lgQm5rm6yrbql06CiVH8DQ1/T5YM94dzOYCdxwM1BC9qauDk0MzOYakBXN9MYUDUqSXfJhL2GZGWTurl+JBXTIMev88fF0YUy02hp+9BwcdoSEnMFj89YLy09cw5vvC/Thpn4HGnvyZWpqahjBTDi0oVDHeusxyIl8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017789; c=relaxed/simple;
	bh=r9RqrhzeutBtIOlYVz3agoheAkTOhawsk2ceW69HgXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCUElNEV4yAGcEu0LWdigTXADRt0c0Lacc0kX7t+ka4QT2GNdzkLBb+dfUvmi/K177uQJpFLPL2wiUu78wtQkZsbfVt/qhC87GCpHTl3hxaCGLfTUlSI6Pyv8PPBLOhu9E631L3fhttA3Z2bBTK9i3TGrRSVM+R3G4ozxjG8DZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bV6hQi8g; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bV6hQi8g"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3040126f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 02:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744017785; x=1744622585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8GEB2/7f7npYgGmINlGKb01Ype4hZwo/GgBaLZ4O8ec=;
        b=bV6hQi8gv1oYpnl4voM20JEKrXRqL0/1yGZfLVjoCkXI+wWagk3OajeMqQARB/dwmL
         Bh5BltnRj1u3oQb0lqubM8jSGfLyH7EJMcRmDgHC6VjyEiCA/OLo8QKWqZU54CehYTuI
         +Q2NdhYWwlewk3zGA4e2jleojLGvyrdRhIiP1q9S2AAlPS9v7ZMCQyrtl++TI1E7KVaO
         HwSS+jGezW53MXTWfUc+kAghRbURXCZnYFfg2o1ZogQnsoR5RmSH7yEbPfsR4e8AmNxl
         s98htRANFyNEORiRnqLAdbofycF8Psr4EqzwBlXrs7rGeu8yUJq6B+BRV+7ruWiHrhTf
         oR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744017785; x=1744622585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GEB2/7f7npYgGmINlGKb01Ype4hZwo/GgBaLZ4O8ec=;
        b=MWusMznzfn17JBqLqJbqL0bT8iQ1lYayU/MIlA7iKRhRG5Co+CwnJZrwDI0HxNjDVn
         l+yF+4VCYMPzHBmRYgW+RB2scFe0/JpT7VkZ6P9lCPXsTJYvvf53XGv7WCx2xU1IvJsE
         KvNu7Yiz3M4dYQe0mPyoYGxf3gzB6/bDmRDqaZEV039z6VrO7n8cW3CfqQsgBr2Ip8zX
         8c9RFL0yUVzgsHctdocvPBlY+v+EH9DZAeg8x+0OjxrkC/ASRxLnReH23mgA2lEYAUL5
         knsyBbcRvsXMBLimEUw0vrCRqoDyZsZVtmS2ARlXjRasWR6spjeUy0OJ8yHEF7zHVw48
         I0rA==
X-Gm-Message-State: AOJu0Yy+TFBI7P1nyIBY00w52TcKN720VPzmHawYvbzr9dZHyEAK1Z73
	28QzRAt25Oqd27fRkjVzyeAq1uzUtQ7uaKVCX/j/lzOx/FkEWyBdQpJKgqzVKlEbhaMAEzD1deA
	2
X-Gm-Gg: ASbGncuepTTWgOjHlEy56DG5SmfPOelIpTRn8hWQjcspyZgFUp5jcgq+1l8U+aC0alj
	CUBf7cw+kLqtgxyF9HU9EpB7zyFkY0T184cv2B+CpeCo9Z/+7pvqjZk6iY99aGBo+kxZRD3smq3
	OgEJPXd7ohGYNOYJ1cLJJGmnrVkJsmpWYjW1x71OKdT174TgnFrY25gsMitem7EYtAijA9x+B0Y
	axIhymsjgJk36lM/XNPQ4VKR6Z0/9fVK+2yMbvk7QEC9/aldFI7le9OKzL73+5vxByrp56Pecdc
	X6vDffXiziHpWG/uaUQqHSNgaXl1FrZ0SR0rugxxGdtDgoLUC+lO3Zufbg9yFgEStG1gXztgONI
	R/5e99p+yrNk=
X-Google-Smtp-Source: AGHT+IH2D4ZOZwcneAudIPcxeXzVvvPrAKJL14lK9bzoixHtxQl9qS6i6XTiQ1W94FT9J/YucBQ34w==
X-Received: by 2002:a05:6000:40c9:b0:391:43cb:43e6 with SMTP id ffacd0b85a97d-39d6fd022a6mr6415177f8f.51.1744017785228;
        Mon, 07 Apr 2025 02:23:05 -0700 (PDT)
Received: from ?IPV6:2001:a61:1302:8001:d2dc:b329:7532:c373? ([2001:a61:1302:8001:d2dc:b329:7532:c373])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea9a346e3sm110990905e9.1.2025.04.07.02.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:23:04 -0700 (PDT)
Message-ID: <9fdb5e30-8570-420f-940b-bea5fa72e12d@suse.com>
Date: Mon, 7 Apr 2025 11:23:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: cdc-wdm: avoid setting WDM_READ for ZLP-s
To: Robert Hodaszi <robert.hodaszi@digi.com>, gregkh@linuxfoundation.org,
 oneukum@suse.com
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 stern@rowland.harvard.edu, viro@zeniv.linux.org.uk
References: <20250403144004.3889125-1-robert.hodaszi@digi.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250403144004.3889125-1-robert.hodaszi@digi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03.04.25 16:40, Robert Hodaszi wrote:
> Don't set WDM_READ flag in wdm_in_callback() for ZLP-s, otherwise when
> userspace tries to poll for available data, it might - incorrectly -
> believe there is something available, and when it tries to non-blocking
> read it, it might get stuck in the read loop.
> 
> For example this is what glib does for non-blocking read (briefly):
> 
>    1. poll
>    2. if poll returns with non-zero, starts a read data loop:
>      a. loop on poll() (EINTR disabled)
>      b. if revents was set, reads data
>        I. if read returns with EINTR or EAGAIN, goto 2.a.
>        II. otherwise return with data
> 
> So if ZLP sets WDM_READ (#1), we expect data, and try to read it (#2).
> But as that was a ZLP, and we are doing non-blocking read, wdm_read()
> returns with EAGAIN (#2.b.I), so loop again, and try to read again
> (#2.a.).
> 
> With glib, we might stuck in this loop forever, as EINTR is disabled
> (#2.a).
> 
> Signed-off-by: Robert Hodaszi <robert.hodaszi@digi.com>
Acked-by: Oliver Neukum <oneukum@suse.com>

