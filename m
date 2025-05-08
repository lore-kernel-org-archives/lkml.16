Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0673D1D86DC
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698017; cv=none; b=BXLgfWwADCx7d1566GYOjEVjyxxWw/JpKWPYVKJxjsdy59mi2T9cyMH33mP2HMAXI2aPZy31BoT0nXj+963L9PyPw/Ocf6LN/ZlwtlkfcSihusPgsKmlJ+IXevbsa0XLxM4uRyV9528FtuoCQr5AUCgpdD+uUoI2BD8oWguI26U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698017; c=relaxed/simple;
	bh=xMnMByYvNQo7L2wosGfUBr8ckLgWP+gGQe30dSqfKUw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ntkg+9HxYbnArzm4X1WIxXK3DPP0yRnod0d1g5cn0Wawrabr8DSOVyYfnhZuQBDTwb++0REfZMI9ACo2rKqDf/K/qIPA7GWWBbND0YNoyNfCemcaUxjXlhfis6E27aSK4iH3PvQlErslWO29IlGDzQS2diV/JPVl9Oo97NydRSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijOv3946; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijOv3946"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEDBC4CEE7;
	Thu,  8 May 2025 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746698016;
	bh=xMnMByYvNQo7L2wosGfUBr8ckLgWP+gGQe30dSqfKUw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=ijOv3946950TjJrdY+TKc5NYy2nbhIwGn7u05PeREp6n+DuxEeBU7Uh9tKVxtx9+T
	 2IazB/6pMEXxQ5OlGm7CuRVY7c0xGB6/Z7DXFWSCwkk4tFXc0kVvNkfzHs7Vgf9gtp
	 cmBTL1iDeVIrixycRThzXFljL3IYPM/UygyqMcGejs6HVmRrCkG6jAkGkddzPcS6y9
	 ydALNYlqHHvI5c6IOS3rvQfTBwlIQeSnUJ1ymN8XEUND0wEWph2mfY0hQ6WJ8CLPZo
	 aUdn4OkM1/efAO2qZWcW0Qh9XsTj0WnH9Vbe5r8wVn0mVEIVcue/QS0qY6cXOJLgFd
	 68hxhMu47DOzA==
Message-ID: <f4a01db1-0ae8-4822-a55e-3c41ea3ad998@kernel.org>
Date: Thu, 8 May 2025 17:53:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] f2fs: simplify return value handling in
 f2fs_fsync_node_pages
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250508051520.4169795-1-hch@lst.de>
 <20250508051520.4169795-6-hch@lst.de>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250508051520.4169795-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 13:14, Christoph Hellwig wrote:
> Always assign ret where the error happens, and jump to out instead
> of multiple loop exit conditions to prepare for changes in the
> __write_node_folio calling convention.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
