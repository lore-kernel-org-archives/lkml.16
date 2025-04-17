Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5154252292
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901615; cv=none; b=QsGgj7JP9Md8jXr10X6oT/0+qgoMJL+zRbS2sGioGeufkGmVFRqu0FaFyKxk1V6Rk/BFOCOmpeYhBVTzZ6Cs1nADJ/UYsNSJC9kF1IwuSf5UjKH643+J5Egvqym2f0eVvQnhWVGNqp7o97He2YnK/tP/kcLECurEBt02OZxABeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901615; c=relaxed/simple;
	bh=y61pJ7AcSZBNFmdsM2+NqASr6TeC1Dcv0/mqRc2L9Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=li9euio3UsQ0Nn1ORSJAIHud+afACGcilCzhkarq5VsgQlcSilQmhJHXBMZYe/6yeSCx36duPAe9zn/Gud0L03Orpz5UA3q0VS68HbSKk0Moh8gmkV6IZQabSUL0Pa5qqrP1Y0FyZxmrnPXVvFNtepSqLPyjzflbv4/fZJRwmBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=OLALmFWq; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="OLALmFWq"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c542ffec37so78400885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744901613; x=1745506413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=orQzpRsQIpG3P6OtKhgbz4MoOFHOwC//U7SqiKMoiFw=;
        b=OLALmFWqozm7G3tij/pG6mT2tipUZe4ccO4aPssh2Uz2nE464yEuKAaDIE3gn6Ycfp
         jmwpd/1s9ToTxKl6LpMO2SxqMlsj/1WWtWdFLY1Oqq+k02IDsV87P+XUue25TspxSZAM
         Ki3yfmmRnVi5rhY+Elh+g0yMdvnfV1XVKy13GcnHwuIs9y+QfP7kx9BpFPro1fbnbWxB
         h0j5HjCpEP/OskYNTL6Ijoa+LScoGHVnSU0CHQ51pa0vJxJU7alKz+eDDd+NYkBPsted
         4xbTC9OTA8+Avo9kbL2to2fM77/MPUI9bkKe9cBZKuxfEUqicSjqhEnItXWGtwmX7/Va
         Vz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901613; x=1745506413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orQzpRsQIpG3P6OtKhgbz4MoOFHOwC//U7SqiKMoiFw=;
        b=hZKUO/WLYK3+YODMTyijy7tp1se3jEyW0PZVevvDnOlKiRKwn3mGa2f0ekQh0Tyq/1
         Nu7Ykqx4Y4DXGja1u4H58jDPXa+C8G8ri9IKVrGMyMH8rStsXJT6WxRBcKpD50co/q/X
         EbP9YsbRX4ZeJcKM2usAxwuDj51IfAW6Y1BGgRx1QHQN5kEu/kQ5yD62AXQldM5gFtsp
         FYam4fjIf0+NALyF4QoC4OuLhSiMItTuS+Jh4fXt/09dYm7kdALDIYGm5Le/HPze1ePY
         NT9jo+ACFIG15SKs+kwFNmVcMsk2p/apwtlxTBE2rS1/OsKxozQ0BikYLelzAT3v6YxR
         HS3g==
X-Forwarded-Encrypted: i=1; AJvYcCXDnYxxr8rvVUNssN1ZR9G0d6OtFdUGGIoTfH46Dab4TgiN1tIUPFQ+miX/Jh4Ma7dA+GBJsbXT0h6URpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/pc1SFxOyVSd5JU8coc8eQr1VvAcV1RKivX95v7Y5oxaAtwDc
	OPr9lpkeVQFTUbJJlyO5hKWRxNhTbzNApajfU5ZjDYbjJQ5Ebx8a/fuIxtJ2dd4=
X-Gm-Gg: ASbGncvBSylfBt+NXD82ydMQCOZLkSjobHbEdBZJ7wfvS7pynJF4vZa09LZuKLhay+M
	JAB6mJjm5qCtbP2Ou0uP85R60YBjqctBs8hgbvV93/TaoKgtMXOAzRj8dvj37Ge7pBMCUeNMc+e
	fuW/kBR/MtPS28SDcvWD6A5kKC77arhXs8QoAXWCCnpYZ6dxLxaiejYwTFr2cIG4eWSsgtOxjwA
	qW/5mejTfFzLj0jJzkd8X3Aw9dtKyUaBk0LZCf0MHVMM08xZ7oA+MWIJNCoMO7CwzcA0Sxh1a3v
	QP3sGkE9zekvRX3x7n/SWzIW68GcobE/8eDozHQ=
X-Google-Smtp-Source: AGHT+IEqK9fyjzJURoJ5YbmmoiOfm3vVGT7Kw5UjLLbl7399FqDUAYutZyQtGhwh0u3F71MjRojMPA==
X-Received: by 2002:a05:620a:44d3:b0:7c7:747f:89d0 with SMTP id af79cd13be357-7c918febeabmr911311385a.18.1744901612837;
        Thu, 17 Apr 2025 07:53:32 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8a0dd06sm1184307985a.95.2025.04.17.07.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:53:32 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:53:31 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, akpm@linux-foundation.org,
	david@fromorbit.com, zhengqi.arch@bytedance.com,
	yosry.ahmed@linux.dev, nphamcs@gmail.com, chengming.zhou@linux.dev,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, hamzamahfooz@linux.microsoft.com,
	apais@linux.microsoft.com
Subject: Re: [PATCH RFC 04/28] mm: rename unlock_page_lruvec_irq and its
 variants
Message-ID: <20250417145331.GG780688@cmpxchg.org>
References: <20250415024532.26632-1-songmuchun@bytedance.com>
 <20250415024532.26632-5-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415024532.26632-5-songmuchun@bytedance.com>

On Tue, Apr 15, 2025 at 10:45:08AM +0800, Muchun Song wrote:
> It is inappropriate to use folio_lruvec_lock() variants in conjunction with
> unlock_page_lruvec() variants, as this involves the inconsistent operation of
> locking a folio while unlocking a page. To rectify this, the functions
> unlock_page_lruvec{_irq, _irqrestore} are renamed to lruvec_unlock{_irq,
> _irqrestore}.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
