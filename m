Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8942770C
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 17:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257024; cv=none; b=ZmK3gZLihroH7QRcMH4Xpmimf+7fbNj9Z7b7/Q7lDD472zIDXKxw1O1jit6H/2zqX2gKWdQEni30//yiF8/zRrgjTYLMsA3wZrMC3DouMU51lnCoHr9etHaFg9PbA/bP9vNtjL2ixNs+FSw8IlJRqRdEc4BHC3BuMk9SO+qo6iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257024; c=relaxed/simple;
	bh=nxw/sNxTBMGTmdI4rJfjXQ4wF7yDBPL6zbd7NM4Lcqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFHrkDcFCF6vPU4XeLgBaB/3TpJ3z9lj1DsEcJXV/2FBDRrRY8Oe4DPju6baPJJ4tJxnapp4/a2Ym3HYXlSizQCvn5s+HnGYSouOa8AsZ0VEk4zVE9MfetpWKT+GfBpz+jPYPZxbvIUVxA2INBI7kvE+8daiPrW/k4zvIxfZXdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s30FAZP7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s30FAZP7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368B1C4CED2;
	Thu, 30 Jan 2025 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738257024;
	bh=nxw/sNxTBMGTmdI4rJfjXQ4wF7yDBPL6zbd7NM4Lcqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s30FAZP7HOlf/3Ish22Pj8sdCNuiZxF1mykW103nSdpcePz6DCvEoLxf4TWA9CMEZ
	 uaQoK6Sa4lpzcSJXzFbgjyYKB8J3Fb5RJtY1zhaicClnUD/OUD99xbqGjSQqlDu4G+
	 g/O4t3Jm94Q7ccgXnCQVZbs+RpQJlywj40e4/Qy/DhZnoXQmknH+FNPUtbOlXY8llR
	 mXlS/i7B6hvLlyjwlasq814o/j7hmqRzoWS0J2S9r3N8sBvjclhr8bWNR/WunaDiCN
	 4OrKm+UBbyvzDp5IeuLvV0hhKKbyqg141+dc2WgulRt+BeCAQxiTJUAtg2jafZy9uO
	 z3SSd1LKm157w==
Date: Thu, 30 Jan 2025 18:10:19 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Yu-Chun Lin <eleanor15x@gmail.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, jserv@ccns.ncku.edu.tw,
	visitorckw@gmail.com, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] kthread: Fix return value on kzalloc() failure in
 kthread_affine_preferred()
Message-ID: <Z5uye0c5JQ9tZ1f4@localhost.localdomain>
References: <20250130144849.1249084-1-eleanor15x@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250130144849.1249084-1-eleanor15x@gmail.com>

Le Thu, Jan 30, 2025 at 10:48:49PM +0800, Yu-Chun Lin a écrit :
> kthread_affine_preferred() incorrectly returns 0 instead of -ENOMEM
> when kzalloc() fails. Return 'ret' to ensure the correct error code is
> propagated.
> 
> Fixes: 4d13f4304fa4 ("kthread: Implement preferred affinity")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501301528.t0cZVbnq-lkp@intel.com/
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>

Queued. Thanks!
