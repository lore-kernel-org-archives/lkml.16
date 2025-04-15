Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0E52DFA29
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731857; cv=none; b=L1IZgMSXdnxDvqJ1Xd0lw0IHVSpdSQWFIUCSHqJ/pUOZCGlL8bGVaWiWhf9O4r67HoDGVvrjzs7k2G3KHCcEfoMyeWG06MWJSNyp5l1AlioRh5+bdclAHZuctCcjA5W6pS0GgUEtSB0N+4l9Wzizr1Jq0n88F6CkU+UfR5qw+AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731857; c=relaxed/simple;
	bh=uRZz3t8xz7dqJZP5jJbepMwR8oVR0dQzdDZJ94szs9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9ASocKp8auONE0ukkTOPXaFI0wSTawIvepLDusk+/2WqruEeAzq9h+vkCH+dYMcqqkHKRAR5arwM6codo0Nf7UeMwztmgIl1P0/HOEb06GEAdQm63sUiav488bouEGt6dQGdtE0+R/8sZSZ6QiW/exZ7Y7OkkHTFWC4i7o6MnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dp8U1Whj; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dp8U1Whj"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223fd89d036so70104815ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744731855; x=1745336655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ivqkzk6WJLWaCMPOg/I5rcsl87W3433yQp2YMytuMo=;
        b=Dp8U1Whj2kDOcABf1PfG8D0bkZKzl2dE8h//COgf7RQF9iurGEp/U5x35agLDNDuUN
         ELHDunjJtegFdOYcSlEIeCvtOHpOK0/CyGA8Z6EDQRrcgpu81hbADbI1ht+1H97BJEf3
         kXYWShK6sPhWA/SqhMZhUiDSEEQlCQOPXEszenkNpZiU9aakNNejNN/OiNwYoKK2/GIR
         YhvDSoLvvVTYiPmfAviDHkeKaobwtMUjqlpEPI3OnNyWWhphe0gqYeysawaH31V/K5IM
         sUce4CpbKs05ay0VE1Kdr7u6RC6h0hqnzwIIkA6Zo0ADsRRt94l99EgA9021a+A0njAU
         VD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731855; x=1745336655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ivqkzk6WJLWaCMPOg/I5rcsl87W3433yQp2YMytuMo=;
        b=iBJHX9rwJKOiyX/j3dpM+kWm/nmrOWnaPEvBlaXKU88kxw+GstJra4uNruNwHro0Ce
         dTSUKlOAm1RKA+ddhO+esytR1NfC8Wi+8et12a+YsMUBTjHnP0g7n/jzQANOvBs7iOHv
         0SeYexsWZHDZBKJ5GFhhuQsDOGckqopT5EPBuzaBXQ7fVzeYEmJfHx4jVUnDQQxEihKc
         Tt3i1h+PjpmrBppR+d74lmEk9iQ90silrxlcjO2HGfrtUcKBkBMiHodhUxrOnXRS8TqV
         e+FwJpswaK88cledzFDSXM/M5I9V+bK97dqK5chf0IeheyNeKiuX58rAWsCKsBgN+g2q
         5MAA==
X-Forwarded-Encrypted: i=1; AJvYcCUjfsH7yM2lbCqnk1+rUM1YlblSxqMuEM+6R0qf/aw+qD7o36r+73OIgo8ZMYQwwe7jWh4lvBqt7rG9htA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3+GZB8n+Os6So0hLO3SlWl9cn8LouYl0NiEi+EhzX1IKp+O0w
	3b60mLAY+5v4F/Tl31630ctVupquGOZALk53dumV5BcsBjemq2Kv
X-Gm-Gg: ASbGncvTP3pv2o64jqrdgmRxKQaDxcR/BooNIQ9mV9CxGvGgfGYjOo5CwzfgrxRpXIW
	LvJcuB/MYxyXPy+1JCxNQchXhtpnwZrN0c69hDkou2GoGcoPetA3apbZDFzFzZy1H64bm7dfiGN
	JP5M+RkdIHFiSxRSFbRHonS2kIIOLafG2YyzWk95Fkp5JmfmQJRybYd+lZp8c4lcNsuwq9e5d10
	X21YeJiEVL3V5ehlGSKNjlaIAXwJH/IjME4LS2TX/hVUl355u0kkToeHAIf+uIA7J2SDrDD6DAW
	18RGkDl788aPx83CRqtzd/BXggUFMD2l7hl8LlHhIMryG8zmMwU=
