Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7302EF657
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170461; cv=none; b=JV1+3GGz3fKqwVfgjQOUCiBIoH6JkD7qQlUqdvtafl1OfIiy3+omkVovTQGki2SvM2AzhTUnpxEvzUYDcD1TDWLyYEL25s6qcdyshFhnPeWoEgE9ZxZ06xXJmLD77LHjrmNHIJpnNKxsHLrKsJdDYmhYlVhD/F7jF2nPkKGM3pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170461; c=relaxed/simple;
	bh=N8fEm5HS5QpLUalmLcQNuCbvF+CKIa+uQ/Vh/lJGIfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jKXAYOd+xIwfAGBBYffuZIVQmeVn27OI8d+gY9sZoAtJ+Aakavd4rHRO4Oc1+bPEXQrr4ZDU9mK5mw0hswyQOoEziz3yxedyvgtECtWmdzCtZZ6DZAfkS/sKeXdjnkOBEGW2sOGjctLCj00ghjHJvIIXXZhN4Hn6UCmeWKXzeXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RzP6TSUF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RzP6TSUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750170458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sQRyc9c/SXGmAf0mDigTSfEzRX9GJoQQPVqohr3MaBQ=;
	b=RzP6TSUF46FWCa39PSChrbw/q2XXRvX80VykMlVZCnmB8r3kJplUY5T9OqEvGFeZEZs5jO
	TA/m13z/NuBg/pbjsMvLhOvDHCyAanZ2Lp1WqVb4V4OsRm42pJAIfnTEtK/wb9S0lutb7B
	m8zAYm34yal2Jacz+HA2OG+QXT3BdVE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-oqzOPfijOPSJZ1wambdAVw-1; Tue,
 17 Jun 2025 10:27:33 -0400
X-MC-Unique: oqzOPfijOPSJZ1wambdAVw-1
X-Mimecast-MFC-AGG-ID: oqzOPfijOPSJZ1wambdAVw_1750170451
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6F9031800281;
	Tue, 17 Jun 2025 14:27:31 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.80.174])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7DB7519560A3;
	Tue, 17 Jun 2025 14:27:28 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: david@redhat.com,
	willy@infradead.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lcapitulino@gmail.com,
	shivankg@amd.com
Subject: [RFC 0/3] mm: introduce snapshot_page()
Date: Tue, 17 Jun 2025 10:27:07 -0400
Message-ID: <cover.1750170418.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi,

This series introduces snapshot_page(), a helper function that can be used
to create a snapshot of a struct page and its associated struct folio.

This function is intended to help callers with a consistent view of a
a folio while reducing the chance of encountering partially updated or
inconsistent state, such as during folio splitting which could lead to
crashes and BUG_ON()s being triggered.

This series is on top of latest Linus tree (9afe652958c3).

Luiz Capitulino (3):
  mm: introduce snapshot_page()
  proc: kpagecount: use snapshot_page()
  fs: stable_page_flags(): use snapshot_page()

 fs/proc/page.c     | 46 ++++++++++++++++++++----------
 include/linux/mm.h | 20 +++++++++++++
 mm/debug.c         | 42 +++------------------------
 mm/util.c          | 71 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 126 insertions(+), 53 deletions(-)

-- 
2.49.0

