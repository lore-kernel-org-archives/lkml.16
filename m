Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E314D27F4D9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424145; cv=none; b=hZBBvVRu4AL8sqBut9NY4s3WYicbD9QCg311iLE6++9zF6EprWzgmMTwu/9zwlzmgmo1T9Sm/5V4Sksxnm7D2yGdIrJ44jxJv8fADmCSurKXLAKmhoEeiSOGo9GuLmusGVzfQQXICola/Ua4ZjKt3XdVd1uZWf/N1w/oo24y6Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424145; c=relaxed/simple;
	bh=4i+Aa42MxjqCMrZwNRo+lSzwmT1xTOZvTjo84XR38Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGh7NVm+Fbb0wcsTWlIVtyOseKtnf0Nr+uyxLmZTsxBsLnckkT70LVY26yR34b/prPkyevLA7Nifqh/zFKHNT4NG5Xm9wnO9udvXQNXuNphPYsZG9OZlfio8ffsCNTDqj4Vanalg5sOs2EMoZ/+zcpHWy5sDetB4IPJw7uLGwRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f97jNSgf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f97jNSgf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745424142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sh+sYc0+MNHSUal421oTmCDMNe+GTwBu1Zv/uziK5zE=;
	b=f97jNSgfj9bFBQGXIVihJS5Se0v8SpXd455eb2AWTKH4BsQ3P1OtJ6jEolzDrI6xTxfjys
	gClIDOx6rZ07VqkkjHBNvgTR3V4KCmnVh9Fbm5VxZivbJwPZlvqWZifae6A4wMHV1ie+A6
	xUSE8e0Y1gY6e9phR7mc8QGY9k577rY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-6X5SgKh6PsW8Oeo-P-vmeg-1; Wed, 23 Apr 2025 11:57:36 -0400
X-MC-Unique: 6X5SgKh6PsW8Oeo-P-vmeg-1
X-Mimecast-MFC-AGG-ID: 6X5SgKh6PsW8Oeo-P-vmeg_1745423856
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c09f73873fso987491985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423856; x=1746028656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sh+sYc0+MNHSUal421oTmCDMNe+GTwBu1Zv/uziK5zE=;
        b=HddmcgrDvB/gxiFVhwAwDfUye/EabBPZPI1PvrIBkSss+aUMFzoOxXGIkaq2YQMnFw
         kul3pip0CEK6JR4SYzEcE0Qh013RmwXIZjQN3RhAUZaa7ly0cTYu7CPmaWsPn8zQJmhb
         vk40fNUZR4akT6DlXpnH7dG3FW0JfMKvSynOTXddNnRuvp/Z/061IPd/3s2io2joADd9
         SvC9lsBO0VhaXqbfcD2omaAVTauP5kjm9qxMiCEYsNoWjlbLw3ReDo2+GTI0nSC2xgYJ
         wemfGMRNiFoCVZuM7pbW3s44KlwWY2HL78bNddkt9YmzzZ5dV6FNBU1koszAr9xAzIAQ
         8M6w==
X-Forwarded-Encrypted: i=1; AJvYcCW4gPBW41K38x+s89guTJz8z8HE6cWhmNyknMM44Jyb1u2mCkazdqcK++SxvRKnTx2arUm8o8JNN4lb/vU=@vger.kernel.org
X-Gm-Message-State: AOJu0YznZpOYJtV+FOUzpnS9ugr6q7MbIRiQ9oLeFL84camPUM12gV/k
	pWxU/LCizav2W2OAw7PldQg66HEldzxf3GYIhX09pwz9mdBmu0yCooDjMeb7CbbluNk/NJW2ngb
	JiQDpjKFcy+3B8j+NGNWYYhxrVJnqNW4azyy2ng01ZybJH15l92Wks7iGENsOpw==
X-Gm-Gg: ASbGnctMwvtayBcBqW+mLHoW7YFQqKWR7CBi4k5yFBep7uKj/2hcMiZcunOIrxBiE2M
	AAN0o0DOLZMVJzTlmR8/9+cfHJkxsOh6BjDhZ9b2QeqZ7NTGcMyPfA7pxsWHM6PNIyDMnq/zQye
	FocHx7Dvw5YJbHEuWMZ9KFnm0Zc81AtHpbcuDMS0tmBcI8TZhDs6VBFLeOv1/MMVwT7YsRYoH3J
	AyM5/5zv/1FDYxPQoPZo9w8kiZHxpxSQPYDEiIGg4WFyWzlDhufv/X5gX/cVyGySYMkzsWVcEmc
	TjcnY9WNSilj1/EUFU2zNZ218fimO7/H8MZDTEBhwCs=
