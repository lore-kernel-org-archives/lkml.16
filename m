Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD2424B28
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738312384; cv=none; b=P6/IyfABWhrt7VvjMKvo3+qma8kHqQF1hvjyInd4Ni2oq1xYozXTVeigdYugZ/Ri/U3inVJo12tArM4EN4cTeZMNb8oI7nk3Xo+ehco4b9X70By1k3mMTOa45r+9OwaEdMtkXfZ1Ju+CxMSjqjIAyhTLNwQKNznkLq7n9AXFbqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738312384; c=relaxed/simple;
	bh=sdw8l8+NwkV6INk3+hpf0YRFmqr5W8dwp/CmE3pzgZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQiy7CARsfEo1qTSTw6sIefwHQehkH9izTcf2Y+sLAzOGjWdCK1UYlnQijo+HB+hTyB9qVM5tD+OB7p1L8bC7weQhyYgmMvOHNQAfptOz++9ntU/oJQod73haQi5U/rm3yFzzq7NmI6Q5Hz5FBA/x1rciFGm9W4BsYLBAbK3/zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oCjnKWSn; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oCjnKWSn"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaec111762bso439409366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738312380; x=1738917180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=egqRvUyLfakli10+ggYKvwxMdmYV8I7LQkQH/AIbN90=;
        b=oCjnKWSnw0xz3XdYd0AUlrrzmdINHwwUmy5LAVsB5tzVjuacFz7dBVgD8ARiDae1Uu
         b3tHfbI+ODwOE+ua8eQOWJg+KjVFVLx5ebHS6ldiAXX+i2HZvrdft4cVkv/8McyjOQ9J
         3a/lEG5AvYvSaUcKXJ+mn0ylCDkjoJ0PfMIYVJfPjIvj4+hH37cEW/sJcaCoXK+CY4ZI
         /73I8f4Kr9VCVMD46DfqkLzv855mSo0ucs0sNk78EQKQ9HpyByYx9U0yyOfKJIWZ5jcK
         eHIZtKqnYl5jyVcow/euGp/iwowUSRh4tUI5sO+hF1mTLKuma00FEfsZEpb1S9GnnEy/
         eVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738312380; x=1738917180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egqRvUyLfakli10+ggYKvwxMdmYV8I7LQkQH/AIbN90=;
        b=PPkbVcCWpXZHa4H849g8VbjhguDBu/ZiMt79vOrMe6ruPnNiOlRnir9m1/BD0DFatJ
         cl/yd3lEHRD+i6nPGbQ4CylF/UzZjoazMdvdkXKjDEoJ+Mv0qfvXEBggK0Ula7s2Rog+
         dzDDIP6ESVrD9mTIQ/T98A9jW+uP+++g02RO6a8Fdn0T7uUpFFf7lV27+6A3G+SvCqY6
         I1z6u24giZCMNdd8QuZ/ZXzSx4V8NLRsDODVnDZlcIm2/JocZkAPmht4vOLF4KVPtPwF
         jR3ul1WlGD+67LmFRgsQ400ILhHLvXZSfHQZazst8mEFESUm43dubZ4TY4LEGvIA0DoG
         3EgA==
X-Forwarded-Encrypted: i=1; AJvYcCU0FGDY1Ul8WH4+zdGQYnzxOnq7syGBo3owMy5xHJjjpDx4/zpco1bYWuhVc4gl/lKPk9uXR+9Qkznxwio=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvHgIBaL38DIer66w/LbIPn5Pk1V1U33e+p1fG8qBkhzUUHe1M
	O43nxlc16VwtEUwoizpbmG4tU3UzsQ1BrVm1OSwQGGbdF131zwTazDlma8LVGQ==
X-Gm-Gg: ASbGncvNPF93SMESvVsAaCT4MSNaMnQLT4l5IeWKHIRnRvbDSx4AeZvqe7XlFmbB1Ub
	w8whf3uitoehHAS4ikQZQ14XO+P1RtTjzoz+iRR/jTftQHc+f4kcRcd03M6hB4hs74xfff/Z6gw
	4to53tIbLdhyxSxd8dsU7HlgBm17Bc1IpdFeTHcqaZsOtfb7c6qqqOshgi+JSQNGrBf3zgSEgDq
	HxxRQhZt1lszOsCYg/BBhHaB8oyfROrybf7YdfMXQC6txYvpZPWbXiJ3H59n+gjjKYE6HcEvcaE
	H2VczhQjd1+OoflvxJrLQz+OS6If1Ap5E54vcz9qtsQbj7MrpKRcDfBYJQ==
X-Google-Smtp-Source: AGHT+IFEGaNvReG5vJZPY7iYHQObTDw/0zJqyBDYrLORPticbg6pyTqk9VcPWTbvbKqoh+zEKTKFpg==
X-Received: by 2002:a17:907:7fa6:b0:ab6:b848:2ab with SMTP id a640c23a62f3a-ab6cfcdf2a3mr922586166b.16.1738312380051;
        Fri, 31 Jan 2025 00:33:00 -0800 (PST)
