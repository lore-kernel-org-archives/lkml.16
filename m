Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E3F217712
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085645; cv=none; b=BXLNKy3AmnFmzsyWAChMle6JxG8kE7qLXhpHh93+NDaxm378z6I5Hk703TjG/zZEHVgOSYQO69tlMikvs6FRpwvwU5L7Os8PceVWauDERXwKeYYZ1IvoY5bpppNt/IFqO3fe2ca7QMpTY1OVtBt+EnWjlfH0vIhxQaFqDTK6V3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085645; c=relaxed/simple;
	bh=TNiziXh7l/+LK3sI2xU+yXaVn8zFa6UM7htRuGKNEBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA4f96bSSl4diTrq2BesPVoGrC0E87XVUuaiu38IFiMbpdHP2cQYHg69do9bj/B9RZPQstnQjcv4Sn9U/WzM/dJE6zlEqO3cvOczqEcWEuhr6pT66NUAa48Inizl9FlKjYFRJSLN2jqGpmTmt5ZJmSeXnWQmsKMRpHNj9j2K62E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=pCn2OlzK; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="pCn2OlzK"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476ae781d21so10133161cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743085642; x=1743690442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oEhy6DCrX7tamhvAhInWjX7T4LSG1U3SOmgFEoRQVV4=;
        b=pCn2OlzK3GNIGJyt1UF6o5OXWO3I7H2ypCQHIGnbIoRszSXIAJQg3V86WI/j3f6jCo
         iVDmFZRgMW9cHu5xHAD+b3mqviGqhGITcK1EymqormZ90mUA9dgjCEGVsJhG+ktGdKXt
         F2dT/1VVhpuadpmRoHOWW6h4K3OE5Nvt7rGKFntibU903Dj58e82qSw1tNu8lk3JoqYg
         qxom43TJcCwURC4/+5iVlxlqWyKh0ygFAkj0kgMWpJ3QvMED1nbN1rOYaocduPHbqN59
         mXolZOub9OPxkAz2wDPh1h0wouCPaQwTmoWL0jU2KIUsCmwObZNhNw1IAvNabCTvfrLv
         jlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085642; x=1743690442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEhy6DCrX7tamhvAhInWjX7T4LSG1U3SOmgFEoRQVV4=;
        b=vTv5Alrxf5FHif5eGpax8+gsa6kPVVeN7mpEL4PGtTX//JN+jv3FTBS4LDBGBGsQTC
         MSQ7hT9FOe1xfYlfd55Jz0kTENj/mBezAqwGs6QGao9aJzKkwGmp4xYYJOTuys2vplN0
         x7A+FsWL/EkHVNpHVDN3INbFZCn2Re+nQsEj3nwY9tOCwA0TKrM9z+EjfSXTCC/n9SpB
         7ERErvfRN+wodAXWxdIVHMjSjgKWADDF2MU4SlBckHu6sYo8wtvvv4BA4YBkAxEQn02V
         TPkIQ/8gBs2qwpiNzNABLzEBO4V8Erz31IfEU9y1HwqegN6n/dxYGgWXB/l+x6SoXYfS
         2gOw==
X-Forwarded-Encrypted: i=1; AJvYcCUMa71L9getiglNrw092EvGmRDqqCp2MROhbom1qM6ZlX4X8Dc8s2Xqkury+khcyG/pL4V71nzE8DpqX6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTT+QQkkisa/R6Ifu+aJBD+VdtzwKuDWHJ5QpdMn6JtUYYztJW
	hlPPNaNnnXXghTiGhmAI+x9ZnKwK63JKL3Jhf4Y6oXeWs7mujpJIOibBPm0s+A==
X-Gm-Gg: ASbGncsUnPVaqjiz46/VR6VPDpGn1PYzCV5mN5M8qumAFHzfWSJbYENPuGd0RPnVxh0
	ZT5tl3Mr5AWFhnj16XI804687feQJegMScnrCzewrmNlenLiD9hMkvWny7H+ikGlfxciAemwDUi
	xdgXD4kQ9ANHRyMNVt5GaB3dTc6iWvf7LhwDI4HzpAcvfd/DCbelfLzovfG09UJuYWQ2jCl1jyP
	GpfjuLkbrAO9l2r7S4QunbmMW3y0oxZGjqqepVjryEVEohUXtAmzRyBEVx4RkiDKQWbIh+HsVco
	5RZ06Nl2GY9JlO9zFtXZh5nxlEKsGKK3ydscdkFXpTC7tXliy6eDGzNY7fQou5I=
