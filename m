Received: from mailout1.w2.samsung.com (mailout1.w2.samsung.com [211.189.100.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F8C262FDE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.189.100.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693299; cv=none; b=oyq+aGmc7Ck7Cwrhb+h/Q3EMK3FTfNcv4DXolOYPSAgmo4qSAB3kRAkzSge6ucunbvTOzJSt3kraF4P9MpJl9U1jLfy4f4ZUWlre3nb+3nbWVh3pcMvYoJZiMRnO1BymgePMjj66JB8iwkh677T31ll9GE0fyws0T2TvPev3g7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693299; c=relaxed/simple;
	bh=fPq1khtFjMqgEkGiH2cq56ZqZMoJRgVj0jQyxNs8Puw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Jnrh5clXVVI1UWF+88q8zpaR/zcpB9uWbDCvoP2LwJ1gQX7U44hLlfzVfB3C5CnDbtCe7bRjAck8GnYCHRtpQLRXWlXdRIlwd8JNLN/JnM8v0xXtSNTfiww1opqgAGTlCocf738paJ2W7tEJy0m7oNILfaaPPYeh8GfmvhvlRx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com; spf=pass smtp.mailfrom=partner.samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Y3ligE1m; arc=none smtp.client-ip=211.189.100.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Y3ligE1m"
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
	by mailout1.w2.samsung.com (KnoxPortal) with ESMTP id 20250508082455usoutp0112b6fa97ed05e55b44f1e5b3cc683d13~9f8CDpCqE0052200522usoutp01h;
	Thu,  8 May 2025 08:24:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w2.samsung.com 20250508082455usoutp0112b6fa97ed05e55b44f1e5b3cc683d13~9f8CDpCqE0052200522usoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746692695;
	bh=xFWdlrWsOanX/NVVNVan2uCPYqrJFZdos0xlcyL5mUY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Y3ligE1mVdi0oLVYyHkkKGO4q0YE6QtQf9y4FkwyTxjUNj3LbzHuupM4T9Jk+RO4N
	 hkCrb15Q5bx/JvRn/aFXpSFlrZYv1jWC+EHqZyaSVcZ7KWBoWCK5FE+63KS0/V4sKs
	 R35qrHSNYGiBzwbsnNkyDuwNd0+zIJfhUMp83UFQ=
Received: from ussmtxp1.samsung.com (u136.gpu85.samsung.co.kr
	[203.254.195.136]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250508082454uscas1p29b50ff4d2f31a53e732cebf11535a549~9f8BAo3ls1112411124uscas1p2B;
	Thu,  8 May 2025 08:24:54 +0000 (GMT)
Received: from ATXPVPPTAGT04.sarc.samsung.com (unknown [105.148.161.8]) by
	ussmtxp1.samsung.com (KnoxPortal) with ESMTP id
	20250508082453ussmtxp18e1b1380fd7c17414cdb8bad396b2f53~9f8A1OPYH1568415684ussmtxp1X;
	Thu,  8 May 2025 08:24:53 +0000 (GMT)
Received: from pps.filterd (ATXPVPPTAGT04.sarc.samsung.com [127.0.0.1]) by
	ATXPVPPTAGT04.sarc.samsung.com (8.18.1.2/8.18.1.2) with ESMTP id
	54876rUv037957; Thu, 8 May 2025 03:24:53 -0500
Received: from webmail.sarc.samsung.com ([172.30.39.9]) by
	ATXPVPPTAGT04.sarc.samsung.com (PPS) with ESMTP id 46df5w3mty-1; Thu, 08 May
	2025 03:24:53 -0500
Received: from sarc.samsung.com (105.148.145.5) by
	au1ppexchange01.sarc.samsung.com (105.148.32.81) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.1544.4; Thu, 8 May 2025 03:24:51 -0500
Date: Thu, 8 May 2025 11:24:43 +0300
From: Pantelis Antoniou <p.antoniou@partner.samsung.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Artem Krupotkin
	<artem.k@samsung.com>, Charles Briere <c.briere@samsung.com>, "Wade
 Farnsworth" <wade.farnsworth@siemens.com>
Subject: Re: [PATCH 0/1] Fix zero copy I/O on __get_user_pages allocated
 pages
Message-ID: <20250508112443.49ff0414@sarc.samsung.com>
In-Reply-To: <20250507145018.385c0a090a0d61c06e985ad9@linux-foundation.org>
Organization: SARC
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: au1ppexchange04.sarc.samsung.com (105.148.32.84) To
	au1ppexchange01.sarc.samsung.com (105.148.32.81)
X-CFilter-Loop: Reflected
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 4PeEZ1aymWH1pEADgeqC-xh1MxcKHdE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA3MyBTYWx0ZWRfXwC7v/t1idwe7
	xe0rUmgQIin4dSxD3sdt8qMjeej6uOx7+D84agRnXQeM4q13fSM2DeCbzgjnY7hsvn1w7uKvgyP
	mWNyrwpMH8GJiKdbveBHTQyePuQ5a8kVc2adKAPmafRneMhtz3kZx66UcayTujKVFaeMiGdizFg
	1YcMNpXJgwz38+OVbA1DDtI180Cr/Tf1LmfzkNVZ+CvRrJ/FGpin8fO+PwQC7ClBCdwSKHYIOFT
	O7Mn39zhBbauGyFdKLhRWQwbjcdf9srM2ReYgtg7+87kATYEMDBJK8OZz9T/vpjVY7Ioufzoesj
	VTd8XfUS/UdJLA/A8iOWgyPoGbqJqbdotgoZLwAa4oVu0dEpndd6AuI/uZTrIG7U2FpGFeoXH9w
	qtcMf2/5
X-Proofpoint-ORIG-GUID: 4PeEZ1aymWH1pEADgeqC-xh1MxcKHdE7
X-Proofpoint-Virus-Version: vendor=baseguard
	engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
	definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam
	score=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
	priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=809
	lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam adjust=0
	reason=mlx scancount=1 engine=8.12.0-2504070000 definitions=main-2505080073
X-CMS-MailID: 20250508082454uscas1p29b50ff4d2f31a53e732cebf11535a549
X-CMS-RootMailID: 20250507154119uscas1p2a4055d14ab111fdb94a6378789c38d9d
References: <CGME20250507154119uscas1p2a4055d14ab111fdb94a6378789c38d9d@uscas1p2.samsung.com>
	<20250507154105.763088-1-p.antoniou@partner.samsung.com>
	<20250507145018.385c0a090a0d61c06e985ad9@linux-foundation.org>

On Wed, 7 May 2025 14:50:18 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:

> On Wed, 7 May 2025 10:=E2=80=8A41:=E2=80=8A04 -0500 Pantelis Antoniou <p.=
=E2=80=8Aantoniou@
> partner.=E2=80=8Asamsung.=E2=80=8Acom> wrote: > Updates to network filesy=
stems
> enabled zero copy I/O by using the > netfslib common accessors.
> Updates by whom? Are all the people who=20
> On Wed, 7 May 2025 10:41:04 -0500 Pantelis Antoniou
> <p.antoniou@partner.samsung.com> wrote:
>=20
> > Updates to network filesystems enabled zero copy I/O by using the
> > netfslib common accessors.
>=20
> Updates by whom?  Are all the people who need to know about this being
> cc'ed here?
>=20

I think the first cover letter contains that information.

> > One example of that is the 9p filesystem which is commonly used in
> > qemu based setups for sharing files with the host.
> >=20
> > In our emulation environment we have noticed failing writes when
> > performing I/O from a userspace mapped DRM GEM buffer object.
> > The platform does not use VRAM, all graphics memory is regular DRAM
> > memory, allocated via __get_free_pages
>=20
> We should identify which kernel version(s) should be patched, please.=20
> 6.16-rc1?  6.15?  -stable?
>=20

The first occurance of the bug was on internal kernel tree that was
based on 6.8.

This patch is against 6.15-rc5.

> I often make these decisions but in this case I have far too little
> information to be able to do that.
>=20

No worries.

I see that this is picked up for mm unstable as is? Do you want
me to generate a single patch merging the info of the cover letter
and the single patch?

The reason for the split is that I was not sure if you needed to
have all the sordid details included in the applied patch.

FWIW, we also have a buildroot patch that exhibits the problem
in a much simplified way that what the original bug report came about.
I don't think its appropriate content for the list, but I can
share if anyone is curious about it.

> Thanks.

Regards

-- Pantelis
