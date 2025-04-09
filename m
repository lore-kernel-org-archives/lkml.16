Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C810A15624B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224747; cv=none; b=BzyCPlefMfOKQ2j4VBbL2Mny2J4mJpqJZ5DyiXlov9byU86XJxNfdBFP1J+bO4bpOwZwpglqkTY7A98fZ2qkv3/YVRvimPzHxDZNU186BSf3ie8BVF9HLcB3j3baXNu0a7YOsxmBrKxZFqDiZezEG/nOPNRPnTd9Cz428Xj6Wg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224747; c=relaxed/simple;
	bh=bb1BCpU6u1F4XaRmgOC4W+hVZuPLD19ojT0zGDPVb1M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J3F9x+IqjY0GYetSTHtcj5XTuaKoZm9BQQpLQms9txUGeUuELRLvLS3MSl8PtSL1dSY0s6RfORTAazgq1wc8PpBnw62vnHvn9bgQfnbwovoa36F5az3rZ+fhjzbPEojMSy9mlAZ2EwdiuGwTFhiGxPM10l5BPYgE1c/IIds2HuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MO56qGBq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MO56qGBq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-391342fc1f6so6265904f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744224744; x=1744829544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCVIdbEnISAVHM1v2E2J31fW79EefnXRviLqNVsb5SI=;
        b=MO56qGBqbIuYkR+mGdZ3P5IC5BEbe4v4DqLcwqo29WcycT4VE4LVgxb8opYw39LkzX
         Dxpq/YnR6D7oobOssDTV5MBmFXevrxs3v/dYkpWc2FwjkF0mbf/RTzVlarw+ep9Xl9Zg
         d9Fs5rXHUinWNCrBi8IZ+BRw+/ScFqH5m1w5wOgM6PKlXkw9F4ogoX0ykz3ZVlGf+m6w
         SD0ceFImwSqAwIxJZ3Pi6kmLnHy7iexehJ74DheNV3UTv0B7Z9DyN8euZIWEj9D22tve
         KmlyiMZpFxhdjMUjEloZaSZvGxx1eEW1kb7TAhbQ+c1CdETxJSdyVuu6Y9TeJ0JwdZzY
         Bu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224744; x=1744829544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCVIdbEnISAVHM1v2E2J31fW79EefnXRviLqNVsb5SI=;
        b=Cb30ba31m7apqrl9n4tNWPI/1VqWcgzfnYnymJryQhQexwVT1DGaWZp4UXm/mfCpWS
         DsSvvtXiySxvF5JIJ9RaWzqzCgPDQLUzOHNkW19EbvVG/0z3qNTaG5A7LAHLMr8xCInr
         OaXRTjRggBxMj/+II1KVnxVwA5ADKLlCDTjjLKhNfFdP/zcXM1biNGdOjHCRzhyxDpIB
         Xxssw0uGoNOirH7XJNJCoyy24g40iJpB0bqU4X7YzV45zwuz92k+OkZFBaBEr/AbE6ky
         j0eeLIVtkgWKeyMSVsLvwgQKUhkwPFtQI6pj94ufHzUrqQAV2fJMgR13xFR4HfOWhW1u
         1jpg==
X-Forwarded-Encrypted: i=1; AJvYcCVOtOrNuyQ54glHxPxUVxHEEU20u/iKKvmLX3/ekoyw1vgbUw87NsfnmJqYbuwSX54dsMY15ljqfrTziH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5xeJmJvyXH5hTDsKHg2636QlFhDisa7IHDKYr/P8rRbDx5W2G
	DpiWnv1TjlnwROlCth4twCrqlx/q6uoowxkiGj4DSuBdACcPv2AwQLUovw==
