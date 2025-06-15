Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF45157E99;
	Sun, 15 Jun 2025 02:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749955191; cv=none; b=qsv31mQsoniMNooKky2CBSHn6o/hyMZ6S84ULYEM1lv4OzliDj7eRlMTH2BRmon1lkR+o4lQVSrZCKH1QOrH6jwccBVUMQt3A1tlM6RLkZ09aHycOju4WEM7B8UhSGE1LDIT73PJGEIHxntcH6h4TyULi8UYMXWgFQuYj5ccI6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749955191; c=relaxed/simple;
	bh=B86HEnj8vf1U1l5Yyjzq5HYjLgMqlSvwXcZ/sfihCg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTclKMurNPELXgeACxEmg4LMFDWuuk82nqawDlm3y7tBx63oM0IsXiRw42kGQ7GmEhos1JVH9iI3I+i9OC8HaKJfHujaHpI0VWCLKkF72nPuqyynf6RopqAvzhSOjA2wkbOk50L3b+AdaX+Az9aPufsybm9Oc5T4Ass+zJTnBVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=i32WEGSt; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="i32WEGSt"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55F0hWvk006879;
	Sun, 15 Jun 2025 02:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RFGH16
	GGdoY5MgLXBFHrjkm9SgutJ80FqnaTT37LV9s=; b=i32WEGSt67Z74JGdDgKfZH
	xibZpXo4Fb6hpxx4q8ilY3aUAcHb3JE4fmP5cDlL1J01sHeRj6GOtjK2cCg53S0w
	IbFf9NYsQbQhXWBqvb2NqYqugJHaHOjSlm5dRnOgKeDc881Jry004t90mefn3khy
	9aAuoOHGuZNhkMFDC6pUUwQxPaXf8S/CFOU+thB9wMIarso8ChrCuW9ZyqtKwa0y
	Ko5OFU3yahZNGhj2JyPhfWeBJX61vzSgnMToFhZddi0L6LxvZVhXvLRKKDTAfxPH
	PMdzaOTHPentbjMXkIpCHj6ul5BUuwHdFvroD9P7LklkDTJoakxOzAc539uuHM6g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790r1kgxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:11 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55F2bUci025682;
	Sun, 15 Jun 2025 02:39:10 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790r1kgxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55F0BUqO010862;
	Sun, 15 Jun 2025 02:39:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 479kdt0emf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:09 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55F2d8YE46334386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 02:39:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4206020043;
	Sun, 15 Jun 2025 02:39:08 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6935F20040;
	Sun, 15 Jun 2025 02:39:02 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.64.23])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Jun 2025 02:39:01 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        =?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] powerpc/microwatt: Fix model property in device tree
Date: Sun, 15 Jun 2025 08:09:00 +0530
Message-ID: <174995502359.107804.5514512556440228037.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611-microwatt-v2-1-80847bbc5f9c@posteo.net>
References: <20250611-microwatt-v2-1-80847bbc5f9c@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hH3GaEOIoB9oOaXCYEM74vgXlzAyih1D
X-Proofpoint-ORIG-GUID: FkPBedZPuMCHHeUhjVZyhtzBFJH7h2A4
X-Authority-Analysis: v=2.4 cv=AqTu3P9P c=1 sm=1 tr=0 ts=684e324f cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=LvaVYMoGVpd5GIVMe5MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDAxNiBTYWx0ZWRfX4W4JBZXwnjBR wkngYZiPjFIf94/j61WX3YAgdlW5TZWtjbGNweXPNt3+9vBnylnFq4+08Sg7ePgJCdPnj0RJe1M stNgboseLZUKMgl2iqx1PfainZT982P0CMgUzkA2kuWr4MQTvzu4oEQsg4zGMBAfZXPmkOBhchN
 jOV+ryItbOS7WeH/Sjs5s4Ww8k1dVgk76a9RRSUp7id/3TyMX2TB28cpyB+D2WPqQph89ewhFSQ vXrCdw1HMLKg2RWeogx1NNM049w9udC0+tKhQooucAu4v7B2BHD9S5Q64NI/UG2Ok1ki/hjc6aG aTC2SmKRh0z4W7jGEmMwW2My96lQiKxclxcBnC51pNHEcMVKQcjt0ZXCY9Z4zFKBJkj44gpH+TZ
 S3rDM2PlX/9Qp89Q3Q/0RStqoYws+RJeHIbi+C/RjUJr/duMkwP6kKpZsgp2x5BXuvxjBWHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=801 mlxscore=0 spamscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506150016

On Wed, 11 Jun 2025 23:07:49 +0200, J. Neuschäfer wrote:
> The standard property for the model name is called "model".
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/microwatt: Fix model property in device tree
      https://git.kernel.org/powerpc/c/4e6d080acfda5344ccbc63afe778830e22be4be9

Thanks
