Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855FC155C82;
	Fri,  4 Apr 2025 06:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748756; cv=none; b=euc8wtletLe5w2gS5+ilwxPYMkShT4k5Gv0BaZoMwF/BsPljmLSXKIwP20t6YEchq9vLBq2cdzCGI3QWgIVQOOLjohYvdHhcVyepQdKN5dhA3uQHDq7jI1DU8xXlmiIvrjhznDosBJtTB0nkx6by6+mAe5UQ+5cAS+1CPFR9ZB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748756; c=relaxed/simple;
	bh=Nv+OpjzguYHw8XX/aCtXEwUOx0sT55RlHRNmpfHLPmA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=lZEoqE0KqQmsnFkIrC1JyJD5l1kzp71vNwbVVmjmierZ8HxEmK55c3tsatqXS1yxJWWCAyQUS3l3FSiYrt/qYutHlFDXM8TlFBRMCbYaVOGhYKSI9gOGMPH+CIxQAnsRukjgPozasMXUQH0lPYxdxOY5LOPlsWRuPI/rjyJrihY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aeiW6mLi; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aeiW6mLi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=09/sMJVzkrCgnCZOfO14brnFLODw8EPJdyTc6baTauI=; b=aeiW6mLin63+aKhEBweeImngwy
	bFAaWHqMM0Vo7RccW0yfzqoBXyBsR4tuIv/bWPuIM6lCIjieZvbGwh7cRTdzhv2IQlx5UMvvw3dcM
	scZNdo+FqpQe5hghh09cjc0rSab9wr3qSngC2zIcpXWL6i5xiLrfrVq+il2UwNfry4ZPdNUP4AsiZ
	46IIFYWJ30ZQ0AIGirq0d2OCw72zo+WtMBrkoIGkt/f2mU7yFRO2fZuSZWZGiGzjLYuAA2V0skwZq
	3NGfska2rPaDXNXCcLCEzTw8tHQEwUGAdpS9hU9WfOIG2sJB09FWN0bxPCdxUuLI6KhwTsKYiwwpG
	EhRPlnAg==;
Received: from [2001:8b0:10b:5:5fcd:596f:f785:8906] (helo=[IPv6:::1])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ahi-00000007JAJ-0gsd;
	Fri, 04 Apr 2025 06:39:02 +0000
Date: Fri, 04 Apr 2025 07:39:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.linux.dev,
 Claire Chang <tientzu@chromium.org>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?ISO-8859-1?Q?J=F6rg_Roedel?= <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 graf@amazon.de
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_1/3=5D_content=3A_Add_VIRTIO=5FF=5FSWIO?=
 =?US-ASCII?Q?TLB_to_negotiate_use_of_SWIOTLB_bounce_buffers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Z-98Lqpq4mZN545Y@infradead.org>
References: <20250402111901-mutt-send-email-mst@kernel.org> <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org> <20250402114757-mutt-send-email-mst@kernel.org> <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org> <20250402124131-mutt-send-email-mst@kernel.org> <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org> <Z-44wXdyia4RC6Cr@infradead.org> <06465bcf4422d088df2a0ce9cdb09767dac83118.camel@infradead.org> <Z-47O3vkyIf0mzdw@infradead.org> <cdd979bca2b8cc4ff170442d968b63f2b3f0ccd6.camel@infradead.org> <Z-98Lqpq4mZN545Y@infradead.org>
Message-ID: <488D32C6-77FA-4CC8-988F-CD4D14548D4B@infradead.org>
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

On 4 April 2025 07:29:02 BST, Christoph Hellwig <hch@infradead=2Eorg> wrote=
:
>On Thu, Apr 03, 2025 at 09:10:41AM +0100, David Woodhouse wrote:
>> Thanks=2E I'll take a closer look at handling that=2E I think it's
>> reasonable for the negotiation of the VIRTIO_F_SWIOTLB feature to be
>> the thing that switches *all* addresses to be on-device, and the on-
>> device buffer can't be accessed unless VIRTIO_F_SWIOTLB has been
>> negotiated=2E
>>=20
>> Which neatly sidesteps the original thing I was trying to clarify
>> anyway=2E
>
>Switching all addressing does not sound like a good idea=2E  The main
>thing these indirect buffers are used for is as a staging points for
>P2P DMA, in which case they often are only used for some transfers or
>even parts of a transfer=2E  At least for physical virtio devices P2P
>is probably not far off with the current GPU craze, and I wouldn't
>be surprised if people found uses for paravirt P2P as well=2E

That isn't the original use case I had for it in virtio but that's useful =
input, thanks=2E

Plumbing a 65th address space bit through all descriptors seems impractica=
l=2E Would it suffice for the driver to *specify* the location in the devic=
e's DMA address space that the on-device buffer appears, to allow it to avo=
id conflicts with system memory addresses? Better ideas?
