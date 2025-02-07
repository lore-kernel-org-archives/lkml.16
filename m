Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E30214A4F0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738910832; cv=none; b=Y88Ej3nzk/4B3zCV9h1/cz+5B+yfnQRMgJ5pOjSqyOCKni9c91GtAXKjiWUoTNjBIwoT5jMghVetqT3O8ac+9s1Ft4ltewJmPR+1w8KN8NBCYAn4KNh9Xn46Vr0EQ7Lma/wo5w1NJNNZes4oZmKSoYAt+ZoIOYIwU9skm6oz7v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738910832; c=relaxed/simple;
	bh=RpGAkrTYajWGmwpdb6m0TqEGPzS08Giq6KmZaVTer60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhSOc6bB8xDzCxLN38I7AMZ+4j2PTQqipt3ZV9b4dg32rWWKVZ2LGtZeJIpIB9IPgJmka6m9hVNRzYdWLxHZ456NTiIpA2iBMaU2GaiN7Ezso4y+rRx4ggqeThhuQBDKlytBk2Syz8LrZ7e/OjvDWaU/X7ajX9IEplNdzlahiYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPn44Xxv; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPn44Xxv"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21670dce0a7so41181685ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738910830; x=1739515630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aaqm0+WcUbtSSV6iiLRU9EnxIGnO61h8+rTTV2ydAn8=;
        b=EPn44XxvjrpPEe//1khFs0E3U5GW5cT/IWDv3RzmEehSvekOTh8Ug9dVJXO/+Zo9ZS
         hc8CS6O2rfRM7WkNvqt1WrelYCpan7DL6Z9GFxq0TcuhV0S91ORVNEUORkDC0WYt0TWV
         54Wkzdf4O9PcwkPSvv39Qtuv+AW+R17C/0UXqPpJy0bRf7KqpSwNFFF6OXUtsbW1WAaq
         vEvAhNgdn5SUs7WJ7YF/9gB4btDM8BKM6U0vPmQpij/3zBKZXpjX1iz8A2kjGPbyUNP8
         ILOJPpE4+YCEFOH8wE/UD4P2hs3Mr6ED/Eb2oGyBC9fEN3FknPQ6hvjIBG4GkN/ZCxXm
         YkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738910830; x=1739515630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaqm0+WcUbtSSV6iiLRU9EnxIGnO61h8+rTTV2ydAn8=;
        b=wHNmJz6fxlPeVuxeo4PLb6WjIInKOBwSZTeSq2hkTLHLW4uTEqlT2HAzam7pR7YduS
         NCHUC/PMcw85kSB72kO+XuP8XPCC9U4BFsST3av3VxlKfgxzwYiwa34FuoDuvAQAyqdF
         iXLXL1GBVGlIcbUupHW8SG8CaFbPyaH55+rJEwBSF1NqmcE1q6QPJbSTM9RAlzqGXelM
         odWQqap4uKqB36fs9DkOPXJ1xfOConhzYv47RHIBdW9tz+XC4szcLy5/M1+QhVT1h6GT
         cugW33s1FFzbuaHMyoRnBCy1R97RtciVyFDCbbI+w/GQBjMQ3+QHowI7IEDMd1MqfgFN
         jsKg==
X-Forwarded-Encrypted: i=1; AJvYcCXyMPoGdMF8G2VegGahqiY2FP+ln0O3H6pYCNYt5i767aMCxf0oa5vWvt+xBTU1CTdQWmZTqNC57hbVyro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWztO7wig9Wlw2j2kfg33FFY/fj6b41fcUSOK+YxjMuvomShd
	tNfOU/yl3BMkOFgebngPKpJG41mhImLYji40FsSntPr6T1kaEsPy
X-Gm-Gg: ASbGncsOPxN0z2LIwxKJ0lpfDZL4W0CXUsqxvayy6dk3u7N5PzKf9A0xUVZ5vbi6meP
	4s3MeFMimBgGseHTi8mMjfaayVXzbxf0IEbGNOUY4X1m6lcU7dFQAbZguudihPguX4cQYV7T7fx
	KQkHdfPIccEOH3Bd5t2r4HthkabsriaSvaXMNkFOFugswhRvnBBar0KyVqOr8h+peP7K52CKMmB
	keaqMbfzdL7MLb9QHY8ZDn2s+2RPIs9QgLxmzqtMVkTUoE3bBaeAduRN1mIg6VeApdjFeU8Egy+
	7IUqjTOFE2uDvC3afMSp/Wxi9VleWdcSFOE493pNonXMT4G607E=
X-Google-Smtp-Source: AGHT+IGPGbQapsZ2i5BXeJiIzl3WQzLR76hcGtjOFymt7TFJZ3ZcGM8HPzw8As7XUfkOKBuufcVw+w==
X-Received: by 2002:a17:903:240c:b0:21f:454:953c with SMTP id d9443c01a7336-21f4e800da4mr33884255ad.52.1738910829652;
        Thu, 06 Feb 2025 22:47:09 -0800 (PST)
Received: from MacBook-Air-5.local ([2001:2d8:6903:f392:3d3f:70b9:7f75:3b50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3689aa2esm23098305ad.217.2025.02.06.22.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 22:47:08 -0800 (PST)
Date: Fri, 7 Feb 2025 15:47:02 +0900
From: "Harry (Hyeonggon) Yoo" <42.hyeyoo@gmail.com>
To: Liu Ye <liuye@kylinos.cn>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mempool: Use kmalloc_array_node to replace
 kmalloc_array
Message-ID: <Z6WsZsczBNOrmN0N@MacBook-Air-5.local>
References: <20250207055213.141890-1-liuye@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207055213.141890-1-liuye@kylinos.cn>

On Fri, Feb 07, 2025 at 01:52:13PM +0800, Liu Ye wrote:
> The kmalloc_array call could be replaced with kmalloc_array_node
> to allocate memory on a specific NUMA node.

Why is it useful to replace kmalloc_array() with kmalloc_array_node()
in the code?

> Signed-off-by: Liu Ye <liuye@kylinos.cn>
> ---
>  mm/mempool.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/mempool.c b/mm/mempool.c
> index 3223337135d0..51eabcc87177 100644
> --- a/mm/mempool.c
> +++ b/mm/mempool.c
> @@ -328,8 +328,8 @@ int mempool_resize(mempool_t *pool, int new_min_nr)
>  	spin_unlock_irqrestore(&pool->lock, flags);
>  
>  	/* Grow the pool */
> -	new_elements = kmalloc_array(new_min_nr, sizeof(*new_elements),
> -				     GFP_KERNEL);
> +	new_elements = kmalloc_array_node(new_min_nr, sizeof(*new_elements),
> +				     GFP_KERNEL, NUMA_NO_NODE);

What do you mean by 'allocate memory on a specific NUMA node'
when you pass NUMA_NO_NODE?
It's essentially the same as what kmalloc_array() does.

-- 
Harry