X-Google-Smtp-Source: AGHT+IFNIUsZcDhYzo+FEpcfUKxqYNEpDNPIX1vdPvcVrjcagigJHQZRRTL+no6Jwk5dPXnxZ94bpw==
X-Received: by 2002:a05:6214:1311:b0:6ed:1da2:afac with SMTP id 6a1803df08f44-6ed2390449emr59350216d6.32.1743085642387;
        Thu, 27 Mar 2025 07:27:22 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef31810sm80747166d6.64.2025.03.27.07.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:27:21 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:27:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: =?utf-8?B?55m954OB5YaJ?= <baishuoran@hrbeu.edu.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.edu.cn>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: WARNING in cm109_urb_irq_callback/usb_submit_urb
Message-ID: <13b35812-d0ee-45ff-898d-68b803fbc475@rowland.harvard.edu>
References: <559eddf1.5c68.195b1d950ef.Coremail.baishuoran@hrbeu.edu.cn>
 <62d91b68-2137-4a3a-a78a-c765402edd35@suse.com>
 <a3f66f2e-a99e-47f2-a3ef-742b6903cc5d@rowland.harvard.edu>
 <7be81186-2d18-4d0e-8a93-d2dda20b02b2@suse.com>
 <07f2ec1a-0363-4734-97ff-a129699b1907@rowland.harvard.edu>
 <04a011b5-a7fa-4270-a072-365b5abd2aec@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04a011b5-a7fa-4270-a072-365b5abd2aec@suse.com>

On Thu, Mar 27, 2025 at 12:42:41PM +0100, Oliver Neukum wrote:
> Hi,
> 
> On 20.03.25 18:25, Alan Stern wrote:
> 
> > > static void cm109_stop_traffic(struct cm109_dev *dev)
> > > {
> > >          dev->shutdown = 1;
> > >          /*
> > >           * Make sure other CPUs see this
> > >           */
> > >          smp_wmb();
> > >          usb_kill_urb(dev->urb_ctl);
> > >          usb_kill_urb(dev->urb_irq);
> > >          cm109_toggle_buzzer_sync(dev, 0);
> > >          dev->shutdown = 0;
> > >          smp_wmb();
> > 
> > I don't know anything about this driver, but the placement of the second
> > smp_wmb() looks odd.  Should it really come before the line that sets
> 
> Indeed. This driver is not written for comprehension. As far as I can tell
> it is not necessary at all. You need to set shutdown to zero before you
> resubmit the URBs. But I don't see how the barrier helps with that.
> 
> > dev->shutdown to 0?  In general, smp_wmb() is used to separate two sets
> > of stores; if it comes after all the relevant stores have been performed
> > then it won't accomplish anything.
> 
> Don't we guarantee an interaction between smp_wmb() and taking a spinlock?

There's no special interaction between them.  Just the usual ordering 
requirement between the smp_wmb() memory barrier and the write part of 
a spin_lock() or spin_unlock().

> > > }
> > > 
> > > This driver has a tough job as the two completion
> > > handlers submitted each other's as well as their own
> > > URBs based on the data they get.
> > > That scheme is rather complex, but as far as I can tell correct,
> > > but you need to test that flag everywhere.
> > 
> > However, it's quite noticeable that the code you want to change in
> > cm109_submit_buzz_toggle() doesn't have any memory barriers to pair with
> > the smb_wmb()'s above.  Shouldn't there at least be an smp_rmb() after
> > you read dev->shutdown?
> 
> I think this driver assumes that the ctl_submit_lock spinlock makes
> it safe.

I haven't looked at the code, but it sounds like a quick audit might be 
in order.

> > As long you're updating the synchronization, it might be a good idea to
> > also improve the comment describing the memory barriers.  "Make sure
> > other CPUs see this" doesn't mean anything -- of course all the other
> > CPUs will eventually see the changes made here.  The point is that they
> > should see the new value of dev->shutdown before seeing the final
> > completion of the two URBs.  Also, the comment should say which other
> > memory barriers pair with the ones here.
> 
> Before the completion? AFAICT they need to see it before they try
> to submit an URB.

My point was that the memory barrier doesn't "make sure other CPUs will 
see this", as the command says.  Rather, it provides ordering: It 
ensures that other CPUs will see the writes preceding the memory barrier 
before they see the writes following the memory barrier.

Hence the comment should be updated, so that it provides information 
that actually is important for someone reading the code to know.

Alan Stern
