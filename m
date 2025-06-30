Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9A9CA4E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303169; cv=none; b=FVvT1sD2lyaT2R77G5O+Sn2cc6RQ1hHBJeP3JOSBAXgo1FRLfzq5FDtiparCAEddXKgb++dY8oxV9Ry5aDZnUjcbku09BhYmFkmTxTp/ZZxs6qnUET8nZQCjnCE/OXHaTUPZ8u+mzHEn2hz9DqvKLlYIN3YXjTII17+N2O6ll64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303169; c=relaxed/simple;
	bh=CR8gZdKFvN3V5o/0UB/wpSVyF8C/fXEhqtaQb+i7Jnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=mMizbFX1us3V3Pd+oq3YEWBYSr7PtuxytUL1ANPA7t8CC9CejIeX+7zAMMX9pH9AU7WxU8MpHAO+MFp7ou9etxO1p8X23JLN8cat4bqS+oMPSegBixRr3jRKAH9PyQktydsQzsqhY2w2v/DahszSVN3GRB7igWIXc6lNFrq4gto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KJeIxE0V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KJeIxE0V"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFXVIS007049;
	Mon, 30 Jun 2025 17:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=edOtzD9c1u6f5O2grA/rAY
	tBeYh4buZ7t5/yAPSQ7WU=; b=KJeIxE0VACv0OHkEx2BXLgF1Cztrm7ptIORKG9
	XA8LTJQvzukYsXWWpxvf8pPf7QvxGbk/ks7G5ZxNHeXnUd3mRF6xrYzsS3SnQmoe
	I0ttGXTM3MZLN6+iDbJFlXqTrQyfSXlQ50VJGy+L4FC3C7ONbz7AGbH9akIyITsN
	JCYdpRPapNZ+WR5o5PJUCiCjDypIJmHMmV0mpvTF+Fvz7cQFW8adSIwqwHDMVHs2
	OaEs2AJ+7Z7mXCJIl+0pL2mO+JBZ8h4Os+hEMkJLOI6zOn9UK+2rc6ECjxr2zm4m
	l4XfNfJyRwHR+UBM0KltzicNdsuzb7jk6g8nIY475Lel7gfA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5j9xwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 17:06:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55UH61S5000798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 17:06:02 GMT
Received: from hu-achillar-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Jun 2025 10:06:00 -0700
From: Aditya Chillara <quic_achillar@quicinc.com>
Date: Mon, 30 Jun 2025 22:35:28 +0530
Subject: [PATCH] tracing/perf: disable preemption in perf_trace calls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250630-fix-perf-trace-null-access-v1-1-8c15bf5f402c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANfDYmgC/x3MQQqEMAxA0atI1hNoK1b0KjKLUlMNSJVEhwHp3
 S0uH3z+DUrCpDA2Nwj9WHnPFfbTQFxDXgh5rgZnXGd8azDxHw+ShKeESJivbcMQI6ni4L1NgzV
 z6h3UwSFU63c+fUt5ADp0Ty9sAAAA
X-Change-ID: 20250630-fix-perf-trace-null-access-9661f910df72
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
CC: <linux-kernel@vger.kernel.org>,
        Aditya Chillara
	<quic_achillar@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751303160; l=4460;
 i=quic_achillar@quicinc.com; s=20250630; h=from:subject:message-id;
 bh=CR8gZdKFvN3V5o/0UB/wpSVyF8C/fXEhqtaQb+i7Jnk=;
 b=olVKXdr999NqrqzoiqAnA7Wt0bEV2vF42EsaP1v0Oi0X3Jy3l1INCZoqc/bP2DlntyoEP0g7X
 8LqTZNXDCNDCR7AezvPbvnABEUhqfRS/5SWiziztgSESGyZd+JV34xq
X-Developer-Key: i=quic_achillar@quicinc.com; a=ed25519;
 pk=n9YdZ9C822pphDmKHNwLKAFOJBiDCIOL/n1Mzy7/lg4=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6862c3fa cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=hK1vuaTRqXiNnZ6ymyoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UT2T8Cyc7TwrE_mPxAunJctOQMJGEYfV
X-Proofpoint-GUID: UT2T8Cyc7TwrE_mPxAunJctOQMJGEYfV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0MSBTYWx0ZWRfX6zh9FMtRmfxL
 PHH9ybbt8HjnU2SCAxhKOY5vcnQ4A4laDBVlVcepJmB8pLgng8tj1XtMQWXWTf4lRaEfjPy3Q//
 nWWkqoohwfHePJJmBG8o1kJApXfaRN5jKZQ0j29kjkBfdWxm1LsupWnV2KEpEMk+5NcZoiaTm9D
 JBRErdN4Jbxnr99Cjicx+fyTZMcA0ZvynXjvOTJ1UsBn507EKbIhKsFltRhONtf/JqIN3P+vPxG
 w/fU6mtTbYCw729sE8KWS6b5kExZViAVM93LJjX1vgyqBE/TqJvLtxXHWtEqSexfLAzXJsDlPJ1
 elugB8+SX7etQl1t/p08WxHBj6PXZjJP+Dhs+Jzd96oxiA5AQqfNDEMzw1cqVPHnHdv5Sk2u83f
 zEU8AWglNSN9D1TEXe1InD9Q3a2V5yTGplDA8Un4G67vVgUSNAqz0D3vNL/D8i+UX6sQrP1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 mlxlogscore=811 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300141

