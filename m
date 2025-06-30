Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA602580E7
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281931; cv=none; b=Ym5R2/1tfErpXMibILRAXiZE+wApUDe7Vrf3KuJ2S+8XtcVu+Usbpg7ksLK8aYPCl0AO8sJNsoFa97powfdtghAEv+min4hmj3dUT4t3UfK1F2Su4SmsNVXUk6fG3K9GCHbDZSOJV1eJNow10Ia12N/OAbOI41mxmDlsKi92NWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281931; c=relaxed/simple;
	bh=gTebueH2KKMABhXIC27LxlzSf+n2XmIQekNL0BcbL3g=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jnSohXIc+qiRrR6/JqNEAIIJBTOZQhuARiBGn52v2e92PP7XxK00mEW5BFFXAbNhaaUEOpovUdNfGE3dmTKaHhqUxrl+7ZA2WJUwrrX39LTiH0/GaatoZyhe3IT43Y9sx550ahjme5CHpjFtj13SsloZUNiok5pBDC23avfQUVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T77UmB9D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T77UmB9D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39584C4CEE3;
	Mon, 30 Jun 2025 11:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751281929;
	bh=gTebueH2KKMABhXIC27LxlzSf+n2XmIQekNL0BcbL3g=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=T77UmB9DZMdVuZhr26oMiVKR6IbI3oya5EymHSFJIUiX8OdHpSAwz+b5xFKlItH1k
	 HltiwJ+cwsNCTdEhHsQHc/vWG5qPLA+VQiGipoR0SNjGWG5f8DUmRBVWkgVXaK3xhH
	 3o4RppVrenpKwCP7NHsDZBTzbWTwvt2wXeKIM/hVZGb3gGBNsnmIgQ+YL4BZM6Ywex
	 vrTAWHGrl6X8gyqbjso9mVWVrRxMDdJYkPSd/4Y6a/mp8E/p9VHGMpFK5qZM3yxHyA
	 w8Mc88a5cFEnuxOrNA2ZjSAgYziNh9en14xiSOpDDI6X+Mx9Uo3UyAlgVTfN5bMewL
	 VxxyHDrlYgTlQ==
Message-ID: <f90da85f-4498-4646-be26-652a3e2681fd@kernel.org>
Date: Mon, 30 Jun 2025 19:12:06 +0800
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
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: don't allow unaligned truncation
 to smaller/equal size on pinned file
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250630095454.3912441-1-wangzijie1@honor.com>
 <20250630095454.3912441-2-wangzijie1@honor.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250630095454.3912441-2-wangzijie1@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/25 17:54, wangzijie wrote:
> To prevent scattered pin block generation, don't allow non-section aligned truncation
> to smaller or equal size on pinned file. But for truncation to larger size, after
> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
> we only support overwrite IO to pinned file, so we don't need to consider
> attr->ia_size > i_size case.
> In addition, xfstests #494 assumes truncation on active swapfile(pinned) will return
> ETXTBSY by setattr_prepare() -> inode_newsize_ok(), so we relocate this check after
> setattr_prepare().
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
