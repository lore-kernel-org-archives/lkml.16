Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5E3233739
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547457; cv=none; b=S/xEmLCuoVtyosS8/56b76bA2lumcM1JSXm+X9oRLzPwm4L/pcTjRWOqQZNSVk9jOnJ5++34juhwwxPj3p8r62TQ5sq9BayE/sr6uqPkMtmo7lw3JJ0ygovhEVMLxI6bhsPQKLFSYze3lzz4E7JVL+aGtt4x/EfYZgOONUbmPJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547457; c=relaxed/simple;
	bh=rYiNxCsTsLC8LdWhR4Tg0TUwjjM8dk+IfY8gIp3cjOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ql7eZgV9jgGQRKxvQzK92jKZlKX16r+JjzLkZsAlIm4RpZNRC5KPVZ4vpNq+VTh3BJSLSB84mjMhsScsS2YYB0FRV07lFNdl+F9sdsRZr8ye7JGWfcWgOCKJPabggDXl+7t9f/OsL2LJn1uOidMNtLvPLYWLJz4rg/VM87n6PBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=IQVUre/C; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="IQVUre/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1746547411;
	bh=MIxVgUD/gcfzc+AvSnntXs5+xQ69OsezJ0OGOwzsfyo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=IQVUre/C6Wwu2covPWBLq1pMU6EK0B5V/xfCqkDckBmAqAQl8AWhZbWD4pgdHwwvL
	 ZANJ4YY/NJkgjIb+jc+4Sne6HelHtcw/o9A6cgMWJ/o+j4ej6uWrhqdjbZ+pewk31k
	 w3J08/NOQITlHyaHldm1AUupurDG+hs1xzHK0abA=
X-QQ-mid: zesmtpip3t1746547370tbb3ca5be
X-QQ-Originating-IP: o8pgAATOo7e4w+pMFoumg25Llhz0GOUtirb0feOXr+Y=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 May 2025 00:02:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15489425460272937920
EX-QQ-RecipientCnt: 10
From: WangYuli <wangyuli@uniontech.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	yuzhao@google.com,
	stevensd@chromium.org,
	kaleshsingh@google.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
Date: Wed,  7 May 2025 00:02:38 +0800
Message-ID: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Nco2gOFShP5nyEqgTp7q0Srkca5PBUpgKh4NtRRMPOwxhhomJoREKFn3
	wdg37EQt1XOAk2R/LolorTrAeC6okoZxFlSo8qLKtJIij7HwYCKdzlS9uplfQsxAZARdd5A
	L/0djvX9E0jFfic0/ApW9C4cHv1c0xJWxwHLLNNzpT+pLeA2A48iz6BptOmq65mG8iGmv35
	rB/IPVUPpp0nU/5w4kRJp2qmMyw95stNa3Nkb4Htubub43PoCAMUjGEg8aKuMinQ1sIPVe3
	M6qFGvaWZpCommkjHmHhLnQYYRF6/Kg9tCHJpzXWMyChFf85Ipfwi0MveNmZkf9Ti4L4ZBu
	XRqgEQWQfz4QIn0ZXrYJRAPbjAsYEhDMxGBU5uCtH0gHRSsop989yqTm2LLPg2a0aYTCsD2
	62jxPqVwpbkkpseE/uEQg824n9WLi7+T/Zyj8evHL9kYs1myJRNljh5yEKfy/Isfsu/WNYQ
	jTzdXC0Gqrcv5nADlbLagH+mliB66zHJhtkYFOUg301jW1gpOlRNB4ijKA/V6cCrf917jhm
	zf57kumzlrCwy18lQpziMFgidsQD4EiP7CuictxHn6+pin3zp2qe4mREXJddXwGVX5ehNDK
	nUX4zfyjHo98MADH6+BNWutS6pZOnEPAZAEQ6yLA7xaVYmGpUrCJqZ64xuTWS4lxOggz70f
	2DWekJTbodD/bDGecRPnYg6Pi2/6JNEVH4njMEULsPIgR6DLjT/mTVlFm57VQUB/30oxOVi
	wCF7At5JK4dadnIywLRbBt55Cerm6TkQL8hCMOzQolrR3pI6SxYsf71L5SCm/Wh7qVUVBPt
	nzMM4p5gGnh5y04K/QySN4zR2JmH2j0N0msmKf3AkoA7yuaRKPePiR0M+QETCH6269w7Gh9
	at8nRGuOxWqw6QrojO9K+GoP6214GF45x454aThf4IWqXMU8NaxHX3/hcspnBld3DioZji/
	FEYSfzSW+RVLiYBdNJcqx+gyER3qDTw/ri7q6PwVL/o+ZYVZbfSxYaAcPnQ5A9xjmpwiltu
	bpJX1mqgIvjwGtwR1O
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

To the compiler, (MAX_NR_TIERS - 1) (i.e., (4U - 1)) is unsigned,
whereas tier is a signed integer.

GCC 5.4 does not permit the minimum operation on such
type-inconsistent operands.

Cast it to a signed integer to circumvent this compiler error.

Fix follow error with gcc 5.4:
  mm/vmscan.c: In function ‘read_ctrl_pos’:
  mm/vmscan.c:3166:728: error: call to ‘__compiletime_assert_887’ declared with attribute error: min(tier, 4U - 1) signedness error

Fixes: 37a260870f2c ("mm/mglru: rework type selection")
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 3783e45bfc92..29dce1aed962 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3163,7 +3163,7 @@ static void read_ctrl_pos(struct lruvec *lruvec, int type, int tier, int gain,
 	pos->gain = gain;
 	pos->refaulted = pos->total = 0;
 
-	for (i = tier % MAX_NR_TIERS; i <= min(tier, MAX_NR_TIERS - 1); i++) {
+	for (i = tier % MAX_NR_TIERS; i <= min(tier, (int)(MAX_NR_TIERS - 1)); i++) {
 		pos->refaulted += lrugen->avg_refaulted[type][i] +
 				  atomic_long_read(&lrugen->refaulted[hist][type][i]);
 		pos->total += lrugen->avg_total[type][i] +
-- 
2.49.0

