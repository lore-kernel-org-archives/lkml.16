Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6873C1E4BE
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 22:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750027643; cv=none; b=Rt6JAUWfRXjFu3n4DziL5k01cxHD3U1Dpb2Dg1v99qAPskKMmIh1Y4MYAs106hJSOHnzC9sNQtuDKEOwwLSyA+icQih9AAIDaTBmocdT7eAHt/1eOGNG3Yte3pp6jXRswVRumdtw6jr75PjP6Q/isLYf90Ob9vf+kXsPfzGVVfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750027643; c=relaxed/simple;
	bh=n38xCpv3OzAc5eoEys5Ppx1+wJC6uCNI7+QwXVVDbh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YTIvF5ESBJSoKr5bl8I/5ilYQEoISWDOTTjgtPEbX/mKl79GQLKApRSjJ96D8i3hmpeiaixLVjkEfeMPEjmQOZzHCoTbh5wP2dC/izHTb/KjesCyIzYi4QBnL8tnoM3Am/EUcCxelow+M849CKocGk+1eSlhLUVywGf+6C8TBRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b=Jluvd3AA; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b="Jluvd3AA"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 0247C240103
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net;
	s=1984.ea087b; t=1750027633;
	bh=n38xCpv3OzAc5eoEys5Ppx1+wJC6uCNI7+QwXVVDbh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:From;
	b=Jluvd3AAGUJ5kvFrDxSaV0bQ7mWfDQRhR2hRPw8hi/P/XMtl6V5gmwd8UM5TwwC3j
	 kVAsw1qjUGKwXEYkaQ9+uQtpGKNj6S9bWSFheVAdtGOjGIlsj8eyRfIsor7F0OCuDC
	 5wLCb0f3YeayKwrqIl40GzaJCbbgOokvmprOnxK98p2v9X9zK7NDVU5BsKsQrpDs3u
	 wRrbu63IzK8e7ovnaxyDBk58wbpcgGnbxgkrdmoVEfAyciEAbp0KPhpOVVQ9YEnAOI
	 q4amwTQoQ5XMedaZwzwK5Wt58o6O1xEgWDgr26JWbFkOoYfJhEIUTMEuNYGUEx/6jn
	 As7mcM/Z54Eod/HkDEvFnvhayfOeg2fFsTFKVatFhprM5ztit5GA8cJHc+OGmqvfmt
	 NbhRnzbH/108smeMp83v9LQVTH6Y3M8/UMUc0lvjhYCTYlYKvkmD9bu/YSAlw4/E43
	 jB7Vjf8oO5JoCoOeNliATgyW/AnV+gdtHfyXyAYDAoYfZLdrevL
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bL7YW11BPz6twx;
	Mon, 16 Jun 2025 00:47:11 +0200 (CEST)
From: Charalampos Mitrodimas <charmitro@posteo.net>
Date: Sun, 15 Jun 2025 22:46:40 +0000
Subject: [PATCH] docs: filesystems: vfs: remove broken resource link
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-vfs-docs-v1-1-0d87fbc0abc2@posteo.net>
X-B4-Tracking: v=1; b=H4sIAE9NT2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0NT3bK0Yt2U/ORi3aREA6PEJKNkS0OTNCWg8oKi1LTMCrBR0bG1tQB
 EzTT+WgAAAA==
X-Change-ID: 20250615-vfs-docs-ba02ab2c914f
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Jonathan Corbet <corbet@lwn.net>, neil@brown.name
Cc: linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Charalampos Mitrodimas <charmitro@posteo.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750027608; l=1079;
 i=charmitro@posteo.net; s=20250526; h=from:subject:message-id;
 bh=n38xCpv3OzAc5eoEys5Ppx1+wJC6uCNI7+QwXVVDbh4=;
 b=nddtxwEomMpMeE87J0rAj47c6U66RVpEuH+nhePr2ZI7RKPl3PxIhwS7hqQWPLOQPFU2bIWP2
 iwOTF1YCKDpDM63A8k1C5TaZASTN+Iz0tb3QaJOx7FTehDBtVsXTVya
X-Developer-Key: i=charmitro@posteo.net; a=ed25519;
 pk=PNHEh5o1dcr5kfKoZhfwdsfm3CxVfRje7vFYKIW0Mp4=

The referenced link is no longer accessible. Since an alternative
source is not available, so removing it entirely.

Signed-off-by: Charalampos Mitrodimas <charmitro@posteo.net>
---
 Documentation/filesystems/vfs.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index fd32a9a17bfb34e3f307ef6281d1114afe4fbc66..a90cba73b26c18344c3d34fdb78acb4ff6f14ae8 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -1549,9 +1549,6 @@ Resources
 Creating Linux virtual filesystems. 2002
     <https://lwn.net/Articles/13325/>
 
-The Linux Virtual File-system Layer by Neil Brown. 1999
-    <http://www.cse.unsw.edu.au/~neilb/oss/linux-commentary/vfs.html>
-
 A tour of the Linux VFS by Michael K. Johnson. 1996
     <https://www.tldp.org/LDP/khg/HyperNews/get/fs/vfstour.html>
 

---
base-commit: 4774cfe3543abb8ee98089f535e28ebfd45b975a
change-id: 20250615-vfs-docs-ba02ab2c914f

Best regards,
-- 
Charalampos Mitrodimas <charmitro@posteo.net>

