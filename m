Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E9C26B084
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663379; cv=none; b=XP/LeyNCAdTaqLxaMzNhTZFnVWyT7Vp/j3vFma1AN+K3rqMEGzI7LUxBQimMskz4LmNwwcrTOzAkaY4nLebSlPupYMKNO6+rVVZTbxhVZOddt3bFQfFBT/z3AX1/ZY52LUD9K69DyZLUstM8PK/K7VqI7KlvwaxzGJFRFBsszJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663379; c=relaxed/simple;
	bh=6JeicjUHmHodkNN/zM/djUCuOR2HOijRfC1PdA6i1Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfplfCUDrqejb4rstBmeXWpEJ/XaLDvfkX3Qlq/IvLyeidXs+lsGjvaM62pOTr04N7qyY8eqnin4JZGGqKzaypuc5gst0bu8U7rqQf4cL8yn2/qsKVbYNpcOCG48B0kh3CmYuciN7R6QC3NwYjYLQtq6ZgTCx0QEqzHXI6HrVg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P636DutZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P636DutZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a365a68057so1924162f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747663375; x=1748268175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yWHK376VyM/OI/YTUsa3tJsiwaElzvKB3NW3NOhpiiM=;
        b=P636DutZeVZfwjnLwuxbXt9gvNyYJSKX2bNgrVDsov0uHT4nKxEBaOfkCx+Upz0I7T
         VLN42EeAIvGmwPhJkQsQ0l0iJN/KBsDN3/qk1xsPE3oTKcxYm7HshGQpOcR6xGnoJWYs
         qXsOvMNFlV6lXskj8xwEqoaEK56QpQOlXqIf0I13Nf/Vt2VQCPUnOWFXipvCATD7dt0O
         rRCMm6/sQopHxPZbDy2Nsf0cXgB05xh3dcs4n47rn2PuQkds16tjOCIFtlCofp4E1QJO
         pUdEivieJJ5zG9fNXD3OYNAiJUEN/aNfVfW4KfMJK45zsfCjGlrgo5lFMbrxD3TWyuG9
         R7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747663375; x=1748268175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWHK376VyM/OI/YTUsa3tJsiwaElzvKB3NW3NOhpiiM=;
        b=N1Ya3ZFLdK2ABOIagIISWlNOKD94UDpyskSuoIsjwWpr+/vDsd8dRQ6Aln7+kpHJfF
         sQ+RFdTXz6m663mgOM4mAyZVi/wy3ulvGL+gK9XPPvrxp2LH5+jG2AgdV5UUrxJYUBQX
         pd8i3rPVEgGM063IjI0aJuviZDeDasreZ9KhkQIH+BoGUDLwrs3fBuFyfgvmvkknJ1EQ
         +8rLqxCPZjOkoCBsN5Pq/sTwke/9NVTeDVWi/NRlPWwhUS+NIbwTa02aMgvXtedWdMqo
         466hACFEZBZGYT+OeoZR/8Ju55UTXFEP8ApCDu0baleYi9frwyXyl8PseOlYUO1uHLvZ
         RC/A==
X-Forwarded-Encrypted: i=1; AJvYcCXNOcBZOdr3JTBo9Yx0wNDGvRIjVxsvwd26zeYDBy4SE7T508xWvYi07V3TzmBrbIuduBENIS7Rp9jaqoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Bya+dDMkYIJDlO/z956JtqDlO7L9iOeCo7pnl1+byjf7gjAy
	82IBLrLE/YVD/TqG3tajyF+qUYNzi7tExs8rhzz0bxBt4RSpsd4WwE6HDbA+Id8tMhg=
X-Gm-Gg: ASbGncvMssKiUZU1v5kwLqzMKfZ1gHYEBzWdDzurTTHR5QvsLLOMLWqJsVAh8yFc0fS
	fZzbCdmPNPvyFuQ3/jOgM7i702irmEw0GHZTWL2CtzB7iBHZGF7+9T0A+orkGU8rMcxRTg1Pzwr
	671VDQu5++Er9wJt39NOEHVQgD6UsRZl8s7YwfaXSZeUnZm65ZxRu1lw/+5uWldj48IQs9YiqJh
	Wluw+3S5sF/J42cx27kzGq1SzNsCIVlrGu11hz38wq+WPxZD/8L8hJBM573UHSPT18zThQQhyqJ
	trl7vgNSLOMMFk4=
X-Google-Smtp-Source: AGHT+IHgFSt1Ji7/vd8gjbKHf9/ZDkJicJQQ8h96um9tpOt5m+Et9jN1XlhPEUTYTozb2xYGapLzmg==
X-Received: by 2002:a05:6000:2482:b0:3a3:652d:1631 with SMTP id ffacd0b85a97d-3a3652d1856mr7082207f8f.16.1747663375211;
        Mon, 19 May 2025 07:02:55 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca4d230sm12787370f8f.4.2025.05.19.07.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:02:54 -0700 (PDT)
Date: Mon, 19 May 2025 16:02:51 +0200
From: Michal Hocko <mhocko@suse.com>
To: Bharat Agrawal <bharat.agrawal@ansys.com>
Cc: "hughd@google.com" <hughd@google.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"rientjes@google.com" <rientjes@google.com>,
	"zhangyiru3@huawei.com" <zhangyiru3@huawei.com>,
	"mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
	"liuzixian4@huawei.com" <liuzixian4@huawei.com>,
	"wuxu.wu@huawei.com" <wuxu.wu@huawei.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: mlock ulimits for SHM_HUGETLB
Message-ID: <aCs6C2vKbecx-boy@tiehlicka>
References: <SJ2PR01MB8345DF192742AC4DB3D2CBB78E9CA@SJ2PR01MB8345.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ2PR01MB8345DF192742AC4DB3D2CBB78E9CA@SJ2PR01MB8345.prod.exchangelabs.com>

Hi,
On Mon 19-05-25 10:21:17, Bharat Agrawal wrote:
> Hi all,
> 
> Could anyone please help comment on the risks associated with an
> application throwing the "Using mlock ulimits for SHM_HUGETLB is
> deprecated" message on RHEL 8.9 with 4.18.0-513.18.1.el8_9.x86_64
> Linux kernel?

This is not RHEL specific behavior. The current Linus tree has the same
warning which has been added by 
: commit 2584e517320bd48dc8d20e38a2621a2dbe58fade
: Author: Ravikiran G Thirumalai <kiran@scalex86.org>
: Date:   Tue Mar 31 15:21:26 2009 -0700
: 
:     mm: reintroduce and deprecate rlimit based access for SHM_HUGETLB
: 
:     Allow non root users with sufficient mlock rlimits to be able to allocate
:     hugetlb backed shm for now.  Deprecate this though.  This is being
:     deprecated because the mlock based rlimit checks for SHM_HUGETLB is not
:     consistent with mmap based huge page allocations.
: 
:     Signed-off-by: Ravikiran Thirumalai <kiran@scalex86.org>
:     Reviewed-by: Mel Gorman <mel@csn.ul.ie>
:     Cc: William Lee Irwin III <wli@holomorphy.com>
:     Cc: Adam Litke <agl@us.ibm.com>
:     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
:     Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

HTH
-- 
Michal Hocko
SUSE Labs
