Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB0325B698;
	Mon, 10 Feb 2025 18:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211222; cv=none; b=NtZw93d5hl0gY3jdKrofrOBQfeyHOip5aUKZuhRt/UyBr9uQdSUJQQ6wfeUJg6IoEihiaOFv4xRirx5VRO71n8rtvGt02VRoF0ZVCnbNpnrmEntXsE6/NeBmI04cGCaVrUVSmhou9cZNMVzhHrTZVRVnaKDRr3e5W51NCEkpcPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211222; c=relaxed/simple;
	bh=DNTxNnlpbnWWRGSLIhSb0yqO2/NQIhteooKjXOoIaH8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uQXj6NykRhid66GV/T70+fiLCmdi8qizDg7nQbmL/52rv037F7bIZ41RFoYXLAkfpECB3OOSFzbd1/smFov/Zv0egx1gaIzsYGGvNlRs9FqrfaLvZfrxwHTG/4fCMh3ufOmyQ8UJ5U4E0TGzckxDRizITgrDcYUWkOk4+trh2U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OB6Ws/Y3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OB6Ws/Y3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 840AB411A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739211220; bh=w9j5vZMF7dn8HYROcc2I1/hyr4LMm/6Irk61YnauYuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OB6Ws/Y366zb7E8d5Blh9xr3Zz8CZSOCr+yDIQlmEsm4bd4fER6xKgBye4ZVpZ70a
	 Pq0ymjwhb/ds5/GzZ6tRGpyJDf2HgrKZ/7iSx38+Kvfts0Ikp0xgwhMnK3Ok3D12SK
	 1Glo6tByi7ktGAH2cRFFNMbrF7pJWVoIFI/O8VlVSlTQUfFolRdQrOPyt12B8FLb1I
	 gfWm6Dg3yUG9Nui2QaMx3npgBmwtSj4lWxVMafy12UpqxeoEPThPv98M6VPoQgfwHe
	 CPJhfOn62/jEbjIy3bfiNpuPIU7jlc4PZajeI/PMN/dKdD9umf0li4fjeWUyRg+w3o
	 h08pEIp79DiKw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 840AB411A7;
	Mon, 10 Feb 2025 18:13:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: WangYuli <wangyuli@uniontech.com>, alexs@kernel.org,
 si.yanteng@linux.dev, wangyuli@uniontech.com, dzm91@hust.edu.cn
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 horms@kernel.org, zhanjun@uniontech.com, guanwentao@uniontech.com,
 chenlinxuan@uniontech.com
Subject: Re: [PATCH v3] docs/zh_CN: Update the translation of
 dev-tools/ubsan to v6.14-rc1
In-Reply-To: <2B33A00C9F5BECC7+20250207084821.251531-1-wangyuli@uniontech.com>
References: <2B33A00C9F5BECC7+20250207084821.251531-1-wangyuli@uniontech.com>
Date: Mon, 10 Feb 2025 11:13:39 -0700
Message-ID: <87tt91zmzw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

WangYuli <wangyuli@uniontech.com> writes:

> Commit 918327e9b7ff ("ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL")
> removed the CONFIG_UBSAN_SANITIZE_ALL configuration option. Update
> the Chinese documentation accordingly and revise the document format
> by the way.
>
> Link: https://lore.kernel.org/all/6F05157E5E157493+20250123043258.149643-1-wangyuli@uniontech.com/
> Link: https://lore.kernel.org/all/fb3c5ec4-eabc-48c0-bf0b-d20cad978b4f@linux.dev/
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
> Changelog:
>  *v1->v2: Update commit title to v6.14-rc1 and add Dongliang Mu's Chinese name.
>   v2->v3: Remove the ".. _cn_ubsan:" tag.
> ---
>  .../translations/zh_CN/dev-tools/ubsan.rst    | 33 +++++++++----------
>  1 file changed, 15 insertions(+), 18 deletions(-)

Applied, thanks.

jon
