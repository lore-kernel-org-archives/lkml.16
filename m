Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4C14A06
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 01:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738807150; cv=none; b=SlSA7hfLcsGTumynGGKB+VEkNmJjdV8OI+ZSyUXGxKAIGBMquG2M14HMQeal1qUTtrNZHwnvhoVCJwqKfXkGO9rDylDbqEADzGzav2rmLET7qd8/h6Gf8kiQ+OXSz43ssw8RdbAyDJ74HJIaCWrjlqGFQ0DIdsuA5ht0SgnMpdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738807150; c=relaxed/simple;
	bh=AHdD10tbnINLW6D6jFPVay9LIhQizRKek7+d9U5ngJk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oDWKJYBfYfDxmp+6W8TL0eHGqQ5TUPPM/TRREfFiMNHwhbue2CGzOPtgw7QeRdSiPwRegGVCyVQ6pNKp6BjWc8+c1/7Ewn6QhOAc0OCgTajz1bDjjWs7qAO8L3vvOMh9u9iqZ/+eXoylBTqp94EJAJRas0PK43djt38aWFZaFBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4zlYcGi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4zlYcGi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E148C4CED6;
	Thu,  6 Feb 2025 01:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738807149;
	bh=AHdD10tbnINLW6D6jFPVay9LIhQizRKek7+d9U5ngJk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=G4zlYcGi4tsBtZkiOsu/erLP5AwH20YlT/Ap7VSvNREoDOdwnkSfBfBojRX2sdGzM
	 y7IP3idc6j+1ntHXob4YteufYtJoz2IuAVdGrrU9XiQgTHIvO+wqagXYaxCcX7buMp
	 dnPm/t/p8BySKwn7piYwK3Dop0q6kZMF2krflsO9hMMshdEaoYY8ncsQkmnRr/AFJ2
	 4NqjWU36iTB/d6unEe4ZBDvc9Fab+2hEVECrdAuLllkniACokjG1pLZiMVPaJ8NcVE
	 WIUJ4zLdsfb7tOsCmY8QZNV5/K2y/YJzKBYu9PoPtBllR9+qxY4OCDcgu4o3oB92JK
	 TS9yMrg9Lk9tg==
Message-ID: <d5f02fbb-e100-4154-ab4a-cac47807cc38@kernel.org>
Date: Thu, 6 Feb 2025 09:59:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Jens Axboe
 <axboe@kernel.dk>, Kohei Enju <kohei.enju@gmail.com>
Subject: Re: [PATCH v1] f2fs: remove unnecessary null checking
To: Kohei Enju <enjuk@amazon.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
References: <20250202043253.64389-1-enjuk@amazon.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250202043253.64389-1-enjuk@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/25 12:32, Kohei Enju wrote:
> When __GFP_DIRECT_RECLAIM (included in both GFP_NOIO and GFP_KERNEL) is
> specified, bio_alloc_bioset() never fails to allocate a bio.
> Commit 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO") replaced
> f2fs_bio_alloc() with bio_alloc_bioset(), but null checking after
> bio_alloc_bioset() was still left.
> 
> Fixes: 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO")
> Signed-off-by: Kohei Enju <enjuk@amazon.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
