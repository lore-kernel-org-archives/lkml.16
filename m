Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F2F2989B5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529241; cv=none; b=V5ZlxXlnilhdasi/N+CJDojxcZGzknBIoAHUnlwO2aXljufpqUHCPRMfxJlc7e8UzdEXUF12G2zsJwmwuGkuGcKyq9fOARp0lrwWouq118tmjLQHCIFKu9dRfkA2/JgfmFksEWI4Wc39alGx/UruMjg5SIK2BTy6ZSzm+qjUu74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529241; c=relaxed/simple;
	bh=NmKnFhSZwtBL+L+1B+0Mxk/hEu8WnF0kMQA9sYjj1/Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mEAtHE/XVRlwurzZvMlbTXF/XUjBTO4ntQcNNlbisvWTHvAv1QtJGDzc5ZjJwkPInXbuA4w+F45TsXlkteKwpNLHxK/YWwj7nAP7Rk57jVaDN087nMTF4vpysCfker8m+2hXeq39lSkNuC49pJIBXkz9uW7D3JLax+UIQ1cTQEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5634kwSh019630;
	Thu, 3 Jul 2025 07:53:35 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9d8gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 03 Jul 2025 07:53:34 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 3 Jul 2025 00:53:37 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 3 Jul 2025 00:53:35 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <lizhi.xu@windriver.com>
CC: <arnd@arndb.de>, <bcm-kernel-feedback-list@broadcom.com>,
        <bryan-bt.tan@broadcom.com>, <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>,
        <vishnu.dasa@broadcom.com>, <sfr@canb.auug.org.au>
Subject: [PATCH V2] vmci: Prevent the dispatching of uninitialized payloads
Date: Thu, 3 Jul 2025 15:53:34 +0800
Message-ID: <20250703075334.856445-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627055214.2967129-1-lizhi.xu@windriver.com>
References: <20250627055214.2967129-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ff2eUUYvI8Pl6sbhGLEZBT8LU75VUYCw
X-Proofpoint-GUID: ff2eUUYvI8Pl6sbhGLEZBT8LU75VUYCw
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=686636fe cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8 a=ArJ3Pwma1Lyk2epKzdMA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA2MiBTYWx0ZWRfXz0q7cF9xOCHf /2cr9ZRm0188nTa4syGsxgHW56Oh/x96FkZsDm6m/GU3hyo6z08w42No0g0mSeOGw0POCEPHxc4 Q8/ewIyEIltg1ihC/d5d9mGvPYuLyLLraY9NlbTLDnp2xzKv+y/qJqsKvRbfsEsbYTprQQfBner
 TyLXAg1ErLpcUCT2dtZqpqq9Ol5+G5h76Wyjm1GxDINh0WbVu7a2iU36O1MyQp50+/qm71W/oAw HFyIWOjaiM8EET+tl8LXDqiOThzPuK9qSpaWx+izDtRFo/8znRxv2ZqC3Hs0N0m63obFzs5/IFj FNBBW4gV3m24o8YLNExUnYtCdVEAGoc3m9eo87OJCncHe/T0M80z4Mh9YJ9u9gEz9t3oALDRTR3
 k38dYFuWxCCsvpAyq7eVb2MdfGuz2tmnJYmm5/KOlA2wsmDx2hOw2KDa0aJOiNDi3Ykw/mm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030062

The reproducer executes the host's unlocked_ioctl call in two different
tasks. When init_context fails, the struct vmci_event_ctx is not fully
initialized when executing vmci_datagram_dispatch() to send events to all
vm contexts. This affects the datagram taken from the datagram queue of
its context by another task, because the datagram payload is not initialized
according to the size payload_size, which causes the kernel data to leak
to the user space.

Before dispatching the datagram, and before setting the payload content,
explicitly set the payload content to 0 to avoid data leakage caused by
incomplete payload initialization.

To avoid the oob check failure when executing __compiletime_lessthan()
in memset(), directly use the address of the vmci_event_ctx instance ev
to replace ev.msg.hdr, because their addresses are the same.

Fixes: 28d6692cd8fb ("VMCI: context implementation.")
Reported-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
Tested-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
V1 -> V2: fix building warning reported by Stephen Rothwell

 drivers/misc/vmw_vmci/vmci_context.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/vmw_vmci/vmci_context.c b/drivers/misc/vmw_vmci/vmci_context.c
index f22b44827e92..d566103caa27 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -251,6 +251,8 @@ static int ctx_fire_notification(u32 context_id, u32 priv_flags)
 		ev.msg.hdr.src = vmci_make_handle(VMCI_HYPERVISOR_CONTEXT_ID,
 						  VMCI_CONTEXT_RESOURCE_ID);
 		ev.msg.hdr.payload_size = sizeof(ev) - sizeof(ev.msg.hdr);
+		memset((char*)&ev + sizeof(ev.msg.hdr), 0,
+			ev.msg.hdr.payload_size);
 		ev.msg.event_data.event = VMCI_EVENT_CTX_REMOVED;
 		ev.payload.context_id = context_id;
 
-- 
2.43.0

