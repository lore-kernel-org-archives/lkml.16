Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B00128A717
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548138; cv=none; b=FuTWOYXEKhv6qcvBFTdEp/PmRDtJyKKBZvinSMHTdesrpHqXvopG7JNLfH1j6/04LmN5esm/8z/SRgAArn7FKnXzIljcnk3Ihby1hdunXQTTiofWdPVFJJRvPs5340lNu36Z+YUxBeP3PcKkhfnGsJG5qZPpPy46FxnwdeL7mFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548138; c=relaxed/simple;
	bh=neoytbdOezsKKo4C9NyQCBztohOxoRt8nVOAX8RBjt0=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=WNMO8F1bHAtDRvOZq1zlaFyUcwwrDiBPeHo4HnkJOAudByHLwAQGhjSYgIvo9gg7vAO0GZTB/8sebPwdk/j9KYp1Ne1MokYDk1ZIHc2W9I/btNidtV9OLtPdEexN+0+8+tKrtAAQuQplk8wBmU0lxiA6IMm1Tno1/ZXue/k/gos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com; spf=pass smtp.mailfrom=partner.samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=iRG1NmXw; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="iRG1NmXw"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250610093533euoutp015af27f9671030f563cd48eacbac2c196~HpMIFy15G1134611346euoutp01H
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:35:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250610093533euoutp015af27f9671030f563cd48eacbac2c196~HpMIFy15G1134611346euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749548133;
	bh=neoytbdOezsKKo4C9NyQCBztohOxoRt8nVOAX8RBjt0=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=iRG1NmXwCTYnEFw6Wx7DY1v2M0b+sYTlpbv9/Hz0TFjMIXVhOjCRhGDiLM4Pk4YCp
	 QiDzXPn15lqHWV1twNgOZOjGqiiGxI/7+N6XtgAX8ShTk9iiKnwedtx0WDyQT3w9NX
	 7Y2GvhPKvthqCm3DkcvWbh2d28VohIWUEVlGWNS8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: RE: Re: Re: Re: Re: [PATCH bpf v2] xsk: Fix out of order segment
 free in __xsk_generic_xmit()
Reply-To: e.kubanski@partner.samsung.com
Sender: Eryk Kubanski <e.kubanski@partner.samsung.com>
From: Eryk Kubanski <e.kubanski@partner.samsung.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
CC: Stanislav Fomichev <stfomichev@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "bjorn@kernel.org" <bjorn@kernel.org>,
	"magnus.karlsson@intel.com" <magnus.karlsson@intel.com>,
	"jonathan.lemon@gmail.com" <jonathan.lemon@gmail.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <aEc5BVcUJyb+qlg7@boxer>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20250610093533eucms1p2874b3734a3663d8bcc277e2f7edea665@eucms1p2>
Date: Tue, 10 Jun 2025 11:35:33 +0200
X-CMS-MailID: 20250610093533eucms1p2874b3734a3663d8bcc277e2f7edea665
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250530103506eucas1p1e4091678f4157b928ddfa6f6534a0009
X-EPHeader: Mail
X-ConfirmMail: N,general
X-CMS-RootMailID: 20250530103506eucas1p1e4091678f4157b928ddfa6f6534a0009
References: <aEc5BVcUJyb+qlg7@boxer> <aEBPF5wkOqYIUhOl@boxer>
	<aD3LNcG0qHHwPbiw@boxer> <aDnX3FVPZ3AIZDGg@mini-arch>
	<20250530103456.53564-1-e.kubanski@partner.samsung.com>
	<20250602092754eucms1p1b99e467d1483531491c5b43b23495e14@eucms1p1>
	<aD3DM4elo_Xt82LE@mini-arch>
	<20250602161857eucms1p2fb159a3058fd7bf2b668282529226830@eucms1p2>
	<20250604141521eucms1p26b794744fb73f84f223927c36ade7239@eucms1p2>
	<CGME20250530103506eucas1p1e4091678f4157b928ddfa6f6534a0009@eucms1p2>

xsk_build_skb() doesn't seem to handle
zerocopy case in that situation.
(IFF_TX_SKB_NO_LINEAR device flag)

How to return descriptors back after
building skb in zerocopy mode?
How does it work in this situation?
