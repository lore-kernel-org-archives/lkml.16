Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E10245006
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751114828; cv=none; b=KO+K7w3GhYtLMTVCsB5DVB1c907mRyHFZYRwqk/e9BQfrifnKBt5N5yLfgDsgY7Swn4VyF3fLlTOXLEGz0xbuA5E4RlunY832wAPM9oDcq1jqFZ9pLiqYsxqUm4fv7cinH3C+CiAnMywBvt8iOkxZCz1DDgyqR9/sTwux3GevD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751114828; c=relaxed/simple;
	bh=fz1f9/yF76vWySpCE0DY+zKwQjXSblai1L3X0i9FFWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvoQkgZK9gYtEeyB8uhykVM14EvmKgSxh7Rn3Ztlw/0/AP8Y6y/yETJNZXN2IpVdjLBOg7khoZUxehmD3Cj3mFLdqFbHKvuUhYvxQABtVnT28gq6NB/P/XIbjkc1OOGHf9laxYCyiE9BYvDQDqbIQDneoNe5U1cxZlBlYPAFLgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rg3N5PXB; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rg3N5PXB"
Message-ID: <ef88247b-e726-4f8b-9aec-b3601e44390f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751114812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EFJplUYXs7SZhJPSIA1PM6yryHsqvW879yJ8rEcqRoA=;
	b=rg3N5PXBg2GjpObyU1Pu+uNxocA2XRqLZrEmlEz+/JO2sqp7IuIlXBNwRTxXKTe3cAuDYQ
	4Vn4E3mXK9lBpna+7FKjLlJoOx1GarggQI8Y3H1hTBUtwpK08yItYZtU8Fwlk1WqWKQalL
	VruAOj/kZdFYBRh3WmkTIZ/vhaDPrS0=
Date: Sat, 28 Jun 2025 13:46:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v06 5/8] hinic3: TX & RX Queue coalesce
 interfaces
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Helgaas <helgaas@kernel.org>, luosifu <luosifu@huawei.com>,
 Xin Guo <guoxin09@huawei.com>, Shen Chenyang <shenchenyang1@hisilicon.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Meny Yossefi <meny.yossefi@huawei.com>,
 Gur Stavi <gur.stavi@huawei.com>, Lee Trager <lee@trager.us>,
 Michael Ellerman <mpe@ellerman.id.au>, Suman Ghosh <sumang@marvell.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Joe Damato <jdamato@fastly.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <cover.1750937080.git.zhuyikai1@h-partners.com>
 <1367e07afb9038177bff2e5fb3062edf775a3ba7.1750937080.git.zhuyikai1@h-partners.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <1367e07afb9038177bff2e5fb3062edf775a3ba7.1750937080.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 27/06/2025 07:12, Fan Gong wrote:
> Add TX RX queue coalesce interfaces initialization.
> It configures the parameters of tx & tx msix coalesce.
> 
> Co-developed-by: Xin Guo <guoxin09@huawei.com>
> Signed-off-by: Xin Guo <guoxin09@huawei.com>
> Co-developed-by: Zhu Yikai <zhuyikai1@h-partners.com>
> Signed-off-by: Zhu Yikai <zhuyikai1@h-partners.com>
> Signed-off-by: Fan Gong <gongfan1@huawei.com>
> ---
>   .../net/ethernet/huawei/hinic3/hinic3_main.c  | 61 +++++++++++++++++--
>   .../ethernet/huawei/hinic3/hinic3_nic_dev.h   | 10 +++
>   2 files changed, 66 insertions(+), 5 deletions(-)
> 

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
