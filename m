Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B802CCC5
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748558029; cv=none; b=Jdr/v9OJjw5+QfCBk58a8dBsTVW5/McB2i1kRcXavcPPGZsHgb2l9vUEgAXDKu8pnf9RzgqWPWrPU688bgA63i3YZpqkXaNfHwjjyl8jWxSgLrwjKAt4SK5xlNg82ozVmZDx+Fm6OpWF8G5EV5yPGVpJyBqT8AJXgGEU6YeAHho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748558029; c=relaxed/simple;
	bh=8/ndSRdCQFKs7rSX8PqwJiJYpFKZB81926SOkhqa1CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlbtjgnvqtJhOKYcjmTHoRzV/gBXBUX/UcuMNZ8Ip/Wsi8FuF1Ily+axv00xS2y8NaXKWnAlN0PnNZh2vJ/6licsK9QpswwKSEyQpJRXYN9OYQzGel2kPEgM3DdU/9+fGTBVfPLgawKafo0S6UxEeegbMhYEHwvOSBcQDRsgKMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=A4hE2L7J; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="A4hE2L7J"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1553878b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 15:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1748558027; x=1749162827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6YSacIhSUe8j0kgUdoeFBNzPh1NsgF2V23hohzX3NnI=;
        b=A4hE2L7JSwOEjAAM0A38oYEShPGx/2PDM1gFiC5k0h8aVCt6Zq5VmY6Sfmb4fQqd3x
         fN40VW2UzwM3RFtY7ciNT2b4YOs3LkITe4FCwUZ/s3RtdPZtYmJpHvumJqNdba1BEJ9z
         wYV0k2r1lIZ3y96AGJg6ccLavLYRZMLk3P/i078w/LdP88TeAMl5SV1m4PO42P22jLg9
         m/vGcodDvhyDvi/ntJlKY8GIYlcRgdCC2Wyx+3TOOfFyzRg1vhJc0vxNHsiLgZz3rnOz
         hw/EpZUeEPdVaheOXtPr20uaknOjj5dh4Mf4VnMD9c/5XiOrFhdxauiyJm+ArwwEBrgU
         +xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748558027; x=1749162827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YSacIhSUe8j0kgUdoeFBNzPh1NsgF2V23hohzX3NnI=;
        b=FVBFFB+fKi9Zq7WTylB/Mxu37BpLuElC5KOkSakAG1Abo56SJQLMwS/LOLhuQuke1g
         NW6ddljQZZjyrxDEKneMv4EDyB4YPx7jUTDB1I0bws6qKX9Bxe6bUfyzQ6Bkr+naD9kb
         D43y7n3vAHW38hXWlqrqtIOtCd34aimZFfMm+Lo3u+PaY0MUeYMzLO0BDDFq8G3VJDSq
         4ME3wxuiPwfQYDd8ZR8e63Mao+/siaZ3EDIVU8SJoOkQI+384Nv9JlAPnaj0xR465npf
         X9Glcb04PL+P7Ft+VKNIrwunnFNw3rKSnHmyBZOgV1zauha2b0D0VGhkE4sIV/Ty7PZV
         TONg==
X-Forwarded-Encrypted: i=1; AJvYcCWq40UBIrYI8FG5bV9/VnDmEHc3L7fZNVEwf3IrlbsAOmGgraOz1zqk9xZET0jf8v3BzEgP5D67S1Dd8T4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNhHahy5gXKG2E80wtUAZB4f7HOj8yFDR3KAOIeVcayW5ejWn4
	UeRUp7azXY2OkYFUFBC27zpcJ4mjc1Zgn6RRJSXuQVNmq944cb4hjvwkIo01JvUJIpU=
X-Gm-Gg: ASbGncsI87Xird/NzHavf+uYFMQsQ4lYcPeLYCXIisWhKB4HIpJNYG7bWCGnpELZk7+
	fe1fB7xGuO5QiGfMtGmeUCPhu9r9doj0c0cSzYHILmx5IVTR5fmXFT6kpXgsIyjM1E29fDvrtjR
	DK/ow0HUAaGv7FwX1wNLnl04YSjQxRPNrC0hLr7ZILqcBIOzLBc3juiI/7cLh0ti6leLP+CTYyZ
	WSd0a63W1UCGH7Y4liuYac7V/wB9Qd8CM1m2kgR2NGmogl8+L5sWwW2p4dhjMQ606ci5sQK7RRE
	Zmtygu4i3QqvvKeIuX+R+KKofT3tR0ClPQhQbXOiXl/CyhD9nWGcIGh+Voie27f9zSkQo3Syr9s
	9tc/gEgI=
X-Google-Smtp-Source: AGHT+IHZj/1Shba20OZmM3OFPzAX7htJw4MOn1JwrvwJXkeYQGktsBWAgY05GzRUNgBCepuiRXfRSg==
X-Received: by 2002:a05:6a00:2d1d:b0:737:678d:fb66 with SMTP id d2e1a72fcca58-747bd94c561mr1395176b3a.5.1748558027606;
        Thu, 29 May 2025 15:33:47 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-747afeab33dsm1810293b3a.41.2025.05.29.15.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 15:33:47 -0700 (PDT)
Date: Thu, 29 May 2025 15:33:45 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Keith Busch <kbusch@kernel.org>
Cc: James Smart <james.smart@broadcom.com>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	Yuanyuan Zhong <yzhong@purestorage.com>,
	Michael Liang <mliang@purestorage.com>,
	Randy Jennings <randyj@purestorage.com>
Subject: Re: [PATCH] block: Fix blk_sync_queue() to properly stop timeout
 timer
Message-ID: <20250529223345.GA2013185-mkhalfella@purestorage.com>
References: <20250529214928.2112990-1-mkhalfella@purestorage.com>
 <aDjcA_H7Ec9VICps@kbusch-mbp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDjcA_H7Ec9VICps@kbusch-mbp>

On 2025-05-29 16:13:23 -0600, Keith Busch wrote:
> On Thu, May 29, 2025 at 03:49:28PM -0600, Mohamed Khalfella wrote:
> > nvme-fc initiator hit hung_task with stacktrace above while handling
> > request timeout call. The work thread is waiting for itself to finish
> > which is never going to happen. From the stacktrace the nvme controller
> > was in NVME_CTRL_CONNECTING state when nvme_fc_timeout() was called.
> > We do not expect to get IO timeout call in NVME_CTRL_CONNECTING state
> > because blk_sync_queue() must have been called on this queue before
> > switching from NVME_CTRL_RESETTING to NVME_CTRL_CONNECTING.
> > 
> > It turned out that blk_sync_queue() did not stop q->timeout_work from
> > running as expected. nvme_fc_timeout() returned BLK_EH_RESET_TIMER
> > causing q->timeout to be rearmed after it was canceled earlier.
> > q->timeout queued q->timeout_work after the controller switched to
> > NVME_CTRL_CONNECTING state causing deadlock above.
> > 
> > Add QUEUE_FLAG_NOTIMEOUT queue flag to tell q->timeout not to queue
> > q->timeout_work while queue is being synced. Update blk_sync_queue() to
> > cancel q->timeout_work first and then cancel q->timeout.
> 
> I feel like this is a nvme-fc problem that doesn't need the block layer
> to handle. Just don't sync the queues within the timeout workqueue
> context.

Agreed on nvme-fc should not sync queues within timeout work, and I am
testing a patch to fix nvme-fc. At the same time blk_sync_queue() should
provide a guarantee that q->timeout_work will not run after the function
returns, no?
