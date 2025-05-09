Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [61.152.208.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C5121FF23
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.152.208.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781002; cv=none; b=GD8MIK10omHFIJ8adh8H9aLJbNAJ96jxyKklEvaREL4FrbGbdjJvADDbU8S7Xa/iHLOI60tIBxb2WCI+Hl74dXClkKYDyvD08EOBzI/XpHt5ZnsM4SStSFQFAuzTqvZScEJiWeRkbmhPIhEoBmjumD8xafpEurNoZKYZqoBYO8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781002; c=relaxed/simple;
	bh=dZZ3VPiPFOzf4cQPlWnKeSAeKt/VPUjAUXwbEpsGKjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=El/+kglHdxw2G+/pZBunL6g26HBUM5QomVOtAAJnDncCJexL/Rw4HmtrEywLhXJuHk6281M7KCooB8r2mYicfjQti0Tyd1HKTV1+8vPqq7eTBKWWM21iHqs8KHQS0tsaRr50hRNd44ql1jQ6PbFnnOgvGsb8cqq5iwNoScoNxP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=61.152.208.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1746779891-1eb14e386d11dc50001-xx1T2L
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx2.zhaoxin.com with ESMTP id lNjwCd9NGm5gCPPo (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 09 May 2025 16:38:11 +0800 (CST)
X-Barracuda-Envelope-From: TonyWWang-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXSHMBX3.zhaoxin.com (10.28.252.165) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Fri, 9 May
 2025 16:38:10 +0800
Received: from ZXSHMBX3.zhaoxin.com ([fe80::8cc5:5bc6:24ec:65f2]) by
 ZXSHMBX3.zhaoxin.com ([fe80::8cc5:5bc6:24ec:65f2%6]) with mapi id
 15.01.2507.044; Fri, 9 May 2025 16:38:10 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from [10.32.65.152] (10.32.65.152) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Fri, 9 May
 2025 16:31:08 +0800
Message-ID: <acfbdc87-5146-4c39-831f-70b132f9f4b0@zhaoxin.com>
Date: Fri, 9 May 2025 16:31:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1103397: linux-image-amd64: Kernel Panic:
 copy_fpstate_to_sigframe crashes.
To: Larry Wei <larryw3i@yeah.net>, Salvatore Bonaccorso <carnil@debian.org>,
	<1103397@bugs.debian.org>
X-ASG-Orig-Subj: Re: Bug#1103397: linux-image-amd64: Kernel Panic:
 copy_fpstate_to_sigframe crashes.
CC: Ben Hutchings <ben@decadent.org.uk>, "Chang S. Bae"
	<chang.seok.bae@intel.com>, Lyle Li <LyleLi@zhaoxin.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<aruna.ramakrishna@oracle.com>, <pbonzini@redhat.com>,
	<levymitchell0@gmail.com>, <attofari@amazon.de>,
	<linux-kernel@vger.kernel.org>, <CobeChen@zhaoxin.com>, <TimGuo@zhaoxin.com>,
	<LeoLiu-oc@zhaoxin.com>, <GeorgeXue@zhaoxin.com>, <yunshen@zhaoxin.com>,
	<AlanSong@zhaoxin.com>
References: <4ac9f677-699e-4ef1-b160-9f1c6fe8e820@yeah.net>
 <c566339b-d8d3-4f74-a3b8-8f373fbe3f47@yeah.net>
 <174486226753.86424.3234605951040281675.reportbug@zx2>
 <8bcebb19-17f6-47e6-976a-0c9560795cd7@yeah.net>
 <aB0Q8S47iNeD1GOM@eldamar.lan>
 <6cebe32d-0290-41d8-9629-d80ef3c159c3@yeah.net>
Content-Language: en-US
From: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
In-Reply-To: <6cebe32d-0290-41d8-9629-d80ef3c159c3@yeah.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Moderation-Data: 5/9/2025 4:38:09 PM
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1746779891
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1324
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.141129
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------



On 2025/5/9 11:49, Larry Wei wrote:
>=20
>=20
> [=E8=BF=99=E5=B0=81=E9=82=AE=E4=BB=B6=E6=9D=A5=E8=87=AA=E5=A4=96=E9=83=A8=
=E5=8F=91=E4=BB=B6=E4=BA=BA =E8=B0=A8=E9=98=B2=E9=A3=8E=E9=99=A9]
>=20
> Salvatore Bonaccorso,
>=20
> Yes, let's just consider it as good. But in fact, there are still many
> problems, such as the one mentioned above (
> linux-hardware.org/?probe=3D271fabb7a4&log=3Ddmesg ), and almost all lapt=
ops
> using Zhaoxin CPUs cannot adjust the backlight brightness, which is
> **VERY HARMFUL** to the eyes!

Dear Larry,

We are currently investigating the causes of the WARNING messages you=20
mentioned in this log:
[    4.141284] ------------[ cut here ]------------
[    4.141285] alg: self-tests for sha1 using sha1-padlock-nano failed=20
(rc=3D-22)
[    4.141302] WARNING: CPU: 2 PID: 657 at crypto/testmgr.c:5865=20
alg_test.cold+0xb7/0xe0

Regarding the inability to adjust the laptop backlight brightness, we=20
believe this issue is unlikely related to the CPU itself. It is=20
recommended to contact the laptop manufacturer to confirm whether the=20
device supports backlight brightness adjustment and inquire about=20
specific configuration methods, such as installing specific EC=20
controller drivers or updating graphics card drivers.

BRs!
TonyWWang-oc
>=20
> Regards,
>=20
> larryw3i
>=20
> On 5/9/25 04:15, Salvatore Bonaccorso wrote:
>> Did this felt through the cracks?
>=20
