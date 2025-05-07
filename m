Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA08228DB7D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640534; cv=none; b=E9BC9xcoGfNEjWP14pU5I4k3wo8knM1vQMs4DwS7hD6VXtZJWlEr+YVXilocsnwHOxU28nQgdMSpYwOW+iEknZ6b9DymcY0oGpoV3c5Z0TdTVRv9uc4WECnSVig+2bwUzc0pUt/Tm+MUxBpyQCDL36yK6QZgX1j0eQNXHlamVzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640534; c=relaxed/simple;
	bh=2yjqvg1WU1jwy46TAg8Ie2jB7YFcpI6yvblT1OwRSDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Syop2REmMhh0sCTWk4aA5Yhn32bGdlqtGbSRDxsKjkgZCmO++WiG0RhDN6WLsAWndKhFVj/uSXGDfvbzn1Ov4E4tnebmgxw7+JvGr/Fo3ZeMif3D6TjPKQIimS8pWJaUBbk4uN2b3aLyXluGMuLu+WciH5sx+gUH+qdrfOVQ8Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nLU7wq4Q; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nLU7wq4Q"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22e39fbad5fso15585ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746640532; x=1747245332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M5UyMF0lz7xhmrPifBK0SwWTEkKxLHvGU3lEBmsQ/lk=;
        b=nLU7wq4Qw8m2phxfTfQAmKHxmk/PBi9U4Kz0oTQ94Eaoy6gsMxEbGkzl7n+uhnVcs8
         5KNePmllx39MQ8WLawhzIidXrh42ybvXrH15aq0tNCrNiuFaD+MYfbX7xqxpB9IY4nwD
         q2Qu58iUMqRhiE7XQAUBExhZx/HrE6r4ODAMIKRVLUUGL9Bh/qGJimnQWxmO86mNW2Hh
         p1RsVNtSXupTNqED6xOWjCeF7Z5dj/TGizsJe8BIEUlrdzhlCR1SNIeDSUQJPZgZzfyq
         OnxWXCyah6osKtsmzTWJNuHSK2Crfo/+vHptqihMBVQYdbK0aFmFVE1r06jRLB1V4hH7
         5Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746640532; x=1747245332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5UyMF0lz7xhmrPifBK0SwWTEkKxLHvGU3lEBmsQ/lk=;
        b=eX3DgfVKNv6OzeH/9mqXUkw5JMrBuU9zoDn+A6oINkDkuvtTcdnsL82sD7YNB54N47
         nU2AbyfwAgAJnAllKTa4PDsGEArNtyw/LTRbJS5CPPH23GTD/YLlr5DcQqknyevygfd3
         /pbiAXhy8XdSi9anh3Wkcj/6vNreUanQJXtY0vTH6XUuvih1gyWHNCuUm8faXZk8l6ip
         OLIXAeAOygx5Q1qjkjtHyWWDjXHDUgkrSQZd+5Yb3nVwDs47m4rjMKbeHLXi0WmBEXtF
         Lnose/yjuKr7q+mF+o5494GeMgvp1HJ8tMfr8ct5ENG4Clodw3lYxca6i5hWqbh9Zn1P
         nI3w==
X-Forwarded-Encrypted: i=1; AJvYcCUcL9ky7Rv6JqmfS5dUDJeaJRXogpoePb2tiXtxWgF2sOhAiQ5CnTJrqzkinnR5GhVvWwR8zsJMNyhEtZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu88ojxGc9mplr/3dReJ5HNUOSDZ0oh5y3j5gCm+ew0esVzXfm
	b23STE6OP811gNYn95V6GIPBWT6H0m2uyY7P4obpu/7RLY6T/lyVFpQVx6E97A==
X-Gm-Gg: ASbGncvlCAxDkVK8SxWDrLIbiXdNNgtjHI3V634csO3JRn2Tj+yQELzXMfhx3R154+q
	HOFvZUS5wt7w0WkiVcnBMPNFG/DOSpAk7slysrZNBsxHUHHmXoCXNravqx+cx4yO7Cl2doYwFXq
	lEdSlwfSiZ2LfAMi1NxAmGxQQMrNOHH/kfruG4B5rhq1WyzOQs0t2R9LjT3X/0NnQFyf9RcKNFj
	DUiuNyWAtpc5hgls1MKV6eBWul3lxwDZIcPYDPmlwa/dBN2xc2Yfo/JhCpiY+CgRagba4uINsY8
	eYlCCmVmtiw+lJ8AmBMbHEVA01snYjF3loldiWT3niovsABeMNH3MACK8JSfygVRCjaRiU59y3F
	kEwSXJBIu
X-Google-Smtp-Source: AGHT+IFKJVG42Z0t5WGhpwZ+Cr3LZt4lFtqMG4tXP+ONkLN3fygx2dLRpldx7EugDDQaaH3giSthOg==
X-Received: by 2002:a17:902:c946:b0:223:37ec:63be with SMTP id d9443c01a7336-22ebf572798mr85555ad.4.1746640531580;
        Wed, 07 May 2025 10:55:31 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4fe239csm473357a91.32.2025.05.07.10.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:55:30 -0700 (PDT)
Date: Wed, 7 May 2025 17:55:25 +0000
From: Carlos Llamas <cmllamas@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Tiffany Yang <ynaffit@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 2/2] binder: Create safe versions of binder log files
Message-ID: <aBuejWpfghiB9f7-@google.com>
References: <20250505214306.3843294-4-ynaffit@google.com>
 <202505072254.2gHv8kgu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505072254.2gHv8kgu-lkp@intel.com>

On Wed, May 07, 2025 at 08:19:07PM +0800, kernel test robot wrote:
> Hi Tiffany,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on staging/staging-testing]
> [also build test WARNING on staging/staging-next staging/staging-linus linus/master v6.15-rc5 next-20250506]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Tiffany-Yang/binder-Create-safe-versions-of-binder-log-files/20250506-054556
> base:   staging/staging-testing
> patch link:    https://lore.kernel.org/r/20250505214306.3843294-4-ynaffit%40google.com
> patch subject: [PATCH v2 2/2] binder: Create safe versions of binder log files
> config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505072254.2gHv8kgu-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072254.2gHv8kgu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505072254.2gHv8kgu-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/android/binder.c: In function 'print_binder_work_ilocked':
> >> drivers/android/binder.c:6409:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     6409 |                            (void *)node->ptr, (void *)node->cookie);
>          |                            ^
>    drivers/android/binder.c:6409:47: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     6409 |                            (void *)node->ptr, (void *)node->cookie);
>          |                                               ^
>    drivers/android/binder.c: In function 'print_binder_node_nilocked':
>    drivers/android/binder.c:6487:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     6487 |                            (void *)node->ptr, (void *)node->cookie);
>          |                            ^
>    drivers/android/binder.c:6487:47: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     6487 |                            (void *)node->ptr, (void *)node->cookie);
>          |                                               ^

Oh right, this is silly. The reason is us _not_ using fixed-sized in our
uapi, which was unfortunate. In Android we don't have 32bit builds that
typedef 'binder_uinptr_t' to __u64 as we always pass -DBINDER_IPC_32BIT
for such cases. It is not the case outside of Android though, so this
needs a double explicit cast. :(

	#ifdef BINDER_IPC_32BIT
	typedef __u32 binder_size_t;
	typedef __u32 binder_uintptr_t;
	#else
	typedef __u64 binder_size_t;
	typedef __u64 binder_uintptr_t;
	#endif
