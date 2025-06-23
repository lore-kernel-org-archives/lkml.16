Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813852472A8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672869; cv=none; b=qDQ4RyiFAAWSL1biq6lgHaUga0I07EUV3imQl+QG54FyZlAZkSqSyStoLbUqnRecWeZ7oJwhWkRK90c0drCw4eFQf1WcUJN3Qua6pBFi4dOJtPTwrvtb+aXawsE/Ko0d+UrnT7ujYmUt5Unixg2C/VdheL6Mvcs4/BhXXpfTn6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672869; c=relaxed/simple;
	bh=Q5iqcjL9Nx3GILkRpH3081upzUIxlt4JKXojGl4BQ/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ECn1bQxQbfsHM2PfpavJ4CGZpVe9QCNawTSc+qUGDrL5Nm7pDq74rrG/kSpRg1iPRX2tV4s1LiDSj06o5JL7E9OVBmw2j0xf66HM4uR8E8bIKO2mC1Y0SXCmGB60lyJeB+lNvTqQJz6x297l8/PO66IgtGvP7b8x+DGmWk7tLIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ChFbGFRK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ChFbGFRK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750672866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cg11dcRkqMpCTj1960kW5hmHn/C5yTPB14wnt8MXdok=;
	b=ChFbGFRKaOJJHVYPTldcf9QV5yPUJV1hOkDhmnXaM976yQHmkzc2tfwNL0jIvdg0w8a3MD
	b7B9/hM6O+MSsaQ1FAme/mMGI1tXkJ2/BgubQiPUOSIFvmIdiWZmEDmbkZ3wFD/rHMcWO4
	naBtwzrpyPhNgj0HGyH+DCnj7yx9AiY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-s3-KPWdZPOWvURsUnAY4IQ-1; Mon, 23 Jun 2025 06:01:05 -0400
X-MC-Unique: s3-KPWdZPOWvURsUnAY4IQ-1
X-Mimecast-MFC-AGG-ID: s3-KPWdZPOWvURsUnAY4IQ_1750672864
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a585ad6726so140224051cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750672864; x=1751277664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg11dcRkqMpCTj1960kW5hmHn/C5yTPB14wnt8MXdok=;
        b=ZDjmKR6mtjAAeVnZNUwGDcRWHV/c3m7Sute/VVme1jqLqH24FYJGPmvGKd4TftXCWc
         6vwZrWhP3VD3Bw1Ni8gF0Xs3R+WQikmQil7pdEof1pviCvb0MiMxYvNg/8Q7uWweQcPr
         1E4O2lra/h9Vw1FDhyxgfRuOLczM/4YVAgF4pR+fVR4cZlMvugTgOpnwIuhKC90CjV6X
         y5/Vbj/S9YqW9FDdi3w2eaBk4bmMNfgIP/MmLogsMMrOEccaDXbxXqsp/5YwiElpOfrr
         bk7DhD+M6E8ZuJ7owYj7/WeMztJ+BilrUiUU1DPQelgDAJ2XDee3OicrDY5w2mdPCZwo
         5Bkw==
X-Forwarded-Encrypted: i=1; AJvYcCWLyJdi+ABPoaCyA6AsJA5HoWJeN8i8ma8U6SUHRcrvagyFkpiuyFjuALQH4gPeZFWlUxH8hIQo8sSgyCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHf3jmoHeQ1X6fhcc7IKicdlzYg5+e+5hxkEQfkokFlggaBpg+
	d55P5A3Nis7wNoaV599R8ZeLKND+vKsN1j5MblzfexFkg7T2iFrSDod/GmJXHmoMegNRKlr3ez8
	+Ep2yX1wfXK+jAJqwv5za6CY1qTmJuEkJgSex1VxDKvQBco3UKhde+BPDNe2ltWlqxw==
X-Gm-Gg: ASbGncv5Fzuw0NZFol6/dY9F6eGrPGGz9GPriJTGGGJe/wNBj694DdBITYV5zbX1qSy
	B21GXINdHzCYgk1OgPXqb8CmhMAl4eWjpi6w9pm7g6okJSSt+EQgVWzYbLEWIYDErD6OdPpWAvV
	AcaySWdN5AOFGPe7Ilq7UMlmEDIVB+Z4HgbFRJTzO7hiZqpznfC8P4mabsH8Zpk1YQryelfE/lw
	QLlNhjdXVmt9zSSrqKGu62KSpUppVO8CCcBE163L9DPfsoP68hU5INCbgtNepOY+6AoJPcUqKEe
	h2bR9m8PkllERQ/1vWNGYW0gpOk0
X-Received: by 2002:ac8:5903:0:b0:4a7:693a:6ae8 with SMTP id d75a77b69052e-4a77a25763fmr190862311cf.52.1750672864631;
        Mon, 23 Jun 2025 03:01:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXzLpFhw4QDvJz+bsfP+zBCHk665drBIUKJoN12gXU74K8bXpg+kpWK89icqArO8RccMpeNw==
X-Received: by 2002:ac8:5903:0:b0:4a7:693a:6ae8 with SMTP id d75a77b69052e-4a77a25763fmr190861721cf.52.1750672864007;
        Mon, 23 Jun 2025 03:01:04 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.202.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d4e5d5sm36886681cf.7.2025.06.23.03.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:01:02 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Cc: Andy King <acking@vmware.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	George Zhang <georgezhang@vmware.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Simon Horman <horms@kernel.org>,
	virtualization@lists.linux.dev,
	Paolo Abeni <pabeni@redhat.com>,
	Dmitry Torokhov <dtor@vmware.com>,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: [PATCH net] vsock/uapi: fix linux/vm_sockets.h userspace compilation errors
Date: Mon, 23 Jun 2025 12:00:53 +0200
Message-ID: <20250623100053.40979-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

If a userspace application just include <linux/vm_sockets.h> will fail
to build with the following errors:

    /usr/include/linux/vm_sockets.h:182:39: error: invalid application of ‘sizeof’ to incomplete type ‘struct sockaddr’
      182 |         unsigned char svm_zero[sizeof(struct sockaddr) -
          |                                       ^~~~~~
    /usr/include/linux/vm_sockets.h:183:39: error: ‘sa_family_t’ undeclared here (not in a function)
      183 |                                sizeof(sa_family_t) -
          |

Include <sys/socket.h> for userspace (guarded by ifndef __KERNEL__)
where `struct sockaddr` and `sa_family_t` are defined.
We already do something similar in <linux/mptcp.h> and <linux/if.h>.

Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
Reported-by: Daan De Meyer <daan.j.demeyer@gmail.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/uapi/linux/vm_sockets.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/vm_sockets.h b/include/uapi/linux/vm_sockets.h
index ed07181d4eff..e05280e41522 100644
--- a/include/uapi/linux/vm_sockets.h
+++ b/include/uapi/linux/vm_sockets.h
@@ -17,6 +17,10 @@
 #ifndef _UAPI_VM_SOCKETS_H
 #define _UAPI_VM_SOCKETS_H
 
+#ifndef __KERNEL__
+#include <sys/socket.h>        /* for struct sockaddr and sa_family_t */
+#endif
+
 #include <linux/socket.h>
 #include <linux/types.h>
 
-- 
2.49.0

