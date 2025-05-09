Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0852923506F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746803367; cv=none; b=nWxMeU/KIwh9Aja3V+jMO1e4O6Bjw1Fz/ws6XArt4seylEd+3ijddRyA1Zrw8Q3CEKm3KHfk63/XhgPFV9Q9KZ3KLjr8pm6TlRkwbaCDKTx5D6RcadaRe3e4WcjgppOp2jHzROnyh+Ol/oAswdgVuxja6sFYesDDw/0Th0oz4aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746803367; c=relaxed/simple;
	bh=dA6ZcKfmigQgmyxqYP3SECtdnVaMP7ARcLCY2F5DfrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RToXgJCBFLc2sJGY/zSmh77ZvWp1urefFBK77pi7Ii5FrbryMrlYCgAflCJxOZQl9tExOiAMJjgHxeoWTVc6ozYba8c2rXmzpV2vUZb++DLH+HvxkkQv+4hzGukgaJSJTRtisFGid3apsGUTzoTtWqYrcgygtU3a0nzmSNoX16k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [36.44.121.59])
	by gateway (Coremail) with SMTP id _____8BxrOKgGh5ot8LbAA--.59435S3;
	Fri, 09 May 2025 23:09:20 +0800 (CST)
Received: from [192.168.0.111] (unknown [36.44.121.59])
	by front1 (Coremail) with SMTP id qMiowMAxzMSeGh5ovNbAAA--.32998S3;
	Fri, 09 May 2025 23:09:19 +0800 (CST)
Message-ID: <fccef9c4-da67-c232-7d61-07f2c6cabbd0@loongson.cn>
Date: Fri, 9 May 2025 23:09:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/5] Enable some configs in loongson3_defconfig
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250430131516.24287-1-yangtiezhu@loongson.cn>
 <CAAhV-H4VpYVEhwnhh4s083FuNsfEhGwrYxtceFDKD_imnBBrjw@mail.gmail.com>
 <CAAhV-H5yvrfd0aH=AuFwYQzFcnQAMBekO0frvwhThaPKx6p1RQ@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
In-Reply-To: <CAAhV-H5yvrfd0aH=AuFwYQzFcnQAMBekO0frvwhThaPKx6p1RQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMAxzMSeGh5ovNbAAA--.32998S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr47tr45KFyfuw1xXry7urX_yoW3Jrg_Ca
	95GF109rykGa9Y93ZIgr4S9rsYgry0gw1kC34UGw1jq3WUWayqyFsxZas7JF15AFZ7Jryx
	Xr4jqr17CFs8CosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbx8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbI
	xvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU
	=

On 5/7/25 12:24, Huacai Chen wrote:
...

> Have you tried (both OpenSSL)
> 
> sudo ./perf probe -x /usr/lib64/libcrypto.so BN_mod_mul_montgomery
> sudo ./perf stat -e probe_libcrypto:BN_mod_mul_montgomery openssl speed sm2
> 
> or (both Tongsuo)
> 
> sudo ./perf probe -x /opt/tongsuo/lib/libcrypto.so BN_mod_mul_montgomery
> sudo ./perf stat -e probe_libcrypto:BN_mod_mul_montgomery
> /opt/tongsuo/bin/openssl speed sm2
> 
> and still success?
> 
> I tried, and both got a SIGTRAP or system hang.

I can reproduce it now and have a draft patch to fix it.

I am busy with some emergency stuff recently and will send
the formal patch as soon as I have some free time to make
a proper commit message.

Thanks,
Tiezhu

