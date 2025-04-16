Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706211F09AF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811603; cv=none; b=jrQu1tCuM+7NLoygot6Mf5cGGw2fNa57Lo0TJx+68aqoJcxo3Aq2XZMcI6te3JZ2MSjmP9T/O8TY1vcqwX/8hBrviN9eUFulCJFBSlFZpd0phoiEiBdZ722+wmDATDnQKwibODTmTNw6sEPRWUfYzy9bPjDNUglbpmTwu68cz2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811603; c=relaxed/simple;
	bh=c3iouo++elzhU5kLFJNofCSl943fAkEehYhJJtecVxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILFp1O8bT2h+rODx8moC7DmGCQon6gkWjJUHP/vrL2pXDLliw76Thk1wMrGnZSx9jaWcBkhG9dZMZIyvSmrT9DX8GKUVXslv2jB443e2fs6nh2xyVil2rY+KjLvKR+HsWWFIIuBCDELSZrCZkYNsiWd9fkEz83Kq+qGZc1v1sVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=BUD2wyAD; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="BUD2wyAD"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-301e05b90caso6591659a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744811600; x=1745416400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gcrtZdemerL6aQk6jw2p5xNDI9nJ1A11Kxs8TNl/+g=;
        b=BUD2wyADgrr42g9VEbsYouF4CSrO0QqN4BWLlKvpD59k4QtqHiuLDhbv75RNinN7pX
         5fwnPlmB7b6qgd/RFd3oJ4oG6riP+8DIuR4Si6YuQPBnfb4QqGpjmcwXyPqpuyioBUUM
         Q4mlLWFS1iFVhbxobzipobO/VCbkqaKDb5VJrV73zd5TfqwOKKk83/x2bRDtJKU3wQW4
         PRiw/EixAAvcrcnH0baogb40fLn5yd5tsOdCw1WDyi+gxAesUd2WNAlzm1toSyZK5HKT
         pSMwulzcurRkjF/oZcV4TGRP/NEuGjrei5YYUEt9hdc/NLi/+ddCyczvosQ4Kbv2CfRn
         TkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811600; x=1745416400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gcrtZdemerL6aQk6jw2p5xNDI9nJ1A11Kxs8TNl/+g=;
        b=feO6O3+uOnI7fijrHBiWB2QWMNhDQu+IHTaUmEnkUJaoEf23iljTWpf2ccuKrFhfJ+
         /c3RHA6eTvV3qT2AWCCfj//BYwWI8uvQFzRBcFMo9kEV1NKzViRoUk0WuRbc7JP0Ngc2
         oC8nL5Xsai2Z+ul9UCGCAHs4Rox3GtItHhn0wjQUgB1BmXEXIImQJU5AsrYTzWj/TiPm
         P1c750B1OSQ8RD59bdSU2aB2QS9/C8ICY0xH7Ex0/1H60FzRl61Com+AS6OTWk8RtW9H
         oqfE6qacDiq6x4OIiKztDlhTW2dUjKe1hloFU+PpFZ0tXqA9H8bl4p48u2mrIHbWXJ7Q
         k2iw==
X-Forwarded-Encrypted: i=1; AJvYcCXXy7U0mEtsQrbLg7CAfYkHQCzhuWmd23AEmOOPFJcQjvop/pWdxZ8Mi4wyAX/zGELvYmVy6EWbCRuHmwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTaMz9N1hELqzYkdxsF03gdAr+IwGSAfIJ5iA9D7hwY31ecmmR
	znwuyJTwh09UbO/0TX5GnUXTfD+hwdxxLwn9iQw8yeIMFDgKgdiCtdif5Xxo+a4=
X-Gm-Gg: ASbGncvCrnGo1QKUh6jlHzzo9DcS9kf2Zshd34bWIq24Dnr737YTCtHJ70GAMCn8Rur
	9gDrLoWYD1G8wXPj2oOWCA24GIRPBw1/2P6dPhMU9MqzsHfswhyt0HSK0Os2XqloW3wDb/Ek0MJ
	WybRYidWPo8vWaNuVRozRJpru8H74uH1ogCcqyxIMi5JGC0IItswKVP4xcEC68bxgm0GOxn4MgM
	Cvzz3M6bVyjMYyxpyGJ2gHTGlI6lNRvP71Dfof/fFw4xb9Sd3SBrXLVSZv5DdIhGFPL1JCP/+VE
	mmx+xvmWwwFqt3sSHrMK78Ycj4b3vwv39T4WgudY1aak8PM=
X-Google-Smtp-Source: AGHT+IH2odz4MFUc8fi8peGC8XeupX73csOpmsRiYA+TNcVlda9dlCfptbzJAjHUUoSNYQRcyiH6+w==
X-Received: by 2002:a17:90b:17c2:b0:2ff:6af3:b5fa with SMTP id 98e67ed59e1d1-3086415dde8mr2433910a91.22.1744811600569;
        Wed, 16 Apr 2025 06:53:20 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2601:640:8900:32c0::c137])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-30861212fffsm1568898a91.25.2025.04.16.06.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:53:19 -0700 (PDT)
Date: Wed, 16 Apr 2025 06:53:18 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <20250416135318.GI1868505-mkhalfella@purestorage.com>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com>
 <6f0d50b2-7a16-4298-8129-c3a0b1426d26@flourine.local>
 <20250416004016.GC78596-mkhalfella@purestorage.com>
 <3dad09ce-151d-41fc-8137-56a931c4c224@flourine.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dad09ce-151d-41fc-8137-56a931c4c224@flourine.local>

On 2025-04-16 10:30:11 +0200, Daniel Wagner wrote:
> On Tue, Apr 15, 2025 at 05:40:16PM -0700, Mohamed Khalfella wrote:
> > On 2025-04-15 14:17:48 +0200, Daniel Wagner wrote:
> > > Pasthrough commands should fail immediately. Userland is in charge here,
> > > not the kernel. At least this what should happen here.
> > 
> > I see your point. Unless I am missing something these requests should be
> > held equally to bio requests from multipath layer. Let us say app
> > submitted write a request that got canceled immediately, how does the app
> > know when it is safe to retry the write request?
> 
> Good question, but nothing new as far I can tell. If the kernel doesn't
> start to retry passthru IO commands, we have to figure out how to pass
> additional information to the userland.
> 

nvme multipath does not retry passthru commands. That is said, there is
nothing prevents userspace from retrying canceled command immediately
resulting in the unwanted behavior these very patches try to address.

> > Holding requests like write until it is safe to be retried is the whole
> > point of this work, right?
> 
> My first goal was to address the IO commands submitted via the block
> layer. I didn't had the IO passthru interface on my radar. I agree,
> getting the IO passthru path correct is also good idea.

Okay. This will be addressed in the next revision, right?

> 
> Anyway, I don't have a lot of experience with the IO passthru interface.
> A quick test to fitgure out what the status quo is: 'nvme read'
> results in an EINTR or 'Resource temporarily unavailable' (EAGAIN or
> EWOULDBLOCK) when a tcp connection between host and target is blocked
> (*), though it comes from an admin command. It looks like I have to dive
> into this a bit more.
> 
> (*) I think this might be the same problem as the systemd folks have
> reported.
