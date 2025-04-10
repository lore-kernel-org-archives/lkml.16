Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A121520766E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285784; cv=none; b=FEdWfWbhsb7NTIJTF67JJKkCZFnli6yNf7+9NoVi0gHXzU2H1tYfb1shT6WHPD0gt8DoKPmhe4ZicpN2JeBXYwoiUiE3I84PJTu+O44oCoJpWWx//Aj4MLr1qS6ejA6Bo7/YAGhB5LIy7Qfu/V6aZwOyUHmvzKIDaH9++RjRN4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285784; c=relaxed/simple;
	bh=CyX2dkyDy2TN3OuSCMBhy3trR7Q2dHlQ8ESZVuYmIvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8+V48JPeMstZuaWdPHr722HftuY9+dVLr10G7DoINezR92dQswIOSfTa1OeIBFJCICw6Cboq6oWri/uTrm51AO0cjeGcKcPJKPLpK3Pi4ujoxYdWxOBmvvnalhYqgBaWZRnm2iiVuVB2JUkqeFgfC/k5PbhXHlHgxll35LrAH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=aETAk7Cx; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="aETAk7Cx"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A8IfdJ025839;
	Thu, 10 Apr 2025 11:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=YycHY8LXypsniPbyo7Jy/mpsvEN/74
	51F4aByubUeHU=; b=aETAk7CxebMy70E0bg+qwnZ4DG43urQ3ygCh39/euNKuj0
	e+QwxSynbCl5K99Oe0X0WXB8EME+BHUfW76Gw4GmIHhIeQuNYa0C3cBOBu6gJRzH
	DYHMjpBILNjd8cdc2EhhWaem+BbIybne7quui+B6VPwGVx/za9bgXm+pDGxN5Or7
	onKLt8MMuww8GHBr3Jmt3HdPPfznDuWVtHAQZfA2hJcMGEHmqEV8szh7DpcaaET3
	CorEAuCzDGSko2Mte3GbmaVE9PENWJf3KI3PLDgJzTSfk+wohelEHiprYrkbSSKV
	EFh/D0H+7u8vewwjI7ZRGZdLQFmjPVnx+xTuZ65A==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ww2xdekq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 11:49:32 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A8jEoP025537;
	Thu, 10 Apr 2025 11:49:32 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ugbm5sfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 11:49:32 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53ABnS1O34407126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 11:49:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 558D120040;
	Thu, 10 Apr 2025 11:49:28 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81CE020043;
	Thu, 10 Apr 2025 11:49:25 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.39.22.212])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Apr 2025 11:49:25 +0000 (GMT)
Date: Thu, 10 Apr 2025 17:19:23 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [REPORT] Softlockups on PowerNV with upstream
Message-ID: <eyy6fqvthcafbkt54e6ihydwuvnmo7xcaoprcmghziwz4thtju@m7kkfamzyksc>
References: <20250409180344.477916-1-adityag@linux.ibm.com>
 <Z_dWTU8UsvCHFMpN@localhost.localdomain>
 <dc4c0d4e-a9a5-4fa5-b39d-4248fba26043@redhat.com>
 <Z_d_8fyQzGuwzbIv@localhost.localdomain>
 <675d6580-814f-4fae-9dc5-9470645adc07@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <675d6580-814f-4fae-9dc5-9470645adc07@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5CQ-Zl-R9tsj6QqgOZRJVhOUi4mDhqWO
X-Proofpoint-ORIG-GUID: 5CQ-Zl-R9tsj6QqgOZRJVhOUi4mDhqWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=476 bulkscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100086

Hi Gavin,

On 25/04/10 07:44PM, Gavin Shan wrote:
> > <...snip...>
>
> Aditya, please have a try when you get a chance, thanks! I verified it on Power9
> machine where the issue exists and on one of my ARM64 machine.

Yes Gavin, will try the patch and then reply.

Thanks,
- Aditya G

> 
> Thanks,
> Gavin
> 
