Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF77C1B95B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393436; cv=none; b=nC9mumsxQdYohGKuTAONuMiOl74x4BUzPAU+ivXXV/f+Cl8WZcmvaHTMluy9EkqCq4nL26izAbw6uAvsmcvTwiGIc6Bc/2nlry1pcTS4UVk7QpyfgWKmlLcpEi1bzklnmd7XgsU9cwM5nMN6fD2htorvn1nLwDH7KVbkG+z+dLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393436; c=relaxed/simple;
	bh=qVuYgH97qGOUsu46Ucvya7XPhuFE/AmtIKhz0b9IC88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLTIvZhxTIWJuFXAqOaHiFCe5ysK27iI1tHYa0dHPN9HR1pC/T4uTo0yMgGGM0Lqd6ZkIkbszaCyUbroHXLUNFzSt6u7de2P/S3wl2Xt9AtoMJ03fYOBXcjQwwnN1FownjPgwsybV9T22QxeKBU+DuYoxasVCinE72nbMhRQpTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jToISTbb; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jToISTbb"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74931666cbcso5965386b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751393434; x=1751998234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dz+iVisJ6PIdZ57+05oG1WDDb/2tR86xHDO7dO7c2Ws=;
        b=jToISTbbRW3N7amA5kIGW9ng1mSdmMGXtqtKL4defLyr5C5QfWJrCxcSDycS9+wQRg
         nb2hZ6KEfMOYHXDN6fQrTH5jhDE1ZyyiUYKxrDwgsaLc4z9nucVlHzQGErpbl4Kb6Sol
         fv2OTm39jn+hEm6khMSSdh5U4oBGmMb/roHSt0clJjpJriBNu/DOZg5u6fPMQQ57hXsU
         Jo+uZU+77IRUCEMCaNULMNO8sgozpVjYbdkf4GtvYsANPaYGxkMyzqCLA8yHfRa6Wi/U
         M4fA8dxIPynCJBFYM+X9MgrxsaGjSon7uyU6PuFLMlLVXUVuIa4BMQSyyYfSRt1wnTqU
         dyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393434; x=1751998234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dz+iVisJ6PIdZ57+05oG1WDDb/2tR86xHDO7dO7c2Ws=;
        b=DG2NyAOsc6ZmZfCMSU+tuUaAIHIxxseSP/WO2Evn9LOfOeXEbD9mypJunf8BSgsvvx
         f/nchibZQOiS1tqFUvSALIWPzPoeTYYDNFJURUIJdDK2bd2fSE5zjjXQeng2LN4viIo8
         E0BnJDcfDmb/RLpsMuosPu0SMNUAzDFurXUfUD/VS9paaXX6XV0sLqMyxLfTuvavIEQh
         5L0KRgrIEtDJ7+BrmrW+nBnAlFkNqfBDehCfSdN4Cr+39kP/2n50c7Qnol9z3s09IrKW
         elEOFfd6yfamTlPpz3lGgoREyWzV0P06YTqeGo/WVJc5WaQaqZgP7polPA7d+FnEpT3A
         z1fg==
X-Forwarded-Encrypted: i=1; AJvYcCXHXpOfi2mXkP5kaTPjFMqUKQBaan3gm7OTx9pQCpjeLIH0LL6RNAgKonN3mjntSOd0MbVsqNhp4T9Q+PA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj7354ZC2Srf4voY4MWOWea4MAxRd4HgxscuEbBLIEZ0OX535a
	NMLme/FNNM3K0bFB4PLo4HtZovQrvJmre5xgtMvZ2Bqol9/SHlpVD2UhMmDuAQ==
X-Gm-Gg: ASbGnctuElSAUWStEFS1BgiLX0HmsabU8uV5m8u6Q3COBdtbM25FwYEhjEPsxbtMStz
	yL3HdLF8wy1LEeE3eTCW5BvOy5avUgZLxsX8yHQG8fwKei4VjdV96+V0wXgMovgNuSsJBmzYC6v
	Db10+eD76kOnyasTbRrFnOYOum9xa49EwFhb/4PY2Hs6CtqcySwnnIvvN+UfUg+S+Ko8PK+UjH+
	CcSOL4GYdTgUoj5X7JEE+HvDjvF0O0nNXyJfVfWIEOx6y2m1OY7xfson8AnAAAbP/6FbnSOdnj+
	sGFb8+6pPIR0dO/yLc5ZahlOkL1aeyPwJETj0JyXJXz2j54jVmIhzf6TqqGRIG0=
X-Google-Smtp-Source: AGHT+IFOj262rdo5tCN7yxlmsNZM9/BGjNmkztEOfqq8qiZTrEum6c1xeg0LmkvHvQR6zlps0ttrOA==
X-Received: by 2002:a05:6a00:b56:b0:73c:a55c:6cdf with SMTP id d2e1a72fcca58-74af6e61c65mr23689295b3a.1.1751393433987;
        Tue, 01 Jul 2025 11:10:33 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7bb0:b5bc:35bb:1cb4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e300468esm11168530a12.7.2025.07.01.11.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:10:33 -0700 (PDT)
Date: Tue, 1 Jul 2025 11:10:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: lee@kernel.org, kernel.org@treblig.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: pcf50633-input - Remove
Message-ID: <6utlzamf6luhexdvtpjbqnlkrdh5bj6gcoj2h7ql7kjxyjo2zt@csylxspamkch>
References: <20250629212820.319584-1-linux@treblig.org>
 <j3pkekg2mmbdbmguewoc5rks7263rxhveggkimbhmvkgxb5ikh@nwz553og3qtz>
 <aGP3fvnDpYqzQlYU@gallifrey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGP3fvnDpYqzQlYU@gallifrey>

On Tue, Jul 01, 2025 at 02:58:06PM +0000, Dr. David Alan Gilbert wrote:
> Lee:
> 
> * Dmitry Torokhov (dmitry.torokhov@gmail.com) wrote:
> > On Sun, Jun 29, 2025 at 10:28:20PM +0100, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > The pcf50633 was used as part of the OpenMoko devices but
> > > the support for its main chip was recently removed in:
> > > commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> > > 
> > > Remove the input code.
> > > 
> > > This was originally posted as a set of pcf50633 removals in March,
> > > and is the only major component that hasn't been picked up.
> > > https://lore.kernel.org/all/20250311014959.743322-1-linux@treblig.org/
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > 
> > Applied, thank you.
> 
> I see Dmitry has got that into -next, so I've posted a patch to take
> out the pcf50633 header which is the last bit left.

Lee, do you want me to take it through my tree as well to avoid juggling
inter-tree dependencies?

Thanks.

-- 
Dmitry
