Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125671758B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747885347; cv=none; b=nxz74YJlCLwKmG64b+jlWHUDZXArN0bGo30OkqKSlFO5xhYRb4/sazaXuDbQ+t8xeq8S4P+Bni7hIFEqgI7HPIBumM7oOQ/EXixjyRU1OBCYR1WPpKxdfYB0Diwk6+ivIMRfTKTVdRWPFY1vIapJo2Cf1lpfkyBRon/MJ4h/W8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747885347; c=relaxed/simple;
	bh=bsn80ptBahLUmBO/dtkU23IoT5OpZGzqYExsYdH/EFM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g6GPywwrZ7kyKRwY1ipUNWkatlwYQpA5NML9zzaoRIgOLNnRlkR0xhTKCrrXiiNgltVUh8I0e08mX0EkLAeTdac3aMKqi8QmbZkDOty6w4u7naCupJd25HawGzWXrZKzVoAGp/KFwpuNWBknHMNd2eqRD/WIG9SCJzkPPc5IeFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMP6Hryq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMP6Hryq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C3AC4CEE4;
	Thu, 22 May 2025 03:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747885346;
	bh=bsn80ptBahLUmBO/dtkU23IoT5OpZGzqYExsYdH/EFM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=sMP6HryqYnNzLHziP5+B3zXjkbh7UPfebI7ieAuhkQfj1kUwWzQrmSqsTDTthgR0Q
	 aIkMcoSTnICgOQCA53wgKOBGAepByDRK77auDlR2xM21U5hLnSCVvx2CtBIWsgYGzb
	 jkzObw7ZmGs4ZE0QquzCSW3XOICMgD+7MtS//OPFUubd3hcVG6yO5bOuZ3NbIv11Fb
	 KoXzPUoYYi/sgmp3v9C99OpLs84w0dKXAzNhngnkB0czbamjE+rqAOO41t4dz7rC76
	 mAc+BoBf7WsmGCN/wFrCvFfd8Z7JMP3w9HnMpSFA48GHsQrXz1gzZiUYtuEvAufC8r
	 pipGM+3LWXRzQ==
Message-ID: <d98160d7-f128-4acc-8b4c-a33ce0cbb7bf@kernel.org>
Date: Thu, 22 May 2025 11:42:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: fix null buffer error with dev_fill
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250521194100.1407220-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250521194100.1407220-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/22/25 03:41, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Make fsck use dev_fill_block() with zeroed buffer instead of dev_fill().
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
