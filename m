Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3726B946;
	Mon, 28 Apr 2025 14:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745851389; cv=none; b=V+66V/7hd2lDALKC/yPjSeoh7n3HXq+8/hciAr1iNetdeaKyj4BJowiogPW0Rk4ew3a44FloSWdov8CWyU7Lzcs3TLNfknAGu+058uhvq8xYH8I2VwUqsW32ZLBmw7NDhMHEOXJJQjttnCLcqXZJKDGLJNqfW7PELkpPzs8UfOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745851389; c=relaxed/simple;
	bh=z9OkavGLRiwKUAlbS1aUYpP9QJo0K0Ls/01PvvTxOpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SWIvQJ1mxRrNY8LfIA39m0caAD4aKDTplO5Vq6IW2/um0CCGJyDbXvaLXrnMC67I+f8DNCN+AvnpvOMriQRE+UEzV5e/mTHNojS25/1NDs0QmQQEOosFdvlUVcSbuzmj4NTkikPwMjavkBeH5xYHliywJbYysCcDDScYWHEK+Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ScNhtt87; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ScNhtt87"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEh0JD2801171
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 09:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745851380;
	bh=J7+h/LgZtBmvJt8JuJ5cbWqsFbL9/uU/TCLyYAqk33s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ScNhtt87S6L5/RXRu3uQs1c2gOVUzCCvnUBkonVZaNmPICtYHcpHAfY7+7XyskCRM
	 bb8VMEQ097iak0CDJ+tm5sSireTi89IjNm7E3/E1yMyIkm0NoUqtD99eRjUmtUsr33
	 W+VycRRJLzO4mSMcSczdh4NWTHFyZJZ8KIZ+p3xA=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEh0LH010797
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 09:43:00 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 09:42:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 09:42:59 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SEgxWO102875;
	Mon, 28 Apr 2025 09:42:59 -0500
Message-ID: <09979b2a-73b0-4a74-978c-b082764e777e@ti.com>
Date: Mon, 28 Apr 2025 09:42:59 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add global CMA areas for few TI SoCs
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devarsht@ti.com>
References: <20250424084415.66457-1-j-choudhary@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250424084415.66457-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/24/25 3:44 AM, Jayesh Choudhary wrote:
> Hello All,
> 
> Following AM62* platforms[0], this patches add global CMA reserve area for:
> - J721S2-EVM (1056 MiB)
> - J784S4-EVM (1920 MiB)
> - AM68-SK (1008 MiB)
> - AM69-SK (1904 MiB)
> 
> These SoCs does not have MMU and hence they require contiguous memory
> pool to support various multimedia usecase.
> 
> The calculation was done considering H264 codec requirements, dual-display
> supported in each platforms and multicamera use-cases.
> Additional buffer was kept for other peripheral s and to account for
> fragmentation.

What if I'm not going to use 8 cameras, 2 displays, and decode 16 H264
streams all at the same time? Why should I always lose 2GB of DRAM
unconditionally, just in-case someone someday runs this imagined
worst-case situation?

If I *do* intend to have my device perform some nightmare use-case like
the above, I can pass the needed CMA size in on the kernel command line.
That is a configuration for my specific use-case after all, and DT is
*not* for configuration, especially not insane configurations like this.

Andrew

> The breakdown is mentioned in each commit message.
> 
> [0]: https://lore.kernel.org/all/20240613150902.2173582-1-devarsht@ti.com/
> 
> Jayesh Choudhary (4):
>    arm64: dts: ti: k3-j721s2-som-p0: Reserve 1056MiB of global CMA
>    arm64: dts: ti: k3-j784s4-j742s2-evm-common: Reserve 1920MiB of global
>      CMA
>    arm64: dts: ti: k3-am68-sk-som: Reserve 1008MiB of global CMA
>    arm64: dts: ti: k3-am69-sk: Reserve 1904MiB of global CMA
> 
>   arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi              | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-am69-sk.dts                   | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi            | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 8 ++++++++
>   4 files changed, 32 insertions(+)
> 
