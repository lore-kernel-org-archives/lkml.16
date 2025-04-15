Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D060828A1DE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713714; cv=none; b=eIzB6T2YdRWt/VdZO8S14DRp4Vt+jxoqMNuWNInztwU/34P+cWXEDeds39CJgDoIJTYpLr7Lo4nrs3qzkH49ejNQiO3Xa4bHaKloIt+B1HJdupp/sBtNES/VOONKRpmBRFnRDt7g02GCFzLQRLkEzBBQwWrxxjzMDkxho8KjIFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713714; c=relaxed/simple;
	bh=slg7c+OwYEPiVTqYZh9JE5dbAOFa3MV3zpSJsTIDzhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sxfFGdtccLB2BHxjUAFuCQhMDjq4yb2/nAhYSFt4cviyqIUqH+q03p68ZUkJvTM0/8/hTpvEkEZ7MkdxI5VPLXpHnBAjmn+uHlBeWUtnGBslM2UD+1E5ZKfqMt056i20A5ujXrgxHMqJgTW1LykPa7iZoK6MmBtuwIh9KsMYb28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=MP26a7eG; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="MP26a7eG"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476b4c9faa2so67204991cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1744713712; x=1745318512; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tlNdaGqrZvHHyFNoPaHaidkue74jgXWiZBGhEUlePLE=;
        b=MP26a7eGMXMOb4MDGv0CYO/RXHbilIsiJbuPwxuFkzHA8dinGOwa2emkUbYEk4pXyF
         8X/99zaq/1/zzsc9201rrGpLmfJWuAXqwsHUJ8cWPEuZoChnW5GQz99PjEl+gV/b3nZK
         8a2Kh96j8Y8KX1Bs1TVAn6El80sy1CCM70FEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713712; x=1745318512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlNdaGqrZvHHyFNoPaHaidkue74jgXWiZBGhEUlePLE=;
        b=sQJJRkw6PNIJy8mBc4mqQnqTujOwKZteW0DnmEhh4ltefqVkasaku9LIvL67aYAaNK
         a7NhCrgSPodSkoj/ea+JLSPh7bWMf1kEiFhnKfUjSPbRumQi2B5/xlzr8GtHasIAEyFO
         NT2AqiIKQtMzneprnqFtE0dP8hk53ivyAYB/RCKvA+Swr3No16KscT/0tFpn6MTrv1LM
         B4qE4TL0SiIgQY1fTOgGI86LvI/yRZV6KqR18Yzvvq1Fpl/YrZeui789N/nSuxPmBKYh
         68FBL3tAIkhhldz6uRj3gnavhTOd01Xp5lHNEWXMqmPhO1e6oqv/bllWD8IXFSx1OvLx
         8ohA==
X-Forwarded-Encrypted: i=1; AJvYcCUTixYpJehTEH+7x58bfqDe5ie3wifl2DxyIW+Cogfg9mZ5vecKFt2KXxPPIt/7x/AMI0yeMAkmvXUA65w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS7ti6UqCRIVPDbuuFXYeun0Cx5PbnTwu0dqMaR4HajYacVmnB
	wfunvAH00O7Gt+InvoD8HdDiQOF5VTqSFy1yMYAE5WKoKf0qzvd6MuwcYwoU6ZsHM5BBEGLJorh
	oai5OKXPKJVeik3jZf28iTpWgurkn4ZxTlPQA5g==
X-Gm-Gg: ASbGncu8I1yJJIE8vEB9jId+MVcK6Yt8HBnmpCKmHIt6Ewrxswzj8owcw0Sw5yN+dH3
	nP9ezdZ2PYMnQ/pM+e7W82FrcPY6NYSoQ+W4n5lXrbM5U3bfG3WTsavGUc19H6YL0pJQ5GozaNT
	ZvkafKwZlbL+aU3f8mkAkc
X-Google-Smtp-Source: AGHT+IH9UI/UhPy54GeNvnTe9atyu1HNtj14wjE2Bm1Mwbi9lUJkD7h9pfk/VJxl/1e3iysNlBwz8zoXaiI3WOGJy38=
X-Received: by 2002:ac8:5815:0:b0:476:8412:9275 with SMTP id
 d75a77b69052e-479775cccb9mr237595451cf.35.1744713711656; Tue, 15 Apr 2025
 03:41:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226091451.11899-1-luis@igalia.com> <87msdwrh72.fsf@igalia.com>
 <CAJfpegvcEgJtmRkvHm+WuPQgdyeCQZggyExayc5J9bdxWwOm4w@mail.gmail.com>
 <875xk7zyjm.fsf@igalia.com> <GV0P278MB07182F4A1BDFD2506E2F58AC85B62@GV0P278MB0718.CHEP278.PROD.OUTLOOK.COM>
 <87r01tn269.fsf@igalia.com>
In-Reply-To: <87r01tn269.fsf@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 15 Apr 2025 12:41:40 +0200
X-Gm-Features: ATxdqUEFTLBmokoYvwc9c4wLOoyP5IyQ5tosHezckOvV3BMgdRkVR_C0mYzgXVA
Message-ID: <CAJfpegu-x88d+DGa=x_EfvWWCjnkZYjO8MwjAc4bGQky8kBi3g@mail.gmail.com>
Subject: Re: [PATCH v8] fuse: add more control over cache invalidation behaviour
To: Luis Henriques <luis@igalia.com>
Cc: Laura Promberger <laura.promberger@cern.ch>, Bernd Schubert <bschubert@ddn.com>, 
	Dave Chinner <david@fromorbit.com>, Matt Harvey <mharvey@jumptrading.com>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Apr 2025 at 12:34, Luis Henriques <luis@igalia.com> wrote:
>
> Hi Laura,
>
> On Fri, Apr 11 2025, Laura Promberger wrote:
>
> > Hello Miklos, Luis,
> >
> > I tested Luis NOTIFY_INC_EPOCH patch (kernel, libfuse, cvmfs) on RHEL9 and can
> > confirm that in combination with your fix to the symlink truncate it solves all
> > the problem we had with cvmfs when applying a new revision and at the same time
> > hammering a symlink with readlink() that would change its target. (
> > https://github.com/cvmfs/cvmfs/issues/3626 )
> >
> > With those two patches we no longer end up with corrupted symlinks or get stuck on an old revision.
> > (old revision was possible because the kernel started caching the old one again during the update due to the high access rate and the asynchronous evict of inodes)
> >
> > As such we would be very happy if this patch could be accepted.
>
> Even though this patch and the one that fixed the symlinks corruption [1]
> aren't really related, it's always good to have extra testing.  Thanks a
> lot for your help, Laura.
>
> In the meantime, I hope to send a refreshed v9 of this patch soon (maybe
> today) as it doesn't apply cleanly to current master anymore.  And I also
> plan to send v2 of the (RFC) patch that adds the workqueue to clean-up
> expired cache entries.

Don't bother, I just applied the patch with the conflicts fixed up.

Thanks,
Miklois
