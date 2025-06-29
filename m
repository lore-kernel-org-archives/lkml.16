Received: from r3-25.sinamail.sina.com.cn (r3-25.sinamail.sina.com.cn [202.108.3.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C792576
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 05:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751173226; cv=none; b=h2goHM5Yrel5bfCT52YO+zfQTjDub0wmb43P1aSYA6H3C9t2CmsnEsPveSrAghbh3512VRlWjgF6JHnfa8MeeSrPYowoeFYxLtXVDupIepyPl4oAqnsyTVxPj4oRCcCFPvzLMsP+wfxAbyrmP8a6sodbGiKcqdHszv59qdGxCII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751173226; c=relaxed/simple;
	bh=qkwMuaqVBL2k6C0jeCODPJSsGpyoiid8WNP1j/AHeI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SMAjRLQxyMdsUPGqUFRj5Z2V0AwLloghpnYrK1frrK6jjbrWnQcUY87aAKoBgratsEjUlrQRcKVRwmr0j3E0kIHuZWukmPJ1jTATeYny3Gh8fi674dxxYYDg3q+zKt/h9xAnhcCg/AGm05Xpl39QG086lH8XTd5CZBps8otjfdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=Jho/Tqje; arc=none smtp.client-ip=202.108.3.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="Jho/Tqje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751173222;
	bh=KYbr+wBrxlVtcJtvqlHFwwPBR9aRJTLXA19HU8OB1sA=;
	h=From:Subject:Date:Message-ID;
	b=Jho/TqjeMZmDZgg9qMEuryBtxmpaYZwEm8yqkwXtmz9ftqbzzy74ugadHqhOC/902
	 FZsJf4JU5epRqnI7MrSs7pec/0jw9yxoTk2vvkGvW8b97JKj6cAXpYCLm5ohOZDDyi
	 aMO/4OBoPeWmKFm+TscCPeHvu4h/EwGl8ty1PUPM=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.31) with ESMTP
	id 6860C85B00004C2C; Sun, 29 Jun 2025 13:00:13 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2028786816218
X-SMAIL-UIID: B963A4260FE641049E0EC157C63A5D62-20250629-130013-1
From: Hillf Danton <hdanton@sina.com>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Edward Adam Davis <eadavis@qq.com>,
	syzbot+fa90fcaa28f5cd4b1fc1@syzkaller.appspotmail.com,
	clm@fb.com,
	josef@toxicpanda.com,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH next] btrfs: fix deadlock in btrfs_read_chunk_tree
Date: Sun, 29 Jun 2025 12:59:57 +0800
Message-ID: <20250629050000.2069-1-hdanton@sina.com>
In-Reply-To: <9e589f47-3fa2-4479-b809-5c1b91e7356f@gmx.com>
References: <685aa401.050a0220.2303ee.0009.GAE@google.com> <tencent_C857B761776286CB137A836B096C03A34405@qq.com> <20250624235635.1661-1-hdanton@sina.com> <20250625124052.1778-1-hdanton@sina.com> <20250625234420.1798-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 29 Jun 2025 13:57:43 +0930 Qu Wenruo wrote:
> 在 2025/6/26 09:14, Hillf Danton 写道:
> > Fine, feel free to show us the Tested-by syzbot gave you.
> > 
> Here you go:
> 
> https://lore.kernel.org/linux-btrfs/685d3d4c.050a0220.2303ee.01ca.GAE@google.com/
> 
> That's based on a branch with extra patches though.
> 
Thanks, feel free to spin with the Tested-by tag added.
