Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8DA233707
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574415; cv=none; b=PF6H4hj5n8N3xlmFAtkO+PVOKOr5vOUWhwYuTuO+JagIJcBtl7YIAefydsvBAZvq0hCcEl1GZ6tIBeIz/Dn99vhGqd13YDsuMYzYn6P/bIOBbXzOI6nBVSVifduuo5YsV6vkJk4NzGj1mf7gBoHhacU8OXZ2GZPgXaDtGzTOrUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574415; c=relaxed/simple;
	bh=+v7I5BfsAnpI3Ghl6PqO0VR1yzMNwIO2yDsIR04w+N4=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=SodmwpRahazFDSNUBgnS1LEGDam03JVnH7NHC7zmQGGfN8OP6P9rK2e/m43ctg/GHPFV3SgAwvP20W5TOXlL0dGa/CiT8oMHdzOohoC5Lb1stXsi0y+wmh5V2ZPa+rLeBlnS8oK9VLCxLz0sX8WV9VTrbYHrgoHh2ifqNdFv3H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=amQTInMR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="amQTInMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745574412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sOZGGLjYzY6quFmu6RJ8chWL/8DejjBW+kNPKkZQ5w=;
	b=amQTInMRwZhrSqXret2/6uk8Srs2B7BqBwoF/hHhOcs8VgEPrzYS23I2m+rYmKegs29OQB
	e8sUdIDbIiqskZEKlnbNKSYiMBmfjTG6QKE0bWfEncgjUwhLUTGTcL+fgIu55VsQprwDC2
	9IDXlefws1BlYPOvYW0xeKOvCFGFsjY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649--7fs-_SNPk-MxCB5TQKlmQ-1; Fri,
 25 Apr 2025 05:46:48 -0400
X-MC-Unique: -7fs-_SNPk-MxCB5TQKlmQ-1
X-Mimecast-MFC-AGG-ID: -7fs-_SNPk-MxCB5TQKlmQ_1745574407
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 22B94195608C;
	Fri, 25 Apr 2025 09:46:47 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.16])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B56C318001EF;
	Fri, 25 Apr 2025 09:46:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <7b468f16-f648-4432-aa59-927d37a411a7@lunn.ch>
References: <7b468f16-f648-4432-aa59-927d37a411a7@lunn.ch> <3452224.1745518016@warthog.procyon.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Cc: dhowells@redhat.com, Jedrzej Jagielski <jedrzej.jagielski@intel.com>,
    Przemek Kitszel <przemyslaw.kitszel@intel.com>,
    Tony Nguyen <anthony.l.nguyen@intel.com>,
    Paulo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: Is it possible to undo the ixgbe device name change?
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3616571.1745574403.1@warthog.procyon.org.uk>
Date: Fri, 25 Apr 2025 10:46:43 +0100
Message-ID: <3616572.1745574403@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Andrew Lunn <andrew@lunn.ch> wrote:

> It is systemd which later renames it to enp1s0 or enp1s0np0. If you
> ask me, you are talking to the wrong people.

Aha!  It can be configured with systemd-udev.

See https://systemd.io/PREDICTABLE_INTERFACE_NAMES/

And also "man systemd.link".

# cat /etc/systemd/network/10-testnet.link
[Match]
MACAddress=00:11:22:33:44:55  <--- your MAC address here
[Link]
Description=Test Network
Name=enp1s0  <--- the name you want here


David

