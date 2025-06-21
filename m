Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF522AE8D
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750516818; cv=none; b=NY1wycKGxVs5O7kybU6OGPJRqv684mqa+dO4CbW9mXBA2xMBrSfQFxPrE1cnxHalhDXo3CGsVNwQru2rKJln8Ond9vT0JNh/lsklEBi0Fg8RiRoUnfwfag2scimPznwiZKHJw0VOFv65tB/fORLJPu6ylKndhPoPBkWXHEQQQIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750516818; c=relaxed/simple;
	bh=jSnV5eH5IUfUHWuKHLE2UR63uujPvC5JEXTQBuQlpXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elB01y/MGAP3G5LWOEk+8/kFsRxfJToBjms6hdd4EykTKMraFtSXs222/VD1+J7Z1rc9I7kspgwsfWpGrZcutN1S70197ijrw/B38H7QNivlr7H+eQf5dW/bboozbcbUxpjY9jU6QreS1zLjwH5PbaIPXfCsPoIUIN8VWfcBU78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLxT+pG/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLxT+pG/"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3298703b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750516816; x=1751121616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hNvuYJnI2p5i6Qe50gBr5cDarS6mStWMVf8jQSAWo0M=;
        b=VLxT+pG/CTRQo5v0idGMptFbHWYpb08qVZ3ZkHNHhc4ryOETAOO0au3GIaC08BftTH
         Tm2tkqptqWEVkOjBxQ7qateXATMi/1s/YYw5OkgK/vvzA8p3GdTFQuHz+FwHNxJBpzmp
         SrubkI4fvGUGmRZ6lC28lw9CjqUIIFKwYLgnV4XezY3U6krfSvHxQFz1BzkPvS5SiMzT
         BlSxvWJkzkbfzB9DgjOkOlZmainRXCTQ4PvFwe4GNGrddczUTvgxk6cOq6bHE6jUz5ut
         Qo4PugYSvKwzwSeCRiG/ownB7fnyU5YP9Oiqu3I7OoBzu85YKGZVAyvPcTEuWZmjXANh
         I0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750516816; x=1751121616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNvuYJnI2p5i6Qe50gBr5cDarS6mStWMVf8jQSAWo0M=;
        b=pA54W2HAbtSYWtQkk3q3zXKFzMeB7U+txMEWY1dySVm+48C6fJM2bkMGz3lTQqBVXy
         iC0wMn3mqDPFFIzp6U45JLlJS5nfgLJ+D88oLwQwSzWyv9FxdMLYjo9WV7U6gHdDo6yH
         9B+SGALIjJUo8I4gyhwDjdG5QBpNtuAOmRIpwiY0/DkkVRsjnAY852tHc9lxp1yUk+wg
         FYXtvg+J5dEbMYmd5R21UY5QBR+vOVm3RnxeqJLJmmuHqY+qJpHEzilDiem4wKkvMhPd
         nHbblimXBfTvEkmebP9VCRTKrjExbx6P0FmJr1rSguPbps2MWPaAF5jYaGzSGAOnkyn7
         D0bw==
X-Gm-Message-State: AOJu0Yw9gf18tlU2vLJJ9Xso76+LPyMyGMf94wu27+eOU00CaTDDjsy3
	Ra4ix5f1DnydOFv2hXeYr/snGPzGAD1ndZpyDNJR8hV72mWP16AD/F9ETfsDYQ==
X-Gm-Gg: ASbGnctWiV2NBN+96zRK73tkgjqR6lIs1QSX/jW81PaI5xRw0da/KgqVFtmLvRUqc7+
	61v9VFfQbzOVBt5fJayaBN65cctXAQrQlxdXKuyFrr4SJaZAqsW0w3vOOmVDDsnNAGhlwEcDiWj
	cooJIc3YUzZ4bXocyhZ5T4Y9mmwuE0MQyobVNgoWXxIDYKwicl7fbKoqpbyPAo9xSIZPwWjTQ2b
	FD8nS+B93BQoGCgT5lhSTqQxMVpqYDoL6ZlcgEiGLcDicplfRwc0EPsrXo54EDrIa+Mg3B1b0bo
	eWGJYJTB5o1yy2mw85KBpHisYm4vg3QCuhVbluA91knwh1kw+G6txUx+8r/gdA==
X-Google-Smtp-Source: AGHT+IGYR5w2LPjZqP0Swao4VYx2Ccl3n2TMM3Da4RIhRM2sk38sV/NEmaEi9vxe3L0+v9eiYGXk+A==
X-Received: by 2002:a05:6a00:1a88:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-7490d6bf6d6mr10920669b3a.24.1750516816234;
        Sat, 21 Jun 2025 07:40:16 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6743basm4439271b3a.142.2025.06.21.07.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:40:15 -0700 (PDT)
Date: Sat, 21 Jun 2025 10:40:13 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <dave.martin@arm.com>, fenghuay@nvidia.com
Subject: Re: [PATCH] cpumask: Remove unnecessary cpumask_nth_andnot()
Message-ID: <aFbETVWvuXewnRfx@yury>
References: <20250613073733.3642679-1-tan.shaopeng@jp.fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613073733.3642679-1-tan.shaopeng@jp.fujitsu.com>

On Fri, Jun 13, 2025 at 04:37:30PM +0900, Shaopeng Tan wrote:
> Commit 94f753143028("x86/resctrl: Optimize cpumask_any_housekeeping()")
> switched the only user of cpumask_nth_andnot() to other cpumask functions,
> but left the function cpumask_nth_andnot() unused, delete it.
> 
> Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

This makes find_nth_andnot_bit() unused as well. Can you send a v2
that removes both? Also, the following patch in the series doesn't
look relevant. Can you send it separately?

Thanks,
Yury

> ---
>  include/linux/cpumask.h | 16 ----------------
>  1 file changed, 16 deletions(-)
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
> -- 
> 2.43.5
