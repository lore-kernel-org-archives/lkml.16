Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD7A1F3D20
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697739; cv=none; b=XvLRNB7duLaWrew0QkdkJK4iJFKAh5YNJNZe65V8APLlpdMi9VT4fVEjTOjcmymuefGrXjn0E3AFq59BrhfKGmQzhMtwdzjC12c2G/D/k5D6Wl53xV38+PBamJfCwHW+ENlgE9cfkTDBdPa+ySIKVsY5cz2Y79TZIfFt8OmW9DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697739; c=relaxed/simple;
	bh=1M2D0kmPXyrtxUHUqV/QBCgUyN2yFLT+VGEt8oz9Ov4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WREqEziVilu/1HcW8i+GiQC7jCVfWpi1RlwAmQK6eiIGfC78lJjliyBPsHwQ2oQBn2bJrmCKj8I7Hski9Op4WjLHVv4ueRPy5Te/MO28fnmAg9G6swEtfYmbSlKTT7qg6fWAphiFUJnKJgl3BBB1gtQmwCj58i+l/IY5Qz+vuoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q35O//wg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q35O//wg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88714C4CEE7;
	Thu,  8 May 2025 09:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746697738;
	bh=1M2D0kmPXyrtxUHUqV/QBCgUyN2yFLT+VGEt8oz9Ov4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=q35O//wgeFolfUtGFo2yu7zhlejGy8Sz3V7xZTakPq624qNcrv13dWsvdYbOrowi1
	 Kq/TrA7HN26UnMs/TEc+zYaDRim29VwgtNG0drLYUOVDLQRpi85tYGine4NCh8xnz3
	 Uj9V25fe6L2gRWvNB/ZzGA9ruBdNFSGWPo2dy6vnudyNy6ADAHwPauqI7LeaUCZ7/a
	 O0ia9WJtNPLGATO1b+WzoFUt6+bxODUB4usIsk9NMetmBdjmWM55Jv5yWI/iPGDj/h
	 QETbuNc8vS/KjE5WVFbl3pUHBdyt41WVUDEukLAXjV1RhFaiiQH9USJFcbtXWZrLEw
	 MDKr8AuVw2E6Q==
Message-ID: <c2d58d5c-54fa-4b50-97cf-bb7876e1bbab@kernel.org>
Date: Thu, 8 May 2025 17:48:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] f2fs: always unlock the page in
 f2fs_write_single_data_page
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250508051520.4169795-1-hch@lst.de>
 <20250508051520.4169795-5-hch@lst.de>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250508051520.4169795-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 13:14, Christoph Hellwig wrote:
> Consolidate the code to unlock the page in f2fs_write_single_data_page
> instead of leaving it to the callers for the AOP_WRITEPAGE_ACTIVATE case.
> Replace AOP_WRITEPAGE_ACTIVATE with a positive return of 1 as this case
> now doesn't match the historic ->writepage special return code that is
> on it's way out now that ->writepage has been removed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
