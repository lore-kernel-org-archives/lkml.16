Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769292264BE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 03:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751857869; cv=none; b=WGDN07g7BsWK6+XpPiIxxUnoEMSopXDgWECovg4uUQZiLrxn3GvAmxfwZb6bZx3JgL2nVgyQkx1O4pfOBSPQFrBBqPbCBVsKT6j49fII9XQa08E6aU6/yDyuFYXD5jgE+Ay6U/ugbrNFo6+pmEY8b4zh69DH9Q3cQC9qjYfRbJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751857869; c=relaxed/simple;
	bh=xwz1l/H5UXZjQk3J+hYZITziwIvJlL/zfAu2kp+YoiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKndB0RYGlHzr+6h0BAbnZnqALhenwYI8yXKRv25xjeNtSVYrNW+JTInsA4mheRg6fBnupCfwfbZT8BPyEPVNKBk528M3aP1vYnD2DQHKJEV6ZWs4wuDS03Y7ynAeASMNXr5RwXawvcPeyV5P9Vn/ZF8UA1SKmJX6EftDcELpyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+5yKiux; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+5yKiux"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23602481460so25594025ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 20:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751857868; x=1752462668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7amhQqX50eRT9loQj3sMjgvmIkBWmbgVYCt5B3y/xTA=;
        b=l+5yKiuxEr3g91Uuf6YwBBqIi42BvRti5ct6v9H7DlQp0XnRGayHCtTF/1tBrQBF0l
         POe9zPB9R3DeP8kxpUMIIOYx5ka45q11J9MrMJ+h4RmrMODo5/bAlmSq9+lzSZhJmfG0
         lf4Dtqp+9Q/cVI3OC/vQ4q83t70DBXhaFSc705dcrCgjUqd3qPwTMOIDXCAPcllJF575
         /24WdtS8xuGq1FN4+dZkaDsyrhJFptksUJ4/pPApeCvFNsCt29O9WCDJBa14/IZ2QK7H
         CwjQPYK9W3zPr4UUprhc1q3tbd/8k+V2KYC4bzYUDFsvYwWx5ZHMKpNbnFpwHUt4FI0i
         lwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751857868; x=1752462668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7amhQqX50eRT9loQj3sMjgvmIkBWmbgVYCt5B3y/xTA=;
        b=BqcW/u+meTdxg5FsLfnyySZzuWsmJI2MtRdhoLxRUnwHevGPpvrqn+N+SSkvPLaHPk
         cOqsxwi262j1wHSpk+xIDa2chg7L4KsD2YVVjJ+c1/w95mCcGcRpUXtGr/3OnMTuNZbF
         +Lkj5Q+we6NgDSIFvcnwlL/+908y5Grjqsw1LYLc3uYRm0NJ3cWQ0K+PnsDOHr31zxjK
         3VJLR6KaX2eyazUiwUu+zxMW1T/uJ7wPKZBioQZTmvvawoTyS8fbcH1M7j+cQrEcoqiO
         LxgN/fnxojO/462F97u6t/WiE1/McZtRsyyapt+gf/V8J0HQ+7PP1nWwjacBENolx4pQ
         zg7A==
X-Forwarded-Encrypted: i=1; AJvYcCUt38PVXSIHU/4EY5Y4GrIqx2dpZD5K/KL9Fi4+bJPgl9bJjh6+hyBvYjoa9NlLT45fAeIdPgSw8fPI22o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW7LJUo69Z2ZsxsfGU0llbkIQ3JeQfRnVp2SoL5p68kr6TVW2k
	ZiWvJZdBoLM43Um/vaiyu5h4pCRQn12PCvf9Nl1BBW5iFoRQfr5QuQiW3mD7eb0b55k=
X-Gm-Gg: ASbGncvbMuyNz0QnjeJUEd9HWpw3jsT16ziXLRIktEBB6z8CAaVtiMBeOwiCEUjb9tS
	64jVy5CxdufqwCH4HKd1SEK3iIDUS/XZHEwf5tYmvkUrZ+eQEGlSSbJ1xW4XPgVm5CZqY0jZdc3
	ZYpCwK0osIx5zvZEyFulHABJ/yX5WOs6Zozqy6c7Gp+jL+ftIFkjBMIRL5Z7p95LkzFiOEUWeTu
	JYJBLtzcUBBx+tW1GQ29pCbAzz4MuJ9oPo9cQO4xgha+tKZGlMXlF9V7VLL5ZwUbqhKa1NYp38v
	mPDXAHCoIVYRUutuFcbUgJ989ZOsjJVVGI9p17xgMmb480v1io2M6YS8d69zcCMVaB34AYp3oxM
	hqOqMLqXiogWg
X-Google-Smtp-Source: AGHT+IGIbEvG3vsSdCpTz1S1BGFX5z8oIm8yeCQTxGVZVKcStSckfWZrCw2pndUc0Dy7K0uNEyB8lw==
X-Received: by 2002:a17:902:f70f:b0:235:e309:7dec with SMTP id d9443c01a7336-23c9105d8dcmr79734375ad.26.1751857867638;
        Sun, 06 Jul 2025 20:11:07 -0700 (PDT)
Received: from ipravd-Nitro-AN515-55 ([2601:646:a000:5fc0:5e93:4ea0:4954:ef6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c84351ae4sm73971615ad.72.2025.07.06.20.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 20:11:07 -0700 (PDT)
Date: Sun, 6 Jul 2025 23:11:04 -0400
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>, mark@fasheh.com, 
	jlbec@evilplan.org, ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: syzbot+6bf948e47f9bac7aacfa@syzkaller.appspotmail.com
Subject: Re: [PATCH] ocfs2: avoid potential ABBA deadlock by reordering
 tl_inode lock
Message-ID: <ximqx453owvswgsgaqdsg26pbkyzj4mqhm4gowudbhvxfsdzqw@fmndfzgkt53z>
References: <20250705175315.225246-1-ipravdin.official@gmail.com>
 <02850dc3-1827-433a-89f1-b66553efe02a@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02850dc3-1827-433a-89f1-b66553efe02a@linux.alibaba.com>

On Mon, Jul 07, 2025 at 09:32:52AM GMT, Joseph Qi wrote:
> >  
> > +	inode_lock(tl_inode);
> > +
> 
> The following out_unlock should do the corresponding order changes.

Will fix it in v2, thank you.

> 
> Thanks,
> Joseph
> 
> >  	/*
> >  	 * ocfs2_move_extent() didn't reserve any clusters in lock_allocators()
> >  	 * logic, while we still need to lock the global_bitmap.
> > @@ -637,8 +639,6 @@ static int ocfs2_move_extent(struct ocfs2_move_extents_context *context,
> >  		goto out_unlock_gb_mutex;
> >  	}
> >  
> > -	inode_lock(tl_inode);
> > -
> >  	handle = ocfs2_start_trans(osb, credits);
> >  	if (IS_ERR(handle)) {
> >  		ret = PTR_ERR(handle);
> 
	Ivan Pravdin
