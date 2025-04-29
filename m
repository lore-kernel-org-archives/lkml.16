Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7E92C2585
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745930932; cv=none; b=uG/lMIYVmUryyyUj2IEPT/ZYKKrq7DYW+9zVvsMftxBCaxCWTfYRliDeXrdL9rnnG6wG+upAoFSFvkTuPwJyqMKC0UNAUzzpogo2+zC6wDrKYMAvPdG+YpMNLelk7M06CbgWweOO8GJlRi2ocEMqNeXRupegArlFbaIzmxqcSe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745930932; c=relaxed/simple;
	bh=1dx7UQS4OGTC3B/qwRqogTi8lJnyML9S95U2wutGswM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o9pyeO/1f6JvbPSQreyJMcvuOWNpl0dykR8ub3p6iCZkF717rOaDih55kZVNV6yn21g6N/tNqrH/0+oomElw8BBBbnQu2cGwtJnR00dgxa5gW/x2bOkJpSOrra+PkHCkyNQstDKF/tN+CnY0SCSLkrW8F4vWKqrHkEnPrRI5HoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rVk5N8Wm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P/qw9TH/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QYpfQjTZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eISD1b2K; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rVk5N8Wm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P/qw9TH/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QYpfQjTZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eISD1b2K"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 702441F391;
	Tue, 29 Apr 2025 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745930928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pQ1k4W/DLVUNMuF7Ga9UAQWu0fikIVQQAGbDYjHzVfw=;
	b=rVk5N8WmkpFRybMsYUOPbpqMBcbEn/Ugcaz2U4x+pX4cUDjJZKYMHDYEkWZR8BdiEHZ6ep
	PyfjDhu5Fm9Dcuz1yL+qQRdLlGICnOgZBp5z+9pxz7FoEDL9RRfaiCrjbxNfYyJWIhckUi
	Q/6nNbFr6ybBu0JaV87BF7f3bDjkb4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745930928;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pQ1k4W/DLVUNMuF7Ga9UAQWu0fikIVQQAGbDYjHzVfw=;
	b=P/qw9TH/dEvd5BC5hGfEHC5NyQWm66WpUgevaa0T/k43u7HuyVaEZl6VV9WgSxUwm7hb/m
	nbwas40PC6kKM1CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745930927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pQ1k4W/DLVUNMuF7Ga9UAQWu0fikIVQQAGbDYjHzVfw=;
	b=QYpfQjTZwh8euB9wP4LoGG+w0g1N8gbNSMQM+l8TbFLhOMVUjQtHtKP/vvItwOVjoTqtNB
	0WuVVaCly7+RNYRGHr2brkZS/4FN45AbLUNi95NqxPx5SZ1MzUDpeayyXccZLEA4MywMkT
	vqqUGFE+macuIh3wro6AMQkWySqFJ68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745930927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pQ1k4W/DLVUNMuF7Ga9UAQWu0fikIVQQAGbDYjHzVfw=;
	b=eISD1b2K9LgHZ5Gf6r6BGta5EtKryPhypCN8Rk0rIUH6RENTg2u7uRFj2iQ/I0rUeXubYS
	URXIRYEym7d0LRAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DA4613931;
	Tue, 29 Apr 2025 12:48:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aBBJFq/KEGjfXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Apr 2025 12:48:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Argusee <vr@darknavy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: ump: Fix buffer overflow at UMP SysEx message conversion
Date: Tue, 29 Apr 2025 14:48:41 +0200
Message-ID: <20250429124845.25128-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The conversion function from MIDI 1.0 to UMP packet contains an
internal buffer to keep the incoming MIDI bytes, and its size is 4, as
it was supposed to be the max size for a MIDI1 UMP packet data.
However, the implementation overlooked that SysEx is handled in a
different format, and it can be up to 6 bytes, as found in
do_convert_to_ump().  It leads eventually to a buffer overflow, and
may corrupt the memory when a longer SysEx message is received.

The fix is simply to extend the buffer size to 6 to fit with the SysEx
UMP message.

Fixes: 0b5288f5fe63 ("ALSA: ump: Add legacy raw MIDI support")
Reported-by: Argusee <vr@darknavy.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ump_convert.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/ump_convert.h b/include/sound/ump_convert.h
index d099ae27f849..682499b871ea 100644
--- a/include/sound/ump_convert.h
+++ b/include/sound/ump_convert.h
@@ -19,7 +19,7 @@ struct ump_cvt_to_ump_bank {
 /* context for converting from MIDI1 byte stream to UMP packet */
 struct ump_cvt_to_ump {
 	/* MIDI1 intermediate buffer */
-	unsigned char buf[4];
+	unsigned char buf[6]; /* up to 6 bytes for SysEx */
 	int len;
 	int cmd_bytes;
 
-- 
2.49.0

