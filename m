Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE602356DF;
	Wed,  2 Apr 2025 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593064; cv=none; b=EOLDby3hKHOF0wR41oZO1GrSbOSRkEmlCupj3dY41b+pdm6MaPHqqbvWlsnPpTTD91PZGSVDnueM6BgCL4QyLEDCcIo4DbTrsdDeoie2GVzJBk8xFia+5Wz9ioK8g2/p1dnx79+r10tzedxXjC4Xmnbxsa6wn/mqBpVK+Wtj254=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593064; c=relaxed/simple;
	bh=73p/wTwfev2tcjoMCquBB87TbDvWfM+Y56RbnEPz3qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kYJT1b1uEvDDbTw3ZNf6zd/NFHVGi0Ix/WepWpErHMAWZVo9ZbQ+3DvzXq6yfSXAykaMjFaErNLqbouw8ULuJfcX5w+5KDBEw5010aZs0sBBuDfRAUUVDNuKCeXDzxXGNy+i+9za+slYaUH8xQPy/swUmwQcXnbdlIUF7WPgwU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LolnzeCT; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LolnzeCT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=2ERaQu54KYGFkx50hM6qIWLoD04DS7K1oXQsT484Kg0=; b=LolnzeCTTeM7ec0l28Q3rfhxRc
	iCKGv/i+XBsNAxqmDx86wyV0psEAbbqIPuNMfGKNaSACTnXGSnZKAX0ZIlSmk/Pc0AW7T6qqVQkAh
	RRjWE7DD++pv2etRGYliyrA/zMMiasCTHyijJKpAAZTZ9fpBfNVxPQbAV1aUUQFjDpsryef6jQ8O7
	FFYnl1qnjDNQHrckq0xtBmqic7D9E+zPxRsJYTPZvKSP6Gkf+TOs/hwr8/FGTOniiQ6L5ca+CBUKu
	uvfptV6CT6SFwDERxIj9mv7bURM3pHANo5F1qbS1If/iVn+FbZHi/XdRJGHY9RwY3Z3lLV/ms/Cpu
	xo9ukqtQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwCb-000000070eL-2dlx;
	Wed, 02 Apr 2025 11:24:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwCa-00000008sIA-1CWq;
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
Subject: [RFC PATCH 0/3] Add Software IOTLB bounce buffer support
Date: Wed,  2 Apr 2025 12:04:44 +0100
Message-ID: <20250402112410.2086892-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

With confidential computing, the hypervisor/VMM component which implements
a virtio device model may not have access to arbitrary guest system memory.

There are various ways to deal with this restriction. Enlightenments in
the core guest operating system can ensure that DMA buffers are shared,
or unencrypted, depending on the type of protection. But that does need
the OS core to support such new mechanisms.

Some IOMMU hardware now supports two-stage operation, where true device
DMA is translated first through guest IOVA→GPA page tables, and then
through GPA→HPA page tables provided by the hypervisor. Such a setup
works well enough for physical devices, but hardware designers working
on such IOMMUs usually 'forget' to expose details like IOTLB flushes to
the hypervisor, making it impractical even for 'trusted' software like
pKVM to snoop on the stage 1 page tables and permit VMM access where
such access would be permitted to a real device.

Implementing a virtio-iommu is another possibility, although such would
often have to be implemented in the trusted part of the hypervisor (e.g.
pKVM) *and* it would often have to live alongside the true 2-stage IOMMU
passed through for physical devices, with corresponding indications to
the guest about which device lives behind which IOMMU.

The simplest option by far is just to allow for a virtio device which
conceptually doesn't do DMA at all. It just has an "on-device" memory
region and does all its data transfer to/from that region.

In fact, this should basically already work for virtio-mmio devices in
the device-tree, as DT bindings for a `restricted-dma-pool` were defined
in 2021 which apply to *all* devices:
https://lore.kernel.org/all/20210624155526.2775863-1-tientzu@chromium.org/

The `restricted-dma-pool` DT binding doesn't specifically address virtio,
and didn't make any attempt at handling backward compatibility. If an
operating system recognises the `restricted-dma-pool` and does the right
thing, yay! Else, it would just continue to use system DMA addresses as
before, which may or may not work.

This series adds a VIRTIO_F_SWIOTLB feature to negotiate the use of a 
buffer region which is provided by the transport, and documents the
`restricted-dma-pool` option on the virtio-mmio transport. Then adds
a similar capability via VIRTIO_PCI_CAP_SWIOTLB for the PCI transport.

David Woodhouse (3):
      content: Add VIRTIO_F_SWIOTLB to negotiate use of SWIOTLB bounce buffers
      transport-mmio: Document restricted-dma-pool SWIOTLB bounce buffer
      transport-pci: Add SWIOTLB bounce buffer capability

 content.tex        | 12 ++++++++++++
 transport-mmio.tex | 33 +++++++++++++++++++++++++++++++++
 transport-pci.tex  | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
