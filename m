Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC4026289;
	Sun,  6 Apr 2025 18:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743965270; cv=none; b=GRHOMvjrLmZ3W1buPYc0r7Dqp4w13/Rezfi96wrSIu+KIAqpQ8K9OJkrmAZzVM5IOxtDpj+cccDw0uGmU2eyl2Xia60KimfCZtlhFLHrTR3AJYqW1V5AGEZHYh+dKif9Fk9esqkzNbhzkj8TFWC/oKZd3Aerdwox6a8w8NXLFLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743965270; c=relaxed/simple;
	bh=sC8ADKYE4LqMAZaGEZtrB+odLVH2dvbkCgo4ZplTpWQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=OEmciL7ddtXGSEYUrBpcwM0qIWSEJCbKeuxlL7pkOReaY2P/JthKFiXJK71Kmrs0JyZQ6BKxk++gLU0MoPfi7CAlwVn2OJ3TGJYrjeTfZwj3OqsPxjVc1wrv8h/8zUi/Xu0qeApwR2RhK+Xzh801Q9qRk4yd/clU/Z9iYESsq/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=B+/Us6MC; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B+/Us6MC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sC8ADKYE4LqMAZaGEZtrB+odLVH2dvbkCgo4ZplTpWQ=; b=B+/Us6MCeUgYl2NwHEtiElsvWm
	PYVq06rNiUiv1p9pE2QIZoBZKalePjQ8rFBUsPHciBhKxUZMjo2Yx1Gn99dHCIs00s7UW94zmhGqT
	a5ui1ysD5U4EFjhSCsn1S+gevP/ja8lYJaK2u6ROk1+3t8SpoGeRC2T6eaDiz9s+oJgPwvoRTEjQ7
	ssELgvXZJIFehmvLTigMOm+ZSx6GMEKV1dJ7B8fgZcJx0krBzDmhgqCKPfczdqPbFlnYu6NmQbTPv
	21qsVSwsfrmghCoM82sgetD0r8SAcdvEXA2jjtTl0fWDQU8tYdQonKvjvX+ywRNInTOE3G6pfPS7r
	DTOtjcHw==;
Received: from [172.31.31.142] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1V1v-00000007lun-10GC;
	Sun, 06 Apr 2025 18:47:39 +0000
Date: Sun, 06 Apr 2025 19:47:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Christoph Hellwig <hch@infradead.org>, virtio-comment@lists.linux.dev,
 Claire Chang <tientzu@chromium.org>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?ISO-8859-1?Q?J=F6rg_Roedel?= <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 graf@amazon.de
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_1/3=5D_content=3A_Add_VIRTIO=5FF=5FSWIO?=
 =?US-ASCII?Q?TLB_to_negotiate_use_of_SWIOTLB_bounce_buffers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250406114130-mutt-send-email-mst@kernel.org>
References: <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org> <Z-99snVF5ESyJDDs@infradead.org> <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org> <20250404040838-mutt-send-email-mst@kernel.org> <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org> <20250404043016-mutt-send-email-mst@kernel.org> <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org> <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org> <20250404062409-mutt-send-email-mst@kernel.org> <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org> <20250406114130-mutt-send-email-mst@kernel.org>
Message-ID: <A6E92E4B-488D-4D01-9D87-48DA81050AC2@infradead.org>
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

On 6 April 2025 19:28:08 BST, "Michael S=2E Tsirkin" <mst@redhat=2Ecom> wro=
te:
>On Fri, Apr 04, 2025 at 12:15:52PM +0100, David Woodhouse wrote:
>> On Fri, 2025-04-04 at 06:37 -0400, Michael S=2E Tsirkin wrote:
>> > On Fri, Apr 04, 2025 at 11:15:33AM +0100, David Woodhouse wrote:
>> > > On Fri, 2025-04-04 at 10:27 +0100, David Woodhouse wrote:
>> > > > On 4 April 2025 09:32:39 BST, "Michael S=2E Tsirkin" <mst@redhat=
=2Ecom>
>> > > > wrote:
>> > > > > On Fri, Apr 04, 2025 at 09:16:44AM +0100, David Woodhouse wrote=
:
>> > > > > > On Fri, 2025-04-04 at 04:09 -0400, Michael S=2E Tsirkin wrote=
:
>> > > > > > > On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse
>> > > > > > > wrote:
>> > > > > > > > What's annoying is that this should work out of the box
>> > > > > > > > *already* with
>> > > > > > > > virtio-mmio and a `restricted-dma-pool` =E2=80=94 for sys=
tems which
>> > > > > > > > aren't
>> > > > > > > > afflicted by UEFI/ACPI/PCI as their discovery mechanisms=
=2E
>> > > > > > >=20
>> > > > > > >=20
>> > > > > > > That specifically would be just a driver bugfix then?
>> > > > > >=20
>> > > > > > I actually think it works out of the box and there isn't even=
 a
