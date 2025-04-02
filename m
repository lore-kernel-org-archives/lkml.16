Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A2C23645F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743603156; cv=none; b=JzgNtJu1FAIL79iImVAEOiw5wA/bHs3lidH4IfTSJYJXIIewjOFhC+FEOHO7ze/7U9/ZA19CCbc+b02b4Um7hPI8uzcGAf3YcVh+cb74P0Ou7otgAoAQvMTNNasKH6KOmOANVPZGhPGNQSKsPwNTtDSwIHnB6xzO2nBmAHOmURw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743603156; c=relaxed/simple;
	bh=b4Rcuad7D/AGbMj+ruyRQoNngBSyrQjGent+DGdk5fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbpClrl0YVDiSV+xIao7TjB8BDlF0CNiHj1u3d8IS6nWU4nqw+39evPfTeX9CJVSlV4hrpN5iYs2wTVOE6QFkNuj6zQUuyu7tM6Oe/qQZSyiQzUp53Jqbepu2nXkrDhKI2WExisKdmf64aS5kBzmVmLFLYvKf+/n+ETC7zVK90Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DC3F1007;
	Wed,  2 Apr 2025 07:12:36 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C61B23F63F;
	Wed,  2 Apr 2025 07:12:32 -0700 (PDT)
Date: Wed, 2 Apr 2025 15:12:28 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yabin Cui <yabinc@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] coresight: core: Disable helpers for devices that
 fail to enable
Message-ID: <20250402141228.GL115840@e132581.arm.com>
References: <20250402011832.2970072-1-yabinc@google.com>
 <20250402011832.2970072-4-yabinc@google.com>
 <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com>
 <20250402133232.GJ115840@e132581.arm.com>
 <CAJ9a7Vg4DGzPhnSBh2taTgUTORMY3GUPpJY2bHjkMdFB1=wP=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7Vg4DGzPhnSBh2taTgUTORMY3GUPpJY2bHjkMdFB1=wP=Q@mail.gmail.com>

On Wed, Apr 02, 2025 at 02:50:22PM +0100, Mike Leach wrote:

[...]

> > > > @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> > > >                 /* Enable all helpers adjacent to the path first */
> > > >                 ret = coresight_enable_helpers(csdev, mode, path);
> > > >                 if (ret)
> > > > -                       goto err;
> > > > +                       goto err_helper;
> > > >                 /*
> > > >                  * ETF devices are tricky... They can be a link or a sink,
> > > >                  * depending on how they are configured.  If an ETF has been
> > > > @@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> > > >                 switch (type) {
> > > >                 case CORESIGHT_DEV_TYPE_SINK:
> > > >                         ret = coresight_enable_sink(csdev, mode, sink_data);
> > > > -                       /*
> > > > -                        * Sink is the first component turned on. If we
> > > > -                        * failed to enable the sink, there are no components
> > > > -                        * that need disabling. Disabling the path here
> > > > -                        * would mean we could disrupt an existing session.
> > > > -                        */
> > > >                         if (ret)
> > > > -                               goto out;
> > > > +                               goto err;
> 
> Going to err here is wrong. The comment above specifically states that
> we do _not_ want to disable the path, yet the new code flow disables
> helpers.

Okay, now I understand here avoids to disable source and links for a
sink error.

> then falls through to coresight_disable_path_from() - which
> the original code avoided and which also disables helpers a second
> time.

Seems to me, the conclusion for "disables helpers a second time" is
incorrect.

I checked the coresight_disable_path_from() function, when the current
'nd' is passed to it, it will iterate from the _next_ node after 'nd'.

   /* Here 'nd' will be skipped and start from the next node */
   list_for_each_entry_continue(nd, &path->path_list, link) {
       ...

       coresight_disable_helpers(csdev, path);
   }

This means the _current_ coresight device (here is sink device) will
not disable its helpers.  Could you confirm for this?

Thanks,
Leo
