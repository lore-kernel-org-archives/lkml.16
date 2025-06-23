Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03B02676DE
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750704232; cv=none; b=T/6Q7CXBXbQwss4My7FD1Tf6xORCAm/GzjU5QPh9YxIuiOWwKWD9gVonIMmEU4PfONGtkrtUe/H/Qm2OrOyELQLyR2XThABEIRl2H1WeowaJXOIH+jjA+bjvsKN4rcrNLbMn5vouH80HVPVgjMmJW0nIALK1i4T56x7jlnP7dEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750704232; c=relaxed/simple;
	bh=nWtvjRx/ZEE61bWqnar3vqKmztUB9JQH/M2CT71MKA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rz09DCixflyRRIzG0Po7fS3Fj2/HxwCNvlGts2ravWSnCatO3EcwO/61xlDDqJRCWA00dQNDBP8QEJorgf1rcK7PRuVZyra/1TSBSVTaaDqIOAYkcYDXsdePidmg9ifdGl8QRH4sQTWZrP7GIIc8vP0HbyA3y/1C5jva2sq9yak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jmmS8Pfk; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jmmS8Pfk"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ND4FtV021411;
	Mon, 23 Jun 2025 18:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=zTPAnkeyXq83jKKhUTn665Cm5SJI14tYrKV0aZ2QL
	XU=; b=jmmS8Pfk6o63HBGVsdGLlNwCPvJBZAzdvEXl+4K+rHM+EI4PaPo1LXKqO
	RhCLkxXBwUZcaDPusL4/atgcEgs2aA0eQ0kc4BQY3l228VpsnJmomaKYcny+gu3Y
	Btn8RJ4N/iGMe593wvsUS8PRzPJ46bZtDyejYpQ6KTYfAsSYFO0xj5sbrVEnE1Bc
	Oj+02VsoohbD330XCoNa/TJV4IzAGLBvnMIdwaZ+L6ZdG1VVeTKgPa0jOxBTZ/Eh
	FHevfKd3OuD63KIghpMycYDmV9PEipl2Ey8KT+BM0YshaXdE/VSqIgBfNd1IOqsN
	6C4Njiv4WH5deypLUKUX9t8D5f57w==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5tm5mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 18:43:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHitC6002467;
	Mon, 23 Jun 2025 18:43:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e8jm03sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 18:43:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55NIhZWg29229624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 18:43:35 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5E8620043;
	Mon, 23 Jun 2025 18:43:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6625D20040;
	Mon, 23 Jun 2025 18:43:35 +0000 (GMT)
Received: from tuxmaker.lnxne.boe (unknown [9.152.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Jun 2025 18:43:35 +0000 (GMT)
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
Subject: [RFC PATCH 0/1] mm/debug_vm_pgtable: Use a swp_entry_t input value for swap tests
Date: Mon, 23 Jun 2025 20:43:20 +0200
Message-ID: <20250623184321.927418-1-gerald.schaefer@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sxpMR6GufTBHXZDBrpyzjz85ESll-pDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDExNSBTYWx0ZWRfX9919fYtj2GhT fw6Ffia+T5O/sWlNDC0rUHC+pglXAusWQoIba3D4wxVhn2P69W4COPvFN4qtWCI9go1sduF4zKp CoaS/OJO9cx1rmR6RIZtLvZSgBsJUvqxMQQSYE0nvXNtHDeeEF+jCuNQzrpRMnrrzaBT1BYai4p
 g0r6e5dt+iHiJisoKyfC7eI6k7MUQjbHWPw1ZwlW2QnVMQq/OX44XKwAtlVlXvEUD9KFpCL7a75 rlNIPk/asogAzgQQ3EYOy45Iwb0+B+LPQvFjo4kQmQnsX8eZ2QFfStOeSj+uCCPqLijCsAMfnSX Oqo43tyFMUYjY1P1KFapCDbvxfv9GPWmFfJeNi1un2MFYLl+nm/rMpEzuD72rNQRMyLUyZ7yiCB
 KOCryqsPpUi9nUUy/83y9l+Mnn8g6d5Jjb0S0jDShWQXDmp8XbvDEQeUJrvrDAZpjRssAzGT
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=6859a05a cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=CZB7Um9bMwATt2O9lgkA:9
X-Proofpoint-GUID: sxpMR6GufTBHXZDBrpyzjz85ESll-pDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=622 impostorscore=0
 clxscore=1011 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230115

Hi,

currently working on enabling THP_SWAP and THP_MIGRATION support for s390,
and stumbling over the WARN_ON(args->fixed_pmd_pfn != pmd_pfn(pmd)) in
debug_vm_pgtable pmd_swap_tests(). The problem is that pmd_pfn() on s390
will use different shift values for leaf (large) and non-leaf PMDs. And
when used on swapped PMDs, for which pmd_leaf() will always return false
because !pmd_present(), the result is not really well defined.

I think that pmd_pfn() is not safe or ever meant to be called on swapped
PMD entries, and it doesn't seem to be used in that way anywhere else but
debug_vm_pgtable. Also, the whole logic to test the various swap helpers
on normal PTE/PMD entries seems wrong to me. It just works by chance,
because e.g. __pmd_to_swp_entry() and __swp_entry_to_pmd() are just no-ops
on other architectures (also on s390, but only for PTEs), and also
pmd_pfn() does not have any dependency on leaf/non-leaf entries there.

So, I started with a small patch to make pmd_swap_tests() use a proper
swapped PMD entry as input value, similar to how it is already done in
pte_swap_exclusive_tests(), and not use pmd_pfn() for compare but rather
compare the whole entries, again similar to pte_swap_exclusive_tests().

But then I noticed that such a change would probably also make sense for
the other swap tests, and also a small inconsistency in Documentation,
where it says e.g.

__pte_to_swp_entry        | Creates a swapped entry (arch) from a mapped PTE

I think this is wrong, those helpers should never operate on present and
mapped PTEs, and they certainly don't create any swapped entry from a
mapped entry, given that they are just no-ops on most architectures.
Instead, in this example, it just returns the arch-dependent
representation of a swp_entry_t, which happens to be just the entry
itself on most architectures. See also pte_to_swp_entry() /
swp_entry_to_pte() in include/linux/swapops.h.

Now it became a larger clean-up, and I hope it makes sense. This is all
rather new common code for me, so maybe I got things wrong, feedback is
welcome.

Gerald Schaefer (1):
  mm/debug_vm_pgtable: Use a swp_entry_t input value for swap tests

 Documentation/mm/arch_pgtable_helpers.rst |  8 ++--
 mm/debug_vm_pgtable.c                     | 55 ++++++++++++++---------
 2 files changed, 38 insertions(+), 25 deletions(-)

-- 
2.48.1

