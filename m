Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132022580CB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 05:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745386731; cv=none; b=K3jqXPj+oAGT80/5JSDOL0m0kEhdgUUnzAfQ2HJxCphcWR5fHsImpWl+eo8uV//kBOPRH5I/HatU8Nzqvo+jhvYLEtK6udyI6ODMDdzjG9BmW6AtK7cI4Q/lFGMcR/njZ1a/XZzlZaIrZKe80owk0viHmGVdHb9XI3qrdLYFd+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745386731; c=relaxed/simple;
	bh=VqjiVsUgDavc4EcC1HZnrZr1FyxyHXrwMTCOlnrM7Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nub1b9Sn5YNwHdayuOkzBJTmKL954/hpGz2KJ8dNESe4z5G4CgfyUpHJ+iJjq9zdb/3nLxHBKa9b+XwhgicgCNzwcn22rMeK1qqx6z//BRd7QhnJYSlmAWIXiZ8ciwaSsiqunPITj8ulPBcC37JI2NUu2k9cYixrV8T2wlqRz24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0BD4yzN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0BD4yzN"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ac9aea656so7530644f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745386726; x=1745991526; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UhDYN3CF9rLRAKM/r9oz1rE5oym2M8ZTGRvqaYVr2nQ=;
        b=o0BD4yzN4/Fh7kOToqCIhrY3IJjMrO1u2+XQlqYJesc96WH3TcQXB70v2a00onh2pW
         uhFGK/YVyB0wgO+Eor2Kvc1JQ3MG3+LhYgtbQk4W08Mrpp1LCMsfWpsm8LiHwg4HfdMH
         k3y/fox09Plw8fMfLZl8UW5rgZkggcx41M+7s9UYSKrq2g43THcjnbLG1DDpAxoG5rGR
         57Bi7h+o8ejiiTQqjrshC1LdT0/ebDLQh/LA44egA9bRS+6xRAqgpy1oS4P3AkZJUUqG
         OypXR49tOvrwefI0WP1X/0YUm+UDQt988Z3h20oe2YQYy3KHcAmLWDtliLG9Vpy/gh0y
         uHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745386726; x=1745991526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UhDYN3CF9rLRAKM/r9oz1rE5oym2M8ZTGRvqaYVr2nQ=;
        b=ldsHUUulAn3S5noz2xWMtrfq7ava46bPk0noBuf6fAiCYp8I4amWxP0ut5CyfcD95l
         Bg1U7tKLPlH/Y/gY40/SIXM4PCY9MSzISPSVNw4bwFlMOUP5Q7ADoqivKi4cKTsNy+wt
         hBLU/0CSm5djuqZZyspa3z1tnEhdE6f5JX68WgcDIDQqwOYSWieMNBbbE7sxGkWZNK7Z
         ebpLTsLTFbS8ucqiJXNm3xODNw3Enhk3gSs6R0MMu7iy6Tmieuc5bHUjYxUemnBb08yc
         O9zz6+bwmJVQ1v8XCdpvAeBkK5HtPJyh78vkmSUJfjeLEm1E0teqkNxkrCXwhRKZ3lml
         iDPw==
X-Forwarded-Encrypted: i=1; AJvYcCUhLcBbMBzBJRQh200jycaoDPMzjibJqtYfEv2u0QMFpFfwDN1nt5UNZyUk9lIcdydPULAKiIaw4O/ufwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpwhmjxHocaVBVmEBHUclltGs4CO+euNjk5uxzXOU9iQLFFOVs
	XxKFZhO/P141ZWLOYzxBpl7U9k/q6zcHDaGkG7YdERYn9XDJotDK8jL3iP7XuWQ=
X-Gm-Gg: ASbGncubzN/KB8G/c/mhiSZil4a2+PiMpphVEnM7v0cDkyIrvYERemCDIW+YmSMxgY3
	KBKnMlod21jmMCcP55mEdgwbZU5Yjp9QI3uAU2eHwCLUtSP+Jtp40LpoSn0e8YW49eYpObZwd8H
	MHdxs+nkSDzjDxrV2LCLST1Zzbr0k03dxrAGDr6zc3a9HXcaU96gEu7FvDh9GXjte6ONPrnezpw
	0ULemwiWY5DB2GvjnbsqfUIr0KBqXXLvUw8nLlaLznik4JuOU59wpfb+kbcfgXxCj/yXk1ohZaT
	FbE7ZBGeONNUZjjzHy6ti18Q/nHY9OoZyj+oEEnR9ZvCkg==
