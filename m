Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2847429DB8F;
	Fri, 27 Jun 2025 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024543; cv=none; b=aovNOBuLihqdWxzHlF39+zrA2BLiMzoE+7zeIrKDsrv3Zcg9z2a3z1nGPO8ssTF8IBxXsPF/NL6PDSmT49mRNb53k90R2aRE/jn1al6oHN4D/NUwHh8MwftU8+axISPpLk7nD+isjPNbCT0azlgotePQCslHuhLm1zVaUjKLDK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024543; c=relaxed/simple;
	bh=DLQjs7jc3NN2Z6ubvR29XdtYB2MPYQoKAWQDBl77eLg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVzEJqy8vRxzAWYk+FWDOCEGtUaw6f/tvQVhCcwiJByZuDQ8geeNMSRFk8npiw0dyyZJWix16ZeOWuF/i4Of1kDZjSV8lKgC1daHWnAYlrHYnvJB/aS62h6lEtOwj/GCAbzb1plxjVXHHkpaeyiZDj7Fn70pnW5vv91VI/Hs8GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpdcb2VW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpdcb2VW"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5533303070cso2056406e87.2;
        Fri, 27 Jun 2025 04:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751024540; x=1751629340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmPrqaqhW+EK4H5tg98y4zFWAy9fgrveP3Z8NDC1wKI=;
        b=Hpdcb2VWYE0pEXs93+ZcW6ew9b9uM6liea715mIQfk5bjd0YdrGZJosnINaL/aaPih
         SL0UJgXmhZtYc2Q4GmuDnfFvr/xQJZFqSD5t5mL4j+NnBD2QPZJT3UmqiDZNS672BkG5
         hUP2F1TIUmMRkgiTgv5CGOeMp0AQ+Rmo4HbQfTBUnDsiMHdyIUUGTkmASySqssqgZDK3
         7eHQQMJQM2wDj3RhIKwfPRI64X2rMkuQp8CZyqGTwTsAL9/oXeZxNWksTqTfrExsiPT4
         HpCPt0qi5yxlsHXtJHOcjSOL7U/7TxyK0F7QAnZ6OPvUc5dDg84aZ5pRRolLw9fjBtss
         9N0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024540; x=1751629340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmPrqaqhW+EK4H5tg98y4zFWAy9fgrveP3Z8NDC1wKI=;
        b=I4Pz5sGELulEqHatB5ZmZUPgMOQeL/08zcX5jiDuAwcPYQPnn8309xMn8I0BMNbRh1
         Ab1uYmUOiaBPlTNfm0AYMTs7t1SnEsiG7qw4I8QnG0oKDSP7MdzTKTE7Ku+bqn4NPXVw
         tH+vAuXEf5AU9AcpTew94+hVX+E4wBCyxv88U+KDarzHRmug5uEl+AEWUlxyi/YNgvDd
         4To5/cBh+hfPiDy/kltpPbflLczs8S+cRtIhPc6/aQ73CKIn4Ypa8VXaZFH0Qw67hbtk
         xYd7F1PV7A6/Mjg1JUtc9WFQy9dmZdmZhjFoLh+2mL06DeprQ8QUROAaePdi0r2Uq0RV
         wkLA==
X-Forwarded-Encrypted: i=1; AJvYcCU5ozkE54M422WDkCc1hJioVHMcFrvgCKLQabZiupg8GK5HWondQtcYDTRfYTi/k37TaSME8GihWnrvJpQ=@vger.kernel.org, AJvYcCUsfue+KMP0b4RftC07PkWoXNeXYgQ5iGE8Ge1IENNqrB4RWxD2NFEkFbytQGuO+kMImOwmoxRUPy9Y1TeiI9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQw0hzvjivpC3lFHDqOknLQCu/Fpa0AVIA6b3HFBmNBecHnVFm
	45gV/eWdphn4/THSYMWiNrqKsxuQj0WZGgxAfuYm/vn8oqHuCwWrc71/Rw3HPg==
