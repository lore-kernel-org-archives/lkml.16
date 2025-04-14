Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019652BF3EC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635973; cv=none; b=Yk40OcCNeKyAwIeTYIkSyGIGxBFFTwGP8vnGNS4ZuqIDtyoZ09xeLWedAnmTHhyyXWmasdHMaYq+I4WRYcf1CkPf3HiBzO5VyqnOMo7X6hjPU7c/0waNITvyaYmsTbRvs+SUohfdxRHOioE8BUl64jy/wwRLRzjQoau0KcjeFXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635973; c=relaxed/simple;
	bh=6tf/jSWHz19L/C8D49bawo5v3rvQSqpDocADchgDsyc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jEn2fyqp1LycGzDCSTxETck8oCRaiGylZyuelby5Vht0hSLdiuovSYtl6kzhNcK9ViOc7a56pTtpJnvWbpRu7lgbDF0OdlKuXdJGirr/qyY8mRa3q+z59Xumm3OplOAUrBRl7j4o6nDV6a/h4NNizcVdZHQBo0THkaN82QbbSVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gUNPEEsM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gUNPEEsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744635969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zyFdzMaVu1FYPfKfviV49GtSsjBO3bMK/KvNm/cAL3c=;
	b=gUNPEEsMbeFRT7h38//siS+nYp/lJ0Z7mwLgv7VAiPFn/MayxXwY6AswBZ1N24ggpLIcua
	G7Sfb5zkKcuyFFt/eju6DAeO9GD8dlHC9XKUmrOIXhk0CkWBp0JaavGUPILHgHuaTKaxeW
	X+QMcbZUXuuyX8FH47gUDiEav0dMxYQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-597-0eOnn8zCNx6usPLL_dlPRw-1; Mon,
 14 Apr 2025 09:06:03 -0400
X-MC-Unique: 0eOnn8zCNx6usPLL_dlPRw-1
X-Mimecast-MFC-AGG-ID: 0eOnn8zCNx6usPLL_dlPRw_1744635961
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C2161956050;
	Mon, 14 Apr 2025 13:06:01 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.64.251])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 558351955BC1;
	Mon, 14 Apr 2025 13:05:59 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,
  dev@openvswitch.org,  linux-kernel@vger.kernel.org,  Eelco Chaudron
 <echaudro@redhat.com>,
  syzbot+b07a9da40df1576b8048@syzkaller.appspotmail.com
Subject: Re: [PATCH net] net: openvswitch: fix nested key length validation
 in the set() action
In-Reply-To: <20250412104052.2073688-1-i.maximets@ovn.org> (Ilya Maximets's
	message of "Sat, 12 Apr 2025 12:40:18 +0200")
References: <20250412104052.2073688-1-i.maximets@ovn.org>
Date: Mon, 14 Apr 2025 09:05:57 -0400
Message-ID: <f7tzfgigafe.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Ilya Maximets <i.maximets@ovn.org> writes:

> It's not safe to access nla_len(ovs_key) if the data is smaller than
> the netlink header.  Check that the attribute is OK first.
>
> Fixes: ccb1352e76cf ("net: Add Open vSwitch kernel components.")
> Reported-by: syzbot+b07a9da40df1576b8048@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b07a9da40df1576b8048
> Tested-by: syzbot+b07a9da40df1576b8048@syzkaller.appspotmail.com
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> ---

Acked-by: Aaron Conole <aconole@redhat.com>

