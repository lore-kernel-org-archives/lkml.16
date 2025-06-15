Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DA73A8C1;
	Sun, 15 Jun 2025 02:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749955168; cv=none; b=hC4Z2MjTorxbaJIDd8Q0q3Fd2+YdDQfhBV1jYYdOztWgcXvk5gAWEv8M9c2Yf/3/OcHtwaS4IzkMrjVmZ7pw3QaqLQO6Vtqo23CvGjV7iAEcnfPx9uJ8lS5g8EBwvpefI1rARo6MsLiZVPm+8g5vuEmW7rzmLEBVamDayc4RMMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749955168; c=relaxed/simple;
	bh=VgmEizyo9nIl3y5Yg1RMk6zIul1aWHAEp7saVWA5yWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Onxb2XGD4pWIvIw8WlA/KjO0ht/c5lTbiUpNICtzGizgpVwT2HKdL5h2x+S8ItvMszOSUinuGmICsDIgxZXrPMLkMr8LSfIuyLCYC8raWLup9cnjCeBuuRbUlQyW3dc3tZp3gzEYQyaeLf44bgYQ17V82bLo4dO7XZ5tozxmgfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ElUTZLEW; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ElUTZLEW"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EMt0xL004380;
	Sun, 15 Jun 2025 02:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xn5Pf2
	G64BIovUmwEZqU8z1Mh1VF8g3gqO5F7kS5mTA=; b=ElUTZLEWtpKCWZKF00caqo
	nn/NsXGu8ml3nUjyBICo1bDC5sCYac6XdQcNpVnznHDRiVKa94tjKrEAvjJBE6vr
	U9NPEr6ymcHieGkojBgiocHoD0tx+Kr5a3JCWIqZ43nWaZ/t9qdBOxxdFPv0QBK9
	4U/F6cHJ2FLkIEpmYB6WtMQHCVVXb/pgVNH2+mJmP4ZnD/7puwFIA4wb/zPAnEMM
	YpuUFtn6GCD6nRdGv2Q60Vvzbdi/7GMbmczH3Y2i+so1lzIJq+xs/g7dJZddMZPE
	mPkAtE8Z1wcpdLp3YAqzvgZW6jsgMTEhpA4da/kxGz2Eb3srvEgcuqJ8wB6Qe1Yw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790kt3mgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:02 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55F2ZMbd026652;
	Sun, 15 Jun 2025 02:39:02 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790kt3mga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:02 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55F0Xm8C003347;
	Sun, 15 Jun 2025 02:39:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4751ym8vd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:01 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55F2cxE728508832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 02:38:59 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 918A220043;
	Sun, 15 Jun 2025 02:38:59 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 05B3F20040;
	Sun, 15 Jun 2025 02:38:54 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.64.23])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Jun 2025 02:38:53 +0000 (GMT)
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
Subject: Re: [PATCH RESEND] powerpc: dts: mpc8315erdb: Add GPIO controller node
Date: Sun, 15 Jun 2025 08:08:51 +0530
Message-ID: <174995502359.107804.1137450582974510913.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611-mpc-gpio-v1-1-02d1f75336e2@posteo.net>
References: <20250611-mpc-gpio-v1-1-02d1f75336e2@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cniiiqhj4mwFnyLsrpGowyFQM-tEpHrQ
X-Proofpoint-ORIG-GUID: ZQUdp5UmXJMz3okRr7OK_96hiUO6MrLF
X-Authority-Analysis: v=2.4 cv=KaDSsRYD c=1 sm=1 tr=0 ts=684e3246 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=TY4axy8dlGjP7ovxBMwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDAxNiBTYWx0ZWRfX8KorUkWSmOu/ DScb/NiktPshZtzW5RuFnM9tMtjSLyxuhu8EtQKNMbwEzxhYqcrYyyFCT7M0ky4rvr93P9C/Xln S0dKrjKzYtBzNKmGhcJLm2K1YJoyE2zUB0aCjyxWkY/QGEXAH+i6HST7q1DW9JO00+WtBT33Mhi
 ZRW/Ql4b4+fvPcEnZLg6nl7SQ5QFGOEQ1/43u1BcCztxfkKL8kTIW1a1Z7FeYu0YCZ4AqiHrTQj 2LDQVkjXkyIYw4DTBGjvJIdrgGuNYhxyaXifRFdBGP0QIwvay5HBkKpjZJOMFVWo39S9a+EmSM/ 76IVDECQiW9eMNGyFHaUKW9P4QHvAzvILbaN/dogA55epbjmlQO+o4iCngMRgZbKHVEQE7UokJm
 DR0jWF33bx1VWmA1NtFqD5Ab5LajS3UqCZ6TB1uMHLf389/vqEDaNfzQaHuxyH2l4MRpK/ls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=698 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506150016

On Wed, 11 Jun 2025 21:01:01 +0200, J. Neuschäfer wrote:
> The MPC8315E SoC and variants have a GPIO controller at IMMR + 0xc00.
> This node was previously missing from the device tree.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc: dts: mpc8315erdb: Add GPIO controller node
      https://git.kernel.org/powerpc/c/e75cb6010838f61b9d63e921d1763a8ab177e38e

Thanks