>> > > > > > bug to
>> > > > > > fix=2E Haven't tested yet=2E
>> > > > > >=20
>> > > > > > The sad part is that the system does it all automatically *if=
* it
>> > > > > > has
>> > > > > > CONFIG_DMA_RESTRICTED_POOL (e=2Eg=2E Linux) and the driver ne=
ver even
>> > > > > > notices that the dma_ops it's using are the swiotlb ops using=
 the
>> > > > > > provided buffer=2E
>> > > > > >=20
>> > > > > > Which is *kind* of nice=2E=2E=2E except that when on a guest =
OS which
>> > > > > > *isn't*
>> > > > > > Linux with CONFIG_DMA_RESTRICTED_POOL, the guest will just ig=
nore
>> > > > > > the
>> > > > > > `restricted-dma-pool` node and try DMA to system memory anywa=
y,
>> > > > > > which
>> > > > > > will fail=2E
>> > > > >=20
>> > > > > I mean, it's easy to misconfigure Linux, this is why we love it=
 ;)
>> > > > > Why
>> > > > > is this such a concern?
>> > > >=20
>> > > > Because it's incompatible=2E In the DT world, perhaps this new *n=
on-
>> > > > optional* feature/restriction should have come with a new
>> > > > "compatible" string such as "virtio-mmio-restricted-dma"=2E
>> > > >=20
>> > > > Adding it without backwards compatibility wasn't ideal=2E
>> > > >=20
>> > > > > > That's why my proposal adds the negotiated VIRTIO_F_SWIOTLB
>> > > > > > feature, so
>> > > > > > that the device side can refuse, if the guest *isn't* agreein=
g to
>> > > > > > use
>> > > > > > the bounce buffer in the situations where it must do so=2E
>> > > > >=20
>> > > > >=20
>> > > > > OTOH then setting this feature and if you make the device force=
 it,
>> > > > > you are breaking guests restricted-dma-pool which worked
>> > > > > previously, no?
>> > > >=20
>> > > > Yes=2E So a platform offering virtio-mmio with restricted DMA, if=
 the
>> > > > driver doesn't accept the offered VIRTIO_F_SWIOTLB, may want to
>> > > > accept that negotiation anyway, and *hope* that the driver/OS are
>> > > > going to use the buffer anyway=2E
>> > > >=20
>> > > > I just didn't want to make that same mistake again when formalisi=
ng
>> > > > and documenting this, and especially when attempting to extend it=
 to
>> > > > PCI=2E
>> > >=20
>> > > Of course, the beauty of the restricted-dma-pool as supported by DT=
 is
>> > > that it's a *system* memory buffer, which is actually OK as long as
>> > > it's reserved address space and not just part of normal system memo=
ry
>> > > that an unsuspecting guest might use for general purposes=2E So the
>> > > trusted part of the hypervisor (e=2Eg=2E pKVM) can *allow* the VMM =
access
>> > > to that space=2E
>> > >=20
>> > > It doesn't *have* to be on-device=2E That just seemed like the more
>> > > natural way to do it for PCI=2E
>> > >=20
>> > > I suppose we *could* allow for the virtio-pci transport to do it th=
e
>> > > same way as virtio-mmio though=2E The VIRTIO_PCI_CAP_SWIOTLB capabi=
lity=C2=B9
>> > > could reference a range of system memory space, just like the
>> > > `restricted-dma-pool` property does=2E
>> > >=20
>> > > It's a weird abstraction especially for a physical PCI device to do
>> > > that because the system memory space is outside its ownership=2E Bu=
t in a
>> > > physical device it could be writable, and you could consider it the
>> > > responsibility of the system firmware to configure it appropriately=
, in
>> > > accordance with the IOMMU and other DMA restrictions of the platfor=
m=2E
>> > >=20
>> > > That does solve it for the CoCo case without addressing the P2P sta=
ging
>> > > case that Christoph mentions, though=2E
>> > >=20
>> > >=20
>> > > =C2=B9 I will rename it, Christoph, if it survives at all=2E Probab=
ly
>> > > VIRTIO_F_RESTRICTED_DMA and VIRTIO_PCI_CAP_RESTRICTED_DMA but of co=
urse
>> > > it depends on the semantics we conclude it should have=2E
>> >=20
>> > OK=2E So basically, all this does, is a promise by driver to only
>> > DMA into a range of memory?
>>=20
>> Basically, yes=2E
>>=20
>> > This part, I get=2E I wouldn't put it in a capability, just in config
>> > space then=2E
>>=20
>> Sure=2E=2E=2E but how? There are some things which are defined to be at=
 fixed
>> locations in config space, like the vendor/device IDs, COMMAND, STATUS,
>> BARs, etc=2E=2E
>>=20
>> And for the rest of the optional things which might be in config space
>> of a given device=2E=2E=2E isn't that exactly what capabilities are for=
?
>
>
>Sorry I am unclear=2E Not the pci config space=2E The virtio config space=
=2E
>After admin_queue_num ?
>
>

Makes sense=2E Let me knock up a second RFC based on that, and test using =
PRP0001 as a vehicle for `restricted-dma-pool` in an ACPI-afflicted guest=
=2E
