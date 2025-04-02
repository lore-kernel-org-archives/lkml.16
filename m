Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FD33597B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 22:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743633170; cv=none; b=MsxjbQ9Y+gBDfeOYf6oiCo5JfyCxO1Ps1oBaVfsxWuNkjhhPgv0km27w6B3wKuwU4g/zhDDA3LzTECrN6GV68QMu62kTGJkN1AERaYDb9GaHIWCMDyXFEzt5k+yZhJQhTLK84P2MXsaMoamd8I0LGzjFbAKxo7oqIE6EVWpg/k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743633170; c=relaxed/simple;
	bh=2ODM/RlzT2gyetcU0TsieGnzB8CpYRIKICJRUjB2mRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IW7Bq3KziyYmSQhO8eKMrhxP93fXExr3TSoiyvozgzhsNXQKENFf/JbpARZQlltdXqjbGf97woWSr8jZINGLlIxb2qy7cql2rsxcFAUQ7L7u6W0Ewraz4nyHrv70CzHQY1wGUwvN4fVqxHRsasJjjyNcUGyEAZuFEYQpB9Z5KYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jssT5Ib/; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jssT5Ib/"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c560c55bc1so29115585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 15:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743633167; x=1744237967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQIqy2Gk8MSJ4ovtO04TmjPR/yZ/xnoviDmFhMCTx7w=;
        b=jssT5Ib/RAe0do/0S8DBE7mW93zp5P2OFP/a1aPRIYF0iZntYEySsIOAiiGfuH1Sna
         zzZc3wA+Typxaix3AcfnlHNqWCqUE7AAW+VhMUcFamb3DRo131tifxn5N4MpZ7PihdzQ
         jF0v5BOrg6yhBb8nceo/FFRVT71Y+kNw0b8fugEfZzCjEzMnERJe1b+Hed2TWxIi9YAs
         msS3DxTEFkOehChnlCg29FndGRrz976FDNhSdmrdeClFMSaxiBDxbpvmpxZBEaXbcCpJ
         Tnd1bnWAmatBQQykPpxN93guDticiU9wLslQ0AkybDbDa23jg5E3JuTXFSEXT5RjYb+l
         3tDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743633167; x=1744237967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQIqy2Gk8MSJ4ovtO04TmjPR/yZ/xnoviDmFhMCTx7w=;
        b=mAN42LGifxDzoIRTSLVfpmcpwb4qHOQmGpTjpXdrylL1+RonToaHvpSK+waRjPWzGZ
         ji6ZoLuOzqkz7mIrz8MhGpFBrkEQDzKk0SHy33fIeQzfUwqlf0i3miRtw2ArvfECdEwu
         oxyYl4OS4xytL89UqmkQCunRueYp0EBhCjiuSlh9XrUuKGrGJmnd8Jz4i8rmjzYvK/Kg
         M+/YX6bnD1WAXIXoiMmW8Wna5ttKc1qU+JWR5AB3kRHos8wQ8jzrDWZ+yX7nYcacZq3D
         QbRoOEEP75rDTksfDmPHRtkR05EU2Vj1dQt4liUVvHuymXLH9uBIvnioxqMy2+nY5EU5
         XJTg==
X-Forwarded-Encrypted: i=1; AJvYcCUz9kUhIKmwuBXffGJD8TLUiElBlXtUJfJoGRzhpT0E9cKGhDnA8VN6DraJnSXMahJT+q1ThdcmUO7uDIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkIoPcvWN/642mvpspjne8U3eLFyN/Ajw3mSDC2ynjPX6Emi3j
	aN63MwFxfoLPdw7Hd12bPtQ3WrJg8dQFBAJFc/Ma1tWqurrwi80oeIjmVz5qJOQ=
X-Gm-Gg: ASbGncuhKLbMedJhA+nx0PBskMFK2KJbMxHLted0s+cLyyqdt4JkIN/OB+t0G3A7CpD
	XoK9qW7CuhxY0M9VCVZAefJpZ4HOGtaD70NcAReRBKM0CpjfFxyTwpeFTZuky8UNG5EpmTuuQR0
	o+PVAtYll1/crIjGVsekBOoRn8s0Km9tN9b+mCWpr+gYnpNagFCDcJrNmmshGldXy5hZBHH2pce
	7eZAH5WpXum9PXX1ab3H+hrd/1oSFnvuZcf68gsK09frPU2f6SYVJZ4K28K7SbMtlXnYQ3aWpYf
	sQ8ieRWJuJh2rWWNnbgG41y6V0vgSvGBJ6jIMcJr3ZJoUTp9dunHkM2VrTsslwudkZaDzAwiAWe
	qaL/V/NCoOES9C3RuCoP5ZOKkbpQH/3A9M3lIRQ==
X-Google-Smtp-Source: AGHT+IG/7mJcAb8OY58kd5KjEdDwKiiPxt64fBsAAxByw47GLrV+ovlf20NvU/LB6WP2ctWSL5wK6w==
X-Received: by 2002:a05:620a:44c8:b0:7c5:562d:cd02 with SMTP id af79cd13be357-7c75bc6ace1mr1248446385a.41.1743633167623;
        Wed, 02 Apr 2025 15:32:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e96cf01sm3584685a.55.2025.04.02.15.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 15:32:47 -0700 (PDT)
Date: Wed, 2 Apr 2025 18:32:45 -0400
From: Gregory Price <gourry@gourry.net>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, vishal.l.verma@intel.com,
	dave.jiang@intel.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, alison.schofield@intel.com,
	ira.weiny@intel.com
Subject: Re: [PATCH] cxl: core/region - ignore interleave granularity when
 ways=1
Message-ID: <Z-27DR_D47HkuR-6@gourry-fedora-PF4VCD3F>
References: <20250402193443.944654-1-gourry@gourry.net>
 <67edb335dea8c_1a6d929437@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67edb335dea8c_1a6d929437@dwillia2-xfh.jf.intel.com.notmuch>

On Wed, Apr 02, 2025 at 02:59:17PM -0700, Dan Williams wrote:
> Gregory Price wrote:
> > When validating decoder IW/IG when setting up regions, the granularity
> > is irrelevant when iw=1 - all accesses will always route to the only
> > target anyway - so all ig values are "correct". Loosen the requirement
> > that `ig = (parent_iw * parent_ig)` when iw=1.
> 
> Can you say a bit more here about the real world impact like we chatted
> about on Discord? Something like:
> 
> ---
> The platform BIOS on "platform-X" specifies a 512-byte
> interleave-granularity CXL Window when 256-byte is expected. This leads
> to Linux erroneously rejecting the region configuration of 2 devices
> attached to an x1 host bridge.
> ---
> 
> That way distros and platform-X folks can flag the importance of this fix.

Would like this inline or just in the changelog?

~Gregory
