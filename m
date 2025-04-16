Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D16C1FFC55
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787245; cv=none; b=vGS0EiuIQ85zzU+GxykNPOw1k6sb1//lscS32zPJIm/TsyYz1gMs51Ib+8+UjTDkpgYhzFOtYO7WdDaOmWDvFKkEIW48wsyzlWme4Pm/xIVir1c22rU9Xf7bsZ4PvpfTOoSbkdBuf/bHru8tD0qneW2HyC0VxISMcxf65LMd5+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787245; c=relaxed/simple;
	bh=/zdvKzHB12fu3rTqtUzXCN6zERZNsDOYUrwVuVMKnRo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=HICHuzzkNx/ZSpGMA7KfPvfRCo50UK49aBB9ljaujpYOqqX32h2ZZ/DGwN7sLsuQgzPirHhPWq8V65IeGg09AXyfmf7BAOi4ahIEUg4PkQYVeaJ8c0iQQATWCIusvdq/pLRRN4aWYIsYYxjk8oYQpnVuP28mPEuMN+jOK6rf0/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=E9TgXDjw; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="E9TgXDjw"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FKV306021409;
	Wed, 16 Apr 2025 07:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=JSqb7AWY/VRKONs9zBchRicpgth9
	j7FzaFmbnFhNiOQ=; b=E9TgXDjwmEJOGebyeMbHJi0dtbeLpLZ2Bdxf7uYsagFk
	eikDVGOvd1wfajzynytzokMJ7cNPo9m81jdi4pz++bbmQ569yWnlP+8xfJCtmF1i
	p4FXTqtoH1Wl0pA1M0oYKJoBoY8FU5rPHEkZNnWU7NiCZsDJEN3sZvnSxtNI3ppN
	DB2YGUK+nodHFuWfrUWfxtSn8WOtYXxo3KKJdSrYFJLKMyCBZoPfUhFMVflXchEq
	s/J+5Wl+GdkZBDOvdEhA9aeqQTT7dEJKdIPn7p+I0DxwIou7xLySIvK6JKXzu9B3
	duGaA+Hs1FpAYd6TLYeYXtG1OD3rfQWyJIs4xyHPKg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461nwq4xer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 07:07:21 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53G3SAPX017195;
	Wed, 16 Apr 2025 07:07:20 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46040kxw36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 07:07:20 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53G77JwY5505554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:07:19 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDBB358054;
	Wed, 16 Apr 2025 07:07:18 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B40F58052;
	Wed, 16 Apr 2025 07:07:17 +0000 (GMT)
Received: from [9.61.241.145] (unknown [9.61.241.145])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 07:07:17 +0000 (GMT)
Message-ID: <1db64a42-626d-4b3a-be08-c65e47333ce2@linux.ibm.com>
Date: Wed, 16 Apr 2025 12:37:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: LKML <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [mainline]Kernel crash while running ftrace selftest
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IcypP3BIs4qVlsnIwj7v5JcpUgHh7_vd
X-Proofpoint-GUID: IcypP3BIs4qVlsnIwj7v5JcpUgHh7_vd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=787 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504160056

Hello,


I am seeing kernel crash while running ftrace selftest on today mainline 
kernel.

Head Commit: g1a1d569a75f3.


After reverting below commit 0ae6b8ce200da00a78f33c055fdc4fe3225d22ec, 
issue is not seen.


Traces:

