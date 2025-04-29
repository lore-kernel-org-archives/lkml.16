Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4EF25485F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950246; cv=none; b=NMzYacufdzkelksV74NkJ2AcIbYmxFf8zATgih+JZaBiqn+JwT+IUDBfw6mQgiQ9FtA0wr4mTgI4Xe/r3kQqHU4u6gthIrFRgsLgCYPvhcRGUDzioGthe+lWVYHuq5yzifrVCgcLAzlJMpFEBoJh7fxIR/9Ri18qNs9U6wIuTew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950246; c=relaxed/simple;
	bh=Ziulb9mMltIWQNEALJDPRlCWsnKPBKb9mm4o9Za3zo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N72clZUhQn7HJR9QBYLE4wXFEYIg2O+6aGNgBHlPEBHt6hWzdkAS0avJyBGw6sOvnsUv9I0jow8F06beEY8cMEKX+iVGZOJZacyHVkkIEN9GYu6HBQV7+yfNheynBCYc+IatenVEQvm1pfhzW+/aNKat4ajKVDY0vUrvvsbJvL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qGyu/E3f; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qGyu/E3f"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2242ac37caeso43285ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745950243; x=1746555043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ftw/IjMpgU7GPfLzcouQoWIfms9GOb854vnlNb5+taU=;
        b=qGyu/E3fthiFZeH93oRX/PX4jUwxbwTNQFN9rDwqn4UUhnO6idkhVsVvOq54Uqe/X5
         JqqeThXu0muKP/BvVDBSuAJw1O+L5ZXhVvcmzSfGa9ARMMQ9WDq1ok0nNNwqaOqK5Qe8
         0wQKbVLZa/WNb2LPjb1UAO2sELZt44MdlhDP+sFTQhkB8qnxbXamoo0rh7HhCOrEHFf+
         PAfpztp3a+GvKt4rRVipQPLagMsc43PP0tqYxafXsWbGZuMKcc/vYq4hejMRpy7gTpMB
         nGpsTTigmEli8jWVDyQE+qy3JfAs/cnipM8BCzvJG9cYO3K7Nky3ByqO8v6u0OQT6p6m
         JdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745950243; x=1746555043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ftw/IjMpgU7GPfLzcouQoWIfms9GOb854vnlNb5+taU=;
        b=N9dfmZIWruvLm1wKhzkQay2ABZG0HOmuN1n+wzuoZLSi4SQ0sqlnQ8+N+/HxgxBsFL
         OOWsb5MzD5H/RagxLv/mxvc0jaTXp7ILPHT5cv+2Fo1vE0UCG/BR/FZg9/4nlTwQXe8c
         s5LOcDkNZNwFbVVEgsmjOkdiW3fSJ4Rwbozv2P84Wj3ekLnrg73XKnlhDG58R84qsBlO
         jIA1ZQHAhf4iH5cmlpOZXjoXjaasXw5Loa0y6URw0D+geZI0hIr7dkxi54N3Un/Rr+X4
         DfKebRhP+rBofbtpsQWWBS5xMDTDvhBqnwxT7aD6/Rrv32EsGHKFwXksZEkyqtXPWsR0
         TIfA==
X-Forwarded-Encrypted: i=1; AJvYcCVh4IxvfSe83T4Ao7ZLySyzukm/Fo/d7ctTNYcyYh9tcPHG9vs8prcsUYwcF0dhGY4qZCGQ7HwmgK1toA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXYDmgmBjJEdpBjx/mtCX+OQsVv9h7lV8tBMete1yFhdLKtVXY
	ZwcIG5fHyRAH2Q2v3mK4rnA+qI1sE5MkBgFp7Uic3BbUfLpIDfmISCOMY/GoVw==
X-Gm-Gg: ASbGncu/dEwlXaI/+TIvSH6PgmRG7NOTmPApe7oJBBURUwPGtOezNVfrzBjkF9SR/ej
	G+gPpw5wPc+mfQc2ScyX16CdInWAFA1OIQiDIQWZFZP9sscnxSQp0Aqn4hLc0q9sAO3VDgMG+Rc
	FsNoH/O+fBnxBDFZRtMss7MY8YkhZrnDVhtfxIDz4lDiarg+aNPP7Ybbb15KQaoq0k5ZRC3A8x5
	zESRD1Rs5xKz0Wkm+EdRFnnWrGwBClIK/JhG8NPPcUzO2du9nQppW7xFDnlFATEfi+vGMzkEy5E
	fUGPT/o0gxC1Ix8B5ALywizZBWTHlNiKC7uyMH8uTQKu0LiTQAujwyOPnAYu160Kqb34i20x
X-Google-Smtp-Source: AGHT+IEGtuGPnrFdA7EnAS7AeHO3rAMJ1bXf2n0ATFrXiwa1CPLZUhde5Z8nusKLhSnrBiMW3CwVgA==
X-Received: by 2002:a17:902:d486:b0:224:38a:bd39 with SMTP id d9443c01a7336-22df406ab2dmr130415ad.20.1745950242565;
        Tue, 29 Apr 2025 11:10:42 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912efbsm10222670b3a.23.2025.04.29.11.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:10:42 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:10:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aBEWFw2wq40SHjTn@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <aA_0TV0RkVOHk7Qj@google.com>
 <aBAEuP9962XweHPc@Asurada-Nvidia>
 <aBCNkcLp6XZpjYYT@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBCNkcLp6XZpjYYT@google.com>

On Tue, Apr 29, 2025 at 08:28:01AM +0000, Pranjal Shrivastava wrote:
> On Mon, Apr 28, 2025 at 03:44:08PM -0700, Nicolin Chen wrote:
> > On Mon, Apr 28, 2025 at 09:34:05PM +0000, Pranjal Shrivastava wrote:
> > > On Fri, Apr 25, 2025 at 10:58:05PM -0700, Nicolin Chen wrote:
> [...] 
> > > IIUC, one vintf can have multiple lvcmdqs and looking at the series
> > > it looks like the vcmdq_alloc allocates a single lvcmdq. Is the plan to
> > > dedicate one lvcmdq to per VM? Which means VMs can share a vintf?
> > 
> > VINTF is a vSMMU instance per SMMU. Each VINTF can have multiple
> > LVCMDQs. Each vCMDQ is allocated per IOMMUFD_CMD_VCMDQ_ALLOC. In
> > other word, VM can issue multiple IOMMUFD_CMD_VCMDQ_ALLOC calls
> > for each VTINF/vSMMU.
> > 
> 
> Ack. I'm just wondering why would a single VM want more than one vCMDQ
> per vSMMU?
> [...]

I guess the only thing on this patch from me was to understand why
would a single VM want more than one vCMDQ per vSMMU? (Just curious to
know :) )

Apart from that,
Reviewed-by: Pranjal Shrivastava <praan@google.com>

> 
> > Thanks
> > Nicolin
> 

Thanks,
Praan
