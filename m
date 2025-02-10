Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA5D1BEF64
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176073; cv=none; b=Rr2StJeZSdYWI2lRXasdf19RAmxYxViqhiASo8qegcFVtSlb7G2/zxkF3sAsU9ycWdlInLhGikif8HzAYmLWUbWZx3lilBwRt63r7XUc3XudUNKdtI2xqrYZe5Q++PxbGRRw3tzK0OfTC1f8qtfr06VC8z/fyQ0A2AqQFrwwWQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176073; c=relaxed/simple;
	bh=Bcvcykb1VVaPDwpfAnABboqj/VYagUNkInDMcF4jrKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b43B0y9aGjdrdgSobXdfHX5hDAXbZ1V4yW4Wp/jVK4ZmnKIrpmF5e8VemLpUqVOKwjd7tytw1YyK7yWtlav0xD40v9pwxIlYKWBeVxp1T2Q1DcXRhzog5GSphQkQR1o+pEtunCnKYZ+2h+hwOFvlgUQZhl5eF4B14kyRZ2Mr/iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=bLRmO0Do; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="bLRmO0Do"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739176061; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=TWuE4lQOz0gx649DxJPkbLkDmKgtaRuILeaeAkiIgFs=;
	b=bLRmO0Do3Isn5dTrKhsB+0ZZCuA0In2qbPOKSDGDTndLQHSx6tVnrbjRWBIxjaiBJ2kFkFnFKDz3WPRwJ6SokBPvfQwBhsQ5SuCHs9FZf+PyGO1wAXKiwT1El+cEDqT05FUWiwavHPFbTJl6DfBUxjHKaUzYMzv1awRZJxEVRwA=
Received: from 30.41.15.245(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WP80Bv-_1739176055 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 10 Feb 2025 16:27:40 +0800
Message-ID: <a37e2ae3-257c-400f-9abf-858b25f15ac2@linux.alibaba.com>
Date: Mon, 10 Feb 2025 16:27:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] erofs: use Z_EROFS_LCLUSTER_TYPE_MAX to simplify
 switches
To: Hongzhen Luo <hongzhen@linux.alibaba.com>, linux-erofs@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
References: <20250210032923.3382136-1-hongzhen@linux.alibaba.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250210032923.3382136-1-hongzhen@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/2/10 11:29, Hongzhen Luo wrote:
> There's no need to enumerate each type.  No logic changes.
> 
> Signed-off-by: Hongzhen Luo <hongzhen@linux.alibaba.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang
