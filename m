Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF5B1DF242
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 17:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777938; cv=none; b=pCd5sNcmk/52XKwT1PAgyh0Hp8Y1qVZztvz/Kkn3dlKBju3t306ZNvif8S71R0sMa7rylkXgyn0v5I2bKFLd8zhZDM+YA98Qu9seAkgw52oLFR6a8VeSkvgmoWDzIw60/Fbe6NdcaoWp5NGxBGAiCE24WGgVuFZP/XVC+w44jdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777938; c=relaxed/simple;
	bh=fOilbuF2J5jDjnGn9d2WMIhOCkhgB0Liy3Xkdwd0J/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VixRRoooQ7sFy5rzJBBXUIvAQzxIpIoeNZiPJJtCmy2RRkRiHOPAuSvocOZCduACmaNFg5y4F6LO9IL3HNCsNZXX4+RzjJs/RK1FLQP8ph0Rm+m1iO9Ooxh4SCPHTAjdu98Bpn/9imBd5qPnpspa4u7F27j6OWjwfpvIZWFr+AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VF6B/fmm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VF6B/fmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738777934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=aEL1g1OH5K5DLZpkqDScEk4+hZ4FEX5UWoztFg69bIo=;
	b=VF6B/fmmnYS8DnLQx2caa8w4EBBCNcMJayiIL2hr7lsZL+qc9DJh2+UAArVWnmIFsX7xeg
	y9IAxsdYZEyBAJLnWlrwn0eMG5gZYgXMAzwp0qr65r6yf09bohC3JkPsClieU5lJHDqqgM
	7Xe4qadlabXYNaxKzl7ZzFZ/RYqYdNQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-2ZNi-kShMGSb7sGov9XScg-1; Wed,
 05 Feb 2025 12:52:09 -0500
X-MC-Unique: 2ZNi-kShMGSb7sGov9XScg-1
X-Mimecast-MFC-AGG-ID: 2ZNi-kShMGSb7sGov9XScg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 87067180098B;
	Wed,  5 Feb 2025 17:52:07 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.10])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id B640419560AE;
	Wed,  5 Feb 2025 17:52:04 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  5 Feb 2025 18:51:40 +0100 (CET)
Date: Wed, 5 Feb 2025 18:51:36 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] exit: change the release_task() paths to call
 flush_sigqueue() lockless
Message-ID: <20250205175136.GA8702@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Thomas, Frederic, could you review?

Untested, and I'll recheck this patch tomorrow, perhaps I missed something...

Mateusz, this patch has minor conflicts with your

	[PATCH v3 0/6] reduce tasklist_lock hold time on exit and do some

WIP changes. I can wait for v4 from you and rebase on top, but I'd like
to show this patch right now to simplify the review.

Oleg.

