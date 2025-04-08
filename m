Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB493FD4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 03:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744084118; cv=none; b=cNoo4eDHIyYj9FSdpL56ZE+PUjIQz89OsVkS+B40zG3s/+lSnUIm1WV+v0qyT7TCwM++kD46i3TRUV3dWLsdK5jGBbe5MkAQ+9I9Iq9IWBhocj4YTgxfG82DFMw0pB3lE0OWfDu+EPJEiIoEI/dB++9aj0zkCD7YbGzeJPQhXqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744084118; c=relaxed/simple;
	bh=KB4Y/BMeUDgmVjp3gxCOOYO8zP35SnNcs87GAcd58VE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lDvm0D7Ofv8qhs0V6LGfVG3nlGTDmTtGLBcisuEFXDviUeZOz2ZNf3sGDur1LbLY1td8uQLhJ+BhWpJpbn3tM9vcCFdpwJsUL7htC9jmwku9C3znXxMmuvbvgzl0bSINhaB9egOTx7KgXXQPZFUt7bm2tiQNUbz3pnFfkKR6LRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVekWiWM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVekWiWM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4642C4CEE5;
	Tue,  8 Apr 2025 03:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744084117;
	bh=KB4Y/BMeUDgmVjp3gxCOOYO8zP35SnNcs87GAcd58VE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=sVekWiWMMsOVnUX4yuMjcz3RXytLcjFZMaN0EyKJCIwfjxVK1qSqgIZpT9WsUV+7c
	 D9yAjzIU1Df3VmSxgzQtnixgZkc6HS9UlYBJ4MIcpCDh4HprMfGS7aTzzKflouT7QY
	 7bCN1tcjM2o1fltoPh/UcelC8cERxs9LqHyC3GiVEij/TkhidJxdWPQFn7zPm1hvHO
	 l1Z5KGnRUT3A0YbWW4LBG+15kqxlugevnsnzMcTAgFgeKQtSEYuLpBzQtlLutRpbZy
	 iIunf5TJXTqHmxtVUfUf6jarb7J1aFPBgflC1wmpcXKWNDyxtG66lD/uR5vl1wzbBj
	 LWPM0t6xUCTKw==
Message-ID: <dc9cec0a-276b-41b4-b484-adf53c243ae8@kernel.org>
Date: Tue, 8 Apr 2025 11:48:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up unnecessary indentation
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250404195442.413945-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250404195442.413945-1-jaegeuk@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/5/25 03:54, Jaegeuk Kim via Linux-f2fs-devel wrote:
> No functional change.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
