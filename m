Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68433B19A
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 21:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738273188; cv=none; b=YOHz8o4M0q2H1j/psLXhebZLMEa5QmTwlNeknFoIcH/a4oCc6SMXG9J6yO1XrtHgETu17zvHS5yHLU1BWKa3tNEZkkDOTlYOEXhBp8qNrEl9NwnHI5E4YHmcnBpArdgVJESTRXuL7upHNjGueHGV/hhQXLV0ZTHT5J9G6ZoYr6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738273188; c=relaxed/simple;
	bh=fC+P2IebC8WVyk8SpwdTZ2LQvnssGMegCTt+C9XzYbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MMYhGOVv7Fe8sEWZNd0MMumrb1Jly5bCbssY1Luo/zOO7VYV4ZDeCKxS2ltMUcsFSDXaiNST0u8eyZfhb/2ZFtY7/jwULmx+r3itkz27Y2teZmyW8IoI+l43p4G7owhZQSgsGF+c/84BX+N3gNQ2RoQNc45turhUpghqKn1/xU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2NX9wRE; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2NX9wRE"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so13928281fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738273185; x=1738877985; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KZ1GQnEty6Mke6uTt1jeBFa4XTqIbSiGTlVoRGUyYe8=;
        b=G2NX9wREBI815kVD/dOqic7MgaSt3bHTKCE/JhbY1Pfe6TTC96paJgdD4bUUP+DfBo
         WO34l3X9AXFJDUBz2miya9KhcyAy/TwV//jyomFnRvwUssgDBomII9MviX3nqLCX/KU+
         Jp2Swc3g16ZDliRxiUfYV/XbFVxWLACiglL3KDbE4eQn7eXGzYRG7/9iNIi9LHMDD4hK
         aPtbYTOzDy0w0shNclf8ktoQuGOtDu5QnGgm+92zd46DJemDjoM2+J6gBT+iv3mPtSTR
         0qqK6IkoQAQAFmtXNC+5a932wXUKSkucU9BhvSuFrWGSzrxHy3Fe0cTf0g8+HpkZUe68
         FvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738273185; x=1738877985;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ1GQnEty6Mke6uTt1jeBFa4XTqIbSiGTlVoRGUyYe8=;
        b=Ee2UEaaGrbiqfckeV344j2u+x20UQegby7dFd9RHUlZbArgn6wtQMXoZEM+1ECu26J
         wm5OmUoGeiRHwFlTP6iPLpDRJjUCD5HUU4NnqRT5/u/8au3Nuv9TuUPMVgyRVeBaZyPm
         WJbyo8238BhjSvA3FZ97XZ9SYB9najNqq2WVGPxtULg2T3O0l149pr0MwS8oXrssKEgy
         USb4XY4wNFIkMtz/YcvL+zalc1hTX62zkQy+7n3co/XGHqZK4hbZ/J5AbtJC1XPAIb+O
         FSetE/w66RoWZ1dn7rOCsn4bShzjibkNld6ovDzlvjzypkW1/Oql5/rU/s0IoM17tL/S
         n+fA==
X-Gm-Message-State: AOJu0Yzrg1uWxhHeoCcdXu0UrV3S2D4mc4ufAUByaCN8UgoferA0FSRK
	s9sRaVrb+j2Vkwurq5147QRmtto+Pi9qyj3dKTDIF77Ztdw/uZhTMnBMcW366Ho=
X-Gm-Gg: ASbGncuUaknaqCLnlzgb095RTMxn00U6LTcKum98kJof8Mw4U/DOTrKrs/ggmGgyfwn
	fWW2J14aUvgMgy61BxOxhAjJgOOhi8D5bDqT+oY8bxAWGdrvsWuA/cpFBQkGLB7fnLV1JJdW/3E
	Qlem3GoV1bR6QY+1qyoegyTDwdOloQLuej9CqIvyh3V3KSo+h44I0BLfxxd4ODfmAMbKLkO8neE
	6VhH6YbdHmRJnV0ZqD5azlqbOMsQ16SGDMzOu9kYFlCiEod3dycjFLwLVI0WtQcIKJrQxmaKK8t
	jR9nF3oHkHYJhVQh
X-Google-Smtp-Source: AGHT+IGxGisndNC8Wz9DW/JhEhJFi2T7Gb0tguxD9LTmrs0AuyeStmAbQS9Cggvg0/tnzclpfWNa+g==
X-Received: by 2002:a05:651c:12c9:b0:300:329e:23fb with SMTP id 38308e7fff4ca-30796975e4dmr39181741fa.34.1738273184600;
        Thu, 30 Jan 2025 13:39:44 -0800 (PST)
Received: from grain.localdomain ([5.18.253.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3086e45sm2937341fa.25.2025.01.30.13.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:39:44 -0800 (PST)
Received: by grain.localdomain (Postfix, from userid 1000)
	id D24385A004E; Fri, 31 Jan 2025 00:39:43 +0300 (MSK)
Date: Fri, 31 Jan 2025 00:39:43 +0300
From: Cyrill Gorcunov <gorcunov@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>, linux-afs@lists.infradead.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Subject: [PATCH] afs: Add missing init for srx_service member
Message-ID: <Z5vxn699b0YtTAc-@grain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.13 (2024-03-09)

Both afs_merge_fs_addr4 and afs_merge_fs_addr6 helpers allocate
sockaddr_rxrpc structure on kernel stack and never init srx_service
member before passing it down for peer lookup/creation. Looks
insignificant in current context but better be on a safe side for
future use. Thus initialize them explicitly.

Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Marc Dionne <marc.dionne@auristor.com>
---
 fs/afs/addr_list.c |    2 ++
 1 file changed, 2 insertions(+)

Index: linux-tip.git/fs/afs/addr_list.c
===================================================================
--- linux-tip.git.orig/fs/afs/addr_list.c
+++ linux-tip.git/fs/afs/addr_list.c
@@ -291,6 +291,7 @@ int afs_merge_fs_addr4(struct afs_net *n
 		return 0;
 
 	srx.srx_family = AF_RXRPC;
+	srx.srx_service = 0;
 	srx.transport_type = SOCK_DGRAM;
 	srx.transport_len = sizeof(srx.transport.sin);
 	srx.transport.sin.sin_family = AF_INET;
@@ -335,6 +336,7 @@ int afs_merge_fs_addr6(struct afs_net *n
 		return 0;
 
 	srx.srx_family = AF_RXRPC;
+	srx.srx_service = 0;
 	srx.transport_type = SOCK_DGRAM;
 	srx.transport_len = sizeof(srx.transport.sin6);
 	srx.transport.sin6.sin6_family = AF_INET6;
