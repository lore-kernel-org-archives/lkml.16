Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D771624DD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809514; cv=none; b=tsMCuw2xVIVKfMGC+WQeVJXDcvMaNQ35zsbYky7q35UQhRHU4bmB81bgcNU/X3Zo7Ylq6VmpjyYG/j3NO2VBR6blq3PEDQhLb1djOkE6owqU86UqdwcqBW+1rx519rE75ljnH8oT6H2/H1R1ieAdgQtrbQdUSg6qzqX2ci748ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809514; c=relaxed/simple;
	bh=Q4ttbuBffcmq3g31sJMsiGeIZiBuPdY4oesqsmvYtFY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPC5Kl7yMdkMaJjkxrEtoTqDfCX5Iq/Ya5qWnIRfcq3beaVIndN7RVaJjv1Yy5smBY+C6GE4SiMZFdEGWjuJkfW0tLDRpdX04h3dgwWP7xYBMrQTQXWucvOP/ltjk+LFeZR75NF7QKfw6jX+UIh5M5fSMLYsqXzSzXtsKawqiuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=S4ro5uwy; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="S4ro5uwy"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3feb3f54339so5299677b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1744809511; x=1745414311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wa6MsH58z3XLwdZ2LbORmPsv7fxdG2RZCdMCz/p7LwA=;
        b=S4ro5uwyuyOr0rPuqCvmZptaKVJg4/gLs604tO1dpwTx/kGxtQyiMzIxIPHCQTVX85
         K4kKPKxKpCZ41eimTA8AE22+Kv1ukqu0fgWHY46w0ertDMw6wr8VdaPlF4KUaOmB/4Kk
         xHMVJXtARGdHpIegJCWqPFSqAb4RMb2EYve9RinJnJNE+nih0lGVliUIe+DIIbKAyAfK
         qXUofxvXqxTL9AgnrUkAlmOQBvM9IHDXfnlNH1BHIjhvXEmDjOssvjdeLxN1vcOCJ//O
         wYDrQKhR6N2Fx4VWV8tRbXRp4x6p7qae8xI2GpgoGRS4LkD+Nhhru4wFJAIGdwj2ubFQ
         nGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744809511; x=1745414311;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wa6MsH58z3XLwdZ2LbORmPsv7fxdG2RZCdMCz/p7LwA=;
        b=jLBiSFBZtdJrrObvC2LmEqOL3KTTAhidXjP12re3JPrKxY+iB4bRUOBjCbwhHtqvBo
         5yPTShhCEsVEnP+ot2Ba6BgkMT01mbEF7nC0rwls2oQ8u86i6P1wyfh1lterdD9DSza1
         xRivL/qrYNJUltEzy/mNN5KFawT3mn+84V9TMtRtwN6K9d/33ozMr4hgIUjE7tmBBdKH
         pY7pZx34QPNoBo0iDMbcRnmK1tonN1mtFHT8bEooaiRbWB/2vWWYcJ6HHs5JJDwAKHWk
         jxStr0KDxJCsSem2MKT0ex2qK9bC+3Be4G2XR0puQrIWGe3FFi37VUQ8101YWEzq4j5B
         rYXA==
X-Forwarded-Encrypted: i=1; AJvYcCU+I03HSWg9NSBWlsqWbbgpJb8Zw/n+GH8kC7AU27iD9y16xZLlXez1g94UzSX6ElLYGr8Tke/67sFJxXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw4fTa5dT3zilgqLGsMhRQ9p2+PFJBFedfwwHyKYv6a82FsMmT
	DYxh3Ocf7U6QhS+K7ppVM6HpT//ZbazTBS0ni4chdnst/is9TXD+tS8Kb7V/4hI=
X-Gm-Gg: ASbGnctJVlPtq48GZJThF8tgUKyK+MvpdJ40f8r+X59MD6+O3SgWMsVMTm9lzzbDVTm
	4sgXqFvwfZy5oyRldN4d/n0fHVLC/yLPiUdVf1St39eFUBtPAH6xmDuuX2ETtg3tCaDgPiDPxIx
	PAuJYIHldnDTleRQgtZwgYK6jIEh6+Do1lO9ExH/rv3s7+SlDyN4RyZV1u2p9X0Avfa5kaCT7cA
	8XXBvst69/Hl16N/VH2o6b+lHwT9fA2doy7/4vzQ5ao/T3z4YUQK3v1dsuMKeIhZRrhRa18VnDl
	N3lmf+b+o05nm0jsk54qUWfAOMPkzP4l5CLZdBEQFcg=
X-Google-Smtp-Source: AGHT+IEXdh9viCyTYOko4w3G6Y1ne2GquJIMBJqCkTdtsxhHOobGstbQxj5tY4onr49Ez0e5MxXfkg==
X-Received: by 2002:a05:6808:3507:b0:3f6:a7c7:90a5 with SMTP id 5614622812f47-400b01cfd6dmr951383b6e.16.1744809510906;
        Wed, 16 Apr 2025 06:18:30 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:1e17:765:833b:6e44])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-400763b6c95sm2806002b6e.48.2025.04.16.06.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:18:29 -0700 (PDT)
Date: Wed, 16 Apr 2025 08:18:23 -0500
From: Corey Minyard <corey@minyard.net>
To: Breno Leitao <leitao@debian.org>, Rik van Riel <riel@surriel.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] ipmi: fix suspicious RCU usage warning
Message-ID: <Z_-uH_aBVqLSkC2u@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20250312131932.44d901f7@fangorn>
 <20250317-horned-nano-degu-a6e5bc@leitao>
 <Z9gVMuEMk9yNNL89@mail.minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9gVMuEMk9yNNL89@mail.minyard.net>

On Mon, Mar 17, 2025 at 07:27:30AM -0500, Corey Minyard wrote:
> On Mon, Mar 17, 2025 at 02:33:31AM -0700, Breno Leitao wrote:
> > On Wed, Mar 12, 2025 at 01:19:32PM -0400, Rik van Riel wrote:
> > > On recent kernels this warning fires:
> > > 
> > > drivers/char/ipmi/ipmi_msghandler.c:1238 RCU-list traversed in non-reader section!!
> > > 
> > > This looks like a fairly simple lockdep trigger, where
> > > list_for_each_entry_rcu and list_for_each_entry_srcu are
> > > functionally identical, but the lockdep annotation in
> > > the former has an extra check.
> > > 
> > > That extra check is whether the RCU read lock is held,
> > > which is not true when the code uses srcu_read_lock.
> > > 
> > > Get rid of the warning by using the properly annotated
> > > list traversal macro.
> > 
> > Thanks for looking at this one.
> > 
> > There was a discussion about this issue a few years ago, with
> > a different approach that never landed upstream.
> > 
> > 	https://lore.kernel.org/all/20201119123831.GH3710@minyard.net/#r
> 
> I thought this looked familiar.
> 
> Breno, I believe you suggested a change to the patch that sounded
> reasonable, so I removed the patch, and then nothing happened and I
> didn't follow up.
> 
> This is kind of a mess :-(.  Let me look at it.

I've been working on this, so it's not forgotten.  Actually, I've mostly
been working on a test framework for the IPMI driver, which has been a
fairly big job.

The modification was fairly easy.  I decided to just pull srcu out of
this and use a different method.  And I'm not going to do that without
some serious testing, thus the delay.

Reviewing the code has shown me that the IPMI driver needs some TLC in
some places.

Anyway, expect some changes in the next few days.

-corey
