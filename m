Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0F122A4E6
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061333; cv=none; b=bJ5RffsWcifGJriGJmWaUWmfxjLCxnd3Vi3rUTgGZo3nGZXYdB519SZgUhIHH0Mdct083M40gAossFU+6EBuECGJh2Inqvg5VgS6L9xQSypoQPhouZfcuMydaeG2lOOvpzSP1pCezVQDXSpnLQDFr7VAOMPUUd2bZY6G5OXHL44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061333; c=relaxed/simple;
	bh=0+DA0HchI6skejeO2v9vUR0tvdYQj/hSzdF5ikllf5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwf9720CHmSZmFULc1jysfePdx9SYYUOw5qK2hM3djqSpgT16m4TOla2+/x0BmuV8gI4igu3RfC5bs9tfZxEj+YxWDzSaOOVEKnf8zX0WV0ETi7SLIawLWDrx+3Wg6L5YBTqW905i2wgAncy1ntxbjpUnQWMz+p786G703URK8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gL64gbOb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gL64gbOb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-440685d6afcso51125485e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747061330; x=1747666130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oOY69GPeY7sxhniN+8OI5OyPI2xNU8bnc7SUmdP2Sh4=;
        b=gL64gbObwO0dhGT3WLuF+DfMk+eeQs1UHF10Fts2DJB8Wou/ccG3xBs8BSeHQNUFJZ
         z5Y8noUgnK5DdiRNf3E+L74aerHdi6LAHO8MCurxvkjRz3A2k9t3QKEhcXtPwx1v55nY
         aAz8+B76OggwBhCHyN6o8g1iOeqEQr9FhtFO1HmoQWvjK5aH+0U9qx4jNE0oASS8zYRa
         r1DVepB2DP6+7fZKmiFx8aIo3JhWaLDYiwq8PV9wBd1pwVHoiN/P2J8qlrvm5bNrFGsA
         7jgnxRTsEJJX4r4+AeuFMeNm7VNG8SwldVrkE/+yes+9xGJ4P7kAT0H0mYrOqOWZA7rE
         DDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061330; x=1747666130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOY69GPeY7sxhniN+8OI5OyPI2xNU8bnc7SUmdP2Sh4=;
        b=QphEDVQ7UOfPxoxUiDGpwRXl0pyeabeXqcAHtApwjYs3vCi3zZl0gOjpAh3xDjoMqW
         ZWmvPvQt2/GgG985Npol8DlHq3su9ew2ajEUyul3zZyMCER8w85fymZ6jOCb9HS2Nh1R
         JuysgcbG/L/mGNApaVmG+vD4NwVOKcHfwZbmPZiH2gEefD4dZ68f/cJPHsup29Crevfi
         ADe8kIDowsMxP9l1mg94kku6w/ZuUKAzSl8sLaGkItALoKiFHzAvdJXjdbRMm4iQ71PV
         i1eCOLpqV03/jPqg/kJs4vpZnEf6lLEobUh3ZZFN9Z3oi1miDSkQPS5fhUIVbRloYtcv
         OFIg==
X-Forwarded-Encrypted: i=1; AJvYcCXgh2BDaAon1xEJjxXYh1K1kfYJXAC84hUzuaqNmK9KpskFR7xYymLlNHNJUfJG/Cl/O+pM7ux2lppEiLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHfjZTBMol00XEtW26b+y5mpITklMLXQpDyo/xJMiXJLQtgRRP
	MW8jrKLU6YJzjEY5zp9EB/zS8VUv1OvGZIhwJJVijOj61tbUynUyUm9Tlk5uavA=
X-Gm-Gg: ASbGncuoghOgbYCqKpPoGcPi7lcLJEYsl18p3v1pYNJ/coFpa90aTl16i5a8aBV7zfK
	rn4LVwSF5EfzRWSfmC6QkzyOfhoXNq0HFaaMqtQO+nWpdgTGfsAc5eA+GhCTKjBkkGWBi4gieOi
	YJbj7Idfmto0izLWeTJY1g5oZQdZh/C3uEdnt7Tt0rnumgph0N14M/5CO3a+xXRu7kmXNqwJs0Z
	JBBoOwRNsl9qzGIz4L0xi6JWCpvzMqIzzXUNVIpKSEUYNYa22aCOkrcIW4acztD/EXUVJLvYGyZ
	bLvGbIoH14E7PVNcucwcf+BhgOOEG2Cmc1ZSIK1533/LpL4Y1kVNRMikMlThfMrg+xR1qwf8f6/
	0YBa2Og==
X-Google-Smtp-Source: AGHT+IGdXGPgemNAdaGqFqrAkOPo5m7AI6yWS8X7lQEbLj2J8ijTntHjWwgRce+XmeUIX60FdDfVBQ==
X-Received: by 2002:a05:600c:348a:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-442d6ddf515mr114798195e9.33.1747061329948;
        Mon, 12 May 2025 07:48:49 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d68585d1sm129237385e9.31.2025.05.12.07.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:48:49 -0700 (PDT)
Date: Mon, 12 May 2025 17:48:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: Re: [PATCH 1/2] Staging: common: iblib: Changed ibrsc function type
Message-ID: <ccca3dfd-8657-48b8-9998-c06628353eff@suswa.mountain>
References: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>

On Sat, May 10, 2025 at 05:37:59PM +0200, Thomas Andreatta wrote:
> Function ibrsc type changed from void to int.
> Returning 0 for success.
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>

You need to work against linux-next.  Also you need to explain *why*
a patch is needed.

regards,
dan carpenter

