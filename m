Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94021221F06
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958472; cv=none; b=lSMLFhI8SyH1/KYeZh1lzo0M891VhnRZpwbePAZE0uDK8fHR7b3vJWhrzbG9oFxSbZUVR0HI6exeDzyLmG1FJjfk/fBoSAgouwaQtqw9pXXrIHPRhmxgZkRTlsokZoOyDs70txk0ncmUJUBasD6/C86PH+/PdwYBAF183V9Yx2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958472; c=relaxed/simple;
	bh=QuA4bLScr7zZl9oRdPCFKpAujll0Lr/hMN/nG963i68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LehaUMj4xmO8CXvPqKBTLVmp+ObomDmfQZzsbHRjVxAgIKZtO8Vq3ZXlttpbY6aXOyLgSxdkQ1rB10IaPksPQUG0NChVxWrAetR0rJGL0x9ws+/3d4PYZqM1M/ytqcoWQNLB3Y8+cWfzWHkTKYOZFa4q895QC4ubkH8lbmvg2lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=lJ2dyRhL; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="lJ2dyRhL"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-730580b0de8so3721009a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958469; x=1749563269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
        b=lJ2dyRhLdlecKa1+KRxwOZizdOO1M2XFQxlWtzCnSni+ivGLrXDXMLK6ngCpT6dGWl
         upIep6g/p7XzUfsXayzLImSGMdj69fKsMUSogPVDruavt7gTX2/vxLQulhYOEa181oPT
         zLz+dYuiISerz08IUuE5w/0PqvXkOMzusVU/Uhl/M12fgb41jtAWzP9LGH63B/7MfC+A
         f7qGkD3FbEZbWzrcL15GSHYYc4R45D5+s27tAhII/vWfEdk9ewd04BrC5dEaeePd58O/
         +iZRTxIyGm4I548x5I1eLHWEEfcsft1fPbiCJkC7bRiSsDnyryV38Jf6YEOmtAvACRDw
         m/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958469; x=1749563269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
        b=OBYAPpPvqwdSNjpDWcVDCbNibDOiHU6wfhKVtjJEFkLdymRzekqeb9hDNI+Vh1Y1kv
         /PtsiMA03ftJaVnAjNC/WyRJsBw+BEsgyFbPlbeeJ730sRWisHt/NEqMHCuhU7KgO/c5
         dHIO3emltFr0jsCKadVbAfkR+DblLDZ2wlO5q6qQYIWuMQr1GddVtEyu//ebDT/sti6M
         AWHAbyn35Vj3fP2PtiWHszSRcWmlFLZgECKcmCrFV8KKlqipCYDrPeQqeI66ZJjeo2c+
         XQLErjjSrt4/2AAxjEtPbzskAn5rfrs2flKkFfTIIRXYIy9h2zO1BMPNHsCAYh/V5uxm
         etnA==
X-Forwarded-Encrypted: i=1; AJvYcCWf1FdEVHBqRpiiib9Gr279FKCmbxvxBowv8TXMkmGeQakHmvGp31+VRSuyX2nb8tKQIOvV82mjn4obSZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbsZYwdAPcAT/fWOAl0VJgXjtjwlPdH31jRKhiERF9Ch6OifvP
	BA2S3BdLXmc7oLoehKyuU5ibuuz7dcDtOD9pGjTC+vgrGPc+ob9G9ctJLBg6rZm0mII=
X-Gm-Gg: ASbGnctd3nDmPFn5TqjgANTxDz8qssPGLLjQFEfzbJaMEep8alamfh11ooUhA26Txe6
	UslB194rlVcdtuoeTwwsQ/36NysFH8PQjZn4lNM4lZjeOVHjoHCEBOdbzNAuyK5Mj8w5DkilfsK
	vTGS+FgJGwSCW+NegCwvK/ykmn0ylTioIHGsFmsrGj9FF+isiQgDrgwnI/H0ikq1SXylEZb4WsT
	yNNjg8IF0KxKe7XIj4dwFNcrX7UtNDTTQmMhB2R4fzTu03RVRwCBC+kOk9mtlUfA18AFnCXmr5M
	Ztk4JbJGvl9sDvSFF6L9qkRmN2yQiXtPV4uNt8Nx+N07da9tqWVBdhJ5FBMs50LQWHDNGZSTPJa
	3hRHFgYmJ0EcvJtakQeNpq67lI7nIe5naNo5a7Q==
X-Google-Smtp-Source: AGHT+IEn/uCXnqGk9mGrQEIlQbsguMg4s70jmRhOs28+dV79kPuZtTFgI19mnXFgGkPMbOXTAF/Qjg==
X-Received: by 2002:a05:620a:278d:b0:7c5:d71c:6a47 with SMTP id af79cd13be357-7d211676724mr394455585a.8.1748958459265;
        Tue, 03 Jun 2025 06:47:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a195d7dsm840098585a.78.2025.06.03.06.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:47:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRzO-00000001hB3-1CmA;
	Tue, 03 Jun 2025 10:47:38 -0300
Date: Tue, 3 Jun 2025 10:47:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 06/12] mm/gup: Remove pXX_devmap usage from
 get_user_pages()
Message-ID: <20250603134738.GG386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <c4d81161c6d04a7ae3f63cc087bdc87fb25fd8ea.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d81161c6d04a7ae3f63cc087bdc87fb25fd8ea.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:07PM +1000, Alistair Popple wrote:
> GUP uses pXX_devmap() calls to see if it needs to a get a reference on
> the associated pgmap data structure to ensure the pages won't go
> away. However it's a driver responsibility to ensure that if pages are
> mapped (ie. discoverable by GUP) that they are not offlined or removed
> from the memmap so there is no need to hold a reference on the pgmap
> data structure to ensure this.

Yes, the pgmap refcounting never made any sense here.

But I'm not sure this ever got fully fixed up?

To solve races with GUP fast we need a IPI/synchronize_rcu after all
VMAs are zapped and before the pgmap gets destroyed. Granted it is a
very small race in gup fast, it still should have this locking.

> Furthermore mappings with PFN_DEV are no longer created, hence this
> effectively dead code anyway so can be removed.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/huge_mm.h |   3 +-
>  mm/gup.c                | 162 +----------------------------------------
>  mm/huge_memory.c        |  40 +----------
>  3 files changed, 5 insertions(+), 200 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
