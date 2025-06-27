Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03613FF1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004968; cv=none; b=YSVy+50kyD/8sUXrJHxAROARKn864vfTHQVFHe2q3j0pFQ5vB7YSFUTD9s9TLPJO2gQIlXm3MvltASFVfN+xUSYKxiEX+a4nHRTBuUFAyb/gK3WctUjCn1SnupYcIJ7ks35WjSB4kUPTQ0XRikp1ititkClsSeTpmZn3OHwuKkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004968; c=relaxed/simple;
	bh=HMgiuxNFPXY0Ed4t9XqUkhavNKtLc9xVYkjMSGU90So=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QUUSm1q3nfUTvaAH01NFaj3TxzsgiXue8OgKggnOq2v4WNozTafaw7HydDHb/Wvty0eU0wuLlxibuMB50zAW9ZsKUMlb5JkB5+IWEX+iCNgbVvK31UihpsNOQnAR7ACPZnounqnhiO5nnCs8umh9ucZxYi7ris3Y68q8EXOF8Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R5P25p029051;
	Fri, 27 Jun 2025 05:52:22 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2pdqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 27 Jun 2025 05:52:21 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 26 Jun 2025 22:52:17 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 26 Jun 2025 22:52:14 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
CC: <arnd@arndb.de>, <bcm-kernel-feedback-list@broadcom.com>,
        <bryan-bt.tan@broadcom.com>, <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>,
        <vishnu.dasa@broadcom.com>
Subject: [PATCH] vmci: Prevent the dispatching of uninitialized payloads
Date: Fri, 27 Jun 2025 13:52:14 +0800
Message-ID: <20250627055214.2967129-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
References: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA0NCBTYWx0ZWRfX5u/RQ4wNdswJ 0VC/EkghGg4AdasmdEiR4Quy2aDKPZ1IJBOGNuybetPJ/qSjTjO9Nf8QjdD+UGgklKGgmne6vlr h5J3RvJTFZhyVx4azfThyCWNaEh1IWNsmj1/xKKffWDCeHOFFwABUrIriajUj62E1T8S2VH5fiM
 0bFMnuFIPrOIl/HTYCd+jMDyK0ZmPyy2ExTKpEWaSma3ZxH6i5gl5CDIxwZx37uoRyF8rI9n3BY CnsqicR/LCKfcB8d9zf2BoZ7o78bzMVNQHs/i/SfJ57ADp0fDc3khwx950XaAQBVbQLOjQCSrv6 LfsiH0VwbuiVXByxA/FJM+Y65PYlK+fkSacCglURj1dRnCMP2Pcd+YJpCsN4ZBbs8YE7oNRmL0f
 N2Sa1VlmMS+/TObNSt78F3sU+LE0x3Cnjw7HghQSuk4RmpnHFHv97tXEfAypcaCcQ9JwTDZh
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=685e3195 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8 a=ArJ3Pwma1Lyk2epKzdMA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: JfOxlT2R69Lj8sj9axYbrwHa5VuQQ7Ui
X-Proofpoint-GUID: JfOxlT2R69Lj8sj9axYbrwHa5VuQQ7Ui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506270044

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

Fixes: 28d6692cd8fb ("VMCI: context implementation.")
Reported-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
Tested-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
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
+		memset((char*)&ev.msg.hdr + sizeof(ev.msg.hdr), 0,
+			ev.msg.hdr.payload_size);
 		ev.msg.event_data.event = VMCI_EVENT_CTX_REMOVED;
 		ev.payload.context_id = context_id;
 
-- 
2.43.0

