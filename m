Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2A2194098
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750999171; cv=none; b=c+Uei/DsIiu6x7NxvVQWMxpdWcEL9YWerqGyM9OPdmztFIOTWSnyiRz9A4Y4nChbd2VxXFb3udFJm5wkDqa8A+sk7fHAJF25Eu6arsfc9VfUY77lbEmbL4ALKt2eCbjV1o1J0DGQQXqhZUQq8JgNQG57rlkjZ3YmvBvjTOK+b4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750999171; c=relaxed/simple;
	bh=L8zH5DwFvKXg3d7sLBPHt5rWqwBS6q3Ktrm2ltBTuoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlI827apzyuVbVnxCi5u72r0XeqiIoaD6zFE5QuYlBSO1iLXwmRVQ2XgernGhppmF+orIGbETnHe0Q5cl3yYZWhCS2m+o4f6sGBaaK99gjM+8kIiWy0EmP5EOvu/9LRD5YFFagMXALxn1pGy4/FMGCqjh4wJGRNHdxgAHbuIF5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qEIXdiM1; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qEIXdiM1"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7382a999970so980996a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750999168; x=1751603968; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=22viup5EXH3YN9z+xYLRVBFubu8JD5YEOw2bjdLSidI=;
        b=qEIXdiM120hJjqP2Jz8Ktx1RhYHfzQNEhlxRmrHzAA9oEagO3037Y8jjJX85PpdBgN
         C7MvvSgf2Va24NY1IhUXm7X7qkxzDJk3a/71M2NX5xOEdslkXqvl4L8TK/WIEniJyAJZ
         xR05onoPLjsHRqaUdCNMywVgFqy7AAxmoYWh/s+1NIU9cyi6yv1qYSJF9c2NVhEDuEJC
         XA9jl7BtYj81cqMrEJ+xviUKrcEzaIdSvQ5HwgBcWjwZYUn+aJXUyJdp2eEWYyu11wOA
         01O/B0VWJiBNiSq3fy0IuOejGjs7dRdfG4Rt0mNL5O+p57ZatxsIRLJJMCSZavSt1FaY
         TFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750999168; x=1751603968;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22viup5EXH3YN9z+xYLRVBFubu8JD5YEOw2bjdLSidI=;
        b=ojvP4K/6CoeOifhNLeq49f7tI2OuY5OY7AFGq0fNxOkz7BlGVvcL/mqmQ0cSyeUr+S
         6fBVOSTB35gZHSFH34pI8X7mr+cpk6njk6yB2LSpsg6QZx2l459jgO+oA6euaB/jS5Mz
         rKHCOaba7oWZlyMXoxopNvtRdqS3eR+Fyvf+XgLxyaVFQsL+S3D7XZkRRQHQFUH7S4Jb
         LrL0l1OPtcRrGvrR56O2ekFTDRRdRWs8TJd7G96ZqnP5rCvBMTyZrVApHR7/eBPxazYw
         rjj7GSCAoCs/+Zl++QQFJyGhErUefgPRjxcPC6ASWBOlFaRC8Dkl455gZL4sPmDZJW3R
         7nzA==
X-Forwarded-Encrypted: i=1; AJvYcCXoKR3G01Q2fkoKCA1i6msgljch2hkdHjJInHwWwgGIV7p60eoPLE5e7vP8CluALUjwE7lYXcyXyFGjXs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxovyXEErn7oxD6gNpFLcKfhSCXalLsRC+gF/UmmkamsfCi98us
	ZeklFRjyxomLhNq/nmdYa1mcH2E6I9tt6ES7jeqzp70Yqj7JfCq52wkXvt37XlTYctk=
X-Gm-Gg: ASbGncvwCv4G994PnsothCbU6Ri1PqM+AzllETNM9BzQnydPCqwWH6DckFmMg1Z5t43
	TFReN38fjRWID6LxrUGnTTQPPbnF7JIxbIZhHlPxG1cYCdGWlTeks81Meuf4GUqXGu+jLpfJeta
	SW3Z/cMQpBJKQgdz8fdxxemiPQobuLnEB+9uu50yljKbmDz8dCs/eboYiQh9R3/QJ+vDpaSVsKA
	BizcIOZu2JgbXOImwAxqow/bfyed2xFZLEz0s0YQy2YgtBminb9N0O2n1+HxpK81qw6zOCKEevP
	nk7xaczKIv2O5vcxxreKla9jdcuF7bN42WQjg6/QdtSG7Haij2MssJqWfChhCdkilZKYDB37RZT
	Tdkc=
X-Google-Smtp-Source: AGHT+IEUCbNi4feI1aFKOFSYP6qJmEYOXaKIN2vxigszkCAtzMT0sreT8KDi8Yqi/eYn+vcsCnGVSA==
X-Received: by 2002:a05:6830:6082:b0:73a:6d48:dec6 with SMTP id 46e09a7af769-73afc43bb1cmr1259475a34.5.1750999168431;
        Thu, 26 Jun 2025 21:39:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afaff243dsm242619a34.13.2025.06.26.21.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 21:39:27 -0700 (PDT)
