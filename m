Received: from mailout2.w2.samsung.com (mailout2.w2.samsung.com [211.189.100.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D37E202C2D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.189.100.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719263; cv=none; b=t8CVgy6pSKstXsVrOrZPFHwrLr8ZI7FlG0A8gsHkJlTWGNHvAiOTT1WfFkBu2BfR4OYR7zB1tFH5KdHjoASoQsUZvcSMPfTe9d5gV6opoe3vuxsVcOjUspP/hD3wZlnHZTLaA65syObRuDMIXG1/f+lk0Gyo70fr5nCWFHezBSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719263; c=relaxed/simple;
	bh=sseqSCe8oTRbExa+i96ytAGjMHk2d8zCQDZTOYYfZ3w=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=bbsueNex6l+A/juTWVdcSCxtoI2sbbrvxax1DCtE4U3ZJKYmWiolbIs2QnfyLKjS/wsKvVsIQqstWmE6U0FN4RXva+cpyyX1hhkNI2HnAPcJAHeplDpYJoJjBZBwfggX93i9qAz0D56VK5dxBL311XMuLaUu4YYLQ7kM/+Tq4s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com; spf=pass smtp.mailfrom=partner.samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=M+5ML4In; arc=none smtp.client-ip=211.189.100.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="M+5ML4In"
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
	by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id 20250508154732usoutp02758e6f1cd4846bbcf3fa106fd112e37b~9l_fgb1W11687616876usoutp027;
	Thu,  8 May 2025 15:47:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com 20250508154732usoutp02758e6f1cd4846bbcf3fa106fd112e37b~9l_fgb1W11687616876usoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746719252;
	bh=AZ7rC7nq5/XQGIiqENKZmFdFFqcOSeECRbuGkKQAtKk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=M+5ML4Inh/gnlfsIcvGy2DU1EK9eGmnSFpo7sZmN+dNMGjlcnOhNMRfUC6UCDwnhC
	 iYXxGmFcEeVIaTvhHP+oYGfC0Xc1dhiDpk+Tbb88MDTaINjDSr4vK3cdmyn/Q69ksv
	 kDKVdjnQVVljXZR1glM78FJd9nz4vRQlobUd25Jk=
Received: from ussmtxp2.samsung.com (u137.gpu85.samsung.co.kr
	[203.254.195.137]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250508154732uscas1p24412e43fb0c0b24a602414e95e883a4a~9l_fYiOeu1359613596uscas1p2m;
	Thu,  8 May 2025 15:47:32 +0000 (GMT)
Received: from ATXPVPPTAGT03.sarc.samsung.com (unknown [105.148.161.7]) by
	ussmtxp2.samsung.com (KnoxPortal) with ESMTP id
	20250508154732ussmtxp2c9945dce0ec9e1f4fac4867a7dd72bc8~9l_fPMVIZ2911529115ussmtxp2E;
	Thu,  8 May 2025 15:47:32 +0000 (GMT)
Received: from pps.filterd (ATXPVPPTAGT03.sarc.samsung.com [127.0.0.1]) by
	ATXPVPPTAGT03.sarc.samsung.com (8.18.1.2/8.18.1.2) with ESMTP id
	548EQ55b046772; Thu, 8 May 2025 10:47:31 -0500
Received: from webmail.sarc.samsung.com ([172.30.39.9]) by
	ATXPVPPTAGT03.sarc.samsung.com (PPS) with ESMTP id 46df5wbvp3-1; Thu, 08 May
	2025 10:47:31 -0500
Received: from sarc.samsung.com (105.148.145.5) by
	au1ppexchange01.sarc.samsung.com (105.148.32.81) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.1544.4; Thu, 8 May 2025 10:47:24 -0500
Date: Thu, 8 May 2025 18:47:20 +0300
From: Pantelis Antoniou <p.antoniou@partner.samsung.com>
To: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Artem Krupotkin <artem.k@samsung.com>,
	Charles Briere <c.briere@samsung.com>, Wade Farnsworth
	<wade.farnsworth@siemens.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/1] Fix zero copy I/O on __get_user_pages allocated
 pages
Message-ID: <20250508184720.17bd1f62@sarc.samsung.com>
In-Reply-To: <c29bd0cb-0907-4c5b-8244-83bbb256d964@redhat.com>
Organization: SARC
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: au1ppexchange01.sarc.samsung.com (105.148.32.81) To
	au1ppexchange01.sarc.samsung.com (105.148.32.81)
X-CFilter-Loop: Reflected
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: vwgU-4LG88mKsejoz9mkTyqoIqFm2ioq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEzNyBTYWx0ZWRfXxuZQ+m+xzxIQ
	63Yg+1ktOzcCTPQVk2xZpihGkl4fF6GL5TeJH+Z1BTyLK7hwBqH51UJkw7QH8gNSG+1v0U0plqW
	To68jWn1964z2xxTlhaXw2BBvjxl5Rv9edP+Al2VQxTJe9qbdqX+0o2a9H4uEMlUTggrCJmCvH9
	J5zg0mEZX0HgkfpCb8NPO4T85gU5ZLEid9WDndssOnWxvUqvfzhFhDgnRaTIB4Sh9fzI7NiuzC+
	1WT5y6lIsuuttlkWD/5aAESPSCOKKlppALv5XZ+4xSHlC38igDZvdouoeNv6COvGb6H6RH+906x
	Q+jFg3fHR/P9dQGXQ9N7GV1PotC2DNk15Jp7hIogX3WFSLJPisf5bLyfBROHbHPHinl/OHaBbWP
	LiElIzZd
X-Proofpoint-ORIG-GUID: vwgU-4LG88mKsejoz9mkTyqoIqFm2ioq
X-Proofpoint-Virus-Version: vendor=baseguard
	engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
	definitions=2025-05-08_05,2025-05-08_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam
	score=0 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0
	lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
	mlxlogscore=988 adultscore=0 suspectscore=0 classifier=spam adjust=0
	reason=mlx scancount=1 engine=8.12.0-2504070000 definitions=main-2505080137
X-CMS-MailID: 20250508154732uscas1p24412e43fb0c0b24a602414e95e883a4a
X-CMS-RootMailID: 20250507154119uscas1p17799fe7589e4f1bd53d2d3dc7f44cb8c
References: <20250507154105.763088-1-p.antoniou@partner.samsung.com>
	<CGME20250507154119uscas1p17799fe7589e4f1bd53d2d3dc7f44cb8c@uscas1p1.samsung.com>
	<20250507154105.763088-2-p.antoniou@partner.samsung.com>
	<99ed92b7-c1b2-4e12-a7ee-776a7f890b47@redhat.com>
	<20250508182356.45dbfd40@sarc.samsung.com>
	<c29bd0cb-0907-4c5b-8244-83bbb256d964@redhat.com>

On Thu, 8 May 2025 17:37:04 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 08.=E2=80=8A05.=E2=80=8A25 17:=E2=80=8A23, Pantelis Antoniou wrote: > =
On Thu, 8 May 2025
> 17:=E2=80=8A03:=E2=80=8A46 +0200 > David Hildenbrand <david@=E2=80=8Aredh=
at.=E2=80=8Acom> wrote: > >
> Hi there, > >> On 07. 05. 25 17: 41, Pantelis Antoniou wrote: Hi, >
> Recent updates=20
> On 08.05.25 17:23, Pantelis Antoniou wrote:
> > On Thu, 8 May 2025 17:03:46 +0200
> > David Hildenbrand <david@redhat.com> wrote:
> >=20
> > Hi there,
> >=20
> >> On 07.=E2=80=8A05.=E2=80=8A25 17:=E2=80=8A41, Pantelis Antoniou wrote:=
 Hi, > Recent updates
> >> to net filesystems enabled zero copy operations, > which require
> >> getting a user space page pinned. > > This does not work for pages
> >> that were allocated via __get_user_pages
> >> On 07.05.25 17:41, Pantelis Antoniou wrote:
> >>
> >> Hi,
> >>
> >>> Recent updates to net filesystems enabled zero copy operations,
> >>> which require getting a user space page pinned.
> >>>
> >>> This does not work for pages that were allocated via
> >>> __get_user_pages and then mapped to user-space via remap_pfn_rage.
> >>
> >> Right. Because the struct page of a VM_PFNMAP *must not be
> >> touched*. It has to be treated like it doesn't exist.
> >>
> >=20
> > Well, that's not exactly the case. For pages mapped to user space
> > via remap_pfn_range() the VM_PFNMAP bit is set even though the
> > pages do have a struct page.
>=20
> Yes. And VM_PFNMAP is the big flag that these pages shall not be=20
> touched. Even if it exists. Even if you say please. :)
>=20
> See the comment above vm_normal_page():
>=20
> 	"Special" mappings do not wish to be associated with a "struct
> 	page" (either it doesn't exist, or it exists but they don't
> want to touch it)
>=20
> VM_MIXEDMAP could maybe be used for that purpose: possibly GUP also
> has to be updated to make use of that. (I was hoping we can get rid
> of VM_MIXEDMAP at some point)
>=20
>=20
> >=20
> > The details of how it happens are at the cover page of this patch
> > but let me paste the relevant bits here.
> >=20
> > "In our emulation environment we have noticed failing writes when
> > performing I/O from a userspace mapped DRM GEM buffer object.
> > The platform does not use VRAM, all graphics memory is regular DRAM
> > memory, allocated via __get_free_pages
> >=20
> > The same write was successful from a heap allocated bounce buffer.
> >=20
> > The sequence of events is as follows.
> >=20
> > 1. A BO (Buffer Object) is created, and it's backing memory is
> > allocated via __get_user_pages()
>=20
> __get_user_pages() only allocates memory via page faults. Are you
> sure you meant __get_user_pages() here?
>=20

