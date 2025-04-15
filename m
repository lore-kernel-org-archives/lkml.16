Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204F61F3BA6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744711716; cv=none; b=UJXR8rBAwF6suK7utY9IqtoTediwRhap7LLhE/fFyxKzKUdYkxO27ezi+Dx9YdukcDIfbOj/5qnKI6DRuXULB9TibQN/DsLiVS8MOp2iCM3Q3uWrrB+0/dQAWfXmFFc40HZ5HvTus+JPCFtfXyaIBO1bW/XtUsT0/En8z6s4Sx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744711716; c=relaxed/simple;
	bh=KEdtRdGZtT6WGUPOU6xf9d1QLcy7vJjdG/Icf85RA/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOGfsSbmmS9y/sRX2Sv8spa1l7esWR/ddCUVIx/7tCKRxR6wllLi1EACdw+EsykVWf6oe1j1dcOxVvGeAlMSZxt/iZmzVON05em6LtWG+KswxlVlDdlSxTDo/l3nZoTBfBQq9nl5ttK0HlHJTqiL3Le27M5M78FoINxIMBjWGg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rlQ0SNej; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rlQ0SNej"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FA6RQb010512;
	Tue, 15 Apr 2025 10:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=uoWB6o
	ODF4vGA/wVyvPkkBdMQtGQswkOl7jpkuoQoV8=; b=rlQ0SNejghombZ7hr/2EB1
	5LaIz6BqTBUUSaz4/aEyqZxeiDb9IrVigj3z7LtPLBIbAlh7Q7XPV5r0NXt2K99c
	B5UJmP6U7wjdjaQUYEBqcryVm+5LUciujo8en4CHvoZ8pD23hflY/eQs/qAEqlDi
	YRNZIcZ75YoT70c/lx0hyi4LbWoafG723SSm5lPNRIi5RW49Je11+SoJPzuUjy2T
	30kzRyUQVABNMmmtjJcJdNFxNecqFiDM8mY8Fb1zXrQs8mCFMjcIOgD6gxXZtIf8
	5nervMIzufyN8URUNIx2I+KkBVB2Je5nvR0lVaOxBnA0qa3V9CwZh6BtVyZnc5tw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4610tpdkx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 10:08:25 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53FA8Oci000572;
	Tue, 15 Apr 2025 10:08:24 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4610tpdkwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 10:08:24 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7vLZ7016431;
	Tue, 15 Apr 2025 10:08:23 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46057228sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 10:08:23 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53FA8NGG30474888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 10:08:23 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40DE658063;
	Tue, 15 Apr 2025 10:08:23 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CE8A58056;
	Tue, 15 Apr 2025 10:08:20 +0000 (GMT)
Received: from [9.124.211.75] (unknown [9.124.211.75])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 15 Apr 2025 10:08:20 +0000 (GMT)
Message-ID: <b6b9a879-2d4c-4dc4-9977-e6eb93246f6d@linux.ibm.com>
Date: Tue, 15 Apr 2025 15:38:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] base/node: Use
 curr_node_memblock_intersect_memory_block to Get Memory Block NID if
 CONFIG_DEFERRED_STRUCT_PAGE_INIT is Set
To: Mike Rapoport <rppt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
References: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
 <d10d1a9f11e9f8752c7ec5ff5bb262b3f6c6bb85.1744175097.git.donettom@linux.ibm.com>
 <Z_d8T3QtnZVeH3HF@kernel.org>
 <d982df07-e7d1-4d4f-a2c3-857901ccc0d0@linux.ibm.com>
 <Z_j2Gv9n4DOj6LSs@kernel.org>
 <736ca451-8adc-4c5c-b721-6b78eaeb4699@linux.ibm.com>
 <Z_4q_1TEJgcvlUlr@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <Z_4q_1TEJgcvlUlr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aFtTDFmMEtXLwjWTGD_9v8Nyr9-p_8K9
X-Proofpoint-ORIG-GUID: 1GzkTuX2PTA6XZcj_qHVajY6bhEsw-TJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1015 mlxlogscore=780 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504150070


On 4/15/25 3:16 PM, Mike Rapoport wrote:
> On Fri, Apr 11, 2025 at 05:06:55PM +0530, Donet Tom wrote:
>> On 4/11/25 4:29 PM, Mike Rapoport wrote:
>>> It might make sense to use for_each_mem_range() as top level loop in
>>> node_dev_init(), but that's a separate topic.
>> Yes, this makes sense to me as well. So in your opinion, instead of adding
>> a new memblock search function like I added , it's better to use
>> |for_each_mem_range()| in|node_dev_init()|, which would work for all
>> cases—regardless of whether|CONFIG_DEFERRED_STRUCT_PAGE_INIT| is set or
>> not. Right?
>   
> Yes

Thank you so much. I will implement it.