X-Received: by 2002:a05:620a:414e:b0:7c5:55c0:db9b with SMTP id af79cd13be357-7c955e14742mr15096785a.58.1745423855998;
        Wed, 23 Apr 2025 08:57:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIWB7Ovf66R3odop/eHj81SRynR7IlhrgKznJ816AeoHzYOpFR49dK5BzR9wKwh5ZqiuAyNQ==
X-Received: by 2002:a05:620a:414e:b0:7c5:55c0:db9b with SMTP id af79cd13be357-7c955e14742mr15093785a.58.1745423855655;
        Wed, 23 Apr 2025 08:57:35 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6eb60sm698231385a.24.2025.04.23.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:57:35 -0700 (PDT)
Date: Wed, 23 Apr 2025 08:57:32 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	mripard@kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] dma-buf: heaps: Use constant name for CMA heap
Message-ID: <aAkN7BXIT7RR85PR@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <20250422191939.555963-1-jkangas@redhat.com>
 <CAO_48GELW3ax5Q3h9=qpWBJJa0Uy3eJwFkEcbaz4ZT56Gq513A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO_48GELW3ax5Q3h9=qpWBJJa0Uy3eJwFkEcbaz4ZT56Gq513A@mail.gmail.com>

Hi Sumit,

On Wed, Apr 23, 2025 at 08:53:20PM +0530, Sumit Semwal wrote:
> Hello Jared,
> 
> On Wed, 23 Apr 2025 at 00:49, Jared Kangas <jkangas@redhat.com> wrote:
> >
> > Hi all,
> >
> > This patch series is based on a previous discussion around CMA heap
> > naming. [1] The heap's name depends on the device name, which is
> > generally "reserved", "linux,cma", or "default-pool", but could be any
> > arbitrary name given to the default CMA area in the devicetree. For a
> > consistent userspace interface, the series introduces a constant name
> > for the CMA heap, and for backwards compatibility, an additional Kconfig
> > that controls the creation of a legacy-named heap with the same CMA
> > backing.
> >
> > The ideas to handle backwards compatibility in [1] are to either use a
> > symlink or add a heap node with a duplicate minor. However, I assume
> > that we don't want to create symlinks in /dev from module initcalls, and
> > attempting to duplicate minors would cause device_create() to fail.
> > Because of these drawbacks, after brainstorming with Maxime Ripard, I
> > went with creating a new node in devtmpfs with its own minor. This
> > admittedly makes it a little unclear that the old and new nodes are
> > backed by the same heap when both are present. The only approach that I
> > think would provide total clarity on this in userspace is symlinking,
> > which seemed like a fairly involved solution for devtmpfs, but if I'm
> > wrong on this, please let me know.
> 
> Thanks indeed for this patch; just one minor nit: the link referred to
> as [1] here seems to be missing. Could you please add it? This would
> make it easier to follow the chain of discussion in posterity.

My bad, I must have dropped the link while revising the cover letter.
Here's the dropped reference:

[1]: https://lore.kernel.org/all/f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com/

Thanks to you and John for looking this over,
Jared

> >
> > Changelog:
> >     v2: Use tabs instead of spaces for large vertical alignment.
> >
> > Jared Kangas (2):
> >   dma-buf: heaps: Parameterize heap name in __add_cma_heap()
> >   dma-buf: heaps: Give default CMA heap a fixed name
> >
> >  Documentation/userspace-api/dma-buf-heaps.rst | 11 ++++---
> >  drivers/dma-buf/heaps/Kconfig                 | 10 +++++++
> >  drivers/dma-buf/heaps/cma_heap.c              | 30 ++++++++++++++-----
> >  3 files changed, 40 insertions(+), 11 deletions(-)
> >
> > --
> > 2.49.0
> >
> 
> Best,
> Sumit
> 

