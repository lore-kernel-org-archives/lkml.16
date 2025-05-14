Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE1B225795
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226845; cv=none; b=Jq6RPfLq32DL/U9F/BtoHin9sRjkdd3SWaa++Y3UrTz6qd/UMgvxmvzp+mLG5BEm+xxmQTO+vOHPJkkHPJJqtnfPGc0179QAhoybc927IZmzlI+9q4Crxqf8eGyZweXGBVLI2UlN0vFDjzHKCOnThbxOKy2fEcVSN9S/bHYzF0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226845; c=relaxed/simple;
	bh=emNvKAL6WxOIayo5hU+Fv9v/5W1lyX7L3acFQrHOjvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jr5TT6ZiseKJQZyBnq6DzBjdudgS1tUY3S6Dy7lixbh5AKo9TtH7YGBE+3pTUsgWzAmkSKBS8M5Z9T4wP/l6qTQLW0rhuyk3xjgoAKeUo6F2q94uE2srSrsJSMtMaNmdgFOZCdoN8sx+Cqv0KWCFs9ljMxWGE3otAnVv7NB8lRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B800A150C;
	Wed, 14 May 2025 05:47:04 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C9653F673;
	Wed, 14 May 2025 05:47:15 -0700 (PDT)
Date: Wed, 14 May 2025 13:47:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <20250514124710.GA389636@e132581.arm.com>
References: <20250513170622.3071637-1-yeoreum.yun@arm.com>
 <20250513170622.3071637-2-yeoreum.yun@arm.com>
 <20250513170622.3071637-3-yeoreum.yun@arm.com>
 <20250513170622.3071637-4-yeoreum.yun@arm.com>
 <20250514093019.GE26114@e132581.arm.com>
 <aCR4x/+Wp8JoqG9P@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCR4x/+Wp8JoqG9P@e129823.arm.com>

Hi Levi,

On Wed, May 14, 2025 at 12:04:39PM +0100, Yeoreum Yun wrote:

[...]


> > > +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc)
> >
> > I would like to change the return type to int, so the error is handled
> > within the function.  As a result, the caller _cscfg_activate_config()
> > does not need to explicitly return an error value.
> 
> I think it's not good since cscfg_config_desc_get() failed only when
> try_module_get() failed and its return type is "bool".

Understood.  I thought it would be easier for later maintenance if we
encapsulate error handling in the function, but I don't have strong
opinion.  It is fine for me to return bool type.

Thanks,
Leo
