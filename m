Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912F31DF258
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749812371; cv=none; b=dHn/6yHYHZqhInAL3htWX1G+UTSQknom/pjdKTuKsOj+lpLQ3Ug+Ys7yV38xRCzUUJ/N47Zi3e6bAanSoU+LXSqN1EvFf61lAaP8ZR8P2EQJnV4lemPIcEOMolRLFjylIUlzYsHb4FNB4NiBmGVjl8hwpTWCApCJ6kLTAHuMZ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749812371; c=relaxed/simple;
	bh=XFy/8yfk7JZ4RyFHEQ/BD+L/128e1XOOKof/uk2gf9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCUZ3EGfS/TOE/fOrAne7MtU6cBFJw4lQL4oEf6xMZEbkNY0qnAyekO1626gN2fVJz9Rdai5KI829Ly728Pd/KZqcKFWadSALmDfVd6lHThnH7snmjFijcN7mbZMV1VONLusboVs8fTq94bfiezW0tyKcmVhrh6CzjynDQWPNO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=O0ooJviV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="O0ooJviV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so1216788f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749812368; x=1750417168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2yjABFEbFdOl3Pms6BvnmQIRa8WXGUA0GBCflTCpoZY=;
        b=O0ooJviVkR7i4kQanM9nCy5Qr6ni7Bd3Ztgf5G/oIpqQ5y8Hu1uVS0O8vuReu4MryH
         FbYR3KoEmtgu8TNKwl65DBAXTFpw2ZMXKTgec4JN/xnEPDDjJzrPlDKdpOWpVawmG/fS
         MMA/nRtYEcNuDYjpCZduqtGQchLWJm3mAo3TjSFSzElTJW/nM4hVUWHFeSMULyzkZ/lf
         bOofgd2yWurpOcmlfjiOlhE+c7hAKfMKA1OKtbyqBfBhHzT+V68gYqbO7bE1kA15zZJ5
         FwLZxMencaIaBfGT7/vJZA/1B/nsTpPMhLdFGISZR+4R8osrliN9/OZgJnCews1HLTqK
         zDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749812368; x=1750417168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yjABFEbFdOl3Pms6BvnmQIRa8WXGUA0GBCflTCpoZY=;
        b=iXwrnm9mqO+cJZ7aDE4l9Mj7KD705ucjcOws5G3iUPxUMQuITObThHbY+GwDId3Ng6
         GD+Ld3xbx7zLtZa16tuzUS+fIALdql6ZqhZPcX/FMWfXDc9dV+Ud8abXWqRB8omSGjzW
         A9jAIJTigkibKyi8OigCwteTn4sDsaTZavXAd5yLTqPi11Z2A/v29s7Kjy6LVrhnLfIC
         wNPmVes8uE2vFW+a4VBoH6L8WfVkeU0pxb4MNFCfBEULX8jWZNormOetbb0D8LUYi24L
         Caz1wHBZynQ3A7eQD6mk/Ds67KYMGYs80iWscEGZHAiMEOKanY9nP82WUfnSbPJOCxqX
         JOTA==
X-Gm-Message-State: AOJu0Yy0kmLGt6AcfvAtiIFjDLTIKM+RnWdrKTUe7+huu+WMJdhnj79o
	78i3DUvuDZS98oEuvGhntjQr0X9mSY7qmjpHwcOGyeu6EMkO7dS+7tppr5vVNTEXZw==
X-Gm-Gg: ASbGncumSzguF9AeRKUZGtt09FSaGY9eEn4wLsCZ1S+PPOaU81JhmTkSul0ciSWjCUB
	XfZeq1US4MBuC0j/HwCqOdVnZ4jOpyBh+MsOngmvt9ZjSnyIoYV5zSgg74VVl2LxP1XFibjtYG4
	lGwCUw56WJpcxR3m+s/P6jdXIvF1dzMTjfmAPRoLY5lGd/VfMYO6F/0hb9xbY5Jg7ev96GgZYh4
	K2v8uvLqZtEavVrMatCodHOBYwhZGhyAnqvlziLQYTM3e42WkaROf7tJ1R5ABAf9kEBAmT5np0Z
	L4k5LaQH9+wmJgYJ7FBqt0sLP3hFjb5JHMKz2BvyhWi84TiRuuDA4zBTN+3HPg==
X-Google-Smtp-Source: AGHT+IF2edISGBsvo7+crxR1N8tb3F5pUWE6nOeqlDrNKfzDvaZa+ADQzmNdG8SwkT8+I/FBnJncCw==
X-Received: by 2002:a05:6000:4012:b0:3a5:2cb5:6429 with SMTP id ffacd0b85a97d-3a56877f0fbmr2617997f8f.43.1749812367854;
        Fri, 13 Jun 2025 03:59:27 -0700 (PDT)
