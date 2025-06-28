Received: from baidu.com (mx22.baidu.com [220.181.50.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4301FF5F9;
	Sat, 28 Jun 2025 04:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.181.50.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751084534; cv=none; b=rzeuTpyxFZEB4KUhnKPppQcDmVC/o4BOOtvbmWR3U+W6seUM5LT/HePZSGXvTj2RjGBZa1ZeGrxru50Rhek+GYujnlL7xfHVBx3WlCm+ncUQISPPcYInxdmY1pfj+e8/ZB3l20xxYS41X7bxpxXP4S1zqGilg/BpeGbmEyhohgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751084534; c=relaxed/simple;
	bh=6iUxPsouPfbPMTPlBopnDeYG2kcfWDoCi74FyvjwH8E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D5kTnsy67KsfZA5B5JYopu79n6zLSYpMAorQqUCZWPEzgHxIq5LVXqIHZBtIY9ZeFsS3LR3/4eYxEIKvIXp2tk3bvf4Wq631UwzjVlN74m2GhVx/HrU7ZAMuAeHEA8Mi6ypHOsNZUpUaopmfxCfubxULGZsfLhOMjtwIY1pF+18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=220.181.50.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: Fushuai Wang <wangfushuai@baidu.com>
To: <ecree.xilinx@gmail.com>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-net-drivers@amd.com>, <netdev@vger.kernel.org>, <pabeni@redhat.com>,
	<wangfushuai@baidu.com>
Subject: Re: [PATCH net-next] sfc: siena: eliminate xdp_rxq_info_valid using XDP base API
Date: Sat, 28 Jun 2025 12:19:29 +0800
Message-ID: <20250628041929.47704-1-wangfushuai@baidu.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <3a9be6e3-7533-4216-aecc-7261b4adf8af@gmail.com>
References: <3a9be6e3-7533-4216-aecc-7261b4adf8af@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: bjkjy-exc2.internal.baidu.com (172.31.50.46) To
 bjkjy-mail-ex22.internal.baidu.com (172.31.50.16)
X-FEAS-Client-IP: 172.31.50.16
X-FE-Policy-ID: 52:10:53:SYSTEM

>> Commit eb9a36be7f3e ("sfc: perform XDP processing on received packets")
>> and commit d48523cb88e0 ("sfc: Copy shared files needed for Siena
>> (part 2)") use xdp_rxq_info_valid to track failures of xdp_rxq_info_reg().
>> However, this driver-maintained state becomes redundant since the XDP
>> framework already provides xdp_rxq_info_is_reg() for checking registration
>> status.
>> 
>> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> 
> Looks alright except that subject prefix is misleading as it sounds like
>  it's just patching siena rather than both siena and ef10.
> I'd suggest splitting this into two patches, one just touching the siena
>  version with this title, the other with subject prefix just "sfc: ".

Hi, Edward

I'll split this into two separate patches and send the update
patches shortly.

--
Regards,
Wang
