Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B592561D9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745228173; cv=none; b=Li7Zq/jp/jTwGnhIb8YVZJSwM80VHkUuRVlzasCKCrzWLMHEOU/1ZyTtLUPuxEMa0n81+aY+gxSbgEmJcvu//ynmaHmGzDr6AVZzC03FkR92Ee0E9Uvc9f0fh0nDZJThZfgNN0YRRUfJhE7SHkarOkkPcRXWduVWLi0XUmOsoXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745228173; c=relaxed/simple;
	bh=Zp4gMDaMWzDGtZtkeLt9/VO3JXhhhixZvyc+ayvdSbs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZhGNFnTTQH1IKV2ZKWRODsTv7+sAbtecCIVkCK0IbhoV7rWVRiLRi47MsgkrSRYwT6PU9YHWz+5bLc5EyG1xSQRyP/KLQCljfSiY+EFXWyuTh/bids/ZW3vi0LOYWVVq529Gna8y4QA6XwlC/SkaCcbKUxa0AJgWtLdPn9kSsSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ebx/Enr6; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ebx/Enr6"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745228167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zp4gMDaMWzDGtZtkeLt9/VO3JXhhhixZvyc+ayvdSbs=;
	b=Ebx/Enr6Glgte+qKW8JP7+dVaT7FFMEILixGvIJHzrr3rHGOrhs1FOdOUbfnJNoHLNOIiQ
	udHRDCCDUmqpGtJZgajGcw8XPLmrtaVsTpOaP0XFxnAItcplSnKHgQ9ZbsnhajFDNhU7i+
	gWIAieKS/BRcs9/xMBM+/KcMtYADj5k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH V4 3/4] mm: add max swappiness arg to lru_gen for
 anonymous memory only
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <65181f7745d657d664d833c26d8a94cae40538b9.1745225696.git.hezhongkun.hzk@bytedance.com>
Date: Mon, 21 Apr 2025 17:35:34 +0800
Cc: akpm@linux-foundation.org,
 hannes@cmpxchg.org,
 mhocko@suse.com,
 yosry.ahmed@linux.dev,
 yuzhao@google.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DB64B965-2E54-401E-86F9-8F79C50B21C9@linux.dev>
References: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
 <65181f7745d657d664d833c26d8a94cae40538b9.1745225696.git.hezhongkun.hzk@bytedance.com>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Apr 21, 2025, at 17:13, Zhongkun He <hezhongkun.hzk@bytedance.com> =
wrote:
>=20
> The MGLRU already supports reclaiming only from anonymous memory
> via the /sys/kernel/debug/lru_gen interface. Now, memory.reclaim
> also supports the swappiness=3Dmax parameter to enable reclaiming
> solely from anonymous memory. To unify the semantics of proactive
> reclaiming from anonymous folios, the max parameter is introduced.
>=20
> Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

