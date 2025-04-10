Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3462036F3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285125; cv=none; b=MAGeI29YrV1E7j5ESy4taatI2ZUv3KnXczrMpTmZjM6CxHy1jODWtc0tQT6oY+59xd2mSZnn3m+YLNosFrlWgeKn8tdcTOH5G0mLqZP29czdepflN3KOHalmuuZR88qGXyrPWKtpGc1ILvjSoHBeu9SBN+lRRak5r4Wkrw6bRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285125; c=relaxed/simple;
	bh=cQhqEnUWsx8dd+hWJR7OM0poOFCouFcfUiXIuilHOxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMpTGUw9r6+m2TxBb869kepUinsu8nTLJgxBmcszvxM0/D1MDjMPZqUhI1Cnn0TUvUTNYqHWGcLDS2lwFIXJwO2hx3cYYVRTF48wwL3ol6Nts8n/Te3Ix5yag/c66zmot6X9Vsd9mK5tx8T7nbBXqzxcjBaXVeELvZGAlZuQjAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YkG+zllf; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YkG+zllf"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A3K9Ou025369;
	Thu, 10 Apr 2025 11:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=l1pE9yaeBAvT1r9OGL5fZOl2lfeN0+
	wyYc90X93jrX4=; b=YkG+zllfsEQ28Xj9pCpKD0saN8iuiLEMayVV1DO+X5snxd
	8MRXn6JEoUviCSVA9n+xukOMAmltqGI1u+triIev4AcGmSa1bG7QP3U2ITT1ZLZi
	qvZJt0+rFWHTIrYcSyIre1eVxVXzOSenuJahY1QvzWJbQf/eWUags5QHcPaYLVm+
	e+PncB60HBl0jSbIupt2y3Cs1M70/SY/aR3EY9Exfs5Sjlz3+FFx7+WlrfSl+Zcz
	VD8me7w6gMdZnMHr6RilM8xlFgyFi+3DbkqJmwJbT06OtkYyqHNtwkbGui99+bQq
	FP801+SGggbZMIx5PD+3o81Brg67mC/VM/JU5MUA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ww2xdcju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 11:38:33 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53ABcXbx004812;
	Thu, 10 Apr 2025 11:38:33 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ww2xdcjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 11:38:33 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A85FcD011326;
	Thu, 10 Apr 2025 11:38:32 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf7ywxbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 11:38:32 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53ABcSB836635116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 11:38:28 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B92BA20040;
	Thu, 10 Apr 2025 11:38:28 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2542920043;
	Thu, 10 Apr 2025 11:38:25 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.39.22.212])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Apr 2025 11:38:24 +0000 (GMT)
Date: Thu, 10 Apr 2025 17:08:22 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Gavin Shan <gshan@redhat.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oscar Salvador <osalvador@suse.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Gavin Shan <shan.gavin@gmail.com>
Subject: Re: [REPORT] Softlockups on PowerNV with upstream
Message-ID: <owom635ndcq4q7focxbhmyvzckbtxme6n2p7g2v25b3jevuoeb@3nzz4nec7u7n>
References: <20250409180344.477916-1-adityag@linux.ibm.com>
 <0f89dd7e-937b-4575-855b-561ff6e932e5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f89dd7e-937b-4575-855b-561ff6e932e5@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a2heboet1YIXmZdWOMR_T2-ClXMNkMAh
X-Proofpoint-ORIG-GUID: k645CBo8c_4tnEQs8bhx9ftcvjQMx6fY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=564 bulkscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100086

Hi Gavin,

Sorry for the late reply.

On 25/04/10 11:35AM, Gavin Shan wrote:
> >      [    2.783371] smp: Brought up 4 nodes, 256 CPUs
> >      [    2.783475] numa: Node 0 CPUs: 0-63
> >      [    2.783537] numa: Node 2 CPUs: 64-127
> >      [    2.783591] numa: Node 4 CPUs: 128-191
> >      [    2.783653] numa: Node 6 CPUs: 192-255
> >      [    2.804945] Memory: 735777792K/738197504K available (17536K kernel code, 5760K rwdata, 15232K rodata, 6528K init, 2517K bss, 1369664K reserved, 0K cma-reserved)
> 
> The NUMA node number leaps by one. It seems the machine has 800GB memory if I'm correct.

Yes Gavin, almost 700G:

    # lsmem
    RANGE                                  SIZE  STATE REMOVABLE         BLOCK
    0x0000000000000000-0x0000001fffffffff  128G online       yes         0-127
    0x0000400000000000-0x0000400fffffffff   64G online       yes   65536-65599
    0x0000800000000000-0x0000803fffffffff  256G online       yes 131072-131327
    0x0000c00000000000-0x0000c03fffffffff  256G online       yes 196608-196863
    
    Memory block size:         1G
    Total online memory:     704G
    Total offline memory:      0B

Thanks,
- Aditya G

