Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2498853365
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173421; cv=none; b=LU+BBeaSqofBMYQi8qd6W+oZGt3bMw5wQnvVSEdv815Qh6wom3sgv80R8Ub1smDNqF1yPeEzJG+UfCBzRBEo9EcgxiNhTb9FkZi0SnJ/cOnywQTA9Q6pEn7wsmX4XEFsob1TgLV4cpm47bVCCnx15NadQCO9Z5kgDwP+FVGcrAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173421; c=relaxed/simple;
	bh=/zF1mYp+Qjw1mKBvyibCDQdFS3FVN2otdPIZy4zUN00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abWNdSDw+vhmwvZnXvzP0ZgByr1zDBjMfWxpSe2da5YBC9HavZCgTD45GMWOqnfv8pMTsObgzJaJqbnuiqvQ2m/3lnOeNUY8/Sr4YsHga5Qx34G9XhZ1hzVAo5/rHYEezOj1FbZMDxCDY56g2DEij3HScLH7ls3/DsgRDk6traY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=j1zEgH1+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="j1zEgH1+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22fa47d6578so61553215ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1747173419; x=1747778219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZA5fGkDhuFz3dZTFRzP7MkkEHNqz8Evy7iH7RQVbCQ=;
        b=j1zEgH1+cXBmd8et8OxPHFA8BjOk7oqsRIjmzZPl5fBPTZti24PhyajqhsHhgq/Bxn
         Dhy/flxcfVkekHCXShDNWoKOwlQ9n+zMPbyIax1tT0/1BqQpdLo09Bg3dwon8u/+EjG7
         yLsEbV5oP+b7JnIJjwWaQ/tuwy7gsqypa2lyBg2eLeBk80gViwuJ1Oi2UZVJQ4woGP/6
         1yLahk1/2m/oVIRyiNmflEGkls3c3Ak1Rk5bVCKqQn4Zx5+NElIM2mvWX20UDa9P1aGW
         xlktSjrK1zx0kOrYhMd35DoPxV2LOZCqDmF7WVnoON+1iSgQyxA00IzmO3nDZ9aBujc3
         d2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173419; x=1747778219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZA5fGkDhuFz3dZTFRzP7MkkEHNqz8Evy7iH7RQVbCQ=;
        b=EGNFKfINMbukEOYpmVQTBFjuBDyTEzfiK2xTr5JAMBz+Z7lvLr6EbRvCIyslg6fV7l
         cwZY/EbF56Ng7lKNMeKMyrmBUfYMLyf+NUI2SHcOJdcBiRa0w/Y+FIzzhl2v5cz8IO/F
         Hmo6yYpFKm2JSuJsgxvzk2JMPPYmWJrPa1jqOkrVd2GYyOCQvsnUqoap3SThU7DpO8NS
         VbyFhfg0s+Yken2NZMW8rwMCsF0COYDc19eTLQgaWEii91qYfjl2uRI2qWrZxYVY0C4A
         Xao8MYsA15gBJIWsfo1M8zAienlSKvBdqFYDaThEIqzFo9CkippEZOnjNLpNEHdbqhVD
         H5ug==
X-Forwarded-Encrypted: i=1; AJvYcCVk1EJV/I+ZCDDjpEeS3JNwBfET0NFQ45t4tZxsGjdFRW66AU5vEGZ1lxNThvu+znjMtVEdJVNkna6ZwIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT/w4kq2XLGBtSfc1EDJOt72j3y+nyVMFmzLgzRvWRqt7uLi3y
	uWVN9wF0gulyo/raSeGAcJG+aCCJJ/3m14DP1xwyl8ZMxz6SDXGbpezcOo+beTM=
X-Gm-Gg: ASbGncuLvEaiKZT2wX37KD29+rB2kuUO/rXiHJQH6yJaSqYjRfyAtogUMnThNuwQ7Ca
	6AoOtuUhOFcpq6FUUNnfkltF7aRnqwXRquELzpeUYcJ1GkgM++G+XmMxztl3rUFEd1ZWsRue81N
	ug/KbnFK6431mzB0eim2uU8kvc367liiL5kdD5LL2ZZIb3hs9+IXIULkCp8JgmbntZiUYXBw/pt
	hmtLF4Nz64tyj4M5usY0q7I4xzBBgwXQ1nK9yHrmvLXk2WgPVg6uX+RGsZbXtSnNaCclwFElbxk
	/5NvNxxzerqyukrJDbBSHy5PJVIR5quWx7LIYf7+Rxlk/ygxxaRkbaDi91n44y+6AEWNd3sTDlb
	crb12d4nAYNkxCXfr3GTjmSFT