Date: Fri, 27 Jun 2025 07:39:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: khairul.anuar.romli@altera.com
Cc: Mark Brown <broonie@kernel.org>,
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Khairul Anuar Romli <khairulanuar.romli@altera.com>
Subject: Re: [PATCH v3 1/1] spi: spi-cadence-quadspi: Fix pm runtime unbalance
Message-ID: <62b9964d-0f2c-4d26-9b35-bb7af3aa5c4f@suswa.mountain>
References: <cover.1749601877.git.khairul.anuar.romli@altera.com>
 <4e7a4b8aba300e629b45a04f90bddf665fbdb335.1749601877.git.khairul.anuar.romli@altera.com>
 <ab51dfce-a7d1-4eb3-b469-af35529dfbbb@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab51dfce-a7d1-4eb3-b469-af35529dfbbb@sabinyo.mountain>

On Thu, Jun 26, 2025 at 11:37:53PM -0500, Dan Carpenter wrote:
> On Mon, Jun 16, 2025 at 09:13:53AM +0800, khairul.anuar.romli@altera.com wrote:
> > From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> > 
> > Having PM put sync in remove function is causing PM underflow during
> > remove operation. This is caused by the function, runtime_pm_get_sync,
> > not being called anywhere during the op. Ensure that calls to
> > pm_runtime_enable()/pm_runtime_disable() and
> > pm_runtime_get_sync()/pm_runtime_put_sync() match.
> > 
> > echo 108d2000.spi > /sys/bus/platform/drivers/cadence-qspi/unbind
> > [   49.644256] Deleting MTD partitions on "108d2000.spi.0":
> > [   49.649575] Deleting u-boot MTD partition
> > [   49.684087] Deleting root MTD partition
> > [   49.724188] cadence-qspi 108d2000.spi: Runtime PM usage count underflow!
> > 
> > Continuous bind/unbind will result in an "Unbalanced pm_runtime_enable" error.
> > Subsequent unbind attempts will return a "No such device" error, while bind
> > attempts will return a "Resource temporarily unavailable" error.
> > 
> > [   47.592434] cadence-qspi 108d2000.spi: Runtime PM usage count underflow!
> > [   49.592233] cadence-qspi 108d2000.spi: detected FIFO depth (1024) different from config (128)
> > [   53.232309] cadence-qspi 108d2000.spi: Runtime PM usage count underflow!
> > [   55.828550] cadence-qspi 108d2000.spi: detected FIFO depth (1024) different from config (128)
> > [   57.940627] cadence-qspi 108d2000.spi: Runtime PM usage count underflow!
> > [   59.912490] cadence-qspi 108d2000.spi: detected FIFO depth (1024) different from config (128)
> > [   61.876243] cadence-qspi 108d2000.spi: Runtime PM usage count underflow!
> > [   61.883000] platform 108d2000.spi: Unbalanced pm_runtime_enable!
> > [  532.012270] cadence-qspi 108d2000.spi: probe with driver cadence-qspi failed1
> > 
> > Also, change clk_disable_unprepare() to clk_disable() since continuous
> > bind and unbind operations will trigger a warning indicating that the clock is
> > already unprepared.
> > 
> > Fixes: 4892b374c9b7 ("mtd: spi-nor: cadence-quadspi: Add runtime PM support")
> > cc: stable@vger.kernel.org # 6.6+
> > Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> > Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> > ---
> > Changes in v3:
> >     - v2 was sent without a "Changes in v2" section.
> > 
> > Changes in v2:
> >     - Remove the runtime_pm variable from the struct, as it’s not needed for the fix.
> > ---
> >  drivers/spi/spi-cadence-quadspi.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
> > index c90462783b3f..506a139fbd2c 100644
> > --- a/drivers/spi/spi-cadence-quadspi.c
> > +++ b/drivers/spi/spi-cadence-quadspi.c
> > @@ -1958,10 +1958,10 @@ static int cqspi_probe(struct platform_device *pdev)
> >  			goto probe_setup_failed;
> >  	}
> >  
> > -	ret = devm_pm_runtime_enable(dev);
> > -	if (ret) {
> > -		if (cqspi->rx_chan)
> > -			dma_release_channel(cqspi->rx_chan);
> > +	pm_runtime_enable(dev);
> > +
> > +	if (cqspi->rx_chan) {
> > +		dma_release_channel(cqspi->rx_chan);
> >  		goto probe_setup_failed;
> >  	}
> 
> This will totally break the driver.  It was supposed to be
> 
> 	if (ret) {
> 		if (cqspi->rx_chan)
> 			dma_release_channel(cqspi->rx_chan);
> 		goto probe_setup_failed;
>   	}
> 
> In other words, if we failed there was some slightly complicated
> cleanup to do.  But now it will do the cleanup and free things on the
> success path if we're in cqspi->use_direct_mode.
> 

I suck at email.  What I meant was delete the if block:

-	if (cqspi->rx_chan) {
-		dma_release_channel(cqspi->rx_chan);
-		goto probe_setup_failed;
-	}
-

regards,
dan carpenter

