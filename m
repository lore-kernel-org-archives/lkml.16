Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F31DCB09;
	Thu, 24 Apr 2025 07:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481551; cv=none; b=Xq/mw9c679gK66s0s7mAZAg2DHzWghZMXEYBTkELHFHoXO8PN3ZoFcd1IwoNZMa3M3kbIQcOYqsKsVXctvv7NqEsrqvd/xjhGrHu1ZbNIcEhxM8OZ8pN7g2L+49DJWkOmQVYavXzEDZ6zTkhwcfcGoN3007doNhUsZ4PkLXk+H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481551; c=relaxed/simple;
	bh=EkRGMXV61mxS1Jr+5BweoZLfS5HQIMfM2iHDQZfDtgs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U+zsSN+6uXXim6DT51IjLIU88RNr1En6izrYN1YAuw4SV7a+9vdcI5NzFnYzx8DLux2ndYiOnIRcAr6v7aNd+WiiVESp4chnkMrOlt27tI+Dp4p0m9Mbc/TPuXSpnVnanDJEhaiuBSAgfJ7biIZ/bez2Fm4TMwxu2qI7OzE8CcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iR53X055; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iR53X055"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745481547;
	bh=EkRGMXV61mxS1Jr+5BweoZLfS5HQIMfM2iHDQZfDtgs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iR53X055QzTaG7CuxiPOpdr/6nFMLEZ9Um8oMTyaTdS5eibjpOq0Ol+tKricl9S1F
	 uqncnA0BBgwBns1Dcwl61zFvyjPHwMAj3OCc/5QMFAGKoFgCmlY9G+R/n7FOdfGrO7
	 SaMIJWYEGJdCILI7NQb/WTbQjjFA9jkvGp5Vkmo3Q9I4W0wTIR/+7sbuPwz3OrgrpV
	 Jq++GRuR6cyfv9zfbabX2h479qabjzFxZMy78tLqqPwFoo2UpVYmvLnb+0lbnYCtXe
	 6VFj0Kb2v8qjpDn63hzB+UMn8sPBDWdOO5sK4k6kfUc4tVPldTIg3GapwCpphg33OS
	 4O2lGkPLCNMAA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA15217E0C96;
	Thu, 24 Apr 2025 09:59:06 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, dianders@google.com, 
 hsinyi@google.com, matthias.bgg@gmail.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, knoxchiou@google.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v11 0/2]
Message-Id: <174548154674.22041.7217055615854393236.b4-ty@collabora.com>
Date: Thu, 24 Apr 2025 09:59:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 24 Apr 2025 09:08:48 +0800, Jianeng Ceng wrote:
> This is v11 of the MT8186 Chromebook device tree series.
> 

Applied to v6.15-next/dts64, thanks!

[1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
      commit: ce8ec1f8c8b363c2511332c909d06df7ae01f1b3
[2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
      commit: ed34944cc3bc5602c1151effdb6aced9f2f992a6

Cheers,
Angelo


