Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8164F239072
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600761; cv=none; b=o3HMIjq0AziatqODbRHNoMZ83LW5rCq+4qxx9R+fvE+UW2/sq+f3VLyL4EK6LTo9dVbCGG28NhSm2PrdcudSDWORnJDvW7rS35OinSTFw0B0kaa1uvKtcVmCgRekjarN+L94lyE/+CglnOOhBBg/jLO29gNhH0IfqEEqGiMLhcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600761; c=relaxed/simple;
	bh=I00T0/KbIZKPGjlnQ3QJGfVq0Z38QuHZCGLyRNOXdxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0G83lgfmRvxMf/jxY2avQWwud0U1A7Lws4tLROqVF98W5k2oiswZ3Qpj5BtpCGr7nByTFtbIM4bZETz7ZhCf0SxpgptU4gspcydmZ/su6iEpzsK84l6LE4sbNgitgpzV1SGVPv24rOzULr6ahfl3ljNhScYOiurAab3tv6dTA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A05DFEC;
	Wed,  2 Apr 2025 06:32:40 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B9793F694;
	Wed,  2 Apr 2025 06:32:37 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:32:32 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] coresight: core: Disable helpers for devices that
 fail to enable
Message-ID: <20250402133232.GJ115840@e132581.arm.com>
References: <20250402011832.2970072-1-yabinc@google.com>
 <20250402011832.2970072-4-yabinc@google.com>
 <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com>

On Tue, Apr 01, 2025 at 06:22:46PM -0700, Yabin Cui wrote:
> On Tue, Apr 1, 2025 at 6:19 PM Yabin Cui <yabinc@google.com> wrote:
> >
> > When enabling a SINK or LINK type coresight device fails, the
> > associated helpers should be disabled.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-core.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> > index fb43ef6a3b1f..e3270d9b46c9 100644
> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> >                 /* Enable all helpers adjacent to the path first */
> >                 ret = coresight_enable_helpers(csdev, mode, path);
> >                 if (ret)
> > -                       goto err;
> > +                       goto err_helper;
> >                 /*
> >                  * ETF devices are tricky... They can be a link or a sink,
> >                  * depending on how they are configured.  If an ETF has been
> > @@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> >                 switch (type) {
> >                 case CORESIGHT_DEV_TYPE_SINK:
> >                         ret = coresight_enable_sink(csdev, mode, sink_data);
> > -                       /*
> > -                        * Sink is the first component turned on. If we
> > -                        * failed to enable the sink, there are no components
> > -                        * that need disabling. Disabling the path here
> > -                        * would mean we could disrupt an existing session.
> > -                        */
> >                         if (ret)
> > -                               goto out;
> > +                               goto err;
> >                         break;
> >                 case CORESIGHT_DEV_TYPE_SOURCE:
> >                         /* sources are enabled from either sysFS or Perf */
> > @@ -507,6 +501,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> >  out:
> >         return ret;
> >  err:
> > +       coresight_disable_helpers(csdev);

Given it is unconditionally to enable helpers, I would suggest we
disable helper unconditionally.  Thus, we don't need to add a new
'err_helper' tag, simply reuse the 'err' tag would be fine.

I would like to know if mainatiners have different opinions.

Thanks,
Leo

> > +err_helper:
> >         coresight_disable_path_from(path, nd);
> >         goto out;
> >  }
> > --
> > 2.49.0.472.ge94155a9ec-goog
> >
