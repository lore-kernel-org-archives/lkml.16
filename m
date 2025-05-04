Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C981CEEA9
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 03:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746328891; cv=none; b=VWLnDxunWLfu7PhSZ1Bqoc/AevOslsOA8AzDSq1MRsp6CRM5thFdntYeRVRGACfyDH2UDSpukf6SMwR6LTuRtA2qxlhXe7Gq5m1Yt54lJ7+CP6/4wFR3RSYA2v37BLxeV1yEcowauS1xXUhJWUAOwBH314Vsst5dbx6vOowIEbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746328891; c=relaxed/simple;
	bh=gjlBR+EQfNI2SOuCVKehiqnKcN9FMckkmpMwxXIw9vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mYgCqte0fKDLZGzwe85B5eNCnFVyi29Iu/dff9w2WUxmaCCoTzzeuXwonPGh82L0umJOcvB+kQe1IKB4HlAvwbMMxm7ocH7TbFwbHpUZ9UGHyibWq5O7sJS3Ob6iL0h/jQaMS9EWtLSXgA+ef57qGUzhGmaXb1oupMmgLlVurJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=b6MIv9i0; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="b6MIv9i0"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5442tbWg003043;
	Sun, 4 May 2025 03:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RSnqLA
	nCuOwwUQA49ChNsRa6/RNKI8y6V4u+POvMpPI=; b=b6MIv9i0HIAs2ogwR41feg
	FlRLof+Ptw+zgZsKZ92xOYuvzbbvZCDkBh+t1f2GMv3uppKPGAXQ8wEplK8+Nj0+
	luJDhOCPsvTQ38rMgFiVzPZ7yHA6gqmFFoq/36N7j1fqOUFy86n8qThjchYOoJSw
	BRwAwRi2ygWr0K95sz76DSX0I5UjQLnc4vrXi0lpAyX6+xqlFTCHQBN4lDMP3Ho0
	SRVjeNwMnCQRKV/xMsud1sXbHpfoH/5WIbarSP8ZK2x9N3otsCp2lvyOPWKvzg/3
	hKU3Uf8G+IszLLRUMsG29Fw3c9MJ++eWoHEhx5CA+1GCkRKI2/DJGmhqT/7XBmlQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dw400djw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:11 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5443LBib016023;
	Sun, 4 May 2025 03:21:11 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dw400djv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:11 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5443FNBc013769;
	Sun, 4 May 2025 03:21:10 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46e06200es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:10 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443L8qL34865700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:21:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B539320043;
	Sun,  4 May 2025 03:21:08 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6929820040;
	Sun,  4 May 2025 03:21:05 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:05 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Don't use --- in kernel logs
Date: Sun,  4 May 2025 08:51:02 +0530
Message-ID: <174632869189.233894.3764174532974244105.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <54a1f8d2c3fb5b95434039724c8c141052ae5cc0.1739346038.git.christophe.leroy@csgroup.eu>
References: <54a1f8d2c3fb5b95434039724c8c141052ae5cc0.1739346038.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=KefSsRYD c=1 sm=1 tr=0 ts=6816dd27 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=BWUmfwPSzPqrUTimO94A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: AlRTDl44keZ1oD7kyKlnWOkEl1iSzhxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyMyBTYWx0ZWRfXyYbS54hKH5IB TjXJhKnG9LhQtfdXQQg/2rLkWb/9602G6d+Ae31Y5+7vFluMlB1vBxfj+VtF4Lkoj3jwYKQcl93 l5Mseq9TJDmMTTesPB70bIMq0NrrpZR1KW+Gq8hHIM3P38l4Juh2MBtmbMehiwtPflnjjK1Y2NA
 awStsPlF9rFvcC3MXPS06p4s//fDB0pKHR9bAJOHsL1qeP+lYtm6vy+LWrbPw+QVL2zIUpMGs+k OXTFPgQO/RzbEEpnsSBBXxWjBTHfvgeq+wo0SPBtw2cTxmlSokCK/WOdE85MTi7Bd+Hhg90TmkM NZnryF1M57lOnfWRrTRWqyK3EKyRLwLTYDkg1rZyxy3IvcoFTk1q+QIROsYTVzbp2lrHAyUW42f
 bzZjf7LVP5C1083qT3NsueRh9zLO4YNTdUcFl9zp1HnNdA5r4aCx/arwJ65Q29Mx5L5Vh/P0
X-Proofpoint-GUID: BGoVprOT3Uk5pRqUowKYnM4iyizUHIrW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=793
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040023

On Wed, 12 Feb 2025 08:40:48 +0100, Christophe Leroy wrote:
> When a kernel log containing --- at the start of a line is copied into
> a patch message, 'git am' drops everything located after that ---.
> 
> Replace --- by ---- to avoid that.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: Don't use --- in kernel logs
      https://git.kernel.org/powerpc/c/b2f64cf1585a3afd06261dd4ae067136b6a66eb4

Thanks
