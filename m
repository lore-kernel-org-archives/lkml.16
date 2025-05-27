Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585CA27A900
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748362359; cv=none; b=urGxfEkjCxi0ZEkQiO4pHaBeeulaVDh+QbNs6cJM4w1+HDQ0L1WKG/Vth7lrMTH+WA5drsARiJ993B2saX/jlpIzme2eegbhIWXj7BJyx0LphSY5NoQ5QQbKWyIWPrBmUKp8TfRLyr25+uEm3e+ypDMiCSMzY/cs9CN3CItuLPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748362359; c=relaxed/simple;
	bh=BEBcxwFtvoqv6iWW55Ogx6WZq6YFJFI6VteLEwocOHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fU+C9H4i8Kl/5Tcw9T1zxVhZ1AXL/tWdjOzLPw2qazSJDXfOxYD3SQPnKWyWJVavuXVUbhnU4BhgA+Sb9XypQEFu9JD5ivELGYYJc3ulS6jqk/4at5r0A+jUJqkiQAY0hC6T+WE0pWj7Xb7kiLvLNPMp47ITmNvyLNydCNNaGnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E2fRlQ8y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E2fRlQ8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748362357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=t+ngdpG/h67ssDMHIohk94AFManYGXIDp6qk/0+bt4M=;
	b=E2fRlQ8yG8RlIRfKEdkb0vFsEtlqvrkMRweAGQXJN7J/NWurM7mRur+/4mLcdOPF5gKQan
	DlCA5m5dk+uiDFkQ1llO0YGZR2aaUn/KX6x5eZ1Sc4d9R1/cYM6/OO31kFgqFqLds8VE8F
	WyekyImdSKQ8WnHH7guo06QtYzL46RA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-166-unnrHwMnO2K8nd5WqfZ-Qw-1; Tue,
 27 May 2025 12:12:33 -0400
X-MC-Unique: unnrHwMnO2K8nd5WqfZ-Qw-1
X-Mimecast-MFC-AGG-ID: unnrHwMnO2K8nd5WqfZ-Qw_1748362352
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F4C119560AA;
	Tue, 27 May 2025 16:12:32 +0000 (UTC)
Received: from redhat.com (unknown [10.22.89.242])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D5AE818001DA;
	Tue, 27 May 2025 16:12:30 +0000 (UTC)
Date: Tue, 27 May 2025 11:12:28 -0500
From: David Teigland <teigland@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, gfs2@lists.linux.dev
Subject: [GIT PULL] dlm updates for 6.16
Message-ID: <aDXkbAcJfiMTixT2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi Linus,

Please pull dlm updates from tag:

git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-6.16

This set fixes delays when shutting down SCTP connections, and updates
dlm Kconfig for SCTP.

Thanks,
Dave

Alexander Aring (4):
      dlm: mask sk_shutdown value
      dlm: use SHUT_RDWR for SCTP shutdown
      dlm: reject SCTP configuration if not enabled
      dlm: drop SCTP Kconfig dependency

 fs/dlm/Kconfig    | 1 -
 fs/dlm/config.c   | 3 +++
 fs/dlm/lowcomms.c | 7 +++++--
 3 files changed, 8 insertions(+), 3 deletions(-)

