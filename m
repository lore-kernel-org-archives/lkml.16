Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D482AD24
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178484; cv=none; b=g1qxr5000weOkUSdk3T3rLcJXupfQrlHTL8ePvXVm5sxMoHvhjk5fjomGqnTg8rb805OLVuX+RtNQKndYzuIr+DIKU7Ts7fsTj/GkSyFE+f+6XuJDtYcjniDy0YZGOX53ynHAQMHUvBgv0QGzYMalCC4Qq7ewTEQCgqj+WmJACU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178484; c=relaxed/simple;
	bh=UPSCyMMfuVANy8PSXUYucve1oVzm165bjFjIAed6SPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lbc7gdc96i9OGVTo5uSG1riP6Id84j1IEVRUsWjjmgFf8eM8WYVSguD7ktVXUCm3DtBm8ZZeZ7BaI1rlTnk/FSemnk/PDZwL2ogUmSPwDxzomWtD8jaXKsMWzy3A6hNOFg0za7Pd6Zi+aCPWFYXdABlWY1V7++scvSO4hbd8u+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NGoienxs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NGoienxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746178477;
	bh=UPSCyMMfuVANy8PSXUYucve1oVzm165bjFjIAed6SPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NGoienxsBw2Sbv3RD9NHv2tN3toXv6loIQQG5F8HVubwH0xW5dJJDrl5NtWWKy4sj
	 W8t/9w4tjyHQE/ddFJwZrXfpT82M44VIrwN6U8yjP5Y4FbhNXrmrbqvlV7VcAgCDDX
	 PxS0ZSm5s030UNRWeVq29D+83NM28maTOPxH00F5cqXV0IlzXTMgszm1hdydKO2yxB
	 FSqxADI/4tsQ4hZ0iKYngunbkm+FXhdQKaGZqcpPaItj9/xK0SmD08BtmYK9NrUuAS
	 ayBO4YxSv9fHT15h+SZ9aJtsXcvTWgu7404PminYdzqmvMqe+6zxbQAu0Yg6DW/PSp
	 3dMPI3+FpQoNw==
Received: from [IPV6:2a05:1141:1cc:8600:1cd7:9a7e:17d7:cd2c] (unknown [IPv6:2a05:1141:1cc:8600:1cd7:9a7e:17d7:cd2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C343F17E0649;
	Fri,  2 May 2025 11:34:36 +0200 (CEST)
Message-ID: <3ea152ad-100d-4931-a149-19f24381e463@collabora.com>
Date: Fri, 2 May 2025 11:34:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] clang-format: format short enums and macro
 definitions correctly
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Collabora Kernel Team <kernel@collabora.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Michael Riesch <michael.riesch@wolfvision.net>
References: <20250210-clang-format-fixes-v2-0-37894413bbee@collabora.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20250210-clang-format-fixes-v2-0-37894413bbee@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 4/10/25 22:58, Michael Riesch via B4 Relay wrote:
> Habidere,
> 
> These patches set two previously unset clang-format options to
> (hopefully) sane values.
> 
> Looking forward to your comments!
> 
> Best regards,
> Michael
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
> Changes in v2:
> - collected Nathan's Reviewed-by
> - rebased onto v6.15-rc1
> - Link to v1: https://lore.kernel.org/r/20250210-clang-format-fixes-v1-0-9bcf43a4b4b2@wolfvision.net
> 
> ---
> Michael Riesch (2):
>       clang-format: do not allow short enums on a single line
>       clang-format: align consecutive macros
> 
>  .clang-format | 2 ++
>  1 file changed, 2 insertions(+)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250210-clang-format-fixes-914ded0e682d
> 
> Best regards,

Gentle ping.

Can these patches be applied?

Thanks and best regards,
Michael

