Received: from fallback16.i.mail.ru (fallback16.i.mail.ru [79.137.243.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B34B22A4E3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010768; cv=none; b=H40hXZL4HevZHISW1MIH9A3IZbEp7LBt7q9v4xVyxj8eao3b3u4ZaJXm7l5HwwfXOnoVatw7Vid5qpe+w9OQEQcz+2njAdV4ds34Js4DFRlJnXVhwxM4LiMvDTbwiDXpOVbdN9uJndO4iqU5BOFKjbxFfQf6tlznUqKI1S9oItA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010768; c=relaxed/simple;
	bh=8fDGSrcfdZQuVR0XLRnGNRoO2pUPHeZSK1wfUb94Y2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jt2Q/vhB/zTX8xtCLvh43iXMAxOuKST3YvDVxjVYdgXABTlsLf6CghXwXjfn+Ka2+YtexF4GAEt0OhCHpo3sZ9svux1DfoyEb8nwfhs6vwVr14iujjp5r/IE3PgJY1wpBzcPpeKqhnTloZ/FRwCU2XcXdD0x/IGCED1OlW5KuUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=HSzHyogT; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=uyyIdPa8; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=j+Vm7OX0; arc=none smtp.client-ip=79.137.243.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="HSzHyogT";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="uyyIdPa8";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="j+Vm7OX0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=k6FsebLrg7ctDUE6wppDzVYatcO3TME3ex+VU2y2SJg=;
	t=1744010764;x=1744100764; 
	b=HSzHyogTGgFEvoG6r0LsR5b/NUJRa5UyEtMl3Hp13OOfq3/UoKxo4sH7Axi/46dflrMn4ZqbqoXIGxfvNEhHApl+iHQiehUkGThAupPfB8ixkkWHxE66P5lbRV5EdgCdhw4pWZAGTrizJEX4K166RDHKULDmzSyYclbTPbkgN2xO5y7bSLEYWNs3lUOHO/1uUYriANEev2dOtbdqnX7n+KDw4ZDtbS+WwEoz8Xi4tuDArf3kOuGXtTxb0PatuxQwXFflIjK1gcID/EWpD5b6dddHnNkFhjkAmADxYNX5i8ZfW7ERW1QqRmhJH94MmC+6ZtRYYvfJe2kdXJQ2TdrIww==;
Received: from [10.113.66.215] (port=46350 helo=send146.i.mail.ru)
	by fallback16.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1u1grj-008tCo-So
	for linux-kernel@vger.kernel.org; Mon, 07 Apr 2025 10:25:56 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=k6FsebLrg7ctDUE6wppDzVYatcO3TME3ex+VU2y2SJg=; t=1744010755; x=1744100755; 
	b=uyyIdPa81ejoZJfyIboU3nX+H30i6RBeKIzdB4kVAwWcqe/8msSZv/bwteUCUia6ddf9C053G3q
	R+UNgqWix4o0ZRGkcJAGP+u4BhL1mCCXD58YRekyoaIsMsujipPAMqFXP33sQnYGV7Fg+jxo1tQRS
	usgbRxDOtg9OtwInXxszN3vYDpEGpKOnbvMwtU+FmMEYWfI/R4dl58q8GYMZrBDVS+M14vWnRqGgE
	O/P7Cz7Ym1tFUa3AULdEfAv/P/CRXjk4Tbtx7B3mUScGAGqwz8g4O+Bq0zSOfJlpVBb6hbbtxgEo5
	0MwUjE8AfHdOxhywUJM2UzwaVn+kPBuSbF1A==;
Received: from [10.113.69.86] (port=60390 helo=send35.i.mail.ru)
	by exim-fallback-7687f6b856-l84hp with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1u1grb-00000000Crh-3Sd3
	for linux-kernel@vger.kernel.org; Mon, 07 Apr 2025 10:25:47 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=k6FsebLrg7ctDUE6wppDzVYatcO3TME3ex+VU2y2SJg=; t=1744010747; x=1744100747; 
	b=j+Vm7OX0MA2iGrBKZv987WC9KdcJKKjb9A7Px644j2MTjcvnupJGojojY3H0+lasTQ8aEyohjgq
	rSb0yq0GMzeDjmdK3YXXqREH9oJ+vAJ9iNCBLWbVDI77cbye9N5FjVn6wm4dmgcFtTPtiu8Gi8tO3
	EUU/xEjO7WvnUD9V9uUsjocjaaHEK1UI6VawNTTJosvSlyfZsm/Zet/kFpkXNBkatD7Spn09NVId4
	L1PpePeQvrTKkl3v/2/1ExeTDheoN4kV11gOcvnmO6bFb2wRPe9cEulxXHWwoPFRVtp268kEg0Cym
	tcCBnu/F6M2hwqdWmJETB7sdo5Ix3l9LXM6g==;
Received: by exim-smtp-895bd549-2zq5x with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1u1grP-000000004YM-2RmK; Mon, 07 Apr 2025 10:25:36 +0300
Message-ID: <f57e8a74-4124-457c-b5c9-d193505ba093@inbox.ru>
Date: Mon, 7 Apr 2025 10:25:32 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] time/sched_clock: move sched_clock_register() out of
 .init section
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, peterz@infradead.org, elver@google.com,
 namcao@linutronix.de, samuel.holland@sifive.com, daniel.lezcano@linaro.org,
 apatel@ventanamicro.com
References: <20250404050540.13507-1-fido_max@inbox.ru> <8734ekwkqk.ffs@tglx>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <8734ekwkqk.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9D636D1752D35745ABEA41E1096584FC65AC47060FE4698F5182A05F53808504055E70B2624D29F4A3DE06ABAFEAF670507A7D4AB3B778E9F48986B5E6468EC384E897E529B7F4697
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72E4E5201E1C2E308EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371D5B197C6EC5B4BE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2C025A3674B67DD5A2E070BE324C7D3C428A6C4467C1B0D09BB0A4F435E46E6718B35066C979671628AA50765F7900637A596F99EC23ACBE8389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B1F8789D36234D406A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249D082881546D93491E827F84554CEF50127C277FBC8AE2E8BF1175FABE1C0F9B6AAAE862A0553A39223F8577A6DFFEA7CE31A2885C41F97C443847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A538EAF4A272C10B4F5002B1117B3ED6968F973DFBFD076981AD0703CEB2EF9A27823CB91A9FED034534781492E4B8EEADD0953842B444AAC3BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3474B2583E513159845E51CE5AC2E01B9AD104CE80A7A6E911836DA156F4083C3EA7495C8E6A64FB6B1D7E09C32AA3244C55A9727374D5D39377DD89D51EBB77426BE7A47F26C8637AEA455F16B58544A21E304C330D73BD2357ADA2CBCE38F05762A0BE504FE5E636F1E3461735CEBA253FCF178C6DD14203
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS2bpaGes9W5uUxxY0MEu7A=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6EBF9A7E99EE885915BBD2BAF715B64A64E4050EF2BCA4E6C90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B401F4E5391F75DBFD500E3EE2A81AC5E75CC637B87A5A8D3A68F3CF0E9FE49B69109CB64EB66B5A390A136EB756A9E63BEF11B740AD3D8C9477CBF5AD09BB542A06F6FCF8469C91F0
X-7FA49CB5: 0D63561A33F958A569F8F2E9664F0E6B5002B1117B3ED696DE2F020A12BE65DF1682F49BADD9DBB802ED4CEA229C1FA827C277FBC8AE2E8B6B3B7BB21660B6C7
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZMaUPV/ZIQiTY6oQZ85T/yQ==
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B401F4E5391F75DBFD0CBE42A9A15E17523B5D21A41258168768F3CF0E9FE49B69109CB64EB66B5A393893BE5D689A7B01F47130CA1ADC30272791EFA55CC80BBA
X-7FA49CB5: 0D63561A33F958A533B01DCF9CA38127EF91F95ABAB3462E72B2E9221B5A6080CACD7DF95DA8FC8BD5E8D9A59859A8B6CC2F3E6DF6689A16
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZMaUPV/ZIQiRugxhSNTw5Ww==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

07.04.2025 09:26, Thomas Gleixner wrote:
> On Fri, Apr 04 2025 at 08:05, Maxim Kochetkov wrote:
>> The sched_clock_register() is widely used by clocksource timer
>> drivers. The __init prefix forces them to be initialized using
>> macro TIMER_OF_DECLARE with __init prefixed function.
> 
> No, it does not. It requires that they are built in, not more.

Thank you for review.

Let me explain some more. I'm trying to solve similar problem, as 
described at 
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20240312192519.1602493-1-samuel.holland@sifive.com/#25759271

I have both PLIC and clocksource module configured as Y (not m) in 
Kconfig. So both of them are included in kernel Image binary. But I 
still unable to probe clocksource device because it depends of PLIC irq.
And PLIC probes much later than TIMER_OF_DECLARE part of the clocksource 
driver. I tried to convert clocksource driver to regular platform device 
and it works fine except warning:

WARNING: modpost: vmlinux: section mismatch in reference: 
dw_apb_timer_probe+0x136 (section: .text.unlikely) -> 
sched_clock_register (section: .init.text)

Dropping __init from sched_clock_register() helps to solve this issue.

Is there any real point to keep __init in sched_clock_register()? I see 
no issues to call this function at any time later after kernel boot.

Is there better way to solve this issue?

>> So lets drop __init prefix to allow platform device drivers to use
>> sched_clock_register().
> 
> s/So let's//
> 
> "So let's" means nothing.
> 
> Also this has nothing to do with platform device drivers. It's all about
> modules and nothing else.

Anyway, this patch opens opportunity to compile clocksource drivers as 
modules and probe them much later.

Thanks.
