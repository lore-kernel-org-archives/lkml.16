Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD2A248865
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281911; cv=none; b=foZbrYY/o9cpK3ZBPsHqK7yUeOavrHWMzrXGiK/Udlu+kPxqktXW0F94nnD5OkFao1ifHKF/tKimjgVT2TTaBu8D6SJ20r0wwz+lmlTAFo4n4qlFWjyZEVjuNqMn7agOZL/5/sjEdhQUXKTGbiqeOqYnbntIl1BwG9lq1Ks0pjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281911; c=relaxed/simple;
	bh=APMVTdrrYAXWsh7dmspBZyKji07itzv/fr34xibM038=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Sml+fzCaNfr58QHbBIj4M3hXuXWbNlAx0tBXNUQnAuf3KelhxuEk+r5GwJrExCXVyIab1vKUzsOj73ra1O1Gye1DHco68Khy80nSbN/w87b5Uq1/tWsAbAGq1mjqV7Ddt5vt12gEO3HkSzSV2nuMj9FgGrfEinZQl7tN8l+ASug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTiUnE8l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTiUnE8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D91FC4CEE3;
	Mon, 30 Jun 2025 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751281910;
	bh=APMVTdrrYAXWsh7dmspBZyKji07itzv/fr34xibM038=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=rTiUnE8lI3kPva5JmOS/nlXp22FS3FKhxRaatV0WsIoxkcXCSPHBVcyKa4HZcee/e
	 q9MkECp0jPyE260x09CzsRZHBltKH96k/8tvbW4Oi/xVGnOGhIAyNAnEqU7LVOtqG/
	 m713sj/TOeGuxqy9wijpTt8BzuzT2rrWZ/mq68S5+DBI7d38HNaZfQk/ZihNNiCb17
	 GXXRUWb+ihB3U4HL3q3VC8kg0ePFTG6oDNVhb50CybMO73vW7x/DrGC8fEgkCY54PM
	 iEj5Eg2DpAQNJDRPN+zVU2G3TMT3synMNcuKAcVv8HwuV5P2lhzwXJTsjR6vZAibaV
	 kDiZ1Tomv7Xsg==
Message-ID: <f9a2bb12-37d4-42a2-b4cc-20959878dfbf@kernel.org>
Date: Mon, 30 Jun 2025 19:11:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, bintian.wang@honor.com, feng.han@honor.com,
 niuzhiguo84@gmail.com
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: convert F2FS_I_SB to sbi in
 f2fs_setattr()
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250630095454.3912441-1-wangzijie1@honor.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250630095454.3912441-1-wangzijie1@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/25 17:54, wangzijie wrote:
> Introduce sbi in f2fs_setattr() and convert F2FS_I_SB to it. No logic
> change, just cleanup and prepare to get CAP_BLKS_PER_SEC(sbi).
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