Oops, yeah, __get_free_pages(). Apologies for the confusion.

> >=20
> > 2. Userspace mmaps a BO (Buffer Object) via a mmap call on the
> > opened file handle of a DRM driver. The mapping is done via the
> >     drm_gem_mmap_obj() call.
> >=20
> > 3. Userspace issues a write to a file copying the contents of the
> > BO.
> >=20
> > 3a. If the file is located on regular filesystem (like ext4), the
> > write completes successfully.
> >=20
> > 3b. If the file is located on a network filesystem, like 9p the
> > write fails.
> >=20
> > The write fails because v9fs_file_write_iter() will call
> > netfs_unbuffered_write_iter(), netfs_unbuffered_write_iter_locked()
> > which will call netfs_extract_user_iter()
> >=20
> > netfs_extract_user_iter() will in turn call
> > iov_iter_extract_pages() which for a user backed iterator will call
> > iov_iter_extract_user_pages which will call pin_user_pages_fast()
> > which finally will call __gup_longterm_locked().
> >=20
> > __gup_longterm_locked() will call __get_user_pages_locked() which
> > will fail because the VMA is marked with the VM_IO and VM_PFNMAP
> > flags."
>=20
> So, drm_gem_mmap_obj() ends up using remap_pfn_rage()?
>=20

