Received: from mailout2.w2.samsung.com (mailout2.w2.samsung.com [211.189.100.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EAB1D416E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.189.100.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717848; cv=none; b=UbxlJh5pBxUaFeHD3YDruk8/13MVjVwmHMhlGaj5v7vsWUHT/me3IOBDQ7ixFkXEocORm1xJ9vG+MZOWqKtTOzpeHVxqpTT4xFs8HMQ4oTES0YYFypG0sJ4wH1AsnUpi27Fjtr4p6RkcNCQv1JSexaPVVwkDWmzlrjZAq7W9NaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717848; c=relaxed/simple;
	bh=3de1QaoGCFr+A9tv8wdu56UXaOSJAInz8M4xO4ynnCk=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=MiCSi8rKT9pzjiIIlBGJ3EiIlXgFepv9WfBu1OuTLtpnuHPYM5sO1Q1D9UIRb+KRNDuqOjYa99GkUsTkVEWlpTXIyVxY7lCzutXhUyw8A+O1ScyFVBU33XOdA6XGao9W3pL25WbnDOQi116ysdtB0kZTTfmfTKA/Ut4ay+ppmM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com; spf=pass smtp.mailfrom=partner.samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SyWPqSq/; arc=none smtp.client-ip=211.189.100.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SyWPqSq/"
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
	by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id 20250508152403usoutp02ce33eeecccb648894ecc5b986f6678b1~9lp___pD_2763927639usoutp023;
	Thu,  8 May 2025 15:24:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com 20250508152403usoutp02ce33eeecccb648894ecc5b986f6678b1~9lp___pD_2763927639usoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746717843;
	bh=G4m0IKW5CtvLWRZkH6H7Re/CAvwT6toG6MODAwPO0vE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=SyWPqSq/xO2QHitBfWOiLZtCSr/TvpS4zyNL/XsbiNXXmrVbAGLnOR6NrHDs4KGBI
	 K0+qPisAgzSKbSRWRod6pJ12QaW468EQSHng+W3tsq1nj6cH0MVZfn6APpxxFmFMWH
	 5EaqREBjilTGCDb2JefqDkFwuF2HPaPXicsAVujM=
Received: from ussmtxp1.samsung.com (u136.gpu85.samsung.co.kr
	[203.254.195.136]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250508152403uscas1p28fc1d213062fa4a01ed52588ae9c1e20~9lp_2TG6d2258522585uscas1p2t;
	Thu,  8 May 2025 15:24:03 +0000 (GMT)
Received: from ATXPVPPTAGT03.sarc.samsung.com (unknown [105.148.161.7]) by
	ussmtxp1.samsung.com (KnoxPortal) with ESMTP id
	20250508152403ussmtxp1fc3b03d9f7b23772a0d9733e49f66868~9lp_tDR4O0103701037ussmtxp1d;
	Thu,  8 May 2025 15:24:02 +0000 (GMT)
Received: from pps.filterd (ATXPVPPTAGT03.sarc.samsung.com [127.0.0.1]) by
	ATXPVPPTAGT03.sarc.samsung.com (8.18.1.2/8.18.1.2) with ESMTP id
	548EOaUO045334; Thu, 8 May 2025 10:24:02 -0500
Received: from webmail.sarc.samsung.com ([172.30.39.9]) by
	ATXPVPPTAGT03.sarc.samsung.com (PPS) with ESMTP id 46df5wbv69-1; Thu, 08 May
	2025 10:24:02 -0500
Received: from sarc.samsung.com (105.148.145.5) by
	au1ppexchange01.sarc.samsung.com (105.148.32.81) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.1544.4; Thu, 8 May 2025 10:24:00 -0500
Date: Thu, 8 May 2025 18:23:56 +0300
From: Pantelis Antoniou <p.antoniou@partner.samsung.com>
To: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Artem Krupotkin <artem.k@samsung.com>,
	Charles Briere <c.briere@samsung.com>, Wade Farnsworth
	<wade.farnsworth@siemens.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/1] Fix zero copy I/O on __get_user_pages allocated
 pages
Message-ID: <20250508182356.45dbfd40@sarc.samsung.com>
In-Reply-To: <99ed92b7-c1b2-4e12-a7ee-776a7f890b47@redhat.com>
Organization: SARC
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: au1ppexchange02.sarc.samsung.com (105.148.32.82) To
	au1ppexchange01.sarc.samsung.com (105.148.32.81)
X-CFilter-Loop: Reflected
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: WIViWkdrb1teZjQ_dT55pg7cdGqIvFB8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEzMyBTYWx0ZWRfX2RfAWvoIlAVw
	0JBjlBImh/7hfELV0lrHyPJWoMClvzEp6+GpQmvEF6kiBfp5DTM/9PC3unO/y0Rd33AnhYGHXJQ
	oTvzQCXgqqx5Th9oq2i/edOa9fS/Q8+4axSYapXWfbVy+sEJW4KHmAut7qlj8vUoxa4aFDRZgTE
	OItfHGpUo+S1o/4THc72hlLYmmVhnpwBi9c3UjHyWaqfBx/3I2f99R4no5bKdKU/+crucFT9b9H
	ncbtb9oZUAiL2vy8x16A+l6P5dj71IoahyRTGV2sdRvw1erRm5XYlJYtviyJ1VNtFy5iUn0Vyji
	IbrAGOTjQnV1w1zkWwd8zQa0vZLVNOfRGtpIGkI44njZFb83k5s2/q607JoHdBXpp1lxKIrCvWm
	scgpHS+2
X-Proofpoint-ORIG-GUID: WIViWkdrb1teZjQ_dT55pg7cdGqIvFB8
X-Proofpoint-Virus-Version: vendor=baseguard
	engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
	definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam
	score=0 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0
	lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
	mlxlogscore=852 adultscore=0 suspectscore=0 classifier=spam adjust=0
	reason=mlx scancount=1 engine=8.12.0-2504070000 definitions=main-2505080133
X-CMS-MailID: 20250508152403uscas1p28fc1d213062fa4a01ed52588ae9c1e20
X-CMS-RootMailID: 20250507154119uscas1p17799fe7589e4f1bd53d2d3dc7f44cb8c
References: <20250507154105.763088-1-p.antoniou@partner.samsung.com>
	<CGME20250507154119uscas1p17799fe7589e4f1bd53d2d3dc7f44cb8c@uscas1p1.samsung.com>
	<20250507154105.763088-2-p.antoniou@partner.samsung.com>
	<99ed92b7-c1b2-4e12-a7ee-776a7f890b47@redhat.com>

On Thu, 8 May 2025 17:03:46 +0200
David Hildenbrand <david@redhat.com> wrote:

Hi there,

> On 07.=E2=80=8A05.=E2=80=8A25 17:=E2=80=8A41, Pantelis Antoniou wrote: Hi=
, > Recent updates
> to net filesystems enabled zero copy operations, > which require
> getting a user space page pinned. > > This does not work for pages
> that were allocated via __get_user_pages=20
> On 07.05.25 17:41, Pantelis Antoniou wrote:
>=20
> Hi,
>=20
> > Recent updates to net filesystems enabled zero copy operations,
> > which require getting a user space page pinned.
> >=20
> > This does not work for pages that were allocated via
> > __get_user_pages and then mapped to user-space via remap_pfn_rage.
>=20
> Right. Because the struct page of a VM_PFNMAP *must not be touched*.
> It has to be treated like it doesn't exist.
>=20

Well, that's not exactly the case. For pages mapped to user space via
remap_pfn_range() the VM_PFNMAP bit is set even though the pages do
have a struct page.

The details of how it happens are at the cover page of this patch but
let me paste the relevant bits here.

"In our emulation environment we have noticed failing writes when
performing I/O from a userspace mapped DRM GEM buffer object.
The platform does not use VRAM, all graphics memory is regular DRAM
memory, allocated via __get_free_pages

The same write was successful from a heap allocated bounce buffer.

The sequence of events is as follows.

1. A BO (Buffer Object) is created, and it's backing memory is allocated via
   __get_user_pages()

2. Userspace mmaps a BO (Buffer Object) via a mmap call on the opened
   file handle of a DRM driver. The mapping is done via the
   drm_gem_mmap_obj() call.

3. Userspace issues a write to a file copying the contents of the BO.

3a. If the file is located on regular filesystem (like ext4), the write
    completes successfully.

3b. If the file is located on a network filesystem, like 9p the write fails.

The write fails because v9fs_file_write_iter() will call
netfs_unbuffered_write_iter(), netfs_unbuffered_write_iter_locked() which w=
ill=20
call netfs_extract_user_iter()=20

netfs_extract_user_iter() will in turn call iov_iter_extract_pages() which =
for
a user backed iterator will call iov_iter_extract_user_pages which will call
pin_user_pages_fast() which finally will call __gup_longterm_locked().

__gup_longterm_locked() will call __get_user_pages_locked() which will fail
because the VMA is marked with the VM_IO and VM_PFNMAP flags."

> >=20
> > remap_pfn_range_internal() will turn on VM_IO | VM_PFNMAP vma bits.
> > VM_PFNMAP in particular mark the pages as not having struct_page
> > associated with them, which is not the case for __get_user_pages()
> >=20
> > This in turn makes any attempt to lock a page fail, and breaking
> > I/O from that address range.
> >=20
> > This patch address it by special casing pages in those VMAs and not
> > calling vm_normal_page() for them.
> >=20
> > Signed-off-by: Pantelis Antoniou <p.antoniou@partner.samsung.com>
> > ---
> >   mm/gup.c | 22 ++++++++++++++++++----
> >   1 file changed, 18 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 84461d384ae2..e185c18c0c81 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -833,6 +833,20 @@ static inline bool can_follow_write_pte(pte_t
> > pte, struct page *page, return !userfaultfd_pte_wp(vma, pte);
> >   }
> >=20=20=20
> > +static struct page *gup_normal_page(struct vm_area_struct *vma,
> > +		unsigned long address, pte_t pte)
> > +{
> > +	unsigned long pfn;
> > +
> > +	if (vma->vm_flags & (VM_MIXEDMAP | VM_PFNMAP)) {
> > +		pfn =3D pte_pfn(pte);
> > +		if (!pfn_valid(pfn) || is_zero_pfn(pfn) || pfn >
> > highest_memmap_pfn)
> > +			return NULL;
> > +		return pfn_to_page(pfn);
> > +	}
> > +	return vm_normal_page(vma, address, pte);
>=20
> I enjoy seeing vm_normal_page() checks in GUP code.
>=20
> I don't enjoy seeing what you added before that :)
>=20
> If vm_normal_page() tells you "this is not a normal", then we should
> not touch it. There is one exception: the shared zeropage.
>=20
>=20
> So, unfortunately, this is wrong.
>=20

Well, lets talk about a proper fix then for the previously mentioned
user-space regression.

Regards

-- Pantelis
