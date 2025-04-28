Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E1278F40
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745849848; cv=none; b=FcEvwp9uNM/xBYs2/MNG0dYSqWcUz6Ez5aU+cWAyovh1bCwbiYihEBndg0LpZEPHlL/UMe6pb38wxyBTmRBcyUPZyVJ5S6/bNdGcXaaG7LclVZ8A4aZ4Zu0xG2MXDPAwSnIw9/ORMjK5Kg1I+bfEFQfPM3MeLwrOSMwLGG3Jmek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745849848; c=relaxed/simple;
	bh=Cnaqf+aLwRCsNAqs8H+j8EywFGHaoEEjeKpXji6rGX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ad4JI0/LMVxbXgIDNc+vPrAuOSyv4stKmygX9IUSofkPZDNJ7f4+chHi98KN/nbus9+hEfdO02vp2g9BOQC3kccfvnaAwcuxYcjrXoQcHZNpGdSnhsasp9QwafxGsmXg8F5nhNi4OnLnMycgfN3S2P/V3h3KMpBE5kke20Zy8Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tS1dyl9F; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tS1dyl9F"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso9271275a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745849844; x=1746454644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MAB7MM/5KcPgVIvsQ7jcOLB1Q0JL1wGvVRTO+fCZY6E=;
        b=tS1dyl9FxFzTz3Iias3PSjg3wxZikUu2+xg0M6soJI39qlnbS74w+RdqcpnEQTgfOL
         y/jWvGtzkv8Ex8kSlY8lZUZki0FOSUKvHxgC8pVW+M571HwabRCWsmB+IRD/dceB182x
         y2T0BKEMoDqcV+tSZlxyHfr9ehLp5EldqHasycHmOuoPv/vdOPn+7IyCBtMoQhYFaW1s
         FvUh5yYv6lQwxsvp4D3AWsP6kZJUj3A5tb1Lo0Vj4Vrit4fQBwRT0SsDYT1g0pwso/WZ
         gjcPYRmlL/G/Ixb/qyHwb9TDt3NVVDf0aMd3iyafF45+bwsQ7vRW3sceMK7COBDqL9aC
         tg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849844; x=1746454644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAB7MM/5KcPgVIvsQ7jcOLB1Q0JL1wGvVRTO+fCZY6E=;
        b=e2ccHdH1YMPC9HDDCyPeDXLJQ/royUexWJbxsliKtOrCUlJa6v7/TPaQUivMY5yuc/
         wIWuaOfg0nKcMmWjs3cDQs3M2bBFoNH+GLR6z2WDpGcNMrUgPUX/7yl0gEUttDqXE8H+
         TS+mYstasRKL1XgLX4pNKdfevwJ1SEpPEy47qfd14BsqZQS8a1V7Fb6mBb8hx0FZCUpD
         7B5OhGMDT7MPyzsCHM68exiEzn5OFO5RZf+KnjqpBFj0Q4PNfXJN+LQOHhOZLF2LBvSN
         87FWqhHuhbCLY6DiBj8UZs42mHj5Rs9Rc+aHUCCNh21u7pPFzsnWfCmfXeViNEGFte/v
         vq1g==
X-Forwarded-Encrypted: i=1; AJvYcCUmHkHEXSBeUyAe4ij2wyYWEo1ldcg4xtBGm7FeXLXv4DF6YobaGo3n29SKwANhX44fIzwxWr3kKhmth5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyObnjTo0CD2OoxLuBPh8gp2acaukv8nlWdvtjnT+HRqsJD85Ov
	+Bn3Bg7AScV6WhZoCer7RQdW6Kx7Yjz1C8RTcdsSVleTAAT14hfZigwjheEXhDM=
X-Gm-Gg: ASbGncuL4CzvVIyQsC/bjMPKY7+5CDvwrJND6OUnhG8iIHoLV0N8FsJGc94OqWOUVIn
	dlz4/4lz/8flollBYOCPPRZ4oyFoqxrGfQgKDMn//DviEmireEUJdEL72VJB8iQrvwgc6cp4Kxj
	E9rCQDdflRXIzgcQa3Adm+jDZJddGZOjpfL6GsGRsyVYLBzpYpDLSGh37tl3ut673JNtj20jwRJ
	C/hC/ResHsq0ye1NXF5S1Vk5iKRFCDDPRQEevsVkCcnC/kJg1pzaoocbpG5tqtDimas8ATYjTO3
	aAVaDVkdrJwj/ybO4iBfd12TuliS02hLnX2rig==
