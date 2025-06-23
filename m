Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75540219E0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683853; cv=none; b=a/EYf3hQ38c96rfV55yucUBig8m6kCLFc6V2gK5LoaZfGLP9I42Qo0JN8KqyMZyLCJPlSyd2EXtN8qLapp96Y4CWMF5lbWquFWzlCDNmI5jHE8aWixjQJSJPK6/lULJqN4Bbf2gdUtTcBg6++cd9jZmGrvdNeYIhhkSFzjumX8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683853; c=relaxed/simple;
	bh=vkkbEVvsanzFnS5wzFpOck7Vf2hi1pozP8wQOIiDyRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVwlJDR2/y9tPldsRg5GoOw/m3+vwnODiiTOHnS9r5Mb3Nq5mhIiM+ufBjCG0uf4xXLPLv3TkeLvP4CYk/dvqRiHVIMA3k0uqoxeusAYloFnOxRHBgWfp6nwJlFDjs0PqzG2bR3qeb2F4pE2YDc5wj7QUhKO/5lWUzuIWhjgbeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Xzi3226k; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Xzi3226k"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9voZh005257;
	Mon, 23 Jun 2025 13:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=m9hELVzQV/CVu64h3X5ywumxR1ai3k
	u6k0P1BVVTc5U=; b=Xzi3226khVmgxROOyNhHsaS/r+YCftnnz1r6uXRSLIV9TO
	4Q+kwPHj+KOE3FdCYdJOfKuQUGnE6GHYUi34ec1ZkfYwfKbLBoKKA4uvHN5PKIXc
	f1DIii0OeDtZJAOGPX5XBiRIYib2M2KnSdPK6MXDGiI5KW4RWhuBpqdUCNamKDLk
	HTCztzohRPUAym2OA2VNvt1ef99Xesj0KO4vPID0RiHQMdMTtysUmNm/XB4Q3jPc
	VmSZLbhqHbxqVYoU+FsJBpziZw4HLmcQ8PYe/ZeYDGQ4z8504EbIEDmXtcYj4Gta
	UnNG4QlAyB9gsW4H3k7MRct6g0d4/ICbFhItR6yg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dk63hyn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 13:04:03 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55NCJ9vU003980;
	Mon, 23 Jun 2025 13:04:03 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e99kefpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 13:04:02 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55ND41Kw48497118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 13:04:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26B7320040;
	Mon, 23 Jun 2025 13:04:01 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF8852004B;
	Mon, 23 Jun 2025 13:04:00 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Jun 2025 13:04:00 +0000 (GMT)
Date: Mon, 23 Jun 2025 15:03:59 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: leave lazy MMU mode on PTE mapping error
Message-ID: <aFlQv4dx7wFU5Cql@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250623075721.2817094-1-agordeev@linux.ibm.com>
 <107bfdb7-c8f5-45fa-872e-3e6928dc8025@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <107bfdb7-c8f5-45fa-872e-3e6928dc8025@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3NyBTYWx0ZWRfX70/Oa6vFHASv v/6hhtT+mIc57m8r+bFaS/YNqR+d4fx8hrbX7skWqGFDsokHeabeqBgWYZ7DngB1xPPmNSlWdD4 /TFYKw3nn/PDpxaQ0ETg5b2+Dwb/qIklh3VH/mcwPVWEGANk1DvvWu6arVvnPaWZuMNqosqqlbF
 XdA8NG3Vpzk3cSvGg3dCb+4X5ULGffpQEDnqYMRrRbrGQ1P1/2xm3Qe3YXXc3Pw5EowiG/npnZH cozLZMugKBOEQU2WhsTBelhwmriwqBnKbcT4baHoxiX8vxP8wDs2nF1lDnUH+u+DxrbRPplhQZS MjkcrGIqEOxMzBA3BErlrCchx7AiehZ9/eFdll4iPl/c/YTERbR7EwHGjiILPxQJEpgsseOSnRj
 g43cGr6ucKWlZ6QVJdX+rCgy5XTNVTGMkq93I/cttZfcDPL+BUw/LhfmdtYZav/B3pIAAOoF
X-Proofpoint-ORIG-GUID: otpcNOh7C6nwTbelLw_ZvPmJMfw4xxjg
X-Proofpoint-GUID: otpcNOh7C6nwTbelLw_ZvPmJMfw4xxjg
X-Authority-Analysis: v=2.4 cv=BfvY0qt2 c=1 sm=1 tr=0 ts=685950c3 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=VnNF1IyMAAAA:8 a=7CQSdrXTAAAA:8
 a=5IMxBn348DrhKD73ucoA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 mlxlogscore=914 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230077

On Mon, Jun 23, 2025 at 01:37:11PM +0100, Ryan Roberts wrote:
> On 23/06/2025 08:57, Alexander Gordeev wrote:
> > Function vmap_pages_pte_range() enters the lazy MMU mode,
> > but fails to leave it in case an error is encountered.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202506132017.T1l1l6ME-lkp@intel.com/
> > Fixes: 44562c71e2cf ("mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes")
> > Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> 
> Ouch, sorry about that! The patch looks good to me so:
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> I wonder an aditional Fixes: should be added for Commit 2ba3e6947aed
> ("mm/vmalloc: track which page-table levels were modified") though? That's the
> one that added the "*mask |= PGTBL_PTE_MODIFIED;" which would have also been
> skipped if an error occured before this patch.

Good catch! I think it certainly needs to be reported with Fixes
and I even doubt whether your commit should be mentioned at all?

> Thanks,
> Ryan

Thanks!
