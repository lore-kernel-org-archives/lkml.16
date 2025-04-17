Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085881172A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744854413; cv=none; b=L5Pm+D2BUclIjzpzmfG4p4pPYmO7w+Fc2DmLn7rtApiHSUGt5CghvBH1tiopEtdFloVhVJH4/SLFMAzpcmiqRjUfxoBBcrUjiOnCjOAVWxpj9tysnxhyTu50N+6EV9JpZf2UkkWNP1NALJKmJqLdCUTJi1Mav6sJJhed4V480D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744854413; c=relaxed/simple;
	bh=t7DareaskXUsnLKOeBmxAEkx9R1wyPt7VJVzWAmf33s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZxq95eT4lBFi+G6R4p6rSwM9wmhMxP3qyY7Kge9mDpvZTuxIKQLr+mX1OWr23C5XyZNg1H/jA/QSdq3Uj12oJFlGXVfhX6mGoTWkO3zyuU9lx7vspPFtS41ddUBHFNcRdKzt0Qj/HWwK5iLWl3Q4TR9yyhb9VqnYf0Hm04+XPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=FBWhdLxx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="FBWhdLxx"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22928d629faso2801005ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744854411; x=1745459211; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xrkt0T8eTu16gqA53V0agVggjbvcWP87Rtvx20jrF/k=;
        b=FBWhdLxxiFufWBg2cMAwulklCl7qDfJOiCkDDFM/xFhR0rFUCMGKxiH/VRskqx1r9d
         Lv1O6SVfJca9ZjXIr1edfVavgl5T2jMXFwjaT26XmHj7AXyUXw35XPozHlvAmqs3plBB
         VVUWKcRBmC4Nm2NThwjpHpOQ7B3COXh6wWbWzia58U3G7xZH0MeYLYYJW2YVbhG8gbfJ
         VKyxopQhGFdykArebeIvlBkIvaDrZ17J9p4Xmi+jF6K2kNUpKYOCzo3wjzSpLYIF5j+S
         aLyAgZio5jcmYjZHGr0+i92nO7X4VsMVVGU4AEkVyFXB8UlOyHthkdo6QIi2D11cmBQW
         NLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744854411; x=1745459211;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xrkt0T8eTu16gqA53V0agVggjbvcWP87Rtvx20jrF/k=;
        b=SnHqyTyEzQS5DTXBcoO24LaCmviy+y4a9JOiduTuzLYL1JuOIzmjfklVkbWHk080Qz
         nZQllgdPyLd+2QRz6KqWbaG7HUnhk1hmlS1Nfd/LY4jDwT3LfQGzwHc2FULHCiobEH6P
         4pImPwQEEf4Exp/LpEzlNTl/hiUazaCibsOZUOD74yv3Jvc2k8NufxCc9sQX/z4ErBUh
         P1kT2BeawNz3OhjZaC//sn/2vusv1Z3ZyMUSBppiHZWmq8ZOIfmTY2YtCobXd/WsrEfe
         9dQfJ3BHz16mdoywQTzIeJPsFnEuAcEFl/Hej5XUOTCj9/TZGdVjDSqUnjqPkHeD2oin
         zXPA==
X-Forwarded-Encrypted: i=1; AJvYcCU2WBbdN8RybBm8m6xrT/zCmjJxNRHBqXOVWjQiSE26NLeee2JRTU7avu2+9B0gZLHp7SqIQM4mjC8gNiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaCPIWdPtWwqPHdolvvxSuu/OFlU1gD3WARt1DxTWICzUu5cts
	FD/qkAe9ZSnsJHjIpAmze467jnC2CRDmITIAczzBkMj2vtWkwbOKSX7Wrtty+lk=
X-Gm-Gg: ASbGncuOBNzPT11qcAqPW3QnMAka5bv4OiJ039UdXtjQYYsG4XplrznRddGWqM6D/U+
	Kwjm4llHUtwSn/NTsPfodgvvtsL5PVBQ9MrB/l3yt/6TeFiAWyZRiinV1PFSy2T/3kpW8EKzKM9
	pwL4tawrBWk1vVWzRiLn0RByiHdR5BQnL+H/iK2PnTh8moFA1V7lIcj3rtQ/+VTkf6ewyeOh7aA
	SIMDPuV8pX1EbLxJxrzDX95Fzxtpz9aGTjNY4Sg5wugH97FE78psqtBDBguKlSm+WxSrLWSQSc8
	jXIbAL1f+vWklTBXAHPPfSeksz3/NJyE+sECQH78NwEXo4bEvoUtIcCEJP2S6TKyKVN/ynDIrA=
	=
