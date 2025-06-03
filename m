Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C9B233D91
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957823; cv=none; b=hTitVOJid3uRpYpSXhi7nMAZgf/A4VP2KrzLJR5h/ZEdVo5sKVsS4bzTAT6w73DL/setG3qfnQupuq7JS/5rApdWmG49G1SL8CPCrmDuW+WmYvgGs6L5BQDMDXj9L2QxYfpE8okIFaKmk85Gu01sOCatVaPPgRzQD1Yt2r9jDmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957823; c=relaxed/simple;
	bh=MfnZO5lFJA5kphVhQXFmjyYwzPaWj6A9QLg5HcsjC6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExHtv/ZbQNj/KrhNno2uzJHulVYhx2HOEEopNTpD/3atVSKt2GbPmUbQmlW1ypiJFgnmkUXWjfmEqOwH2DTyld7pFxYJ014H82oEXNBXnr3mBwOorakkgjdMT8Qdb7LBUqn/I2qDuzimyWUiXkpCANMAusyAxncLSEPZQhzjoIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=QdRqef0e; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="QdRqef0e"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d09f11657cso510011185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957821; x=1749562621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
        b=QdRqef0eufvBDPsFNSKgItk8ioK5rW0bITD7h/gaJVlsLti5kJbkAWQoNEmZWRe68Y
         Q4oF4tefxOI7cERsX4wsVaBuaHz22hTf4BcC/yjkMVx+8DuPCBDLYZ3A+RWTRvaraqNs
         e7pqxu3qqrej8RwTwZermIn33SpopTq52Y2nm/rfb3Wh5IxZqh6cLkWQPdwWIBjD+YoN
         aiioFJ+ghZ9yPVDMy/MALzaSX/kPFwincvLa9cv4TcSSylFCgKj10d+Rbd3GZwiNMEHs
         ubZ2U/8vLM8FJ3hFzQB993FiXCNvO+ks/3rtygYKqSmy9D7l/904PPCBEYVreULiWIuI
         rFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957821; x=1749562621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
        b=fZlW2OXXdECpSRbBY4Y1C14lOkwcb0YTZtDE5aKNJ0D2bU0GNV4irrXBvom0kgBWST
         UtaCj52DhHwLIyTOPD3S2lE0zKA81FlaxZZQ+Hq0koJrNJr4djK4pluuy2Hth6hOTleT
         A3Ux9pcGRcMGUGr5j+3lt7oZgNFvwjOtJenFiZ3I9SpnWfLRbmplrROhF4DkCs+V0/7E
         vPA32OxoMQDX97tpT0zjnp2U1HQNM8ILqO49szDczwuE4I4BKxD88lLYXYJo60UtEa21
         Jw1T7nzA9hm0vCu9aHjPkbAfcTki51HKWttOkLlXmj5VY/l1AwAdTDMBM7SoqEuf/G/H
         TYzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJv25XZQEIfZqlwr9+5FQ2PyFPouOky5d979f/SxepLpMH9EHZ2YmuwjBS21sSY9xSJGq45VTzLBZruyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh6SAw/Y0x0jstKwmrhvrC+IFXsC4LoAZ5KIAokqk7gnjK6cHh
	kmTTTMyeu93m2ScJWjE7zHJdP5GEJka7m6Efk0+1w5AawwoJIWQFOyU7FXAHH4eXzMY=
X-Gm-Gg: ASbGncuqn6jDcQrWzrASm8At2deLzhc3xylYAIc9zrwpIGMsC+4mzNIl9kmKzLjHJXx
	jdRXsXQI6Ob754/SyXy/MQ7piy8tBaNZYkpTexK9aHeBBQuL2RIzWleMo+ddMPKrWVksqJ683j7
	VF9t9a6SzuCmZCS2bHE3UphLpLTASFoNx7vJM5fgPldZm01zstPrr2yiyG3glgWkwysC1npqQHR
	f87eHKKMcP7ws4ffV7GORkBAepkn0sa5vYOuA72m1FwrycS23UrW5bf9zNl/AamDzuzDTsDP1z/
	JQX0uXkbXNdS7paYW+3SiRREKELDbtOBft7d9Eu4tH3liF6eTgPEHu3HmwwUWAF7QkczN2S+VCX
	0SdYwKpfPhoRYtrVl9Br6unEz+to=
X-Google-Smtp-Source: AGHT+IF/1nQKKWghBymIv6kapapYp3T/T+mDb2uBcjAQYD1rkFwd/p2CMx7wy82AG8RXeUKzw729SQ==
X-Received: by 2002:a05:620a:4408:b0:7c5:3d60:7f8d with SMTP id af79cd13be357-7d0a1fb91a0mr2626422385a.19.1748957820692;
        Tue, 03 Jun 2025 06:37:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0fa38fsm842635185a.35.2025.06.03.06.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:37:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRp5-00000001h5Y-2rWO;
	Tue, 03 Jun 2025 10:36:59 -0300
Date: Tue, 3 Jun 2025 10:36:59 -0300
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
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
Message-ID: <20250603133659.GD386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:04PM +1000, Alistair Popple wrote:
> Previously dax pages were skipped by the pagewalk code as pud_special() or
> vm_normal_page{_pmd}() would be false for DAX pages. Now that dax pages are
> refcounted normally that is no longer the case, so add explicit checks to
> skip them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/memremap.h | 11 +++++++++++
>  mm/pagewalk.c            | 12 ++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)

But why do we want to skip them?

Like hmm uses pagewalk and it would like to see DAX pages?

I guess it makes sense from the perspective of not changing things,
but it seems like a comment should be left behind explaining that this
is just for legacy reasons until someone audits the callers.

Jason
