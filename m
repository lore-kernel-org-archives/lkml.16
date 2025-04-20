Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02C02036F0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 15:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745161369; cv=none; b=HqDCIomKfVRfUseThQcpVIpwkolrEI0savu7AYstxvhyzRRAzDgjSlmSXggMKQV/AjTiDFffI2LgHQnsqeRY9cVKeBNtUmYsXG2l3xSZmF2cu5yBnMv3dAgg1w8WVQl7+v1jsv9yCmB2k0xHZEMbRHkPB7sVmoBToZySkef1KU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745161369; c=relaxed/simple;
	bh=YcGGxN2CucbXvN5hALkqtcm/FrJP/bZ0bP5uSmmbwKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4EybZqvlU1KPwx4TyIa4XAXgxDHPxf3n2wh/HSn6rBBbnRMRet1BcAbGY1m4VmXaIlUksDlVj4T8h68u8dJ7HzptGqdXx6A0uUxyNJCij8kn4mToHdYvW4oEIAjmGVee14P9coI1SspJdvxCf/p1N1MuDYxTrssLqHQkcRPCyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyrXtCA4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyrXtCA4"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-739525d4e12so2648428b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 08:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745161366; x=1745766166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aehsPDvDGlCXhd1pUgsfJlGsVEXqTibUGcDVjj8O5Vg=;
        b=AyrXtCA4JUW7UpffKCZaP9mtZ7PDpUAgpPmueF1FJY+ZGNOS8OHF0HK9SPGWkiq1NH
         iccsTUgKSQLuhcY35Gstg0bq3mzdFatCGCbjsOlJTluzOvaqd5ck56Od1B5VWA1iKxgT
         gRadJwaMsRsv7QkGW3ud8f+m+KYqCsdzaGMz97h6j7BfLG8M0ZCDWyXuIsR7Wn1j4rBs
         H+qZoFD+WJW0pzkYO4jybmobKkHYh24t5z2GwnN2dvUj+2Oqe/s8PGNxxxpcfWNrL+pi
         fTMtO4c9xQFuGvk+Eikc/TddLoLScvR8y/fse//0C3MFcWJK4sGYQ2rJNvTUDwp9dfXo
         Bb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745161366; x=1745766166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aehsPDvDGlCXhd1pUgsfJlGsVEXqTibUGcDVjj8O5Vg=;
        b=khpitNnpArKlPCx45ErPwKr0H4kzfBOWcKjZcLPoB1s4WxRds8ruWS3IGE9y1Xn3Gn
         rpj9+rJxgUwQiN5uHBzBjVN764tpmqAxEaPaT1fJpNsrgmMnu1rJmXRBZvE5uTDPccC4
         0RnQHo3+aOZjo/BxeKa935v8Ibe/1BWPz8w3vcVl/u8IghdvUAvgh4dMBjQKyCu10jTp
         KQF3WuyDgu4yWezoW1mYoxfcLgH/oMUtZsh5J/0qk6VyM0o7jT/YQlVl/B1NbOmutcKL
         NISzIGC3cXf6mkjjjSC34F7qMEYOOD8Pl5QNqlw0BdRJvf9Rk2SNoIhaNnrhr8tX5d6R
         ZWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeBkBOLMc9G+eNU1aPIirdG8a4h7qOrm0vqvdAsLCqr1hjEnh4/HE1VhRtxXioy5bcd03F8S+9oaXe8fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsebP5y06IGXq9KSJuzqb8OnrtENG/wZW6+nKfv87mvebRHLzI
	Ptlje4CZGsY46YG08/Pxupc4TjXXbNXyrbCkdfOZReLR/1y/IVb1
X-Gm-Gg: ASbGncs1a6sumWEkkIhMKTonsOtYFEaqUMpaDTwE5Yi40s+717NLKtcq1TKnQTR3kv5
	CGXnpPgLvi/nBfzzA7kRdETX3/nyhCJqixpSyNA+tWYrBddYTliGa80nYslEPoEEorxyy5AN7fU
	XFdpTuzX55bqyrMRrmM2HnCEvpJEqLwMKRNl17ksvPx/n4/YzNX2XbSgu5fVKfS9i+bDrVbot+4
	IO0C9yJaQ8bJVA8LQ0mTOXFk2A566GWjXMRRAs2UTkjqnBUTleh1tR36pIAMt4eoLKtapo4EZrf
	pMqKora2oGa0kihY000SFuyzrkJuqbN/7+MoZYSvVEOEV78dKAXYu473khOpSw==
X-Google-Smtp-Source: AGHT+IEIPnL0Uw/ordlEG8yN3dohZH5sE8RnQZl5rG7FZbuPaF3Jock47l2BVtliEjCVnJJ2jcgVPA==
X-Received: by 2002:a05:6a00:1d81:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-73dc14a934cmr12060711b3a.8.1745161365899;
        Sun, 20 Apr 2025 08:02:45 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8bed02sm4804547b3a.29.2025.04.20.08.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 08:02:45 -0700 (PDT)
From: Jinliang Zheng <alexjlzheng@gmail.com>
X-Google-Original-From: Jinliang Zheng <alexjlzheng@tencent.com>
To: alexjlzheng@gmail.com
Cc: alexjlzheng@tencent.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	tj@kernel.org
Subject: Re: [PATCH v2 0/2] kernfs: switch global locks to per-fs lock
Date: Sun, 20 Apr 2025 23:02:44 +0800
Message-ID: <20250420150244.127569-1-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415153659.14950-1-alexjlzheng@tencent.com>
References: <20250415153659.14950-1-alexjlzheng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 15 Apr 2025 23:36:57 +0800, Jinliang Zheng wrote:
> From: Jinliang Zheng <alexjlzheng@tencent.com>
> 
> The kernfs implementation has big lock granularity so every kernfs-based
> (e.g., sysfs, cgroup) fs are able to compete the locks. This patchset
> switches the global locks to per-fs locks.
> 
> In fact, the implementation of global locks has not yet introduced
> performance issues. But in the long run, more and more file systems will
> be implemented based on the kernfs framework, so this optimization is
> meaningful.
> 
> There are three global locks now, kernfs_idr_lock, kernfs_rename_lock
> and kernfs_pr_cont_lock. We only switch kernfs_idr_lock and
> kernfs_rename_lock here, because kernfs_pr_cont_lock is on a cold path.
> 
> Changelog:
> v2: Only switch kernfs_idr_lock and kernfs_rename_lock to per-fs
> v1: https://lore.kernel.org/all/20250411183109.6334-1-alexjlzheng@tencent.com/
> 
> Jinliang Zheng (2):
>   kernfs: switch global kernfs_idr_lock to per-fs lock
>   kernfs: switch global kernfs_rename_lock to per-fs lock
> 
>  fs/kernfs/dir.c             | 28 +++++++++++++++-------------
>  fs/kernfs/kernfs-internal.h | 16 ++++++++++++----
>  2 files changed, 27 insertions(+), 17 deletions(-)

Ding Dong ~

thanks,
Jinliang Zheng. :)

> 
> -- 
> 2.49.0
