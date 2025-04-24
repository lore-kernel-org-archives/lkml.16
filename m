Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E0D1F5E6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745459168; cv=none; b=fZvrvfAE/V4TuH1Dw8Udg/BJYdXumQjVkIvsd/FptTJjMKhPLZ2v92+CshdjE6Ksa1aUP2xE2Np5JUKD3sK9stA+tSf48yONi2Lr2xub5sgxuxiTFsH7ZQdRmT4obKk62bB2zxUnEKNN0p9Ra7kOUcyK1j5DnwCze1dOWEWt4tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745459168; c=relaxed/simple;
	bh=DezKAkKWgs4uO62+oRZdJbTIlubhcq41mVkGK65Cqpw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=E1qF2JNlvOfZDS/Q+BT0FJiNsdafJ+NwMqJ9kJ9kyxeslt+vG7pxWFghwNgGb0KL5HhUYt/U3mulbvjQxwHPPiOGw5kPHYm3/Gseakw0ZKY51s3tS7oSKloZCfolC6Skc7qyNocBarOPJjbWO/TtmZcJQGQQ1WVsGjlu1Ta/BWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNoImwrw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNoImwrw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43ACEC4CEE2;
	Thu, 24 Apr 2025 01:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745459167;
	bh=DezKAkKWgs4uO62+oRZdJbTIlubhcq41mVkGK65Cqpw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=bNoImwrwTYFSouzV/mK9xm37729WYEdeVzzDlhRdviM1s+8eX6I5sgP5NAVZg0A+O
	 vqRyVhHqUqUAbo5ORP+RChUqZTIv5GCmrjTc6JxsHULUDDT8b9FB8yfOm2Hc8OhDlb
	 bwRGqORqi/fq8doGo3Tay4qTm8GohfzZU80D+CBKgeMHd7ni64P9z2a/mQx/JFDgZ8
	 qT/ZaF+sH1N3gsIBEvqcG6E42aLSuDSK4vH5L+V1uW8x4XmYBrAES7gZkfJaY1Yrdk
	 ljoACQnggXameGeRxF1Hk2WpBIsilZAAPRKeQRcB2a2PEPRGX0AQcjVMguSQ0Jcnwe
	 euVmFToNi1R2w==
Message-ID: <0b5be0d5-695c-43a8-b17f-313b85e5bf6e@kernel.org>
Date: Thu, 24 Apr 2025 09:46:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: handle error cases of memory donation
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250423204935.2335000-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250423204935.2335000-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/24/25 04:49, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In cases of removing memory donation, we need to handle some error cases
> like ENOENT and EACCES (indicating the range already has been donated).
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
