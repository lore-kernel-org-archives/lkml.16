Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240F71C3308
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271081; cv=none; b=U9YVNJ9Y/CM1SrIh2PU2KtcMisE/k96IoL1+9U5l6AVa+noS6Zp2/FtF6fH0Vbsmo1yidiic5vPZ/3cZV1R15PUh2rHY6u93Sb95wPIRiTsOsra+JkWI6yxDK29hI7sphE6l9NRBsxxDv2jC2mdUNOHnt3voi42DKH8qwdtpdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271081; c=relaxed/simple;
	bh=k+XedyXl5SD08dTk/E54qLjqLAa/Cr83S38IxfL/Nns=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=V+c+SIP8ljZw0JJgSzK53/7e/cro4Zo650M5k4bpZauqeZ3JdSvHNkO5jfxbfgGV/6nezE7yMIQLCTJLUtme785chKPoj1r4HILZ5shYMdx1CjTjOYVPkLstVfMoNGHG2D11OMTSwp3FBCy6t4JkLgc2ox2rE0ZIyMM76mj94f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dDdl5JTy; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dDdl5JTy"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739271075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2W02iMebnm9A9U4nl/qGqRNIMJdPGMT4B+rveeRbzfs=;
	b=dDdl5JTyzIkh8gpSG1vgNF4WpFLM+Ff2uBAOdrLFtETJoOsY7yPWVhjq9GryN5scpI1bzp
	Rs1kzCoO/0FGVpGykTVItHf/yr6I05e/pu55X80uMtRPb+sDg7gKYrDsPNqqmmqTAesMeI
	/GqbjyxariMFbzBeM7Rp7kwYEjdIb4Q=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [RESEND PATCH] ext4: Use str_plural() instead of PLURAL() macro
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <20250204155707.4669-2-thorsten.blum@linux.dev>
Date: Tue, 11 Feb 2025 11:51:02 +0100
Cc: linux-ext4@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <E411941E-86A3-42DF-8D8F-87A14F80B303@linux.dev>
References: <20250204155707.4669-2-thorsten.blum@linux.dev>
To: Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>
X-Migadu-Flow: FLOW_OUT

On 4. Feb 2025, at 16:57, Thorsten Blum wrote:
> Remove the custom PLURAL() macro and use the str_plural() function
> instead.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Hi Theodore,

I'm wondering if you saw this and it didn't get lost? I first sent this
mid-November, and it's been a while.

Thanks,
Thorsten
