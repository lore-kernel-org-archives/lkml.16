Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BBA225766
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010646; cv=none; b=nVDboH+6hpInZeUBxnUcj+N/P3oTuMaWhVhsT3zmecPDiNS7GrEcHWAxUzQkJFFyE+UgJscOTQIfi0442iIxmlqwR9i7+EiWz86fGHiW3kj45PHcL67a6deh/5Ov/BxyL25cFe9fYSHkvEBnGBoQaf6IEq4+xaZJpR6ZI4n12W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010646; c=relaxed/simple;
	bh=pnzzzkDj1vh7E0qDKqGcW9a3EPHGGFmwcfOk6V7hevw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B++k2sRQC59YGksmFQWtIdm8npcSJ4sgafXjCNzztZtyCTEXNowjimHtVQq8apCqhaexjH7Vax+z/LeMeiWC6t/KJJlzfhz+7r2VNCSof1qSDRNG1yFRQsgJctz2GcXb2Q1dvcsQ+0VFRlxc7RBFtGiRSBao/6GUZjXp8HVhIcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NwWz0cvY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NwWz0cvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744010637;
	bh=pnzzzkDj1vh7E0qDKqGcW9a3EPHGGFmwcfOk6V7hevw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NwWz0cvYx9xVXYuHpzoHvsv5rUk09bHT7PmOea/TuNm4WhQn7zA2mD8W2ZUzdiT2G
	 G8501T8LYuDAykgdLViuJRMCHo8dEBvu7Pj1rsnESFrR90C++Qnp0XJ6ghzZ+tu8hm
	 FlPOwLwEU1Yn1Aauy2y6cK2lwovcgKC7Iw1mK9jurRcbbC62qJbiEAmI4WIkjNw4M1
	 k3iJELKMvzrfyvEeJfOfw8y72viiRVIbft+MRZU4V73Ir8TiXB3yD+SkovizTyvyP3
	 OXX/Wkfa5EaxRpOSz5gc3ZHHUANX7ou4hDl4r8z1z4stOmJQZHzXIILA2qODruq4rh
	 W3ZcMGkS3SAyg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7ABC817E07F3;
	Mon,  7 Apr 2025 09:23:56 +0200 (CEST)
Message-ID: <c44c1e89-f1d8-4774-9de2-744313c6ea73@collabora.com>
Date: Mon, 7 Apr 2025 09:23:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add SCM for MediaTek
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250404-maintainers-mtk-scm-v1-1-95d1f0c3f60b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250404-maintainers-mtk-scm-v1-1-95d1f0c3f60b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 04/04/25 21:52, Nícolas F. R. A. Prado ha scritto:
> Add SCM entry for "ARM/Mediatek SoC support" section.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

