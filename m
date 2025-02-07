Received: from pv50p00im-zteg10021401.me.com (pv50p00im-zteg10021401.me.com [17.58.6.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CC5238D24
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939897; cv=none; b=F9+jAvOU0py7uPxMBphDqqXyeimZ3qTmfwic9uvG0694vasxTCocVtubH7WLleD+hflA29cqQT6WN0DM71xq9P+KcHVrYjrRr5ZZBoLxoa4iLW4zJRIU4niPTVikwomPbwGPLxZfWCwORAzU2vYUCKkRc7JMpKRsCSrqncVnA7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939897; c=relaxed/simple;
	bh=QPTMGiauE0vFz3+ClYpVOEZsW0MdO4K8SJKrJbVAgxg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=dcFqDlukWMAvANqfQlUm1Yk3LJQF+zwnriH+nOB3GqlOZ7kHL0dZ1scYiwHUi0y7NGFSb+54T2p1YKiyXmI77EdhMvslbuuNWVohHMfjlwTb0lUqv64Xj3vSvZxSAlR3Q1xoKBsoAj9GIDwEM9x1AYz1FAmzz6Yk0oZXHeXGQY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=Sery+jB1; arc=none smtp.client-ip=17.58.6.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="Sery+jB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=QPTMGiauE0vFz3+ClYpVOEZsW0MdO4K8SJKrJbVAgxg=;
	h=Message-ID:Date:MIME-Version:To:Subject:From:Content-Type:x-icloud-hme;
	b=Sery+jB1tpKn6/p0v5kGsHKtvNUJml2Z+cQc+O394YmX3/fDMheiCuZePhU8tVZ2u
	 fFF2grS9Xr9plI7EvX8QXWNuFWgwCeArXVu3O0T0FD3LPJexcAohJryFnsXWQhukRU
	 dnsXo/zMAmeXdIni5EULO5WxonTDsD1URD2LDfdVH1QDmaOAnublx+bpzx2Lc18h3n
	 jNt8AFnrVeUcTD91BvO5ahTb4NTTaKDHppi4NexMR9XlsYmM9pfzN+k3kPgLUdwpM1
	 OKKALgs9W06Erj0Jn3Ai5Et0tA+5ObzK3kYB5U2JL1XmKtyZDZAQFGBYfRUz8FsH+H
	 RppbBGh04ldoA==
Received: from [192.168.50.105] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10021401.me.com (Postfix) with ESMTPSA id EF22E8E0475;
	Fri,  7 Feb 2025 14:51:30 +0000 (UTC)
Message-ID: <ba6efae4-77d9-46aa-8f64-f8ffa119505f@icloud.com>
Date: Fri, 7 Feb 2025 07:51:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: marcan@marcan.st
Cc: arnd@arndb.de, asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 olof@lixom.net, soc@lists.linux.dev, torvalds@linux-foundation.org
References: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
Subject: Re: [PATCH] MAINTAINERS: Remove myself
From: Evelyn Harthbrooke <evieluvsrainbows@icloud.com>
Content-Language: en-US
In-Reply-To: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2L1ymKElDkzzHQfI_irsKi6LBV4PZzzI
X-Proofpoint-ORIG-GUID: 2L1ymKElDkzzHQfI_irsKi6LBV4PZzzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_07,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=874 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502070113

On Thu, Feb 6, 2025 at 1:31 PM Hector Martin <marcan@marcan.st> wrote:
>
> I no longer have any faith left in the kernel development process or
> community management approach.
>
> Apple/ARM platform development will continue downstream. If I feel like
> sending some patches upstream in the future myself for whatever subtree
> I may, or I may not. Anyone who feels like fighting the upstreaming
> fight themselves is welcome to do so.
>

This is disappointing to see; Apple/ARM support was progressing incredibly well and it's sad to see you resign as one of the subsystems' core maintainers. But based on what happened in the Rust/DMA thread, it was only a matter of time.

There are admittedly quite a few issues with the way the kernel development process works as well as how the community is managed, and I hope that it will improve with time. Hopefully your efforts will indeed continue downstream, and people will put in the effort to upstream your work with you having resigned.

I also hope that you may decide to come back in the future, if things do indeed improve.

Evelyn
