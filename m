Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572172D540A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749611819; cv=none; b=pZ45IDrL+fnRLvS13ZR0sYGIcFnaSrmQHLkIBVpmDSdFF91Dc3tgROQkBgVRi1IlP9JCS21fxPbPgn0u8JZnHdyOcCyOVtpHdbAqZDPXh2HZ3m45zSFw1W+k15oNW+s8NAAE4/ExuTHwv0Q+OvzsdZwPVcfYuY0spor3LoVlR5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749611819; c=relaxed/simple;
	bh=uZYSpiFyR+2v3gwt3Pee+0fiBDdWdtHQDHUWE9BoU9o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nRvCxDfZoO3f5FEtLM3Me2o9kkPoESLM6gvI6VfKPkAo+a83+svNWtmZ3IlV5iOggrZpBHKizhEGkLkuuVjGfSG9rfh8jJVxl7rD8LLPnufVhHnsUTt8Xmpx/O4sBmAcK3y76dSL8W1zcg4dk3lOiuHZgt1GXa6Hyek6qrrsiCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LPSzMqm3; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LPSzMqm3"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B0wOUA005022;
	Wed, 11 Jun 2025 03:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Lf7BvV
	IDm8EM4XYNV56QJUeGN0cANCnC7Jw/EtcpFEY=; b=LPSzMqm316st9ZRmvQohwq
	4MmCCN2w4wfiFJhlO4k5MovQ1dKzRcpmgm/P+yIApgO/iNYvXHfdB0Tj/HilTVME
	FurFKplwHWSRHlkT4BXyv8jMsUdHdUIcURVpUFQZLOgJzoIJjVOUfiRi7h+1HQ1L
	aY40ojvmwYMeOSPjZPCC6Y8www2W8nXltmxw4vKBELl8p45bLuOZw7Zn/TUuSSr5
	d0ZPWuIA403HCN8Gmxr4t5iVEKh2P/VJZlV7jELBQOfH7R0ZrP/4nwrecoAJksrT
	u/y4b3G/NTMt/v5uwfech002AuL3BRYcoZA8u+tAdSYL6jnCv/Dx3b2Y0RcGQd9Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474x4m75yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 03:16:40 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55B0odqo015369;
	Wed, 11 Jun 2025 03:16:18 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4750rp5ph4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 03:16:18 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55B3GH7N17760930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 03:16:17 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E46458056;
	Wed, 11 Jun 2025 03:16:17 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15F665804E;
	Wed, 11 Jun 2025 03:16:13 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.1.82])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Jun 2025 03:16:12 +0000 (GMT)
Message-ID: <491294f7088d9946d00379fd833c0ab20069dea2.camel@linux.ibm.com>
Subject: Re: [PATCH v14 00/11] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me
Date: Wed, 11 Jun 2025 13:16:11 +1000
In-Reply-To: <cd96d70b-1eb3-494a-912a-52d479e3df87@csgroup.eu>
References: <20250411054354.511145-1-ajd@linux.ibm.com>
	 <cd96d70b-1eb3-494a-912a-52d479e3df87@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Y4X4sgeN c=1 sm=1 tr=0 ts=6848f518 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=LR7N31DEqsj-hj7dFvAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: -tWHcyyOJQhD7KXGwD8yxemJpeXmI38q
X-Proofpoint-ORIG-GUID: -tWHcyyOJQhD7KXGwD8yxemJpeXmI38q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAyOCBTYWx0ZWRfXz2I+ORnuRokq a1euH+5GS2nvtXIg9KZ82iGM3bExHNmu5ahRlJPOx3jxFV0SITLic2eKrapS4OsG1RiGJQbdUFv AtgTIs5t17enLT6alHjDHLvIYWCvZ+5HRsxB6rH+zQABD7lwtqsp3su7ZnJEJKbUus1WPF52WP9
 WG9K3XaXwpG7i2Ii7XIT1M7bDCkh40mlNuu34I4vE8XW7VAX+brkzSvZyRbNDjSsVnGuWjfnc/S rH7mYWhK0GZRoBM2wFwE3TP8VfqLrdwFMWR4d9dPPgYovR2hioNprdwcMJrLAxnBXqg2QOe4CdR tE4vsV0uSU0QrueVVUE417GAiDJ9kJ6x3MXfrJvD7KVlWw8iNvICnqIXyK5gmbWYI1GUOOpGFDM
 WNY6llks3q2menjJsssWIqBdQa2nGulbcPasMef/2UjR+YWfXAYcROAxmMSKq/ajJGg/AUD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=703 spamscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110028

On Tue, 2025-06-10 at 09:33 +0200, Christophe Leroy wrote:
> This series requires a rebase after commit 91e40668e70a=20
> ("mm/page_table_check: Batch-check pmds/puds just like ptes")

Will respin!
>=20

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
