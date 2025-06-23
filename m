Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7DC1A42C4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690818; cv=none; b=c0AR2y6QTk8clwv2hTr1lLEzsIbAlQVqowBsFdjN+iSE7fwdxlubOWs5DLPLotqZb3hG7UNZvzE0QIPonTGSUFLwHsEU2cCFg0t6xMiZK8D6UwyxZgeMXyoiN3ane4xZIBnEV06wgcjrzG3KnZJARopifdHxVQV7hpbz5zr5lFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690818; c=relaxed/simple;
	bh=b6mLJw07SveUta9rL9RSJrviZyUT2fQ1QlImKLULcBg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HzHkAP8zrZZec65tjKExSioYD/OSqhaKNGfElvBPb11SXSZUuetFobFYrp2yV2EdBwYyAwYTZs4L7u8q8mi4uMJGWMYKHaNgE8QhirKqoDS1VnsmDhwhWX/kCKz2trlCyC5N/7AXTaAMk8zaKFlT7WxT22ZnNfNLA0qJcrn+7MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=NFbxM4Mm; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=aiS8aqnd; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=NFbxM4Mm; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=aiS8aqnd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="NFbxM4Mm";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="aiS8aqnd";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="NFbxM4Mm";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="aiS8aqnd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C7E712116A;
	Mon, 23 Jun 2025 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750690807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tDAheB8HKXSBTKXzf4KhIkVIPjs5JJHYVKDov+chU7g=;
	b=NFbxM4MmfAnUG8P8y8n6s1PwrS8TThGx1CmWS1wYQyf+x6hVGI3sU9aF93VF4pPBeYGTh9
	4dLcMmH9iQhwSn43oTdKtIRTZ4eaDeBSYkPx5kjk+veQxdZ/sOOqJ7eAJxIOqlF8UvsaEs
	KNwwvRBhwMjtt83CyGtkrmz4kLvX52w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750690807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tDAheB8HKXSBTKXzf4KhIkVIPjs5JJHYVKDov+chU7g=;
	b=aiS8aqndVTp0VN0TMFSDhmvxzLhv/M4GZqXs2fxifoR0v/eVC9bhVlnfPiPlSJ9iSw6oLb
	b1zqf04Zh5jlp5AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750690807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tDAheB8HKXSBTKXzf4KhIkVIPjs5JJHYVKDov+chU7g=;
	b=NFbxM4MmfAnUG8P8y8n6s1PwrS8TThGx1CmWS1wYQyf+x6hVGI3sU9aF93VF4pPBeYGTh9
	4dLcMmH9iQhwSn43oTdKtIRTZ4eaDeBSYkPx5kjk+veQxdZ/sOOqJ7eAJxIOqlF8UvsaEs
	KNwwvRBhwMjtt83CyGtkrmz4kLvX52w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750690807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tDAheB8HKXSBTKXzf4KhIkVIPjs5JJHYVKDov+chU7g=;
	b=aiS8aqndVTp0VN0TMFSDhmvxzLhv/M4GZqXs2fxifoR0v/eVC9bhVlnfPiPlSJ9iSw6oLb
	b1zqf04Zh5jlp5AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B27DE13A27;
	Mon, 23 Jun 2025 15:00:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bK4+K/drWWi8cQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 23 Jun 2025 15:00:07 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH RFC 0/2] madvise anon_name cleanups
Date: Mon, 23 Jun 2025 16:59:49 +0200
Message-Id: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOVrWWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNj3cS8/Lz4vMTc1PjknNTEvNIC3VQLyyQzC3MDY4vUFCWgvoKi1LT
 MCrCZ0UpBbs5KsbW1AHnnaNZoAAAA
X-Change-ID: 20250623-anon_name_cleanup-e89b687038ed
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=b6mLJw07SveUta9rL9RSJrviZyUT2fQ1QlImKLULcBg=;
 b=owEBbQGS/pANAwAIAbvgsHXSRYiaAcsmYgBoWWvuzK6pYrbaSf/zdilKEC8ENpGdZ2IAkMxYw
 9xBOSRc28OJATMEAAEIAB0WIQR7u8hBFZkjSJZITfG74LB10kWImgUCaFlr7gAKCRC74LB10kWI
 mkEGB/0Uk2kzosGBMO8qEJj38dnyqb9vMfmxg1zrE/Ae2p1QZSKxtq/Az6MqA0LJYI0J4LKNJeW
 rAfAfTgjp6WimTGdBQSXoZHl3kRS5IK2lMP35rYVwFRAwUcHIUeW8kOS3IUPlUfdPRjW2mqJ18w
 Ga2MuhvtkUdK7ED6VNbT1GvcLto8CwQLMh++ZlRNRaeeIiC/1L8DMtiyzXQU3K11R5KLNzOKAcg
 yB6T/OXZEIqyRLXSdTCXY31uVxgTFCZ0iUoNtUTf/lv+BNtXFxCfKuZyaid06Kxo0OWDnKxQTXO
 yXNYb7eikTcd7+Q5BQ3KkDwtfX1bg2IlsFHAR4C1mr3J1H+U
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.cz:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

While reviewing Lorenzo's madvise cleanups I've noticed that we can
handle anon_name in madvise code much better, so sending that as patch
1. Initially I wanted to do first move the existing logic from
   madvise_vma_behavior() to madvise_update_vma() as a separate patch
before the actual simplification but that would require adding
anon_vma_name_put() in error handling paths only to be removed again, so
it's a single patch to avoid churn.

It's also an opportunity to move some mm code from prctl under mm,
hence patch 2. It's RFC to see if people agree on where patch 2 moves
things, or have better ideas.

Based on mm-new.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
Vlastimil Babka (2):
      mm, madvise: simplify anon_name handling
      mm, madvise: move prctl_set_vma() to mm/madvise.c

 include/linux/mm.h | 13 ++++----
 kernel/sys.c       | 64 ------------------------------------
 mm/madvise.c       | 96 +++++++++++++++++++++++++++++++++++++++---------------
 3 files changed, 76 insertions(+), 97 deletions(-)
---
base-commit: 4216fd45fc9156da0ee33fcb25cc0a5265049e32
change-id: 20250623-anon_name_cleanup-e89b687038ed

Best regards,
-- 
Vlastimil Babka <vbabka@suse.cz>

