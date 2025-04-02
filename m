Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BED12376F2;
	Wed,  2 Apr 2025 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593065; cv=none; b=TuPYpJxIZsOs+U+wTT7SSoTYmHAa/kWj3Sld+44JaO1KTnotM31u8ZyzNYENRVV8buRSmzllA0ya3Ulg+uHF1PL2UT3wUK9ks/jBzfq3rnR5d3DcNZ2tq912tHZSHlO+UX77CPhhTv0a1ccELz2eALezyNc4CtVkahifF5SLaHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593065; c=relaxed/simple;
	bh=WSByO3ny/cr8sBI7EAUdzcVer0QodMHBvGSJaZ0OCMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQRq4r+yVJFvJu+uAX6jlUHEYtsNcgSDPtRc6eA1AIP3QnMCLdr+F9OCjc5aEYMHCcfHZqnIGowG5k6C7zhGAAEkgQC7Qem1LokHzDTEaiwRwTlxIaX6REt2ZwfQY3W8z7WmYZW0z00pvwSj7C5p3Obtbi5NY8gnu2rNt5M1YEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JcmpEGmG; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JcmpEGmG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=kxrjLG1EvxP2WljkVi3c+txcSSC1Kui2MooC89w1RMI=; b=JcmpEGmGhheVjVIaBCuFCpTKTa
	G9Qc2MJXOnHZGDjcq2pqxf80FxTq1vckDKdhbXWk3UK+erTMP8GsqO+D2/4vEm9L/O/EoIoOQ2I04
	0J+aQtRVwWUXlru7FI36sGgjIWhckBvE/ajnIfQ13EfVxWncVlmx4ShGSfTXI7t6+QK8RU1PEiygb
	Eqz4OiAQqk7U/nRRmleygw5yM6f344Z9Axy5vD52o24lubce9r0oCWym49F+NXD+ucideRFDj6AlT
	QJyC0Kxo4pMpU/tP93fK/16NLmbxxMF4qHLwnlhelw1CcQyoc/hcsurxAMsE2YPthOs8rtN/RUQFH
	23SPrOhQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwCb-000000070eN-2dkH;
	Wed, 02 Apr 2025 11:24:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwCa-00000008sIT-23wY;
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
Subject: [RFC PATCH 3/3] transport-pci: Add SWIOTLB bounce buffer capability
Date: Wed,  2 Apr 2025 12:04:47 +0100
Message-ID: <20250402112410.2086892-4-dwmw2@infradead.org>
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

Add a VIRTIO_PCI_CAP_SWIOTLB capability which advertises a SWIOTLB bounce
buffer similar to the existing `restricted-dma-pool` device-tree feature.

The difference is that this is per-device; each device needs to have its
own. Perhaps we should add a UUID to the capability, and have a way for
a device to not *provide* its own buffer, but just to reference the UUID
of a buffer elsewhere?

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 transport-pci.tex | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719..23e0d57 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
 \item ISR Status
 \item Device-specific configuration (optional)
 \item PCI configuration access
+\item SWIOTLB bounce buffer
 \end{itemize}
 
 Each structure can be mapped by a Base Address register (BAR) belonging to
@@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
 #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
 /* Vendor-specific data */
 #define VIRTIO_PCI_CAP_VENDOR_CFG        9
+/* Software IOTLB bounce buffer */
+#define VIRTIO_PCI_CAP_SWIOTLB           10
 \end{lstlisting}
 
         Any other value is reserved for future use.
@@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
 The driver MUST qualify the \field{vendor_id} before
 interpreting or writing into the Vendor data capability.
 
+\subsubsection{Software IOTLB bounce buffer capability}\label{sec:Virtio
+Transport Options / Virtio Over PCI Bus / PCI Device Layout /
+Software IOTLB bounce buffer capability}
+
+The optional Software IOTLB bounce buffer capability allows the
+device to provide a memory region which can be used by the driver
+driver for bounce buffering. This allows a device on the PCI
+transport to operate without DMA access to system memory addresses.
+
+The Software IOTLB region is referenced by the
+VIRTIO_PCI_CAP_SWIOTLB capability. Bus addresses within the referenced
+range are not subject to the requirements of the VIRTIO_F_ORDER_PLATFORM
+capability, if negotiated.
+
+\devicenormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
+Transport Options / Virtio Over PCI Bus / PCI Device Layout /
+Software IOTLB bounce buffer capability}
+
+Devices which present the Software IOTLB bounce buffer capability
+SHOULD also offer the VIRTIO_F_SWIOTLB feature.
+
+\drivernormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
+Transport Options / Virtio Over PCI Bus / PCI Device Layout /
+Software IOTLB bounce buffer capability}
+
+The driver SHOULD use the offered buffer in preference to passing system
+memory addresses to the device. If the driver accepts the VIRTIO_F_SWIOTLB
+feature, then the driver MUST use the offered buffer and never pass system
+memory addresses to the device.
+
 \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / PCI configuration access capability}
 
 The VIRTIO_PCI_CAP_PCI_CFG capability
-- 
2.49.0

