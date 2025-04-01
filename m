Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B53B1FAC33
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507366; cv=none; b=ElKZS4TKkfjJex4nKDfDg72dRbDBHFWpGgUUwEygew74VyBBMKcKvNmMnl+6NodNduw4BzmBY2BLXjku7f4Lqyz/4NydXEGoMhceLXVWFMIyBfbMyHBZSoUVX3e1fifvL9lmbzNJ4+rWs0MEp9qGz9qtUMjLOHLUnuXlwpAYz5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507366; c=relaxed/simple;
	bh=R7SoiPCBNIDNzLkKbNN/bk7U6Bot5GWsF1bFWcdnudY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbRhjDJPzfcrbl8goy0QuCn0y4yRJhpy2WjuW0cafzK1QNKoWo97Za/ApL9XqawyftC6AgbR9OhAUdeC/3jnRoV1bWLZ8SrdDWMUBBbozfmC861Y/oCjFihPflrzwzx6ofJhWWvH3Y+UDcfbMFwkR9o/gLCNHeYpWodS61ZR4m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=DB+RAUeq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="DB+RAUeq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22438c356c8so105406145ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 04:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1743507363; x=1744112163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2+c00bn9QMrYYncqUoX4E1bu9uetuu45V5+u5h/AVY=;
        b=DB+RAUeql1+nxpXAllys+DY0MWr8w5xmkNVokRa+THxevO3nJW98NCMMu9rLD+NfJf
         x6Q+EWEP8Xhy79EyhyCbczCvb0zc/d9Y4S2+JNzogcfHDbSrjhhzjyHJkSIWplBAK7LS
         hPhKwBZRNeMOofAfSXT6NtNKeGESU17JT7+/w+Iuir8ryjphV/WXfR/NnSJ6X5VPGd1j
         eykZlspMb67ul8+M0gsCZ1cM21hOyAUXxnKy6EI/canQf7/0G4diLLqAoPDad07lrlUw
         IdJS9Vyqq9/5YoQWDrLeDBzfHu7E47pMTHs+2+X3LT2l96UUysq0sw9Cs0en9Qyhglou
         mkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743507363; x=1744112163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2+c00bn9QMrYYncqUoX4E1bu9uetuu45V5+u5h/AVY=;
        b=oe2J5LhaJIMwpbqL/OhmRR3OKbb1DPy/EwtxnLC/FIzAJGcaO8LxWX8CPP6lwDUg3k
         mvugnElVis8FFSstWcBXgqSuZprvKsSKzTz78gzR1WXC4RPzn4J/M1LNiKTjvfwj8E6L
         EEEP2ZIDSeaAcXpmCe7M0QrP1remOoKM+ax3sXEhexOzNOsN5145c9u8xTqm1GrnvIQ/
         UMMhBYK/yxNtpe3AbB9k5t4xgQtWpP4PwlRhY6TK8K41tvDGbUIPELmSLZUwXY1mRjqk
         3Wp5dQd+QQjEDS0NsBn+jJYobgUBCUO10Vkg3rO/ja5aKM6o41sT6TXUmvBfZhMCeyZZ
         zwEw==
X-Forwarded-Encrypted: i=1; AJvYcCXL2tVNKZj6gJ/WI/Co4dqkWmIe1DwckfDWOkO9aQOlVxCrODxYDT+sIKAbz6HCDJZVBcgHWH8LXcBxPdk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzz04JlRA+E62VFbwAMbBe+2E6XBxJbNyo+he0g8LIx4K6OOQ7
	2sOFPVnSLYtAxLBK5vOJV+TVNX5wlVIPUzNMvNTs+cVXxTgz/m53b6+yHNyDi0U=
