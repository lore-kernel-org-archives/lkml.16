Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A1284B5B;
	Tue, 22 Apr 2025 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332212; cv=none; b=SccXn9ofAvOy2eJKUNy80kGGI6/Her3UF4tuIK583Ai6M0vFeZxNFML5RGQYD13i5Q+ijSum4G3G8arYX+W3UsEM4tZZAGA16ks8HoLljudi00ypOe57vnHGIh9Wl7uj3RYj0mh6Iw1uLL4Vmvt9CpRMCbphG9Eo5p4qcMn49qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332212; c=relaxed/simple;
	bh=+y7IJ6oJ81inUlTVXWqiJFTsfRtk6YoOvQpBIitN+iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLpb3s7zUo7M3LRXlH2wRo/swvUJkGoX062wcji98QjY+57lPrYdFiNl7BfJAjCBVL7vNMVJYvi2UIIK/QnT2U6MkhBaZx96N8fdnGHIiOX9NTNbpkRmyIrAhIKMM5caM9fIW4XBrnEQcflUaoqFw7XVHk6u9b1+EeCwbmBK8M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgiE5/0z; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgiE5/0z"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f05acc13so67850786d6.2;
        Tue, 22 Apr 2025 07:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745332209; x=1745937009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkFPhMrpuv3o2hS9nuXgf57BGd6VBgXtGJLjxIp9TVM=;
        b=YgiE5/0zYZL3aJr/YSkTUML1o6fP+8g0Hpm5YLmXSmSadWoNDzlrrn++3XP1JdvDsM
         5qRh/c5ytHhLJQDixxeRCcG6BK2NjaO0HS9OCBhRwsWOhjNobSr4nY+3/T6SqgldhyYK
         eIszFK7g9i6EQ67ySm+FbQadfoN3VB10vPiebKwcRah/rnSOktAigHR+vcD/JtuOBmg8
         wDE1QtIXGztJkJztmTKcC7IvYutVJ1f+M/jgOd62I0lJOUFRmKHGRZJuyu2KdtRjvHXd
         tKN36i0LXeQ6crB4wXNo/6g0cyJSxXp3v7qf5hwkimeGDw4w2KT/dxQIHjodIH1dAZuj
         HUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332209; x=1745937009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkFPhMrpuv3o2hS9nuXgf57BGd6VBgXtGJLjxIp9TVM=;
        b=dfzS7JbkAqGWlnFjtWSXbqxtRihiBaRgD9rQ8v7jgI3u9a5Ub9VWzYj45+KLVmUltV
         huOLyuRwCJgrwH5WfwKpCBMDsoUedlJngOKQAHMLFVOs7hchP6ScNFCKy93Dgqvu7pRy
         XGunDu2796YwiLSqwdhjw0/cehzxUmwJheTR6rwzZGiORLR9na+jlLPshsI1hurQI8eZ
         k5eQW/EKtudKkUK64oVoSaYqYqlC0QLQ2oTL+Jtq+kMpSvd3A7BCUFuqmTn8ZayfotKO
         kv8B6y9Gy8IjNP3swJ15GCZ9SzH74pPJ2AfbJA5hv48r8Or46pVsGSBs6WjqrAIRTXAm
         Ns2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1bkfu5+kCmp273lAILsyO0cKDCcnHq1QPvpfNgEfzdiZzYIsvRcFYCKi5yqc1+S0zdt2bctoSW6zACHTAoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNb04A+YOmAQW4dxmEn9lQAQMgvlSJzQIjqbBo7dJbbd4wEwOr
	spSU99sTt/ESHeYHl0SA+0nOC09KH97t+KbD5kI0vbc/SvU/UECT
X-Gm-Gg: ASbGncvdKVLGfyRqeWkcXnx2v2IMG3lM9LI6bOsQF6IU225rqWF/7VrJ6mJABxxyntH
	chsZ0V53IGvifVA92gQWHjlPnRgUjyKj2FjZW4N4k779BCsz4OFbKEXm8la7fpMK7aD0/fvzcAB
	IDNczj5Zxw7+BWFCUHLrIs93N2X7hFLfhMt3cT+4dTtLQaWbJZQYFZpruJOcWTx2O8j38uTsYxH
	6FmgDYW/EeyVr2exIQjcFLWezU9vEHllM993iD7g4S0LTKIPIUHF1MASDDGl3vrXLOWZOw1tsAL
	ZuG6BRE8zpTrlLr0ID1FbxJohj8FxnqCf/9Tp7xRQ/5oPYE3aalazjNtocyw9QMYo3jpQeqEtgr
	HQXMFSytYMnuTKzy69yJwtELfbFeIrn7+6woi4StFqQ==
