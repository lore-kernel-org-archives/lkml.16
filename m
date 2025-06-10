Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162B913BC02
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749536881; cv=none; b=R5JQtI93irT8T9MXrlxkRTA1RGUH1WoVX/cBYaaGy2m3/TBLTQVhufJQcULGn5FAjHYT1DyrqpP2aeQtLVZKxrPa0acsX/Xh29SCzsVhNqZHTc6+bna+/KzSh0/Hwz125dA4zipKhuMHG724MaSqn2Kb+Wj4IZ3R3LvalsPd0+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749536881; c=relaxed/simple;
	bh=3RySZmq6aFNeYlomSwoo4Yh12T77gmiZ464JOIGhQJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aiec0aWRh229WIIrI/ZdBBbApIhFwnytu2bdKb0Q9cyYX+4QrQWLI7RaM8yf7MqpwN10SjyAG8QaTG0lyCxGTLa83m9uNkYnlAnz31dpjKLq6HmMI9P1sqQArrm+lynvhb8Y/rcWo4eCOkdwKH572sTq8hsQPfziR8/B0JHL3RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbpCVjXn; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbpCVjXn"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7485bcb8b7cso860257b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 23:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749536879; x=1750141679; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QSUw9NQ3m9yaoFUqCLQXfy1ZhQ4O+VqBpSj2IkfjqDU=;
        b=YbpCVjXna1ewMjA/PezHnc/dcR8jeWXNcHLltOfHqO9hCze/xeHzQqdGdoZzDRz3nJ
         ix2aJeanC3O4NJxZFHw1lpx+7yyCEc0m3iN3VXKAy4Spv06WN+URuIl4LHL7X/s6DPNr
         zumgr3TbecIL15I4Q/W12TzP91O5qNLpBahiIsGAIMcsQRfmnoZ847YKTs/ePXKjTwZy
         1VDAUgDfgE2dZw9CRLaECzaH+iwqUuivmebVe2HyXmEvmps/MNTBZS/Clvv5eDoPEFEZ
         lcDznnN0HYDIY1sw4aIeY5mb/dLy7gXq02WYOlhaS4p8ImSJEyKelnVywrWmvRaM+UNL
         MeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749536879; x=1750141679;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSUw9NQ3m9yaoFUqCLQXfy1ZhQ4O+VqBpSj2IkfjqDU=;
        b=d0SN9PHsR3KBVQa4rFpiL4sl46zU0bVWwLi17aoYJjA5EqDXRKjMtERD5WLOxSpg30
         WIJGZXRhTrjARK7vp4TTfNkLhDAJQ0otPVfOV5rHDbSg1cvU0pZtY/Id8dBp40wpXiVm
         wbHmq4GXCP2OYq47U5X1VkWQsUYkrGBp8ly8RMU42oKoj0rTpoW93oXGjdBJw96NXOtw
         qjoTEyWxCp4BoNYjq2PZH1mSYw9CVrwWp68bx+BGG/mWHeEJsic3pD1SBh1DCRE2AS6R
         BKer5He8ILx0YhWrZRIqnZZuUS/33xBnJxTVhlMAGGDDwxQOLcvrhXLR3dKHdDpr47ly
         5RYw==
X-Forwarded-Encrypted: i=1; AJvYcCWqTNVzeac7cnEBtWbSXJ3jpo7EcVpZnXQSLcrTIWPA5FRq63YsLQBeB0nnNOeDU/rSEKImiMgTeUlH4LE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz62kcwEksKmqL4LWUesBMV06huQmfCzsdnwlhYfFYYz1CsbwHg
	tX9Solrilh76nQS2Tw+RswIFkgr038BCDlcySA1y7IeOWNnRjL/GbQg9
X-Gm-Gg: ASbGncvbKZWS/xjVjV8Niyxo82A6bi0gorJ+NTaIuOekKHxbWnII8925UDLWtmhfcNh
	g+3wpv6R5hM9CJ+rIeaJPpNIEzvHq339us2NIgmwWZd8KCPCZuySMmk/YPfANZcAYYQdMR1RVl/
	yPAy/Bz+1A/CeRq7mf7+ELFjffsuLMI4UqeMtqROmZnZ/qqBYc6KTFoINQ1g3i3LnoNs1CF54vf
	L0xXJc0P6tAnIgPmsoFO1R5q9WkomHPu1p+ZADN6ZVfBEZ3t9ylUuLHT7nW14uB7eC7h4tBJk0f
	w4b16shSxxEdaiTs6JxlzihMVFWxEShLKAfbHYNByrxSM+sgbqM75uEltXgf+K/i0Q9kx7b7cNk
	LvuoAv4kEZHSkKw==
