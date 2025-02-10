Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0AE256C8D;
	Mon, 10 Feb 2025 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206476; cv=none; b=IBV3TTBczgY0ucCIhg8UFj4xkcro5T5YTBYIWgc/2nMCkd0lTDg1XhK/9Tq9x9//hB6qJYIJFwsQr6k1/XrKN7zSYC2ZoLK11bUGPbsLD7ynuLQNXYx+gh05TM8PVP5jgKe0hkOO5SrBxoU5ZqrGvjN6RyC35L6fmztx/gPUCIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206476; c=relaxed/simple;
	bh=XXUXtKCb8m0ZoxBZnwkSYx3OO4Z4vWRVL4J7xX1eNxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIyqrml/q7uOYOJnDrUhiKxL+X2s2UqWk5DGV2v2wWwTh+SSsMVSQG2KPqWMHf75fCC0txFhmjXmbQxa6SqrSEbiAMCmTtdz8K4MVd/FnBhBwErYC/EnCIcgy6PV7p+1LuZo1xK//wwmjHqP9CCr78Zf3/S1LAKc+k98nVCvBoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=RHGArdI8; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="RHGArdI8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XXUXtKCb8m0ZoxBZnwkSYx3OO4Z4vWRVL4J7xX1eNxM=; b=RHGArdI82Ta+7BQxVaood/gCvv
	A1crLElbGMlYrtJcZ9WIIPvHII+9ZddBrEJGspwEc3KVxv05murACZvFJekue/P0T+oaFo6oSyWZ3
	QXqH+yOwW50l9/BiFGq36F5dMgrImnuhhB3Q2puoXByolH8fgjaJB+MIwTJDVDPND+h1GbUOmGVDe
	FzlYDkH9/8X7RrJ7NRKwWKLyvFfcvJL1KEhRgiJcdwSzPgx4OcndCKuPNumKPPwI4+9WT4FyIVufq
	vUxfMuZ9LYmTpyjogBamAuE1zwzGnYGHj6M8qG/SoAdKtN3o8/u7ArRTq5pqr0xUlM98wZt9awZu8
	SCJm7r8Q==;
Received: from [179.221.50.164] (helo=[192.168.0.195])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1thX36-007LJX-2T; Mon, 10 Feb 2025 17:54:26 +0100
Message-ID: <8132a592-3e29-485b-9b24-b70ddf819ff9@igalia.com>
Date: Mon, 10 Feb 2025 13:54:21 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: cs35l41: Fix acpi_device_hid() not found
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, kernel test robot <lkp@intel.com>
References: <20250210163256.1722350-1-sbinding@opensource.cirrus.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250210163256.1722350-1-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/10/25 17:32, Stefan Binding wrote:
> Function acpi_device_hid() is only defined if CONFIG_ACPI is set.
> Use #ifdef CONFIG_ACPI to ensure that cs35l41 driver only calls this
> function is CONFIG_ACPI is define.
>
> Fixes: 1d44a30ae3f9 ("ASoC: cs35l41: Fallback to using HID for system_name if no SUB is available")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502090100.SbXmGFqs-lkp@intel.com/
>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
>
Reviewed-by: André Almeida <andrealmeid@igalia.com>

