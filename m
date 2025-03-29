Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50001922FB
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 14:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258719; cv=none; b=ATsRAt8d9OFT0CxNU4bG8Y9fhv9rSVeD29XmQgrRW7BEqSdeNbptG/2DP8LCd6avXexHEi62PBo5OU6pstUjC1wqbb32nvBjMhuagn+ykYNWHeykxro59KrPlpTT3hZCaQgWFzdg/qFtTUEkyEnRm4Sa1+tMggS46OwJsp+wcpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258719; c=relaxed/simple;
	bh=wLtpyn/hMcKpl0Wq05B7lWHnz0EIhT5E49EY7+W0wB0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNZBiK/lafcbmco6si+8WJakItAVOi8UZ0M75UqgbHqq0+bh5dTcZMgqWAXOf4NcxC2qjy3yf1CnHXoidqkyMbJPFehb0Tkpj68CoIEA/00TqqB9yEYmjvcOJN1it1Rd8WwmV7cglXqejBKElBQNlFj2c5fSnu12AzyJvA0iqpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=o7oEpoNX; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="o7oEpoNX"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47691d82bfbso62083411cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 07:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743258717; x=1743863517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OaG7HxKSmuBYBF/CBkUMzKi71PYV79N9N9a2jU7hfLA=;
        b=o7oEpoNXByKmDwVls9gviJyoy47Zc03RZKEtNfq867Dqsgj9BFtbsgayt6U5VKe14u
         KUQoA60jMaZ1hnx9+TbaTwPtRy9ZSHNyaQkqTfK91ZY5Bq2MK0SoqFc3fQ7019cVwxC5
         Y1J9W1bVE99suWZFlEEqdh6v1gUq5a9EaoM1GDghnOcxdzkmEyCh4EYVcRk9os3pjvKo
         oPH3NlPtPRtBpfaPviMaubuILuT/iYFnPc1NhGWh+Rd3AQtH9eSCogKd2j6gKk21zr0i
         vtlAZEenHgUWEpKj78LQdimFGa+Aa4YWwMEIzVg8K9/60rKyzXNSZTaF1e6lMq6yyFkZ
         M/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743258717; x=1743863517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaG7HxKSmuBYBF/CBkUMzKi71PYV79N9N9a2jU7hfLA=;
        b=PX65PKIgBA24wRF5EK1lFkUYM4J8ozkBoS07LvEiGolflnibffFbSIDSMDJzq9TZ4C
         lqfP3/qg701xeATEtTId7n9KAzhKcw1pWR67d/+cx0+nqgIHGzjxs/Z8cdX5sfYgkBK+
         GERsi+12kFr5MPCvCvvjur66NH1p8D98pXI8VlUgekelZbRVD5eT4piB1OF7yJhwdyfi
         Nn6FM9y9VD+i0nHtDWsrop9pziPeHPHGClrgBecgAdgy/xIxD6GPJOPUssz4lv/k+2fF
         CQ8lbK0EtADOEhjHdBBBNLHNJYDrgWkMxOuPrI9LlVDD6DNy9qD7+nF22/S/lVyea009
         c4fA==
X-Forwarded-Encrypted: i=1; AJvYcCU1WMtYA+7CUwcdC/hYR4WZctXKUIP1SeCLb6oJSFHD/hZBYlg/uu+Z+TSO8Y7pLCamIhalnYDIFCojrAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBkAyYoJdB2+rI5rNcV9PspQtum7u+PWi3x+sUAhlQmbCwPtCz
	nKCxbP8cLPmV+aNLB8JYsoWG/+uuR7uwY5ocM+vlWMkKE/bDF7bY1+bkyhlBqw==
X-Gm-Gg: ASbGnctI0qenm/B0AjKvvcN0G++V0AABmLPWgdSC80f+muTM2R3vbx4qEAIB8Q3efR8
	6cpifgaDP9vfR5ARuVJAQN2LzArvzP9jRQaj3VZvp5Id9Ccl61FINB537Se2LYWIu1X5foym15q
	6DTdmiEn1RpbMs3GTWLxuXfkXOw6LP7D2U+/olf/HvUnCg9UbiESAa8gk7t1hTSxH84A5YKsV7q
	hepJXz6YvHe9KgVQzV8TKpdF5Nhe0hXloBjx/9v47mCg2OuMVMbtvz4OJsJp+8b6ZjYGKrBtCbA
	thGoFWTZTYlKg5R027fsEmhOl3BHa/TbZ/HpaDwIbXQpC0kbDFRdke8=
X-Google-Smtp-Source: AGHT+IEV3SanNOlMZvC6jvdjgGVmfwiPj0zla8rOJEMOLQXnfMizozhnA/YNcGw053bRBznlRLE+4g==
X-Received: by 2002:ac8:57c5:0:b0:476:bb8e:a90e with SMTP id d75a77b69052e-477e4b71b1fmr42029621cf.20.1743258716858;
        Sat, 29 Mar 2025 07:31:56 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::df1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-477831a37f7sm24048601cf.68.2025.03.29.07.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 07:31:56 -0700 (PDT)
Date: Sat, 29 Mar 2025 10:31:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2 resend] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <a2bbdfbf-d7aa-4601-ae1e-18d75d011084@rowland.harvard.edu>
References: <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
 <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
 <Z-QjIRoOWpoWaL6l@shikoro>
 <c6bed13c-38df-43a6-ba5f-0da03b91f3df@rowland.harvard.edu>
 <Z-RyiI1X9BN43feQ@shikoro>
 <c7f67d3b-f1e6-4d68-99aa-e462fdcb315f@rowland.harvard.edu>
 <Z-bEBk68dh918vy9@shikoro>
 <24798648-c5a3-4e31-9897-4610053007f3@rowland.harvard.edu>
 <Z-eNvcrFu0VSY23U@shikoro>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-eNvcrFu0VSY23U@shikoro>

On Sat, Mar 29, 2025 at 07:05:49AM +0100, Wolfram Sang wrote:
> 
> > In the case of dib0700, it was clear from the source code that the 
> > driver uses USB Control transfers to tell the hardware about I2C 
> > messages.  I don't know if other bridges work in the same way.  In 
> > theory a bridge could use USB Bulk transfers instead; they aren't 
> > subject to this restriction on length-0 reads.  Or a bridge could use a 
> > Control read transfer but include extra header material along with the 
> > actual data, so that a length-0 message wouldn't end up generating a 
> > length-0 read.
> 
> Fully understood, thanks for your explanation.
> 
> > So the short answer is that you would need to find someone who really 
> > understands what's going on here -- which I don't.  Sorry.
> 
> No worries. There are only 5 drivers or so, I will manually check if
> they use a control_read and have no own header. Doesn't sound hard.

Good...  Feel free to ask me if you have any questions or need any other 
help.

Alan Stern

