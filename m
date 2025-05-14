Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1437A1F30AD
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747195456; cv=none; b=NUMCZBlpAKbezXTJfWSfvVYFpiUg+5I9danke0hPi1WVSfle1pNxsQBG8gCcvJrdakzbBRU64ISOdUoyPpUKT/ghIlbX9gD5JEaGDgwh0rveOnn7Ryf7NGDwyyWBzTgjyWoTnfBLt6p1ptKbHJyooAf+dNfL793Ple12U1KbKvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747195456; c=relaxed/simple;
	bh=dGSEbBu1yDupP8z0NXRB9gSL9nGWeSF83JZ84tWAfAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R2fftDw6E0m84YKrhLpATgzF6cBh0tkFOGsbU46s4p+YAxu+EfRQ52Ri0R+9DFSmn8edMaWMbYkOr3pSCNm6Hvyeqv5+1mCG1D0vBdUOvE2UEaKlWtpGnlQ7oFUZh1sqRKhDw3nUuJcpIP9OC5ufTdtGpijH3eODlbg7NJt7vl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=bHyCUhco; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="bHyCUhco"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIoGg6016967;
	Wed, 14 May 2025 04:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ad7aBp
	tmgZxCHDuEJOpWxolJQLRC9j++XV27KJH6caI=; b=bHyCUhcosr7QUoxIiFzeLi
	rAcyb5AwRReXyW5FIQG21mdjjXN2bGiQa3oVJB8FhhVo2fd3hGDT0GAtKrMUdsw6
	CiLcqjQTtY129oDvw4WdEniY1DJfXNnHG/1TyVLcx8TDLnDfu2nlj+8ClfhJH4XY
	L8x/SZ//YbsveJOauHJY5/6A+WVgHdke4jldTncE6n4J8bLa8ncvA3ftEzlSJSHq
	dAGLgPgOkhk4itspoPeFE/LQmytrmftUB7ToK3CDp/92SvOhM1xGcZFnVgjpJlob
	IUjaU1rqPreB8m/tJZUayR8/DybWMtC612gInz5L7slKX7A0Iufxg5aScO5oUyoQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbq8j12s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:03:52 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54E43q2l010667;
	Wed, 14 May 2025 04:03:52 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbq8j12h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:03:52 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54E22HPQ021822;
	Wed, 14 May 2025 04:03:51 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfpj727-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:03:50 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54E43mQP23396674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 04:03:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D197A201F5;
	Wed, 14 May 2025 04:03:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DB5D201ED;
	Wed, 14 May 2025 04:03:46 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 May 2025 04:03:46 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Michal Suchanek <msuchanek@suse.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
        "Nysal Jan K.A." <nysal@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/boot: Fix build with gcc 15
Date: Wed, 14 May 2025 09:33:44 +0530
Message-ID: <174719490578.1067444.3484989459995732535.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331105722.19709-1-msuchanek@suse.de>
References: <875xjsjj6b.fsf@mpe.ellerman.id.au> <20250331105722.19709-1-msuchanek@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hxncHW4O_taoIVdqCINcMn9VC_5Yp0jh
X-Authority-Analysis: v=2.4 cv=GrRC+l1C c=1 sm=1 tr=0 ts=68241628 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=lsjnmln3yub5hIkKMwcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAyOSBTYWx0ZWRfXzyi8L/fQhF8d LOytMZRPqETiTCKybNCrUTjX75U/Q8MUQMmmGQQlEccibe4Bc9We9ycOi6PezmuWhLuyvCRnaY7 fgnn1kYEaHqE4UiFL5bfBqZI+u6H7EpkfDIKUkRi7Ti1kg5NWUF+/FAvR/LSiTOEC//+x7YhfXb
 blBDYoXlYkBGA39qKTFP6vCmQSOR1rJAkN0WsxG6W7q0Ry97bJC/iQSPRyICCT+/v5K3BeVYxAJ IUHczwo5L9Brpw3RyEgXM8gC6yQv7hlbxQOygvN0I44V4D9BsucbAANWXLwWvRCI/8htMyRrkOh bK1YZeuiBVxUJKt2rXt7wjtlCL9RItCSFeSArCWcQMXEE7xDIrKCYyU03B3pMiMnJT53euP3JiH
 RCV3nwGFmQMBhkQliEOorJz3Uco+YLFJqcKQOqALcKMH08kVGBuEEMLuXElfj/eF0hUKDAJ1
X-Proofpoint-GUID: F_82pmsV2Rpr06YLwUiusd4p7cGngwZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 clxscore=1011
 mlxlogscore=708 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140029

On Mon, 31 Mar 2025 12:57:19 +0200, Michal Suchanek wrote:
> Similar to x86 the ppc boot code does not build with GCC 15.
> 
> Copy the fix from
> commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
> 
> 

Applied to powerpc/next.

[1/1] powerpc/boot: Fix build with gcc 15
      https://git.kernel.org/powerpc/c/5a821e2d69e26b51b7f3740b6b0c3462b8cacaff

Thanks
