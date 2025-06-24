Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 07F4B126C05;
	Tue, 24 Jun 2025 02:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750733201; cv=none; b=cvjdA5NIUloim45FPji44R1QvdQlMA9Z22ZuSFydNA6MzPiI0cqXeUbuuEQzN7BgyswhIXi5eHV3E63mNpDadj99vE/ju5hn6MKqwH6vGILgkGC6E7K0oOXE1XiIPVhuQp+HvCeEXSnaCFfQXEn8tjvIDALI+adCq2RFYjRtcqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750733201; c=relaxed/simple;
	bh=UirS17wDlN+uZS5OTCjvwZFQgaINVpMg2H+KdhloJ58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=BO7RYNHuML7C9s0L4pHeqipMnOWpb5y5FVBsCFPjGWlmZxM9qv07eJ0MFjT/xvPYoI8rK8MpkJnnhZBUgqUmtiA6243Zh8pIt5A9+eBLq3IuMzUJ8eMiexDpOYBMBoe8SYhi6jh/GCqRKx8mLL4+ghKEoze4nAogt7ikmK80hRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id F201F6018E3FA;
	Tue, 24 Jun 2025 10:46:24 +0800 (CST)
Message-ID: <cf505dc6-c123-44fd-9ee6-5aac4764f905@nfschina.com>
Date: Tue, 24 Jun 2025 10:46:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/resctrl: using guard to simplify lock/unlock code
Content-Language: en-US
To: Dave Martin <Dave.Martin@arm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, james.morse@arm.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <aFlvTt+GGSIqgOKH@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/6/23 23:14, Dave Martin wrote:
> Hi,
>
> On Mon, Jun 23, 2025 at 07:25:41PM +0800, Su Hui wrote:
>> Using guard() to replace *unlock* label. guard() is better than goto
>> unlock patterns and is more concise. No functional changes.
>>
>> Signed-off-by: Su Hui <suhui@nfschina.com>
> How were these cases chosen?
I chosen the code  that match with "*unlock*:" label.
>
> I notice that this patch only handles some straightforward mutex_unlock()
> cases.  There are other opportunities in some places -- particularly
> alloc/free patterns.
Yes, as Dan mentioned[1], there are too many these patterns and I'm not 
sure how
much value we can get to do this things. This patch is a try that using 
guard() to
remove some  lock/unlock pattern and simplify the lock code.
> Overall, I'm not totally convinced that backporting the guard()
> infrastructure into code that wasn't originally written to use it is
> always worthwhile.
>
> If the code is simple, there is not much benefit.  Otherwise, there is
> a significant chance of unintentionally changing the behaviour of the
> code (though the exercise may be useful if it identifies actual bugs).
>
> Either way, such changes will get in the way of people who are rebasing
> on top of this code.
Got it, it's ok to omit this patch. It seems this patch has not enough 
value.
> FWIW, this patch looks OK though, and the diffstat looks reasonable.
> Since this code was recently moved into fs/, diff context noise may be
> less of a concern.
Maybe only for some complex lock/unlock code, guard() can bring some value.
Thanks for your advice!

[1] 
https://lore.kernel.org/all/d07fe2d9-3548-43fc-b430-2947eee3145b@suswa.mountain/

Regards,
Su Hui


