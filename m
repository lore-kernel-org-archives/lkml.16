Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A737B15D1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750119061; cv=none; b=Jqh3jmBqdJDNRD9AYS92FxhqcdZvExomH+zIS/LCSO0SPGp+USBCylluYMEm9BhnrOBZTA2wEmtntrARStdFDKjJ38zItDDxXKfPDb/j7PbHCLDtZ02FlhKUeiDFEXyI4d7w3/K0bkDgGn0rwS3TM5R5jju+/4pVH6lzSYxUORc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750119061; c=relaxed/simple;
	bh=cW9a3H2Jb1XORPCWPEbQXH89DofL90Y/4tlpYncP5Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtrqnjHIRq+wX8nSVdez7aMkFyF8M1+wHoJHZfwvadjRsBcfPiNjsQLZ66+zbx/5tJBmmYlyWfFgP4SMhUMFu6/9iKiL4xezeqMfC3YHFicpQCCkAT5hXIep6aNHGWdbjZ0nmScqdZKJDEMuWvGmhDLVqNVnrZuXOAHZY7ieqHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=RDXXWZ+K; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="RDXXWZ+K"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a5a196f057so111157911cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750119057; x=1750723857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e5TEqGP1dA1ohDNNPEUIn+95Q5c5y2M6lr7dUEc7k9U=;
        b=RDXXWZ+KwE2+4LSb7ctQH5GYfTiJoYS6MiwgxmT33G10W7tEFaFSkcd388+pg4rE4m
         xiWaBLGZsRGBy14UTyouhU1t7kOqj5KzaKH5QtRLu7CvEhD5+xMqTI9JkeV+kSHVZnRI
         43zoXRjbeXo5ciWP1X2gX70UdSjz4+Mwt5dJfkVvdmyxTF9BYIa5V19n+HLUlgIVKKAs
         XdGL6/eivkNxEeQIpc42ogywATi2GYvM0WYVTdXboz6LcCGTmvg52KaSDHq0+5/YXDPF
         Xxl1ek6rJbsL8DnDnVSa9mlUpKhY30ZqGyqRCkzGgnG2opZDOYn17cpHe0T2Fhd1ek09
         F/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750119057; x=1750723857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5TEqGP1dA1ohDNNPEUIn+95Q5c5y2M6lr7dUEc7k9U=;
        b=aVBVCohgO9zNoEwmKEnTMV+5kcI/lQ0sm/sJohubIIyltJOI9aYb555OVpWKaLTvRA
         fPF9WXwW6CZhCAs1I94M3Jqirl0Wv/wiV0ZRWQzOvlIiU6gw5BDLLivOyAyOhpE/7pFF
         BXRlW0FP7OCuY7m8eKmR6fr6fKPPSKBy3Xo2s2EwWIrc+OkfTlr28aNXZfmmBr7rC8M+
         mV5Qu1goiQWy/AKuQzGfm4QVWh3iHO94wpHKd9mYHZcH5nWGR4Vp7j/bsO+oWH1PVwk2
         rc/f+LFvzr4C+2piuAY7gYvUtkpQYGhEfL/0/LtSQFYxC2MECVwAWbjIlGvs+2ufKRzS
         6gFw==
X-Forwarded-Encrypted: i=1; AJvYcCVYLyYnLSi9R6hZC2NkEGusegeGLOP82zcGBDb5Pvubgk1oGNBCLvG9XKtWcJ48u3BbR3hqp8Fw0FlPZ8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsShLw9qELHULkc73hq/2rSm7zPoLstDqo45yqLW0WrM1ff8Dw
	VXM1WBK26vPmLN6hKD+lcpbhxpjhiR6CaiHcqyxbvYsj+BiJbdxc9TdtPUJwwwZ47WI=
X-Gm-Gg: ASbGncs+IS1LYpkCGolLMFLi/RMTPlN2fPX8sT82+EiUhbXSP1IT2N3wgrq8nG5llmN
	GmlzzORgGqcMZpREomJb69Yqm5blBVwfc/C6bWqpYbevGwM8UOi2AJKl194cmad/012b7A336zh
	EfE4/kABqJ3i2XLrssrp0F4ogobzcFPrASIfxfQe/38S1bB00Mag5vOCbq1FMEhAUaSHBoFcQw2
	ninAx9troennOP07TBEKifyzX/tagMfNIAgw2R8V/77WFyRNJVME9YmNdc18l0m6XLEdSYAKw6R
	LJOrZQQ6/kx/UmkqV2wHF6Cv0P17/+59Ek73z+RkxEX5PdiqCIs6YLLdxw==
X-Google-Smtp-Source: AGHT+IETz9LYg5ng7mTZU0WsBXmtI5+6OhKkrzdiTTp9Ts5WqaC5ydvNWoYbhaOUC9it+gTF/lSbLw==
X-Received: by 2002:a05:622a:87:b0:4a4:3bae:8dce with SMTP id d75a77b69052e-4a73c597286mr190961541cf.33.1750119057584;
        Mon, 16 Jun 2025 17:10:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:cf64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a3103a5sm54775971cf.30.2025.06.16.17.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 17:10:56 -0700 (PDT)
Date: Mon, 16 Jun 2025 19:10:54 -0500
From: Gregory Price <gourry@gourry.net>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Alok Tiwari <alok.a.tiwari@oracle.com>, linux-doc@vger.kernel.org,
	linux-cxl@vger.kernel.org, corbet@lwn.net, dave@stgolabs.net,
	jonathan.cameron@huawei.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, linux-kernel@vger.kernel.org,
	darren.kenny@oracle.com
Subject: Re: [PATCH] cxl: docs/devices Fix typos and clarify wording in
 device-types.rst
Message-ID: <aFCyjkSB9VwZXjPt@gourry-fedora-PF4VCD3F>
References: <20250616060737.1645393-1-alok.a.tiwari@oracle.com>
 <aFBUGTM4fpwU749k@gourry-fedora-PF4VCD3F>
 <b2acd80e-38ce-488f-a6d8-8bdad425534c@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2acd80e-38ce-488f-a6d8-8bdad425534c@intel.com>

On Mon, Jun 16, 2025 at 03:32:44PM -0700, Dave Jiang wrote:
> > With that change you may add
> > 
> > Reviewed-by: Gregory Price <gourry@gourry.net>
> 
> I fixed it up with your suggestion and applied to cxl/next. Please check and make sure the fix is correct. Thanks!

lgtm
