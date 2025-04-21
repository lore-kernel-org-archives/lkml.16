Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5923D81
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745228500; cv=none; b=GMuFp/pehdUtol4TySdUXJdEQDmviBZU+iop/FAgGXoRTrQ6n9edM2mFSz4duxVp1/IjfoLlQTsYKF0ABduxADiAzeUBCm/K97iMYjtMEhsiOhzNteVW1Ot/2aiHPgIuDCTmVKy9yAlfFWYdBTSG8bRkelEzlAsdJOrUTXQLNkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745228500; c=relaxed/simple;
	bh=uPgfam8lKzJ6HaS9GA1x6r5vZ0rGveb0lKBAkH9cU6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RQJgMvoilm5UTj3V92ziacoOXtNihztO3zbzyuKd1+FAbh2rRZ01/FZTTWgBUxdssc+ZPn1Z17pkcd3Hy5tk91SOiaYuqPmmFBpbeqqsI1WtOXYic/4JmbSf+k4gAY8n5nGjLpxo8jLfG9zDcEKhZX7qmU2y3jVv9yyYwJqPOiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=eNLrVgkk; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="eNLrVgkk"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KKj4J0023900;
	Mon, 21 Apr 2025 09:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZM/Vh+
	Q8fAqwssrrkeeTgcVyCQuwd+1HH02zH4Dgn4g=; b=eNLrVgkkl2mmBl0kxo8tha
	Z3ShciAV2kM0So19TgJeo4HU+Kloy/QEej3HSUBJd8kTPQwYWDIpyegacnu1+2ol
	HbZ/sohb8HPgPqGyibpUV5E9qzejttBm/X99DeGO6dFWXRRqmGNDiexpdDCNYaeq
	5sa9aFNyGWoZEhaR62EVpvm6uX/TVYDntPSRpUkgtGhffLR8+Kal1/cw8/wpZku9
	3lQO3Hopcp4H3cXGkaVoyUEL2SuWRorvANelxuDTYy4PvSvYAEphjbIgvFrt4mhy
	dmGLKHX/Guh4L0ezMflVcuu0ASBrFXA8xOGFiLbX/ydf13ckaXiTg3BdFcUc63Zw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464ycrkjne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 09:41:24 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L8mAAC028109;
	Mon, 21 Apr 2025 09:41:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 464rv1wdkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 09:41:23 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53L9fMFO45023630
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 09:41:22 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A3EB2035B;
	Mon, 21 Apr 2025 09:41:22 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E945D20352;
	Mon, 21 Apr 2025 09:41:08 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.29.154])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 09:41:08 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Anthony Iliopoulos <ailiop@suse.com>
Cc: linux-kernel@vger.kernel.org, Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH] powerpc64/ftrace: fix module loading without patchable function entries
Date: Mon, 21 Apr 2025 15:11:05 +0530
Message-ID: <174516637905.525631.8856999917576384417.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250204231821.39140-1-ailiop@suse.com>
References: <20250204231821.39140-1-ailiop@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Jp7xrN4C c=1 sm=1 tr=0 ts=680612c4 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=X3jz0Fj359h8prLIXbUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: WEC61si-qoKmDNKnOHVL0ow40nl3lrfn
X-Proofpoint-ORIG-GUID: WEC61si-qoKmDNKnOHVL0ow40nl3lrfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=645 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210073

On Wed, 05 Feb 2025 00:18:21 +0100, Anthony Iliopoulos wrote:
> get_stubs_size assumes that there must always be at least one patchable
> function entry, which is not always the case (modules that export data
> but no code), otherwise it returns -ENOEXEC and thus the section header
> sh_size is set to that value. During module_memory_alloc() the size is
> passed to execmem_alloc() after being page-aligned and thus set to zero
> which will cause it to fail the allocation (and thus module loading) as
> __vmalloc_node_range() checks for zero-sized allocs and returns null:
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc64/ftrace: fix module loading without patchable function entries
      https://git.kernel.org/powerpc/c/534f5a8ba27863141e29766467a3e1f61bcb47ac

Thanks
