Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B01259CA6
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038806; cv=none; b=iXZd+uRlWRrsEzsMeCp0D6MMFEM/0jWu6U7MaIaGWNqoW05Qsywpvkng7zY40Fs1hcn+SelJ0T366Fm31jDHutoEBjKOK6rJk9AQbGUNB4Z8medZrAkRjZGzu8MaUhdhBW2JL3zAyTrMRS4ep33SS0JvVpdwFco9SuM2Bhp1+WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038806; c=relaxed/simple;
	bh=nd5duePhvVCM8OdU6yge1gCN+fxPPRrIUgs4u3xivPE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Xd1v3P1EbbZL0TJU+FCxsCQjwIaw43GflDD5xS4CorRNt67zssir5HNVoEAYMnuRWfTD5XXu+oDOBmO3Yrmq7h3fkrEBF8oC4k2PikJkQUVbM4XnmU800GuM29Zk2ZcYEvae+uKWwWVhIjgvPglFjHDMk8gbx9BCeYHNkxR2PXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cts/VSre; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cts/VSre"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337F3C4CEE7;
	Mon, 12 May 2025 08:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747038805;
	bh=nd5duePhvVCM8OdU6yge1gCN+fxPPRrIUgs4u3xivPE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Cts/VSrejSbRfItH6vXzHbogmV1M99xLr/djEvLIA8a8tmlcvEqV8QXJV1ptNsoSC
	 Q5Wwpy2WU0wzlmCuK2ss1R5GxDY7/84YvOq1DxbEFt/A9aC0qEu8NTvqg/VBHvElIe
	 1MGtiYdv5JKCh8GrmlTiFLGhJDlM0M9FcarBw+I+MJTIJKreHlKs7a4sNkMTctnf/U
	 3nxDntcG2ntkPvTwP0Z6uihDRIEZxOZnELOD6EWbR/PfW1hp0WWOn4yhydGk8unxQb
	 DSLA1tlmo/DC/LAjsczqn/m1+wnUfcH+GL4hlH20JzidqqtHJ5wx1uyjjBYCmoEFDb
	 8D16MvNWfppOQ==
Message-ID: <f5c3fe27-78af-45f4-b76f-458dbcbbb0fe@kernel.org>
Date: Mon, 12 May 2025 16:33:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pilhyun.kim@sk.com
Subject: Re: [PATCH v5 1/2] f2fs: add a method for calculating the remaining
 blocks in the current segment in LFS mode.
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250512073611.718-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250512073611.718-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 15:36, yohan.joung wrote:
> In LFS mode, the previous segment cannot use invalid blocks,
> so the remaining blocks from the next_blkoff of the current segment
> to the end of the section are calculated.
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
