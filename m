Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563E11AA1DB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053540; cv=none; b=FUIa85tuQcMX33rFcAuFw3XFnZXRghcPL2W6Q27bnerIBUWbIDGeAIQ0R0TB6WO2MI49XSvCSBKjeY5GXmUpUh3kFYaNe4DdwpoeMRlDrj1yIoh2CTLWikFsx3RkHRi9jE5ZEv9hkiPskdj/nDRdqKAMWtgAAp1q+mPhAJO6g8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053540; c=relaxed/simple;
	bh=QRn5xwx7XJKMLTne51Uubho7iQaz55Fgt6gUQUEa2PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTATuEU9PHDRaRvZ9+I42s1Xj/m+1fgy+KJSi8O1i6/VX80jfDy2KG/gFQBqMTwNRTtobR0J9bDOukVt6yRWQq/I85TuXKA1ZKXTV/Y0YXtnE3YgoFMZS108MKKPNn5enI8MSTuXw1c1NS6SO43n4qOkH8AJ/dplquu/h/YJQrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QRXI3WYu; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QRXI3WYu"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-40af40aeef6so825431b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751053538; x=1751658338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1PHv1VdGkBxI9IqaoEgDKrlQycIIKb+rA84lWs0tETQ=;
        b=QRXI3WYu0jZnIkPFd6x9XR8k9w54hQre+vuDzfli9td5qEtrvlaU496TjpMvSgSan+
         Su6yPiHLlIETR+im2sJbTBmN6jmNF+2D1c1bppaJ0pH8uxvUv3NI0xZx4SpbgcE5dr8d
         f05HJNplmHbjJT1sqBIDO1PpWJNPpYmfOV/Cgap22nMz6EUr40eTPQSrIHUT1T3QoJMk
         J1aFIKCZfi2CTOLfUKluLZ1/hscJbCo4zY63/LLLNG8sSnSvNcz/XUczxOtf3bIX7ElN
         Vl2cmFZlns3/ptg1HMAnceWGaa9Aw9AKcbC/vcToI39q1VnobEOeMR0f7bIhyAbv2/5L
         yYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751053538; x=1751658338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PHv1VdGkBxI9IqaoEgDKrlQycIIKb+rA84lWs0tETQ=;
        b=POi2eiL+HxxyOpnYCvcgY6UpMrNII8tt+qU+JVjVRCcYHhsQVj/q/45UG6eeCC7l3u
         oUTclEV5Oz87k0m5FIhdLlI1VLyVjqFmQGFFyjx01mKRcUx74nj4doXJHChxUyZ8Sz0x
         D8EMne3hpnPUy/oD1iKv/zvsfm235fp9tmAieJRSN8WYMYvKh6TOrxBTZUZMbvtqsgNR
         ecb2KjmAK8bZjFAZvYsU6UDqLoCPx8E76gwtoOfe7BDrCNDCjy8yuTixNCqauYuBA7QU
         AVBkt5XHUeZ7Sif6g9Hwz37KjEu0GJWxLJtQliZKoSIRhPKVirzE5KujhUam3FdaFutR
         b5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWGsjJjsCutqo5yflqnJTBj/drmtBqgZlsEQOY0LrjlfxMP2MtwAVX9hkIfZTgYKZq5R5mSNzJMPXJb3bM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxyYAtqGEiIZ3KXJ9zuj74QLFRD6ycTPtNtf8MNZRY69YZ4kk9
	dyvE5baCViB0+k+emdGd6g30LPxwhC4acQnThiOY4quKLtce3g7OB1e6e2hpAoNQ0oU=
X-Gm-Gg: ASbGncukMzt4fEtyTlsv/jr5bxzsxE6fjcUfVK20Bq6Z6sAtmcJVOOwc/nxOnieuDh7
	5wFJej44Wd4Hl4u3wwHR8K/0zuUgHaqXo6szaEVDTAK2B4JJ+G971vUYihqBgKImWnl/yBr03jm
	kx7LreyL7LAIjsW+0id4IHK3++jZsNWTJeeDLiSOwX4LB7SFhrwND4YxSTq/rHsLlneEbd0vuZM
	hL/do8ZdtGiEHSzGc1CBigSRoln7OP5hwX9gVVQjKBrm9U6vTtfISNYGK+IRHxdRtng8naH0vjM
	K1F/G2K8rIoVfpbnwSPXHkgmioC41l2FWcs/Au5QtNJLNBVPjFeq68o02mhSAJFU0jiuSQ==
X-Google-Smtp-Source: AGHT+IGOy33iVFqaz2J3YryBDyHCiRkin6krtfcbh3XEjok/Bk15oJetu93it8PEur2H1TKYtZrRnQ==
X-Received: by 2002:a05:6808:300f:b0:404:c561:6225 with SMTP id 5614622812f47-40b33e4a4ecmr3388652b6e.30.1751053538324;
        Fri, 27 Jun 2025 12:45:38 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-611b848b3f6sm312396eaf.9.2025.06.27.12.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:45:37 -0700 (PDT)
Date: Fri, 27 Jun 2025 22:45:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdalla Ahmad <Abdalla.Ahmad@sesame.org.jo>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] drivers: staging: iio: frequency: ad9832.h: Fixed TODO
 note.
Message-ID: <36b382da-dc1c-4aeb-add0-a96082ea71d9@suswa.mountain>
References: <20250627175114.548076-1-abdalla.ahmad@sesame.org.jo>
 <aF7kW6xRxRb0VN5H@smile.fi.intel.com>
 <AM9PR08MB6114261F0CA8CD89EC443E59A145A@AM9PR08MB6114.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR08MB6114261F0CA8CD89EC443E59A145A@AM9PR08MB6114.eurprd08.prod.outlook.com>

On Fri, Jun 27, 2025 at 07:29:36PM +0000, Abdalla Ahmad wrote:
> Hi
> 
> > Nothing of the above explains "why you are doing this".
> 
> The original TODO in drivers/staging/iio/frequency/ad9832.h was:
> > TODO: struct ad9832_platform_data needs to go into include/linux/iio
> So I guess if it really needs to go into include/linux/iio and ad9832 being a DAC, then include/linux/iio/dac/ is the appropriate place. Otherwise, the TODO note needs to be removed.
>

Please, change your email client to line wrap at 74 characters.

The way you quoted Andy's email it weird as well.  You'll want to
configure your email client to do it properly.

regards,
dan carpenter