Received: from MiWiFi-CR6608-srv ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ce947sm1285463b3a.156.2025.06.13.03.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 03:59:27 -0700 (PDT)
Date: Fri, 13 Jun 2025 18:59:05 -0400
From: Wei Gao <wegao@suse.com>
To: Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org
Subject: Re: [PATCH v2] ext2: Handle fiemap on empty files to prevent EINVAL
Message-ID: <aEytOcFNAI7ZcxzM@MiWiFi-CR6608-srv>
References: <20250612142855.2678267-1-wegao@suse.com>
 <20250613152402.3432135-1-wegao@suse.com>
 <mxios5pbq3vq5267on4vnt5siozd4nap5w7wemsd2vlxoooexd@ia2ezhdu7ujq>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mxios5pbq3vq5267on4vnt5siozd4nap5w7wemsd2vlxoooexd@ia2ezhdu7ujq>

On Fri, Jun 13, 2025 at 11:42:17AM +0200, Jan Kara wrote:
> On Fri 13-06-25 11:18:38, Wei Gao wrote:
> > Previously, ext2_fiemap would unconditionally apply "len = min_t(u64, len,
> > i_size_read(inode));", When inode->i_size was 0 (for an empty file), this
> > would reduce the requested len to 0. Passing len = 0 to iomap_fiemap could
> > then result in an -EINVAL error, even for valid queries on empty files.
> > 
> > Link: https://github.com/linux-test-project/ltp/issues/1246
> > Signed-off-by: Wei Gao <wegao@suse.com>
> 
> ...
> 
> > diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
> > index 30f8201c155f..591db2b4390a 100644
> > --- a/fs/ext2/inode.c
> > +++ b/fs/ext2/inode.c
> > @@ -895,9 +895,15 @@ int ext2_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
> >  		u64 start, u64 len)
> >  {
> >  	int ret;
> > +	u64 i_size;
> >  
> >  	inode_lock(inode);
> > -	len = min_t(u64, len, i_size_read(inode));
> > +
> > +	i_size = i_size_read(inode);
> > +
> > +	if (i_size > 0)
> > +		len = min_t(u64, len, i_size_read(inode));
> 
> 
> Thanks! This would actually lead to excessively slow fiemap for 0-length
> files. So what I've ended up with is attached modification of your patch.
Thank you for your patient review, I really appreciate it. 

BTW i have stupid question:
Where can I see the real-time status of this patch? such as whether it has been merged?
I have checked https://patchwork.kernel.org/project/linux-fsdevel/list/
but do not find current patch, maybe this patch need specific sent it to
linux-fsdevel@vger.kernel.org? I just get maillist through scripts/get_maintainer.pl but
mail list not contain linux-fsdevel@vger.kernel.org.

> 
> > +
> >  	ret = iomap_fiemap(inode, fieinfo, start, len, &ext2_iomap_ops);
> >  	inode_unlock(inode);
> >  
> > -- 
> > 2.49.0
> > 
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
> ---
> 
> From a099b09a3342a0b28ea330e405501b5b4d0424b4 Mon Sep 17 00:00:00 2001
> From: Wei Gao <wegao@suse.com>
> Date: Fri, 13 Jun 2025 11:18:38 -0400
> Subject: [PATCH] ext2: Handle fiemap on empty files to prevent EINVAL
> 
> Previously, ext2_fiemap would unconditionally apply "len = min_t(u64, len,
> i_size_read(inode));", When inode->i_size was 0 (for an empty file), this
> would reduce the requested len to 0. Passing len = 0 to iomap_fiemap could
> then result in an -EINVAL error, even for valid queries on empty files.
> 
> Link: https://github.com/linux-test-project/ltp/issues/1246
> Signed-off-by: Wei Gao <wegao@suse.com>
> Signed-off-by: Jan Kara <jack@suse.cz>
> Link: https://patch.msgid.link/20250613152402.3432135-1-wegao@suse.com
> ---
>  fs/ext2/inode.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
> index 30f8201c155f..177b1f852b63 100644
> --- a/fs/ext2/inode.c
> +++ b/fs/ext2/inode.c
> @@ -895,9 +895,19 @@ int ext2_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		u64 start, u64 len)
>  {
>  	int ret;
> +	loff_t i_size;
>  
>  	inode_lock(inode);
> -	len = min_t(u64, len, i_size_read(inode));
> +	i_size = i_size_read(inode);
> +	/*
> +	 * iomap_fiemap() returns EINVAL for 0 length. Make sure we don't trim
> +	 * length to 0 but still trim the range as much as possible since
> +	 * ext2_get_blocks() iterates unmapped space block by block which is
> +	 * slow.
> +	 */
> +	if (i_size == 0)
> +		i_size = 1;
> +	len = min_t(u64, len, i_size);
>  	ret = iomap_fiemap(inode, fieinfo, start, len, &ext2_iomap_ops);
>  	inode_unlock(inode);
>  
> -- 
> 2.43.0
> 
