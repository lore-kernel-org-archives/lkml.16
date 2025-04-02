Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDE52343C7;
	Wed,  2 Apr 2025 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593066; cv=none; b=IgzTiAaBDo59O0BIYJ8Iemb6rk/JFLHZymilmDb+3T/apXmWHeiXeQ11HDhtpnxJzLBgGImPmyZKZPlNNt5Sqn6zj4ePoGuZo0pLHSI3qrHQfvccIo9DwH38BkDY/QOG+D8HHdjSw6jMCh0EwzH8xij3+G6Yk0ud3J9yHwCsXJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593066; c=relaxed/simple;
	bh=gWsC5lSSpCl3AFsLNF0y3hh4t8zumhmtHvAcZjPfZpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0a+eKF8InMNVCMyVxiTQXUbT49E1bHdOS+QMSRhWVYv9zvSPTYE4CteKhgjyjZv/YKZ9jMMj1ILvT5hJEhbbQfDojLoIf9evwcNmODfaDG7jwjOLxsf8GgxOQAKBX0U6Pc730NnSlyoDv3aKs6ETclSuSqmWjwcFoIapF9bnrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pwQLI+sZ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pwQLI+sZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=dR5yqBxOY1y00T3cS+kzt6VXjNRVa+xGn9VwL1PqD0Q=; b=pwQLI+sZCyUVReTVywnobEOMiR
	7dqbFuGbqlV+D3xbpRsxE9ETZgtnjuhfSfZbtWT3sYJllAJE8Mty9cvP+P9UndVttjm0FPP6rNQBo
	r0TtClFvUKk6y3TFUkK77eFW6dw+iQMRzAsGbnbuphEN5M0XXtW1q4M7U8vh7xhYmYav4IVJxn9sq
	0xgy/WmZ9a5kitUplKZkuw/qLIGyK9aLQcul5Ig4w/dtsAyhvN7wHn4oxDGdp62AkqIsvZAZeNUgH
	hL8jU2mQELeFSLaIz7o4Z9dMvCHxaMu9bv/ezmjIbedfL41XnoVleDtlOCLpMK9db/UN3N1MwlG40
	MOPvwpCA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwCb-000000070eM-2dhn;
	Wed, 02 Apr 2025 11:24:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwCa-00000008sIH-1UIn;
	Wed, 02 Apr 2025 12:24:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: virtio-comment@lists.linux.dev
Cc: mst@redhat.com,
	hch@infradead.org,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?UTF-8?q?J=C3=B6rg=20Roedel?= <joro@8bytes.org>,
	iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use of SWIOTLB bounce buffers
Date: Wed,  2 Apr 2025 12:04:45 +0100
Message-ID: <20250402112410.2086892-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402112410.2086892-1-dwmw2@infradead.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Device-tree bindings for `restricted-dma-pool` were defined in 2021, which
allow devices to be restricted to a given SWIOTLB pool instead of allowing
DMA to arbitrary system memory:
https://lore.kernel.org/all/20210624155526.2775863-1-tientzu@chromium.org/

This facility was not specific to virtio-mmio, but does apply to it. No
attempt was made to ensure backward-compatibility for virtio-mmio devices.

Define a VIRTIO_F_SWIOTLB feature which allows the device and driver to
agree on the use of the SWIOTLB, if present. This enables the device to
refuse to operate further if the driver does not support the SWIOTLB
requirement expressed in the device-tree.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 content.tex | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/content.tex b/content.tex
index c17ffa6..63d075f 100644
--- a/content.tex
+++ b/content.tex
@@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 Currently these device-independent feature bits are defined:
 
 \begin{description}
+  \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that the device
+  transport provides a memory region which is to be used for bounce
+  buffering, rather than permitting direct memory access to system memory.
   \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
   that the driver can use descriptors with the VIRTQ_DESC_F_INDIRECT
   flag set, as described in \ref{sec:Basic Facilities of a Virtio
@@ -807,6 +810,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
   the driver. When clear, this overrides any platform-specific description of
   whether device access is limited or translated in any way, e.g.
   whether an IOMMU may be present.
+  If a the device transport provides a software IOTLB bounce buffer,
+  addresses within its range are not subject to the requirements of
+  VIRTIO_F_ACCESS_PLATFORM as they are considered to be ``on-device''.
   \item[VIRTIO_F_RING_PACKED(34)] This feature indicates
   support for the packed virtqueue layout as described in
   \ref{sec:Basic Facilities of a Virtio Device / Packed Virtqueues}~\nameref{sec:Basic Facilities of a Virtio Device / Packed Virtqueues}.
@@ -885,6 +891,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only physical
 addresses to the device.
 
+A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it MUST
+then pass only addresses within the Software IOTLB bounce buffer to the
+device.
+
 A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
 
 A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offered.
@@ -921,6 +931,8 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not
 accepted.
 
+A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not accepted.
+
 If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
 buffers in the same order in which they have been available.
 
-- 
2.49.0

