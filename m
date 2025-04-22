Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A00F27BF88
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321534; cv=none; b=pr1eQYRnb+m+wqtGcHeCJTcuGKGtaSp+v1Tjxbn0QViLfQUfTcKlh5aGU9twAuxB9XDS/joW7/HtKPoYS/JlsxegS/stmN1HmhZoifFYP9gbasjqTfZHaEhn6AwavRFo8ETP/Bk7tojmoXPdhW2V3ljMiyO87+8DswCuD6PVe+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321534; c=relaxed/simple;
	bh=77SsVYWuM/VKw745eTt7XZiY8OVqpjtPtbXZoluNZCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOEvx6/Se07q18hVwSJxE03SFrP5rL/U7AxHM4J1/VxynabxLfHRB3c9bFg1HQ2UZDiJ/vESjf/wCAgOhhLn89S4fCP08qGXtLrtlkc4RMCcDaFMuukvsfvuBDCm3rVAESD52+9bPSWWO9ws21QWEpxCknMxGmNL31B02bHCiUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ChoNHSAN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ChoNHSAN"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1efc457bso3052394f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321531; x=1745926331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz8AL0iQ82MjjwyNSE/OrISLUcyy+9C9mt1QGnHDFhA=;
        b=ChoNHSANGbbOdrD0qv4fFnCCatR00mkWLDvRVz61Btj/D6dFWmsHPAoPGJZCJSRINy
         MnFebIkRnX1Yx00Ea6ZbguWpkgkNiAYGrTdfx8O1K2OC7L4P4P6z5UeFGuLGDjH/5uDr
         W9QTtWPECajqrxZB02T4ISgJWBaHDhgPqOKSk/Tssh1S6CWmIrWJEcMAh0R1PxLzLcfF
         Pz9wgNT/Sg/78BMbNB5KbiBfYoEkChUKY5zVFyqTkqCTCK35Qas1M2MwT4JTpBgRMMtg
         aBioSp0LuuoXA9ZRcjrDUSjXtldc95HJ73FEkTJxDg7oE4ocHNLziuC95U4oGkcmKnA1
         qzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321531; x=1745926331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qz8AL0iQ82MjjwyNSE/OrISLUcyy+9C9mt1QGnHDFhA=;
        b=bGmaywZvtMSKGKqYC4VW3rQQoTYIJowtC23gkizd0wZrKx+0KQuRB84d/qjiDb8JIy
         8KgOhJAxKNADW2eRO/zi2P4Dx1gaH82a+TYIblhEjOOahbZ9VWaYX3dl8ErrMNzD+IlK
         Gea46uFa8Syc7HS4/dx1IcH5/dPg9KI3pxZoY1MkFfQZ+LNnHyK2Qgecct1+AeXO0G71
         F+LALl7jx35EduUp0bMPk7MsXP0/L0/mNkfSjjlgNdHQkii6rAEfRhK4R4QOPircFPek
         gFy6xn0jY15mqspAkuPExQMIFy+C5Sd6K3aVy7HYQCrY0csFT8iV9wRMMexEsRDIn4z1
         pljA==
X-Gm-Message-State: AOJu0YyqNwpiru4RCdX/HGMaNhWWdjmy7OCBY4wROhSH4X4GtOH0S53i
	3/DjDKeqKBAd1OChAEE8mjmfHMMFqM34B49xFfnqW8ivWbjzFC9iAREUDrkXH14FOKgCGadryFS
	c
X-Gm-Gg: ASbGncsR3nHMq7PRRPCkGNMS5x+NAH0y+TdTG+4lckntFVWqE3IfF5jpeEie5ZXrQ7s
	pfi2Hk3Q03hv6DBY9q9YbzM9r8IjTV+ocNHQv0vf4kBvQdbk4AaTBNYkewCiAD6urK0Tle/pt0B
	1Le1kv8z7uhccNJmtkba0M+H5hcnRPwGxpJaAIWLxX2xQ4bghjBYljzW1wZJt80N8xB/4DdViao
	133QtwIxp0fYlUu/qvpQVRr8NN6gQARvc700b1fSyPBYUecMcH7MWsYAnXLU77+p69RSqQkLRUl
	RXzC6+YtKWo9NNPP0TS13leMSpBhir1HacqFxPF1cseuU0wb0Kgx
