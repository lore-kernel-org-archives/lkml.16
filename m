Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D0D2367CE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 11:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744458658; cv=none; b=eWAS4V8gYwe9KJxqu0tIvo2B0jJ75flqHHaawv9HPwHicA8JLtbaWwGyQUXnZgQDNl5P2EFg8AoFvKXfRo81XcaDOdZ9rL3i9lcuVUvcMlU9HtDB+z5MX2/RpqHdKDzKEcZHNglw6kAo0/A/qlRxIBI/cN8iINgGszf4xpY4OR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744458658; c=relaxed/simple;
	bh=GtkRchdcipwdR7lHoIg4gccPvr9DSE4vhVqfJWFvlUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8X0NDuO7hPtieM+cIIFfZMnq0nFkGr3WAW4AEl2op+3OUwbdpZWeq8qj8OGGXD5iNIhEENR2TdcrYALYExtbh/JCPqwNXYmOpUwJhWqZIIcv+E4WYjgLW1LWSVD0TC7Jvg1fwvdak1+sBPeKA5a7T1G48uam33w1eecogx/GNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEosta50; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEosta50"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso2832053b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744458657; x=1745063457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sLeXNB6Otg/NUBFA38Mx7FYYC291DUHLBQY9/Y0+3s=;
        b=WEosta50eoAdy9d5m2J+UkWN9WFgZlFlsRyfnNv4U4smQpk2u/e5OmCV7L+EIUjXyf
         6+Q4MwbUonrdjnKGqeQH/MsEqaxJ9bM5xzmUEt+R+hGIYqOBmS8Z3djgmPzxZa4TEfcs
         3QMxaXnEYBUcrPy7JSKT1D/NF7H6flnQD+l8CJx8Ew/ToFXO7l2C066N2RVIQ3d4eiGO
         2j2/maubVKLwnZPdiK7ANvONoEU3AcXwPgnX+lulHABlnsjczIwG6kOAsfdVF5Ueel0u
         0HQCx+wr/1BJQDh4zi03bWmReoEywzGEBoTy76JU+YAUAvzs2nJKGthNeEuwMDf8/YPU
         P57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744458657; x=1745063457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sLeXNB6Otg/NUBFA38Mx7FYYC291DUHLBQY9/Y0+3s=;
        b=Et3wWElg9OBeSI2CMpZA4Z8skiE5II3nLRDRbOOvP71TKc+TO/tUq7lMEht6tpvLWo
         febRaJI5v+xJd+FEzo+0eTNXf/0cWPoKRfF0uYy5RNGlRc0n3Xi2gREbn5ASLEy+5VBc
         UU56CI6VokY70AsPGEjH8EbPDNEG2Ss77KZPB/d6IkBvUfTIBqyTWeHI3qrjyQXjKmZH
         7QCcuMNZpseF0AxlVAxXnc1KqHJQ5RT/5XSlMjYIHT3N3nRmGS23wuO95dqd6S7kxeDZ
         7fbLSvuTD9Z25KOWtLeqwIxTnrqk8Lqlg1D36+c/VY1G+y63QtD8qI474x0LX44KXC24
         qliQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkq9Hwwvt1djxnwOvTn5cyaDBeP88UeFnMkM+xOCxOX6eP17RZuOfNng9UILQsoYHelsahRzLCPg/eyHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbIlwn0SsjKuPwGud5nUfycXyAHRb3wxsL+qoOWdU4pu+GlQDA
	EtVLTKEDwiklT/W+pVzuCu7dyc2mZRbVQTl7BB9oFM7FHu6YJBMV
X-Gm-Gg: ASbGncuxE/CR4eif4FX2j82BNBGsNfFPMss9RCT1h5UtTPBL7i34pXdgkasARMxWvsm
	rxWjWj3OgARFcW9HJuDDQkBiISt5PfBYLSKnByMT9RtMySpS4QvsmgW8YgFOzT9o3219bEjkIpq
	AgxzbCL6Ef4V8pYlreEjPSdGEdR1NVWu73Y6InWBQ2q4EDJJUZpQ415hK2LblrEhPGaXA3Q3Zpw
	PZ3iqbwcvmF25vheGsQ8zF8dyMrevHYFJyHwqSqFVlk7/pc6EqZBh8htsbdw+4z2aydtPe4iS7W
	tU26hWNhgzfvhPLDyfkN/R6+sQP2/vkfOsG2YEksLzLnK7ctvVw=
X-Google-Smtp-Source: AGHT+IFW83cYpjRH6czDRz/9DZ5rD2c+/DMMMIYCyVvhlVy+JJz6zznKKwCXVGZJ/Gy14VnH5ViLoQ==
X-Received: by 2002:a05:6a00:b89:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-73bd12c9e39mr8149056b3a.21.1744458656334;
        Sat, 12 Apr 2025 04:50:56 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f8276sm3339552b3a.100.2025.04.12.04.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 04:50:55 -0700 (PDT)
From: alexjlzheng@gmail.com
X-Google-Original-From: alexjlzheng@tencent.com
To: gregkh@linuxfoundation.org
Cc: alexjlzheng@gmail.com,
	alexjlzheng@tencent.com,
	linux-kernel@vger.kernel.org,
	tj@kernel.org
Subject: Re: [PATCH kernfs 1/3] kernfs: switch global kernfs_idr_lock to per-fs lock
Date: Sat, 12 Apr 2025 19:50:54 +0800
Message-ID: <20250412115054.25580-1-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <2025041256-sanction-sandal-7f51@gregkh>
References: <2025041256-sanction-sandal-7f51@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 12 Apr 2025 08:12:22 +0200, gregkh@linuxfoundation.org wrote:
> On Sat, Apr 13, 2025 at 02:31:07AM +0800, alexjlzheng@gmail.com wrote:
> > From: Jinliang Zheng <alexjlzheng@tencent.com>
> > 
> > The kernfs implementation has big lock granularity(kernfs_idr_lock) so
> > every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.
> > 
> > This patch switches the global kernfs_idr_lock to per-fs lock, which
> > put the spinlock into kernfs_root.
> > 
> > Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
> > ---
> >  fs/kernfs/dir.c             | 14 +++++++-------
> >  fs/kernfs/kernfs-internal.h |  1 +
> >  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> What kind of testing / benchmark did you do for this series that shows
> that this works, AND that this actually is measureable?  What workload
> are you doing that causes these changes to be needed?

Thank you for your reply. :)

We are trying to implement a kernfs-based filesystem that will have
multiple instances running at the same time, i.e., multiple kernfs_roots.

While investigating the kernfs implementation, we found some global locks
that would cause noticeable lock contention when there are many filesystem
instances.

Fortunately, we found that some optimizations have been made in [1], which
moved kernfs_rwsem into kernfs_root. But there are still some global locks
left.

We think it is also necessary to switch the remaining global locks to
per-fs. Moreover, we strongly agree with Tejun Heo's point in [1]:

  "... this is the right thing to do even if there is no concrete
   performance argument (not saying there isn't). It's just weird to
   entangle these completely unrelated users in a single rwsem."

We think kernfs will be widely used to build other filesystems, so we
strongly recommend switching global locks to per-fs.

Thank you,
Jinliang Zheng :)

[1] https://lore.kernel.org/all/YZbbxK1F7jY%2FRBFF@slm.duckdns.org/

> 
> thanks,
> 
> greg k-h
