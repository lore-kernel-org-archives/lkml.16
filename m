Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29191EB1AF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355117; cv=none; b=WOB/ZbtN+Pkk/2JqLk6HLnkm6X1UrAk0+nF0hzsA58hWmx6m+W2vFPEMRRdCrRsjULnzAV8lzwmPD8hhpxiUFPZoXzLMvdgRflS3ZveZ/A63ZgopvUdTdqvoLYVzyAP5fM2uwAAV7EFTj/bEmPOj8R/T5ezd6dm7gqjDIony7mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355117; c=relaxed/simple;
	bh=IJpnPnrvmdznAnhYExSv88kU9YA6wC83pHo7gVmH7Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtcK7q10nB0IJHeiJwXmA13CkcodS6gm9dVgMAI0y/APYBX9twnjVYTpORnOMSRbFbUFMpM9d3FLcSQeNE6ZNmKJh1Y2hZD1kPQd5ZGNX9LgPNBfvVBxKFIxpohJMKaauiD2dqx+nzsN4+yNsHaCOA/7jx7dEAF7wrA+qNHuAjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=XC8TlY7V; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="XC8TlY7V"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7F48646242;
	Fri, 11 Apr 2025 09:05:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744355113;
	bh=IJpnPnrvmdznAnhYExSv88kU9YA6wC83pHo7gVmH7Yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XC8TlY7VHL4h/Gk42QEUy7wNI37WnG1ayWehUJT1oXAQO7zuPUJcZHnd3KitfhNc9
	 Cu0l0g/rac8KBalO7wi+NLzNwEDHMlbTQPJsDwvK4WV51VjbfuSOO6MpeHmxz7PRU9
	 xur8fnu+/JmtzIScEpOFVQfV9s/dlC5pILxJP5l4oAR+kQRLftGv391SfERlHuifky
	 5aiOj2t8KcVrjGL099UjMtxzxnzNVhGSsvhG+6UBVHNIGHta2d1fPFbldaSC75AZEf
	 DYXZ4LxdhGGLv3vw4AitJHoTLOYRSfZCVKoRT3AD4nAjSmoqxUJAkN7JD55lw7+Dis
	 wdnlzXXNe7bdA==
Date: Fri, 11 Apr 2025 09:05:12 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] iommu: fix crash in report_iommu_fault()
Message-ID: <Z_i_KGB-ew95szQ0@8bytes.org>
References: <20250408213342.285955-1-pchelkin@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408213342.285955-1-pchelkin@ispras.ru>

On Wed, Apr 09, 2025 at 12:33:41AM +0300, Fedor Pchelkin wrote:
> Found by Linux Verification Center (linuxtesting.org).
> 
> Fixes: 6aa63a4ec947 ("iommu: Sort out domain user data")
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>

Applied, thanks.
