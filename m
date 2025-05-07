Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658622153D0
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602948; cv=none; b=aSbDmit063Bues4Y4Ob97Ood1TY+5UQ6ty9hdB0PJuRAAJprFS8dQ4qIpEXE3cgOvKXKKcMuyIPavkoY7J9lD7FVkP7L76VPgquN1J/OeuLun4ocJBVTlXedL52qCnoF7VYCVwpbwu9P60VyaZbuW5gav7ra+Po5yUFsCP2mbs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602948; c=relaxed/simple;
	bh=7cURyXjXdoJmTyb8hLReJVBL1sTYAuBh4yrjjz9NI/g=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tFlEE9xOBo4fo+z0fSnC0Q0/yw8wvbOEinCOZAmtumX8xxFl1iUc7bDOgVKIMgzPJlE9abydJJjBWMJlEMKmV6ki5Fv0mE4RWxuA9pCZZIZb0k5tpqvLh6hWG4tFyaJjYyklEP8Ws5JZmAtUUYBkybvuxwnenexuhDs3ss1SfvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjHRLkUV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjHRLkUV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87B6C4CEE7;
	Wed,  7 May 2025 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746602947;
	bh=7cURyXjXdoJmTyb8hLReJVBL1sTYAuBh4yrjjz9NI/g=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=OjHRLkUVX+ps0CQnHqc4HjSygB3ca5HmzNXyReL8SHXICmX9jk+mU7qyYbTsmF1Ds
	 Y+lhLizkLmF9I9OzgQb5+8jsQTL7RjXq9VCVsngzPm2BYUvcUOin9XmNPKw3ZnI6Vm
	 XdX6IvpCW9dzy8n2YVRs45CRvRWw9glf7a7XC+uSuBDsyCvkpKXjlvAN5l1jud1sxh
	 SGVB3hcCv5rOeEONNwi2zwrrkuo/qLef90RdiryGY9OSZOXdcj+bRJ0zGnSHMknbYH
	 pxV+I/jqZXKkNUTxTo13kMPGl9H8DsiemEQl2XLbRyNxk+aKXAUYdr0qAYMhjQ4oPL
	 IjEQ3f7t68Epw==
Message-ID: <866f9738-cc57-464c-a14d-c167910cf370@kernel.org>
Date: Wed, 7 May 2025 15:29:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] f2f2: return bool from __write_node_folio
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250505092613.3451524-1-hch@lst.de>
 <20250505092613.3451524-5-hch@lst.de>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250505092613.3451524-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/25 17:26, Christoph Hellwig wrote:
> __write_node_folio can only return 0 or AOP_WRITEPAGE_ACTIVATE.
> As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return
> instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
