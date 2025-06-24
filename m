Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0EF2E7632;
	Tue, 24 Jun 2025 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774611; cv=none; b=T85H80RCShjsaTgUBeeDR0ZrGhczjD7/obtQ8dpdHHyYqBwZZ23dk/RC21H2MfENG0bd1CAkxhOiSFRRV/dm97eKRsj+HWeU8M5PPubHcK7Gi5xm6cu1MgxtAA7V1BZTwoKiGzOhWIKRTuloP4svVgsBjhix6OcXNyf2yFE7Kv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774611; c=relaxed/simple;
	bh=17L7ponko88riHevvmIv4qyXvYBhLHE4wx7OmbK6EWE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZkLO0v1K9mk+0E068mAvIgAKVgoFaLqgUMrS+YDu1dIcCwKD51XQB9bzfJtbwjHJ4RdGfn74MRdK9WxXZI0/VU6uUdlUTxR4qJrHjjMeuYPwM0dXjGd6GQM/dp7v7yGKPgtGhD4EJkoXs7QRBH1wFC66TzIoF7YvTEwQRjRN62M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwZ94aLG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwZ94aLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D975C4CEE3;
	Tue, 24 Jun 2025 14:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750774610;
	bh=17L7ponko88riHevvmIv4qyXvYBhLHE4wx7OmbK6EWE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=rwZ94aLG2J34d46JgW0UgzuNCLWzIl4Y9DSwUBVeWF1Hv0EeLF7YKKf2IGQ0OfD3y
	 VCTTCqu6wSdbLk66Y/kn6YmgTiJp2VQCJ0nEUca78qnlsIRvQasldl8ftDVosrnUmq
	 W2CAHMSvdQ8nqiW5XKd6ogdFjeVOqkwZiGHaLjMqMk/ZdmfK8oxko+pqsyZ0U+nUtX
	 Aysu1zT5gozraHT8acwjE1A2m4PwEbQEtqb5Lt1W+2Vfi/HO6InMhDNYbXlqDyDLK0
	 g5/2k7pZqvZTDAOJ5W+QYnCl+sEncFly2ldAd8c9clIXcayPrF/xaRWVDjCotoj+XW
	 kwJaycCf1Z/vg==
Message-ID: <f90d39de-d24b-4006-aa09-71bcce5e4eb4@kernel.org>
Date: Tue, 24 Jun 2025 22:16:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: f2fs: fix typos in f2fs.rst
To: Yuanye Ma <yuanye.ma20@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250618225546.104949-1-yuanye.ma20@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250618225546.104949-1-yuanye.ma20@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/6/19 06:55, Yuanye Ma wrote:
> This patch fixes two minor typos in Documentation/filesystems/f2fs.rst:
> 
> - "ramdom" → "random"
> - "reenable" → "re-enable"
> 
> The changes improve spelling and consistency in the documentation.
> 
> These issues were identified using the 'codespell' tool with the
> following command:
> 
>    $ find Documentation/ -path Documentation/translations -prune -o \
>      -name '*.rst' -print | xargs codespell
> 
> Signed-off-by: Yuanye Ma <yuanye.ma20@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