X-Google-Smtp-Source: AGHT+IFeKuOCzqrVCylUiW+uyw+dYVv8u7uEQTSWqxoE9i0ERqh1jHT4cVXCN/moN4fKJWWK1NjTOw==
X-Received: by 2002:a05:6214:daa:b0:6ea:d033:2855 with SMTP id 6a1803df08f44-6f2c4562e1bmr274050766d6.26.1745332208952;
        Tue, 22 Apr 2025 07:30:08 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c21c32sm58444886d6.110.2025.04.22.07.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:30:08 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 041381200066;
	Tue, 22 Apr 2025 10:30:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 22 Apr 2025 10:30:08 -0400
X-ME-Sender: <xms:76cHaDMpA5sIxYf0RIXX2tjKia38zYdq-N6WyIlCtAj_TgPjISXhAQ>
    <xme:76cHaN94VlQCsMniT-usLup25lr3p3b_8HEASMNkajZH6tzj2nFgwSl4eSAYzZJjW
    xcSXydRphzv8oigog>
X-ME-Received: <xmr:76cHaCQpXmCscN8_QY9wT6m7ElLkeJgIpnoN6wVb0Vyxlht9KCpbR9dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeffleejleehveelteeltedugffhhedvkefg
    vdehfeeiffeihfeigfdvtdeuhfdtteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpd
    hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqd
    eiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhl
    rdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhl
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehg
    rghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprh
    hothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhr
    ohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrghesshgrmhhsuhhnghdrtg
    homh
X-ME-Proxy: <xmx:76cHaHtIIQukvMG4Qvz-GiPrmxfThcF_PaC75IkrlySHx-zzQIrWOQ>
    <xmx:76cHaLci8ls9VLcKQjXL_oR6CmXcjuwbYwUFBC0jArEkGLul_0fFdQ>
    <xmx:76cHaD3O4-RPopVdGjVFe6D8_KDQPdeaSBdyuX1p1VH2jtmlghaeYQ>
    <xmx:76cHaH8vI5mT-d1FLt0g2_gMp64Q2P_vMpSMeyDECgkeewxqpTbN0g>
    <xmx:76cHaO8fbMTUZpaomcAOzodT3a4sxN6fUrke8IVOG-3O4RqUCJ-jSvWI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Apr 2025 10:30:06 -0400 (EDT)
Date: Tue, 22 Apr 2025 07:30:05 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com
Subject: Re: [PATCH v2 0/2] add Rust version of might_sleep()
Message-ID: <aAen7fQYciq2azi9@Mac.home>
References: <20250410225623.152616-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410225623.152616-1-fujita.tomonori@gmail.com>

On Fri, Apr 11, 2025 at 07:56:21AM +0900, FUJITA Tomonori wrote:
> This patchset adds Rust version of might_sleep().
> 
> These patches were previously part of the IO polling patchset [1], but
> they were split out to make upstreaming easier.
> 
> The first patch is for sched/core, which adds
> __might_sleep_precision(), rust friendly version of __might_sleep(),
> which takes a pointer to a string with the length instead of a
> null-terminated string. Rust's core::panic::Location::file(), which
> gives the file name of a caller, doesn't provide a null-terminated
> string. __might_sleep_precision() uses a precision specifier in the
> printk format, which specifies the length of a string; a string
> doesn't need to be a null-terminated. Providing a null-terminated
> string for better C interoperability is under discussion [2].
> 
> The second patch adds a Rust implementation of might_sleep(), on top
> of the changes in the first patch.
> 
> [1]: https://lore.kernel.org/lkml/20250220070611.214262-1-fujita.tomonori@gmail.com/
> [2]: https://github.com/rust-lang/libs-team/issues/466
> 
> v2:
> - improve SAFETY comment
> v1: https://lore.kernel.org/lkml/20250406110718.126146-1-fujita.tomonori@gmail.com/
> 

@scheduler, if there is no objection, I'm going to take these two into a
pull request to tip soon. Thanks!

Regards,
Boqun

> FUJITA Tomonori (2):
>   sched/core: Add __might_sleep_precision()
>   rust: task: add Rust version of might_sleep()
> 
>  include/linux/kernel.h |  2 ++
>  kernel/sched/core.c    | 62 ++++++++++++++++++++++++++++--------------
>  rust/helpers/task.c    |  6 ++++
>  rust/kernel/task.rs    | 28 +++++++++++++++++++
>  4 files changed, 77 insertions(+), 21 deletions(-)
> 
> 
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> -- 
> 2.43.0
> 
> 
