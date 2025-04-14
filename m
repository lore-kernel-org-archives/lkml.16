Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1A42F32
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744600859; cv=none; b=O4Gh9j+RkJSiyLnizKOWyu9JkJ83IncMUMlQlDGXs1jPeyr44f4wWyRH9ZSmxublw47jauEL4MTM5LlLWs7CUNlmKv2MgvF9O0g3NmgQlGlWxYiXT4a+cOj06KW6Ns9wLXraITqhTNTzHgvWxxOh3FpXigdhxkmeUP2obj4XEK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744600859; c=relaxed/simple;
	bh=vDgdo7S6Np2OOE+tLCoXsHdQbNPUxnQIZ7ZYIFmLjpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bm+1Y6zNlbt4C97v5EXRwj8SfEwjGU2rPdNnAf1nEqo+xkHNBQh99cnvjzD+GnAeHABlki/TUXv4jCfcPlPctz0pwVQNpjVfZ5H23KeR9IUgYXUQUgedFrRYTTxZbjUknGLOjzetrrKX47AiHFKZ3yVSTPvDeETWcHCPWjYoFsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsG4SlS0; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsG4SlS0"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2254e0b4b79so50692135ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744600856; x=1745205656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWVn+xXXJZRxORbRSuoVvLMVD3a41eyrT2UvaYEBs8M=;
        b=OsG4SlS0I/M1VD0K8tbNsb0XfYpV2+Okw2Jf42aB/E12AdHBxSxSTKY1jOYbKpjfsG
         qIcLLLcLJOZvS2UU3kfRGmhsd7Zjk5HyWq1M/SYOy0lrJfWDUihNBG6zujUiDNiBEviN
         XYaWbs9bd+e1pLszbnr6iktuu/kfl5djRIEAlazzHsnCxrxpM2nYFH5V7x9sk5dIqnQj
         5kgglQdhNNaBO8mtivEB8OqYVSg+yKNIN0Ozu1e6ZpsgAMZLn+elNi1BFdLK6L6K9EGT
         LuF/9sN8Sa3Cq4MoAoSND2h4aoSRp+Wf7TgRIEH7HxozJTu7w0j78s0+B3uSUVHO5XxT
         1FvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744600856; x=1745205656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWVn+xXXJZRxORbRSuoVvLMVD3a41eyrT2UvaYEBs8M=;
        b=LSpNehaU+iILdGJz2+rNVN09G3rPl4ziXXqcRIZ8gKv7fTObJ0eEGqu4fpUO0wxWF/
         JgSlKUmEStTA/k/kAeLAaLzwLOYYWwx27MFdDCHt41BY9YXCC4kJJvxW4bW/89JH2r9h
         /bdqrP6LxNbOzgRm82lp/7aAehJE+GYhUdowN8k99xaxHwH6le99fhb7FDtfw/KJoqie
         VWMep2VSh3+NLPcVVfMVS8O5s0ufP7O//AzRGSl1goimBg9w1kFw0bXETxblh4KsI96x
         FOyhm9wD96kMa7LVIQaWxlBtgVeGY9bUUD/QHKQNjM8Xq9MvHiTwiB/yJB+9YuXHGOM+
         yFqw==
X-Forwarded-Encrypted: i=1; AJvYcCUn2cs+liwPCEbrC3RKxUAcSrupZHFXsYmSldFjCZNut3fCKDu5xqtFmNZQaq2eWbT7o2IH7HSPwx67XNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YycfnnwO+sR/zkcsCtwIhPPnsCihyt+Mg5utVxqpu/Oa1/jJpkB
	Nfl1y69Q+jCuQXNPZBI8v7vZ8FjHqEEJpugQyw3cqYsHa5uMw/bfydN89A==
X-Gm-Gg: ASbGncu5fdvo9zNYib5cKKrtDuJ4xMvgbV0nCh/i/u/xAWn6Va3SJ8wkNsXnMwiYcJd
	hFzGVWhawLsExzoe5P+PalAtLtgwOIV/XF7xBgvonKl9dR/GiQQe2X0+DrWlk2b1QAUCmrPuOTy
	Ji3Wz+Gd77acFiU11qy9VHk76YC8VNQlBxttF5HLKia7nO1Rvi1W4WbyYHtbDUNkQUcr6DmXLKS
	ZJmctrjlV542ZjWlioT1KXl9rsBQA5iN1p2Nz3fa1TtFzyg3sz3qTRc1+w51SH36WqegFgNQYGQ
	RIkQUW4jctGEfDT5naxBRdPH3JpMK3NFkeLSoVCTCJt101kXcG4=
