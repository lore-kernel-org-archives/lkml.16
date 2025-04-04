Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA1D1A9B49;
	Fri,  4 Apr 2025 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759582; cv=none; b=pnJeyPoSUlv4baw4hdVAXy65W+9m1Cog4oAvFciNVYP/ltqxqeKRTsB8URVftXhw2zMVPHiX8dnpzi1bCcgz3PJ+30mBfOo62ESP60foQgAo+EXRmG8XSwVHZ3Rlo+oNX9LHUrBDBR7nuDq51pZBdaus7Mn4FFSad8GH0C4tdmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759582; c=relaxed/simple;
	bh=eI0pDZzwTHzHhiPpLrvB9SxVToa1zUT3EqskKkeIA1s=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=F+QRZ/qU8GTIQfD/nj6fGh/vR+2aL4y6vXX6r2UabSxpxLbsldh/hC6GpuJ2tP0XPG9Vu34CwN2E6v+OxOmSkKKh3kYiXf8DSNgPR6TfIULN0jx9H5atW85IRt/b3i6fgObPIQ+51TNqq9fSxynYZP30BoeYUO5Qt7a3zlXvrxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=M6BIRk4X; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="M6BIRk4X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GWI8VEWmOz0N6I3kxJsh/12WWavgWVMZDb3oXygH9Ac=; b=M6BIRk4X1M3h2puaRJ1tEAhVRO
	t53sXuaN0xS232VVZHz3+wG6hW0qWZivFY/8AC3Gig7CeS0OCjIZ0WJIFSpkxZZ1bU2CIZUhZUUFZ
	0zW0+LT1Y3JxeAIgC8FZQ5KjjRNGcuU0XSQONtfC3uHKMov2da5B5yavAXOlZfPFyVo8Q5x6iXUx8
	EPQARInu/oZlkzGRiU3EVFVZfuSdWHLUKPgxvTwlxHc00niu50w1OZDM6KmygMdJlGMoX8BSGvGyV
	iaeTVi8t/EGOgfzKrDr09l1LFLLA9CDLH0o5lY3VCIYy0sVK0VA6vBkJhUbaloVB4AxPKTNl48+Tp
	44OdKoSA==;
Received: from [193.117.214.244] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dWR-00000007NJR-3eod;
	Fri, 04 Apr 2025 09:39:36 +0000
Date: Fri, 04 Apr 2025 10:39:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
CC: virtio-comment@lists.linux.dev, mst@redhat.com,
 Claire Chang <tientzu@chromium.org>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?ISO-8859-1?Q?J=F6rg_Roedel?= <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 graf@amazon.de
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_1/3=5D_content=3A_Add_VIRTIO=5FF=5FSWIO?=
 =?US-ASCII?Q?TLB_to_negotiate_use_of_SWIOTLB_bounce_buffers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Z--W_JagTSyhYqzk@infradead.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org> <20250402112410.2086892-2-dwmw2@infradead.org> <Z-43svGzwoUQaYvg@infradead.org> <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org> <Z-46TDmspmX0BJ2H@infradead.org> <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org> <Z-99snVF5ESyJDDs@infradead.org> <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org> <Z--W_JagTSyhYqzk@infradead.org>
Message-ID: <3251F79D-4838-4C89-80BF-6EB19076833A@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 4 April 2025 09:23:24 BST, Christoph Hellwig <hch@infradead=2Eorg> wrote=
:
>On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse wrote:
>> I do agree, this is fundamentally a system issue=2E In a CoCo model, it=
's
>> non-trivial for the system to allow *virtual* devices to do "DMA"
>> because that actually means allowing the VMM to access arbitrary guest
>> memory=2E
>
>
>> So "for the emulated devices, just use a device model that doesn't do
>> arbitrary DMA to system memory" is a nice simple answer, and keeps the
>> guest support restricted to its *own* standalone driver=2E
>
>It's also one that completely breaks the abstraction=2E=20

Hm? Having a device that simply doesn't *do* any DMA surely doesn't break =
any system DMA / IOMMU abstractions because it's no longer even relevant to=
 them, which is kind of the point=2E

Which abstraction did you mean?


> I still don't
>understand what the problem is with having the paravirtualized devices
>on a different part of the virtual PCIe topology so that the stage2
>IOMMU isn't used for them, but instead just the direct mapping or a
>stub viommu that blocks all access=2E

It can't have a direct mapping because the VMM can't access guest memory=
=2E It has to be blocked, which is fine=2E But that's only part of the pict=
ure =E2=80=94 then how do you actually get data in/out of the device?

By having on-device memory and not attempting DMA to system memory, perhap=
s=2E=2E=2E? :)

>> What's annoying is that this should work out of the box *already* with
>> virtio-mmio and a `restricted-dma-pool` =E2=80=94 for systems which are=
n't
>> afflicted by UEFI/ACPI/PCI as their discovery mechanisms=2E
>
>Yes=2E  And the fix is to get the equivalent to restricted-dma-pool into
>UEFI/ACPI=2E  That gives you a portable and device-independent way to
>describe this limitation, which is much better than hacking around it
>using an odd device model=2E

It still has the problem that existing drivers in all operating systems pr=
oduced before 2030 will see the device and try to use it as-is, with no com=
prehension of this new thing=2E

