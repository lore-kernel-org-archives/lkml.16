Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CDD72601
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605585; cv=none; b=pL2DZYuT98n2Xl827LF4CUf2ZbV/8yxWukWz2QFIrCrPpbQ49B4PfJBXVs8gVjQTny0hCcJh2DN72wJA822+lgBiFFM8GEdg9C+IFp4RPhL2N7J3ZCUmE1GD3/PVXgqNCC6RElGPPDdzVFAHaEdIZc6yw2vBd0sMr2XafdBA2hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605585; c=relaxed/simple;
	bh=IZxfW3aY2ijlXo9tHf4EeDK3rtqmiq2rj+jcSefHlrs=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oCHy4SH3fWMYhMgXkN5Xnb2aVKLygkS9SP7zfcquujITUbIhjLzEtQU3VTaRz03O7bxE6dyuhCdsGRHfKfKfq17z8vlA+HzsBedRV+Ppu7w+ZWqYIO9YKUcEnga2+lI/5vWPoXQGpSH36dLxL0Pv116K6L52miIN1R0lOM1vjPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElyxMD0q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElyxMD0q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F633C4CEE7;
	Wed,  7 May 2025 08:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746605585;
	bh=IZxfW3aY2ijlXo9tHf4EeDK3rtqmiq2rj+jcSefHlrs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=ElyxMD0qsNo1xrvfU1I0zzDSuHpGGF6NYRI7mGgEXR2RCcX9OoDXSsSQf0+h5oqCW
	 nS5Lr5XBOQBC9cREFI64aIZOfV/iBbMEcI+2xRZipvKzQQ4fs0nkzMf2AHkN22nqjt
	 nCP81yAsScDYSgPhgrYYpl3GP1KPdEa9gZfha+QfNkxCOHmIZBKdnQVH4Li55+pQAR
	 KigZ/nP7XeiM7GG2YRbfRF/ryeZN/9bzGyq+7z2XNnJE9/e+aXnrWSbrxwl9BTtTMH
	 VgGMDmHz4fgWLpzinRMNmysi/LHZRbFJrzr1t7H5yADliZVG4zYKshlaVgeNsP1q8L
	 kbxnA3kQwVbEw==
Message-ID: <d9720676-5e03-4298-8811-f6cd0dc8ea0c@kernel.org>
Date: Wed, 7 May 2025 16:13:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: cleanup AOP_WRITEPAGE_ACTIVATE use in f2fs
To: Christoph Hellwig <hch@lst.de>
References: <20250505092613.3451524-1-hch@lst.de>
 <43d55ab4-c490-4f3d-8331-dc47f427d06d@kernel.org>
 <20250507074817.GA4516@lst.de>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250507074817.GA4516@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 15:48, Christoph Hellwig wrote:
> On Wed, May 07, 2025 at 03:38:20PM +0800, Chao Yu wrote:
>> On 5/5/25 17:25, Christoph Hellwig wrote:
>>> Hi all,
>>>
>>> this almost entirely cleans up usage of AOP_WRITEPAGE_ACTIVATE in f2fs.
>>>
>>> f2fs_sync_node_pages can still return it in a way that is not handled
>>> by any caller and eventually is propagated to userspace.  This does look
>>> like a bug and needs attention by someone who actually knows the code.
>>
>> Oh, I guess this is a bug, thanks for catching this.
>>
>> Anyway, let me fix this based on your patchset.
> 
> I'll resend a fixed version later today, maybe wait for that.

I've submitted a patch, maybe you can rebase new version on it?

https://lore.kernel.org/linux-f2fs-devel/20250507080838.882657-1-chao@kernel.org

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=bugfix/common&id=a0b7dfb634f98b88875e7bc3166159d2abc7f164

Thanks,
