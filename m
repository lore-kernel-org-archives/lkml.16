Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DDF8834;
	Mon, 12 May 2025 02:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747017157; cv=none; b=Bnp3l9D5xskKHq8rLTEaAkkvDohjbPNumDlZBpW7QWMMrnyQ1Y0FjuMpHF2ALbKWCDnaF2o4dLUGrw036NBJk8qBGOEJgdfMBa78trplJYZ0j+xhdLTwoBOBnsJZgEcDeJDZMIJ2AlhPmuQTLeKSL1EgYwYJCluz3nWrJJby99I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747017157; c=relaxed/simple;
	bh=Fv0oGHxn7CNZ/hNsG0S0rmMb+hGWvIVWBlE8n5pKX0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VjjIeSzOhPigiEjCQaHgYFRAyKA1SSc8Ht0M/CKat80nUMuJJ4Zt8kz4F5Onk5bwgroP1sZfg/Bv9W93g+lE8Fw8Oq8e4AcQk9ssBh84QTWhCKbY0dTr2iPTkKU/+rQvaIj/EpdM9nWSi+AJjwhWDoPBfnEdMxZ9TOenQK+priE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lG9vK+WD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lG9vK+WD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=UBLZqzzG2NXRn25JYcRLvbgMLnU60sFpxmCVgCV7MEc=; b=lG9vK+WDlOeXoIm+icXujqr+8s
	q9Ix2WRH0h4Io6x/t8tEp+aG1ZavnUEawcjpEtNU1OB3QRHRBdFHH/NfCT4efUUiSvO2tT0EGvNSU
	AWlozNMGlYkhaYdCsq7YkFFOwzoIqauGaRpwwqUkl6xpzfiq+7u8pV3+mYDmAg+cSgTute9jldN9M
	wLd8QBJG3LaaXs62ZuTYjrH7immTszDLtF6VgsyXpdwaeuc9CORPoXSh8vUlrz5REc3JgXr+7ldTO
	7F5F9Lmkq3q3fJ+ff4LXYBGSzOIfBQxP391VYrFSdD/SMVSikkszUDsixhfTiVeP5IN3tPMeYVd/E
	2/U9MHDg==;
Received: from [50.39.124.201] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEIy2-00000008Ck0-3Urk;
	Mon, 12 May 2025 02:32:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Tom Zanussi <tzanussi@gmail.com>
Subject: [PATCH] Docs: relay: editing cleanups
Date: Sun, 11 May 2025 19:32:33 -0700
Message-ID: <20250512023233.107582-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup some punctuation, capital letter, and a missing word
in relay.rst.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Tom Zanussi <tzanussi@gmail.com>
---
 Documentation/filesystems/relay.rst |   26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

--- linux-next-20250508.orig/Documentation/filesystems/relay.rst
+++ linux-next-20250508/Documentation/filesystems/relay.rst
@@ -32,7 +32,7 @@ functions in the relay interface code -
 Semantics
 =========
 
-Each relay channel has one buffer per CPU, each buffer has one or more
+Each relay channel has one buffer per CPU; each buffer has one or more
 sub-buffers.  Messages are written to the first sub-buffer until it is
 too full to contain a new message, in which case it is written to
 the next (if available).  Messages are never split across sub-buffers.
@@ -40,7 +40,7 @@ At this point, userspace can be notified
 sub-buffer, while the kernel continues writing to the next.
 
 When notified that a sub-buffer is full, the kernel knows how many
-bytes of it are padding i.e. unused space occurring because a complete
+bytes of it are padding, i.e., unused space occurring because a complete
 message couldn't fit into a sub-buffer.  Userspace can use this
 knowledge to copy only valid data.
 
@@ -71,7 +71,7 @@ klog and relay-apps example code
 ================================
 
 The relay interface itself is ready to use, but to make things easier,
-a couple simple utility functions and a set of examples are provided.
+a couple of simple utility functions and a set of examples are provided.
 
 The relay-apps example tarball, available on the relay sourceforge
 site, contains a set of self-contained examples, each consisting of a
