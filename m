Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192821D6188
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 22:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747433382; cv=none; b=uPpT6WNMpCxLoiaUSp+GkwNNh505RQzK0Rd9B3RU612P0L36cEP6b7yAnDuZw/SoFOJCPKLGc+2mKGoe5iDHCOumz2YKjw1UIg8FlglfrtnKwjoSIXsfdYS9oC/4S35idHx3pd4aIPzSXUMzKNAoB0wTrZYlTqyhKmdyLdTvENQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747433382; c=relaxed/simple;
	bh=C80rMpYCMR3dEDKxfTnXW0DIH7sXKDDe9ncWaAsFfTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NI/vg7dwVHLoXPAtGQHoenoDAxlcG+IUmBXmaZbbQRZzlw6y9q5kmkac0UE53+1TjVB/5TjJgwOhUcAvA5fbUTIJ3vxaczo7mjNFobIwGTO2grO5E2lneclN03lxkGX5TRSpmT4UU11eWSwpYY7NtMahu5vbx6n8xkmgl4OJE3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HImf2Dvb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iZqFh9WJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HImf2Dvb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iZqFh9WJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HImf2Dvb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iZqFh9WJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HImf2Dvb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iZqFh9WJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 28D6821CC0;
	Fri, 16 May 2025 22:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747433379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VZzMbaqU9Ua8NoP9ZEp7v7UPfXh1SR33dVEDLjbZi7k=;
	b=HImf2DvbJtqJIVUe+mrKYQXvmqHFlicKWF4wv/h2wSc2a8LJejSPdQuJ4qQrk/uqPlNuaE
	ddXwOEUV4OKr3TGBrs62SwAffrfCn5MZ3tpsq2IvZ9LlfQU5l+ZyQST3QtGpPXaxr3lbxr
	CPDwq5w8QdHqtVxKs5mGHAaS/Gc3WxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747433379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VZzMbaqU9Ua8NoP9ZEp7v7UPfXh1SR33dVEDLjbZi7k=;
	b=iZqFh9WJdpqiLjjaUEr9KKIcHVwKNLpznZIwc1Sv97PFebmP6ns4d37FxEwICTsy3Vwmjz
	liCLY6nSARyabiDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747433379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VZzMbaqU9Ua8NoP9ZEp7v7UPfXh1SR33dVEDLjbZi7k=;
	b=HImf2DvbJtqJIVUe+mrKYQXvmqHFlicKWF4wv/h2wSc2a8LJejSPdQuJ4qQrk/uqPlNuaE
	ddXwOEUV4OKr3TGBrs62SwAffrfCn5MZ3tpsq2IvZ9LlfQU5l+ZyQST3QtGpPXaxr3lbxr
	CPDwq5w8QdHqtVxKs5mGHAaS/Gc3WxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747433379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VZzMbaqU9Ua8NoP9ZEp7v7UPfXh1SR33dVEDLjbZi7k=;
	b=iZqFh9WJdpqiLjjaUEr9KKIcHVwKNLpznZIwc1Sv97PFebmP6ns4d37FxEwICTsy3Vwmjz
	liCLY6nSARyabiDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A012C13411;
	Fri, 16 May 2025 22:09:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lOGWGaK3J2hhGwAAD6G6ig
	(envelope-from <ematsumiya@suse.de>); Fri, 16 May 2025 22:09:38 +0000
From: Enzo Matsumiya <ematsumiya@suse.de>
To: netdev@vger.kernel.org
Cc: Enzo Matsumiya <ematsumiya@suse.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] net: socket: centralize netns refcounting
Date: Fri, 16 May 2025 19:09:18 -0300
Message-ID: <20250516220920.1142578-1-ematsumiya@suse.de>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.20
X-Spamd-Result: default: False [0.20 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[10];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Hi,

I came up with this patch to centralize netns refcounting on kernel sockets,
because `sk_net_refcnt = !kern' is not enough anymore.

The idea is simply to remove the responsibility of a module outside of net/
to have to deal with sockets internals (cf. sk_net_refcnt_upgrade()).

It adds an anonymous enum (just for named values) SOCK_NETNS_REFCNT_* that
can be passed to __sock_create() and sk_alloc() through the @kern arg.
(this was much easier and shorter than e.g. adding another arg)

A sock_create_netns() wrapper is added, for callers who need such refcounting
(e.g. current callers of sk_net_refcnt_upgrade()).

And then, the core change is quite simple in sk_alloc() -- sk_net_refcnt is
set only if it's a user socket, or
(@kern == SOCK_NETNS_REFCNT_KERN_ANY && @net != inet_net).

I have the patches that modifies current users of sk_net_refcnt_upgrade() to
create their sockets with sock_create_netns(), if anyone wants to test or
this gets merged.

I could confirm this works only on cifs, though, by using Kuniyuki's reproducer
in [0], which is quite reliable.  Unfortunately, I don't know enough about the
other modules and/or how to trigger this same bug on those, but I'll be happy
to test it if I can get instructions.


Cheers,

Enzo


[0] - https://lore.kernel.org/linux-cifs/20241031175709.20111-1-kuniyu@amazon.com/

Enzo Matsumiya (1):
  net: socket: hint netns refcounting through @kern arg

 include/linux/net.h | 15 +++++++++++++++
 net/core/sock.c     | 10 ++++++----
 net/socket.c        | 27 +++++++++++++++++++++++++--
 3 files changed, 46 insertions(+), 6 deletions(-)

-- 
2.48.1

