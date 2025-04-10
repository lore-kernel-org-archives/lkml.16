Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72C9293464
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744318396; cv=none; b=PvIDfn7IHvcVee8a2bY8YgHqSMbhptdn9aRXzXlltmaXOpp9hQdvuT1eY0foeaIKwM38MZ4wGyO7F+twXj2Cx1Ugq5MtUO3yb+TwXLYRR7ZPLSZiMqBvdhkJ3fyoHhxtYaY3I78SPIhbZrPs7ZZOXwFwYkO0R287yEicA2GQgCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744318396; c=relaxed/simple;
	bh=KLdbRIuZPNOkZ83SLyNd96nyrVtgiovdhJl3oFVHWNM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJQ4G4vUJPcscehv9tGxrV47l9Qp2sAuencfq31da5CK4fcxRhCl6H2S8ODNrYT26hE5oUzhbvLa1fUETV0zP595rWA/du3RwGA9NggCYWmvH4yKc2K01lIXDd1jfCqJlGopZCJw9W2UylYfz65Ff9zS8tuPMACDoIEpyRAFJJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtNIl/C2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtNIl/C2"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1efc4577so697685f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744318393; x=1744923193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6Y88nCpCByqh57KqElWwwc/R0n7e7vwOFEt/7pFPgk=;
        b=JtNIl/C26YNWiTq/LINNaTxrFqDEGBl9GTRh77ZPsRJt2ZcwAzgfMcjgEvHDxKFVXb
         I02VDUog4OOMkOql10k9t2WUjrKskRa/1vYPoyQ2ZuPC+gXD+Md+3VXjO6kF8OcbHdFl
         XHBRU1S8F4UKZXkqGvSap8ewqAUhcCRu7nENiK6z1xpl+Kkx94U+x6h5CEI9iUpiGI0v
         lMeXUZOjRyZZMZrXvQ/gyIR1ExquTSJ/gjUzUV2DpXadLG4B+Tkc4us0NMYQPeWA3X1+
         oCKZBDNTwFMn6pp5FkpkjFhfUc1Uf00yq9+Sdrp75GPtFOFscTYY+FuHJWzDQvM8IHau
         Zf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744318393; x=1744923193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6Y88nCpCByqh57KqElWwwc/R0n7e7vwOFEt/7pFPgk=;
        b=w8M2y5e8QmT1jHhx2IRmVQIehaZ07NZ+V7L+J450y+AOPLeyQNfHSxu6HnQtoBlOdV
         zrS0be5SxPt8D+uvZGp+n7B3b8RqPnqNEpotP10xHMrLjdQBMoiVjgpkPR/PHXIRZNCi
         Dogf8GOd7o1baXVGoznp4YbOMjI+HGaWQVNGWDeKKak3yL0V0UzJ6IcmhaBf3jJaMaDe
         tkgQhl23ieHM1q0RsYvim3WbiOPpFTllpYHoHrtpu8CLQA0uX8nU3mR8/PFcj+6+0TxA
         op4eIKO3c3mEOJ25amsKsVWjiblyIcbrlyBIensyIWnvn6nELFxMjycKxIJzjPqfWqk5
         cZkA==
X-Forwarded-Encrypted: i=1; AJvYcCVR/s1dQHEOliknk9TRFn6eGZsGm03sM3lXm1XC+5yRQRh/2htWnQs0Mzn5o/9xhzFrcRS8sz/FTD+YqNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQDebcsHgqPK2SeCGbHMSOgByxR5P6snjrrvBO3QEj6Wzlmlg
	v7F10yaUyLF7aPLP6ZCqsHdtW3HV5jTVwCIKX+KwjrEIU5I0BfqZ
X-Gm-Gg: ASbGncuSACg9ywEsox9/G7eMGerX/ax/00dDZbtHb/KQt60Hg5g2pTBYglvOPRVbjA6
	vcQHcg+bVQOxxY9x+QzMnlmVsU7O5itkK9Pv/r9P93peh8jlEgMuOtnqYouu9WubfqWwIJFK48q
	dxOjlr1wX4RFC9rQ6eihnn14YVzOd/z5oyF50Ueln/GS04SYExaNQ15SaUKxXAWss+Ty8jfjoGU
	qzE0jhQ5z1xvJ/8v68a2JWn2/fSsTYoyBiSAFiCr9KGkSJ2i8U924kVAKOSQDqNFR/x0YTPc3bS
	TfAcRDmFOsr3CZD1iYLQLwD/imaVnL/QypdHbRFWUDGIoSav1inf9V6kLahF07iIsSrNe0wMBNy
	CBV4=
X-Google-Smtp-Source: AGHT+IGTUslxEkhrCt7bHXWPpF20wfuH27sp+wfINxWQbT5zpiMtJ8L7zM+H+yeYwm3JIewxAAojPw==
X-Received: by 2002:a05:6000:18ac:b0:391:4873:7940 with SMTP id ffacd0b85a97d-39eaaed57ecmr79391f8f.54.1744318392664;
        Thu, 10 Apr 2025 13:53:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2c84sm62589215e9.11.2025.04.10.13.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:53:11 -0700 (PDT)
Date: Thu, 10 Apr 2025 21:53:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] erofs: add __packed annotation to union(__le16..)
Message-ID: <20250410215305.0c919e78@pumpkin>
In-Reply-To: <7af3e868-04cb-47b1-a81b-651be3756ec5@linux.alibaba.com>
References: <20250408114448.4040220-1-hsiangkao@linux.alibaba.com>
	<20250409195222.4cadc368@pumpkin>
	<7af3e868-04cb-47b1-a81b-651be3756ec5@linux.alibaba.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Apr 2025 07:56:45 +0800
