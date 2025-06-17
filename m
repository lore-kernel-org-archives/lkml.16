Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003192E92A5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750173099; cv=none; b=r7ehGS5xJRkNxQbwLottotRa2WFbeXUDnbNjDczfOr2khig2SKEhmV1GKyccQXaCPczcc5sMnU1a3pzSl8v/fMb8rAgZq8CoYmKHdLZaszd9L2I0/I0sG4VUxc2LSdW6nBJjRQm1ARXA7b3i6z1xMxEWAKGeKIugQJ5AEL5XxU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750173099; c=relaxed/simple;
	bh=D1xpgUiufQqGSAFsktT5SQTgF2ow3I6SW1h/cuQN4NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Px67/2lVA554GkJdHj1pQ6CuDpLdGj+N6s7xVDDqS+CkOoQzDzDHa0PkMsx9nLNcu1/G8AXSKlerO52SyoovLcs/ionTWgyVmU1L+0zx75ZxWjDLfhsaC1hAATYD3x/6j2bhn/AZYI5gSlO4JJ4eTZRReaZ+eVzrRGLVBN03Upg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=UStt92Je; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="UStt92Je"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7Xnl8007806;
	Tue, 17 Jun 2025 15:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=tyE6Jk7I6J4F9U1VAB3dQQj1GhBcvx
	8L6Dln61RzEUA=; b=UStt92JeOBcqDT2EumuXm+JO9hxJTh8MhVnlhKOqroKtxb
	iaOJBZKPUPg2LASWLwV5Wt9pOecTACtcyqb0DBUiFET4VNpANRCc7eiySLU7rUrq
	oclC7b0BaCInSLhzfxs/lMoYygHf1OPPJc4RT56XiccRocJIc6hTeIMi0/yv0pc6
	0dh5GysrEJ+4vL/bZPWqHjU3v9V79kLlj6pJSR5w+hpmv+8KrYxjmkS5/b9fQQiJ
	5p0EuPp5EJDAlAW2GI03FqntvomlrwgXHBxIia7QiKE5PxPlXtisjeO3GNKHprO7
	syDu6ZOTWiCng+rh9Sm8kGi+VnZBlZfhQfQ/SE7g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790te1a6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 15:11:23 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55HEkeZk029566;
	Tue, 17 Jun 2025 15:11:23 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790te1a6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 15:11:23 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55HF2GBp011233;
	Tue, 17 Jun 2025 15:11:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 479kdtcc79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 15:11:22 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55HFBKM854788544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 15:11:20 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBC012004B;
	Tue, 17 Jun 2025 15:11:20 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BDBC20043;
	Tue, 17 Jun 2025 15:11:20 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 17 Jun 2025 15:11:20 +0000 (GMT)
Date: Tue, 17 Jun 2025 17:11:19 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/64s: Do not re-activate batched TLB flush
Message-ID: <aFGFl9Dvb9zdC3JS@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1749747752.git.agordeev@linux.ibm.com>
 <8625a1d97dcf4ae499b4bb341e27346f768a7248.1749747752.git.agordeev@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8625a1d97dcf4ae499b4bb341e27346f768a7248.1749747752.git.agordeev@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TrIPqeZ_BYY-f9iteuBELN1rvGn3U0dS
X-Proofpoint-GUID: bkIiAnLD45FrZKdAPu1jW7F3_qcF-9OP
X-Authority-Analysis: v=2.4 cv=c92rQQ9l c=1 sm=1 tr=0 ts=6851859b cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=zQje2rQ7M4ZH0Jh3yrQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDExNSBTYWx0ZWRfXwnUpwC85+dfW F7bc1aXZVbxehg/jtPakxU85aC0c0NZW8qt4Vp8qqdnE3KEChDFenhY4gzZjT9b6V0botJJ3V5+ Qj8d8Fdg+GA1TOKJjSQAaF/28RAFIsydP3bFXqsSSLY3JBd3/DhZ0ZO/W9W19LDGARlzo5mo/Z8
 GV5Z//BgNNnHgiu8aCDrAqVC5opPk8+ici1DxP2d1Coa6NxtQXR5NxyzmguOGJymULFXG0Pp+sa 8VSTlAt41n56mFUSjqZwvqMZabjNkWxWoC0ZTe7U+hcG7po93k6/i9S7+Z9/fOk+CPT3vx+1w/2 +EG8SFBZWlD62yXPyoAOnpHKeyV4E4US2oLsr0zwcBPNLxnmzQi1iUUbcj90DCAtJoX/7+DiWot
 H4YidpzZpnvLXM3K4qsRcXNdRPQ3FfRrLTC35WinFTZBcHdci47uDl+nNkSU0EYmiUyIItcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=283 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170115

On Thu, Jun 12, 2025 at 07:36:13PM +0200, Alexander Gordeev wrote:
> Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
> lazy mmu mode") a task can not be preempted while in lazy MMU mode.
> Therefore, the batch re-activation code is never called, so remove it.
> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/thread_info.h |  2 --
>  arch/powerpc/kernel/process.c          | 25 -------------------------
>  2 files changed, 27 deletions(-)

Hi All,

(I trimmed non-ppc mailing lists/people).

The whole series does not seem to make it, but this patch alone is still
applicable and makes sence, if I am not mistaken.

Thanks!
