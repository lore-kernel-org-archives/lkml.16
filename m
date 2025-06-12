Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8998299A8A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743251; cv=none; b=bQy/+crNzUBS/vMidfbpwRjBy9fkUCx1sgMrqxp5tnJYYYIvGM/QgAYUraPnxlrFkEW5PaDIe2zQbcp59MOXfpjbaKb52CjqB1AScIzzTI5JoMzgsqn6fspuKFWhTqCzMkEqe2zDUHlWldeJH+JokqHKZCL6dEOKTN6ZIDnjOjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743251; c=relaxed/simple;
	bh=6EJWAXUizv4x6TeLRRJdm1zI0l44XmREmXJzX+1ANS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXTkGn7iZcxvJ1tqazpAlnwb6HjZymfh3Tn0BdkSxOOGgnBPdnvyiQCI5pNy3qFM6fObiocuvLjKPLl4BNk8ZbzhwlucjwW9I//IAHz4NSkPWI4qIfi1l7XF05xUDYD7Daaj8hIyb4xhEie9LmMQ1JjTlz+2ugOz6PYLUVUDNdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HgHjtsPN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HgHjtsPN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so13736115e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749743247; x=1750348047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zh7m5aFTZexY03nsf1b1OGgOvOMdgi7k2RJzccpdmoQ=;
        b=HgHjtsPNh7XU9GHYO+Qs1sc18DJW4arxxmLkJB0bnQNv4ZxH5fJOmA6I/2avoNElDJ
         ezG8OI+AIFHFziJxMglbUI7AQtWdsEvAEu/+ko6XfDJJHIrmQ5yytyTEYT7zfVmBSsDg
         oCs7CHMkYsDagsB7FpLKsGB1Y7cPHtLOFFHTC2aX6AinACJZnctisFStEaWCRuB8ydaT
         H1xw/O8EXh+bMuTao3vy6/U2YugHOcvRNTTQlFrAJSLLu9JhM+KbU+HDT4oTpCqERSlv
         e3j/w+QcvCHSLV1lRMbq+AkfGbRVk7L6xbda5zUXlfV80Es1gFVhCjs1GbLs4kYccgHb
         zKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749743247; x=1750348047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zh7m5aFTZexY03nsf1b1OGgOvOMdgi7k2RJzccpdmoQ=;
        b=bRVCFMiIozGv++m4SlIQaYy8ZPNMFxwCGEjSph5+3ydiTNOKjktJ2xLIYRPL4esdCy
         8azr//UN+a3j8fHFOy4pj6A0t+fLF9VSnc2NAR1RajQitZg6r+2eWspCvW0dfRqQlUdn
         I5AQ/FG+vAmN/ilr3Ok4qahL8+gpKNLJuRBR7EiVlrGnhTl906mtbkA25G0HMdc1Sr5X
         8WOHrxlWLKvoNFgtcmL3IwDOqg3ZOlTtoRV9k6A7iRBRnKWW4nNRCLX13IU4jeLtJYTc
         96y6Jq57nkMEuSowkxZnfW53Sj/Vv4+DW9AN1J7i/tkEQdRgrBn3AzscAYyQwRZ23o1m
         daiA==
X-Forwarded-Encrypted: i=1; AJvYcCUoN39WA4b4yxf3cE7pUEpS7o2M48gSyOf3J4gqTApfw1t7zfitsYsK6UrEyAvnL0/m29jno13ckI9IkJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDxnJGBDPh14PuTFGdKVe25s/4D4yJFw9JPSODP3Qgm+s01x/7
	31Euowl4bG7Kfv6j2J5vJgosx0NHLzEspOb/oNmm5uO2mubKV2CXLCe2+vfe8n0NFUA=
X-Gm-Gg: ASbGnctTI8DzzzJbf0AFg+GSGMkDNX2mA2bUCQomCk4PR7NrC1DHkjWa1HbNe0g1B84
	PfUW8W4rc+yQwGL4clprWzqYqVqWJiL02xhaiJ6eWW+pikbxDMkhmX1daBQXXWB+IrNZHg+HkTJ
	So6uDgXg854Z3bghWjv85uvT+LegzF88yFjyngMwSlw2tlQAJOBNLKDYVV2HyzYgZ2FmA9YoBu1
	uIZx7LwUqZE1dch/DZaEUCesjKzE7Pwhhwct5skCRBTix1ys6XrWr29tte7lPlgVjzPoKBzmpii
	fAAel1uD2wXvGwyojAh/9WouqB9/qCIvcnkJNir6mxTUFILCcV0DYSQTsXSY5oKPbDljxbYjUqo
	VIQ==
X-Google-Smtp-Source: AGHT+IHczznv5LyNR2hJXOddUvykY6/Q7P2zOffstHCE9b07Vxo76rhyxFFsgAzhcmc0JU11Yz5PdA==
X-Received: by 2002:a05:600c:8b08:b0:450:cea0:1781 with SMTP id 5b1f17b1804b1-4533436e50fmr1615195e9.16.1749743247314;
        Thu, 12 Jun 2025 08:47:27 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531febf905sm69898505e9.0.2025.06.12.08.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:47:26 -0700 (PDT)
Message-ID: <78d77dd0-2ddb-4074-8f2a-debc7bc41fe1@linaro.org>
Date: Thu, 12 Jun 2025 16:47:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Frank Li <Frank.li@nxp.com>, Vladimir Oltean <olteanv@gmail.com>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
 <de7142ac-f1a3-412f-9f00-502222b20165@app.fastmail.com>
 <aEhVsrEk0qv+38r3@lizhi-Precision-Tower-5810>
 <20250611090107.t35zatn47vetnvse@skbuf>
 <c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org>
 <20250612111514.rfb3gpmlilznrfxs@skbuf>
 <ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org>
 <56b158fa-5fd6-4582-8ca1-296863d6d2a8@sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <56b158fa-5fd6-4582-8ca1-296863d6d2a8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2025 3:43 pm, Mark Brown wrote:
> On Thu, Jun 12, 2025 at 03:14:32PM +0100, James Clark wrote:
>> On 12/06/2025 12:15 pm, Vladimir Oltean wrote:
> 
>>> FWIW, the XSPI FIFO performance should be higher.
> 
>> This leads me to realise a mistake in my original figures. My head was stuck
>> in target mode where we use DMA so I forgot to force DMA in host mode to run
>> the performance tests. The previous figures were all XSPI mode and the small
>> difference in performance could have been just down to the layout of the
>> code changing?
> 
>> Changing it to DMA mode gives figures that make much more sense:
> 
> If not having DMA mode is making this much of a difference shouldn't the
> driver just do that?  I'm not seeing runtime configuration in the driver
> so I guess this is local hacking...
> 

Yes just changed locally.

>> So for small transfers XSPI is slightly better but for large ones DMA is
>> much better, with non-coherent memory giving another 800kbps gain. Perhaps
>> we could find the midpoint and then auto select the mode depending on the
>> size, but maybe there is latency to consider too which could be important.
> 
> This is a fairly normal pattern, it's a big part of why the can_dma()
> callback is per transfer - so you can do a copybreak and use PIO for
> smaller transfers where the overhead of setting up DMA is often more
> than the overhead of just doing PIO.

Makes sense. Although for some reason two devices already use DMA for 
host mode and it's not that clear to me what the reason is.

