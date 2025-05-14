Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6043827F756
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747243601; cv=none; b=j1znabCWQxot+dGufSGs6cI1+xnbm8XiJhwVTblZ8LpWPIT8mln1PWYfShfRPPolDxAKUO3cHCn6s3g60gYB1a1MBT3FctZiuzG6+Skpdh5TniX8sRe+bq1DlnO8z72JYG/GiRlLyca59Eo7Euz0RoAOKxrKjUSAtD5ECtCcZBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747243601; c=relaxed/simple;
	bh=GhhCpnt09wLRxO7IljYoAiRnBeNBDPj44AzlBMpUY+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NSV3t+a/73V1e3Q6XEOPAB0mNBUWpuP7bk2DSijAr9e+REkWA/VTBb+rpgIETP/yoDrKUgKebuiWRjh8cuO2RdC5dRJFpO8Ub8RuLljOy7kmT8OJDYeJM25AsCknRlb9tV/1MUGTOERy9Fs2nhl2D7szRUo7aJ74KkLmG1qerhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RIK7KL/u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RIK7KL/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747243598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUvm/u3j4WG4wsWjGgjYX26cY2cuBpZEhtt9a/KRMUQ=;
	b=RIK7KL/uTbQhZAJmdIoiBms2mA0u0k/mbRDvQcRWVR1LhLHHtr5VUCGgMYHWI1mXc+Mjfo
	3Cp6XW7FsDerCCnKkJ09whxKccg3vjSWznzEpm6bPN0acvfUhOa378VuXh+lSgs42n6I0n
	b55FFzQ+k1Vqp2g1FPz9FN5DCAtBOU4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-nIBBbbTyOBupiocKz8qoFA-1; Wed, 14 May 2025 13:26:36 -0400
X-MC-Unique: nIBBbbTyOBupiocKz8qoFA-1
X-Mimecast-MFC-AGG-ID: nIBBbbTyOBupiocKz8qoFA_1747243596
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f53913e2b6so1401186d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747243596; x=1747848396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUvm/u3j4WG4wsWjGgjYX26cY2cuBpZEhtt9a/KRMUQ=;
        b=mRZP634Ns4iu/cId0USLyKDXjaVc+o3w4L51z2cjOlnySUcuKpGbtXk2O7FzpT10NX
         Q2erZUlGQ7hpTYLHD20RDNrRBSBl1BNH6K06FHwRPoON8nk4Iqvtkh9H3wUuEgpxYxU6
         7fj0F3kuM0S+itSHxVnljZ/UJNuX8BED5yoX2+V+hPaDN5l1kYzNXGsQPF3TLHpqwdfG
         Sy+47P4gER94Ivx6ltP531zEZIPZP4kXT+70XZNz5mFY2he+js4M1+7K3AZxux9E2uGA
         5AUkSmVLcw7X78WVpq6YhG06TCpk8RvmFDjn3uq2DRNlGcK0UdfYXiEoKbF+prRtBUU6
         N3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX8MJPmw1+JSu0YIIOw1sJMjZnBRjF44OKP6or3XIcWpRieROYlavnFCUPsudn2cn45CNCRNmcf05Lv2r4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmHJO+xO6LAK8wqXCjsPBayvJzPAwJ8jyy235Ijc4SgOTlbxvM
	W7+vaTBET0vGbbr+6/29gOoyEmP/yZb6NP64jcBudnt691WmpYJlCZnIM2bt2Y01TE+C9CgstoH
	p/rz+0kqpwBfKFWvw+Oy61Y+NzvVuwSmjXsfB6j1UXE6jRyGdWXOQ77u6M6XYxw==
X-Gm-Gg: ASbGncsZeFSphxf5oIYXZ5N6FeUQsELLwlTR6bv8DSiOMUy/4uhmOZL9wz5wmflS8rM
	TLT2U/zl5FrxOPXnc3CSff6cOZ796HJ8j2XYa9VCSb7mrwLAkyMT8mb0csMqxD3wNZw1yHNJ9u7
	wCR/+EgIqEmPh1lIXgseJXY8crYiSyq9N3cw7gBaoZXcTy8FRSleJcXhWMpTigszzvGS4a8n96O
	QMIcSf5NlegFrGER13Cb9yq8Pd+EhCM1NN5hCBriV4sBQG1ewre6WYUd29eRw2eYxJVJVXyS6Mp
