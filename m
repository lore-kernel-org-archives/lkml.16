Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B004E2746A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922376; cv=none; b=psOAZ0ORZZM3knkkP6+cJO+JqKvyb36gpxo3i5NQ93Z9mpNzhpVfnaMqHCz2Kw9WbhZbjDkc41/IQLy/DI8mNaWKoP+n8ZkiKlJj6PcqdyKpwdxqvCw9CPSufri5QYhuLgjuXbxwj0SJaRzw+mxtx0kJHr3NEUZtb8LXZrgqhK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922376; c=relaxed/simple;
	bh=DECGLCQlKzdICENdT1SAMdHUB8qJpQmLIj6F/5lt5cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEQsVJU6wT9uavdDt/tv+dp/Y4IE8iLAcEyKiyQX7IW43QvJuwswAFd9qo5wE1MZGNYApfgyuLpYcD0R6WqLxIAimf1hROsU/mGY5G7uycUowUYfk7eiG+n55VlwVjz9DnECvY7IajhvDYN33GROYvGZBETibjBcDvy9egyp9e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sFhTFzJx; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sFhTFzJx"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T4Ec39007851;
	Tue, 29 Apr 2025 10:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ekglh/dA3wRPB8yYZpbO8TuZXP094A
	b8hzDsZSCc+RI=; b=sFhTFzJxrIK7JX4TDyJmj3CAI5+FQcMuujEWTNX1svc7V4
	iMx/EHyGL6BzdOXdQMUyRlwsJ7bnrRD1VDDPBz8FcBdiGgBh5KjuNQQL7czPF9OQ
	GRPed/g+126gC0mvTYUrK4ymurYmFPcspBqnTeIGDD8PCe2OY3EfmylKH1biFcXx
	F4xGyakZlbqFlsrHUZZ1FMcIqBvZPTYfLHlkBoKeSH0e28w9OdR6ifFYwvVcqHam
	DrivzV7B7mQrduD4NZW07rz0t7QVxSlpHs9BEoIf/iDwN1izywT6l7LiAaHTqb6p
	dWhmNcxFMBIfnv68WaP2Ve6cQ5bCEgm+7XmEW+dQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46akn0t26u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:25:59 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAGsKI024662;
	Tue, 29 Apr 2025 10:25:58 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 469c1m2h92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:25:58 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53TAPuII38601018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:25:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DEC820D02;
	Tue, 29 Apr 2025 10:08:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 608D420D04;
	Tue, 29 Apr 2025 10:08:32 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 29 Apr 2025 10:08:32 +0000 (GMT)
Date: Tue, 29 Apr 2025 12:08:31 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm, swap: fix false warning for large allocation with
 !THP_SWAP
Message-ID: <20250429100831.8629C3b-hca@linux.ibm.com>
References: <20250429094803.85518-1-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429094803.85518-1-ryncsn@gmail.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=AeCxH2XG c=1 sm=1 tr=0 ts=6810a937 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=GvQkQWPkAAAA:8 a=aL_wZZtXDkcKPmASj-QA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: liS4cQCsfDwQjkie4Ouy93YR5RAYoAyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NSBTYWx0ZWRfX8cx8t7EGE8DD nP9nHG7Rw+gognLiLCCxhjEDvBjf2N6sWjeOhUc/lhXSMxFEKrBYTW5W5au2G63928wSiofobxM S1oKLkOn9vGOE8nCeM0JVovcEV7U+OVOw2JoUgIw1ICfIcexNalppxUQF1++AV9QTu63/TBc2Vi
 YjWoUG+w+5DW4uLvmpteAHBlWXPPFcHx51Jtur58JQOSzVMdjfu4vcL4ndyOILVSftALz3aqkgp tnLwsUhWoxzbo10k/ainfYse6cRK36x4TQtkw9tkS84Hp1EHpCoBUQjQlJj2xKb1ObXdKiYY9cE CrG8vhEJKCirxVZbwD+x8OFjpIsNDozCP4xNw6eIB7QQNLQFmtpESkZop7rLrQKC9+NPaKf1jq1
 mhV6e8GdB48vzICcyTAY63zKFfNFvGLU2qsmPqvbn9pNuov48fUpzPGdHPL66aLVIfomng0o
X-Proofpoint-GUID: liS4cQCsfDwQjkie4Ouy93YR5RAYoAyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=814
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290075

On Tue, Apr 29, 2025 at 05:48:03PM +0800, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The !CONFIG_THP_SWAP check existed before just fine because slot
> cache would reject high order allocation and let the caller split
> all folios and try again.
> 
> But slot cache is gone, so large allocation will directly go
> to the allocator, and the allocator should just fail silently
> to inform caller to do the folio split, this is totally fine
> and expected.
> 
> Remove this meaning less warning.
> 
> Fixes: 0ff67f990bd4 ("mm, swap: remove swap slot cache")
> Reported-by: Heiko Carstens <hca@linux.ibm.com>
> Closes: https://lore.kernel.org/linux-mm/20250428135252.25453B17-hca@linux.ibm.com/
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/swapfile.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)

Tested-by: Heiko Carstens <hca@linux.ibm.com>
