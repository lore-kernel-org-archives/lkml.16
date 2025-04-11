Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466AD1F9A8B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381073; cv=none; b=TaD4wY6rqdtUMJPB6UiiyFwo38hoMMP0xlCrQUgo6IMeP8GR088gHKsRjdvaS4P0jcZN9wBh3qLXPtEUggRwPO/Ly8xF0ldVB1h1DnGVJAGQbv/DklX/6iSHnQxUsWGgW+/mpwJIvBMWBJN2duJ2plg0J7V/EVHCoyAFtCo/6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381073; c=relaxed/simple;
	bh=H62hDkZOBjg3DErlwm1FGkIlvr4b9YKyzMshgw7FFGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOs/YShu1bDJUwXSTB8la1BYYHk6NgRsiiqzwGCqU+eZRTI5PvjurqW6BGvElKlqUj3MSDttcuPo28W6suNreRT2blXLiLLZB5HJI+M+DkqhJMjB6BfgWWjXUB8mwyRa9Wjhi7+++OYbx4+IxRcalxG1A3FHdKiA3rdXlAP86dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=B6JjTZE7; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="B6JjTZE7"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2963dc379so333916766b.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744381069; x=1744985869; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oTqsSsP6q8mOn8ZNBlshDwf0wAfiYlzPvzrbYj6Dpj0=;
        b=B6JjTZE7YZgtAKcQIiEeuS1GQn28g5rutKg+ytuZ1cl1ODFe51PEzTGkLL/Ju9Vn4t
         PRuSMJ0iGVH7k/X2Pms6vV9+bcoan7+grZLiKxChLlCpLD2Ehc9BLfySGVApToNClF5Z
         KxZ59NK/ND3Rs0ATQ8UWXMgVKxpHHBk0wdm/L05n2LZCrTZfyUXEH5EvhsYQK4F+ruhB
         uFUzTCagtj/uTPErvksQcFO2LPhkkOEdXSni03AKC8B9Pl80/IzN8AAx2Gcq0Mzwxrdl
         S/Y682QI0G6ZsXSrBd98OB72Uu3vZmpN1hDvJr9PpFcmqyC+2l5Cqfk5jVmIq4GnQ/Ny
         heUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381069; x=1744985869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTqsSsP6q8mOn8ZNBlshDwf0wAfiYlzPvzrbYj6Dpj0=;
        b=oy8BaqwfhpP2b8l5XyE8cr/HZt+peF1Sbf7DA+8roii6KQv9HnNzQLT3wJwMGYdI8o
         3W8hpULeNZVeDzEiwOY9VxczgD/cOGj8vkmNuM+f6R51+4JL83Gy6FzAbVOaOmykUog7
         CT+wvOrvci6D5hjKqdvyYh/hWmsgYDK4cP/JiuzlDWI2mBd01PbiZuPfAedwFqGMVG+5
         zHaNQslbK8PHdwTNA6o9D2bkTzJPsb9E17qL8qj6gaZAAqdW6N7c8OqKxj5X3I8bMepS
         oqSk0Ig7YS4skkmszNEu+QT14ezH/thkssr7n+FcpO1t5VGzGv1r1PgIXs5ZC/FQDRxn
         W/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXV6QUhoeT4xfTmHDX8Fj/InOCrVks98JRuEjnkw7RNrPvHY29nb99vUeMe/bR7el/NOkvpXfrBwYj0RA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdg+LGflTorybBEq2GlVaupONiYgwbWZ+ZGF7uO83zxjuKw54Z
	TOhqbYbnusgb+Zxp1Swv7okQAnB7Fh9OihKbLyHq+pBKu3Su1AKJz0zvyOP0OdYPiW4VqIJJWs0
	Lkmaix0JmFgnfD5qEkD+QgZCWMc2h/OdWd0KvWg==
X-Gm-Gg: ASbGnct/EzeiH1QsjdExmoU0ShaigAPtuWpwIL7V6L33VHDpqHr1HcSYApiwjw0zMbu
	pDdC4/XYSMjv2b+t1p68kwCQjgtIO99++g0qnBZpw5er7nf3ZBEdUUSJSzCnECtWPo233OMWVHC
	yJJBQQ+9B5hRFchpTpdXwN
X-Google-Smtp-Source: AGHT+IEY8cLHC7dDvBg77RvvSDDvI4LLGaIX3QkmIM0yIkHyN6pRf0ULJgjqYOmJ4HljtZuv4Durn+nqnhJRPnU6ykg=
X-Received: by 2002:a17:906:cec5:b0:aca:d63b:3ebe with SMTP id
 a640c23a62f3a-acad63b4519mr193412566b.21.1744381069560; Fri, 11 Apr 2025
 07:17:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411034425.173648-1-frank.li@vivo.com>
In-Reply-To: <20250411034425.173648-1-frank.li@vivo.com>
From: Daniel Vacek <neelx@suse.com>
Date: Fri, 11 Apr 2025 16:17:38 +0200
X-Gm-Features: ATxdqUG88XaY8FJODqlLgLrNhPx5KOZKPJlXSpwqM9rMRoPUo2MrGKKgpFmjhLk
Message-ID: <CAPjX3Fe34HVF2JUi2DEyxqShFhadxy7M7F6xTA_yVn5ywHMBhQ@mail.gmail.com>
Subject: Re: [PATCH] btrfs: use BTRFS_PATH_AUTO_FREE in btrfs_truncate_inode_items()
To: Yangtao Li <frank.li@vivo.com>
Cc: clm@fb.com, josef@toxicpanda.com, dsterba@suse.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Apr 2025 at 05:25, Yangtao Li <frank.li@vivo.com> wrote:
>
> All cleanup paths lead to btrfs_path_free so we can define path with the
> automatic free callback.
>
> And David Sterba point out that:
>         We may still find cases worth converting, the typical pattern is
>         btrfs_path_alloc() somewhere near top of the function and
>         btrfs_free_path() called right before a return.
>
> So let's convert it.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/btrfs/inode-item.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

And what about the other functions in that file? We could even get rid
of two allocations passing the path from ..._inode_ref() to
..._inode_extref().

> diff --git a/fs/btrfs/inode-item.c b/fs/btrfs/inode-item.c
> index 3530de0618c8..c9d37f6bb099 100644
> --- a/fs/btrfs/inode-item.c
> +++ b/fs/btrfs/inode-item.c
> @@ -456,7 +456,7 @@ int btrfs_truncate_inode_items(struct btrfs_trans_handle *trans,
>                                struct btrfs_truncate_control *control)
>  {
>         struct btrfs_fs_info *fs_info = root->fs_info;
> -       struct btrfs_path *path;
> +       BTRFS_PATH_AUTO_FREE(path);
>         struct extent_buffer *leaf;
>         struct btrfs_file_extent_item *fi;
>         struct btrfs_key key;
> @@ -743,6 +743,5 @@ int btrfs_truncate_inode_items(struct btrfs_trans_handle *trans,
>         if (!ret && control->last_size > new_size)
>                 control->last_size = new_size;
>
> -       btrfs_free_path(path);
>         return ret;
>  }
> --
> 2.39.0
>
>
