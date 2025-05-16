Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AAF1FECB1
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383958; cv=none; b=L/5JS29RFhqzOujyWzFgwqdcZpi+wmVYfo4UJNW6KmxpSJ2t2RkRPhOxlH6gW+DwWtFZN7SGADzZvC4qN7paqizxWepsIKKB/lI64t4a7BCCaetkU1VQ3kEVP8p3npP1efoMFKqhZdRpA6f/Iv5uhUQ4tPZxzvhZ323adabJy+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383958; c=relaxed/simple;
	bh=f4rF2p6vDDn9deOD2CBFm4gmqmPJqyLZliHBYAsZo6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EV8GKxCnr+S/sLDBvYspyXVcEVf65rwa5uNfn2Kk9DZ7EtZvjbt+c0Zp7FUEQvavAY+pJwYpp8zPZcgREfTwXK3TusBMCHqGaaVyil7aRGFF4iOXtLz/XyohDh5GCDsOdssWu5gbt4ODnhPONF/Q1mGGP0efWITqhWIb8Mlmepw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LQYJD0NE; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LQYJD0NE"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G5utB3014153;
	Fri, 16 May 2025 08:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6nbeIW
	fPgmSdzJgtHDSYDHI6Wi/sK9JWvegm6vZV/4I=; b=LQYJD0NEoOkuXwc+otQKF/
	0t0c5x0Q38bt5LlnryuaP1+TF0fYDW+MuyRD3p/1q5Cx2EEX7AYEvSaTKMPU2dEv
	zkvUvtpX7QJgaEAuMXoiPSa2ahz4yqwUMoUrSDzxacKAkLLzn9YVd9+/gFpVjJSw
	5xaG0GpUxW9M9ycklkEF/E28NnPX9/JCpB6aQ3emy/oejsUDVNaow/kixQLkaHlJ
	LdZ8eHC8n3iUwhCPF3ERyVruwX0lsOclKsV12gn9y0vZf2EGXnzLR04ure0e8Vnx
	FMc2qDI1+cegGx1C2yGCDvWG77wu7i3TMQH12fQxPESA+M9Hn1aKGNXml/YkcD0A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nhg34as3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:20:37 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54G8Hb4C032758;
	Fri, 16 May 2025 08:20:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nhg34as0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:20:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54G5hJOI021408;
	Fri, 16 May 2025 08:20:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfrxjts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:20:36 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54G8KYvd56099324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 08:20:34 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C5E0201EB;
	Fri, 16 May 2025 08:20:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCF4A201EC;
	Fri, 16 May 2025 08:20:31 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 May 2025 08:20:31 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v4 3/4] Remove register_memory_blocks_under_node() function call from register_one_node
Date: Fri, 16 May 2025 03:19:53 -0500
Message-ID: <e0ef6ae9348f46bcc135f0e6cb7663d763e40b72.1747376551.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Cf0I5Krl c=1 sm=1 tr=0 ts=6826f555 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=aznVoBAsOnskw8r2mgMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA3NSBTYWx0ZWRfXypFikYKBjWxu phxyK4pmimcXyJ0YuOIb1FNYwf6VzMrFB7YemVSo4Enm1TTVGM/1xgpvlL+7IYFrkAawnXyE4G6 cz91VsDldNh3YKFXWXgo48loqVuXqBZzNcqoHVZfjemo1ntunDnShFJ8QKSGjhS18TWHstxxfHo
 kw5AOlk8BbPCpZZsOyM0AU9OIHaUGLKY9l6HJn2bGyaW7hpNPphnMaLbhh4cTlO7xFot86wlQSY 28J06/+vbYVF7cuxb+Jbsx1CUAOk0tYY2evHGzurLAFsq1vYWy5Yo+qPkxr9aa9Jqd/ZfiG7tYt uamBJx8mOISWa3Fxx+HkqK8W7VdVeJhpl3Ats7O+nb71ZapLESTtgkIi7YyAjypjtAeKBFCq+PV
 OtW/kXENL/oIN21cuMc38pruyxvGa1pMMa6zXzUeurrCMCr1cyBB8S96fHTMJcn8FyoiE5jw
X-Proofpoint-GUID: aO0xNzaezBjp-tI_reYSbW-8nNA5qIDT
X-Proofpoint-ORIG-GUID: rBlDIF-PZ8Sp8UWD4TIDm2PPNl9IAB0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_03,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=913
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160075

register_one_node() is now only called via cpu_up() → __try_online_node()
during CPU hotplug operations to online a node. At this stage, the node has
not yet had any memory added. As a result, there are no memory blocks to
walk or register, so calling register_memory_blocks_under_node() is
unnecessary. Therefore, the call to register_memory_blocks_under_node()
has been removed from register_one_node().

Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---
v3->v4

Addressed Mike's comment by dropping the call to
register_memory_blocks_under_node() from register_one_node()

v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
 include/linux/node.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/node.h b/include/linux/node.h
index 806e62638cbe..8b8f96ca5b06 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -137,15 +137,9 @@ static inline int register_one_node(int nid)
 	int error = 0;
 
 	if (node_online(nid)) {
-		struct pglist_data *pgdat = NODE_DATA(nid);
-		unsigned long start_pfn = pgdat->node_start_pfn;
-		unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
-
 		error = __register_one_node(nid);
 		if (error)
 			return error;
-		register_memory_blocks_under_node(nid, start_pfn, end_pfn,
-						  MEMINIT_EARLY);
 	}
 
 	return error;
-- 
2.43.5

