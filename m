Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C3628030F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747243601; cv=none; b=RoOxiym6ew/CQFc4+IU+N6pDXkzSCtGlGC+5W2PVujfmBAUVb5/VQb45tMweOSE1ZkO9Cx7gdTk74BBJCyxJFznXtW1C+sB6NGs8WxU5GFDNaTQ6efl6jTgFVFFdtswNPxbVxEPIY9HQexn2qyQmumL6xZeybQMIGzaqJg+D98E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747243601; c=relaxed/simple;
	bh=1yRC1XwpYKzFcM/zrcrcVhqTKiQ7uUmPQ8b9lkxNl1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djBwLQtc4Ilqqby7JumZMYsxpATmjPN8S9htPgnJGA8hivGG25Qq4bIiii/mtAFXLNprYF8umCzIh4K1DKz2/19WL0naW1Ywmdt6GbJR2pisfNnap7pFB/8noae7a1MKNBVAjx6fjJQEWx8hZz/EtFTCOtlcFNFt2MjQ4G6ZH5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ChVVsHZI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ChVVsHZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747243599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTtJTQLrX3gO9Dfm9nEWJ3K40sqpMSzaDV8/6FruRKM=;
	b=ChVVsHZIn8Cr6JkfSufsXzYtelyy4b+wfBf9UTcqL2UslzEW7ZJfmbNkxZLGMZUSqm7zAp
	LkYpw8/2LBVasRyC9/eJbci+KXgvuz+LJ9yaGvOZW9lEHPpU3m9vooo15j738/TdhbQ9jX
	MvkkEhyRr4nABDvS2f3KQcJtPYvrK50=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-ycBsvZhgO4aJfSa_r5If3g-1; Wed, 14 May 2025 13:26:38 -0400
X-MC-Unique: ycBsvZhgO4aJfSa_r5If3g-1
X-Mimecast-MFC-AGG-ID: ycBsvZhgO4aJfSa_r5If3g_1747243598
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f5c9e18c32so2946566d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747243597; x=1747848397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTtJTQLrX3gO9Dfm9nEWJ3K40sqpMSzaDV8/6FruRKM=;
        b=Qz9eborgsRZuGShtDvmX3m53T85DtzlAVaDjam3OhvvDvPyqX9B/UY7P8OL0fZTN/D
         n6cvRC43uw6x198Xna7/LcNg92t3p8ZW749D6QmgllG/GK4Barmg6diI8IJyZGMwV/ah
         BIuWmDc+vx0D0K0Qx2PR2SePfFRkjV1xQUUXQSOrjuIBqxVYhDkVN+22VIPkGfviZLpx
         fa/gMyZatqchH01KLRI5wm/AN3D1g9WUq2ftSJ8RttmXTJuz/iZoqPiNLqX/DbojJvdM
         0EiATTnlgkBLap8/smPaxNiqyN3/BSahlODOk43/i8p0ZGoBElBDIbhFHdo8VYoa9FQ2
         a1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Bu6D4NDgbfJjEzswSJFu8y9JGxBPgS+yhL+HlKTzCNsIdzjupni4ZDOmrisQmhJ8hWLfxdr/zJB2f0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrtS4bbwXtrbRzrXjF6kXiUS08G/k0E/3EQM+5GP/xtMyO7N1w
	YDd3DnwV/ItZk7z/i6/bR5KbK3LcxNBtjTVQT4DsCMcc3u2mHnVaYm07u+e/SAbH50HJOZkJwi2
	zEJdJs4sVos4WcixSJKJv5g6FNg4Z3JTZODkykLUh3p+WC+tbxBFfMEE/nPW9qw==
X-Gm-Gg: ASbGncsnCN0Qm4xyYIAe1IqX43ck7Ip8UF2LVgYTMxGdXuTq2Pf7Mn9WkxlCSzMg89E
	HO6Bod+mveNWb50v+ce0202qr2bLrS+GU5du57I7JOKUw5ucNBEkEkC1XFseRvLKxQ0TGeYkFpv
	gAcLkkInK2WsrA7vf21Z7wSl8CYpp7QqK6fdW+CQXEW5mKWv8w8Pc3ShngFCtXnH1bal7BCUYEI
	BJsjPofFk+fy1vvViRp38sQ4alYtuJidQkuuTYYpWK1+B+dAIvkT8zNsb+PlXuDz0y6Xa8O1NBc
X-Received: by 2002:a05:6214:2525:b0:6ed:15ce:e33e with SMTP id 6a1803df08f44-6f896e373c0mr69565456d6.27.1747243597633;
        Wed, 14 May 2025 10:26:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo+aoJaRipKfbPRvzEAPWK/mJOEEvFX4RboJQouXsr67VEYSkJ4Jcr3wp/VF7VWUSVEMZUzw==
X-Received: by 2002:a05:6214:2525:b0:6ed:15ce:e33e with SMTP id 6a1803df08f44-6f896e373c0mr69565086d6.27.1747243597244;
        Wed, 14 May 2025 10:26:37 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f4795sm83590536d6.30.2025.05.14.10.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:26:36 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	Kyle Huey <me@kylehuey.com>,
	Robert O'Callahan <robert@ocallahan.org>,
	peterx@redhat.com,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH v2 2/2] UFFDIO_API.2const: Add an entry for UFFDIO_FEATURE_MOVE
Date: Wed, 14 May 2025 13:26:30 -0400
Message-ID: <20250514172630.569788-3-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514172630.569788-1-peterx@redhat.com>
References: <20250514172630.569788-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the entry for UFFDIO_MOVE ioctl in UFFDIO_API man page.

Fixes: d7dec35a3b19 ("man/man2/ioctl_userfaultfd.2, man/man2const/UFFDIO_MOVE.2const: Document UFFDIO_MOVE")
Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 man/man2const/UFFDIO_API.2const | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man/man2const/UFFDIO_API.2const b/man/man2const/UFFDIO_API.2const
index aca27dc5c..682df4316 100644
--- a/man/man2const/UFFDIO_API.2const
+++ b/man/man2const/UFFDIO_API.2const
@@ -205,6 +205,12 @@ ioctl.
 If this feature bit is set,
 the write protection faults would be asynchronously resolved
 by the kernel.
+.TP
+.BR UFFD_FEATURE_MOVE " (since Linux 6.8)"
+If this feature bit is set,
+the kernel supports resolving faults with the
+.B UFFDIO_MOVE
+ioctl.
 .P
 The returned
 .I argp->ioctls
-- 
2.49.0