X-Google-Smtp-Source: AGHT+IFsX+PqKZk9D3Uny/tD7FhInwa03DmQRsZ7lR2VZkpIAgn6LMjwNXt/Ss/mApVfjpVWh/HtIQ==
X-Received: by 2002:a17:903:2c8:b0:220:df73:b639 with SMTP id d9443c01a7336-22c3595dec4mr66016065ad.36.1744854411140;
        Wed, 16 Apr 2025 18:46:51 -0700 (PDT)
Received: from xldev1604-tmpl.dev.purestorage.com ([208.88.159.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fa5e74sm21447975ad.151.2025.04.16.18.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 18:46:50 -0700 (PDT)
Date: Wed, 16 Apr 2025 19:46:42 -0600
From: Michael Liang <mliang@purestorage.com>
To: Randy Jennings <randyj@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-tcp: wait socket wmem to drain in queue stop
Message-ID: <20250417014642.ljhowsbvkn2waipw@xldev1604-tmpl.dev.purestorage.com>
References: <20250405054848.3773471-1-mliang@purestorage.com>
 <CAPpK+O3_3KLxA6QuLSu7QbBwAt9jLBKmihbqQUYfmJwNzNGQ1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPpK+O3_3KLxA6QuLSu7QbBwAt9jLBKmihbqQUYfmJwNzNGQ1g@mail.gmail.com>

On Tue, Apr 08, 2025 at 02:07:24PM -0700, Randy Jennings wrote:
> On Fri, Apr 4, 2025 at 10:49 PM Michael Liang <mliang@purestorage.com> wrote:
> >
> > This patch addresses a data corruption issue observed in nvme-tcp during
> > testing.
> >
> > Issue description:
> > In an NVMe native multipath setup, when an I/O timeout occurs, all inflight
> > I/Os are canceled almost immediately after the kernel socket is shut down.
> > These canceled I/Os are reported as host path errors, triggering a failover
> > that succeeds on a different path.
> >
> > However, at this point, the original I/O may still be outstanding in the
> > host's network transmission path (e.g., the NIC’s TX queue). From the
> > user-space app's perspective, the buffer associated with the I/O is considered
> > completed since they're acked on the different path and may be reused for new
> > I/O requests.
> >
> > Because nvme-tcp enables zero-copy by default in the transmission path,
> > this can lead to corrupted data being sent to the original target, ultimately
> > causing data corruption.
> >
> > We can reproduce this data corruption by injecting delay on one path and
> > triggering i/o timeout.
> >
> > To prevent this issue, this change ensures that all inflight transmissions are
> > fully completed from host's perspective before returning from queue stop.
> > This aligns with the behavior of queue stopping in other NVMe fabric transports.
> >
> > Reviewed-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> > Reviewed-by: Randy Jennings <randyj@purestorage.com>
> > Signed-off-by: Michael Liang <mliang@purestorage.com>
> 
> Through additional testing, we have recreated the corruption with this
> patch.  We had a previous iteration of the patch that ran some time
> without the corruption, and we convinced ourselves internally that a
> portion of that version should not be needed.  So, unfortunately, it
> looks like this patch is not sufficient to prevent the data
> corruption.  We do believe the issue is still with the zero-copy and
> too-quick retransmission (our tests showed that data that was only in
> the buffer while userspace controlled the buffer was transmitted on
> the wire), but we are still investigating.
> 
> Sincerely,
> Randy Jennings
We identified what was missing in the patch. In cases where concurrent I/O
timeouts occur on multiple namespaces under the same controller, there's a
race condition when stopping the same I/O queue. Due to the current patch's
queue liveness check, only the first timeout handler waits, while the others
roceed to fail I/Os immediately.

To address this race, we've modified the logic to always wait during queue
stop, regardless of the queue state. This resolves the issue. We'll post an
updated patch shortly.

Thanks,
Michael Liang
