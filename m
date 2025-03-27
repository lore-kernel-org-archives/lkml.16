Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF321140E30
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089559; cv=none; b=QAoDkCWyT8RwcH60ZFP4vWMFlFcllB2LPYVyqSh+yU2AyHudYWWZHJilMtVhncT+27wgAifr5hmQoB+WcOtiSDAm+TyxSTfQ76bNkkf/TpyaltQu0wAmBUhRZ/grMCMnK62+mNMZyT0G+C9CuMphfu+/9ZZ4C0zyTXdwPx5UeNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089559; c=relaxed/simple;
	bh=3G+HuaERos+QiAvljI/OgjMTC2Cp773SoX79nktQ2P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKRHYmTkdwgTiRuNuc7dA3UPjxXuyuNXmQHmCkvjPdz43bjTiCuTIDpL5Zv3D8zKvPXTyF7ZnBDutFk1RUtvEYQn7hnqE+1KUoTOCPqFnHBEe/rEcU4gxNloAESOshYwo+5EpVJguRVU53SdxkmT6Kxw93Y+nQUrxQ2AHsngrr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=HHuSmZTy; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="HHuSmZTy"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227d6b530d8so23423435ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1743089557; x=1743694357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DyP4Gwd6LgeuTmywr8hPhevtaEC/wP51zCVtswndJ/o=;
        b=HHuSmZTyS1CBIbBEnaDDGCfh0SeuzTEeQ8XOr4XZtYS1wWBQThAFAfOJdqP4t2n0rw
         hH+UWXSLP/WxBDzeNAbfMCzWGu5W/4aOu3DDuB9KSqerEj77R3G1/0kAUcuhbq/Jpqti
         JPgBkczfQAsg9TeHZQEdTI7u3gnY7uk12CTJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743089557; x=1743694357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyP4Gwd6LgeuTmywr8hPhevtaEC/wP51zCVtswndJ/o=;
        b=KJoD3Onlk0gDkEYE0kr6OyE2EcaPp1igG3FBKZP1e/aQb/cj8hz8C62YD6SQFctHes
         /GlRyLGH1MRP95P449pLPLjmUdUlxWP7IGfXvvGKRw2dbDrRxs4zcn1Nsp1Z67fHqYS9
         geiXkThlI9R5UYqqvoKTkuH6C/+QrX/z4AVlvC/SPSruBQ1TRpdh90LLzgymhmhocOVO
         cZPBbcchjBu6MJMCYIHhd/uQ0UW8jAb08bJ3mjXV/wY1JCAeNzh5b0ZlCCManQctIqFz
         q8hw2kZlwJ97uMbYrIcg/g4F7AILe9GJbbfssIsS3wGstewDeeQtbEi8ugOfrq82rVna
         7ADA==
X-Forwarded-Encrypted: i=1; AJvYcCXql5R/YDW3afdlOqwOakhjWUvxlsEbMc/yZJEcvcpFUY478wYN+FYFmVpb5+TYIdCVJo5+G0Vg/ShbICE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEbAPZbrUlzptLkHuSyB1RwwH20SqKc3nbG+dRup2QACNPiyJ6
	aRtX7ac5EP8TM0oDJRuOHepLSsPWLJ5DkBlhsRPk5KIv6JnsebAcaqbC71pr6V4=
X-Gm-Gg: ASbGncsubRNFxAuUqd4siiZ9zxBQ7J6zrDafqjQi76xoCHFCZVpf9VKzNECxfQSdmzs
	FUQVTSiXpPdloBtAqGLMZW5JGhpVqnqpwNAIa0dxaN0eUbunc8pgNC24Tlc92k1HDlrNiKQW9mD
	bwgdNQSQjCntnXWwG8CRd4T4EYUGAzxv18VbXfQPZspHM7dPBgeE0IOXCI9FM5pud2rHQ4rMOaY
	DF8C+BQGF6uFHYKgHzpxe+ZjKTJlFsJPsgVmxhFR95KDx91CGOuJGQeIG5V7HXaVT2i6xTydPZn
	hHW0/ZzM6JPTAqwoFmTJD6S6sfce6VZhYVzjp6/ClKFVFqY1Dmqnc/WLPa7qJDrVmHt8QQT7sgk
	y
X-Google-Smtp-Source: AGHT+IGWEAbgujzSA6nTHHUfIbzw+41dKReOpBxMtnnAJXi16HPvU6coZl9s4b3neOdk85PkywboNw==
X-Received: by 2002:a17:902:d4c5:b0:221:7eae:163b with SMTP id d9443c01a7336-2280493c9e1mr65257895ad.46.1743089557102;
        Thu, 27 Mar 2025 08:32:37 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f7cc2sm711265ad.258.2025.03.27.08.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:32:36 -0700 (PDT)
Date: Fri, 28 Mar 2025 00:32:32 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Mark Harmstone <maharmstone@fb.com>, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 6.14] btrfs: ioctl: error on fixed buffer flag for
 io-uring cmd
Message-ID: <Z-VvkDUUWLSqJ1tM@sidongui-MacBookPro.local>
References: <20250326155736.611445-1-sidong.yang@furiosa.ai>
 <411a996d-8e47-4b30-8782-4418cf701f69@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <411a996d-8e47-4b30-8782-4418cf701f69@gmail.com>

On Thu, Mar 27, 2025 at 02:58:11PM +0000, Pavel Begunkov wrote:
> On 3/26/25 15:57, Sidong Yang wrote:
> > Currently, the io-uring fixed buffer cmd flag is silently dismissed,
> > even though it does not work. This patch returns an error when the flag
> > is set, making it clear that operation is not supported.
> 
> IIRC, the feature where you use the flag hasn't been merged
> yet and is targeting 6.16. In this case you need to send this
> patch for 6.15, and once merged stable will try to pick it up
> from there.

Thanks, I mistakenly thought the feature would be merged in 6.15. If so,
I need send this for 6.15 after sending the patch for the fixed buffer feature.

> 
> > Fixes: 34310c442e17 ("btrfs: add io_uring command for encoded reads (ENCODED_READ ioctl)")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> > ---
> >   fs/btrfs/ioctl.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> > index 6c18bad53cd3..62bb9e11e8d6 100644
> > --- a/fs/btrfs/ioctl.c
> > +++ b/fs/btrfs/ioctl.c
> > @@ -4823,6 +4823,12 @@ static int btrfs_uring_encoded_read(struct io_uring_cmd *cmd, unsigned int issue
> >   		ret = -EPERM;
> >   		goto out_acct;
> >   	}
> > +
> > +	if (cmd->flags & IORING_URING_CMD_FIXED) {
> > +		ret = -EOPNOTSUPP;
> > +		goto out_acct;
> > +	}
> > +
> >   	file = cmd->file;
> >   	inode = BTRFS_I(file->f_inode);
> >   	fs_info = inode->root->fs_info;
> > @@ -4959,6 +4965,11 @@ static int btrfs_uring_encoded_write(struct io_uring_cmd *cmd, unsigned int issu
> >   		goto out_acct;
> >   	}
> > +	if (cmd->flags & IORING_URING_CMD_FIXED) {
> > +		ret = -EOPNOTSUPP;
> > +		goto out_acct;
> > +	}
> > +
> >   	file = cmd->file;
> >   	sqe_addr = u64_to_user_ptr(READ_ONCE(cmd->sqe->addr));
> 
> -- 
> Pavel Begunkov
> 
