Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755658462
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 03:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744081638; cv=none; b=MPlCFCN+wpyVeuYj8Ruuoj078bU6CmKjetnz61+6IZdeocEgavagh7opqC3wTsNrL8I39F+fsTfFHpfXItZhmvZEHkpgtzN7A9QmcvA8/U00vqGm5OLqoDrsGM2yJnbWRSy5O0uVcoNMfJ3407jTPQ2Telh1vSk+JYgKIpo0D1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744081638; c=relaxed/simple;
	bh=96ySzd9iFoP4DX1zWwjf1BpV/FabtP5cNLJzoMll5sA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N85uZ4Mm9zra2yvcu4KdoodY3ygnCODeV4PzHfjvwS2mtxBEYlucjdvWfNSCpnbzJKfM8NJVgg4Vie0EJeblOU5MRT0Q+FKs/VHX3EVqdlEXBDL+WZqi9Vgca1e/tlnzIs9f4EefcX3qNOfjv0VPIvrA+XxhlCED2Qk7XKUHYL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=uCj/PDvy; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="uCj/PDvy"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744081633; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=7/qcQmc8TlRDaeREPlCChF/VdJV1qOYf2bxSgnptYUE=;
	b=uCj/PDvyB1ENcICtmR5v/b5mlI8BQfAmf5SwWOt/3xPC5/eFuH8W9nom9KrP7P+1pNuL/NGY4+t0SB0W+WDzjCHxgDJZFgqy9ueaW+ivMyGbOQFTwCz3xVbAjA9idtidd/dxKbizNha6XOOioaeiNe06DJPu/1R9HqxAS1oMWMA=
Received: from 30.74.129.179(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WWB03J1_1744081632 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Apr 2025 11:07:12 +0800
Message-ID: <da085862-1c82-4b3e-82ea-b54e2432d96d@linux.alibaba.com>
Date: Tue, 8 Apr 2025 11:07:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org
References: <20250402202728.2157627-1-dhavale@google.com>
 <CAB=BE-TzPKSsHo_nvMuGkB_4JbbP8OZ81ce=76y-28nAeZiniQ@mail.gmail.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <CAB=BE-TzPKSsHo_nvMuGkB_4JbbP8OZ81ce=76y-28nAeZiniQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sandeep,

On 2025/4/8 10:53, Sandeep Dhavale wrote:
> Hi,
> Gentle ping for review in case this slipped through the list.

I'm working on internal stuffs (unrelated to erofs,
currently I have to handle erofs stuffs totally in my
spare time), also does it really need to be resolved now?

It's not like a bugfix, if it's not urgent it will be
landed upstream in the next merge window.

Thanks,
Gao Xiang
> 
> Thanks,
> Sandeep.

