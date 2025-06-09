Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD5013C918
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477879; cv=none; b=KHtt1gh8mdAB8D8eYeiqmRqN5CLDt3LE+kStDQtQPVhULMl5DFLSJgENFxWxBx8TeRz4nkKulNYeQpjUTI8I4NQu5HbFJ1gewAjJjZ3qmp0S8mV+MZfshBiRJYzCgAoB9W+xvfyvLn9MuEpiloaQ1QIFRY8k6ZkGrdPVcreDHvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477879; c=relaxed/simple;
	bh=YgvP4M9z3k/BXJcoTVitBlnV9YdvDu7j6ke1A3zrXVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=syCCAQtZJ7Ke1oDovhLhVYaHlAquk8YVFOh30a0pWQADq0HZEGMGl2335F5QS/LLglNE3wHfXRKBBzmHMno8DM8D5i9tXWGQ1pMmDBU05n1BgHcycEKA20xESdlba0S60MYnd2RovXenfOkcAasYaG4ZMAIebVYDyS6JFCvxSXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Sb+fEnVd; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Sb+fEnVd"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55996RWm031658;
	Mon, 9 Jun 2025 14:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=w91YJqRUeCne22dMl
	XunltlLMzFks6D3Wo0q7++GxmA=; b=Sb+fEnVdTCZpVo812bliFxJZxDVXYFvYS
	QCODoe0wvDcMSBslIRd+Vgf7I3RQtQuv5zBuMucbPkOVrIqGZbbbfMwzsrcCUhUB
	kalp+7jBWWqAvNHIPhHiU18acwb7KJ8SFtFwFbOaeH7jE44bWcnx++4lRwstgRqW
	r3EC6Mh7va7btx14r+FSqLEmLIRQIsus1j4fyClYq6Ief+UlmaMSXsKkNO+ktxhu
	aAIcsqCzJAIMdw2sgfhTm9xgek8DRANSNJn10289KWmV1DwMQ8hGM0hgVflFGFq2
	GSIkOt8VTeTQH/sxPpG8YdK6A+91J8DfBdYLs12qjEOOfbzA3rOEQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474x4kx4hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 14:04:05 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 559DxIIB015400;
	Mon, 9 Jun 2025 14:04:05 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474x4kx4hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 14:04:05 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 559BLv3A003371;
	Mon, 9 Jun 2025 14:04:04 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4751ykdss8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 14:04:04 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 559E40D946596418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Jun 2025 14:04:00 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2210D20043;
	Mon,  9 Jun 2025 14:04:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 468BA2004D;
	Mon,  9 Jun 2025 14:03:57 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Jun 2025 14:03:57 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: donettom@linux.ibm.com
Cc: Jonathan.Cameron@huawei.com, akpm@linux-foundation.org,
        alison.schofield@intel.com, dakr@kernel.org, dave.jiang@intel.com,
        david@redhat.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        nilay@linux.ibm.com, osalvador@suse.de, rafael@kernel.org,
        ritesh.list@gmail.com, rppt@kernel.org, yury.norov@gmail.com,
        ziy@nvidia.com
Subject: [Fixup PATCH] drivers/base/node: Restored the removed extra line
Date: Mon,  9 Jun 2025 09:03:54 -0500
Message-ID: <20250609140354.467908-1-donettom@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Y4X4sgeN c=1 sm=1 tr=0 ts=6846e9d5 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=7H9vA5QQWFz24hj3CacA:9
X-Proofpoint-GUID: 2eaR4vvhR2OwARGCBM4klXR7o4FJUpEl
X-Proofpoint-ORIG-GUID: pN7bQ2aj2OUbLITVeMJx7fOjXCbASb4r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwMSBTYWx0ZWRfX6JWqtE0ocMCx KmSiJ7AHwJxL2jGIH++Phlt073rh/Wy5CE+SFEJLY39smjZB81zPV8ovu5TkwijuVxR6/xXfTw/ sO8t7vcElY9yMXekKa8Y0DL0g/eo1hFSiOHP0Ensn1uO7y1rDdZZ9c7OkNT4qLB3OjGE4FfsevP
 ltxgBAvuJ6s9hirmFZL9/7ZipEZ0tUpacPVsK25zQyrk+5nHV6OzlAAE/Gj5mYnz6qOYpuPWkH0 gUJ5eZKl5IfgSxpWgsgzKrArG6zgjv4wp0YE42ZC9UYI6nCST/Owmgpu07pRThsUb6z6l+kzFOe ZTSqbCSDtUey6fxG16KK2e9q1/0oxOXFTzxRvAIaDtt2UoOosBunYboV/Vd0w+diwKOdw16hLg5
 dVLq+lpPsOW9g1Mo9S84VxSMdL5DPUV8SKNee+B26CofNfzVGPhYm8z3+sJrCLI5u1XpDBHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090101

Re-added the extra blank line at the end of the memory.h that was
removed by the commit
'commit d61861e3bb35 ("drivers/base/node: optimize memory block
registration to reduce boot time")'

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 include/linux/memory.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/memory.h b/include/linux/memory.h
index c39ad931713d..bd4440bc4a57 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -216,4 +216,5 @@ unsigned long memory_block_advised_max_size(void);
  * can sleep.
  */
 extern struct mutex text_mutex;
+
 #endif /* _LINUX_MEMORY_H_ */
-- 
2.43.5

