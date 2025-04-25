Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F751E32D9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607274; cv=none; b=MZEtRJ3valskNnlYccCJ86ZoYeRImk7cCcXbrNOJQTUzGs7zAiWRp0I/V4VRfjp2GbdKQB7HOnnZ2ovp2KOiHW+Xbf8P+mJy1Rk1CPuhnbEUBsxGCxQ2fEpwKadmHaYsdK8ZOyZJ5hE5CHYvyVKzhC7ALAD1jWwuF/VmrO/6wo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607274; c=relaxed/simple;
	bh=bDb2n67Du5oyvdLKSIcrtqG0PM3Rx/BDTiM5oB3ZCTM=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=LaXHBtz4gH1QyldHuDMt3fMjQ+uhlpKfwRL/YyBKOrvUtbxQRv4X4KcWOdgN1Xb2XjSn/rxcN8v0KG80f4SmNm7z2SeJHNjk2thBXTytGjoOFoJTHHbca9fPSxq7ZsE3c6Lg81gXwLCF4KzcghX4g7gq3bzLynXgBER7Q+1MjD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C6voWT3M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C6voWT3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745607271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDb2n67Du5oyvdLKSIcrtqG0PM3Rx/BDTiM5oB3ZCTM=;
	b=C6voWT3MaP5Tf0VDYmnvJk5rAf63MDKPveiYsGmcK8eFHGKGKN/UF9zmOwqRVmX90UbL+e
	iXaZADu6cW/D5oU6SZZWm3WnkVAb0M308g8W1EFYOrsdv9ENmmeQMmk2nNk2nAqf1JgNnY
	7uiNwS0Y1aubSvaEhlHkpjJ84PreleU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-418-8aWcnWyzPlKuudEzh5ay2g-1; Fri,
 25 Apr 2025 14:54:27 -0400
X-MC-Unique: 8aWcnWyzPlKuudEzh5ay2g-1
X-Mimecast-MFC-AGG-ID: 8aWcnWyzPlKuudEzh5ay2g_1745607265
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A2BE019560AE;
	Fri, 25 Apr 2025 18:54:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.16])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0648930001A2;
	Fri, 25 Apr 2025 18:54:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <6800c75f.050a0220.5cdb3.0010.GAE@google.com>
References: <6800c75f.050a0220.5cdb3.0010.GAE@google.com>
To: syzbot <syzbot+844241a52d3e9dccc8d1@syzkaller.appspotmail.com>
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
    linux-kernel@vger.kernel.org, marc.dionne@auristor.com,
    syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid context in lock_mm_and_find_vma
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3629778.1745607261.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Apr 2025 19:54:21 +0100
Message-ID: <3629779.1745607261@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t a64e4d48a0b77e4ada19ac26ca3a08cd492f6362

