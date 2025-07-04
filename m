Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F42E0932
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646401; cv=none; b=SePsIt9OuTxuSzbERAPL629tlH4Y7InazCf9Mruk7hhU3xKeEn+sFKkWCCUNyzZRKXY8+6Z8DpmO3ZN7kWBDnMMfoHwWIVARstw2X1yKfTY9ko+ZmI4R2Gj+TlqPaWzxM6rR9o8HSj3rTxDs0vJY4rHMBpWeKuzquFRnCLOW7sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646401; c=relaxed/simple;
	bh=akp4zglTS+OiJwO1xqJMzOJDFv3IM9SctyJK55G8E/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrvyhxKdhCgiRc8fQBQ6yFGqfHNRVz/1Bi5afW1O9MQmq8P2VwzySl4XJWMcWCqWKt/MWZe9yOhwNJRzYeRAZYjlCv0QBM1iMeyZKf+s2ndS9XllODxPX63L+ogQJKp2ALHcNXftIBKCb+psaT77MZ3AaAEZxGyMs9P73Enz0Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=klWJJfXa; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="klWJJfXa"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-748f5a4a423so693723b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1751646398; x=1752251198; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uZ5dOYbYOkoWtAAYMytNtT+2qf4Eec58FQAQdPSVMHU=;
        b=klWJJfXaWRyxnnashhxp4ciKLrTw+bAG6YDZ3t1bgMp/WGwl1W6bc1rCD3aC8qiXk3
         TTF8dENDDs/iwblSQ1/FbNQ3RjIwGyZyiNL49G2yco26MH9SJD2zOyroiYxD6CdM/WPh
         rINkaxAOSa0oheHriJPJBF9i/w6tgDzB20uUTQLmR474jadb6zc/mSVMFoGiVlJduotw
         YIuSsmCriYVWhNh+nX6DbMnruUeOsJMOB5PIJc/a6nxB1WEp1VYZf+5JCx57PvBqGGmy
         aZCJoQcHP7DaRqwc2yocW5FR9Dzg8JwWSpwo3Olm8UmBPdzBshPtJU0dP4bpLEXkcydx
         G+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646398; x=1752251198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZ5dOYbYOkoWtAAYMytNtT+2qf4Eec58FQAQdPSVMHU=;
        b=Y0AZpX/iC+5hRblESV8EbbCCR7vK6b73rcprsC5Idr/H2fgYJG3CPBQnALoBXgQE5M
         eSR7O01OthqqO9hCCZ8Q8P4plCaTuKnFjXqwN7SGvx9Yh8so0gXfipS5YNTEBDMgXoIJ
         ab3k9qbQLIi/EDzuyxNvYW7e/wiurhoWTx78ynIF0teGQm+o/i3FL2wQvLEoCHv4Nt+l
         JF5lEpCR2dOuANvhzl+2UCDPFFXZimjC4fyyO/AJZ8s0CShGEtFdPLs7r0SiLSaCEMYi
         0C9YM6M87vZfM7Ro0fk1n3ru0uBGIWpCtGOdyuNdBZ3DhkWK3YG1LAKUxdCs9UGQJjOa
         LQFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzieryQi2ocidy5BXsmFZzJQe6NikghDwWfYyXEEvwtVyMFTBd0TVDEfLABLwHiplWpNFt5LLbuaR2Wls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk30fEtclm+GrliAnP5srtOhwkIqWk8+spVyXlJuZKuVlkqwh+
	h1mjFcGle0ul85C7Ys7w//lkFoO22PFv2PbEJGUSl/wrJM/p73RCmd/fhbk2zdCgyGLUvaamp3Y
	B0bsP3uEorh2+c6yp