@@ -91,7 +91,7 @@ registered will data actually be logged
 examples for details).
 
 It is of course possible to use the relay interface from scratch,
-i.e. without using any of the relay-apps example code or klog, but
+i.e., without using any of the relay-apps example code or klog, but
 you'll have to implement communication between userspace and kernel,
 allowing both to convey the state of buffers (full, empty, amount of
 padding).  The read() interface both removes padding and internally
@@ -119,7 +119,7 @@ mmap()      results in channel buffer be
 	    must map the entire file, which is NRBUF * SUBBUFSIZE.
 
 read()      read the contents of a channel buffer.  The bytes read are
-	    'consumed' by the reader, i.e. they won't be available
+	    'consumed' by the reader, i.e., they won't be available
 	    again to subsequent reads.  If the channel is being used
 	    in no-overwrite mode (the default), it can be read at any
 	    time even if there's an active kernel writer.  If the
@@ -138,7 +138,7 @@ poll()      POLLIN/POLLRDNORM/POLLERR su
 	    notified when sub-buffer boundaries are crossed.
 
 close()     decrements the channel buffer's refcount.  When the refcount
-	    reaches 0, i.e. when no process or kernel client has the
+	    reaches 0, i.e., when no process or kernel client has the
 	    buffer open, the channel buffer is freed.
 =========== ============================================================
 
@@ -149,7 +149,7 @@ host filesystem must be mounted.  For ex
 
 .. Note::
 
-	the host filesystem doesn't need to be mounted for kernel
+	The host filesystem doesn't need to be mounted for kernel
 	clients to create or use channels - it only needs to be
 	mounted when user space applications need access to the buffer
 	data.
@@ -315,7 +315,7 @@ section, as it pertains mainly to mmap()
 In 'overwrite' mode, also known as 'flight recorder' mode, writes
 continuously cycle around the buffer and will never fail, but will
 unconditionally overwrite old data regardless of whether it's actually
-been consumed.  In no-overwrite mode, writes will fail, i.e. data will
+been consumed.  In no-overwrite mode, writes will fail, i.e., data will
 be lost, if the number of unconsumed sub-buffers equals the total
 number of sub-buffers in the channel.  It should be clear that if
 there is no consumer or if the consumer can't consume sub-buffers fast
@@ -334,7 +334,7 @@ initialize the next sub-buffer if approp
 sub-buffer if appropriate and 3) return a boolean value indicating
 whether or not to actually move on to the next sub-buffer.
 
-To implement 'no-overwrite' mode, the userspace client would provide
+To implement 'no-overwrite' mode, the userspace client provides
 an implementation of the subbuf_start() callback something like the
 following::
 
@@ -354,9 +354,9 @@ following::
 	    return 1;
     }
 
-If the current buffer is full, i.e. all sub-buffers remain unconsumed,
+If the current buffer is full, i.e., all sub-buffers remain unconsumed,
 the callback returns 0 to indicate that the buffer switch should not
-occur yet, i.e. until the consumer has had a chance to read the
+occur yet, i.e., until the consumer has had a chance to read the
 current set of ready sub-buffers.  For the relay_buf_full() function
 to make sense, the consumer is responsible for notifying the relay
 interface when sub-buffers have been consumed via
@@ -390,7 +390,7 @@ consulted.
 
 The default subbuf_start() implementation, used if the client doesn't
 define any callbacks, or doesn't define the subbuf_start() callback,
-implements the simplest possible 'no-overwrite' mode, i.e. it does
+implements the simplest possible 'no-overwrite' mode, i.e., it does
 nothing but return 0.
 
 Header information can be reserved at the beginning of each sub-buffer
@@ -457,7 +457,7 @@ rather than open and close a new channel
 can be used for this purpose - it resets a channel to its initial
 state without reallocating channel buffer memory or destroying
 existing mappings.  It should however only be called when it's safe to
-do so, i.e. when the channel isn't currently being written to.
+do so, i.e., when the channel isn't currently being written to.
 
 Finally, there are a couple of utility callbacks that can be used for
 different purposes.  buf_mapped() is called whenever a channel buffer
