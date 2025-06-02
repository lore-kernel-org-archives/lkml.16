Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010D31A3A80
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748879942; cv=none; b=M9tkC5zx8vZXCgKnyzSWN3m1UZ3m2G2yI5nA3sGpCsBkQk9rdewHAUj9reIt4d7raYsKgJ4jwd1mKd6Klq6UWfMzZLaNHAQH18YSN6B1kXPPtGqz89SmwgidCTRXLA1OfAmWR895M5jurz4OUWW2wHitrEnTNZjZXIhOLizE5M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748879942; c=relaxed/simple;
	bh=yfU7vGpDryfoSujqGsXll5dEfH872fdchiUhHqRymJc=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=gdfJ39YMOxEwWY8pnZln9Ua5XiXx8feN6VuGAnuV4IRgtbTqsXjXu8KXYqy4pV30hFoGDjzMcx8AnDLJNNp1JNr1TBoB801WnL5QNBkTvvhgqsKFRcabRHi14uLjO3/wSBjW6SmaBYR5GBc4/16jh7951Dyd3Upj1T3XE8MI2sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com; spf=pass smtp.mailfrom=partner.samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YKDCMUby; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YKDCMUby"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250602155856euoutp01f447343f328b03f0d906aa9b1e24148d~FRQlhkjlA2303723037euoutp01S
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:58:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250602155856euoutp01f447343f328b03f0d906aa9b1e24148d~FRQlhkjlA2303723037euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748879936;
	bh=yfU7vGpDryfoSujqGsXll5dEfH872fdchiUhHqRymJc=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=YKDCMUbypp2F5yfn6IoW0UirDq9xfRTlZ9LrEVb3I2eSUgpafpkSsGVZvbh+I4bV3
	 /WFlEQamQhTZIVIQy2A4WyLDsdTLiYWHnFBuD0ptoSX3fffIjqlVpDb8Vl3gh+M06r
	 b0eZv3QBlBoYylvTQsyyJcVku6MibnMxmTNBOGvM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: RE: Re: Re: [PATCH bpf v2] xsk: Fix out of order segment free in
 __xsk_generic_xmit()
Reply-To: e.kubanski@partner.samsung.com
Sender: Eryk Kubanski <e.kubanski@partner.samsung.com>
From: Eryk Kubanski <e.kubanski@partner.samsung.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bjorn@kernel.org" <bjorn@kernel.org>, "magnus.karlsson@intel.com"
	<magnus.karlsson@intel.com>, "maciej.fijalkowski@intel.com"
	<maciej.fijalkowski@intel.com>, "jonathan.lemon@gmail.com"
	<jonathan.lemon@gmail.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <aD3DM4elo_Xt82LE@mini-arch>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20250602155856eucms1p3af8567bd024a17e200ef28a6b492fff2@eucms1p3>
Date: Mon, 02 Jun 2025 17:58:56 +0200
X-CMS-MailID: 20250602155856eucms1p3af8567bd024a17e200ef28a6b492fff2
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250530103506eucas1p1e4091678f4157b928ddfa6f6534a0009
X-EPHeader: Mail
X-ConfirmMail: N,general
X-CMS-RootMailID: 20250530103506eucas1p1e4091678f4157b928ddfa6f6534a0009
References: <aD3DM4elo_Xt82LE@mini-arch> <aDnX3FVPZ3AIZDGg@mini-arch>
	<20250530103456.53564-1-e.kubanski@partner.samsung.com>
	<20250602092754eucms1p1b99e467d1483531491c5b43b23495e14@eucms1p1>
	<CGME20250530103506eucas1p1e4091678f4157b928ddfa6f6534a0009@eucms1p3>

> XSK represents a single queue and each queue is single producer single
> consumer. The fact that you can dup a socket and call sendmsg from
> different threads/processes does not lift that restriction. I think
> if you add synchronization on the userspace (lock(); sendmsg();
> unlock();), that should help, right?

It's not dup() of fd, It's perfectly legal AF_XDP setup.

You can share single device queue between multiple AF_XDP sockets.
Then RX and TX queue are per socket, while FILL / COMP are per
queue id of device. Access to FILL and COMP must be synchronized
on both user-space and kernel-space side.

https://docs.kernel.org/networking/af_xdp.html

> XDP_SHARED_UMEM bind flag
> This flag enables you to bind multiple sockets to the same UMEM.
> It works on the same queue id, between queue ids and between netdevs/devices.
> In this mode, each socket has their own RX and TX rings as usual, but you are going
> to have one or more FILL and COMPLETION ring pairs. You have to create one of these
> pairs per unique netdev and queue id tuple that you bind to.

Im not using sendmsg on dupped socket descriptor. It's just
another socket bound to the same netdev, queue id pair.

Even if that was the case, calling sendmsg on multiple
threads should be perfectly legal in this situation.
But i don't do that, each socket is handled exclusively
by single thread.

This is simply one of available AF_XDP deployments.
It should just work.
I don't need to introduce any locking scheme on my own
except FILL/COMP queue locking, which I did.

Definetly holding single netdevice-wide lock for any
RX/TX operation isn't an option. It should just work.

This problem is definetly in kernel. Provided explanation
clearly proves It. It's caught red handed. Please analyze
the code and see it for yourself.
