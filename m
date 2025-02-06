Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6551EDA12
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738855402; cv=none; b=Lxq3OT//wT50Jj+3pQXxxJcz4cLQMqaqB0IWY/DZqr7b3CvmoByuRqZCDFK355GqgZoPzpRQzcGgotOz/ac4vFzn2Q7Vfq3dWyxjWQSIGuliUyQzkR5rnRYQbHO6nq3/9aWZqFDfj1s3SlP3IaGEdJftzL3NR3/myxnzOn5Sapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738855402; c=relaxed/simple;
	bh=49CxXWqNMJo3LLTz5/6MYzTh9c+8a/TlbxFx7hF9vms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nidOTukyak8YzqICH4DnjJNjsTotrXO5t4eWzW74097Y8dzGwUiT4sSzNPvKOHfXFUVDEZrURsH/8leK8f3eQhvY4FdLe62wFbgyY+uMnIV0YZqMJ3mdn982y0/LDWrgfMotxxjDCIJjNDKq8KT34lWXR2SqSsEYlZnrnzO7VOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UHIfKXH7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UHIfKXH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738855400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=sXb2TzZ4qNkvPYjvI+q6HbdB0AiVpUWbLTX92W4CirE=;
	b=UHIfKXH7V9OCIwkAxxSb9Tl+9S4XR35po6WvO1NC/5/8uNsBbiHskOxako0F6eBy0h8g5c
	AmrFXC2LRDbcJYXcBHcLP0WyUIMT4rJyuI0GQGMTfjrZUrq/6CS24OIGboyvOzSw8TLJa9
	rYbsIln2Mzq/eCvIvNkv/OZWZ6QzNbc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-73-drc8I9dbPbqRzl9VgOK5pw-1; Thu,
 06 Feb 2025 10:23:16 -0500
X-MC-Unique: drc8I9dbPbqRzl9VgOK5pw-1
X-Mimecast-MFC-AGG-ID: drc8I9dbPbqRzl9VgOK5pw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE07E1800991;
	Thu,  6 Feb 2025 15:23:14 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.34.53])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 0A16B1955BCB;
	Thu,  6 Feb 2025 15:23:11 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  6 Feb 2025 16:22:48 +0100 (CET)
Date: Thu, 6 Feb 2025 16:22:44 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] exit: change the release_task() paths to call
 flush_sigqueue() lockless
Message-ID: <20250206152244.GA14609@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Changes:

	- add a comment to explain why the lockless flush_sigqueue() is safe

	- make a separate 2/2 oneliner for TIF_SIGPENDING removal

Link to v1: https://lore.kernel.org/all/20250205175136.GA8702@redhat.com/

Oleg.