X-Google-Smtp-Source: AGHT+IFwcTKvJORimT5ASOuSIGOHxsEuSSyFah+YehraNrSSTWMKnHLpvk3NB/MeLAAPLB1ACpSogQ==
X-Received: by 2002:a17:902:da83:b0:22e:7e00:4288 with SMTP id d9443c01a7336-231983f66b0mr14677925ad.53.1747173419381;
        Tue, 13 May 2025 14:56:59 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-60-96.pa.nsw.optusnet.com.au. [49.181.60.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271a7dsm86946075ad.153.2025.05.13.14.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:56:58 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1uExcO-000000039yV-1X40;
	Wed, 14 May 2025 07:56:56 +1000
Date: Wed, 14 May 2025 07:56:56 +1000
From: Dave Chinner <david@fromorbit.com>
To: cen zhang <zzzccc427@gmail.com>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com, zhenghaoran154@gmail.com
Subject: Re: Subject: [BUG] Five data races in in XFS Filesystem,one
 potentially harmful
Message-ID: <aCPAKC7OeCIGtVMM@dread.disaster.area>
References: <CAFRLqsVtQ0CY-6gGCafMBJ1ORyrZtRiPUzsfwA2uNjOdfLHPLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFRLqsVtQ0CY-6gGCafMBJ1ORyrZtRiPUzsfwA2uNjOdfLHPLw@mail.gmail.com>

On Tue, May 13, 2025 at 08:25:49PM +0800, cen zhang wrote:
> Hello maintainers,
> 
> I would like to report five data race bugs we discovered in the XFS
> filesystem on Linux kernel v6.14-rc4. These issues were identified
> using our in-kernel data race detector.
> 
> Among the five races, we believe that four may be benign and could be
> annotated using `data_race()` to suppress false positives from
> analysis tools. However, one races involve shared global state or
> critical memory, and their effects are unclear.
> We would appreciate your evaluation on whether those should be fixed
> or annotated.
> 
> Below is a summary of the findings:
> 
> ---
> 
> Benign Races
> ============
> 
> 1. Race in `xfs_bmapi_reserve_delalloc()` and  `xfs_vn_getattr()`
> ----------------------------------------------------------------
> 
> A data race on `ip->i_delayed_blks`.

Not a bug. xfs_vn_getattr() runs unlocked as per the Linux VFS
design. -Everything- that is accessed in xfs_vn_getattr() is a data
race.

> 2. Race on `xfs_trans_ail_update_bulk` in `xfs_inode_item_format`
> -------------------------------------.
> 
> We observed unsynchronized access to `lip->li_lsn`, which may exhibit
> store/load tearing. However, we did not observe any symptoms
> indicating harmful behavior.

Not a bug. The lsn in the log_dinode is garbage and not used
during recovery - it's mainly there as potential debug information.

> 3. Race on `pag->pagf_freeblks`
> -------------------------------
> 
> Although concurrent, this race is unlikely to affect correctness.

It's an optimisitic check done knowing that we don't hold locks and
it can race. The code is explicitly designed this way. Every other
pagf variable used in these algorithms is also racy.

> 4. Race on `pag->pagf_longest`
> ------------------------------
> 
> Similar to the previous race, this field appears to be safely used
> under current access patterns.

Like this one.

> Possibly Harmful Race
> ======================
> 
> 1. Race on `bp->b_addr` between `xfs_buf_map_pages()` and `xfs_buf_offset()`
> ----------------------------------------------------------------------------
> 
> Concurrent access to bp->b_addr happens during buffer preparation and
> usage. Since this is pointer manipulation of page mappings, store/load
> tearing or unexpected reuse might lead to memory corruption or invalid
> log item formats. We are not confident in classifying this race as
> benign or harmful and would appreciate your guidance on whether it
> should be fixed or annotated.

Impossible. It should be obvious that an object undergoing
instantiation can't have a locked, referenced access from some other
object in some other code....

As I said in my reply to Christoph's patch - there are going to be
-hundreds- of these sorts false positives in XFS. Unless there is a
commitment to annotate every single false positive and address the
"data race by design" methods within the VFS architecture, there's
little point in playing an ongoing game of whack-a-mole with these.

Have the policy discussion and obtain a commit to fixing the many,
many false positives that this verification bot will report before
dumping many, many false positive reports on the list.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
