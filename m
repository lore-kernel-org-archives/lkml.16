Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0204A212D9E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 22:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745880083; cv=none; b=R4mc5pCh6RqYvolI83Jd5VH1h8p1Q3WSW6vneJszTNK0+OSoVFLq416u1jf0wBvuIbLa2lw8Fyupkc4740w1ostEpJTRHeR74PeYVgUzoQ19/ZUPP2bPk9OTjqN7SIp3n5dSP49CcpKPym6NdopQ6VR9L4aysBYyWAw4eIUXbUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745880083; c=relaxed/simple;
	bh=AlvOVXFXCRCq8I8E0me/Q1kPoZ1O1bXqgITfhcvz9gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmEx+Wq/YH0rluFSuNudJ45SLvzzmbIOTQFkAgDnMJCm5xuXKjXANBZJDrtnrSBjWcQ2l5J2rDpVNGWjo2XhBVO00m3bEIZ3xMnuj7ycOAITB/a2PGboHSXP/D3CRTMkY6Q8lHGefAUaqCj/ctB80q5cD9a/zdReUqdSD3P/LZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=a2frI5ub; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="a2frI5ub"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-225df540edcso64328105ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745880080; x=1746484880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1zF7iiKiJhxVauo67vkFbkwxJz6M/6/Hp9e+j/XY2M=;
        b=a2frI5ubmyU9Fp1/j9NfmDmV+CfZ3cjU9Hh1jSHcBQSnZb8bjBahBQa4YH5iFO/XCh
         urS7Ug1dSL+wvCnhvHH0X+jx3W97JZG8Ce+lRj8Da27rVAby0w6WZ//xuFy0xpoDrsLe
         gdLM4fG+Ivdk28eH1siPa0DYHf54mwG75DdOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745880080; x=1746484880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1zF7iiKiJhxVauo67vkFbkwxJz6M/6/Hp9e+j/XY2M=;
        b=nW3atnJHW2qRitxtfED0DgVgctP7Ye5TFxoOGrH6aAjkb46THWKdm4LDKhOiBOogln
         l9vLuDm28S/DxzB1/lOHB8oN3Ubv8zFWQzIfBbYfoCHuYLRD0Fg9fd5sHzvQgyjsxTCv
         zOoyyA2WP2aiA3I1jeuEhQ5La6mXXgbz/7WXFKyB7pFsjDJ0tD8R/gSBd+IEQvG1R+/n
         wMeZ6a+arVfXMudIGUQ+vyva7BQXlJo1VkHNY2sQBVuINHVu84MwrF+wWLt9evGde/5v
         /q9eJzizX2ZN9noAhbOcFpZJEHsCpUBmWIjPlf4oC2NWZ3OwB8XrdEi19W/A2R6V+HGZ
         jB+w==
X-Forwarded-Encrypted: i=1; AJvYcCW1llFSXfcl3ypFFXpa1JvxQ6+bXXwd/CxUaRM/liK6hhDbVUgtWFgbgbo+ozUv1aqTP0lw8Priqox8wM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbucBiHQuxVwdS3+WlHjGqrKaMEwpb/d52hqbASIA/jkZpyGk1
	+veomcwd7UUbsUCYs6L7dR5r0WakPhh1AlQxhAMWx5WPdvqZGKSV+LdSSyGD6WY=
X-Gm-Gg: ASbGnctCA8NhMkshPUnf8Xdm1ZrDF4jcrMezX6LT7Qgc6OefPnvQtqQnMOTCDOYjYxW
	55Dogqfxi5LU5FUf9PY7QuXdp4muGf8ZItitizRqS+vrJg4yhJPIpUh+aXkc9GCx50Hmrs7apPO
	CdvipOTPswTAEPebYwfNjcfAyigZvMLIFsWP7Ris9VJiTVhROlXR8ai/3eeR8C4cGNGBOJtPm+1
	Nerq8RObvN8Gg4Wgt4Vi/sNV1FG1WKvqxwFRfQ/QlixH2TgimTbR7fYtgORsmQh6lwpor1YyL8+
	7B++be7fPsyJHnff5sK9Wg8TYmJNjhzvIsWntKCdfKGi3+3mN0YzAL4RXd3vXYTGlk7MDVQpO8/
	H3E13VvA=
