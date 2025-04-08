Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481E51C8617
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103487; cv=none; b=JHWbKrzrx/LvIIl151rZu/+wm2ijFxNKDvpwJTlJ/vcdFjeXHx8l7xdFHADVW4KrMzWTM5Jgqx9QEfcWwmBI+op4V2dpt3JbtsPNWk74TUjPEBhgWbcLdcBU5yX27Gq28FmINJMXS3jTTFsWVRytvoxZHdsJ7DKBx3dmVt4hs9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103487; c=relaxed/simple;
	bh=jVy/MK7bBVX1gRdZQ076RoaH0+XfycZXX7LUcm+1hks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyU+fcb0HEXTpXuQUvi8vwLh1qQisXv+s5SxrL1z5AoH5lmbOAGRIC0wSnmTLL+iv85uEG0+iiJ3zUuxFaHwxpjJlmQm50pzEOiVJm1LHNKAf/O2Hm6084XZutSh1FaUEEY6HAEWw824fIy9XbAfDkN8H0I8j7HxEWq9v72d58Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=k+Egiz57; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="k+Egiz57"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744103476; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=luGcT9UL4O/HTTEZuavQB4JaVAyjvuyVqOeWlRcydM8=;
	b=k+Egiz57IDtOfhAc1xrMIa3xnKNR5yXobnbao9sO8ZJNmilJJD+oOtZ0D0KFFqT/xv0tSlHkNauU/T07WtDh4fhZRorlyL5qD1fFh10/Vyr5H4e3WNFjRR4EWlg9MXWaNWAy9Z30P8uh6t5yY74LccwtRafR7t6/xMIdswgh8s8=
Received: from 30.74.129.179(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WWEd0mn_1744103474 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Apr 2025 17:11:15 +0800
Message-ID: <98585dd8-d0b6-4000-b46d-a08c64eae44d@linux.alibaba.com>
Date: Tue, 8 Apr 2025 17:11:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] erofs: add 'offset' mount option for file-backed &
 bdev-based mounts
To: Karel Zak <kzak@redhat.com>
Cc: Sheng Yong <shengyong2021@gmail.com>, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>, Wang Shuai <wangshuai12@xiaomi.com>
References: <20250407110551.1538457-1-shengyong1@xiaomi.com>
 <20250407110551.1538457-2-shengyong1@xiaomi.com>
 <7nupludayogog6jylmwnxwel4zlvfxeozzcg5qkf5g5a5fpt7g@3bgvpbqfuxxa>
 <d4eae031-8fbb-45e2-bdf4-f3a8a034b8ad@linux.alibaba.com>
 <gk7jzl7pktrdpznqp2hiuflx56xyttw4v4z3epia2ziw4oz547@cft7fyeoirfr>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <gk7jzl7pktrdpznqp2hiuflx56xyttw4v4z3epia2ziw4oz547@cft7fyeoirfr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/4/8 16:46, Karel Zak wrote:
> On Mon, Apr 07, 2025 at 11:49:31PM +0800, Gao Xiang wrote:
>> On 2025/4/7 19:40, Karel Zak wrote:
>>> We can improve it in libmount and add any if-erofs hack there, but my
>>> suggestion is to select a better name for the mount option. For
>>> example, erofsoff=, erostart=, fsoffset=, start=, or similar.
>>
>> Thanks for your suggestion!
>>
>> it's somewhat weird to use erofsprefix here, I think fsoffset
>> may be fine.
> 
> Yes, fsoffset sounds good. I anticipate more filesystems will support
> file-backed mounts in the future, making this option reusable.

 From my own kernel perspective, it's not possible for the majority
of read-write fses especially have nested transaction (like
`current->journal_info`) in addition to many deadlock factors
without extra workqueue contexts.  But for erofs it's safe.

Thanks,
Gao Xiang
