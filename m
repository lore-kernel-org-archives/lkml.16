Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2C921ABA8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697587; cv=none; b=NkKXrhyL2N54Bck5LgWkWefWR6SHGjjN7kEV2P9AG2sscCOt3f9bN356QpooUtu9Oi4XlYYauC1HIAI8J+bJ1fVFzWQoZk0ltqD+QOfzqoeYQI/nE1CmbdmsR6WKC4fZuYOrJvNdv4+Zw6r+uxdg19TpRC4e7pJfrSxkk1390so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697587; c=relaxed/simple;
	bh=PVr6Rw+U6qooA71zLip5uMuQzMsWID+GyRiaQCci2Nw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gX34eXXj8RyCx7ExPIhKtzW3nXbw/OYI6NlqIpbXemHwjYZVsL0Nylr7vnPPy6KUh8s3N78JJhHyGYCQoVR9kS45R0yALgZBaiR9YbSyM5ur3wwQIWH0V97HZOj4dvjRJM+3AZc2pr+7dL3wYotxXZjO5yyF2r1voag+kGJ8jsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Njqe3FVw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Njqe3FVw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA8FC4CEED;
	Thu,  8 May 2025 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746697586;
	bh=PVr6Rw+U6qooA71zLip5uMuQzMsWID+GyRiaQCci2Nw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Njqe3FVw+I6SIavF7nR7MGx0bMZZgM/4ILj8Zedbwzg454BX1l04wM8tTEd+wkBQz
	 3kjH3Eu7daJ+R+enEXvMHpXQV+yqgpk5hjZjV+AUgmyzQXq9H68fK3/UKAjDAKp+sx
	 CT7PDhCskEL2TLYo3FwJxGSJo880Hf3Ydz9etH9CkQDzkc+g0SymVQ9m39QsI48b78
	 oV9x3NwF3/ih2C57ac5lq8OOtyVxhnk/ZtCha+BHKYyDhP1iqIt3RvrPmSzI1d/KvC
	 /+6Ebpa9+tw95M6kx5GqjNnrGpVwDfLC2M44tucsZYJuMZ3fmMCoG4/+1VKlFhLtac
	 pOWyfY4y50IjQ==
Message-ID: <bea92b8e-c20e-4dcf-91b5-4af4f71b00ef@kernel.org>
Date: Thu, 8 May 2025 17:46:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] f2fs: remove wbc->for_reclaim handling
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250508051520.4169795-1-hch@lst.de>
 <20250508051520.4169795-4-hch@lst.de>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250508051520.4169795-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 13:14, Christoph Hellwig wrote:
> Since commits 7ff0104a8052 ("f2fs: Remove f2fs_write_node_page()") and
> 3b47398d9861 ("f2fs: Remove f2fs_write_meta_page()'), f2fs can't be
> called from reclaim context any more.  Remove all code keyed of the
> wbc->for_rename flag, which is now only set for writing out swap or

s/for_rename/for_reclaim

I guess Jaegeuk can fix this during merge.

> shmem pages inside the swap code, but never passed to file systems.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