Yes.

> I can spot that drm_gem_mmap_obj() has a path where it explicitly sets
>=20
> 	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND |
> 		     VM_DONTDUMP);
>=20
> Which is a clear sign to core-MM (incl. GUP) to never mess with the=20
> mapped pages.
>=20

Well, let just say this not quite right for pages that are normally
allocated via __get_free_pages().

DRM has to handle both VRAM and regular system memory maps so maybe it's
playing it safe here.

> >=20
> >>>
> >>> remap_pfn_range_internal() will turn on VM_IO | VM_PFNMAP vma
> >>> bits. VM_PFNMAP in particular mark the pages as not having
> >>> struct_page associated with them, which is not the case for
> >>> __get_user_pages()
> >>>
> >>> This in turn makes any attempt to lock a page fail, and breaking
> >>> I/O from that address range.
> >>>
> >>> This patch address it by special casing pages in those VMAs and
> >>> not calling vm_normal_page() for them.
> >>>
> >>> Signed-off-by: Pantelis Antoniou <p.antoniou@partner.samsung.com>
> >>> ---
> >>>    mm/gup.c | 22 ++++++++++++++++++----
> >>>    1 file changed, 18 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/mm/gup.c b/mm/gup.c
> >>> index 84461d384ae2..e185c18c0c81 100644
> >>> --- a/mm/gup.c
> >>> +++ b/mm/gup.c
> >>> @@ -833,6 +833,20 @@ static inline bool can_follow_write_pte(pte_t
> >>> pte, struct page *page, return !userfaultfd_pte_wp(vma, pte);
> >>>    }
> >>>=20=20=20=20
> >>> +static struct page *gup_normal_page(struct vm_area_struct *vma,
> >>> +		unsigned long address, pte_t pte)
> >>> +{
> >>> +	unsigned long pfn;
> >>> +
> >>> +	if (vma->vm_flags & (VM_MIXEDMAP | VM_PFNMAP)) {
> >>> +		pfn =3D pte_pfn(pte);
> >>> +		if (!pfn_valid(pfn) || is_zero_pfn(pfn) || pfn >
> >>> highest_memmap_pfn)
> >>> +			return NULL;
> >>> +		return pfn_to_page(pfn);
> >>> +	}
> >>> +	return vm_normal_page(vma, address, pte);
> >>
> >> I enjoy seeing vm_normal_page() checks in GUP code.
> >>
> >> I don't enjoy seeing what you added before that :)
> >>
> >> If vm_normal_page() tells you "this is not a normal", then we
> >> should not touch it. There is one exception: the shared zeropage.
> >>
> >>
> >> So, unfortunately, this is wrong.
> >>
> >=20
> > Well, lets talk about a proper fix then for the previously mentioned
> > user-space regression.
>=20
> You really have to find out the responsible commit. GUP has been=20
> behaving like that forever I'm afraid.
>=20
> And even the VM_PFNMAP was in drm_gem_mmap_obj() already at least in=20
> 2012 if I am not wrong.
>=20

There is no single responsible commit, it was broken forever.
It is just that no-one has ever tried to pin the pages to perform I/O
before now.

Regards

-- Pantelis