X-Google-Smtp-Source: AGHT+IEfV3YGUN5j4yhdrrLJhy7BVF6BU0L6gVQPX9+sNcrdsbtuBIIBqNRd2hGHUQsMP3+8iBWGbA==
X-Received: by 2002:a05:6000:2403:b0:39c:1f04:a646 with SMTP id ffacd0b85a97d-39efba45f64mr11816104f8f.13.1745321530764;
        Tue, 22 Apr 2025 04:32:10 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:10 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 01/14] Documentation: add kmemdump
Date: Tue, 22 Apr 2025 14:31:43 +0300
Message-ID: <20250422113156.575971-2-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 Documentation/debug/index.rst    | 17 +++++++
 Documentation/debug/kmemdump.rst | 77 ++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 Documentation/debug/index.rst
 create mode 100644 Documentation/debug/kmemdump.rst

diff --git a/Documentation/debug/index.rst b/Documentation/debug/index.rst
new file mode 100644
index 000000000000..9a9365c62f02
--- /dev/null
+++ b/Documentation/debug/index.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===
+kmemdump
+===
+
+.. toctree::
+   :maxdepth: 1
+
+   kmemdump
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/debug/kmemdump.rst b/Documentation/debug/kmemdump.rst
new file mode 100644
index 000000000000..dfee755a1be1
--- /dev/null
+++ b/Documentation/debug/kmemdump.rst
@@ -0,0 +1,77 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================
+kmemdump
+==========================
+
+This document provides information about the kmemdump feature.
+
+Overview
+========
+
+kmemdump is a mechanism that allows any driver or producer to register a
+chunk of memory into kmemdump, to be used at a later time for a specific
+purpose like debugging or memory dumping.
+
+kmemdump allows a backend to be connected, this backend interfaces a
+specific hardware that can debug or dump the memory registered into
+kmemdump.
+
+kmemdump Internals
+=============
+
+API
+----
+
+A memory region is being registered with a call to `kmemdump_register` which
+takes as parameters the name of the region, a pointer to the virtual memory
+start address and the size. If successful, this call returns an unique ID for
+the allocated zone.
+
+The region would be registered with a call to `kmemdump_unregister` which
+takes the id as a parameter.
+
+Backend
+-------
+
+Backend is represented by a `struct kmemdump_backend` which has to be filled
+in by the backend driver. Further, this struct is being passed to kmemdump
+with a `backend_register` call. `backend_unregister` will remove the backend
+from kmemdump.
+
+Once a backend is being registered, all previously registered regions are
+being sent to the backend for registration.
+
+When the backend is being removed, all regions are being first deregistered
+from the backend.
+
+kmemdump will request the backend to register a region with `register_region`
+call, and deregister a region with `unregister_region` call. These two
+functions are mandatory to be provided by a backend at registration time.
+
+Data structures
+---------------
+
+`struct kmemdump_backend` represents the kmemdump backend and it has two
+function pointers, one called `register_region` and the other
+`unregister_region`.
+
+Each region is being stored into a cyclic array of unique ids called
+`kmemdump_idr`.
+
+kmemdump Initialization
+------------------
+
+After system boots, kmemdump will be ready to accept region registration
+from producer drivers. However, the backend may not be registered yet.
+These regions are being added to the internal list and pending backend
+initialization. Once the backend is up and running, all the regions are
+registered into the backend. If, for example, the backend becomes unavailable
+and is removed, all the regions are unregistered and kmemdump waits for
+another backend to become available.
+
+backend functionality
+-----------------
+
+kmemdump backend can keep it's own list of regions and use the specific
+hardware available to dump the memory regions or use them for debugging.
-- 
2.43.0