X-Google-Smtp-Source: AGHT+IGjpd5+nTkCN6vJhxOxRFSA253lWZbpZIbQsFwQfvVoj7VZCSp9o7UK71MHIR/U2kEbcPexrA==
X-Received: by 2002:a05:6a00:c8a:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-748618bdb31mr2172258b3a.19.1749536879296;
        Mon, 09 Jun 2025 23:27:59 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:92fa:651f:9075:3817])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e8163sm6988042b3a.145.2025.06.09.23.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:27:58 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:27:54 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: sboyd@kernel.org, tglx@linutronix.de, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw
Subject: Re: [RFC PATCH] clocksource: Enhancement for clocks_calc_mult_shift()
Message-ID: <aEfQauoqhEs2DkiG@vaxr-BM6660-BM6360>
References: <20250609194611.690678-1-richard120310@gmail.com>
 <CANDhNCrVtK9Tv+d1=z1yrh4OxiS+neENQejD5pCi+R=Cwra9Xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCrVtK9Tv+d1=z1yrh4OxiS+neENQejD5pCi+R=Cwra9Xg@mail.gmail.com>

On Mon, Jun 09, 2025 at 05:32:05PM -0700, John Stultz wrote:
> Thanks so much for sending this optimization in! It looks promising,
> but a few comments below:
> 
> On Mon, Jun 9, 2025 at 12:46 PM I Hsin Cheng <richard120310@gmail.com> wrote:
> >
> > Previously, counting the value of "sftacc" within
> > "clocks_calc_mult_shift()" use a while loop to determine the amount of
> > decrement operation for "sftacc".
> 
> This is just a direct translation of the code into english, without
> any context or explanation as to *why* the code is doing what it is
> doing.
> 
> It might be better to explain first *why* the calculation is being
> done, and then get into the limitations of the current implementation.
>

Sure thing, I'll change this part.

> > It's equivalent to the position of MSB of "tmp", for which we can
> > derive from (32 - __builtin_clz(tmp)). Use 32 instead of 31 here because
> > 1UL should be treat as an amount of 1, not the index 0, and even though
> > "tmp" is of type u64, since it's already shifted right by 32, only the
> > lowest 32 bits will be possible to have non-zero value.
> 
> I was having a bit of a hard time parsing this paragraph, so it
> probably needs some more work.
> 
> On first skim, this also was a bit confusing as __builtin_clz(u64)
> *seems* like it could return greater than 32 (but that would be
> __builtin_clzll).  So the (32 - clz(u64)) bit might confuse folks, as
> It's pretty subtle that __builtin_clz() only works on the bottom
> 32bits.  The code should definitely get clear a comment on this.
> 
> And thinking more, would using ffs() be more straightforward here for
> what is wanted?
> 

This is a nice head up, thanks so much ! I'll switch to ffs() and see
how it goes.

> > This change is tested against a test script [1].
> > Result shown that it can save a significant amount of execution overhead
> > for this function, which is invoked often, the whole system would likely
> > benefit from it.
> >
> > -----------------------------
> > | old version | new version |
> > -----------------------------
> > |  11500.6 ns |       44 ns |
> > -----------------------------
> >
> > The execution time is reduced around 99.7%
> 
> That is impressive, but should probably be contextualized around how
> often one might expect clocks_calc_mult_shift() to be called.
> It still looks like a good optimization, but we shouldn't over-sell it
> unless there's a concrete impact to users.
> 

No problem, I'll try to use bpf or some debug prints approach to test
the invoked frequency of this function, what do you think ? maybe
there're better and more elegant approach to do such profiling ?

Btw I ran each test for 10 times and take the average of them, I should
amend this in the commit message.

> Thanks again for sending this along! I'd just take another pass at the
> commit message and the comments and see if this can be made easier to
> understand when someone 5 years from now is looking at the code.
> 
> thanks
> -john

Hi John,

Thanks for your review and these suggestions !
I'll refine the commit message and do more test ( e.g. use ffs() ) to
see if it can be better, I agree the commit message might be too
confusing, I'll work on that more, thanks for your time!

Best regards,
I Hsin Cheng


