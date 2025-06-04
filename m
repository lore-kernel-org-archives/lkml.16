Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106A1347D5
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 02:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749002956; cv=none; b=Oiw0AZ2Vew/VOMGgOmOtVckQxQweVcKiYOaZ+QIbMcrHFAn8wSc7AdozfHcFILKKTf428RGF4PCNrEu3BtHw+8Tz2T7TrbsqMxj3b78w7QWTpfb+TljjE+g8GHfj1QqIMPAFRgVwjosASx8qeLP11073eukJU5mSBJI3ws5QyOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749002956; c=relaxed/simple;
	bh=YzOZh8AU2L5eg3A4Z0bzNE9hBsb4+8Qy9LP6iIx6rKU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KKsIqyOn3h6wpPUTVrpFkibSXyvAL5OIu5rv3IlEatr+uByuze8eC30Sy7GuHG8cz29UhLQpRCkG0/jYZX1hE64p2Lf33hksD1PzN+bC/HbkrH+T3aDwFo+trNZLUhlBice8gyb69z94y3+LBm+ejpWOjXr38GN0FORHm74a/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rR6Cjxxv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rR6Cjxxv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE5BC4CEED;
	Wed,  4 Jun 2025 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749002955;
	bh=YzOZh8AU2L5eg3A4Z0bzNE9hBsb4+8Qy9LP6iIx6rKU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=rR6CjxxvAdGTZ8al0GLUgz9uC/PkVMDZE676J1IzwhZ0w5uqsCrnLI2X5vpA35Vwt
	 RqemeqQtY3F6qMIqaigiYXccWWAP2+XApmexHtIou2THej1EdCVM764/OTvvF4+Hyx
	 5E73IBl/tCGN9ifZkt/S6WnvENzU4rMW6qjpbEIAsvLPG5trz1+b+8vmtiZTi/lFuQ
	 Ip01Ap0Vc3XlZHo5bVM4YVRie1mJ5zqnaW0grBXda+NhDoeb3DxME+4iJGqFA84TmI
	 L1sV9vWs+HoBk42u++1tQfmzpW7NxmFzRigrjzzSaICWo4Q6pkeVccqne5X6DVfKGa
	 YMgHRnHuhf7XA==
Message-ID: <193abd7f-560c-4e07-93d5-0d75eb0cd262@kernel.org>
Date: Wed, 4 Jun 2025 10:09:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: turn off one_time when forcibly set to
 foreground GC
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250603173739.2483532-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250603173739.2483532-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/4/25 01:37, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> one_time mode is only for background GC. So, we need to set it back to
> false when foreground GC is enforced.
> 

Nitpick, let's add fixes line before SOB as usual.

Fixes: 9748c2ddea4a ("f2fs: do FG_GC when GC boosting is required for zoned devices")

> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Fixes: 9748c2ddea4a ("f2fs: do FG_GC when GC boosting is required for zoned devices")

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