X-Received: by 2002:ad4:5d63:0:b0:6e8:f949:38c6 with SMTP id 6a1803df08f44-6f896ea8adamr61212446d6.33.1747243596162;
        Wed, 14 May 2025 10:26:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4VMBew+JPLH9FJWsO595OxibhOLiZJaysAzZGkfUGJuxyv2GUW6YNb7ys4nHClDclSmtNPg==
X-Received: by 2002:ad4:5d63:0:b0:6e8:f949:38c6 with SMTP id 6a1803df08f44-6f896ea8adamr61212246d6.33.1747243595805;
        Wed, 14 May 2025 10:26:35 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f4795sm83590536d6.30.2025.05.14.10.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:26:35 -0700 (PDT)
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
	Axel Rasmussen <axelrasmussen@google.com>,
	Kyle Huey <khuey@kylehuey.com>
Subject: [PATCH v2 1/2] UFFDIO_API.2const: Update userfaultfd handshake and feature probe
Date: Wed, 14 May 2025 13:26:29 -0400
Message-ID: <20250514172630.569788-2-peterx@redhat.com>
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

There's a confusing paragraph in the man page on two-steps handshake for
userfaultfd UFFDIO_API ioctl.  In reality, after a successful UFFDIO_API
ioctl, the userfaultfd will be locked up on the features and any further
UFFDIO_API on top of an initialized userfaultfd would fail.

Modify the UFFDIO_API(2const) man page to reflect the reality.  Instead,
add a paragraph explaining the right way to probe userfaultfd features.
Add that only after the "Before Linux 4.11" paragraph, as the old kernel
doesn't support any feature anyway.

Fixes: a252b3345 ("ioctl_userfaultfd.2: Describe two-step feature handshake")
Reviewed-by: Kyle Huey <khuey@kylehuey.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 man/man2const/UFFDIO_API.2const | 44 +++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/man/man2const/UFFDIO_API.2const b/man/man2const/UFFDIO_API.2const
index 54b34a1bc..aca27dc5c 100644
--- a/man/man2const/UFFDIO_API.2const
+++ b/man/man2const/UFFDIO_API.2const
@@ -42,25 +42,6 @@ fields to bit masks representing all the available features and the generic
 .BR ioctl (2)
 operations available.
 .P
-Since Linux 4.11,
-applications should use the
-.I features
-field to perform a two-step handshake.
-First,
-.B UFFDIO_API
-is called with the
-.I features
-field set to zero.
-The kernel responds by setting all supported feature bits.
-.P
-Applications which do not require any specific features
-can begin using the userfaultfd immediately.
-Applications which do need specific features
-should call
-.B UFFDIO_API
-again with a subset of the reported feature bits set
-to enable those features.
-.P
 Before Linux 4.11, the
 .I features
 field must be initialized to zero before the call to
@@ -70,6 +51,31 @@ and zero (i.e., no feature bits) is placed in the
 field by the kernel upon return from
 .BR ioctl (2).
 .P
+Since Linux 4.11,
+userfaultfd supports features that need to be enabled explicitly.
+To enable any of the features,
+one needs to set the corresponding feature bits in
+.I features
+when issuing the
+.B UFFDIO_API
+ioctl.
+.P
+For historical reasons,
+a temporary userfaultfd is needed to probe
+what userfaultfd features the kernel supports.
+The application needs to create a temporary userfaultfd,
+issue an
+.B UFFDIO_API
+ioctl with
+.I features
+set to zero.
+After the
+.B UFFDIO_API
+ioctl returns successfully,
+.I features
+should contain all the userfaultfd features that the kernel supports.
+The temporary userfaultfd can be safely closed after the probe.
+.P
 If the application sets unsupported feature bits,
 the kernel will zero out the returned
 .I uffdio_api
-- 
2.49.0