X-Gm-Gg: ASbGncthlybJmfzSnNKFMKRy2dEGAFvw72HbzMzxximNnDI9rV/tbsW0rR6anidumTF
	XW/GjYwJMNVtPQbBHQt0Xc1x2N8s5MvsCdgIgrYZYeTdFVIdTXhMmecEelR0cn2DDUK/JmqywPH
	G3MD04c3G/05rzY7D08fBsNxSzBSWbK0o+ipEcsWDKUcS6jeACW955OMPbwzDuVPMyiKsRmZl4O
	911u94HPS3EnoavoybuVx/YNvBa+XLvI7EU+6Odm6LBCr3P9Q8ZVClTtREssrUxwEF0HjcBmwRi
	tpAlWuDfCY1xY0Cf3l0lSYiAAhu+ShSj9/JumD0EKUYjQAxxskxTP4UxZFRC4gw9sxLhTA8J3ot
	w3MWTx1ytWBM=
X-Google-Smtp-Source: AGHT+IEy7VhPgAWEXO/LXQ0C8S+wuoF2yCySoHfhr2ctNDV4hnMQQJxvZ9qI5HLKufPyjdWQvFs8lQ==
X-Received: by 2002:a05:6512:224c:b0:553:ad81:4de1 with SMTP id 2adb3069b0e04-5550b8253c0mr973628e87.24.1751024539809;
        Fri, 27 Jun 2025 04:42:19 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ec0a7sm414748e87.237.2025.06.27.04.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:42:18 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 27 Jun 2025 13:42:16 +0200
To: Danilo Krummrich <dakr@kernel.org>,
	Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/4] mm/slub: allow to set node and align in k[v]realloc
Message-ID: <aF6DmPmeSpWU3hH_@pc636>
References: <20250627092901.356909-1-vitaly.wool@konsulko.se>
 <20250627093714.402989-1-vitaly.wool@konsulko.se>
 <aF51PTZh0gRVFuYu@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF51PTZh0gRVFuYu@pollux>

Hello, Vitaly, Danilo.

> On Fri, Jun 27, 2025 at 11:37:14AM +0200, Vitaly Wool wrote:
> > Reimplement k[v]realloc_node() to be able to set node and
> > alignment should a user need to do so. In order to do that while
> > retaining the maximal backward compatibility, the following rules
> > are honored:
> > * kmalloc/kzalloc/krealloc remain unchanged
> > * kvmalloc/kvrealloc/kvcalloc remain unchanged
> > * kvrealloc remains unchanged
> > * kvrealloc_node is implemented as a new function taking align and
> >   NUMA id as extra parameters compared to kvrealloc.
> > * krealloc_node is implemented as a new function taking NUMA id
> >   as an extra parameter compared to krealloc
> > * kvmalloc_node/kvzalloc_node/kvcalloc_node get an extra parameter
> >   (alignment)
> 
> I see what you're doing here:
> 
> You created vrealloc_node_noprof() in the previous patch, taking the following
> arguments:
> 
> 	vrealloc_node_noprof(const void *p, size_t size,
> 			     unsigned long align,
> 			     gfp_t flags, int nid)
> 
> And now you're aligning the newly introduced krealloc_node() and
> kvrealloc_node() with that.
> 
> The idea for having an align argument on krealloc_node() simply is that it
> fails if the alignment requirement can't be fulfilled by the corresponding
> kmalloc bucket, such that we can fall back to vrealloc_node() in
> kvrealloc_node().
> 
> Generally, this makes sense to me.
> 
> However, now you consequently have to add the align argument to kvmalloc_node(),
> kvzalloc_node(), kvcalloc_node() as well.
> 
> This is what creates this huge diffstat changing all the users.
> 
> IMHO, the problem here was introduced already with vrealloc_node_noprof() taking
> an align argument in your previous patch, since now you have to adjust
> everything else to logically follow the same naming scheme.
> 
> Instead, I think you should introduce vrealloc_node_align(),
>
I am probably missing something. Could you please clarify why do you
need the vrealloc_node_align() and other friends? Do you have users
which require vrealloc() or kvrealloc() to support nid and align from
Rust API point of view? 

Thank you in advance!

--
Uladzislau Rezki
