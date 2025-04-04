Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF60A28E8;
	Fri,  4 Apr 2025 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743758842; cv=none; b=AyCa2INVylD8+P06liArv9j3q2zBusVz+BamDUo56Bp/zAzUpXDUNnHoxgXPKfIWoPLaW6s2WvKM8Ut4ETScIEGRBN1nHC9dox0ml0Ob/J7YHutSzWRLNknPpc07ZCGi1zajPd1qg71FHzQht+vPBeZsSwHE9xdrwseNTaRzoIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743758842; c=relaxed/simple;
	bh=20zTP1BPk5EAL7QuTWd2YLpnkd6fEIQ55GBI3002LQ8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DqbmQeuwTHwpkxnzogW38nFUVyeUEUolWnesRm5jM0UpvXsITJ0tokhLYN9YnVzt2cGzDPmnPXmU8FUGGTGROTnecRBSaQeL5ydtfrBfzT91bqv69NFVGbv0pIj9onxRnZC2le3RLXVrUA3w+0WlISoReoINc/zaPT8SG0HuZAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=N+NHRUbB; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N+NHRUbB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=20zTP1BPk5EAL7QuTWd2YLpnkd6fEIQ55GBI3002LQ8=; b=N+NHRUbBrlE5yrA/oNsBeufvYg
	UK+k/rfEE6xbQ65RVeoz9S71QsQ6nDHxSO+MIgtMxe8c0qUHcr9h9FF5fJpwAV1dy53lVZOfAfWEU
	+VVsGp6N7A7N/9wTONMAOxIuUj7PuiQCKHd/fOAi6h8HkJm5+y8eWEvH/5VITvZSQOtqsGs1UVKM0
	hoP9+n8BlQhJhjdIXYv6b+atyNAvChZMixant3yuREhcqlDQc5ZoKEMl0kieqd4PwXrzIuZBSOWZJ
	OAiwpWz/PcnrOKlru/EEijQBC4PaywHZu53smZrAjxn87Gj2Y5E4ps+fOSOTj6r+PNzhbV42JpXtW
	nZwKX8MQ==;
Received: from [2a00:23ee:2958:8b7d:331a:3a2:4a31:884] (helo=[IPv6:::1])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dKT-00000007NAn-35dA;
	Fri, 04 Apr 2025 09:27:14 +0000
Date: Fri, 04 Apr 2025 10:27:13 +0100
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
In-Reply-To: <20250404043016-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org> <20250402112410.2086892-2-dwmw2@infradead.org> <Z-43svGzwoUQaYvg@infradead.org> <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org> <Z-46TDmspmX0BJ2H@infradead.org> <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org> <Z-99snVF5ESyJDDs@infradead.org> <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org> <20250404040838-mutt-send-email-mst@kernel.org> <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org> <20250404043016-mutt-send-email-mst@kernel.org>
Message-ID: <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
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

On 4 April 2025 09:32:39 BST, "Michael S=2E Tsirkin" <mst@redhat=2Ecom> wro=
te:
>On Fri, Apr 04, 2025 at 09:16:44AM +0100, David Woodhouse wrote:
>> On Fri, 2025-04-04 at 04:09 -0400, Michael S=2E Tsirkin wrote:
>> > On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse wrote:
>> > > What's annoying is that this should work out of the box *already* w=
ith
>> > > virtio-mmio and a `restricted-dma-pool` =E2=80=94 for systems which=
 aren't
>> > > afflicted by UEFI/ACPI/PCI as their discovery mechanisms=2E
>> >=20
>> >=20
>> > That specifically would be just a driver bugfix then?
>>=20
>> I actually think it works out of the box and there isn't even a bug to
>> fix=2E Haven't tested yet=2E
>>=20
>> The sad part is that the system does it all automatically *if* it has
>> CONFIG_DMA_RESTRICTED_POOL (e=2Eg=2E Linux) and the driver never even
>> notices that the dma_ops it's using are the swiotlb ops using the
>> provided buffer=2E
>>=20
>> Which is *kind* of nice=2E=2E=2E except that when on a guest OS which *=
isn't*
>> Linux with CONFIG_DMA_RESTRICTED_POOL, the guest will just ignore the
>> `restricted-dma-pool` node and try DMA to system memory anyway, which
>> will fail=2E
>
>I mean, it's easy to misconfigure Linux, this is why we love it ;) Why
>is this such a concern?

Because it's incompatible=2E In the DT world, perhaps this new *non-option=
al* feature/restriction should have come with a new "compatible" string suc=
h as "virtio-mmio-restricted-dma"=2E

Adding it without backwards compatibility wasn't ideal=2E

>> That's why my proposal adds the negotiated VIRTIO_F_SWIOTLB feature, so
>> that the device side can refuse, if the guest *isn't* agreeing to use
>> the bounce buffer in the situations where it must do so=2E
>
>
>OTOH then setting this feature and if you make the device force it,
>you are breaking guests restricted-dma-pool which worked previously, no?

Yes=2E So a platform offering virtio-mmio with restricted DMA, if the driv=
er doesn't accept the offered VIRTIO_F_SWIOTLB, may want to accept that neg=
otiation anyway, and *hope* that the driver/OS are going to use the buffer =
anyway=2E

I just didn't want to make that same mistake again when formalising and do=
cumenting this, and especially when attempting to extend it to PCI=2E

