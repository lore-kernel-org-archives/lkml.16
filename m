Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895021DFF0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750734085; cv=none; b=tjsFkVLC34eu/naTxkvkkM3PJqcjdw6dR7jDg/9hXTgKc3r0WN+tyykgvl0dk3kRprv7b3HXlFF3r/fMx9VUfiJYVrQuUejdJtIDjpMq76ZbX+llS+kDixZd5z3kJbdt0MSt2Gqc2uNfIZnY/ghhG+9tQygn3RYg2lfvO9+svw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750734085; c=relaxed/simple;
	bh=ifnz8cxST4csJGnR4a4YdF7G0sJ2pkz2ecy8IJ4k5Sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HfpjuBlTH+q0gqNb0h/dasKSmnpDzi07Hxeyznwbq4R708Qtx1uXu7oE+I1/NQFF6bKPkv9nVT0DD0NqzoRtLt3vwMNeeyBwyo2JVhfbHo1p2Enx1Imrufd8eZdAmSbsmL3TBXK9gh2jWA4TvuNuAx/IXdLbIGiwbHrwCjO+HME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=um9XhMVS; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="um9XhMVS"
Message-ID: <63712e2f-9a20-403f-aecd-83cfe759be69@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750734080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=udTLqfIMq1qZsjVlQeoaOV0M0czxIkS7YGqSRxrTbqg=;
	b=um9XhMVSx/JUdFxW+9zaoi3GBlAvOvn8+azbCNOqCcptWYD/HY9VO3swBeHgT8sCTdMLL1
	90cDnZeYUamv1S1hmKAsF2u8XhA5pdqh+nGIUu0Of+bJBj0Jp97vRYKu4dBqHx5vxQt5+o
	/9DU9Jl/7yuK9QEHAGJPxZRSC9bNFU0=
Date: Tue, 24 Jun 2025 11:01:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH linux next 0/3] Docs/zh_CN: Translate networking docs to
 Simplified Chinese
To: jiang.kun2@zte.com.cn, alexs@kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: xu.xin16@zte.com.cn, yang.yang29@zte.com.cn, wang.yaxin@zte.com.cn,
 fan.yu9@zte.com.cn, he.peilin@zte.com.cn, tu.qiang35@zte.com.cn,
 qiu.yutan@zte.com.cn, zhang.yunkai@zte.com.cn, ye.xingchen@zte.com.cn
References: <20250613112357830opyPb3DK8AEbbNPPJBTrM@zte.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250613112357830opyPb3DK8AEbbNPPJBTrM@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 6/13/25 11:23 AM, jiang.kun2@zte.com.cn 写道:
> From: Wang Yaxin <wang.yaxin@zte.com.cn>
>
> translate networking docs to Simplified Chinese
>
> Wang Yaxin (3):
>    Docs/zh_CN: Translate netif-msg.rst to Simplified Chinese
>    Docs/zh_CN: Translate xfrm_proc.rst to Simplified Chinese
>    Docs/zh_CN: Translate netmem.rst to Simplified Chinese

They are not in the same thread. Please resend them.

Thanks,

Yanteng

