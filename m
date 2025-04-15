Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5F910F2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744699042; cv=none; b=brCXxbEV4mEkAINTYoY8wvMuolOUBbhCIZYLacjn7bDa7E7JGfITM9bPnwpMNw1zLobZogm7DqPhqMhx743QcKWP6eJEpbjWyLKh9dwcCFOaP0LWqlhhBKYwfB+zufhRKYPNdzpKxNQDjyqCCamL3f2uzCf2/Gy56rE3yCYJwjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744699042; c=relaxed/simple;
	bh=qP4MZDymKa+78tN1SibePW4jXrZOInGp63nQGSXwajk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i4CTfX1zMriOmhur4VWmybwS6hnHmiiC4fzT5IiLyXg9nrWxxkk6jqZxEtzKL/UJsMn3r7q10l9Vditklxo7r9WpNoPn4K2pWKa9Xxu9UKFuebQ7Var16+dwu0gzBH7ajxskFXnwnrywjF0hkErpIbSOi73nyc2YQnJjOYd7u2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enxE4Z10; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enxE4Z10"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2264aefc45dso76484935ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744699040; x=1745303840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NA2ukYcQNWFd46tbKc45ZOEveZYhJ9ZUVezXZPsOMj0=;
        b=enxE4Z105dSiGYdQ/nvY/r9A4vTtmEg1NlpkDmaLcipvcX+ekF6mVpJUAeFZOn9L+4
         mBLUuso03qrWBPADwWOjajyCD6AV/3oAxkRery8g/9/8dVaU1W/7ek/ivcZR/i4iP0Ay
         /gUstlUoIF2+51Xd4u5hUA47e9jzG9cU0oJFOOWw5dNbjW/j9kS1/xwe2R9tA8q/Dg8m
         zsVm6l14CHBFqE1k5W/3BnZG6LLD0R336MnVar4R7m28Ss5lEg4dCzMr8nleRrkXNteQ
         n4knpQMbyWAOFL/1OiWeIQPxZHnp7KMFlL4Gq14S0UzGt5gaAS9JO63jS7a8hI9Zo2t0
         4CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744699040; x=1745303840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NA2ukYcQNWFd46tbKc45ZOEveZYhJ9ZUVezXZPsOMj0=;
        b=Nol3pX+58aGHNj4mdAGFNevBpClNjJpYM1Q/OnO1fRGRkCRUw66tC2G3RPiwT21wU4
         W5hZ1+/h3aGD94TYhsTgYi923lUSjcKV2kKSKbmXH2/AyockLQCOPdhOoHKAu7gEJOiA
         ww6kue5x03dpFZ79VqqtufOohjBu8uWRhlSjqdEDDCHFzv9hRrVi+C/hd0pepWaBMeTB
         lueDyyajxmEy4cLFvvrJ0PJfRit4gS2xr9oFXzHF4RbQS3XwV/K68cOhJdbcNoRFBwfi
         XbNYcmq5BJM6z5++QBdNCIVKT9Xi+2D2F4iTB5dK+pBg47Eb2QtmMYAaToszzN2kv2Yg
         xNxA==
X-Forwarded-Encrypted: i=1; AJvYcCUXTHzvzpey3BJpHuVqC1QpuyGRtEPkN3eTOsYwC6U7jvCAuDzyS0cPF81rHKsADsqpHuzaDnSCL8AjJxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+cFjfBldDouSSrPunbxgbYDSlx0mYwsMl6w5I8TSbffoKjkmG
	A0MDLH4uoagGeLgPixefs2MKDSd1a9WJeqiwXyl3N2xElAHunnq7
X-Gm-Gg: ASbGnctTQVqOLkJRqMssKNdLTDH5YLSEOjHINBHk8ZkocbVaUXY4eS8GvmUuTsglbGw
	o3Rd+fccRbHuHkCEuLn5DtvqXtpHNCmXPUQEj/d5NEQUx5jdFNj5ywZMACgBTRJH7rXB626288R
	WcbyGzqZlvFGBV3sPwJ+valS6IP3cccaSMgIk8G3Kq8j49yrYjxyv0l4CckVwldYeJACZMkgz3e
	V/0Bf8mtIFENl+88v2NfHw4BUYZGcKVzo1fnsO+Sd6IFk3XONmcrFPKYY09tX5MK7hNVt0sIuLp
	HeRt95N1ULdMCvArh7mrxTbN4wEdMEy9bdlUHCuOedULILO8bsA=
X-Google-Smtp-Source: AGHT+IENxf+UYko9kPc+7Uqjj19g4l60bcYBTsDrmkwErQ+SIJr7sZ6J0VirVstwYMZaIH54j70HTw==
X-Received: by 2002:a17:903:1aa5:b0:223:377f:9795 with SMTP id d9443c01a7336-22bea3de1a8mr234328695ad.0.1744699040407;
        Mon, 14 Apr 2025 23:37:20 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb534csm110014575ad.180.2025.04.14.23.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 23:37:20 -0700 (PDT)
From: Jinliang Zheng <alexjlzheng@gmail.com>
X-Google-Original-From: Jinliang Zheng <alexjlzheng@tencent.com>
To: tj@kernel.org
Cc: alexjlzheng@gmail.com,
	alexjlzheng@tencent.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH kernfs 3/3] kernfs: switch global kernfs_pr_cont_lock to per-fs lock
Date: Tue, 15 Apr 2025 14:37:18 +0800
Message-ID: <20250415063718.342738-1-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <Z_1FeW2XQTLFGGbV@slm.duckdns.org>
References: <Z_1FeW2XQTLFGGbV@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Apr 2025 07:27:21 -1000, tj@kernel.org wrote:
> On Sat, Apr 12, 2025 at 02:31:09AM +0800, alexjlzheng@gmail.com wrote:
> > From: Jinliang Zheng <alexjlzheng@tencent.com>
> > 
> > The kernfs implementation has big lock granularity(kernfs_pr_cont_lock) so
> > every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.
> > 
> > This patch switches the global kernfs_pr_cont_lock to per-fs lock, which
> > put the spinlock into kernfs_root. Of course, kernfs_pr_cont_buf also needs
> > to be moved to kernfs_root.
> > 
> > Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
> 
> I don't think this one makes sense. There are lots more things that are
> globally synchronizing in the printk pass. This is necessarily a really cold
> path and it doesn't make anything better to split this lock.

Thank you for your reply, :)

From a performance perspective, I agree. From a design perspective, I can
only agree 50%, hahahaha.

But compared to the other two global locks in this patchset, the changes to
this lock are relatively unimportant.

thanks,
Jinliang Zheng :)

> 
> Thanks.
> 
> -- 
> tejun
