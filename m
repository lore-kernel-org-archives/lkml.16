Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD966155389
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598948; cv=none; b=FZiD4xHYzhmsSqR6X8hRWoqiVe70r6X9OLoQ224xOyijh9KOnh+tTan5SZxzj0yNWdGV4uZmWvs9yfwBAobwUu/Rayjl3MUirwP9SwRmWqPOnrsLvR0lmNPmqLwWOYK6rYbDKtLmmnbbtMC+FYNmsfGNLezd5S8zz8kd5+benvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598948; c=relaxed/simple;
	bh=gFMTXhDvLooSbTLuEX6lJslPVQFV4FZCukV7MEm0y1Y=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Jx7+nq8f4FPmL7kU2xG5NOlloGzIaHJtHZ3jUNDWbU8TxBzEakCNjSNjbDFG6Y6StSi67mhqX0Sv0V0PFIqgBqgWsWIJwXXmC9Hl6NSBGqGuZtrfnQP1ayLY29YNvPSGAftIL8fSU9GI+KA7UMVp0y65D9rYl+s7jcjBEmQcQE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgiLWmhS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgiLWmhS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22ABDC4CEE7;
	Wed,  7 May 2025 06:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746598948;
	bh=gFMTXhDvLooSbTLuEX6lJslPVQFV4FZCukV7MEm0y1Y=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=cgiLWmhSvVCKyHyPL6Tu7wtwTUysBwzQUcKAMhTCXOoz88Om/GykSE54z01NVlJs+
	 JVAnzby969+IpXCnjGHdv/vJRst4VSEQ5WOA0TiTeWCupdAivwuyaouk+BpxZM3IO2
	 TMKSjbreTizZ47B1BzmAViZ0+Hv8jhgrya9xYD5SUYQfRbgHzkYW5/JKfihTtQtLe+
	 fMuhBHGS8uEzHoJCwoP/aAtOrgPJFlLezEGyLm13HtvijghOshOP0XJe+sNx9w3sfc
	 0F8YTHwiqB3CFMxicPRTi9YXj2rNHxlMZoSlHKHO9ThwAhM8GvOyPkxjoYqMRXI6oU
	 +03w/6Uv6G/AQ==
Message-ID: <d8467687-7331-43e3-8a9c-8a26974d229d@kernel.org>
Date: Wed, 7 May 2025 14:22:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] f2fs: return bool from __f2fs_write_meta_folio
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250505092613.3451524-1-hch@lst.de>
 <20250505092613.3451524-2-hch@lst.de>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250505092613.3451524-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/25 17:25, Christoph Hellwig wrote:
> __f2fs_write_meta_folio can only return 0 or AOP_WRITEPAGE_ACTIVATE.
> As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return
> instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
