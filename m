Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374A6194A44
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232377; cv=none; b=TROV90ZnvkzMfh5zabPElfC+6Z18LGiDmUIo0U/bGVOqvCu1BZ1iFQ1D54ibOhEUI6/iC8CG76Q8wwUgAOCNrGYhlCOr0CqfGT9UqVJimcnFzBJ6uHuiAVFL0iey6Hzig0B8A5HxbC4mlyX0ebuz6Zj/dL0vubdnK4ZPWyTAO78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232377; c=relaxed/simple;
	bh=wHZtwYVBdWmnMUx0cwwuokgFALLF/00lQUCEl6373K4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GKtvozaJ1szfFKLjFVkjPxsrMYrDswx+QYopPmkI4ekW18HRCwN1LACsWsG1SxK/SQamR1FfoCybu4TEOa8ohnSh+Y57tF/K1zKVdZ6OncRAfv4RoPWZAhwHjrC1e7KoXyDn+w4Li0/CK53r4+BX7YIPTBHpFYNJvvpIhSJELcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HRhDsmJN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HRhDsmJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747232375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uRB4qyyeZ6d2cPqOCAW0MqMh5plkjaYv5Rx4lmPx+E4=;
	b=HRhDsmJNOfJBbMQ5q3o3aX8q6LSBp6vaU5N+tLt1hlJFyKXlqoezE4zQzOHYHSJO1D030s
	ut3RHacdzdbUstnVUhcMreQ+IFsxm0QCNTDOwHyEOJ9AbY2+WToe6MnJSwQo7ce1S6/dgE
	3o+Q9pPeT5ETFUAspk/AQPWrNNLe4Hc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-EqxI0prlP3GEF_2SDl3ubg-1; Wed, 14 May 2025 10:19:33 -0400
X-MC-Unique: EqxI0prlP3GEF_2SDl3ubg-1
X-Mimecast-MFC-AGG-ID: EqxI0prlP3GEF_2SDl3ubg_1747232372
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso42209975e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232372; x=1747837172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRB4qyyeZ6d2cPqOCAW0MqMh5plkjaYv5Rx4lmPx+E4=;
        b=b5TmgpYWtqJfjDI473D1a7LRDjuRYUJhANM1pnfdCb1FcDA24KqswNfHPVYc83aTOC
         tbNTZUW3Zh93OD0RhnI9e3bt1njzvouUCFseaTb0RMtAXquGITNO63UOwQ1Ks5zO2YE9
         5kE9l6wCXWijNbN7eyAzXWny+yAXMCWAft8wulmb7G5GbDM5/+pOJ9qyJj3ry6EJk8kN
         GivRDxQaePKeaoH2l5S2/GmHuhHk23ZBt84UhaXAruogLPrDkU0Vi1erihdrbsbQvTTZ
         3LE/imWFlXD+0XKuzmHEdUo6JskcSqexGVK31aHJFkSwA26o+f+zEsSC6SUimETmFjqI
         1r2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5aJFBHOofjvGIcMQDLpvktdfh3WLgMP5S1gY6ezqoFQdyuQqvkPiFA6x6I2o/XrryBESLRoPVU9Xui5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuRUL7qf8P2JLDB3SlRnKZn4wnoSjbt0suZO9kN6xcz7sxKcU6
	gKbiOtjcFb9PJoXPXqxPlo8vO5Ip0PR/VgA/QxlenLbUnC42wiTZ0gBv6bAXKqbYprKh6zF2DEs
	iWkYmZQF5jA94kkrkEv401gHgqAVA0Gt58U1HI4JblEcZy3f6px5ZMYF/qlxZMw==
X-Gm-Gg: ASbGncuh8KAzmAAb8AMOyx6CR6VFxhZWOoGddFVmKp7rZyLwaB2BUTbVBilTRrq8zIr
	doYG1sRtFkGiaGynnmmtCbW4F/u1r7r+A5J0ioP5UmiuAGcr8KbCL/kWatKRe6VItLv1t/K2qVl
	wkMELFrRjs0sNCvZnoT+v5PP9sxsTNan0ioXbPcGbF47pxmNO+Qgm+UgDn/y7oyPF0KeGhMbw9w
	jHMOWoXPtlmjxJoCM6fQsxabPAwz+gouf5NImTyioP8VaAbzdgcy3QtbhOm8O/JauF1tdfK0m0c
	EDGTNT9t+SAGAR2UuA==
X-Received: by 2002:a05:600c:c0c3:10b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-442f217983bmr24467805e9.31.1747232372359;
        Wed, 14 May 2025 07:19:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZQdAMWLppZvJZaxFmIVmRmAM7GRP6r6dCT4sSkMl77fpFp0Bh3DH3ymMTUNtVtBMPIQvRow==
X-Received: by 2002:a05:600c:c0c3:10b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-442f217983bmr24467415e9.31.1747232371811;
        Wed, 14 May 2025 07:19:31 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.203.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec98dsm19667975f8f.25.2025.05.14.07.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:19:31 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Cc: virtualization@lists.linux.dev,
	Stefano Garzarella <sgarzare@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/3] vsock/test: improve sigpipe test reliability
Date: Wed, 14 May 2025 16:19:24 +0200
Message-ID: <20250514141927.159456-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running the tests continuously I noticed that sometimes the sigpipe
test would fail due to a race between the control message of the test
and the vsock transport messages.

While I was at it I also improved the test by checking the errno we
expect.

Changelog:
v2:
- added a patch to provide timeout_usleep() and avoid issues with signals
  in timeout section
- add little sleep to avoid flooding the other peer [Paolo]
- fixed loop exit condition [Paolo]

v1: https://lore.kernel.org/netdev/20250508142005.135857-1-sgarzare@redhat.com/

Stefano Garzarella (3):
  vsock/test: add timeout_usleep() to allow sleeping in timeout sections
  vsock/test: retry send() to avoid occasional failure in sigpipe test
  vsock/test: check also expected errno on sigpipe test

 tools/testing/vsock/timeout.h    |  1 +
 tools/testing/vsock/timeout.c    | 18 +++++++++++++
 tools/testing/vsock/vsock_test.c | 46 ++++++++++++++++++++++++++------
 3 files changed, 57 insertions(+), 8 deletions(-)

-- 
2.49.0

