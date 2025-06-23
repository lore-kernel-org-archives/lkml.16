Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991E629B768
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695512; cv=none; b=n/XdxKE5JpWxzkQUEjoEIVqn0UKI9JgFQcPHRu9xc1BTpCIDNxxK+pDOKEZ/46qVhBs6mbxISumr4Ea8WWO+ACjacOpdNBya8bAX6Vd6Zhix/5V0o7krTOpYBJnRs9QlrAAo686ZFwBlPEnnstQLP2ttPA8/B6TViHPaKBHxyAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695512; c=relaxed/simple;
	bh=D4WLrHGnbg5kQBLxjiDdwVBzN+WA89TBg1nQYbaMm5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksly93Dl99DDvCzlkedl6emi/H5Pk6ZZjOM6u8JXAKSyQXdDhuHMYeYLO05CYafJkGJcWNeb7Dxdx23JYABjPcwJFA5Swpx4mdEJNgq9fzaz2ue/j8GRj2qfaeLJ/kbyB4H2nb7lwHdtxTPDQhsccVl01v+Y/oKnjFtJfNKMYrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lerfOSub; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lerfOSub"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e75f30452so31301117b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750695509; x=1751300309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ueQ2+ddYRZVXMhlg0x6j6v5Cyj80tFqJK0UcyfKVqeo=;
        b=lerfOSubnzZg7fGFZ5QLc94onSz10qxebXmaSOc/eOV7A0MIrVILU8fCYFwFieVwHX
         SDZdPxWjh1K7r117f+vndlkAnOTHb0st4Ap1AX028svtwEXK939O2qCiGkDP78amTR5T
         uwHzjWHSBgAqbcUPHYUeUxHEFdQO+FxIqFQRP/Rc0aHK9pvydgAojI8LO3q4RDlNH1Iq
         lJccM6d4Y0qpDpxkMYJljfGbTOgthIHPxUbHOWIjXSbgX95quHlp4v/YZZ07L9Gcv8CH
         zomttamvOFejZ8UKudm+KUTvBCa8rVFCPQBl12+9+cuB0zduzsrCL+2DrLtowJtXeScV
         MeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695509; x=1751300309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueQ2+ddYRZVXMhlg0x6j6v5Cyj80tFqJK0UcyfKVqeo=;
        b=EPOExArCxMRudd3cXQQ8v7hsB1yvwhC1kVl6CJyMZCFAY92+kGcU+AZWFKeEu+ccjL
         J8oYz5uvYqqDWw3aDEA9WDZ8Sy5oq9X/3zOGZW7FiZO2dfahXleanaE9hvsl5re0T4TU
         UuoSYdyxusPIw0fQfyjYIB0MIxo9pqxCXcO1DUKDSXAbrpAQ0vGyFG4ApDP90PX6k4hV
         te1dHrB2BTa/Dq3Z81btepZ4/Hzs+FO3ocHVlsT/ry6C5DGhiC8eS8l15GYL0/Ixcw03
         tYU2Q+YwiyD46pz/yeK/YYOc80sFxa5s6K1j1R0tgHsOxYmR3dugtfkYqjXMZB6NNkqK
         xyAg==
X-Gm-Message-State: AOJu0YzOwaxkop9Stu20QYxnjG0P8yiBk9lsgSbmryYJ4CZKfVytJKI6
	HruRO4eX0+P/SHesJVZgE5yy5LO6P6Q6Az6/FlcsfzulSP+8+HVBqMqk
X-Gm-Gg: ASbGncs3ImbgiqTXxdl1NJYzq3A1A/5d8ALqXON+XdkT6aEUeDwQS9f9uDlWoRjyBlo
	UPHOn6BfqTz5gD92g8N35/bxn5uwddqZoE+aWd+8XiWmoRyzRlDyflwb8fbjEse/HaBjhLBCNMS
	Pm0tTxbpHytXzdyFziYZxWPirwtXV0xR3gnnrld555FnOF8+T6ZCfplCGAeZklf3qmABGgTec4r
	7+eKSOhz8TpCKELteCm6+8IOn8xt7hnXsC+9TEbmwLSY9hThZQMWNl7Nusq6oToyl+Ek5b5q1+w
	wgJRgS5xDoQzeuPF/16mQx7Uu7JMTdVzJg4VAb+sPAOlqkn47yVr3A1HFczYTg60A5/fK55KUVn
	JhgiB/zvXiNYkL2viYkifd3IewuQa3/4q
