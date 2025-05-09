Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8455B28C2BE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785283; cv=none; b=L3s/z8zR4Hhb+b9p4sbNek+/m4xNnoHibgIgAGiVh5ym/QjCL60vrW1QQ83OaEfPS0eR/T81VDz7diti0T+vNc9//o0cgl5YvDqZKqFcul0GclsyEJASYSd6ArkE7Sfz9vUHLZtrLapDQRRKBAO1gezRjVhgdBHhHWFsJODRdCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785283; c=relaxed/simple;
	bh=c6wpZKzZDHjVK1uIduWgCg1mh2QvnTuBVDz/nVJ9JEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwfne4IESgQ6hCo/e3sl/4KBOCl4uYbWnju8RQBm5zBW5RkOLZNSEOJ38vwUqsbelXNv/Nb1H+4tO0Pts23oER5yivhglFSBM19Egc/f4mWod/mEBAyu7wLSO9wqPj6cWNHgCzm5x0tmQJMynOl0JZPWWQl5kiJKztJVFkSqV90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YJmtj+39; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YJmtj+39"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so21566165e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 03:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746785280; x=1747390080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7mR13VHCkBK7FRvabjRhDpghhYTDj7T2xDkNt5UakxU=;
        b=YJmtj+39S63P0Q7Bdr+AR6ZBOWsotpIDqDcf+CwlB0j3Only1/AiXNAXGJFGwUNY/R
         O3PY7++Y7RZOhj7/74D2w2LB487WuvnhvVQ+HVJC9H8/soePwDgCaNV83zXM4+fFDTk2
         0pKBv3HTD913/QZJtAXo0+PD7Ji5knSOTnbW44mDXcfB+CCp61VHjDh+xMpKE+FuCkYz
         67ahuOGhOK8e4Wjlw9sp0x1FE8sTAGwnGSBf85Ie4SfN7ucPIjKlQO927o5QoAg3BxYL
         Wzh5f7n7PwsW4m6ZDm1yvpEFA/aFLeQSuJkMpkAUzRyF0Qi3uCElsYG845I2KVjyFIJR
         5AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746785280; x=1747390080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mR13VHCkBK7FRvabjRhDpghhYTDj7T2xDkNt5UakxU=;
        b=K+MiAd/6fVQlGhfJXYYP2yBzdxgAI55i7DLU5JD5YnNp2Ox9XvslD+Npqq9BYMF4ck
         o0CtJ0P4JdeRYxq8M8ixWVJQilQ34mjuA/k9nKWDv1vD3wI+4sLpsyX8Ank54NChMAJ1
         9yXb9DpXvQX39KJpeHfrYWAucftua2eq8GYuGnOZZvQNSrjoO2XWk4UHV3I7WAmzntyz
         +hRFJdZDQK4l1eFH0k6wRgcePttsECP3+OBTfzLzxSxMmh6EDUQM3TFN457Le3N78KUh
         Aluj83lOwG413Rmn3FNP5vG68E8z3wYXSjqUZWFpVk28qUgUzYO69dm162/xbHQScz5p
         C0zg==
X-Forwarded-Encrypted: i=1; AJvYcCWseGQvSzTEVyZOpMITcoggh9pG+z+ZUhEt20KfARKMh1RS7+yLv4yGHMTRrv0RDQ124ijuabdIA7ysSDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzieE4yxystwK+eu6YUUh1b1YM6/3xFQ3DrxHmjfl4H3hJxnzEB
	lfZD9fjh1Dw59NoRrlXBGinrm/LSj17LeolqMOwsWMmUuUpyzk801hxyzHa6kok=
X-Gm-Gg: ASbGncugMQ/cKUV1HMIwr+YcGiLLdc9dEV5u1h61pox34T2PLy3VYyDFWTdQsDHA9dW
	vsubX50fPG45wzDcTPNWSOoJHHw/VycWzw5y8SzocWFIcbdw7AEEYB2AOeP97YCRXF2/WyiLhAG
	1cmhNzRzxYj/jNdfQoO5LCofLwI0tP2CcXDfPgmAQ8PEgifm1PoaifKgUSFUfRHkjsrXNhJ6nor
	o138Ovn4ie7vMFoYl9/woK0on3o9bVJdFyZ/jOKu9fxGutFdDX8H6F28F1FSBiH4LJuAIgKbIWu
	MK3AiCdVTWRW2w93yeWCO0FsM4ZWTvqCucdEstsWvDnn2w==
X-Google-Smtp-Source: AGHT+IHa+el3JCmXenGu2X+obdTrpbQ/gFeXWrssArhleTDz2ua7ePOkcxqH8/PoJ09MEVSXyOot6Q==
X-Received: by 2002:a05:600c:820e:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-442d8ffb0c3mr13768295e9.5.1746785279819;
        Fri, 09 May 2025 03:07:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d596a5e4sm33412715e9.31.2025.05.09.03.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 03:07:59 -0700 (PDT)
Date: Fri, 9 May 2025 13:07:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: qdsp6: Add an error handling path in
 q6usb_component_probe()
Message-ID: <aB3T_HTC27F98NJ0@stanley.mountain>
References: <7338875b20cb41693f803c6b9673cf7f3e5f089a.1746781775.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7338875b20cb41693f803c6b9673cf7f3e5f089a.1746781775.git.christophe.jaillet@wanadoo.fr>

On Fri, May 09, 2025 at 11:09:55AM +0200, Christophe JAILLET wrote:
>  sound/soc/qcom/qdsp6/q6usb.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index adba0446f301..8044cb7e4dd8 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -327,8 +327,10 @@ static int q6usb_component_probe(struct snd_soc_component *component)
>  		return ret;
>  
>  	usb = snd_soc_usb_allocate_port(component, &data->priv);
> -	if (IS_ERR(usb))
> -		return -ENOMEM;
> +	if (IS_ERR(usb)) {
> +		ret = -ENOMEM;

ret = PTR_ERR(usb)?

> +		goto free_aux_devices;
> +	}

regards,
dan carpenter

