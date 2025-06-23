Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E709D38FA6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696060; cv=none; b=rSLY1wQq+QDT0JhOsC6rtY0GkpjOmia/ff0PozAQniBLLiM0NQTxnnQajDWANDXlcMJZrs1+nJMsrozjLxBnXlS2+k2sQlycBw/TV85Qh29NNpjtcJ+XDakcPkcd9FM7bv3K6Fbuuaj2NZgaLlmj9W3qYrIz/2ZsUBCMbn4CRm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696060; c=relaxed/simple;
	bh=hD3LyqvxdBAtqNmbN/95yEx4xeHpEc15pz/zmNqvauQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZlMEOTVQxBAfBnd0BqIt7YP6LWR4PiAiq6glHVHpRNsjrg2fFygJa0m6owOO8UGBRm5WqpO2xBlS3IGa/v7xkyLi/G2XF5f9aQg0CwaHeKyfLBU+Xq5RuZz5C03vSWZp4rQVVpta9Z9MOYT6XF67aPXOULPK2TjoYciKJkAUwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BMDUGZBv; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="BMDUGZBv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xzXbWrMtLibjxXl6ZHVE1BIYoBsX6ZyJwnpRKBya/uw=; b=BMDUGZBv5e8qNHRyRquZHQqWcs
	MLVicx2fiWQ5ryy+pBP4E+aHpOPjaMQdeOvQdK/Aj/2dW9xnkLJTxoNZMhLoAPHgeao8gxqarsrw1
	NZIHKlJl5cWJb1Dw0H5cN7gxYjoI6pN10zz9muHah+g0YjqsorlyiuKYu3TS220CHhHOG+zIatXf0
	vDt9aULQeGooK58u7Gqo9R9ayC1HTmR48ywMLhYnKD0ZbdplHDn85/zpdqPDcyopY98mfYvKhsQHZ
	L4LhiypFDnjIREMq0t8Z5AdRjxd96XDvYzX2rgx3qo01Nn5Ieb4i0wnGg+yc3UGGhZHcjuynlNHiX
	IwZh59mw==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uTk10-007Zub-IX; Mon, 23 Jun 2025 18:27:26 +0200
Message-ID: <ca0dab04-7ccc-43e6-b5f3-7a739c867bc0@igalia.com>
Date: Mon, 23 Jun 2025 13:27:22 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] futex: Initialize futex_phash_new during fork().
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Calvin Owens <calvin@wbinvd.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20250623083408.jTiJiC6_@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250623083408.jTiJiC6_@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 23/06/2025 05:34, Sebastian Andrzej Siewior escreveu:
> During a hash resize operation the new private hash is stored in
> mm_struct::futex_phash_new if the current hash can not be immediately
> replaced.
> 
> The new hash must not be copied during fork() into the new task. Doing
> so will lead to a double-free of the memory by the two tasks.
> 
> Initialize the mm_struct::futex_phash_new during fork().
> 
> Reported-by: Calvin Owens <calvin@wbinvd.org>
> Closes: https://lore.kernel.org/all/aFBQ8CBKmRzEqIfS@mozart.vkv.me/
> Tested-by: Calvin Owens <calvin@wbinvd.org>
> Fixes: bd54df5ea7cad ("futex: Allow to resize the private local hash")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: André Almeida <andrealmeid@igalia.com>

