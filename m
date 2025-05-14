Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B5619992C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747243599; cv=none; b=uaSJmjV4GxF8tPg2DMYm6uVY1wXtQFDREsdC5eHiH1nsiZVsxnH6oLMjOzfeLZ1x1HewtUvHiFwufbN5f8JUeJgwQEopx/DwuTS7PatXlCqW3owZWQiZHlONdWzIdeRVlBxzmzN/E/WhK/p/Ya1wE88tSoxCOrb4mHb3pKdLz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747243599; c=relaxed/simple;
	bh=Bu8XXMP06zFUuHV4nWypFECt9tmJZy5JGfBfFIPcbIg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=luUpDHe4X+FeEeWq++ZVzoW82WGcq5jkvSchaZQEpsS3xr0wSoibDqwh0JWt5Dfrb0sn2QrCf0hL3nyWlgcNh6ms78DG85zMNXWBRIwS57Y3BHJDrBiZuLt0n+RUgMRkb/Pm32TySlH7Y75zw/qh33BRnSjn5cducqeqXnG/myE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ePgOQdvH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ePgOQdvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747243596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TlxDMys+Q8gzQ2USC907k8LUWQJPqtrQGgMzbGREC5E=;
	b=ePgOQdvH4W16O6RQ4fbzVyG6QAQwFvy8A4+4/oOG1AlPuGpRT8SPe0l0EsD1Hr5T+aMWOS
	nm277v7rP58hdFRjsbQ4Fy0KhaFregdTTrhUscdMBjsbwQLtGZ0fCwTFKTyPzJYuLg2tY+
	KlQRRyZAPgfk/97KNoxPV1p4n5qaD88=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-mnwKayhINGCErvpd3kTmeA-1; Wed, 14 May 2025 13:26:35 -0400
X-MC-Unique: mnwKayhINGCErvpd3kTmeA-1
X-Mimecast-MFC-AGG-ID: mnwKayhINGCErvpd3kTmeA_1747243595
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f6f2c41eddso1621816d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747243594; x=1747848394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TlxDMys+Q8gzQ2USC907k8LUWQJPqtrQGgMzbGREC5E=;
        b=ePR0LkENuvzXMyVclUDdEXZRGiEe6sTL2f5t8rHzK0gxr2b4lAALHysTqDkT9L0oFM
         KJ8bLf9QBVPY1hN4/xCZ2BIXWX+RD6y+a/BbEyMEsdqVrjT4foPnWc595SrPWX+kP+9x
         6UJbljFEYeNCOL6W1Uqe05adCTyz7v16qh1lLv4KR7ABW7kBM+MdPBuAmtFG3Ffjxtbb
         +fn3GPuJliV3DhLlxT/hzYpt6fc1idHfGN+crrbDAZKSONLsz4bVMI7x98/gYQA4NhR/
         aVzvolNCjRN+4hHnpod3fGEYR3kuitU0Wu2Q22AeZGLY0ksDpYZqncN/TI3hXgGLK5/N
         y07w==
X-Forwarded-Encrypted: i=1; AJvYcCV9kGEU/NPCLZVdkEq083JBGl76do9WvJY/IQRfB0VR41GL9csENxMK3npHKk1ihLDa8d9xwIN3+9AzfY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVIcmypr2AWsw0u5yu1t1qur0jnuqtoMilF5DSPRMiD0MTYRYQ
	DSaPJFUkZAvJ8DQJcBQfNhoO+fDmzdk4ASdff5MqufYvmftsX3bbFKUMKWaVrSe0swuVSnhGPay
	rvJ45Yq0U9jERB6RqcQLp/vNXu6H1S4IzJWX6javv2+VOaNQA4I/nVNr9p9/iEQ==
X-Gm-Gg: ASbGncslb2kXRK3laWAzaRURq27nD0rDFktH1x1qEeHtTa6nAjPC079rSQs+dCJ0FYa
	yG+Xg7mn20lEDhEB6hgdC1wZHJ+aSPP0rdMact21c0sSzNYizzWP42qZuxueavYXC5CVBjmn0j5
	0Jmphz3Y0Zm1RlqryAcUYKFO5hVQVUkdj7fv81L6NIMERoxOebOEtQQdfvgEjSBzkt22Y3+7KQL
	LWuLxxl4afz0Gz3L5t1ZIg1DUtxkHqt7+HUOBnuBYba6gCP4pCsM0ozs9g+noFliJf6MNCZG38m
X-Received: by 2002:a05:6214:529a:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6f896e294damr64744426d6.2.1747243594665;
        Wed, 14 May 2025 10:26:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtnhZ9K5+3H5YeJYHWajNmWT8P6hPhREtsby9lgX8j6TSyQTYRFFkO6mevKkgRdRmqkbv/YQ==
X-Received: by 2002:a05:6214:529a:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6f896e294damr64744136d6.2.1747243594366;
        Wed, 14 May 2025 10:26:34 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f4795sm83590536d6.30.2025.05.14.10.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:26:33 -0700 (PDT)
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
Subject: [PATCH v2 0/2] UFFDIO_API.2const: Two man page updates
Date: Wed, 14 May 2025 13:26:28 -0400
Message-ID: <20250514172630.569788-1-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
- Added tags
- One fix on semantic newlines [Alejandro]
- Replace "0" with "zero" [Alejandro]
- Added Fixes for both commits [Alejandro]
- Renamed the subject of patch 2 to contain UFFD_FEATURE_MOVE [Alejandro]

The first patch updates the page on two-steps handshake, removing the
misleading paragraph and replacing it with a paragraph explaining the
correct way to probe the userfaultfd features.

The second patch is a small touch up on the same man page that misses the
newly added UFFDIO_MOVE feature.

Thanks,

Peter Xu (2):
  UFFDIO_API.2const: Update userfaultfd handshake and feature probe
  UFFDIO_API.2const: Add an entry for UFFDIO_FEATURE_MOVE

 man/man2const/UFFDIO_API.2const | 50 ++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 19 deletions(-)

-- 
2.49.0

