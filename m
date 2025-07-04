Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C35302061
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636761; cv=none; b=d5GEPsSHnoSKEN8Y+J80jmcrNm3OnU3Ow6aFuZEZ76cjpudJUIf4NpjRMfM6RwJXOMTk3pjjGapk1lWJgoONSz4o4x6ZkEIogXOlNySAHvKIZDEetHFpFgAoY1VICN2SjPhVM7hzNY/ZcRbGMDdpK2SQuD4dGJ0YiXQE4Qr2ac0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636761; c=relaxed/simple;
	bh=oV6XzplTMXGoQH3JVlsHv2AsNfXJ6q3csI6Poj8WS9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQrxxL3BPKgwQ7K9O5SH2uQkRyVwXlg/n2m7DDj+FnNplCvXh24xzDElaoqGg+C91ltdFs8+kJgQAGrP0kBYVXsYRBhMWhiGw652XN9K7XCy2XOVCOCFQc5aJjqKPM8KnZ7HRivAdQde6UVejB6n0rIVt5ev/8LHtYtolnxUHN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ojeeem8l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ojeeem8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751636759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tkPHJk2uXWlHI4Mxw4g1nxzFgbqq3tguuk0UsLEAPlg=;
	b=Ojeeem8l5M6jvsl05EQhwaMpV3lux+et2um9h0IjQLYIjf8s2zyygEf7MgN6JmpNH89vc+
	nJC8CtnYprhJ1bFGNC1vf6SDPPmf1pibRh98s8kWNe8A6ElP84rygnou0I+u/coavtgCxX
	LT/ghsppDvzzDIpa4DbAs94PBa+hr4c=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-uyX0JwADOP-6bnTVwVeNIQ-1; Fri, 04 Jul 2025 09:45:57 -0400
X-MC-Unique: uyX0JwADOP-6bnTVwVeNIQ-1
X-Mimecast-MFC-AGG-ID: uyX0JwADOP-6bnTVwVeNIQ_1751636756
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-32b78b5a8fcso6388161fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636756; x=1752241556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkPHJk2uXWlHI4Mxw4g1nxzFgbqq3tguuk0UsLEAPlg=;
        b=MrOyk7sJ9Rrm+fcyxEtU4TIFBSEzRPKct8G9sEo+hHVIIKhN+FoHsxmHggS/fNB/fv
         xyteNdrYtrfkdMtD1jNfmyb2HQ1nyfTmdkuqktJ3hN94Q4cYLacT/TrkrLB3gV2mqmU9
         1JF3P3pT9/acurfP6PpE4Uh+mCgH8cfCLOQRVd2kD1lAR6FtaSaUgPc9ol26BG/9j//L
         51/b+FXMRoLyXyjIFJqBvVj0/3fv26ElJYsd/T2o5hdF4ukKB7LlHDIAcccvXmZebPiP
         TCQAYqL6FbYhZWxzUH/Spdr4nc6QYCoYV+zdIaAsmA5Pgu9HSLBoYY1+8kXaSE8iy86i
         aJLw==
X-Forwarded-Encrypted: i=1; AJvYcCXwIsSic4AtB+IopCoz/lAjbTxoJMWtabpVP3hD4i+yX0tgNJuiLqOXqXZD/eYS4mXU4Rpf1s3n7j2RTd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJmjEY8QIZ1pZrXyu+bhde15tGhZ7Dg+5U4QX05zxWNtN6Qlk5
	JzID5Xe3s5rc9x/yGWh6BBGxQ9WT0KYCXMrIS2UZZCFM6wI58VxN2+FMkn6SUgY/HaOMTUENPDH
	y9d4hmMrRINLezM3tawAZtLeXLcTC9VbH7YubKyAsKmbT2G/D17F3oHPNeGJAlqX5QL8no3V/yn
	PrDZOGqA7AxiuD98MbZrCfIjpASLELON12GUIhbsWe
X-Gm-Gg: ASbGncv5UYC/1n1bm4TvJbFT7oeemQIHDkKfYEc9qlH5CQ2NR0jkJGFeM3TVAwo/0xm
	7ctHEHSJleiGH9IhGILszcCJpW6butHim7yE4Kbmpt2tjo63xJmcg80KbeiX7HnuW3povQPWM8H
	rvvw==
X-Received: by 2002:a05:651c:1117:10b0:32a:88ca:ec18 with SMTP id 38308e7fff4ca-32f00c8743dmr4988881fa.10.1751636756099;
        Fri, 04 Jul 2025 06:45:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDaCSGy868gDxBsVUCZbBLG4zEY4+MQEyN6LRLn504s7dPbdj+PyCWVX8AYjCM6scFou+rAYHlTN5pxmQKpjg=
X-Received: by 2002:a05:651c:1117:10b0:32a:88ca:ec18 with SMTP id
 38308e7fff4ca-32f00c8743dmr4988801fa.10.1751636755647; Fri, 04 Jul 2025
 06:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
 <20250703114656.GE17686@lst.de> <aGaklKejxefXTQB4@jeremy-HP-Z840-Workstation>
In-Reply-To: <aGaklKejxefXTQB4@jeremy-HP-Z840-Workstation>
From: David Jeffery <djeffery@redhat.com>
Date: Fri, 4 Jul 2025 09:45:44 -0400
X-Gm-Features: Ac12FXzMam9AFzueysq60aOEJnJ-2lq5eOA3iIbIXJ_nllFIOoxd8lP-71CVRjU
Message-ID: <CA+-xHTFC6KTs6D8EdvmVe=buqw9oN5P7GJ-WWvam6M3SzeZF4g@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] shut down devices asynchronously
To: Jeremy Allison <jra@samba.org>
Cc: Christoph Hellwig <hch@lst.de>, Stuart Hayes <stuart.w.hayes@gmail.com>, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Martin Belanger <Martin.Belanger@dell.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Daniel Wagner <dwagner@suse.de>, Keith Busch <kbusch@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Jeremy Allison <jallison@ciq.com>, Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>, 
	linux-nvme@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>, 
	Jan Kiszka <jan.kiszka@seimens.com>, Bert Karwatzki <spasswolf@web.de>, sultan@kerneltoast.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 12:13=E2=80=AFPM Jeremy Allison <jra@samba.org> wrot=
e:
>
> On Thu, Jul 03, 2025 at 01:46:56PM +0200, Christoph Hellwig wrote:
> >On Wed, Jun 25, 2025 at 03:18:48PM -0500, Stuart Hayes wrote:
> >> Address resource and timing issues when spawning a unique async thread
> >> for every device during shutdown:
> >>   * Make the asynchronous threads able to shut down multiple devices,
> >>     instead of spawning a unique thread for every device.
> >>   * Modify core kernel async code with a custom wake function so it
> >>     doesn't wake up threads waiting to synchronize every time the cook=
ie
> >>     changes
> >
> >Given all these thread spawning issues, why can't we just go back
> >to the approach that kicks off shutdown asynchronously and then waits
> >for it without spawning all these threads?
>
> It isn't just an nvme issue. Red Hat found the same issue
> with SCSI devices.
>
> My colleague Sultan Alsawaf posted a simpler fix for the
> earlier patch here:
>
> https://lists.infradead.org/pipermail/linux-nvme/2025-January/053666.html
>
> Maybe this could be explored.
>

Unfortunately, this approach looks flawed. If I am reading it right,
it assumes async shutdown devices do not have dependencies on sync
shutdown devices. This is not a valid assumption and so violates
dependency ordering.

Maintaining all the dependencies is the core problem and source of the
complexity of the async shutdown patches.

David Jeffery

