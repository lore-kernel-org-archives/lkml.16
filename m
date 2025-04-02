Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8200230BF1;
	Wed,  2 Apr 2025 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593066; cv=none; b=MN7jLS2dPMRtpK8cpJGjCtlG/4jPOLnOaHdXt8hlKeaEcUivMDWZoQexf7GvdmOeewq/wRIhXb5mF6zYJxMvAP9RhlWQb9kCZYOG8Q4HBn5K+9hIM3TgGwXjJovo646dPsGEhD7Tl3j+R/IHo6xZLJONI6pn2zlJDEs8kKH35mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593066; c=relaxed/simple;
	bh=jf5CojdeST3TNkM95k70JY0ej5/VdqX1yFYSmEvypE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYBEhTh7ALE1ARP92xrhbnB1rAABedb4ynFjkKNsDgwynmJdFROFw9hv4I2hbvVTvgP/YHVMn3XoHU4b5mqwsbYK308WLDPeIYTfexEu7+2pqeCT/RnSfdw41oWsiwNKp1pODlVEVVOVJXjfXJ3uXX7dKbEnoEcIUSLYmXZCjQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AM0lQWsI; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AM0lQWsI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6OwXAlJh0Aw9RERuSqgygQLxxN6Qq/DyOWZqyQFFVAM=; b=AM0lQWsIGRtT5vjstSm1/NMqCA
	BZZxNJHJ4LsIfE4vxcnCBwC6JZzdmJhTWZI0xZ8SXbL5ya/god+ex/1JN4i0ZvKHMqeCKrKjPD0Im
	5EiLdf8pwjjQhoGkmaTV8oUee/wK9XpXk3VXyeY5MCLOgTy4f4ITK8yDWyrgpp+FTsBfOUmndTTMw
	wb7ToNO0+kjvgS8iJpE3HV/FFFzo7wgcxNFNH2tZC2atxAMtC4ac8AgelYArG9SOb6bp2SKeRYOHU
	UjHBhRecd76uyBxTkS5c/jq1R2dLYsGpZln9Ococ8OFyKDmqrSLGhygG9AMrIkJNW5ZALhZKvzuZs
	4DY6TVEg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwCa-00000009Lex-3222;
	Wed, 02 Apr 2025 11:24:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwCa-00000008sIO-1mCG;
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
Subject: [RFC PATCH 2/3] transport-mmio: Document restricted-dma-pool SWIOTLB bounce buffer
Date: Wed,  2 Apr 2025 12:04:46 +0100
Message-ID: <20250402112410.2086892-3-dwmw2@infradead.org>
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
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Add explicit reference to the `restricted-dma-pool` DT schema in the
virtio-mmio transport options, and define its relationship to the
newly-added VIRTIO_F_SWIOTLB feature negotiation.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 transport-mmio.tex | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/transport-mmio.tex b/transport-mmio.tex
index 94a93a1..300783c 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -26,6 +26,39 @@ \subsection{MMIO Device Discovery}\label{sec:Virtio Transport Options / Virtio O
 }
 \end{lstlisting}
 
+\subsection{Software IOTLB Bounce Buffer}\label{sec:Virtio Transport Options / Virtio Over MMIO / Software IOTLB Bounce Buffer}
+
+The device tree binding schema defines a ``restricted-dma-pool'' region
+which is intended to be used as a pool of restricted DMA buffers for
+specific devices. This allows devices to operate without DMA access to
+arbitrary system memory addresses.
+
+If a ``restricted-dma-pool'' is present, as in the example below, then
+bus addresses within the referenced range are not subject to the
+requirements of the VIRTIO_F_ORDER_PLATFORM capability, if negotiated.
+
+\begin{lstlisting}
+// EXAMPLE: virtio_block device with SWIOTLB bounce buffer at 0x50000000.
+restricted_dma_reserved: restricted-dma-pool@50000000 {
+        compatible = "restricted-dma-pool";
+        reg = <0x50000000 0x4000000>;
+};
+
+virtio_block@1e000 {
+        compatible = "virtio,mmio";
+        memory-region = <&restricted-dma-reserved>;
+        reg = <0x1e000 0x200>;
+        interrupts = <42>;
+};
+\end{lstlisting}
+
+\drivernormative{\subsubsection}{Software IOTLB Bounce Buffer}{Virtio Transport Options / Virtio Over MMIO / Software IOTLB Bounce Buffer}
+
+The driver SHOULD use the offered buffer in preference to passing system
+memory addresses to the device. If the driver accepts the VIRTIO_F_SWIOTLB
+feature, then the driver MUST use the offered buffer and never pass system
+memory addresses to the device.
+
 \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}
 
 MMIO virtio devices provide a set of memory mapped control
-- 
2.49.0

