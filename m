Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07573296D01
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070393; cv=none; b=s0iIGxF1VdjtCV2EHoZCjRjyK1jt6DIQf6L6RL1y2f30o7Bt8cMhGB/Ed9xMqMNeM3fxuBaRAa/YMFlcRXjJc6jeQVu+6xEchNrbkfzpcXvz6+aW2xZAlA7APuTI8U1q84raUaGLN4PFhl4hxBgESg7youekpnxkogK9wO6FBQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070393; c=relaxed/simple;
	bh=Jq6+zTmMIhbJtMdND1aZOGEUnT/8ETS5iQtBBhAPFRM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=USVzqYSB57KU1TMnvBmDsCSFRG+mHK2w9KoVkJ2+dcdtv44HK07tvt2E8xKWnnYnsRkZ/oTTzr6JM37nqSD/Oz64YC3Enns7s/dy5X2yKViy9ilKXH+3J16xsqhv2K/miRZo1iy0F5mDBToeY406p5dL50vOQ43U4ab9gfuie5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KOXWbERp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KOXWbERp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747070391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hc4wc6R5tCq7zzSrnONS3LsbZ4BpArkF0zZej/1ubvw=;
	b=KOXWbERp1396/QvL4NboaLPLXbo76RXnKTBLuyQuEQ56TianWiZz9JHwFJUnVoaSmlEbII
	TxhGYjYKC+y3sck3r26ULda3XRTpOVDr9nb0HqAdfgPKuq174hAFNL9Gtm3+p01MrbkURQ
	kOruJePYjdUCuLHSDOSUyIByreVysWc=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-pIwaoyPqOGeQwN6ULptgkA-1; Mon, 12 May 2025 13:19:50 -0400
X-MC-Unique: pIwaoyPqOGeQwN6ULptgkA-1
X-Mimecast-MFC-AGG-ID: pIwaoyPqOGeQwN6ULptgkA_1747070389
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-401c6c3a679so3640655b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747070388; x=1747675188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hc4wc6R5tCq7zzSrnONS3LsbZ4BpArkF0zZej/1ubvw=;
        b=FVfhEen5eLu9WRNwLfsfkBvn+tCAZQ1SGj69/uOPGDsllfx2avSwsQ3EbdMirb+kFF
         WmPD06n4ihizJEHNYbG6c/F76HLDyNuZmDagOtvCUMJDFeEQZSBHoX+c/bVm9Mjj6Zda
         NvZs/86lc4OaA5EUqFADnbXC+fo2Phs2wNPAKxZlpoIMe/vgzaTgiIdGUhGrv5QRX7Ii
         RWz8lKPK7yqZUA573H+JHFGhAZHgVTU/U2ezC3xKGjVPoOb21mdk9lbtiW3tc5bUcOuh
         k07v6BVkM+vA8uw9dgy8apCPTP0n8A1Ynj1VmUAxSeEO47C6dWKfi06ex+O1lZDN/2ad
         CfLA==
X-Gm-Message-State: AOJu0YyzJ1GFKKwKPjsaRkCP/9sHNNoYFSarZ+Ps6YbMTXBfNhA3wwiF
	czbGLUp/3G/FyfjAjITjBzqEwC9iiEno2SeP3yCsteHEjYTDMTDGXUuo3WMNbshaMTjrTlYWpJM
	PYLIHtGWmzVy1Uj4XC6BgdRohgGjOO5oM/+6rQR2EZ8cQr6Yrij8CyxaCdnON0/n4ZXAEeg==
X-Gm-Gg: ASbGnctb/IpkiO7a4m94vakhTweiR+QLI0s+xZ1jB2TPex1S+YmNDixpwcY7ViRIsIa
	DdRavMusbYLjoXzOKYRnNfq9ggwafNhq6NtryrgbZi+V0FQnQb+7wy3sr1VWKBS8TxjZHMyUim5
	/ZyjhXEEyw2DgDp09SyecEkrB7eowLks8Z9/OWFCs2MD7lCiicmw8S15b4Hrl3tRNC+sX/NtIY+
	splmZJ/IBBSGUUVu5+lzXdwDe7iWA7fx48RB3QUpscdMzXBp0nvYWP6fTazbGJ4FGc5CFejHp5k
X-Received: by 2002:a05:620a:2b99:b0:7c9:2537:be48 with SMTP id af79cd13be357-7cd01105576mr2466063985a.24.1747070377099;
        Mon, 12 May 2025 10:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl9jzo5zoXQr1y1xkM8mBx7JmDU17IT0zbHtFKnAy9/wCXiV9Vo2yKvBGoU6lfRFASKBu7iA==
X-Received: by 2002:a05:620a:2b99:b0:7c9:2537:be48 with SMTP id af79cd13be357-7cd01105576mr2465872785a.24.1747070365989;
        Mon, 12 May 2025 10:19:25 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00fde7c9sm574237485a.75.2025.05.12.10.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 10:19:25 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Kyle Huey <me@kylehuey.com>,
	linux-mm@kvack.org,
	peterx@redhat.com,
	Robert O'Callahan <robert@ocallahan.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH 0/2] UFFDIO_API.2const: Two man page updates
Date: Mon, 12 May 2025 13:19:20 -0400
Message-ID: <20250512171922.356408-1-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch updates the page on two-steps handshake, removing the
misleading paragraph and replacing it with a paragraph explaining the
correct way to probe the userfaultfd features.

The second patch is a small touch up on the same man page that misses the
newly added UFFDIO_MOVE feature.

Thanks,

Peter Xu (2):
  UFFDIO_API.2const: Update userfaultfd handshake and feature probe
  UFFDIO_API.2const: Add an entry for UFFDIO_MOVE

 man/man2const/UFFDIO_API.2const | 49 ++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 19 deletions(-)

-- 
2.49.0

