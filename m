Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11691E1A3B
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746685811; cv=none; b=izAK/6akKsV1trNkz9OXSxB/RRh4CcHZNBw3s7JZfnWoLYee2X+yFzvfpt3pjApYUn6cRTfodGRrO+WVYMFABy7kpzF5ng7pxCZQ+whTcZJX8vT76hmW6uINnRp8EcNYtrlWknRDSjmjW6lue+HpEmVetj4wGRm6kBf2uZyV9Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746685811; c=relaxed/simple;
	bh=6DN0saKY1Q39ZgR8PGRQckXGZe7quH1aGpqb1tmGs4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bIuDj867SfIm3NG9s1NJJOLoKixktgMbiJz9HY9GpzpmkU29ri/vm4h4kMcO0jJgzLPiE8GokSO7qpSqV57NUSkNI4szDPbTcuP4J61w6g2qzBrqbokGqg2eNYEbZud+571PWj3dn+umDHGGfIyECi+Tc6y/tw1juJuO+efYu+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=X+a+Df11; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="X+a+Df11"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547KKL0r030803;
	Thu, 8 May 2025 06:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=kiw00c+FQf9PuZ92J0vgUrj2gmOIz1soi9KXE46SO
	7U=; b=X+a+Df115Luf5l52uz7DKUhDmfQHX/Mxn31plWC9Qw/3zmBDd2unC+R9h
	VCDkxCD1Ezsay+PGEQmQxWuawSrBQXk+HCTx+fVYJpWJO74NoD0u4bgU0mnWuMzY
	SvnDFj+IGiJoYYAI4akiyTNRTEataMKH8+O5Ta9y2wJMjgpoiXD6FXromyqIYIjP
	TX3iGqUh7Lw0iROf1qlJ6FOCFK+yb3J9lix0ZgMMg6p3eJklcwSbVmtRL3AuMv/X
	dYqGVxMCDZrgelpfUqiaHIeaMSOYFspfyWJ91A2SnGDhXj9Nw6DpYQL3A9rEIf70
	QrdnkN/sgt1v1A+f1FThZCg5lxI3Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46g5yrvyhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 06:29:46 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5486QnJL001469;
	Thu, 8 May 2025 06:29:46 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46g5yrvyhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 06:29:46 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5486FW8I014097;
	Thu, 8 May 2025 06:29:45 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dypkv87s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 06:29:45 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5486TfhN17563970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 06:29:41 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 659AF20083;
	Thu,  8 May 2025 06:29:41 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D06F20081;
	Thu,  8 May 2025 06:29:39 +0000 (GMT)
Received: from ltcblue8v9-lp1.aus.stglabs.ibm.com (unknown [9.40.192.91])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  8 May 2025 06:29:39 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        gwshan@linux.vnet.ibm.com, benh@kernel.crashing.org, agraf@suse.de,
        vaibhav@linux.ibm.com
Subject: [PATCH v1] powerpc/eeh: Fix missing PE bridge reconfiguration during VFIO EEH recovery
Date: Thu,  8 May 2025 02:29:28 -0400
Message-ID: <20250508062928.146043-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=cuybk04i c=1 sm=1 tr=0 ts=681c4f5a cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=kQooW1NXP8U1ZRCmC6MA:9
X-Proofpoint-GUID: OOn9rtTk_GJjBsPQHlC66v5VrFle9GtV
X-Proofpoint-ORIG-GUID: ULABqiSJb1CND9jVcnFkcBaB5PVJqc3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA1MSBTYWx0ZWRfX4suI3pv/rKHb GV1A7p6kKUG7iD0/ZTGEDSDqRmW7BQrC3/775faUCGi+HbwPd9ByPl2xe2XlQCg4PV9cKhtHQN4 Ix2smk3qn5JJyS2rYTYhh62w2gFFctvPRp0zxyPbSqmGhawAmMz6tgAszZk050UcSQ3clWh983w
 tq1cmz3TMdPmZ+vVJbJYmFynpMjOP07lKLsetLv8i9KStEv/PEYYfGZ5USGmkQIkO5Pz7UcJJ+h YooW3q4nksNjqwBs6zpCSzqvpb3nVAF+bIdAR+Wl1IyI4E/flfHRtOOh8KyjVfdRB0PLz8mHvfI YEr4JUrwN0PAK0GXky3nFE8i5/vXiWwDDH0dEidSZaX1gjqKZxy62qYOlCmBqLIa0plXBz6wIaC
 KlEuUglwtPNGJvYisqhGeHrGsQUZF+M5+q2g0JKwnbYpO2jpTe9J6v7HGPFARfYMLTSMY+Zv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080051

VFIO EEH recovery for PCI passthrough devices fails on PowerNV and pseries
platforms due to missing host-side PE bridge reconfiguration. In the
current implementation, eeh_pe_configure() only performs RTAS or OPAL-based
bridge reconfiguration for native host devices, but skips it entirely for
PEs managed through VFIO in guest passthrough scenarios.

This leads to incomplete EEH recovery when a PCI error affects a
passthrough device assigned to a QEMU/KVM guest. Although VFIO triggers the
EEH recovery flow through VFIO_EEH_PE_ENABLE ioctl, the platform-specific
bridge reconfiguration step is silently bypassed. As a result, the PE's
config space is not fully restored, causing subsequent config space access
failures or EEH freeze-on-access errors inside the guest.

This patch fixes the issue by ensuring that eeh_pe_configure() always
invokes the platform's configure_bridge() callback (e.g.,
pseries_eeh_phb_configure_bridge) even for VFIO-managed PEs. This ensures
that RTAS or OPAL calls to reconfigure the PE bridge are correctly issued
on the host side, restoring the PE's configuration space after an EEH
event.

This fix is essential for reliable EEH recovery in QEMU/KVM guests using
VFIO PCI passthrough on PowerNV and pseries systems.

Tested with:
- QEMU/KVM guest using VFIO passthrough (IBM Power9,(lpar)Power11 host)
- Injected EEH errors with pseries EEH errinjct tool on host, recovery
  verified on qemu guest.
- Verified successful config space access and CAP_EXP DevCtl restoration
  after recovery

Fixes: 212d16cdca2d ("powerpc/eeh: EEH support for VFIO PCI device")
Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/kernel/eeh.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 83fe99861eb1..ca7f7bb2b478 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1509,6 +1509,8 @@ int eeh_pe_configure(struct eeh_pe *pe)
 	/* Invalid PE ? */
 	if (!pe)
 		return -ENODEV;
+	else
+		ret = eeh_ops->configure_bridge(pe);

 	return ret;
 }
--
2.48.1

