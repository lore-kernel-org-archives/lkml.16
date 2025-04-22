Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D262367B7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308716; cv=none; b=RCd/B7+OIJ3DC/Pddy4nqwzyhnrpp6KzZXy0ixLBCDSdioju9SWNDS0IoXQZ6K65pztJcc08abQCDD5CzXbB7/fYRVbaDirsKfBHTcgibiqiX1vcNgV2OgfjK/LgUzcO9teZa7xZrdTB/QVArcG7lsjZMpq8N2EtsVEHn4bb2Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308716; c=relaxed/simple;
	bh=eDDGJ+jglbP09EosM6RIfoGJYGCs7gmdzWKgCV1xPO4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQXFFA+HYp7XfibXXiNzsS0SyNhCIsp56aV9qMyVvVnowvmahGoKW12MdO6glC6j23ReG+wI/8r7VEGP4cE1P8iqopoCzGBL/J4iXzBnNAR7ybnxSHuqUoFneSnBfR57nmOsAL3Yp5Vuq45Nz49i5mzNuVi3a/YmBYxLAMf8QCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89C3B152B;
	Tue, 22 Apr 2025 00:58:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59B8A3F66E;
	Tue, 22 Apr 2025 00:58:28 -0700 (PDT)
Date: Tue, 22 Apr 2025 08:58:26 +0100
From: Leo Yan <leo.yan@arm.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] tools build: Use -fzero-init-padding-bits=all
Message-ID: <20250422075826.GA28953@e132581.arm.com>
References: <20250402173056.829400-1-leo.yan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402173056.829400-1-leo.yan@arm.com>

On Wed, Apr 02, 2025 at 06:30:56PM +0100, Leo Yan wrote:
> GCC-15 release claims [1]:
> 
>   {0} initializer in C or C++ for unions no longer guarantees clearing
>   of the whole union (except for static storage duration initialization),
>   it just initializes the first union member to zero. If initialization
>   of the whole union including padding bits is desirable, use {} (valid
>   in C23 or C++) or use -fzero-init-padding-bits=unions option to
>   restore old GCC behavior.
> 
> As a result, this new behaviour might cause unexpected data when we
> initialize a union with using the '{ 0 }' initializer.
> 
> Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=all"),
> the kernel has enabled -fzero-init-padding-bits=all to zero padding bits
> in unions and structures.  This commit applies the same option for tools
> building.

Gentle ping.

Thanks,
Leo
