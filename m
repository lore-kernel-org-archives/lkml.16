Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFD8204C11
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040987; cv=none; b=jJ1ymivMAKXgU71x8ielnrCI0LG7IMH7yNHwG5Jqdlnmy7LmxqCEbdAcmx+p2cNQoveBQvZdX3mQOrjM3t6IbYLRw+EHuplySnemcYTYSSjKFVfZj/CTOvHrDBPbYjDgqBDOU69+mxcoq0slfXz6DQev8Cf2I8O7eAy48YY57Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040987; c=relaxed/simple;
	bh=N2ftCIGioPQZu6M5rK2/jNYsk9GQgz3WNf0G4aTWkoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3Il7SbhPyl0VpxAE0Eo2qXBCMyDFPBCyOD1cXkxducYWG2OpxKVMQ0x9e3RZqFH7sVgqoLYcU9dgz13ID9RCHY3mOm/x/cjylQaikkZ/V3pQXT5Jzrgjj6RXRwbKCRLTtmwmUySc4E6yNcPzH9qhF/PYLcNfApC5d8RfeDEwU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=GlpXIQxg; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="GlpXIQxg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744040972; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Uuao6a3Hk9qEI19jH9g3VC8nk2PN+ye3kVNY+myZ3fI=;
	b=GlpXIQxgBtq5kt4O82ThuOhz7fDhyg6XSzUrvC++qBNdhpBzyWwfVVlKWsF7vzKRrHG6EWwKdxH+H0zyXjSoLCwAAlRwI7E91WBRu+/FwDcBlUoSSI3uTBrJYZJUBAhQYcGaJ3eeJO5cJJ90pgxwtjrwWa6UAEbXDWLArd7lqjc=
Received: from 30.134.66.95(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WW11ulY_1744040971 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Apr 2025 23:49:32 +0800
Message-ID: <d4eae031-8fbb-45e2-bdf4-f3a8a034b8ad@linux.alibaba.com>
Date: Mon, 7 Apr 2025 23:49:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] erofs: add 'offset' mount option for file-backed &
 bdev-based mounts
To: Karel Zak <kzak@redhat.com>, Sheng Yong <shengyong2021@gmail.com>
Cc: xiang@kernel.org, chao@kernel.org, zbestahu@gmail.com,
 jefflexu@linux.alibaba.com, dhavale@google.com,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>, Wang Shuai <wangshuai12@xiaomi.com>
References: <20250407110551.1538457-1-shengyong1@xiaomi.com>
 <20250407110551.1538457-2-shengyong1@xiaomi.com>
 <7nupludayogog6jylmwnxwel4zlvfxeozzcg5qkf5g5a5fpt7g@3bgvpbqfuxxa>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <7nupludayogog6jylmwnxwel4zlvfxeozzcg5qkf5g5a5fpt7g@3bgvpbqfuxxa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Karel,

On 2025/4/7 19:40, Karel Zak wrote:
> On Mon, Apr 07, 2025 at 07:05:51PM +0800, Sheng Yong wrote:
>> From: Sheng Yong <shengyong1@xiaomi.com>
>>
>> When attempting to use an archive file, such as APEX on android,
>> as a file-backed mount source, it fails because EROFS image within
>> the archive file does not start at offset 0. As a result, a loop
>> device is still needed to attach the image file at an appropriate
>> offset first. Similarly, if an EROFS image within a block device
>> does not start at offset 0, it cannot be mounted directly either.
> 
> Does it work with mount(8)? The mount option offset= has been defined
> for decades as userspace-only and is used for loop devices. If I
> remember correctly, libmount does not send the option to the kernel at
> all. The option also triggers loop device usage by mount(8).
> 
> In recent years, we use the "X-" prefix for userspace options.
> Unfortunately, loop=, offset=, and sizelimit= are older than any
> currently used convention (I see the option in mount code from year
> 1998).
> 
> We can improve it in libmount and add any if-erofs hack there, but my
> suggestion is to select a better name for the mount option. For
> example, erofsoff=, erostart=, fsoffset=, start=, or similar.

Thanks for your suggestion!

it's somewhat weird to use erofsprefix here, I think fsoffset
may be fine.

Thanks,
Gao Xiang

> 
>      Karel
> 
> 

