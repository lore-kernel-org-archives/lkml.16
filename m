Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FD6238C12
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958528; cv=none; b=u0mgONF5ksMTI42Y0digdF4s1Qk2mhK2Drg/3srfdd441V8krvfhb5nvf0sHUSkvwLAgGoi3R5lhOmnEldG5qY+vB+q7QLpfxrV7f5qlG/U/KkTQq9ojed00gzevsNWK9ZaT2p5Y1uZ1Q4bVnvyVuMJd6F7BtGOmVjR3LvPfGgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958528; c=relaxed/simple;
	bh=RcXEhllfDG955BJXEN1tqIgpRJ2MsHzTBep7rZd+naY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTGgyiKs3O0JhV60KAblLba8UU5t4RA0De2NWgmHgN5TBWEWygS+Ywh9izZASx5+zf6kBB2Uk+w4jFUvp+MHoHFqJLlaEcs1UeTrC+pUfo77/0JXsQRO5lfY4i8+Etl0aU9a4S6wJSIG27KVRgpKZ4JF3ewftajmlWHCcLMG4bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=KoP8asrO; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="KoP8asrO"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so47150286d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958525; x=1749563325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=;
        b=KoP8asrOMIEJethoS/itlxDSGu3+zKoaKa8sDFbGOOwqgCYGuYTFZfYS8Mnkx+tl2G
         LjxtWypcZcjUxtywmuy3LTV23DzErA2mqesc1QMxuKAF1XQppJ55Q57IUPuLTyiUn0Sk
         YS/uss7FvucPNO97r9KoOsxXLFtUQJm+qNUu/DkymsWRGtNsFPMKPn5wT9vBJuunJkBi
         /ukr6MpVltCAllXmAe7Dx+EhPp2hMVvhbhJNotnIQu7A2DxkaHLbi1S2kV3TyJK+7eoh
         hFWkqGTwpByFV0dpwd0TOBMUr6BTdcw6HqglUcBifaQWg5i7gw3KGyxZEuz/Utn1gmBa
         rs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958525; x=1749563325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=;
        b=kX+oqBxYxDgTQmW+I1OjuZIngU6OEJkgskZH2Th52IUYiYk5THxaHhJTXF/PfH9DEr
         KXVC7pf5k2e1dK8XOwBbdhl0u/jEboygRlmk+DXlxbKTrVySuTmND8eyLlM2bL21yjTb
         GqYb8GIKCALOJr05oDcmW1jRr6j3L+WEuhWkQWCc7AHDqyon59C0K/FyRbLT8acd7Pz0
         dG7QFdgGetQ4qr781LcLU7y43ivwnHEoaIZlqf9ThSKHMkrc1QfDUYVUh3J48SqzzJTh
         n9JTZLpwznswO40X4UjeY24tsWLFEVhHBIgtNm1qmhuCdeVFZttEciS5zA9V6uCAJjZZ
         sMBA==
X-Forwarded-Encrypted: i=1; AJvYcCVbm0MDQYlTqqSHS0mAzZf2yQRD+HfEzWpAJM7X3BAjBNGjSOxry9FNjTDOZZiKDNK2CSVRy2Y52zjxMPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5rrd13f7jlbnPnlK53QJHNHXEUyQBTa20ZltDHPuePaoqxb3x
	r4o4O8dGjFiNCMGL6I5KIE27Psm1EptX4+IhWzQLnrVpwJXD6usU8UFsQ4kaY2LSZG4=
X-Gm-Gg: ASbGncsIpIyD+ExIg17CruvKOBEf7vRv/hb4DyqpHVXi4OmonzQmC4V/g4BvKXwwI3R
	0RtB453jy1DrPJ0JC2cZ3vmGDegjpcqd/v9veYPbaBkitmHhZgi9qsMvDp+OghFjcR+z48z7Dms
	Haf4aO/HDP2KMgxwkFOC9ppt56t0i1GI57BQ6f1s8HYNut48K9iLuk216gzvZQrqrRrIKiI4knn
	d3PEOxMnYFB1RJvonOoEQiVWb2c9FCB5dTFDC+pKekQwpb08fWJ5gFxgyvJZnxtfMrOJo0Vedjr
	1YCHdmz05WJnEWFSGbMZbZHwXUBIsO4cGMjECljhOA5m1FE0uCCOKus+qvy6yetwhCgl1S+rs84
	SYNtANj0nyvcHhnG9kIY/co16kSg=
X-Google-Smtp-Source: AGHT+IH3Vn4y24ccOnNjvyrMKRdXMvoXmINXxWtKUHHRDjsnlypx2qCEJce143rhCfMATkU1PKi1PQ==
X-Received: by 2002:a05:6214:27cb:b0:6fa:acc1:f077 with SMTP id 6a1803df08f44-6facebef794mr265266426d6.35.1748958525108;
        Tue, 03 Jun 2025 06:48:45 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a10e844sm842209085a.49.2025.06.03.06.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:48:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS0S-00000001hBt-0o7d;
	Tue, 03 Jun 2025 10:48:44 -0300
Date: Tue, 3 Jun 2025 10:48:44 -0300
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
Subject: Re: [PATCH 08/12] mm/khugepaged: Remove redundant pmd_devmap() check
Message-ID: <20250603134844.GI386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:09PM +1000, Alistair Popple wrote:
> The only users of pmd_devmap were device dax and fs dax. The check for
> pmd_devmap() in check_pmd_state() is therefore redundant as callers
> explicitly check for is_zone_device_page(), so this check can be dropped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/khugepaged.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