It is possible that perf_trace_sched_switch call is rescheduled causing
NULL access in perf_trace_buf_alloc because of perf_trace_event_unreg
called in between, leading to data abort:

[  363.202351][    T0] Unable to handle kernel paging request at virtual address ffffffba56d0a03c
[  363.202355][    T0] Mem abort info:
[  363.202355][    T0]   ESR = 0x0000000096000045
[  363.202357][    T0]   EC = 0x25: DABT (current EL), IL = 32 bits
[  363.202359][    T0]   SET = 0, FnV = 0
[  363.202360][    T0]   EA = 0, S1PTW = 0
[  363.202361][    T0]   FSC = 0x05: level 1 translation fault
[  363.202363][    T0] Data abort info:
[  363.202364][    T0]   ISV = 0, ISS = 0x00000045, ISS2 = 0x00000000
[  363.202365][    T0]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
[  363.202367][    T0]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[  363.202369][    T0] swapper pgtable: 4k pages, 39-bit VAs, pgdp=00000000c9795000
[  363.202371][    T0] [ffffffba56d0a03c] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
[  363.202377][    T0] Internal error: Oops: 0000000096000045 [#1] PREEMPT SMP
[  363.202383][    T0] Dumping ftrace buffer:
[  363.202385][    T0]    (ftrace buffer empty)
.
.
[  363.203036][    T0] CPU: 4 UID: 0 PID: 0 Comm: swapper/4 Tainted: G W  O \
	6.12.23-android16-5-maybe-dirty-4k #1 6d534d25cf9b12caecb741d5004c181a6a432b53
[  363.203042][    T0] Tainted: [W]=WARN, [O]=OOT_MODULE
[  363.203045][    T0] pstate: 834000c5 (Nzcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
[  363.203048][    T0] pc : perf_trace_buf_alloc+0x90/0xe0
[  363.203057][    T0] lr : perf_trace_buf_alloc+0x40/0xe0
[  363.203060][    T0] sp : ffffffc08016bc90
[  363.203062][    T0] x29: ffffffc08016bc90 x28: 0000000000000000 x27: ffffff88083d0000
[  363.203066][    T0] x26: ffffffba56d0a000 x25: 00000044684e8bd8 x24: 1198f2d01457f4e4
[  363.203070][    T0] x23: 0000000000000000 x22: ffffff88083d0000 x21: ffffffc08016bccc
[  363.203073][    T0] x20: ffffffc08016bcd0 x19: 0000000000000044 x18: ffffffd01580bec0
[  363.203077][    T0] x17: 00000000d2dc9ceb x16: 00000000d2dc9ceb x15: 0000000000000010
[  363.203080][    T0] x14: 0000000000000100 x13: 0000000000000100 x12: 0000000000000100
[  363.203083][    T0] x11: 0000000000ff0100 x10: 0000000000000001 x9 : ffffffba56d0a000
[  363.203087][    T0] x8 : ffffffba56d0a044 x7 : 0000000000000001 x6 : 000000548fd2bf93
[  363.203090][    T0] x5 : 00000054908be990 x4 : 0000000000000000 x3 : ffffff8808329640
[  363.203094][    T0] x2 : ffffffc08016bccc x1 : ffffffc08016bcd0 x0 : ffffffba56d0a000
[  363.203097][    T0] Call trace:
[  363.203098][    T0]  perf_trace_buf_alloc+0x90/0xe0
[  363.203102][    T0]  perf_trace_sched_switch+0x74/0x190
[  363.203107][    T0]  __schedule+0xbb0/0xeac
[  363.203112][    T0]  schedule_idle+0x24/0x48
[  363.203114][    T0]  do_idle+0x214/0x25c
[  363.203117][    T0]  cpu_startup_entry+0x34/0x3c
[  363.203119][    T0]  secondary_start_kernel+0x130/0x150
[  363.203124][    T0]  __secondary_switched+0xc0/0xc4
[  363.203129][    T0] Code: f8605908 d538d089 8b080120 8b33c008 (f81f811f)
[  363.203131][    T0] ---[ end trace 0000000000000000 ]---
[  363.203133][    T0] Kernel panic - not syncing: Oops: Fatal exception
[  363.203135][    T0] SMP: stopping secondary CPUs
[  363.203276][    T0]
[  363.203276][    T0] Total active clients count: 0
[  363.203280][    T0] Dumping ftrace buffer:
[  363.203281][    T0]    (ftrace buffer empty)

Fix the issue by disabling preemption in perf_trace calls.

Signed-off-by: Aditya Chillara <quic_achillar@quicinc.com>
---
Change-Id: I787347a7db4554cfd2cb74e0fc985699f1824c92
---
 include/trace/perf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/trace/perf.h b/include/trace/perf.h
index 5800d13146c3d0cdf4eb474a3bb895dd71753de4..76994a5d8c55f4ca071070ff551a53a84fb1d95c 100644
--- a/include/trace/perf.h
+++ b/include/trace/perf.h
@@ -66,6 +66,8 @@ perf_trace_##call(void *__data, proto)					\
 	int __data_size;						\
 	int rctx;							\
 									\
+	guard(preempt_notrace)();		\
+									\
 	__data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
 									\
 	head = this_cpu_ptr(event_call->perf_events);			\

---
base-commit: 70575e77839f4c5337ce2653b39b86bb365a870e
change-id: 20250630-fix-perf-trace-null-access-9661f910df72

Best regards,
-- 
Aditya Chillara <quic_achillar@quicinc.com>

