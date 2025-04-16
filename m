Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9681C27
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809119; cv=none; b=sqdia0vKfIdrUjMn1e03YcG2Sb9GyTNeYgfRbVZM++Nh8DVLvGsVKC5ulrPS7ezcOwtz3rv883p4H0KmEuSgKYZAM513rVS/qfDw7GnzgW18JQ86PW2ROgcB+/QF/xKFHWx4AV8O21I29xgPFuRDhv9v+DwA2j9mLeWqgE1BITo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809119; c=relaxed/simple;
	bh=0ZVlAVqY5C6N3XvwX0Zff7ZTMCPqy1TEAiz6UyMnZ60=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ymwt5oXvnksNw2NBnNOaYK0PNqZ0BkcvUMMjbpzBzoToiBIKHoRgEgFVCSVdv2XqjNH4dAK4U1D0pgPPulQumoVMNOYTLLICPHyZc+KycOphIlzrtSX26pgcx6Biktfn+cV+xUwTKs1mbBq8cWCsx1A26aFK+x2izh3Uhzanz7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=eu2gdHWX; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="eu2gdHWX"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GAeUqN019696;
	Wed, 16 Apr 2025 13:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0ZVlAV
	qY5C6N3XvwX0Zff7ZTMCPqy1TEAiz6UyMnZ60=; b=eu2gdHWXf/E/mBt2Q4wmhV
	rC3clAcjTzsdJxWitseQsi/L4WpxQuLNOfePsUiPQ/nMqSy/OfuwmfK1hFJrQSwj
	cv4BKBXV05cJO2G7Qqh2n1KRM7bWOrG7oSt67Vk9HXgwBNc6a3ClXvhA2Iwitlol
	ZuMmqAs/I8O0q204wWLnvDtEjfKPEZfXShZsiCehqzAhLLjjzGvmPdhsUQNoEbZb
	IKgJNRMwUf1xCxluFZjPhQBZOtcY39QsUJS42tU+KXodz3LTUMoNGpAvedCqgqBE
	zXCQAcuRxNLycAaTAr7r/kgC+StDh/YXYj1jsKhFuKV7+OhnREzzR3WHHHa7IwIw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462b0q0s15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 13:11:54 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GC66qG010424;
	Wed, 16 Apr 2025 13:11:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4604qk85n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 13:11:53 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GDBoHX28836310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 13:11:50 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 516F32004B;
	Wed, 16 Apr 2025 13:11:50 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A88520040;
	Wed, 16 Apr 2025 13:11:48 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.249.149])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Apr 2025 13:11:47 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [mainline]tools/perf build warnings
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <2c04b7ef-dc85-4a40-b0d8-6ae73c20b65d@linux.ibm.com>
Date: Wed, 16 Apr 2025 18:41:34 +0530
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B34E8075-7F38-4E30-9E51-23E43DDDF06F@linux.ibm.com>
References: <2c04b7ef-dc85-4a40-b0d8-6ae73c20b65d@linux.ibm.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: L0MTqiRRemOV4ej4fQOf_mIEccHSoEcL
X-Proofpoint-GUID: L0MTqiRRemOV4ej4fQOf_mIEccHSoEcL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504160107



> On 16 Apr 2025, at 5:12=E2=80=AFPM, Venkat Rao Bagalkote =
<venkat88@linux.ibm.com> wrote:
>=20
> Hello,
>=20
>=20
> I am observing a new build warning on today mainline kernel, with head =
commit: g834a4a689699
>=20
> =
Repo:https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>=20
>=20
> Warnings:
>=20
> diff -u tools/include/vdso/unaligned.h include/vdso/unaligned.h
>=20
>=20
> If you happen to fix this, please add below tag.
>=20
>=20
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Hi Venkat

Can you please check with =
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.g=
it/?h=3Dtmp.perf-tools-next
with the tmp.perf-tools-next branch..

Also there is a patchset here:
=
https://lore.kernel.org/linux-perf-users/FE96FD04-4396-4C34-A70D-2A592FD5F=
916@linux.ibm.com/T/#m3e9d6aac4c34ebf42f18f3c213b7dff8f8c70d9d

Which I think you have already tested..

Thanks
Athira
>=20
>=20
> Regards,
>=20
> Venkat.
>=20
>=20
>=20

