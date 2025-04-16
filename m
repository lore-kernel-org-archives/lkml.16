Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED16F1547C0;
	Wed, 16 Apr 2025 19:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744833132; cv=pass; b=d9V4ZAGBS+izdUlX3U7Ojo7knVrD4asVUgCKIzZvSPM4wzbzIIsA6/Sn28gkWDk9McozU3ztye+b8DIPjZgLJ64MpkfoepPzv+RmMt8vTwAGfV0L1rY8liA4eDJfiCTPtbQeV0K19YjdcfFT79pZS8Yq+ega4fL48dyKIqBlwts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744833132; c=relaxed/simple;
	bh=H37bXWkBY8CtSRf5TosO7vFaBoMtKion2iisV7LN0fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKSxpMqZu9C3sShKu1DjiG8+doO1WsCcqLBrXcJpZ/HwNtMRjciBIzaMbbP+1JahgnFoIgosDMnGw3bUXTXll6djhGJrHY0ywNRksZsXcwEGjtyqrE/VVFWsPavfAyLO37+UTTQ9cAgS3U0nBb9algUydOQuaXzIXgRkc0tGiVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=VrIlqo3C; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="VrIlqo3C"
ARC-Seal: i=1; a=rsa-sha256; t=1744833065; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iIjK98sxkynmff0y9oMplzffXbtE6Nc3uESpZz/KiihpFRzt261y4QXeXsv7Fdq/SgR1dd8ZK40e1tA96jY4M6dMKaMilMu+7ivGLwJExUINoJ/5ggE5ulEV/Mm8r38zfdLflEPdr3NsEZ2boExoAXBfH8cWRRq2WZMiK08TbBY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744833065; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QQnMgSN3RMHftVhAZYOIOMgtEA4ud0N6wZt7HLG7xN0=; 
	b=PHWqcG/6l1wCuYU9C2MxnTE+kaiWKUq+t3M1ak1J9DV8HSIQ2tp95jVEl0xYjVoXTG9ncAz6TxKzmzeJcK98KXs4b2AGYWBo9LbQIca1TiiHRZtboKeo5w7PsjR45hU7ep7Bvfkx4J6dNiSF+YfNbtCF7VaH8QZh0TMFyAfpdog=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744833065;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QQnMgSN3RMHftVhAZYOIOMgtEA4ud0N6wZt7HLG7xN0=;
	b=VrIlqo3CHxeq2BeVRuDRR2dUSjFQMtn0rqowxJQJBE6m183lMnDvmzrJ68zx5PA0
	hS1YrFwmnzfmip4Nr7aK6NLKIhYV7MuQeKrDZnvGAeTEoqM8S71bhDKxfSHRFWqM/zk
	z4wj6uCmsaKt7Q005bhSX3Z9e/cq9JN07NsjGA6s=
Received: by mx.zohomail.com with SMTPS id 17448330628774.730471333362061;
	Wed, 16 Apr 2025 12:51:02 -0700 (PDT)
Message-ID: <b82ae3ed-442c-4a87-82be-a973cd333287@collabora.com>
Date: Wed, 16 Apr 2025 16:50:51 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] riscv: dts: eswin: add HiFive Premier P550 board
 device tree
To: Sjoerd Simons <sjoerd@collabora.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Min Lin <linmin@eswincomputing.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Yangyu Chen
 <cyy@cyyself.name>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>, rafal@milecki.pl,
 Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-11-pinkesh.vaghela@einfochips.com>
 <956d76b0-4f82-4f95-8f70-70896d488bd3@collabora.com>
 <0dc3bb03-3708-4134-96bf-d5f95187e8bb@sifive.com>
 <096a8318629dea9073ad6c4807a2f1dedc6b0cd6.camel@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <096a8318629dea9073ad6c4807a2f1dedc6b0cd6.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Samuel, Sjoerd,

On 4/15/25 4:39 AM, Sjoerd Simons wrote:
> Hey,
> 
> On Mon, 2025-04-14 at 11:00 -0500, Samuel Holland wrote:
>> Hi Ariel,
>>
>> On 2025-04-14 7:55 AM, Ariel D'Alessandro wrote:
>>> Hi Pinkesh,
>>>
>>> On 4/10/25 12:25 PM, Pinkesh Vaghela wrote:
>>>> From: Min Lin <linmin@eswincomputing.com>
>>>
> <snip>
> 
>>> Although commit log says that this includes DRAM configuration, looks like
>>> it's
>>> missing? In order to test this patchset, had to add this following memory
>>> definition (picked from vendor kernel repository):
>>>
>>>      L50: memory@80000000 {
>>>              compatible = "sifive,axi4-mem-port", "sifive,axi4-port",
>>> "sifive,mem-port";
>>>              device_type = "memory";
>>>              reg = <0x0 0x80000000 0x7f 0x80000000>;
>>>              sifive,port-width-bytes = <32>;
>>>      };
>>
>> That is a misstatement in the commit message. The memory node is not included
>> in
>> the static devicetree because the amount of RAM installed on the board is
>> variable. It is the responsibility of firmware to provide the memory map,
>> either
>> through EFI or by patching the memory node into the DT at runtime. I believe
>> the
>> current BSP U-Boot does the former but not the latter.
> 
> Amount of RAM being variable is pretty common on devices using FDT these days;
> Typically the dts still gets a memory node that's a reasonable default, with the
> expectation that e.g. u-boot will fix it up. If you look at other risc-v
> devicetrees in upstream they (almost?) all come with a pre-defined memory node.
> For the P550 board a default memory node for 16G ram seems reasonable (as that
> seems the minimal SKU?)
> 
> That all being said. Indeed the sifive BSP u-boot doesn't seem to call the
> relevant `fdt_fixup_memory` to fixup the memory node, hence us having issues
> booting with u-boot directly (without going through EFI). Honestly this was a
> bit of a surprise to me as only most other architectures that's just done by
> common code, but that doesn't seem to be the case for risc-v (either upstream or
> downstream)

As Samuel mentioned, the latest BSP U-Boot is now patching/populating 
the DT memory node at runtime, after commit [0]. And this indeed ends up 
calling `fdt_fixup_memory()` as Sjoerd pointed out.

In conclusion, this is working properly with the current BSP U-Boot. 
Feel free to add:

   Tested-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Thanks!

[0] 
https://github.com/eswincomputing/u-boot/commit/7fab50468f19efea72ff27ac08cb388fbf5be307

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

