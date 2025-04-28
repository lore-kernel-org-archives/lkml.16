Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F3826B96B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847007; cv=none; b=laPVQg0kTjspYjoxZ0+e82FHbfoX9hPIwvyo80SnMzuUJeJlpcFdMzpAwOwWshXXIAh/gogvvZJjjm0keDDcnJmj9p/Op12WoKm805S4IN9TbsZc4fihCwnqAHQExCl/iODSUNkA+KJH917NJaoMFt7HQKGUK8o3NiqlTT2tb1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847007; c=relaxed/simple;
	bh=Vq/h9KhZcA9eirkQVo2w4gLd0E7LXCueQL2GdN/mYMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=li7q6w7eDLclnaXHxDOiUuwQxhcJqf3wsfjmfIAHu6G2WviUpAT+O7HyAjI98k8cUWkDmN6O7A+r53iZLGvcvFjZdR9w5HlU+ReoZ6lvsjy2TzEXAWPDvtVdF+TumQD1siAGSvfT37sjpstcu75fUCtnY99HwzSFINwaLchXPzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=KH2/gudT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="KH2/gudT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso20718375e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745847003; x=1746451803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4n7WimzNe3yrtmY+n2a9ONyzIrADFV93Pw9AJqzK5yQ=;
        b=KH2/gudTriXTmHzNm7abSSdqkSCoDham0G0VtcrwLGSRyggObQrSGkT8GFmWyckCeC
         GSKLJYbA3xkEaFQ/GFtcPLYOOT2FPyO85J5mV+SyK3yo0qycCOlC2ASDk7CYm9YVYt0k
         kJhcGfMik+1jIihcb6/b06eTnGZxOQIWW1z5vNubS/hsnFp82lr8sQrGkmebcCv9sYQn
         wXw5VX3Ocpr2gnQyVyiK8S9NXP8p2KPprEVIJaswyTAxceKFPQIFivva7xAM+7rfaPvA
         gJm7jx2X+ATxZaa0hVAeqCmYXls7xnRK0Dh1bpAmEIcOIYGpZ/5dxXttERPbYNxR4kRV
         Tqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745847003; x=1746451803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4n7WimzNe3yrtmY+n2a9ONyzIrADFV93Pw9AJqzK5yQ=;
        b=vZvTQGvduhxQTWuZpgaawPiLl7xESMqvUUWiv6kbzK7MD+5XV6+007SJ0yZmJ1Z0q0
         weYoW1f4vjL4sM0Nrf5rp7jydEdhmzbgo7xlmazQ7+wevRP4HMT5zX6seYZxm7HvqfvC
         Cb81kMnsKPDpKWe7vWyITGvvzzLYpahDzg61Lj7DlXFr/4kuOPLdxwFZn2Y2sW8P3mA3
         9R1RCVTX22v7S2WXyAJf1OWwo+GxKRdwQQQjTGOJiqYutFbpdBAoW0fAVmU1J1DDmgu7
         ZrJRjyLBm87QDzqs0blCUyeCp26TYumZwepBwp6I4hvEgi3aGzFL5CEOEHPDoYBNhc1O
         W9kw==
X-Forwarded-Encrypted: i=1; AJvYcCVgs3rNpwI1usafLOI7pqEGnmleJUcGs2gX/5zUVMBc+LTGOSRJL6xwLabiR4DFyktYSXIk0/fmu8cRAfg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9D3P+wmDj1uIlubbAwkpVyS6gO3bI946XLsE7ELmDAoMCxmj+
	YnYHdFdEvoeCwC/VUStWadrI62dIbEmxulzQdtGQ4ye5N2/tZtRnwJ82MKtA3jU=
X-Gm-Gg: ASbGncv/hwJnvZ+ggu1egnq8aFCovScEUUsY+suLq/EVb8pJXQw+ICLIYazn/3IfZ8D
	oxmAu3tdTYcITIykUVWs7qLoWxI/hVwq4GPNqf1Tr3HvHw/9C+gbSxLnZqf86q9JJBA/tWwQHOn
	HrooY8Mbe3TBP+laQNl8LcdrQG62R3iLLhKNDCEu7psVyrPBWZFtQ9ilXYTswaTMFHSXI6Kfn8c
	vxzAdfWt6yBdmX1RN1Lwkav/MCKKz8SLnPpcYPiROho61xaEh/Z94G0gsZq1zXSVUAGKqCbxcwI
	i6EpU0ZJhaydVm2fK83mqQ3pB667aOUCcwl46K+jYol24N5Ook6Be+bQfOw9mKB3UnQ0Csz5rdu
	wTXA1n8k6sUdFejYgtGk2tvpz3vs9VtkJQzKgvG/9
X-Google-Smtp-Source: AGHT+IHzI5EcHrMeuZrsyAK5ccQBf+Ek+CN3wywl5J/YYH7X91D2dg9mc+ls3jyduRP3SI61g86XOA==
X-Received: by 2002:a05:600c:1d86:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-440a6347fe3mr104964505e9.0.1745847003302;
        Mon, 28 Apr 2025 06:30:03 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2e06d8sm159783145e9.39.2025.04.28.06.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 06:30:03 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] fs/netfs: remove unused flag NETFS_SREQ_SEEK_DATA_READ
Date: Mon, 28 Apr 2025 15:30:00 +0200
Message-ID: <20250428133000.3199729-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag was added by commit 3d3c95046742 ("netfs: Provide readahead
and readpage netfs helpers") but its only user was removed by commit
86b374d061ee ("netfs: Remove fs/netfs/io.c").

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 Documentation/filesystems/netfs_library.rst | 5 -----
 include/linux/netfs.h                       | 1 -
 2 files changed, 6 deletions(-)

diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
index 3886c14f89f4..7d380648e131 100644
--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -275,11 +275,6 @@ handle falling back from one source type to another.  The members are:
      This can be set to indicate that the remainder of the slice, from
      transferred to len, should be cleared.
 
-   * ``NETFS_SREQ_SEEK_DATA_READ``
-
-     This is a hint to the cache that it might want to try skipping ahead to
-     the next data (ie. using SEEK_DATA).
-
  * ``debug_index``
 
    A number allocated to this slice that can be displayed in trace lines for
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c86a11cfc4a3..d315d86d0ad4 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -191,7 +191,6 @@ struct netfs_io_subrequest {
 	unsigned long		flags;
 #define NETFS_SREQ_COPY_TO_CACHE	0	/* Set if should copy the data to the cache */
 #define NETFS_SREQ_CLEAR_TAIL		1	/* Set if the rest of the read should be cleared */
-#define NETFS_SREQ_SEEK_DATA_READ	3	/* Set if ->read() should SEEK_DATA first */
 #define NETFS_SREQ_MADE_PROGRESS	4	/* Set if we transferred at least some data */
 #define NETFS_SREQ_ONDEMAND		5	/* Set if it's from on-demand read mode */
 #define NETFS_SREQ_BOUNDARY		6	/* Set if ends on hard boundary (eg. ceph object) */
-- 
2.47.2

