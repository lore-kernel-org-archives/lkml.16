Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDFD22FE18
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958685; cv=none; b=JoXvPQNVpZWZ/w2Eww14g6CIDm2P02fUsZ6qhtpiBY7+Av70ru0Mxz0qvBJegjDiO2ZXvBeySvb8LKe1hAj+G0Zbs8k5HXaZZAGjqj4ajGKPkXCLvUUtZw6vNf3Ft5WrL1I2zPCUcCTT7PraNeMUJ7RQ3dTSoIMUUeBJrsAjLkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958685; c=relaxed/simple;
	bh=DZgdvaQsVzy3FEkZ9qjIOfWCU7WN4gcYp04RM+bGGPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdPhxCM5W/pSfG/oTm1Zjq5+BgOO/eBuM0CsEj4cn2Mwr77F2x7XOdjp03OxqI7hf8Koxyyq+PCqyyVNi6+SoI+e2HgcUgsZ5Ebmmqpc/mctbysjMpFMLBlCcTaDtFqUSxcZJGiA4qLzj+9ULNSb+dUUgQHuBOBZfJ7cyjqmBXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IedptUNT; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IedptUNT"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d0997d3ac7so660762385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958683; x=1749563483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
        b=IedptUNT6Ql+/A5IUfTIL7owDIGPJY0PsmqMowMi5fm5w+soHZVqfQoQ/cDhRyyczv
         gv0wx05D6nHlPoaVhBYfP2NoFtlfEgPYO+Ch19nMcWVuzoPb0f0eCVPT/4CG6/dc7BHT
         n+YnHg/hH46ufdhzaX4fPCz7fdGiDzfGY3LntiePxXSGPACwjQotc8xocpu/j862zsQz
         aE0A4G3dVJHskD0CTgXP9wDqaQOPOqXniIfLaZGjazqE7x+jp2UNzQhfuJDjnpDeqMri
         vzpw3L9W4Ygj2ge2rovOCCf5BtnKxfSuTXZie1+lX5SvFbGbR7TDt8/rDu0mRdjOGZcH
         wWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958683; x=1749563483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
        b=JWD4sS0+SQxDDNrNcTkCj/ib+vqTGZQeHHg+HBWLgGlBLuTKSIJN5/KYIP2MrBlefk
         pxRlgWjstj5pjpcqOg6Q9s1ABILQ5S3lvk+H+oBlLa+14EZ0kK3yfmBGUZHg4JlMFKfW
         ESJjQc5fsCqaQCF8QYCJR9sVjLmiNF5CNcWa50wSa0+Nb6n/kA45I3iPHrNar413X24v
         VSP/+Jm4wEmssxy1EtrcVygI4WzntqZbX/gduMsbFfXU2Uz8vW6x/N9mgx3xmUEp6MTs
         B4EWth+VIhcvWYoH8q5dY/PvzPTz2o6x/yc/89xlaJkaBys+/yRCICUmfgHicZ3TwfJi
         Cgig==
X-Forwarded-Encrypted: i=1; AJvYcCUppPYOUYz5tSXdNL9yQITqsqX+4sqS56AZ2lfgwM0bkS2JghldlecgyYGA5GO2Lx30D8HBv0DX9mmpL4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwETGukhapppsfIMhoV28hCd28kfWuA1XAoIQNSzcxjfdMB36Jv
	uLQ853jetWSXfuWK8Zzgnx0mD7Nof0mNaJQrAvxcR8a1l/4l+R88SVq5Wm0meHOMNz0KGildpnn
	lFbtZ
X-Gm-Gg: ASbGncuRjUiZQfrvDlPVWxFm4oK+MsOtl/D1yoadAMPzW4eFuUplqKaOs0qRXopTl4X
	WEvmdMGm8DAMtcMdUAXU0rY0EorOFYw3ASdFo5GcMplv6zmfYqkuaNr5YcbHkTwRnIqs3Trbieu
	pAhWbWhub9lr8q2557T3pS7eYwOh/mxMDVe3PeiZxcILBuefeNpkDc+B9zgHsx8qGCtzBMmmlqe
	SAtroeRZFRlwZ4QE96KH8DS7OLHn/54tbbeXiUTDJvsx3E09XlS3nKG5Tv52AwxRY0F0cLSvsdl
	Sco6/yZrzUYtFYafkesN+RYIsympG7JpcVOO9TdXZeWmkBf+W8XW3kBRylG1yO0AlfLpjQD4khj
	sa8+L2MXgtno5MvN3Czu7ihJKdTi0bES+BfmTvA==
X-Google-Smtp-Source: AGHT+IFvqH9ubcC6dbv0UqQGW5DGDtp+BZ9QNaQHwHo+bs9Vg0oCfSh3AzQ5xeJI5fTattmwccxXPg==
X-Received: by 2002:a05:6214:2aa3:b0:6fa:caa2:19bc with SMTP id 6a1803df08f44-6fad916605amr159392986d6.44.1748958672893;
        Tue, 03 Jun 2025 06:51:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fad0495cf2sm68040826d6.39.2025.06.03.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:51:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS2p-00000001hDX-3xh9;
	Tue, 03 Jun 2025 10:51:11 -0300
Date: Tue, 3 Jun 2025 10:51:11 -0300
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
Subject: Re: [PATCH 12/12] mm/memremap: Remove unused devmap_managed_key
Message-ID: <20250603135111.GM386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:13PM +1000, Alistair Popple wrote:
> It's no longer used so remove it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/memremap.c | 27 ---------------------------
>  1 file changed, 27 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
