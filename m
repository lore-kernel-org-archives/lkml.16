Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAED1862A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751341254; cv=none; b=or7Vt75kILB/s99KcJ8rEgjkX9eSA1vRVqV6BzVYKYajfo9RBiFaZpekfPl9fF7JvmZHpZnGRDlcuwmnBH2xHK3KV86ma4N4J3VrdSXGhJdi/15PzU9mA+5b99JcME4Jmjzu6dCa9POJlrRxQpLvdik63hWpavEfWAtoxztyDPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751341254; c=relaxed/simple;
	bh=lltCWcMI+ZEH+lqujNaBA2dHmDr8aLcEnJsmY/kR5KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IoEGe3sbiieGwjUPxJUKWwXWUjDzEtO4Mx5UGtCe/uJC3vWYvmnd1A8ci5Gu0kNoqfv6SSUJY/tW1dhwbW0SKvrCVM/gfr9qSw/8Z2SIFoqzcnz0V3+pUjhsmw5zIW2XGOhLAIaSV7y4JWC6D+xniqPiBayFfUIRwGQnU7i+yQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LOXcrdkb; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LOXcrdkb"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2ea34731c5dso1680401fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751341252; x=1751946052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QG8cttO2YDJI/Cbrk9rcT5943IALpBAonWAZbSd3z9w=;
        b=LOXcrdkblG1EUfKmQQlzpJvmlVrd6Ot1R+eGIO0+X1iyazY9cLB4luGOOtSdYYTluu
         QodTKpYk9XOmwzcuEaYVmbva54i2FD35cK+Vg2RRcyd6Hl53mFdhzHVs1OE2hdrBL/MO
         YWzCd9HMVFOPARi6Ce3A0s184qTAB4c+iXkTWSiLtfKKJDgPBAkX+/hprw1DvsKAzA2z
         pqKr8s0bkneI3I3teISv0Kk0iEM3bDqL6q/HcnNniZknSF203kI4d/SnfW+SuE/0ECHF
         je2+VMiHD0eGWJsc91KSqX37RocUYd1siR6ou+6sEyzjU0CwrNXyzuqXQYwmrrfB7KU8
         9K9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751341252; x=1751946052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QG8cttO2YDJI/Cbrk9rcT5943IALpBAonWAZbSd3z9w=;
        b=jvKZWV0LcZHEQVya1ImFotCEqQ5nCawlQ74WPGDfNU97BTahHJ62nLfOWjW/n/b7ld
         J43PJ0yw4XFXlUsopSYW9sunu+ypMdiKDAWnSSGpk/zzIiCz7Vd5JGFxEf0OBgjSzV1M
         OXl/5tyNUM8FkcKEjuzM/pcjII4KkaY/eSkq3Ou/Gk1mxpuohMp6HUF83dQF8epMczTm
         tLjDQClahWjSozPJ0yYu3vQeehgKizoYY2a/v9RIH4V97kJxX3UDrJkk6n0OI5SrzOU3
         f6/tbGu9fwLx7s16zv9thSWVldMblBYN++BBKV1Wy/SOBvgY+CpXDFtrLt/rdxn6j2ho
         OB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRXBteWesMlZcdpWZcx+smQY301rwz6WQbu0s95fSXXL2RigRTpKRFG6i7B1wpMxea96bFK+lLAYCCgb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrshcVbDdGLnPr4zTKky47/s6c0bO7KfoH9Njtx1eMHuaQbOQ9
	/rnC3lldfhYCWpJcAnvbtrSLu6SNtdiTIQmA9UwicaHzBy2Essn4nm4NosSwvZa3Aaw=
X-Gm-Gg: ASbGncv3RtJVgFGoXI3WXuTxv+je6IZZywOr3BLvw0yzvDoHD6DXRcSSHhcn4rmQ/qZ
	70uPc4PgucK81jtpi7tYOV9/e0UY8X8+SrsjPyjum6NZh+8ql9vJiry0qJHQE0/io89RnUelneS
	G+7bE2kW7J/jjUDi1euEPldSIQKidtEXNmgqVJMlAPF5ilbuI0WTw/5RAjWMLdFmAbzgXJQUupw
	iV2l8C4n5mD5qvCy6flBR3yw8nWzZQvDIuWxLbiqmt8KIYpS+sjW0AAPqB9FYKXEYcdQxTl5keF
	1hTOubL8VsO5Lm49bPzUf3n2FXrMWP0JjMnhuU9WoTYnr+FU1yBK0073e2jvIfp10R24
X-Google-Smtp-Source: AGHT+IHV923IELGMFRF52e3SyaM+jl37uSwZWCYEONH8sGFzelWcB5/MVGr/Hp0oCRgdjFXA2owmaA==
X-Received: by 2002:a05:6870:85d4:b0:2c1:51f7:e648 with SMTP id 586e51a60fabf-2efed89fddbmr11880176fac.35.1751341251915;
        Mon, 30 Jun 2025 20:40:51 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ea6c7bsm3018677fac.3.2025.06.30.20.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 20:40:50 -0700 (PDT)
Date: Tue, 1 Jul 2025 06:40:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@altera.com>
Cc: Mark Brown <broonie@kernel.org>,
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"Gerlach, Matthew" <matthew.gerlach@altera.com>
Subject: Re: [PATCH 1/1] spi: cadence-quadspi: fix cleanup of rx_chan on
 failure paths
Message-ID: <612f64eb-ab8c-43cd-9f6a-e913cd5aecb6@suswa.mountain>
References: <cover.1751274389.git.khairul.anuar.romli@altera.com>
 <89765a2b94f047ded4f14babaefb7ef92ba07cb2.1751274389.git.khairul.anuar.romli@altera.com>
 <9f26f205-756e-4fcd-912e-bf73167be21d@suswa.mountain>
 <DM6PR03MB5017D9C650820B9A5C63C6ACC641A@DM6PR03MB5017.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR03MB5017D9C650820B9A5C63C6ACC641A@DM6PR03MB5017.namprd03.prod.outlook.com>

On Tue, Jul 01, 2025 at 12:39:24AM +0000, Romli, Khairul Anuar wrote:
> > On Mon, Jun 30, 2025 at 05:11:56PM +0800,
> > khairul.anuar.romli@altera.com wrote:
> > > From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> > >
> > > Remove incorrect checks on cqspi->rx_chan that cause driver breakage
> > > during failure cleanup. Ensure proper resource freeing on the success
> > > path when operating in cqspi->use_direct_mode, preventing leaks and
> > > improving stability.
> > >
> > > Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> > 
> > Thanks.
> > 
> > Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > Mark asked me to fix this and I wrote a fix but apparently I didn't hit send
> > because it's still in my outbox.  Sorry about that.  :(
> > 
> > regards,
> > dan carpenter
> 
> Sorry for sending the fix on your behalf.

No no.  You did the right thing.  It's me who messed up.

regards,
dan carpenter