X-Google-Smtp-Source: AGHT+IGs8v7qFjLt5uguqm0k7RJ6lOeFhXTFHUcr3VX560dCyFuGMIu3yj7cSKfJemZbK13XI+wmKA==
X-Received: by 2002:a17:902:f143:b0:223:607c:1d99 with SMTP id d9443c01a7336-22de6b650e2mr14854735ad.0.1745880080181;
        Mon, 28 Apr 2025 15:41:20 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4e0cb15sm89249515ad.106.2025.04.28.15.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:41:19 -0700 (PDT)
Date: Mon, 28 Apr 2025 15:41:17 -0700
From: Joe Damato <jdamato@fastly.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Jan Kara <jack@suse.cz>, Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Alexander Duyck <alexander.h.duyck@intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	William McVicker <willmcvicker@google.com>
Subject: Re: [PATCH vfs/vfs.fixes v2] eventpoll: Set epoll timeout if it's in
 the future
Message-ID: <aBAEDdvoazY6UGbS@LQ3V64L9R2>
References: <20250416185826.26375-1-jdamato@fastly.com>
 <20250426-haben-redeverbot-0b58878ac722@brauner>
 <ernjemvwu6ro2ca3xlra5t752opxif6pkxpjuegt24komexsr6@47sjqcygzako>
 <aA-xutxtw3jd00Bz@LQ3V64L9R2>
 <aBAB_4gQ6O_haAjp@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBAB_4gQ6O_haAjp@google.com>

On Mon, Apr 28, 2025 at 10:32:31PM +0000, Carlos Llamas wrote:
> On Mon, Apr 28, 2025 at 09:50:02AM -0700, Joe Damato wrote:
> > Thank you for spotting that and sorry for the trouble.
> 
> This was also flagged by our Android's epoll_pwait2 tests here:
> https://android.googlesource.com/platform/bionic/+/refs/heads/main/tests/sys_epoll_test.cpp
> They would all timeout, so the hang reported by Christian fits.
> 
> 
> > Christian / Jan what would be the correct way for me to deal with
> > this? Would it be to post a v3 (re-submitting the patch in its
> > entirety) or to post a new patch that fixes the original and lists
> > the commit sha from vfs.fixes with a Fixes tag ?
> 
> The original commit has landed in mainline already, so it needs to be
> new patch at this point. If if helps, here is the tag:
> Fixes: 0a65bc27bd64 ("eventpoll: Set epoll timeout if it's in the future")
> 
> > diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> > index 4bc264b854c4..1a5d1147f082 100644
> > --- a/fs/eventpoll.c
> > +++ b/fs/eventpoll.c
> > @@ -2111,7 +2111,9 @@ static int ep_poll(struct eventpoll *ep, struct epoll_event __user *events,
> > 
> >                 write_unlock_irq(&ep->lock);
> > 
> > -               if (!eavail && ep_schedule_timeout(to))
> > +               if (!ep_schedule_timeout(to))
> > +                       timed_out = 1;
> > +               else if (!eavail)
> >                         timed_out = !schedule_hrtimeout_range(to, slack,
> >                                                               HRTIMER_MODE_ABS);
> >                 __set_current_state(TASK_RUNNING);
> 
> I've ran your change through our internal CI and I confirm it fixes the
> hangs seen on our end. If you send the fix feel free to add:
> 
> Tested-by: Carlos Llamas <cmllamas@google.com>

Thanks, will do.

I was waiting to hear back from Christian / Jan if they are OK with
the proposed fix before submitting something, but glad to hear it
fixes the issue for you. Sorry for the trouble.
