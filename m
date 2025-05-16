Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BE3199FBA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747405100; cv=none; b=Nhmh+4MUxp2mv3gjNv4aRM8/fC0R9AQ3d0mvpasXIz6K5SzYihYp82SwXiwyQthAWlASw/18o/Qp7qFGaWV320nPESKYVoy9rKcvjOqQ42poVMDyQeAOFkxgGT0MF++0rsPgXg7FNR+iO0k0PCYFQlZPMRcOXx9gulR807UzsKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747405100; c=relaxed/simple;
	bh=Mg6g1/TzH+Xhtn16KUSbRqht0teHBbYz5hWZnb6szNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTHwP5v1Owx73GEoR4nBmV2zlN31twApIoT0nUJcFdNUCsc+rwEgxbilMD/+3noYd1GryO8tOvgyo+EWWDLx4xdoz6DOi4hkyGxltQeCUKGSjQRkczmBZAky3jPkR+k4CgMSV2O+InvbR9QneTxkkJHPkyqXvv+d732NYo0GRvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ZJ1fvfyI; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZJ1fvfyI"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so25665796d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1747405097; x=1748009897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oku1snLMpD2EhPjxkL/jicRSSroCJrOHGMPvLIw4vjs=;
        b=ZJ1fvfyIoPLhOUTfFLPr2CV0SxTY9jmFKzOClANqq33HzLbTTit4sVHm3+pv/ET8Nd
         unQVmiHNboGffcxc0Rp/3UKZyQ9IOugXQ1AtwalwgujlN1gNlXpirN+i81W0rdbMFJfF
         XgsS3J2RWJVcwqzdQ8n0SlNqakXit4pYwveCXj63pvD3XwDaLWwU9rfrzuyRhucdyvCS
         xXXe3XUhPmXwMl4S0AEWT5aCNwaj6PxFrEModJVAP/KZgk21sKe7cs9shJeV/C1MV+nC
         oIOcl9xeFgoWC2Pq4KP8G3fpvdp4RJOWZGJvuGuKdaW4tCPRt9OjQfzbHAXAfeJ4O+hc
         yedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747405097; x=1748009897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oku1snLMpD2EhPjxkL/jicRSSroCJrOHGMPvLIw4vjs=;
        b=o3IOgR00iay245NhG8BXAZ11VugRN9yTvu5G6MaZYAN+v7ab9kA439qfGLL8pcNdaA
         Axt+AJ3cQPEzklgLrV5UfncrdDzK6IHgaJEVAEbneaR5FdwjciVev/6pAQoE4vK+Qd9b
         sg9E1/Qg41XuJPt5KNRnP6THnqfVZSeTPOxspFeH+C1IQktDF4WhBgbJF7rem2U4o8zO
         0GUXB5wCZRnjPKpNPj8qJGCxRkRLpbFgEVQ6ciG+1r6JP00b0+/uAu8VKP6jW2OyJCqn
         ie1iUFDAf/5pJcX/0hEZJFCkKm/2ojOm5dqrrUs5KOXktsu3aSaJRPuGvlfiwJNc3Qeo
         8VWA==
X-Forwarded-Encrypted: i=1; AJvYcCUw2XITADPaa4RUPbo1eDLrcuFFfGpNMszyLbxlZ1xVmvJ7jkB9uFxSLOxNGFYc11y5J/kYxjI/onXO7C0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxdbHeIO0lx3HBohPW4xWDxLpsNtu2AB0bTVOOv2ZpsGwDa/fG
	aK+iyhwsTNKnTKvB45Nfs64YVa4m0i5jYIRPrPCVOeYGDa839c9pipflpf1OPX+tg0c=
X-Gm-Gg: ASbGnctwYYELpClkxc42QljdjC54jts69sFyrartkoJ63fYa93hPFZoRnZRtWtqJ3A+
	p/d/irPMe2mGpTlsWzor1l/k9csL6pnlxKIWi3Z1V6he6fKUE+lLwk4uBKR1LkDgHhMq1DtBSUV
	Oj11HU8O5a0Jbs7UjLi3eRkpWZnGnWIeV4UQtgQASdQns92Fj1Mv1xXR9oLPZKzDK9zi68suzwN
	GHTFdORQgsgk4XToitmSmWZb4FXibo+uwzb+zgCa5kldTiNP6p28QxpIv6b1I/Z49UcyXvcVJ60
	KFhDyukdfEI7pEdZnU4olW+OYFJthenG2R6sC14+39rs+GwK+1onPAnM6ULybEvHbcHoJO0EXBS
	1g+4XbV+eCWW1nDIZMkG5seG9v4U=
X-Google-Smtp-Source: AGHT+IFtHK6p6wGrGRp+/Uark86W3HpnkGxzK5no2sq/+GtMDf7N3+z/MjO6uU/3WYiZf7Bgzm5AWQ==
X-Received: by 2002:a05:6214:27e2:b0:6f5:4055:83d9 with SMTP id 6a1803df08f44-6f8b2c32c7bmr45344226d6.6.1747405097419;
        Fri, 16 May 2025 07:18:17 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096dda9sm12537746d6.71.2025.05.16.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:18:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uFvtA-00000002g0J-0A2r;
	Fri, 16 May 2025 11:18:16 -0300
Date: Fri, 16 May 2025 11:18:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: lizhe.67@bytedance.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, muchun.song@linux.dev,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] vfio/type1: optimize vfio_pin_pages_remote() for
 hugetlbfs folio
Message-ID: <20250516141816.GB530183@ziepe.ca>
References: <20250513035730.96387-1-lizhe.67@bytedance.com>
 <20250515151946.1e6edf8b.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515151946.1e6edf8b.alex.williamson@redhat.com>

On Thu, May 15, 2025 at 03:19:46PM -0600, Alex Williamson wrote:
> On Tue, 13 May 2025 11:57:30 +0800
> lizhe.67@bytedance.com wrote:
> 
> > From: Li Zhe <lizhe.67@bytedance.com>
> > 
> > When vfio_pin_pages_remote() is called with a range of addresses that
> > includes hugetlbfs folios, the function currently performs individual
> > statistics counting operations for each page. This can lead to significant
> > performance overheads, especially when dealing with large ranges of pages.
> > 
> > This patch optimize this process by batching the statistics counting
> > operations.
> > 
> > The performance test results for completing the 8G VFIO IOMMU DMA mapping,
> > obtained through trace-cmd, are as follows. In this case, the 8G virtual
> > address space has been mapped to physical memory using hugetlbfs with
> > pagesize=2M.
> > 
> > Before this patch:
> > funcgraph_entry:      # 33813.703 us |  vfio_pin_map_dma();
> > 
> > After this patch:
> > funcgraph_entry:      # 15635.055 us |  vfio_pin_map_dma();
> > 
> > Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> > ---
> >  drivers/vfio/vfio_iommu_type1.c | 49 +++++++++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> 
> Hi,
> 
> Thanks for looking at improvements in this area...

Why not just use iommufd? Doesn't it already does all these
optimizations?

Indeed today you can use iommufd with a memfd handle which should
return the huge folios directly from the hugetlbfs and we never
iterate with 4K pages.

Jason
