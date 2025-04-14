Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C6258CEE;
	Mon, 14 Apr 2025 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624392; cv=none; b=Lqs3xThSgHVpheEpawVZk0YHunVEwRySj5FlCNTv7C0SVhUSnb4V3W5EGDKR6MNoL20R93wf/DZ78La3kJQBkULEvBUdCu7bpkaARNAYOi8W6wIm481oiSjUnOrQpdKerLu5eZmDiA7AEW8qwdnfzI/L8IE6iTeXyCXiP/Pw0Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624392; c=relaxed/simple;
	bh=j2SzmPPwkVr+GnHaMaOl0CKRdroaM8UZJyrHL1hnC30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W9McG5e8pO387iiPqQ+X4/gVwWO9d9CAD9Qlc3alORr2tYoTFuEARlKJ1JgWjDx55GuCmI4Nli+K7L8c4wYqWCFpwTrt2cLrklBWNJgmR1m1w/v4I4C14Rp9/J784VPe081i0U5ykc+YgH6m/9Q7ICF+CtnIxVoQ3JLkIdZYQqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=odvUkYLx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="odvUkYLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624388;
	bh=j2SzmPPwkVr+GnHaMaOl0CKRdroaM8UZJyrHL1hnC30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=odvUkYLxZ8YkiJfbG2sJ3UiFMZHrSXey5sdciD5Llb35EwBflcosn0pilMoLJseEG
	 E+5AtdWCC2GZ5e/iLatIwpUomH51Eto4SER+t8W1BbI7u0zvfELBv7GNX6HcLAiu9b
	 DsYwM3ac0/1iljXCpNH7r1qPGwIHeCSdxozsL4Xvp3JjBq7Asn+Hvrjq+IjEtBYbXi
	 kDJbDybJ/3l+qq2f/Y3sgkZKmcsSb4pMqLLjeSg0HXgYq/R8xGFj+/J88AYNUJenIC
	 lmpkeFbTLmehft3lLTXAxToVvl8oZfnDQGzfEZwpReHW0kownW5booaWDbFUBXz795
	 7xMh4ZNE+USmQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 15F9A17E0809;
	Mon, 14 Apr 2025 11:53:08 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Chengci . Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20250408092303.3563231-1-wenst@chromium.org>
References: <20250408092303.3563231-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188: Fix IOMMU device for
 rdma0
Message-Id: <174462438799.45420.5429446309371613057.b4-ty@collabora.com>
Date: Mon, 14 Apr 2025 11:53:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 08 Apr 2025 17:23:02 +0800, Chen-Yu Tsai wrote:
> Based on the comments in the MT8188 IOMMU binding header, the rdma0
> device specifies the wrong IOMMU device for the IOMMU port it is
> tied to:
> 
>     This SoC have two MM IOMMU HWs, this is the connected information:
>     iommu-vdo: larb0/2/5/9/10/11A/11C/13/16B/17B/19/21
>     iommu-vpp: larb1/3/4/6/7/11B/12/14/15/16A/17A/23/27
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0
      commit: 267623000d11f6d483214be2484555f600393a12

Cheers,
Angelo


