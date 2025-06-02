Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8889622A7EA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873786; cv=none; b=iiM2O1P+apZ2bdqty982mboVTUL8OCZMkumPCejr+HR8AQYnoa40nrG+3dTGiI5aKMlP0AaM9yz3jSNZDc5uftIDSsPPZ8vkRjbPQwYZZshmNsSLiuw2PglC1ZLHLDZFsmGMfr95krXkFelKu8zocF4PGXIhHo2Op58MH1yw/N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873786; c=relaxed/simple;
	bh=PXQstq7TOI41h/yOclLwEDlULdPLpcbGn2JYw4wLCy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pAUWXjyhkWFBQ8QNRhrwbU5OIa3DIwDIIuBHfB2g9//t7t9o7kTst/TJ13dD/JYG4C6eUljlkdQhd+Liup9O5dqKwgMHgJraSQs4bdzI8YWsItxw5dW+YheGINCiF+R0OEFRx0QSWxSC3mIusHcHZRdvL7uP4v8ocKsc3y6IV14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Oa/iWQ7N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8+YCk0Ys; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Oa/iWQ7N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8+YCk0Ys; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Oa/iWQ7N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8+YCk0Ys";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Oa/iWQ7N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8+YCk0Ys"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AFD5B1F796;
	Mon,  2 Jun 2025 14:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748873782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LoFPgLgf2vNjDyn+wUEXD6fP0MAyNKRJ8yIGa5CR5GE=;
	b=Oa/iWQ7NN5pX2YIB6DDTvvS1G9t6AWS4miwwH3bKwl+cxWIdQo40ySphO9QhS8m8Si7V4p
	E1VJ/r1PUQqtt2jtVwuTBtayDPOaEQOPtiCUk7GD9po6Tmxo61f57U4MIea2OiTdRABzuZ
	Ex5oO7RyxS92IsjYv8bEHVacejOI24s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748873782;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LoFPgLgf2vNjDyn+wUEXD6fP0MAyNKRJ8yIGa5CR5GE=;
	b=8+YCk0YsFBPvK2Dtxz9+gZP0yMVx/o8Lw4LvQCyzqP7wyKckqc0IDAjfBE+FBorwOZAR3m
	OTOu0NNb4NOX6MBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748873782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LoFPgLgf2vNjDyn+wUEXD6fP0MAyNKRJ8yIGa5CR5GE=;
	b=Oa/iWQ7NN5pX2YIB6DDTvvS1G9t6AWS4miwwH3bKwl+cxWIdQo40ySphO9QhS8m8Si7V4p
	E1VJ/r1PUQqtt2jtVwuTBtayDPOaEQOPtiCUk7GD9po6Tmxo61f57U4MIea2OiTdRABzuZ
	Ex5oO7RyxS92IsjYv8bEHVacejOI24s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748873782;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LoFPgLgf2vNjDyn+wUEXD6fP0MAyNKRJ8yIGa5CR5GE=;
	b=8+YCk0YsFBPvK2Dtxz9+gZP0yMVx/o8Lw4LvQCyzqP7wyKckqc0IDAjfBE+FBorwOZAR3m
	OTOu0NNb4NOX6MBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A2AB13AE1;
	Mon,  2 Jun 2025 14:16:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KHFcBzayPWhqVAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 02 Jun 2025 14:16:22 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [RFC PATCH 0/3] Clean up locking in hugetlb faulting code
Date: Mon,  2 Jun 2025 16:16:07 +0200
Message-ID: <20250602141610.173698-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

Hi all,

This RFC is the culmination of the discussion that happened in [1].
TLDR: No one really knew what the locks were protecting us against, and
whether we needed them at all.

Some reasearch showed that most of them were introduced in a time were
truncation was not serialized with the mutex, as it is today, so we were
relying on the lock for the page to not go away from the pagecache.
More details can be find in patch#1.

This is for the locks, but I also started to look at the references
we take in hugetlb_fault and hugetlb_wp as it seems to me we are taking
more than actually needed, but that is once we manage to sort this out.

I ran hugetlb LTP tests and nothing screamed, and I also plan to run selftests
later on.

@Galvin. Could you please run your syzkaller with this patchset applied and
see whether you can trigger something?

Special thanks to David and Peter Xu that were helping out with this mess.

[1] https://lore.kernel.org/linux-mm/aDeBUXCRLRZobHq0@localhost.localdomain/T/#md02880ebc2c679678b7f326c5e9e93992428e124

Oscar Salvador (3):
  mm, hugetlb: Clean up locking in hugetlb_fault and hugetlb_wp
  mm, hugetlb: Update comments in hugetlb_fault
  mm, hugetlb: Drop unlikelys from hugetlb_fault

 include/linux/hugetlb.h |  12 +++++
 mm/hugetlb.c            | 117 +++++++++++++++++-----------------------
 2 files changed, 62 insertions(+), 67 deletions(-)

-- 
2.49.0

