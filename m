Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45CC255E20
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052902; cv=none; b=FVgHxwO6j2pxY4nBKIPaLcOJqG74CD/sxXAvmlzjgPxkRxjn/q5XEfcXZgwoZ/A9woPCQS9mC1dJfu05yG+HSzWyWU7VKoOIjSLOZhYhhYMpOxP+BwlPGvGHogABJzqbLhfXmEKk91E42Hv+PUa6lRckneOR64GE2lUhhW1fLpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052902; c=relaxed/simple;
	bh=yT4dUDnDEljwx3nxHimD+1l/FV6doXKvygoiEyAsyhg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nMBLdvuqrYIaChYDw0TLThnpzdy13n1eWgwyu2SSbXG/q2XVK+zp4wUQ54h/Vf61oerdULdJPlFJ5nuK3P4QYxpQvUIfuy3EoVXX9dt1VQCcaOOStEDofF3gdmR2mP1d9OTaanXKpWWBCOoeX2ZcaFylTVlNRGzzz9i/adgE6Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m2qYeCVT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m2qYeCVT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CA70dX017020;
	Mon, 12 May 2025 12:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KiATnBDkzQgP+ok/RO99GD
	/TIhY6+aSoji/nAGfdW0s=; b=m2qYeCVTqY4QbRGhkwKyejcbqnbnAblQ/fm7F1
	n3He0hSTYdnuXkDPVJCZExVMcB1yDZwItr8RW0sS1+2gmmJLji1/TYsa9BOZOHS2
	YKdRO3ExoJmg7m7wGtGwXBUmNTDKCjv0gB93Nufam33iXXqVQoZsyHW3YiPMqdUA
	6qYq/TmQ3XtRj/0zGZswbRVWwMHd39awxuwHS/YtQ82bY+8IIIgIo0+NsSyHprY1
	+PSpgZgGbpY0L6pcIar5JoLrpp4I0DlU+wzOerSPr1H5J3fl3nLY+VhNqwVM6gZu
	flgWag4fiY699wluuZ+xbZt0AqYYYuTEs3vc2cCqzgyMCuKg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt94c79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 12:28:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54CCS7EI002326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 12:28:08 GMT
Received: from zhonhan-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 May 2025 05:28:05 -0700
From: Zhongqiu Han <quic_zhonhan@quicinc.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
        <rodrigo.vivi@intel.com>, <tursulin@ursulin.net>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <chris@chris-wilson.co.uk>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <quic_zhonhan@quicinc.com>
Subject: [PATCH] drm/i915/vlv: Remove redundant on_each_cpu() call in __vlv_punit_get()
Date: Mon, 12 May 2025 20:27:46 +0800
Message-ID: <20250512122746.546849-1-quic_zhonhan@quicinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEzMCBTYWx0ZWRfXy+7isObX5XXV
 7weKGvaUaH3m55fCd8z5sYugqYOtavk0lch4YTwSIoH7qydPutPmT5rG/kMu8zpDESKIXf/g6Ml
 UbRokmYhHZ3GkUaj9APuBXgvTWmNqG4guvgkPDnVNnicoFSRsr9mQiN7n4i5i5Xi0GvB9EVM3aT
 JrLOyfN3l1ho218LYD7R+6xrLVz2J5VTvNCcZx5FeqZgFaXWJsHEZ4Q0onD+VsPF7g8BeTPuwow
 6Gs9zRfm1hah1s9V2jVcjOxX1khXEFWnqXg2LbmgWZjZt4/1tAtCn8q+oj/1kVKXJiGoNdyHDlX
 BU+eBcPd2smK9l4iDj0rsfCf3dEjfa0TrUeLJBevj201m8QOsb9EWhR8R9VXKALH3V7LMH7d6dm
 6uQn7RiEFzOxBTS8zk5cnAJK2LxwtXl8ZBOSE7xqd9qP74/xO1NoPCqqHm3jf9cfunesz6hb
X-Proofpoint-ORIG-GUID: uYwJgK6L8LKx2-L5U-6AdSZH8FD8xn_C
X-Proofpoint-GUID: uYwJgK6L8LKx2-L5U-6AdSZH8FD8xn_C
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=6821e959 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=TEeMUJ-ctX1U_MdykegA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1011 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120130

The use of on_each_cpu() with a no-op callback in __vlv_punit_get() was a
conservative safeguard to ensure all CPUs were active before accessing the
sideband, as introduced in commit a75d035fedbd ("drm/i915: Disable
preemption and sleeping while using the punit sideband").

However, this wake-up operation is redundant. The preceding call to
cpu_latency_qos_update_request() already triggers cpu_latency_qos_apply(),
which internally invokes wake_up_all_idle_cpus(). This mechanism reliably
ensures that all CPUs exit idle states and are sufficiently active to
avoid the known hardware errata.

Removing the on_each_cpu() call and its empty callback eliminates
unnecessary inter-CPU SMP overhead and simplifies the code path.

Signed-off-by: Zhongqiu Han <quic_zhonhan@quicinc.com>
---
 drivers/gpu/drm/i915/vlv_sideband.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/vlv_sideband.c b/drivers/gpu/drm/i915/vlv_sideband.c
index 114ae8eb9cd5..d93b608c04e4 100644
--- a/drivers/gpu/drm/i915/vlv_sideband.c
+++ b/drivers/gpu/drm/i915/vlv_sideband.c
@@ -24,10 +24,6 @@
 /* Private register write, double-word addressing, non-posted */
 #define SB_CRWRDA_NP	0x07
 
-static void ping(void *info)
-{
-}
-
 static void __vlv_punit_get(struct drm_i915_private *i915)
 {
 	iosf_mbi_punit_acquire();
@@ -42,10 +38,8 @@ static void __vlv_punit_get(struct drm_i915_private *i915)
 	 * specific. Hence we presume the workaround needs only be applied
 	 * to the Valleyview P-unit and not all sideband communications.
 	 */
-	if (IS_VALLEYVIEW(i915)) {
+	if (IS_VALLEYVIEW(i915))
 		cpu_latency_qos_update_request(&i915->vlv_iosf_sb.qos, 0);
-		on_each_cpu(ping, NULL, 1);
-	}
 }
 
 static void __vlv_punit_put(struct drm_i915_private *i915)
-- 
2.43.0