X-Google-Smtp-Source: AGHT+IEtXTUpnDlA/7jvmi1OzCLNIUdT6JuNcqhGJ2TfN3D2syY9DgJVjqdHAJ+nZh5fXIcDrMxfYg==
X-Received: by 2002:a05:690c:67c6:b0:710:ea78:8ff with SMTP id 00721157ae682-712c651757dmr189161687b3.23.1750695509428;
        Mon, 23 Jun 2025 09:18:29 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4b9725esm16298767b3.70.2025.06.23.09.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:18:28 -0700 (PDT)
Date: Mon, 23 Jun 2025 12:18:28 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <dave.martin@arm.com>, fenghuay@nvidia.com
Subject: Re: [PATCH v2] cpumask: Remove unnecessary cpumask_nth_andnot()
Message-ID: <aFl-VCOMa7N6AtmF@yury>
References: <20250623074650.3534184-1-tan.shaopeng@jp.fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623074650.3534184-1-tan.shaopeng@jp.fujitsu.com>

On Mon, Jun 23, 2025 at 04:46:45PM +0900, Shaopeng Tan wrote:
> Commit 94f753143028("x86/resctrl: Optimize cpumask_any_housekeeping()")
> switched the only user of cpumask_nth_andnot() to other cpumask
> functions, but left the function cpumask_nth_andnot() unused.
> This makes function find_nth_andnot_bit() unused as well. Delete them.
> 
> Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

Applied in bitmap-for-next. Thanks!

> ---
>  include/linux/cpumask.h | 16 ----------------
>  include/linux/find.h    | 27 ---------------------------
>  2 files changed, 43 deletions(-)
> 
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index 7ae80a7ca81e..498790f74fa8 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -546,22 +546,6 @@ unsigned int cpumask_nth_and(unsigned int cpu, const struct cpumask *srcp1,
>  				small_cpumask_bits, cpumask_check(cpu));
>  }
>  
> -/**
> - * cpumask_nth_andnot - get the Nth cpu set in 1st cpumask, and clear in 2nd.
> - * @srcp1: the cpumask pointer
> - * @srcp2: the cpumask pointer
> - * @cpu: the Nth cpu to find, starting from 0
> - *
> - * Return: >= nr_cpu_ids if such cpu doesn't exist.
> - */
> -static __always_inline
> -unsigned int cpumask_nth_andnot(unsigned int cpu, const struct cpumask *srcp1,
> -							const struct cpumask *srcp2)
> -{
> -	return find_nth_andnot_bit(cpumask_bits(srcp1), cpumask_bits(srcp2),
> -				small_cpumask_bits, cpumask_check(cpu));
> -}
> -
>  /**
>   * cpumask_nth_and_andnot - get the Nth cpu set in 1st and 2nd cpumask, and clear in 3rd.
>   * @srcp1: the cpumask pointer
> diff --git a/include/linux/find.h b/include/linux/find.h
> index 5a2c267ea7f9..dc93fc35dcac 100644
> --- a/include/linux/find.h
> +++ b/include/linux/find.h
> @@ -267,33 +267,6 @@ unsigned long find_nth_and_bit(const unsigned long *addr1, const unsigned long *
>  	return __find_nth_and_bit(addr1, addr2, size, n);
>  }
>  
> -/**
> - * find_nth_andnot_bit - find N'th set bit in 2 memory regions,
> - *			 flipping bits in 2nd region
> - * @addr1: The 1st address to start the search at
> - * @addr2: The 2nd address to start the search at
> - * @size: The maximum number of bits to search
> - * @n: The number of set bit, which position is needed, counting from 0
> - *
> - * Returns the bit number of the N'th set bit.
> - * If no such, returns @size.
> - */
> -static __always_inline
> -unsigned long find_nth_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
> -				unsigned long size, unsigned long n)
> -{
> -	if (n >= size)
> -		return size;
> -
> -	if (small_const_nbits(size)) {
> -		unsigned long val =  *addr1 & (~*addr2) & GENMASK(size - 1, 0);
> -
> -		return val ? fns(val, n) : size;
> -	}
> -
> -	return __find_nth_andnot_bit(addr1, addr2, size, n);
> -}
> -
>  /**
>   * find_nth_and_andnot_bit - find N'th set bit in 2 memory regions,
>   *			     excluding those set in 3rd region
> -- 
> 2.43.5