X-Google-Smtp-Source: AGHT+IE8CMhgk13yrdNHiG4lK/RuzXuJgXEoSENNiGujEw6evWJe1UlRSftl5yTAdz/S2EwBVw23wQ==
X-Received: by 2002:a17:903:1d1:b0:225:ac99:ae0d with SMTP id d9443c01a7336-22bea49d2fdmr266916215ad.10.1744731854876;
        Tue, 15 Apr 2025 08:44:14 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21949dasm8652778b3a.35.2025.04.15.08.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:44:14 -0700 (PDT)
From: Jinliang Zheng <alexjlzheng@gmail.com>
X-Google-Original-From: Jinliang Zheng <alexjlzheng@tencent.com>
To: gregkh@linuxfoundation.org
Cc: alexjlzheng@gmail.com,
	alexjlzheng@tencent.com,
	linux-kernel@vger.kernel.org,
	tj@kernel.org
Subject: Re: [PATCH kernfs 1/3] kernfs: switch global kernfs_idr_lock to per-fs lock
Date: Tue, 15 Apr 2025 23:44:13 +0800
Message-ID: <20250415154413.15326-1-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <2025041506-punk-conflict-ffa3@gregkh>
References: <2025041506-punk-conflict-ffa3@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 15 Apr 2025 17:16:46 +0200, gregkh@linuxfoundation.org wrote:
> On Mon, Apr 14, 2025 at 11:20:54AM +0800, Jinliang Zheng wrote:
> > > On Sat, Apr 12, 2025 at 07:50:54PM +0800, alexjlzheng@gmail.com wrote:
> > > > On Sat, 12 Apr 2025 08:12:22 +0200, gregkh@linuxfoundation.org wrote:
> > > > > On Sat, Apr 13, 2025 at 02:31:07AM +0800, alexjlzheng@gmail.com wrote:
> > > > > > From: Jinliang Zheng <alexjlzheng@tencent.com>
> > > > > > 
> > > > > > The kernfs implementation has big lock granularity(kernfs_idr_lock) so
> > > > > > every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.
> > > > > > 
> > > > > > This patch switches the global kernfs_idr_lock to per-fs lock, which
> > > > > > put the spinlock into kernfs_root.
> > > > > > 
> > > > > > Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
> > > > > > ---
> > > > > >  fs/kernfs/dir.c             | 14 +++++++-------
> > > > > >  fs/kernfs/kernfs-internal.h |  1 +
> > > > > >  2 files changed, 8 insertions(+), 7 deletions(-)
> > > > > 
> > > > > What kind of testing / benchmark did you do for this series that shows
> > > > > that this works, AND that this actually is measureable?  What workload
> > > > > are you doing that causes these changes to be needed?
> > > > 
> > > > Thank you for your reply. :)
> > > > 
> > > > We are trying to implement a kernfs-based filesystem that will have
> > > > multiple instances running at the same time, i.e., multiple kernfs_roots.
> > > 
> > > I don't think that kernfs is meant for that very well, what is that
> > > filesystem going to be for?
> > 
> > Thank you for your reply. :)
> > 
> > Similar to cgroupfs and sysfs, it is used to export the status and configurations
> > of some kernel variables in hierarchical modes of the kernel. The only difference
> > is that it may have many instances, that is, many kernfs_roots.
> 
> Let's see that filesystem first please before determining more, as you
> would be adding a new user/kernel api that we all need to argue about :)
> 
> Anyway, for the 2 patches that Tejun agrees with here, can you resend
> just them?

Fine. I have resent them at https://lore.kernel.org/all/20250415153659.14950-1-alexjlzheng@tencent.com/

thanks,
Jinliang Zheng. :)

> 
> thanks,
> 
> greg k-h
