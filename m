Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD5720AF88
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522256; cv=none; b=QaIWkLoKq6H01RrZf57sNBTEmlzuFSlREhgrHkgrLLwgvPAr7Q5IxfQUEchpYr3Iq5Y9YpBMGbrLc3/qBoL+gdtFzgvGRG4tTu1rRAu1uGyHxzBJKqJJY1ICVoAPMigSs9bL1MyLiSv/axGR8dOKtmsI2+4CNy+S0nAcRp0JXrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522256; c=relaxed/simple;
	bh=a6xhRfFpTxAAJ5SlpRIOnpKIhMU+TA2ntom8u7AyK9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fl9CUQpFic5PRJjCTMCfB/v8v2euPXYa3wgpTiO1AfIW53YC4civvndTTlsTEqWzPBrrHOCU5SdZiAZi+NCH+8SdDdYT5tygaG2qHGyU2J5C1U/oIsmkGY0rgzZF6dVB9WuECvo/VFcIWTQy84KUAZZhQ/9t5XPP/8cIAnArTlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JU9kTvWO; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JU9kTvWO"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c5e2fe5f17so556873085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743522253; x=1744127053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TtdWsRwfUOBxgsIg+kVSTkMJUa8tV9VXtloNeO/dNoo=;
        b=JU9kTvWO0YmqDfugbXFXY+faYyjUEszhzl+QncpB6yjvpCh0+D9etEI4yWecLy1QBt
         9tqBtjjrU3tEg6O2pj8hO9x4AoRNCNXGeRRvO3OONGHVu0G9EOfob9YLgVhHZA0d10oM
         anrAWWNLbhNJyan7Tk7/TvCCjbffxMZH2vVqC5rZ55mNbXFQwfcUiBI5SfBMYyxJLBDd
         Sg7zkjGBYC0jgBND7yBY6iC92vHlqP9eYnfSeipuINhWzXVQds0ugDfahJQDoM5Ltg6h
         MkcwdHGESKbRewQzNcYB7p1YPvhZjORbuYJd+TLyzG2OleO+4OV/ALjvVEIIi5WbmaRu
         I32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522253; x=1744127053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtdWsRwfUOBxgsIg+kVSTkMJUa8tV9VXtloNeO/dNoo=;
        b=kUTYuiXWlDKObU2l5+0C/TBcq803O9JhgynCBe/MIwHczxrSYGD6v7JRfTnhJw9LyO
         +N3w0ldX1/sgZ6elb5d9WpxTkdPU5sh8nAYkpLBBkMwgnB/egHYyDu2EAHhkqbeElI8a
         c8TyWMLdSZP4lAsy17c+sNL/S8TzqjzPzs9LcD9zbEU4Vy7YJL0KiaB2NCFI1/N0wDwC
         2gsu2mbzNDKqYJOAYbbc00q0Pv/KjKtt3eHR9ZjXFrVsQ4lBhDTDkSYYjton/4rSgbsn
         iUNzC5CU4yB8mOTwictPb0P9gs+wprYeXeE3pUFmo6n6UNhj7KYRiTtg/rTFRbGFqep7
         Gyfg==
X-Forwarded-Encrypted: i=1; AJvYcCUPslNKUYhbvWNRSFLDFVgioGznDrfnyWbhPcCW2tI1l3uloX8L2UgAVoU0G/BN3iJ3jR9y4XHpbtZ/5pI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKP2ct4FJ9Ly2Zt/TonqHh7oV+08bPpiEJBZkV7vXUPJpsyKmf
	1dqx5cIbT6hy79pgEDRFVAqUd96FxRn3/fqRcZKM3x82oUFnL6NMc9/fvOSXeRzjfbk0pu9o1xB
	A
X-Gm-Gg: ASbGncs66dc0zUSZ3YTCpmu072mhy3NFhXyTo2B/V4J3+32mKS/VlaZcfOOQ5HTeJa9
	sxPvf3lMs4LyR171U1nXjFQZsHNrpqScLH2bBYZKeGH+v6DaobH8g5wgLvd1tTTkfBLJDJDsUF4
	ito0pw7wjJT2qtRZtacypPzp1702U0VdhJJUSZX6KKU+vLpuCZ9JkJ0PtyM6a4AWUXWsj2eAOU7
	RzHdwWGMmmmEsf81YGJTk/tlSyxaFzt4ewv+Jjvspvbvu2qucEyoTXjEGzUS0A1/GboenNJSJwL
	amGKGjmObDRiLAsrDmOORwOjhBL/xgTG2jogg+jFT4qQqynagn6LBkWiAuR9GflLruDmEYAqBuK
	TQc8f2XrARL7vZbyEOXEscBk=
X-Google-Smtp-Source: AGHT+IFNoRzI7w1svFEnu6uSg1a7Al/lfHMRAFbRiHbN38KY+jMtZlEEZoz8sPSAU2QwNot8xAw/Fw==
X-Received: by 2002:a05:620a:1a91:b0:7c5:9ac2:2a7a with SMTP id af79cd13be357-7c69089246emr1907329985a.47.1743522253345;
        Tue, 01 Apr 2025 08:44:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec97974ffsm62920086d6.99.2025.04.01.08.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:44:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tzdme-00000001MBc-1Y2l;
	Tue, 01 Apr 2025 12:44:12 -0300
Date: Tue, 1 Apr 2025 12:44:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, tjeznach@rivosinc.com,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	alex@ghiti.fr, lihangjing@bytedance.com, xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [External] Re: [PATCH] iommu: riscv: Split 8-byte accesses on 32
 bit I/O bus platform
Message-ID: <20250401154412.GI186258@ziepe.ca>
References: <20250325144252.27403-1-luxu.kernel@bytedance.com>
 <9F043708-3BB6-46CF-BEC3-2636E9A388B7@jrtc27.com>
 <CAPYmKFtAWNz7nCDDD7rjGeV2fRBgy5Kt6KR60pEyXAM=bb7r4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPYmKFtAWNz7nCDDD7rjGeV2fRBgy5Kt6KR60pEyXAM=bb7r4g@mail.gmail.com>

On Wed, Mar 26, 2025 at 11:26:07AM +0800, Xu Lu wrote:
> Hi Jessica,
> 
> > Is such a platform conformant to the specification?
> 
> We have talked about this before [1]. I think the IOMMU spec does not
> mandate the implementation of 8-byte access functionality. The related
> sentences are listed below:
> 
> "The 8-byte IOMMU registers are defined in such a way that software
> can perform two individual 4-byte accesses, or hardware can perform
> two independent 4-byte transactions resulting from an 8-byte access,
> to the high and low halves of the register, in that order, as long as
> the register semantics, with regard to side-effects, are respected
> between the two software accesses, or two hardware transactions,
> respectively."

I think the commit message should explain an anyalsis that the code is
safe against the mentioned side effects due to ordering.

And a comment should explain this:

+#define riscv_iommu_writeq(iommu, addr, val) \
+       ((addr == RISCV_IOMMU_REG_IOHPMCYCLES) ? \
+        lo_hi_writeq_relaxed((val), (iommu)->reg + (addr)) : \
+        hi_lo_writeq_relaxed((val), (iommu)->reg + (addr)))

As the naive reading of the above spec paragraph doesn't seem like
there are exceptions or why one register has to be the opposite order.

Also missing () around addr

Jason
