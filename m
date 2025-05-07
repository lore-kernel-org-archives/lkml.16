Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBAD17A2E3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603507; cv=none; b=qqP5A9BUUjlSdCzA1TYCZ1ulsagC6EK+eLmH9DSLMhifIrdDf289BeIadtscvSWOhH/e/CSNHNCPp0tVn0ptMyFKNJ7oQNcpft+aDgDVm26c7lChdGpEenK/o3tJIc6JR/tThRnhXLYKdYc1lWNxCy+pBlFzDyAUtqZ1TZDJdEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603507; c=relaxed/simple;
	bh=OQNVDW+Or51VukOrXMnIsaIqPxIvjVsqNhnia7ZvKKU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eIwJxyfZl5uFE6Unhdb+t653zFrDpXE+/A7C9sslLCobdhfbJ+tf3kljDESZGydJrJc8FmjAR2H59gHDH+WsEg2U4x55bf1/vmSrqWtWqKEd9NZNQz5XmxwALzltLbrqLCqLymDnRX0IW2MIOYSCnBihk5zOlSc3JzNnCkkxgu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lX9kRX+f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lX9kRX+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E141C4CEE7;
	Wed,  7 May 2025 07:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746603506;
	bh=OQNVDW+Or51VukOrXMnIsaIqPxIvjVsqNhnia7ZvKKU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=lX9kRX+f3tNfG8qYW8VH+Zmoaez5JKKR5ZaBYAHAXZo1zIeU1h3VGqXsvwPjYt8NU
	 H+3c0ICicoGJ3VjmkwHv+bkFKHwMOUmJEZ5IcB6hOe5+YuuAzSQX/+TZQ1C9qbd+eN
	 YPZLWxi3pTFbsbHEd+doTFDrko51eJ4w0nPf2+nXXnSyjhiSogQtWgwFZP6Poxldnj
	 NY+uqnxVeyyKn/JA5P2gUW1dFeycXonduN3APHznzlO9tJ7Rgd8OyJryNacKr+hvED
	 /5wvyIzXFfdM5OnnQP33/6fxW7gDhyPdau7fqCvJ3ei1wcZmhpi6HVfPDXJ5havIMa
	 AupA2pZfwgSPw==
Message-ID: <43d55ab4-c490-4f3d-8331-dc47f427d06d@kernel.org>
Date: Wed, 7 May 2025 15:38:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: cleanup AOP_WRITEPAGE_ACTIVATE use in f2fs
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250505092613.3451524-1-hch@lst.de>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250505092613.3451524-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/25 17:25, Christoph Hellwig wrote:
> Hi all,
> 
> this almost entirely cleans up usage of AOP_WRITEPAGE_ACTIVATE in f2fs.
> 
> f2fs_sync_node_pages can still return it in a way that is not handled
> by any caller and eventually is propagated to userspace.  This does look
> like a bug and needs attention by someone who actually knows the code.

Oh, I guess this is a bug, thanks for catching this.

Anyway, let me fix this based on your patchset.

Thanks,

> 
> Diffstat:
>  checkpoint.c |   22 +++++++++++-----------
>  compress.c   |    5 +----
>  data.c       |   13 ++++---------
>  node.c       |   43 ++++++++++++++++++++-----------------------
>  4 files changed, 36 insertions(+), 47 deletions(-)