X-Gm-Gg: ASbGnctpBVoJ5tuvpL/G9GMEkB1bOA3H+V15pRuGff28TC4uItOHSXrgj94vDS6xRzi
	16vFK8l5vXRaHu1mgdT1bd2VkQjUSDjft0TNI45/Tzuqz/1wG2LNdn/MMJ7EYrYYnypKu+ycbHm
	nE21oCsn+a8GtMhKa6emCxPWHGKZmYSreDGaMtmh37Q83FGYM80qkVEla1H/ZdsiuJkjPMOrVc9
	NUmDy032/NFRPveILxozP268IUWkXcwJA10KqUIj9I5yobCW7pKBVOxVM4r9WkRRtSZxhOPe1sg
	P7rfJpw0Zh1bfdkKUhs0c7A9vIvVMTRA845twtY/JtGfLySxgmrG9wk+zHVrjMbB7+rlEXpbMKg
	1oB+3jEOP2j/JuTbYMA==
X-Google-Smtp-Source: AGHT+IGBEYa638WvHr8VMrPemZg8f/SzTMUOvkeQN2v3HXx0k+tLbTzE07k8CRKzbkFjDvvHpsuneg==
X-Received: by 2002:a05:6a00:3a23:b0:736:3979:369e with SMTP id d2e1a72fcca58-73980387a87mr16755789b3a.9.1743507362409;
        Tue, 01 Apr 2025 04:36:02 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-60-96.pa.nsw.optusnet.com.au. [49.181.60.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e22449sm8647733b3a.49.2025.04.01.04.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 04:36:01 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98)
	(envelope-from <david@fromorbit.com>)
	id 1tzZuQ-000000035eq-3DKl;
	Tue, 01 Apr 2025 22:35:58 +1100
Date: Tue, 1 Apr 2025 22:35:58 +1100
From: Dave Chinner <david@fromorbit.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, jack@suse.cz,
	Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	mcgrof@kernel.org, hch@infradead.org, rafael@kernel.org,
	djwong@kernel.org, pavel@kernel.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com
Subject: Re: [PATCH 3/6] xfs: replace kthread freezing with auto fs freezing
Message-ID: <Z-vPnmL7wn_8cFim@dread.disaster.area>
References: <20250401-work-freeze-v1-0-d000611d4ab0@kernel.org>
 <20250401-work-freeze-v1-3-d000611d4ab0@kernel.org>
 <Z-s9KG-URzB9DwUb@dread.disaster.area>
 <20250401-baubeginn-ausdehnen-3a7387b756aa@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401-baubeginn-ausdehnen-3a7387b756aa@brauner>

On Tue, Apr 01, 2025 at 09:17:12AM +0200, Christian Brauner wrote:
> On Tue, Apr 01, 2025 at 12:11:04PM +1100, Dave Chinner wrote:
> > On Tue, Apr 01, 2025 at 02:32:48AM +0200, Christian Brauner wrote:
> > > diff --git a/fs/xfs/xfs_zone_gc.c b/fs/xfs/xfs_zone_gc.c
> > > index c5136ea9bb1d..1875b6551ab0 100644
> > > --- a/fs/xfs/xfs_zone_gc.c
> > > +++ b/fs/xfs/xfs_zone_gc.c
> > > @@ -993,7 +993,6 @@ xfs_zone_gc_handle_work(
> > >  	}
> > >  
> > >  	__set_current_state(TASK_RUNNING);
> > > -	try_to_freeze();
> > >  
> > >  	if (reset_list)
> > >  		xfs_zone_gc_reset_zones(data, reset_list);
> > > @@ -1041,7 +1040,6 @@ xfs_zoned_gcd(
> > >  	unsigned int		nofs_flag;
> > >  
> > >  	nofs_flag = memalloc_nofs_save();
> > > -	set_freezable();
> > >  
> > >  	for (;;) {
> > >  		set_current_state(TASK_INTERRUPTIBLE | TASK_FREEZABLE);
> > 
> > Same question here for this newly merged code, too...
>
> I'm not sure if this is supposed to be a snipe or not but just in case
> this is a hidden question:

No, I meant that this is changing shiny new just-merged XFS code
(part of zone device support). It only just arrived this merge
window and is largely just doing the same thing as the older aild
code. It is probably safe to assume that this new code has never
been tested against hibernate...

-Dave.
-- 
Dave Chinner
david@fromorbit.com