X-Google-Smtp-Source: AGHT+IGcspVXZAcwag6irceQMFNsXqq7Yshy5NJ8XuJJUj+Dz3fu1dCOyXWn3Bzyt34StqtqRvHlcw==
X-Received: by 2002:a05:6000:1862:b0:39e:f9e8:d07d with SMTP id ffacd0b85a97d-39efba3fe8fmr14038216f8f.20.1745386726423;
        Tue, 22 Apr 2025 22:38:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092d37332sm12282925e9.30.2025.04.22.22.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 22:38:45 -0700 (PDT)
Date: Wed, 23 Apr 2025 08:38:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	SeongJae Park <sj@kernel.org>, akpm@linux-foundation.org,
	damon@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mm/damon/sysfs-schemes: using kmalloc_array() and
 size_add()
Message-ID: <fd372c23-1bf7-4c93-a51d-ba5dad255b04@stanley.mountain>
References: <501ea9b1-017b-4517-8de4-7056803e7127@wanadoo.fr>
 <21407408-78e4-48eb-8296-fcddc702ae25@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21407408-78e4-48eb-8296-fcddc702ae25@nfschina.com>

On Wed, Apr 23, 2025 at 10:04:56AM +0800, Su Hui wrote:
> On 2025/4/23 02:50, Christophe JAILLET wrote:
> > Le 22/04/2025 à 20:23, SeongJae Park a écrit :
> > > On Tue, 22 Apr 2025 13:44:39 +0300 Dan Carpenter
> > > <dan.carpenter@linaro.org> wrote:
> > > 
> > > > On Tue, Apr 22, 2025 at 01:38:05PM +0300, Dan Carpenter wrote:
> > > > > On Mon, Apr 21, 2025 at 02:24:24PM +0800, Su Hui wrote:
> > > > > > It's safer to using kmalloc_array() and size_add() because it can
> > > > > > prevent possible overflow problem.
> > > > > > 
> > > > > > Signed-off-by: Su Hui <suhui@nfschina.com>
> > > [...]
> > > > > > --- a/mm/damon/sysfs-schemes.c
> > > > > > +++ b/mm/damon/sysfs-schemes.c
> > > > > > @@ -465,7 +465,8 @@ static ssize_t
> > > > > > memcg_path_store(struct kobject *kobj,
> > > > > >   {
> > > > > >       struct damon_sysfs_scheme_filter *filter = container_of(kobj,
> > > > > >               struct damon_sysfs_scheme_filter, kobj);
> > > > > > -    char *path = kmalloc(sizeof(*path) * (count + 1), GFP_KERNEL);
> > > > > > +    char *path = kmalloc_array(size_add(count, 1), sizeof(*path),
> > > > > > +                   GFP_KERNEL);
> > > > > 
> > > > > Count is clamped in rw_verify_area().
> > > > > 
> > > > > Smatch does a kind of ugly hack to handle rw_verify_area()
> > > > > which is that
> > > > > it says neither the count nor the pos can be more than 1G.
> > > > > And obviously
> > > > > files which are larger than 2GB exist but pretending they
> > > > > don't silences
> > > > > all these integer overflow warnings.
> > > > > 
> > > > 
> > > > Actually rw_verify_area() ensures that "pos + count" can't
> > > > overflow.  But
> > > > here we are multiplying.  Fortunately, we are multiplying by 1
> > > > so that's
> > > > safe and also count can't be larger than PAGE_SIZE here which is
> > > > safe as
> > > > well.
> > > 
> > > Thank you for adding these details, Dan.  I understand the
> > > size_add() change
> > > can make warnings slience, though it is not really fixing a real
> > > bug.  So I
> > > believe there is no action item to make a change to this patch.
> > > Maybe making
> > > the commit message more clarified can be helpful, though?
> > > 
> > > Please let me know if I'm misunderstanding your point and/or you
> > > want some
> > > changes.
> > 
> > As sizeof(*path) = 1, maybe, just change it to:
> >     char *path = kmalloc(count + 1, GFP_KERNEL);
> Maybe nothing should change?

Yeah.  No need to change.  Sysfs buffers are always a page size and
count is <= PAGE_SIZE.  Generally, it's one of the pieces of trivia
that people should know.  That's how sysfs_emit() works.

regards,
dan carpenter