X-Gm-Gg: ASbGncsRMZLZwPYyKjXE/pmve6ynKSSQadJG8CWuyPvhEIAAhgpkL0k5A3gJvmwTXU1
	vS5JZJWxXroPOZmxIEOTsEBIh+iZtuuOgjnCjeygtJltz218BRqvll8/UIiZ6vPbBo5Wdcy5Ngu
	UtkNFTb8D5Gm7NicU0q+ZobITO/gNP6SRmnnrWqNp+eqt+H2JDJ3ZsKd5tG7+eeqjLUq4DmzIYY
	TMInrRKdFkgnLGnceebaqApVFrbfH1XyFamBlo2a+u1d90+cqyblN7Z0cxALR0SiCxDBFIHeie6
	B+7antAbCJ8rlTX0fJQ4w52CGyxtEmHsy4oxGo+AqyOgTmhz7+LG4ZsGX0rk5xO2F+tpPjR8YqU
	b7hY=
X-Google-Smtp-Source: AGHT+IFzHMs8v+x+fqbf8EJaLOokSyNCKkLysUCzAg9iwIuL/fHNWqtDfjEXm8SBtK1JSxE2iUr9OA==
X-Received: by 2002:a5d:5c84:0:b0:391:2932:e67b with SMTP id ffacd0b85a97d-39d87ac017dmr4022308f8f.35.1744224743857;
        Wed, 09 Apr 2025 11:52:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0b90sm2391844f8f.79.2025.04.09.11.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:52:23 -0700 (PDT)
Date: Wed, 9 Apr 2025 19:52:22 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] erofs: add __packed annotation to union(__le16..)
Message-ID: <20250409195222.4cadc368@pumpkin>
In-Reply-To: <20250408114448.4040220-1-hsiangkao@linux.alibaba.com>
References: <20250408114448.4040220-1-hsiangkao@linux.alibaba.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  8 Apr 2025 19:44:47 +0800
Gao Xiang <hsiangkao@linux.alibaba.com> wrote:

> I'm unsure why they aren't 2 bytes in size only in arm-linux-gnueabi.

IIRC one of the arm ABI aligns structures on 32 bit boundaries.

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202504051202.DS7QIknJ-lkp@intel.com
> Fixes: 61ba89b57905 ("erofs: add 48-bit block addressing on-disk support")
> Fixes: efb2aef569b3 ("erofs: add encoded extent on-disk definition")
> Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
> ---
>  fs/erofs/erofs_fs.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/erofs/erofs_fs.h b/fs/erofs/erofs_fs.h
> index 61a5ee11f187..94bf636776b0 100644
> --- a/fs/erofs/erofs_fs.h
> +++ b/fs/erofs/erofs_fs.h
> @@ -56,7 +56,7 @@ struct erofs_super_block {
>  	union {
>  		__le16 rootnid_2b;	/* nid of root directory */
>  		__le16 blocks_hi;	/* (48BIT on) blocks count MSB */
> -	} rb;
> +	} __packed rb;
>  	__le64 inos;            /* total valid ino # (== f_files - f_favail) */
>  	__le64 epoch;		/* base seconds used for compact inodes */
>  	__le32 fixed_nsec;	/* fixed nanoseconds for compact inodes */
> @@ -148,7 +148,7 @@ union erofs_inode_i_nb {
>  	__le16 nlink;		/* if EROFS_I_NLINK_1_BIT is unset */
>  	__le16 blocks_hi;	/* total blocks count MSB */
>  	__le16 startblk_hi;	/* starting block number MSB */
> -};
> +} __packed;

That shouldn't be necessary and will kill performance on some systems.
The 'packed' on the member should be enough to reduce the size.

I'd add a compile assert (of some form) on the size of the structure.

	David

>  
>  /* 32-byte reduced form of an ondisk inode */
>  struct erofs_inode_compact {
> @@ -369,9 +369,9 @@ struct z_erofs_map_header {
>  			 * bit 7   : pack the whole file into packed inode
>  			 */
>  			__u8	h_clusterbits;
> -		};
> +		} __packed;
>  		__le16 h_extents_hi;	/* extent count MSB */
> -	};
> +	} __packed;

Ditto

>  };
>  
>  enum {