Received: from google.com (201.31.90.34.bc.googleusercontent.com. [34.90.31.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5635bsm253140566b.164.2025.01.31.00.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 00:32:59 -0800 (PST)
Date: Fri, 31 Jan 2025 08:32:55 +0000
From: Matt Bobrowski <mattbobrowski@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Song Liu <song@kernel.org>, bpf@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, kernel-team@meta.com,
	andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org,
	daniel@iogearbox.net, martin.lau@linux.dev, viro@zeniv.linux.org.uk,
	jack@suse.cz, kpsingh@kernel.org, liamwisehart@meta.com,
	shankaran@meta.com
Subject: Re: [PATCH v11 bpf-next 1/7] fs/xattr: bpf: Introduce security.bpf.
 xattr name prefix
Message-ID: <Z5yKtyJN3xLQRUNH@google.com>
References: <20250129205957.2457655-1-song@kernel.org>
 <20250129205957.2457655-2-song@kernel.org>
 <Z5tbH13qK6rLJVUI@google.com>
 <20250130-erklimmen-erstversorgung-93daf77c9dc4@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130-erklimmen-erstversorgung-93daf77c9dc4@brauner>

On Thu, Jan 30, 2025 at 04:20:04PM +0100, Christian Brauner wrote:
> On Thu, Jan 30, 2025 at 10:57:35AM +0000, Matt Bobrowski wrote:
> > On Wed, Jan 29, 2025 at 12:59:51PM -0800, Song Liu wrote:
> > > Introduct new xattr name prefix security.bpf., and enable reading these
> > > xattrs from bpf kfuncs bpf_get_[file|dentry]_xattr().
> > > 
> > > As we are on it, correct the comments for return value of
> > > bpf_get_[file|dentry]_xattr(), i.e. return length the xattr value on
> > > success.
> > 
> > Reviewed-by: Matt Bobrowski <mattbobrowski@google.com>
> > 
> > > Signed-off-by: Song Liu <song@kernel.org>
> > > Acked-by: Christian Brauner <brauner@kernel.org>
> > > Reviewed-by: Jan Kara <jack@suse.cz>
> > > ---
> > >  fs/bpf_fs_kfuncs.c         | 19 ++++++++++++++-----
> > >  include/uapi/linux/xattr.h |  4 ++++
> > >  2 files changed, 18 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/fs/bpf_fs_kfuncs.c b/fs/bpf_fs_kfuncs.c
> > > index 3fe9f59ef867..8a65184c8c2c 100644
> > > --- a/fs/bpf_fs_kfuncs.c
> > > +++ b/fs/bpf_fs_kfuncs.c
> > > @@ -93,6 +93,11 @@ __bpf_kfunc int bpf_path_d_path(struct path *path, char *buf, size_t buf__sz)
> > >  	return len;
> > >  }
> > >  
> > > +static bool match_security_bpf_prefix(const char *name__str)
> > > +{
> > > +	return !strncmp(name__str, XATTR_NAME_BPF_LSM, XATTR_NAME_BPF_LSM_LEN);
> > > +}
> > 
> > I think this can also just be match_xattr_prefix(const char
> > *name__str, const char *prefix, size_t len) such that we can do the
> > same checks for aribitrary xattr prefixes i.e. XATTR_USER_PREFIX,
> > XATTR_NAME_BPF_LSM.
> > 
> > >  /**
> > >   * bpf_get_dentry_xattr - get xattr of a dentry
> > >   * @dentry: dentry to get xattr from
> > > @@ -101,9 +106,10 @@ __bpf_kfunc int bpf_path_d_path(struct path *path, char *buf, size_t buf__sz)
> > >   *
> > >   * Get xattr *name__str* of *dentry* and store the output in *value_ptr*.
> > >   *
> > > - * For security reasons, only *name__str* with prefix "user." is allowed.
> > > + * For security reasons, only *name__str* with prefix "user." or
> >       	  	   	    	 	     	  ^ prefixes
> > 						  
> > > + * "security.bpf." is allowed.
> >                       ^ are
> > 
> > Out of curiosity, what is the security reasoning here? This isn't
> > obvious to me, and I'd like to understand this better. Is it simply
> > frowned upon to read arbitrary xattr values from the context of a BPF
> > LSM program, or has it got something to do with the backing xattr
> > handler that ends up being called once we step into __vfs_getxattr()
> > and such?  Also, just so that it's clear, I don't have anything
> > against this allow listing approach either, I just genuinely don't
> > understand the security implications.
> 
> I've explained this at lenghts in multiple threads. The gist is various
> xattrs require you to have access to properties that are carried by
> objects you don't have access to (e.g., the mount) or can't guarantee
> that you're in the correct context and interpreting those xattrs without
> this information is either meaningless or actively wrong.

Oh, right, I see. Thank you Christian!
