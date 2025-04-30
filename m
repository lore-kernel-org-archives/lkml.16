Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BAE221FCF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746054919; cv=none; b=oPpkh2d3byQXRsMXyI7CzOlz9+xgsqBFXRvTcPI5JbIz1WYI9ouvPyeoEtBBcAS1CioxuXKl9wPS+9NRrpiFJ213CXDrqXvo/xGmC+XDzkhsRIYtGtH6nB7gRD+jNk8pThkbkjzOmdNN/+lZBv+cs4H7Ug+XBHjh7XDGD3lL79U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746054919; c=relaxed/simple;
	bh=1gkvdFh4jhIrw/MBMXml2s/AX8PO3PV1u4aAhoqRtV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mx4Ur7cZxFFV2WlBVYC0o31vV4WTr1xLvenUq3HpKb8Eah4GU8zxYXKQ4b0U8UaE2B/mvjdRUelnZU2ytSfAmS9umfkM6Wx6M13J5DLfqaJMHOld1U+IiXYmixN/WOuQhJvKfM+fBUF9xbXffw1Czcy743tK/TdS0i9wB9vIatg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UY324YwQ; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UY324YwQ"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5b2472969so36235585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746054914; x=1746659714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qevg+gR/jQXOKEn18MBQyQWDOgs+/lqx3wMxZN8WKs=;
        b=UY324YwQkpa5PE8XyPxuV929zu5EBhgSwBbl9DRzLcDutA0BgRJz5wSR84Fqmi1uR9
         uZ+ExucShUBpu+MfPfauehGPNnUxSAnr0KAo6m3Bse8LFJJZkpnij13ljZG2FbnsLcP8
         M7o9QKcQynqnws0eEUU+rDdz/qyhXaxBHIAGhZ6KrIYmUK8llHIHawO5sjJ4QUUN35pY
         BeEJv1FQLJ0wb5ggUT6/stMqzOqs8+Fpy/tzOIywQA7qbfwzjaFZWCdPtkVlEKWHjelL
         jxDSNK18CHs9aqu/OaYHp3mFxeoos08NsZoixGvJv0LkQjfv2CL8NXP87r1wstJ+l5ui
         MHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746054914; x=1746659714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qevg+gR/jQXOKEn18MBQyQWDOgs+/lqx3wMxZN8WKs=;
        b=lomfuxEFDFlZoperBMKjKLXt9MRkvHA7B05ooAcuafG5uTYKLC+QGSkAGwmFzgp329
         aFD4Gi1SgJlQ+ZkVfwQF9XA6CC1LR580z8WU+/GRwcgjkt1bdyjdM1yl357b0Vm7jhBT
         9Aun44QLoUR/+kuzq89+fydyhu+h2Ed3yBH54EgY4w6HTXmXLqZfpZFksHrO+3cuiKrF
         ZhRSSe9bv/N1Mlw8DWw+peI5EFQdzWrD5mAxj/eiWkHlu84A9Q4BTY4yZysP6Oa0/ql+
         VkmZU2Bw1eHTT13dRme0yoABTTlXEb/BQf06pztDD3IefyXn8OqAd5LIs2og1m1J+Gsl
         UMXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtHnrBbzJ0EDx+QCFJdmkYTbnPM/EQT/+t6VW9dE0cN9i5hi4sY0KBCcmr0bkJH/6zz9FoMn7dMJHaNAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVYdmEOSd6n0z5iLX4wAw0SRetXP+0QrhnXitPUNa2gqDFOXrQ
	oM6RjpsNiU7C+vhIh/mJq/W7MZmyHhqJREcS6pLoFiumsyK2S5Gr5Xpfqh3zkks=
X-Gm-Gg: ASbGnctSdae1gajMQTfKzkzJwU7GDQdg19k5mWtHxE8Nw2awPWo1BQfsu44jahZ2FKZ
	tC3FaBq5yU4A0joQ8lt5JgldGCvzrVDiuW0+n0zrH7GodhOzgLwI/oNgj5x3JDks1ac4/WdefJ3
	P9HA4CWW/WwxNC772TkubTjpSJ3qdkYlsKfgtcs2qucSuO4kE4hAQWicnWxpOktBmrHTevp2xaS
	EfJR81IoiIT9f5s+0tcPke6MouZ/HyXKYLx15XC7aBpHbaNjV+fESu/AjYEg/Y8kp4B18W64hsO
	sySafU0HeQGMV0bUEw7OX11II0DFXvvvcxD+4dYW+/CckNE8b7/XttWhAFbwEPiOzNXv8UEyIAI
	+5+ypm2I8tLVoGuyOj3ae2/pGjtTu
X-Google-Smtp-Source: AGHT+IGav1geRgSf7A2vLf5AOwcdw9lUMaP9D7RnYvq+QFvpuCaWOqmOKlfgU51P0IinAgHBqb/HUg==
X-Received: by 2002:a05:620a:6183:b0:7c5:5596:8457 with SMTP id af79cd13be357-7cac76d7ab2mr754502485a.57.1746054914481;
        Wed, 30 Apr 2025 16:15:14 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cacde764c3sm19538485a.33.2025.04.30.16.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 16:15:14 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	corbet@lwn.net
Subject: [PATCH FIXUP] cxl: docs - fixup cedt.rst reference in access-coordinates
Date: Wed, 30 Apr 2025 19:15:09 -0400
Message-ID: <20250430231509.1298122-1-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430181048.1197475-1-gourry@gourry.net>
References: <20250430181048.1197475-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove additional acpi/ in path to cedt.rst.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/driver-api/cxl/linux/access-coordinates.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/cxl/linux/access-coordinates.rst b/Documentation/driver-api/cxl/linux/access-coordinates.rst
index 24db5b41716a..77ba9be9af2d 100644
--- a/Documentation/driver-api/cxl/linux/access-coordinates.rst
+++ b/Documentation/driver-api/cxl/linux/access-coordinates.rst
@@ -25,7 +25,7 @@ asymmetry in properties does not happen and all paths to EPs are equal.
 There can be multiple switches under an RP. There can be multiple RPs under
 a CXL Host Bridge (HB). There can be multiple HBs under a CXL Fixed Memory
 Window Structure (CFMWS) in the
-Documentation/driver-api/cxl/platform/acpi/acpi/cedt.rst.
+Documentation/driver-api/cxl/platform/acpi/cedt.rst.
 
 An example hierarchy:
 
-- 
2.49.0