X-Google-Smtp-Source: AGHT+IFVEpR1+fge0pH0O9qzWeOarRSPVcSWXXVG2imqt7tdzeO78mV+2oJAMYPwq7fnv3TT68rR3Q==
X-Received: by 2002:a17:902:d4cd:b0:223:faf3:b9c2 with SMTP id d9443c01a7336-22bea4bd77fmr143101585ad.27.1744600856246;
        Sun, 13 Apr 2025 20:20:56 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230de19sm5647308b3a.124.2025.04.13.20.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 20:20:55 -0700 (PDT)
From: Jinliang Zheng <alexjlzheng@gmail.com>
X-Google-Original-From: Jinliang Zheng <alexjlzheng@tencent.com>
To: gregkh@linuxfoundation.org
Cc: alexjlzheng@gmail.com,
	alexjlzheng@tencent.com,
	linux-kernel@vger.kernel.org,
	tj@kernel.org
Subject: Re: [PATCH kernfs 1/3] kernfs: switch global kernfs_idr_lock to per-fs lock
Date: Mon, 14 Apr 2025 11:20:54 +0800
Message-ID: <20250414032054.72526-1-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <2025041318-unnatural-caucasian-48d2@gregkh>
References: <2025041318-unnatural-caucasian-48d2@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Sat, Apr 12, 2025 at 07:50:54PM +0800, alexjlzheng@gmail.com wrote:
> > On Sat, 12 Apr 2025 08:12:22 +0200, gregkh@linuxfoundation.org wrote:
> > > On Sat, Apr 13, 2025 at 02:31:07AM +0800, alexjlzheng@gmail.com wrote:
> > > > From: Jinliang Zheng <alexjlzheng@tencent.com>
> > > > 
> > > > The kernfs implementation has big lock granularity(kernfs_idr_lock) so
> > > > every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.
> > > > 
> > > > This patch switches the global kernfs_idr_lock to per-fs lock, which
> > > > put the spinlock into kernfs_root.
> > > > 
> > > > Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
> > > > ---
> > > >  fs/kernfs/dir.c             | 14 +++++++-------
> > > >  fs/kernfs/kernfs-internal.h |  1 +
> > > >  2 files changed, 8 insertions(+), 7 deletions(-)
> > > 
> > > What kind of testing / benchmark did you do for this series that shows
> > > that this works, AND that this actually is measureable?  What workload
> > > are you doing that causes these changes to be needed?
> > 
> > Thank you for your reply. :)
> > 
> > We are trying to implement a kernfs-based filesystem that will have
> > multiple instances running at the same time, i.e., multiple kernfs_roots.
> 
> I don't think that kernfs is meant for that very well, what is that
> filesystem going to be for?

Thank you for your reply. :)

Similar to cgroupfs and sysfs, it is used to export the status and configurations
of some kernel variables in hierarchical modes of the kernel. The only difference
is that it may have many instances, that is, many kernfs_roots.

> 
> > While investigating the kernfs implementation, we found some global locks
> > that would cause noticeable lock contention when there are many filesystem
> > instances.
> > 
> > Fortunately, we found that some optimizations have been made in [1], which
> > moved kernfs_rwsem into kernfs_root. But there are still some global locks
> > left.
> > 
> > We think it is also necessary to switch the remaining global locks to
> > per-fs. Moreover, we strongly agree with Tejun Heo's point in [1]:
> > 
> >   "... this is the right thing to do even if there is no concrete
> >    performance argument (not saying there isn't). It's just weird to
> >    entangle these completely unrelated users in a single rwsem."
> > 
> > We think kernfs will be widely used to build other filesystems, so we
> > strongly recommend switching global locks to per-fs.
> 
> I don't strongly object, but I would like to see some real-world numbers first.

Haha, we are still evaluating whether to implement it based on kernfs, so it
has not been implemented and tested yet. However, for these global locks, I
think it is more reasonable to switch to per-fs, regardless of whether there
is a significant performance improvement (in fact, when the number of kernfs-based
filesystem instances increases, the lock contention will definitely be reduced.
At least, it will not get worse, hahaha).

Haha, but if you think it is not necessary to do this, just ignore this patchset.

Thank you,
Jinliang Zheng. :)

> 
> thanks,
> 
> greg k-h
