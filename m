Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA56718C322
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750631652; cv=none; b=DBabQcPHM+gPExBq08WdZ7DZ7VEzC5CJRBtNnRif9KNsO+rkp4gHWzApAvCCw6n5ZawNCHYmfo9865BJFnpAvX6vSrE5tbJdlNH0OqQmoJUaPjpYaHHli45x0pKfplofcqJXPrC/b5E+G/Qnq6R6RMLylS2g76Vq/6+9bkmbobw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750631652; c=relaxed/simple;
	bh=MD/dLarw0d6IdKUG/1yooRE7P3CJNyXw9dAnU2kSRBg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=cKjYprEHQq/BPBnQI6FkZnmlqT7htEg3sXd5pDL/dSC8p4MYAIYK3fIJkBuigGJ+VeB0/acR+rSXMrFMsXRBAeGioOqnfcR/Cqvl7L7lvSzJZIYu7mbNlHt0F/bq3/ecrt3ExLcJNvCQFXbSHlodimvLozWIk8RRyUC31wbZr4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KDsBcoQ2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KDsBcoQ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E66C4CEE3;
	Sun, 22 Jun 2025 22:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750631651;
	bh=MD/dLarw0d6IdKUG/1yooRE7P3CJNyXw9dAnU2kSRBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KDsBcoQ2zlUOqf4+WJM7mnbgEr5DzxIeYw1U95bLwqJ8gA34GOJFcKbYQMSDfaoLS
	 rO8kavqoob2P6ynRBN4dI1zrP6F0SuXvA1J3TeU+9alhUoCbhc6aRY+GHvl4h56XjC
	 9j6VNQsaQ01k3aHime8Qc99JjJNEb5ZO6VKIBCDo=
Date: Sun, 22 Jun 2025 15:34:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Xavier Xia <xavier.qyxia@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Xavier Xia
 <xavier_qy@163.com>, 21cnbao@gmail.com, dev.jain@arm.com,
 ioworker0@gmail.com, catalin.marinas@arm.com, david@redhat.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, ziy@nvidia.com, Barry
 Song <baohua@kernel.org>, linux-mm@kvack.org
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant
 operations of contpte_ptep_get
Message-Id: <20250622153410.1f74305615cbd089fcf943bb@linux-foundation.org>
In-Reply-To: <CAEmg6AW0ZoKf_8XK7EjA2sE6HEL3Tneg7-CKakTNdgZrd585Ng@mail.gmail.com>
References: <20250510125948.2383778-1-xavier_qy@163.com>
	<99a0a2c8-d98e-4c81-9207-c55c72c00872@arm.com>
	<CAEmg6AUBf1wVjXSoqBseWffLbixUV7U-nY52ScKCeNXwrkBcqg@mail.gmail.com>
	<225fd9dd-2b97-4ec6-a9a6-fe148c4b901e@arm.com>
	<CAEmg6AW0ZoKf_8XK7EjA2sE6HEL3Tneg7-CKakTNdgZrd585Ng@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jun 2025 15:56:55 +0800 Xavier Xia <xavier.qyxia@gmail.com> wrote:

> May I follow up: Does this patch require any further changes? Is it
> now meeting the merging criteria?

I think a refresh/retest/resend would be best at this time please, help
people take a fresh look at it.