X-Gm-Gg: ASbGncuUcjnjDEbCkbB+zm3S89Da4p6sfWbY83m7rXVfdwneGxLJrrlBS8z6jl6swzl
	30VQpESBF8UVDncORu1IDwPKStIyxQ/tdcAUzyMklOrqfYNipka05bdfwsQ3u+WSxif9ajla7GH
	7/NP5fYqb/7FnyJBRPKdQNGtm+jZaemFmY2GvA19HwU7mhJc2UB+V4Rv8K83kvSiVXz6Ne3XJtn
	1bFNe+wi4hxLq8g+SKrcBLWw4k0c4UhGEbjwNLLZrnH2y+tvNKmhyUyKvnd2rxrOCekjt4wA+sb
	DH5iHDkgAPAWh3yHT1mL9QEzD0Bf4u3SERu0bShtbZkI3ibwXZ03x0XSR6LwBhUh
X-Google-Smtp-Source: AGHT+IFmNX43fv12lDJwBxyke4slBPfKR27QIULjj2bFsUe07GNEU0S4nbmUu0opAKYqkv0SzWjoEQ==
X-Received: by 2002:a05:6a00:3e21:b0:749:8c3:873e with SMTP id d2e1a72fcca58-74ce8ad900emr3904971b3a.24.1751646397632;
        Fri, 04 Jul 2025 09:26:37 -0700 (PDT)
Received: from sultan-box ([142.147.89.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42ce64esm2213704b3a.153.2025.07.04.09.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:26:37 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:26:34 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: David Jeffery <djeffery@redhat.com>
Cc: Jeremy Allison <jra@samba.org>, Christoph Hellwig <hch@lst.de>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>, Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, Jeremy Allison <jallison@ciq.com>,
	Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Jan Kiszka <jan.kiszka@seimens.com>,
	Bert Karwatzki <spasswolf@web.de>
Subject: Re: [PATCH v10 0/5] shut down devices asynchronously
Message-ID: <aGgAuje4tpIOveFc@sultan-box>
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
 <20250703114656.GE17686@lst.de>
 <aGaklKejxefXTQB4@jeremy-HP-Z840-Workstation>
 <CA+-xHTFC6KTs6D8EdvmVe=buqw9oN5P7GJ-WWvam6M3SzeZF4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-xHTFC6KTs6D8EdvmVe=buqw9oN5P7GJ-WWvam6M3SzeZF4g@mail.gmail.com>

On Fri, Jul 04, 2025 at 09:45:44AM -0400, David Jeffery wrote:
> On Thu, Jul 3, 2025 at 12:13 PM Jeremy Allison <jra@samba.org> wrote:
> >
> > On Thu, Jul 03, 2025 at 01:46:56PM +0200, Christoph Hellwig wrote:
> > >On Wed, Jun 25, 2025 at 03:18:48PM -0500, Stuart Hayes wrote:
> > >> Address resource and timing issues when spawning a unique async thread
> > >> for every device during shutdown:
> > >>   * Make the asynchronous threads able to shut down multiple devices,
> > >>     instead of spawning a unique thread for every device.
> > >>   * Modify core kernel async code with a custom wake function so it
> > >>     doesn't wake up threads waiting to synchronize every time the cookie
> > >>     changes
> > >
> > >Given all these thread spawning issues, why can't we just go back
> > >to the approach that kicks off shutdown asynchronously and then waits
> > >for it without spawning all these threads?
> >
> > It isn't just an nvme issue. Red Hat found the same issue
> > with SCSI devices.
> >
> > My colleague Sultan Alsawaf posted a simpler fix for the
> > earlier patch here:
> >
> > https://lists.infradead.org/pipermail/linux-nvme/2025-January/053666.html
> >
> > Maybe this could be explored.
> >
> 
> Unfortunately, this approach looks flawed. If I am reading it right,
> it assumes async shutdown devices do not have dependencies on sync
> shutdown devices.

It does not make any such assumption. Dependency on a sync device is handled
through a combination of queue_device_async_shutdown() setting an async device's
shutdown_after and the synchronous shutdown loop dispatching an "async" shutdown
for a sync device when it encounters a sync device that has a downstream async
dependency.

> Maintaining all the dependencies is the core problem and source of the
> complexity of the async shutdown patches.

I am acutely aware. Please take a closer look at my patch.

Sultan