[15137.589286] Oops: Kernel access of bad area, sig: 11 [#1]
[15137.589291] LE PAGE_SIZE=64K MMU=Hash  SMP NR_CPUS=8192 NUMA pSeries
[15137.589298] Modules linked in: nft_compat(E) ext4(E) crc16(E) 
mbcache(E) jbd2(E) 8021q(E) garp(E) mrp(E) stp(E) llc(E) vrf(E) tun(E) 
veth(E) bonding(E) tls(E) nft_fib_inet(E) nft_fib_ipv4(E) 
nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) 
nf_reject_ipv6(E) nft_reject(E) nft_ct(E) rfkill(E) nft_chain_nat(E) 
ip_set(E) bnx2x(E) pseries_rng(E) be2net(E) mdio(E) ibmveth(E) hvcs(E) 
hvcserver(E) sg(E) vmx_crypto(E) drm(E) dm_mod(E) fuse(E) 
drm_panel_orientation_quirks(E) xfs(E) lpfc(E) nvmet_fc(E) nvmet(E) 
sr_mod(E) sd_mod(E) cdrom(E) nvme_fc(E) nvme_fabrics(E) ibmvscsi(E) 
scsi_transport_srp(E) nvme_core(E) scsi_transport_fc(E) [last unloaded: 
test_bpf(E)]
[15137.589400] CPU: 0 UID: 0 PID: 146764 Comm: ftracetest Tainted: 
G        W  OE       6.15.0-rc2-g1a1d569a75f3 #1 VOLUNTARY
[15137.589410] Tainted: [W]=WARN, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[15137.589415] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 
0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
[15137.589422] NIP:  c0000000003e4738 LR: c0000000003ec708 CTR: 
000000000000a6a4
[15137.589428] REGS: c00000001473f720 TRAP: 0300   Tainted: G        W  
OE        (6.15.0-rc2-g1a1d569a75f3)
[15137.589435] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 42228282  XER: 00000000
[15137.589459] CFAR: c00000000000dbac DAR: 0000000000000014 DSISR: 
40000000 IRQMASK: 0
[15137.589459] GPR00: c0000000003ec6ec c00000001473f9c0 c000000001da8100 
0000000000000004
[15137.589459] GPR04: c000000001356618 0000000000000001 0000000000000000 
c000000002ccbb88
[15137.589459] GPR08: 0000000000002710 0000000000000004 0000000000000000 
0000000000008000
[15137.589459] GPR12: c00000001473f6a8 c000000002fd0000 0000000000000000 
0000000000000000
[15137.589459] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[15137.589459] GPR20: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[15137.589459] GPR24: 0000000000000000 c0000000aeb5b1b0 0000000000000004 
c000000156bbdd00
[15137.589459] GPR28: c000000002c24988 0000000000000004 c000000156bbdd00 
c000000002c24960
[15137.589546] NIP [c0000000003e4738] ops_equal+0x8/0x170
[15137.589553] LR [c0000000003ec708] ftrace_update_ops+0x78/0xe0
[15137.589561] Call Trace:
[15137.589564] [c00000001473f9c0] [c0000000003ec6ec] 
ftrace_update_ops+0x5c/0xe0 (unreliable)
[15137.589575] [c00000001473fa00] [c0000000003f31b4] 
ftrace_startup_subops+0x124/0x5c0
[15137.589583] [c00000001473faa0] [c0000000004351fc] 
register_ftrace_graph+0x2cc/0x550
[15137.589592] [c00000001473fb80] [c00000000042c374] 
graph_trace_init+0x74/0xa0
[15137.589600] [c00000001473fbb0] [c000000000413828] 
tracing_set_tracer+0x3c8/0x610
[15137.589609] [c00000001473fc50] [c000000000413b1c] 
tracing_set_trace_write+0xac/0x120
[15137.589618] [c00000001473fd10] [c0000000006ecb90] vfs_write+0x160/0x4d0
[15137.589626] [c00000001473fdc0] [c0000000006ed230] ksys_write+0x80/0x150
[15137.589635] [c00000001473fe10] [c0000000000325a4] 
system_call_exception+0x114/0x300
[15137.589644] [c00000001473fe50] [c00000000000d05c] 
system_call_vectored_common+0x15c/0x2ec
[15137.589653] --- interrupt: 3000 at 0x7fff88416234
[15137.589661] NIP:  00007fff88416234 LR: 00007fff88416234 CTR: 
0000000000000000
[15137.589666] REGS: c00000001473fe80 TRAP: 3000   Tainted: G        W  
OE        (6.15.0-rc2-g1a1d569a75f3)
[15137.589673] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 4822244e  XER: 00000000
[15137.589696] IRQMASK: 0
[15137.589696] GPR00: 0000000000000004 00007fffed647a40 00007fff88527100 
0000000000000001
[15137.589696] GPR04: 000001003178d420 000000000000000f 000000006172675f 
000000000000000e
[15137.589696] GPR08: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[15137.589696] GPR12: 0000000000000000 00007fff8868b1c0 0000000124cc005c 
000001003180ab30
[15137.589696] GPR16: 0000000124cc9528 000001003180aba0 0000000040000000 
0000000124bd2f20
[15137.589696] GPR20: 0000000000000000 00007fffed647c64 0000000000000001 
0000000124c72d68
[15137.589696] GPR24: 0000000124cc8bac 0000000124cc8bb8 0000000000000000 
000001003178d420
[15137.589696] GPR28: 000000000000000f 00007fff885217f0 000001003178d420 
000000000000000f
[15137.589777] NIP [00007fff88416234] 0x7fff88416234
[15137.589783] LR [00007fff88416234] 0x7fff88416234
[15137.589788] --- interrupt: 3000
[15137.589792] Code: 60000000 60000000 e92500d0 2c290000 4d820020 
f9260110 4e800020 60000000 60000000 60000000 7c691b79 4182011c 
<e9490010> 2c2a0000 418200d0 2c240000
[15137.589824] ---[ end trace 0000000000000000 ]---


If you happen to fix this issue, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.

