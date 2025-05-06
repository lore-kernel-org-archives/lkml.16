Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2FD14B086
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 23:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746573882; cv=none; b=ojaKDAE6QVrYCaNpytAWb+ASnhSxwqa/wLRuRmp+/gKVkNwai3Z9MUNTyW8geT2Dj59o3dfymvi35zyiLLXH3sciZwBXJbd/SS2uPxGvQp8TFQEjCTiD81tKPd2mEEtIpYqAEjNbqJOPVXTCaLURzJ2x7eEk43+ECc2/V46oqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746573882; c=relaxed/simple;
	bh=fTXalGwAI3Umzmf4OwP7C0YEGOkcPxF1NhpPFNf918s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZKzHJBjalgYZvi+1/CURjhsQSk2MI7ZhKMJ6albHSIi96vyRigP0Uhny3Gmzd6+anod5nKBKj8iyy2MMS9ytaeXjqy/GN656yhRZQTKOhktYKzqq/mMPt+gUMt4bsJUEp2iQjJswtc9b7v82RhIqdcxGWWn5Xp/bvQ/ncoIqNSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hrdcBhdx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hrdcBhdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6EFC4CEE4;
	Tue,  6 May 2025 23:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746573879;
	bh=fTXalGwAI3Umzmf4OwP7C0YEGOkcPxF1NhpPFNf918s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hrdcBhdx0ZL/pg1xA5JGU4awQC0fMA9gDfcJZrDvQ8ur3mLy9QnOrkCNalDquG5wf
	 D0Fjn/KWL7Yf8WEoEPFBlMTKu3lRJCFmRZrVNZvq73r/j6uLV5VAMQEFvYCOlf8099
	 Xn+mstsKjvyA55T5IqLgUuYRAnPohKB2I0MUioVM=
Date: Tue, 6 May 2025 16:24:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yuzhao@google.com,
 stevensd@chromium.org, kaleshsingh@google.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
Message-Id: <20250506162438.91fffc7ef924d9653ed0f503@linux-foundation.org>
In-Reply-To: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 May 2025 00:02:38 +0800 WangYuli <wangyuli@uniontech.com> wrote:

> -	for (i = tier % MAX_NR_TIERS; i <= min(tier, MAX_NR_TIERS - 1); i++) {
> +	for (i = tier % MAX_NR_TIERS; i <= min(tier, (int)(MAX_NR_TIERS - 1)); i++) {
	
Make `tier' unsigned?  After all, negative tier numbers are nonsensical.