X-Google-Smtp-Source: AGHT+IEbdwFeeDsBIl2er2pHFgP5t9WIvItB5t8KO8vYPa4TRLVU01MHNtVHzK/JvZ2FwrGG5uN74g==
X-Received: by 2002:a17:907:9816:b0:aca:cac6:3ca9 with SMTP id a640c23a62f3a-ace71107381mr1124921366b.27.1745849844383;
        Mon, 28 Apr 2025 07:17:24 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e69d9sm642199166b.50.2025.04.28.07.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:17:23 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:17:21 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aA+N8YHX0DZ6h9Uj@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA94yOjsayZHNDpx@hovoldconsulting.com>

On 25-04-28 14:47:04, Johan Hovold wrote:
> On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > > to non-transparent mode to enable video output on X1E-based devices
> > > > that come with LTTPR on the motherboards. However, video would not work
> > > > if additional LTTPR(s) are present between sink and source, which is
> > > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> > >
> > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > adapters or docks with retimers in transparent mode?
> > 
> > I am actually not 100% sure.
> > - If without LTTPR initialization, they default to transparent mode,
> > then yes, incomplete LTTPR support sets them to non-transparent
> > without per-segment training and breaks docks with retimers, while it
> > would've worked if LTTPR(s) would've been left in default transparent
> > mode. Note that in this case, X1E devices with ps883x are somehow an
> > exception, because without LTTPR initialization at all the training
> > always fails.
> 
> Right, I'm concerned about breaking working setups for users of machines
> like the X13s.
> 
> > - If LTTPR has to be initialized either way, and explicitly set to
> > transparent mode if we do not want non-transparent, then no,
> > incomplete LTTPR support in 6.15-rcX did not explicitly break docks
> > with retimers, as those never worked in the first place. As per my
> > understanding, this is the case, unless something (firmware?) has
> > already placed LTTPR to transparent mode before the driver takes over
> > - then 1st case would be applicable.
> > 
> > Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> > if it did work before, as I do not have a Qualcomm based device
> > without LTTPR on the baseboard.
> 
> Abel (or anyone else), do you have one of these docks that you could
> test with the X13s to confirm whether this series fixes a regression or
> not?

Before the support for LTTPRs has been merged, if you would have one of
those docks (I do not own one) with LTTPRs, link training would've just
failed if the LTTPRs were not by default in transparent mode, which IIRC
is what the standard dictates.

X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
would return 0 and none of the of the transparent/non-transparent setup
would happen. Now, as already mentioned, DP would be considered already
broken (or rather not supported) if you would connect a dock with LTTPRs in it.

With the support in, if one such dock is used, the training should be
successful as all LTTPRs are set in transparent mode. This I was not
able to test myself as I do not own such a dock.

> 
> > > You describe at least one of this patches as a fix but I'm not seeing
> > > any Fixes tags or indication that these need to go into 6.15-rc to fix
> > > a regression.
> > 
> > You are right, I will add Fixes tag to the 1st patch to make it clear:
> > Fixes 72d0af4accd (drm/msm/dp: Add support for LTTPR handling)
> > 
> > Or should I mark the entire series with Fixes, so that the docking
> > stations with retimers can be fixed in 6.15 already? Landing only the
> > 1st patch will fix inconsistency with DP spec, but will not fix
> > docking stations with retimers. I guess this comes down to whether
> > existing LTTPR (but not multiple LTTPRs) support is considered a bug
> > (and patches 2,3,4 are a fix) or lack of functionality (and patches
> > 2,3,4 are a new feature).
> 
> Indeed. If LTTPR support broke existing setups, then I think all should
> be marked with a Fixes tag and merged for 6.15. If we can't get it into
> 6.15 we may consider just disabling LTTPR support in 6.15 to address the
> regression and then enable it again once fixed in 6.16.

The LTTPR support did not break existing (working) setups because on these
setups, LTTPR count would read 0 and would be basically a no-op.

> 
> But if this series is just enabling support for docks (and USB-C ports)
> that did not used to work, then I guess this can all wait for 6.16.

I'm not sure about what this actually fixes. It might be that is
specific to a dock or something. But as far as X Elite boards go, even
without this "fix" display has been working fine.

The change itself makes sense though and I think makes sense to be marked as a fix.

> 
> Johan

Abel