Gao Xiang <hsiangkao@linux.alibaba.com> wrote:

> Hi David,
> 
> On 2025/4/10 02:52, David Laight wrote:
> > On Tue,  8 Apr 2025 19:44:47 +0800
> > Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
> >   
> >> I'm unsure why they aren't 2 bytes in size only in arm-linux-gnueabi.  
> > 
> > IIRC one of the arm ABI aligns structures on 32 bit boundaries.  
> 
> Thanks for your reply, but I'm not sure if it's the issue.

Twas a guess, the fragment in the patch doesn't look as though it
will add padding.

All tests I've tried generate a 2 byte union.
But there might be something odd about the definition of __le16.

Or the compiler is actually broken!

> 
> >   
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/r/202504051202.DS7QIknJ-lkp@intel.com
> >> Fixes: 61ba89b57905 ("erofs: add 48-bit block addressing on-disk support")
> >> Fixes: efb2aef569b3 ("erofs: add encoded extent on-disk definition")
> >> Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
> >> ---
> >>   fs/erofs/erofs_fs.h | 8 ++++----
> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/fs/erofs/erofs_fs.h b/fs/erofs/erofs_fs.h
> >> index 61a5ee11f187..94bf636776b0 100644
> >> --- a/fs/erofs/erofs_fs.h
> >> +++ b/fs/erofs/erofs_fs.h
> >> @@ -56,7 +56,7 @@ struct erofs_super_block {
> >>   	union {
> >>   		__le16 rootnid_2b;	/* nid of root directory */
> >>   		__le16 blocks_hi;	/* (48BIT on) blocks count MSB */
> >> -	} rb;
> >> +	} __packed rb;
> >>   	__le64 inos;            /* total valid ino # (== f_files - f_favail) */
> >>   	__le64 epoch;		/* base seconds used for compact inodes */
> >>   	__le32 fixed_nsec;	/* fixed nanoseconds for compact inodes */
> >> @@ -148,7 +148,7 @@ union erofs_inode_i_nb {
> >>   	__le16 nlink;		/* if EROFS_I_NLINK_1_BIT is unset */
> >>   	__le16 blocks_hi;	/* total blocks count MSB */
> >>   	__le16 startblk_hi;	/* starting block number MSB */
> >> -};
> >> +} __packed;  
> > 
> > That shouldn't be necessary and will kill performance on some systems.
> > The 'packed' on the member should be enough to reduce the size.  
> 
> It cannot be resolved by the following diff:
> 
> diff --git a/fs/erofs/erofs_fs.h b/fs/erofs/erofs_fs.h
> index 94bf636776b0..1f6233dfdcb0 100644
> --- a/fs/erofs/erofs_fs.h
> +++ b/fs/erofs/erofs_fs.h
> @@ -148,14 +148,14 @@ union erofs_inode_i_nb {
>          __le16 nlink;           /* if EROFS_I_NLINK_1_BIT is unset */
>          __le16 blocks_hi;       /* total blocks count MSB */
>          __le16 startblk_hi;     /* starting block number MSB */
> -} __packed;
> +};
> 
>   /* 32-byte reduced form of an ondisk inode */
>   struct erofs_inode_compact {
>          __le16 i_format;        /* inode format hints */
>          __le16 i_xattr_icount;
>          __le16 i_mode;
> -       union erofs_inode_i_nb i_nb;
> +       union erofs_inode_i_nb i_nb __packed;
>          __le32 i_size;
>          __le32 i_mtime;
>          union erofs_inode_i_u i_u;
> @@ -171,7 +171,7 @@ struct erofs_inode_extended {
>          __le16 i_format;        /* inode format hints */
>          __le16 i_xattr_icount;
>          __le16 i_mode;
> -       union erofs_inode_i_nb i_nb;
> +       union erofs_inode_i_nb i_nb __packed;
>          __le64 i_size;
>          union erofs_inode_i_u i_u;
> 
> I doesn't work and will report
> 
> In file included from <command-line>:
> In function 'erofs_check_ondisk_layout_definitions',
>      inlined from 'erofs_module_init' at ../fs/erofs/super.c:817:2:
> ./../include/linux/compiler_types.h:542:38: error: call to '__compiletime_assert_332' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct erofs_inode_compact) != 32
>    542 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |

Try with just __packed __aligned(2) on the union definition.
That should overcome whatever brain-damage is causing the larger alignment,

> 
> > 
> > I'd add a compile assert (of some form) on the size of the structure.  
> 
> you mean
> 
> @@ -435,6 +435,7 @@ static inline void erofs_check_ondisk_layout_definitions(void)
>          };
> 
>          BUILD_BUG_ON(sizeof(struct erofs_super_block) != 128);
> +       BUILD_BUG_ON(sizeof(union erofs_inode_i_nb) != 2);
>          BUILD_BUG_ON(sizeof(struct erofs_inode_compact) != 32);

I'm sure there is one that you can put in the .h file itself.
Might have to be Static_assert().

> 
> ?
> 
> 
> ./../include/linux/compiler_types.h:542:38: error: call to '__compiletime_assert_332' declared with attribute error: BUILD_BUG_ON failed: sizeof(union erofs_inode_i_nb) != 2
>    542 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |                                      ^
> 
> That doesn't work too.

That it the root of the problem.
I'd check with just a 'short' rather than the __le16.

	David



> 
> Thanks,
> Gao Xiang

