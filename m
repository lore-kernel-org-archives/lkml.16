Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBC11C700D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 02:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175796; cv=none; b=ttHz7WFTFQxhRFcq2Nvr6W3QFXAenEjw+qfB08EIghpB3SmS8MWrfyvWNRlsik3gZ7UCKV+8yEMWmKbybCxMFMLRwvs+RMbeq/0fGxMuq54mGaYS/J7NvlJ2G9v7J48JRHr887WxY7c+jPypBiKgO1jy3ArxbK5bQj0BQ9EWbAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175796; c=relaxed/simple;
	bh=9pG3d+Vv/D+c2XUQO5c2ZogKPSjLbdSoW6F95KaMEU4=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o0Qi4zpcDZw1nnkl9cIvuT/82nQByijqB+vu/Vr5vHamCYSZZfsh+1tssSwWodeiCNH7EtOACzIeLNvpwVckH1rpk8ZN6CgbU58Me4SZiHQAGumOtg2Cb8OaduDyDNZtezfMdC9Q/rf27z0iH35hfkOIiQ5HA1oFJArqIUL9adM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=n41R62xU; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n41R62xU"
X-UUID: 53138ea6427b11f0b33aeb1e7f16c2b6-20250606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=9pG3d+Vv/D+c2XUQO5c2ZogKPSjLbdSoW6F95KaMEU4=;
	b=n41R62xUaNPjCwODRQNRKrZ2PoaaCyWlyxoJslzY7JPrzjQYqFnmxVpql14LEHqgPfxKFVhDamUDNGQLHIi0Z0KELZKOzgFyxGUIziGePCZq717S+kUDxbH0j4F62pzu7b+pfzZ6W5f4FRH96r+QcFWT7rv9IwDCyiFLuPA9uKc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:721c0b95-d34c-4b51-9d8e-27e0424c0349,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:e2768459-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 53138ea6427b11f0b33aeb1e7f16c2b6-20250606
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1013879082; Fri, 06 Jun 2025 10:09:49 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 6 Jun 2025 10:09:47 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Fri, 6 Jun 2025 10:09:47 +0800
Message-ID: <16a2c47ec23a70eee085900ad3bad07d68bc87da.camel@mediatek.com>
Subject: Re: [PATCH 1/1] stop_machine: Fix migrate_swap() vs. balance_push()
 racing
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Date: Fri, 6 Jun 2025 10:09:47 +0800
In-Reply-To: <20250604160436.GL39944@noisy.programming.kicks-ass.net>
References: <20250529084614.885184-1-kuyo.chang@mediatek.com>
	 <20250604160436.GL39944@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-06-04 at 18:04 +0200, Peter Zijlstra wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> This and your other patch about migrate_swap() are two distinct
> problems, right?

Sorry, this patch also addresses the issue of double adding to the
list(the same problem),
but it functions more like as a error-proofing mechanism...

However, after some deeper investigation, I believe this problem should
be resolved at the root cause.

Maybe we should move to another mail thread to discuss the correct
solution:
https://lore.kernel.org/all/20250602072242.1839605-1-kuyo.chang@mediatek.co=
m/

