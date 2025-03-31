Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BC21531DB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743419250; cv=none; b=SjtMk5i5SWSdp3OaUffI6Et89i7j2tlVeuujZDQX4WVis0akq4JflGoMt79XkkpV6VGpmxXev9jrWJnDqaxoyiYZsyupJGkJlYCLB2nOXD4wuqvyKKGMPmBND48Zh1DpWKY8ywPUGC3iEORMziuO4jyosx8H2W7KrobPQyrFpwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743419250; c=relaxed/simple;
	bh=5nUQOqXnNbAY01Qsh80HSPwqDkJ9sAaeGhdDdlSe+YQ=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=kz36rKdxZzmsY5DQQ+r6PMnuRWEtjzPA1fGEiSA7UssyVhA/bM3GLOU8U+TJ1Zb5k8NdsPMdCLBF6XN77bFP25lIbIEvTpRT/yRQmg9Y17olHLGPFJ8im3W08cL/mEC6BhezHrWTqUM3Oq/4jMno7IImT4+o9YcQmFrrQH4YUCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KtrjAeHY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KtrjAeHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743419248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5nUQOqXnNbAY01Qsh80HSPwqDkJ9sAaeGhdDdlSe+YQ=;
	b=KtrjAeHYUIVns7GaoJQJMYHUXiIX3u7drzpT1n9uZ0AL7u2n3FTlPm0nXGQZoxXulCmP05
	3/ekhjR9ELPtTTferY40zfrkTyMnWla7yJGgODAeuazLHMAehwIHbHrIPUiOVmWg2fgGPY
	P4WzxZbcnH0IKmMkrFPxXnTufj3YwZQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-wWV-G8rSO2OuESFQT2wetw-1; Mon,
 31 Mar 2025 07:07:22 -0400
X-MC-Unique: wWV-G8rSO2OuESFQT2wetw-1
X-Mimecast-MFC-AGG-ID: wWV-G8rSO2OuESFQT2wetw_1743419241
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BEA3C180AF49;
	Mon, 31 Mar 2025 11:07:19 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.40])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 76272180175A;
	Mon, 31 Mar 2025 11:07:17 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <67ea546d.050a0220.1547ec.0124.GAE@google.com>
References: <67ea546d.050a0220.1547ec.0124.GAE@google.com>
To: syzbot <syzbot+54e6c2176ba76c56217e@syzkaller.appspotmail.com>
Cc: dhowells@redhat.com, almaz.alexandrovich@paragon-software.com,
    linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
    marc.dionne@auristor.com, ntfs3@lists.linux.dev,
    syzkaller-bugs@googlegroups.com
Subject: Is "unregister_netdevice: waiting for batadv0 to become free" fixed somewhere else?
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <255828.1743419236.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Mar 2025 12:07:16 +0100
Message-ID: <255830.1743419236@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

syzbot <syzbot+54e6c2176ba76c56217e@syzkaller.appspotmail.com> wrote:

> syzbot has tested the proposed patch but the reproducer is still trigger=
ing an issue:
> unregister_netdevice: waiting for DEV to become free
> =

> unregister_netdevice: waiting for batadv0 to become free. Usage count =3D=
 3

