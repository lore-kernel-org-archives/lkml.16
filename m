Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C2F2EAE5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671449; cv=none; b=GkSyDz4RUeni69N0ueVfhCtUDtTjexuiorbt3t1SyhCFlPBYyb4qjD+DpB8rlt82AKm0JnCy3AdAQPySUV1tLZCrXfZcmz1xVl+mS2+belPCqjfNrrC5n0qRsjBOuql7NnFtziN0nCevATsT7NFex2JhD/usq7Fa2Q5tx/W77HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671449; c=relaxed/simple;
	bh=aGAsZtOVZnmCbGPZiQ3PAX45eEr5Ak6Qn9bMauLq2wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlQXS9BfxW+ju59MDRA7zH2QXgF0EaSHrqMNkhElxkRE1CrIJJGYGrtM4aKJhf9kMZtlu51KyQnbFK+OXfeDVLVnQ97gGxExoHT3TIAU/8GJi3BKQyMuN1MbMf8HmjUxSOadt1EilFtpVnaYbYOCL3GvMufc8jaOWfV2m9x/Vbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dm7qr4/u; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dm7qr4/u"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MMjbjX012278;
	Mon, 23 Jun 2025 09:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=l1TtOuRllpOCNnGMcD45DT7zyGjF1i
	ie8WDbcU0BFxU=; b=dm7qr4/uPkHO4DV6fiky9VzQsNVA71uh2lP4D0rVvrdhM8
	Oka3X6B4ZKqEWbYVjuh/Gr7uRJk4QTxYTDUkytZnu95OLIwlqADCZ2wTBcw49cMO
	75v6I3f0nxJSpHyqZaOdA7HIDIvG11XQL9RU64KNch7Gg8OVDkTDVo1rILPKCyPT
	SIc66xz2esrh5ktMrVxz9B2SOF88jWvHw2YCnqOF5V16q1fZmb8H9I24euqOJz1W
	bacPcMpGMWM858PEI6HqgBRjS9F6nNYxcp8xKYy1+sB+aOUStlMbfWiv5uKB5Oqo
	VqTAE6nCHrNF7pnKAefvhwGHAqAFv+yVzCzenYLQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmfe0nhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 09:37:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9R5JW004643;
	Mon, 23 Jun 2025 09:37:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e99kdaup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 09:37:19 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55N9bHq633620450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 09:37:17 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B565D20043;
	Mon, 23 Jun 2025 09:37:17 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D3DE20040;
	Mon, 23 Jun 2025 09:37:17 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Jun 2025 09:37:17 +0000 (GMT)
Date: Mon, 23 Jun 2025 11:37:16 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: move mask update out of the atomic context
Message-ID: <aFkgTA+02bV6nldk@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250623080440.3005693-1-agordeev@linux.ibm.com>
 <c11a4b2e-6895-43b7-9ff6-620793bf8551@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c11a4b2e-6895-43b7-9ff6-620793bf8551@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2G9D2zeuV1BGw5-UikZsaNQVpHz3CkAR
X-Proofpoint-GUID: 2G9D2zeuV1BGw5-UikZsaNQVpHz3CkAR
X-Authority-Analysis: v=2.4 cv=BpqdwZX5 c=1 sm=1 tr=0 ts=68592050 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=QBSra2SYcZg9TIse_A4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1NCBTYWx0ZWRfX+L4UXNbSV4+T tBTReFTYYwutmoz0knu/XNIKLBq69M7aXgDRLv1bitj4RYXanO99MFD2NenfqtGWe2cMhsNIa8i 0x8po7TjkMyQrVlIBLxIb5atSCZ4MrVR+q1NYBu7hi2gcEoplXyk0sENGggFplod6zQQu86Yxlx
 B6u+ySvJYAve5iZpVPVeEK7t5XJbr4QmAKsvz3bAmaXOScf8ix99qDSSWh/Tydams6aMyz6hxJ7 YOkWV9TWLJ0zpnQPCbI5ZM+ipDbDhkmZR6WDfA82ioSP77PNaY4of34ugAhONY1ctPFfjrPxUoa ZCVjdg5PHUKA/TwJDi5jepKjYgKzULAAXl/gJIyX7ydqS9W0wEP+/VDHEUgR2TFG4wLL/8omCe0
 ee96nHe8I/Gu8jTeWoSTaZxOksFdGXiNNsjRRpGQ8oH861hSYwDsFIFSWql6bNtnARI3mRrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 spamscore=0 mlxlogscore=861
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230054

On Mon, Jun 23, 2025 at 02:26:29PM +0530, Dev Jain wrote:
> 
> On 23/06/25 1:34 pm, Alexander Gordeev wrote:
> > There is not need to modify page table synchronization mask
> > while apply_to_pte_range() holds user page tables spinlock.
> 
> I don't get you, what is the problem with the current code?
> Are you just concerned about the duration of holding the
> lock?

Yes.

> > Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> > ---
> >   mm/memory.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 8eba595056fe..6849ab4e44bf 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -3035,12 +3035,13 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
> >   			}
> >   		} while (pte++, addr += PAGE_SIZE, addr != end);
> >   	}
> > -	*mask |= PGTBL_PTE_MODIFIED;
> >   	arch_leave_lazy_mmu_mode();
> >   	if (mm != &init_mm)
> >   		pte_unmap_unlock(mapped_pte, ptl);
> > +	*mask |= PGTBL_PTE_MODIFIED;
> > +
> >   	return err;
> >   }
